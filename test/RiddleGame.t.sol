// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {RiddleGame} from "../src/RiddleGame.sol";

contract RiddleGame_Test is Test {
    RiddleGame public game;

    address public owner;
    address public agent;
    address public player1;
    address public player2;
    address public player3;

    uint256 initialPrize = 1 ether;
    uint256 stakeAmount = 0.1 ether;

    function setUp() public {
        owner = address(this);
        agent = makeAddr("0x1");
        player1 = makeAddr("0x2");
        player2 = makeAddr("0x3");
        player3 = makeAddr("0x4");

        vm.deal(owner, 10 ether);
        vm.prank(owner);
        game = new RiddleGame{value: initialPrize}(stakeAmount);

        // set agent
        vm.prank(owner);
        game.setAgent(agent);

        // Allocate funds to agents and players
        vm.deal(agent, 5 ether);
        vm.deal(player1, 5 ether);
        vm.deal(player2, 5 ether);
        vm.deal(player3, 5 ether);
    }

    // Test the initial state of the contract
    function testInitialState() public view {
        assertEq(game.owner(), owner);
        assertEq(game.agent(), agent);
        assertEq(game.stakeAmount(), stakeAmount);
        assertEq(game.gameActive(), true);
        assertEq(game.getPrizePool(), initialPrize);
    }

    // Test player launches the game
    function testPlayerStartGame() public {
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        (bytes32 answerHash, uint256 startTime, bool isPlaying) = game.playerInfo(player1);
        assertTrue(isPlaying);
        assertEq(answerHash, bytes32(0));
        assertEq(startTime, block.timestamp);

        // check for bonus pool increases
        uint256 expectedPrizePool = initialPrize + stakeAmount;
        assertEq(game.getPrizePool(), expectedPrizePool);
    }

    // test agent sets the riddle
    function testAgentSetRiddle() public {
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        bytes32 answerHash = keccak256(abi.encodePacked("water"));

        // agent sets the riddle
        vm.prank(agent);
        game.setRiddle(player1, answerHash);

        (bytes32 playerAnswerHash, , bool isPlaying) = game.playerInfo(player1);
        assertTrue(isPlaying);
        assertEq(playerAnswerHash, answerHash);
    }

    // Test if the player answers correctly
    function testPlayerSubmitCorrectAnswer() public {
        // player starts the game
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        // agent sets the riddle
        bytes32 answerHash = keccak256(abi.encodePacked("water"));
        vm.prank(agent);
        game.setRiddle(player1, answerHash);

        // Record the initial balance of players and contracts
        uint256 playerBalanceBefore = player1.balance;
        uint256 contractBalanceBefore = address(game).balance;
        // console.log("Contract balance before: ", contractBalanceBefore);
        // console.log("Player balance before: ", playerBalanceBefore);

        // player submits the correct answer
        vm.prank(player1);
        game.submitAnswer("water");

        // Check if the player has won the prize
        uint256 prize = contractBalanceBefore / 2;
        uint256 playerBalanceAfter = player1.balance;
        assertEq(playerBalanceAfter, playerBalanceBefore + prize);

        // check the contract balance
        uint256 contractBalanceAfter = address(game).balance;
        assertEq(contractBalanceAfter, contractBalanceBefore - prize);
        // console.log("Contract balance after: ", contractBalanceAfter);
        // console.log("Player balance after: ", playerBalanceAfter);

        // Check the game status has been cleared
        (, , bool isPlaying) = game.playerInfo(player1);
        assertFalse(isPlaying);
    }

    // Test if the player answers incorrectly
    function testPlayerSubmitWrongAnswer() public {
        // player starts the game
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        bytes32 answerHash = keccak256(abi.encodePacked("water"));

        // agent sets the riddle
        vm.prank(agent);
        game.setRiddle(player1, answerHash);

        // Record the initial balance of players and contracts
        uint256 playerBalanceBefore = player1.balance;
        uint256 contractBalanceBefore = address(game).balance;

        // player submits the wrong answer
        vm.prank(player1);
        game.submitAnswer("fire");

        // check the player balance
        uint256 playerBalanceAfter = player1.balance;
        assertEq(playerBalanceAfter, playerBalanceBefore);

        // check the contract balance
        uint256 contractBalanceAfter = address(game).balance;
        assertEq(contractBalanceAfter, contractBalanceBefore);

        // Check the game status has been cleared
        (, , bool isPlaying) = game.playerInfo(player1);
        assertFalse(isPlaying);
    }

    // The case where the test timed out and did not submit an answer
    function testPlayerTimeout() public {
        // player starts the game
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        bytes32 answerHash = keccak256(abi.encodePacked("water"));

        // agent sets the riddle
        vm.prank(agent);
        game.setRiddle(player1, answerHash);

        // 6 minutes forward
        vm.warp(block.timestamp + 6 minutes);

        // The player attempts to submit an answer, but fails
        vm.prank(player1);
        vm.expectRevert("Time limit exceeded");
        game.submitAnswer("water");

        // Agent end game
        vm.prank(agent);
        game.endGame(player1);

        // Check the game status has been cleared
        (, , bool isPlaying) = game.playerInfo(player1);
        assertFalse(isPlaying);
    }

    // Test multiple players participating in the game
    function testMultiplePlayers() public {
        // player1 starts the game
        vm.prank(player1);
        game.startGame{value: stakeAmount}();

        // player2 starts the game
        vm.prank(player2);
        game.startGame{value: stakeAmount}();

        // Check for bonus pool increases
        uint256 expectedPrizePool = initialPrize + 2 * stakeAmount;
        assertEq(game.getPrizePool(), expectedPrizePool);

        // agent sets the riddle for player1
        bytes32 answerHash1 = keccak256(abi.encodePacked("water"));
        vm.prank(agent);
        game.setRiddle(player1, answerHash1);

        // agent sets the riddle for player2
        bytes32 answerHash2 = keccak256(abi.encodePacked("fire"));
        vm.prank(agent);
        game.setRiddle(player2, answerHash2);

        // player1 submits the correct answer
        vm.prank(player1);
        game.submitAnswer("water");

        // Check if player 1's balance has increased
        uint256 prize = expectedPrizePool / 2;
        uint256 player1BalanceAfter = player1.balance;
        assertEq(player1BalanceAfter, 5 ether - stakeAmount + prize);

        // Check the remaining contract balance
        uint256 contractBalanceAfter = address(game).balance;
        assertEq(contractBalanceAfter, expectedPrizePool - prize);

        // 玩家2提交错误答案
        vm.prank(player2);
        game.submitAnswer("earth");

        // 检查玩家2的余额未变
        uint256 player2BalanceAfter = player2.balance;
        assertEq(player2BalanceAfter, 5 ether - stakeAmount);

        // 检查合约余额未变
        assertEq(address(game).balance, contractBalanceAfter);

        // 检查游戏状态已被清除
        (, , bool isPlaying1) = game.playerInfo(player1);
        assertFalse(isPlaying1);
        (, , bool isPlaying2) = game.playerInfo(player2);
        assertFalse(isPlaying2);

        // player3 starts the game
        vm.prank(player3);
        game.startGame{value: stakeAmount}();

        // agent sets the riddle for player3
        bytes32 answerHash3 = keccak256(abi.encodePacked("Echo"));
        // console.logBytes32(answerHash3);
        vm.prank(agent);
        game.setRiddle(player3, answerHash3);

        uint256 prize2 = address(game).balance / 2;

        // player3 submits the correct answer
        vm.prank(player3);
        game.submitAnswer("Echo");

        // Check if player 3's balance has increased
        uint256 player3BalanceAfter = player3.balance;
        assertEq(player3BalanceAfter, 5 ether - stakeAmount + prize2);

        (, , bool isPlaying3) = game.playerInfo(player3);
        assertFalse(isPlaying3);
    }
}
