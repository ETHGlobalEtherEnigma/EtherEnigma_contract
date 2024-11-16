// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// src/RiddleGame.sol

contract RiddleGame {
    address public owner;
    address public agent;
    uint256 public stakeAmount;
    bool public gameActive;

    struct PlayerGame {
        bytes32 answerHash;
        uint256 startTime;
        bool isPlaying;
    }

    mapping(address => PlayerGame) public playerInfo;

    constructor(uint256 _stakeAmount) payable {
        owner = msg.sender;
        stakeAmount = _stakeAmount;
        gameActive = true;
    }

    event GameStarted(address indexed player);
    event RiddleSet(address indexed player, bytes32 answerHash);
    event GameEnded(address indexed player, bool playerWon, uint256 prizeAmount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyAgent() {
        require(msg.sender == agent, "Only agent can call this function");
        _;
    }

    modifier gameIsActive() {
        require(gameActive, "Game is not active");
        _;
    }

    // Receive ETH to increase the prize pool
    receive() external payable {
        // Accept ETH sent directly to the contract
    }

    fallback() external payable {
        // Accept ETH sent directly to the contract
    }

    function setAgent(address _agent) external onlyOwner {
        agent = _agent;
    }

    function startGame() external payable gameIsActive {
        require(msg.value >= stakeAmount, "Invalid stake amount");
        require(!playerInfo[msg.sender].isPlaying, "You are already in a game");

        playerInfo[msg.sender] = PlayerGame({
            answerHash: bytes32(0),
            startTime: block.timestamp,
            isPlaying: true
        });

        emit GameStarted(msg.sender);
    }

    // Agent sets the riddle and the answer hash for the player
    function setRiddle(address _player, bytes32 _answerHash) external onlyAgent gameIsActive {
        PlayerGame storage game = playerInfo[_player];
        require(game.isPlaying, "Player is not in a game");
        require(game.answerHash == bytes32(0), "Riddle already set for this player");

        game.answerHash = _answerHash;

        emit RiddleSet(_player, _answerHash);
    }

    function submitAnswer(string memory _answer) external gameIsActive {
        PlayerGame storage game = playerInfo[msg.sender];
        require(game.isPlaying, "You are not in a game");
        require(game.answerHash != bytes32(0), "Riddle not set yet");
        // Check time limit
        require(block.timestamp <= game.startTime + 5 minutes, "Time limit exceeded");

        bytes32 submittedHash = keccak256(abi.encodePacked(_answer));
        bool isCorrect = (submittedHash == game.answerHash);
        game.isPlaying = false;
        delete playerInfo[msg.sender];

        if (isCorrect) {
            uint256 contractBalance = address(this).balance;
            uint256 prize = contractBalance / 2;

            // Transfer prize to the player
            (bool success, ) = msg.sender.call{value: prize}("");
            require(success, "Transfer failed.");

            emit GameEnded(msg.sender, true, prize);
        } else {
            // Prize pool remains the same, funds stay in the contract
            emit GameEnded(msg.sender, false, 0);
        }
    }

    // Agent can end the player's game (e.g., if the player did not submit an answer in time)
    function endGame(address _player) external onlyAgent gameIsActive {
        PlayerGame storage game = playerInfo[_player];
        require(game.isPlaying, "Player is not in a game");
        game.isPlaying = false;
        // Clear the player's game state
        delete playerInfo[_player];

        // Player did not submit an answer in time, prize pool remains unchanged
        emit GameEnded(_player, false, 0);
    }

    // Contract owner can pause or activate the game
    function setGameActive(bool _active) external onlyOwner {
        gameActive = _active;
    }

    // Query the contract's balance (prize pool)
    function getPrizePool() external view returns (uint256) {
        return address(this).balance;
    }
}
