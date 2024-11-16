contract address: 0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8

```sh
➜➜  riddle_game_contract git:(main) ✗ forge script --account Dylan_5900 --rpc-url https://sepolia.base.org script/DeployRiddleGame.s.sol --broadcast -vvvv
[⠢] Compiling...
[⠒] Compiling 2 files with Solc 0.8.26
[⠢] Solc 0.8.26 finished in 1.85s
Compiler run successful!
Enter keystore password:
Traces:
  [726473] DeployRiddleGame::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← [Return] 
    ├─ [687123] → new RiddleGame@0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8
    │   └─ ← [Return] 3100 bytes of code
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return] 
    ├─ [0] console::log("implementation_RiddleGame_contract address: ", RiddleGame: [0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8]) [staticcall]
    │   └─ ← [Stop] 
    └─ ← [Stop] 


Script ran successfully.

== Logs ==
  implementation_RiddleGame_contract address:  0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8

## Setting up 1 EVM.
==========================
Simulated On-chain Traces:

  [687123] → new RiddleGame@0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8
    └─ ← [Return] 3100 bytes of code


==========================

Chain 84532

Estimated gas price: 0.000550518 gwei

Estimated total gas used for script: 1027809

Estimated amount required: 0.000000565827355062 ETH

==========================

##### base-sepolia
✅  [Success]Hash: 0xaf5c906ad87c1bb61122535888f2c69713be036d4612bbeb3c080be694c58616
Contract Address: 0x0e7dD54d233360c4ccCD464e0F3B3ef5B49ecbd8
Block: 18000192
Paid: 0.000000079287524193 ETH (790827 gas * 0.000100259 gwei)

✅ Sequence #1 on base-sepolia | Total Paid: 0.000000079287524193 ETH (790827 gas * avg 0.000100259 gwei)
                                                                                                                                              

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
```