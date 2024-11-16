
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../src/RiddleGame.sol";
import "forge-std/Script.sol";

contract DeployRiddleGame is Script {
    function run() public {
        vm.startBroadcast();
        RiddleGame implementation_RiddleGame_contract = new RiddleGame{value: 0.01 ether}(0.001 ether);

        vm.stopBroadcast();

        console.log("implementation_RiddleGame_contract address: ", address(implementation_RiddleGame_contract));
    }
}