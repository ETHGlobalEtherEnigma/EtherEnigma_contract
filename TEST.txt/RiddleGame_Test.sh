Compiling 1 files with Solc 0.8.26
Solc 0.8.26 finished in 2.35s
Compiler run successful!

Ran 7 tests for test/RiddleGame.t.sol:RiddleGame_Test
[PASS] testAgentSetRiddle() (gas: 101656)
Traces:
  [101656] RiddleGame_Test::testAgentSetRiddle()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [24438] RiddleGame::setRiddle(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   ├─ emit RiddleSet(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], answerHash: 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   └─ ← [Stop] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd, 1, true
    ├─ [0] VM::assertTrue(true) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd, 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testInitialState() (gas: 30705)
Traces:
  [30705] RiddleGame_Test::testInitialState()
    ├─ [2448] RiddleGame::owner() [staticcall]
    │   └─ ← [Return] RiddleGame_Test: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]
    ├─ [0] VM::assertEq(RiddleGame_Test: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], RiddleGame_Test: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496]) [staticcall]
    │   └─ ← [Return] 
    ├─ [2447] RiddleGame::agent() [staticcall]
    │   └─ ← [Return] 0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260]
    ├─ [0] VM::assertEq(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260], 0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260]) [staticcall]
    │   └─ ← [Return] 
    ├─ [2362] RiddleGame::stakeAmount() [staticcall]
    │   └─ ← [Return] 100000000000000000 [1e17]
    ├─ [0] VM::assertEq(100000000000000000 [1e17], 100000000000000000 [1e17]) [staticcall]
    │   └─ ← [Return] 
    ├─ [2398] RiddleGame::gameActive() [staticcall]
    │   └─ ← [Return] true
    ├─ [0] VM::assertEq(true, true) [staticcall]
    │   └─ ← [Return] 
    ├─ [283] RiddleGame::getPrizePool() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18]) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testMultiplePlayers() (gas: 241072)
Traces:
  [245285] RiddleGame_Test::testMultiplePlayers()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f])
    │   └─ ← [Return] 
    ├─ [48421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f])
    │   └─ ← [Stop] 
    ├─ [283] RiddleGame::getPrizePool() [staticcall]
    │   └─ ← [Return] 1200000000000000000 [1.2e18]
    ├─ [0] VM::assertEq(1200000000000000000 [1.2e18], 1200000000000000000 [1.2e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [24438] RiddleGame::setRiddle(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   ├─ emit RiddleSet(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], answerHash: 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [22438] RiddleGame::setRiddle(0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f], 0x3f631d566f4db432ca320a6932a0a30ed043d45d49871ce3d6daa3d8ea615ee4)
    │   ├─ emit RiddleSet(player: 0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f], answerHash: 0x3f631d566f4db432ca320a6932a0a30ed043d45d49871ce3d6daa3d8ea615ee4)
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [11086] RiddleGame::submitAnswer("water")
    │   ├─ [0] 0x2::fallback{value: 600000000000000000}()
    │   │   └─ ← [Stop] 
    │   ├─ emit GameEnded(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], playerWon: true, prizeAmount: 600000000000000000 [6e17])
    │   └─ ← [Stop] 
    ├─ [0] VM::assertEq(5500000000000000000 [5.5e18], 5500000000000000000 [5.5e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(600000000000000000 [6e17], 600000000000000000 [6e17]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f])
    │   └─ ← [Return] 
    ├─ [4076] RiddleGame::submitAnswer("earth")
    │   ├─ emit GameEnded(player: 0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f], playerWon: false, prizeAmount: 0)
    │   └─ ← [Stop] 
    ├─ [0] VM::assertEq(4900000000000000000 [4.9e18], 4900000000000000000 [4.9e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(600000000000000000 [6e17], 600000000000000000 [6e17]) [staticcall]
    │   └─ ← [Return] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    ├─ [818] RiddleGame::playerInfo(0x3: [0x437Ef29Be6b809a25275b508294ceaC59FB6278f]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(0x4: [0x71a251Be57efD33001ce6F731757402c77256902])
    │   └─ ← [Return] 
    ├─ [48421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x4: [0x71a251Be57efD33001ce6F731757402c77256902])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [22438] RiddleGame::setRiddle(0x4: [0x71a251Be57efD33001ce6F731757402c77256902], 0x0b6317174da3205d83aaa937a4d5f90a95530385dee2fc287552dc965299fa12)
    │   ├─ emit RiddleSet(player: 0x4: [0x71a251Be57efD33001ce6F731757402c77256902], answerHash: 0x0b6317174da3205d83aaa937a4d5f90a95530385dee2fc287552dc965299fa12)
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x4: [0x71a251Be57efD33001ce6F731757402c77256902])
    │   └─ ← [Return] 
    ├─ [11086] RiddleGame::submitAnswer("Echo")
    │   ├─ [0] 0x4::fallback{value: 350000000000000000}()
    │   │   └─ ← [Stop] 
    │   ├─ emit GameEnded(player: 0x4: [0x71a251Be57efD33001ce6F731757402c77256902], playerWon: true, prizeAmount: 350000000000000000 [3.5e17])
    │   └─ ← [Stop] 
    ├─ [0] VM::assertEq(5250000000000000000 [5.25e18], 5250000000000000000 [5.25e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [818] RiddleGame::playerInfo(0x4: [0x71a251Be57efD33001ce6F731757402c77256902]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testPlayerStartGame() (gas: 77865)
Traces:
  [77865] RiddleGame_Test::testPlayerStartGame()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 1, true
    ├─ [0] VM::assertTrue(true) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(0x0000000000000000000000000000000000000000000000000000000000000000, 0x0000000000000000000000000000000000000000000000000000000000000000) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1, 1) [staticcall]
    │   └─ ← [Return] 
    ├─ [283] RiddleGame::getPrizePool() [staticcall]
    │   └─ ← [Return] 1100000000000000000 [1.1e18]
    ├─ [0] VM::assertEq(1100000000000000000 [1.1e18], 1100000000000000000 [1.1e18]) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testPlayerSubmitCorrectAnswer() (gas: 87956)
Traces:
  [92169] RiddleGame_Test::testPlayerSubmitCorrectAnswer()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [24438] RiddleGame::setRiddle(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   ├─ emit RiddleSet(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], answerHash: 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [11086] RiddleGame::submitAnswer("water")
    │   ├─ [0] 0x2::fallback{value: 550000000000000000}()
    │   │   └─ ← [Stop] 
    │   ├─ emit GameEnded(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], playerWon: true, prizeAmount: 550000000000000000 [5.5e17])
    │   └─ ← [Stop] 
    ├─ [0] VM::assertEq(5450000000000000000 [5.45e18], 5450000000000000000 [5.45e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(550000000000000000 [5.5e17], 550000000000000000 [5.5e17]) [staticcall]
    │   └─ ← [Return] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testPlayerSubmitWrongAnswer() (gas: 82209)
Traces:
  [86422] RiddleGame_Test::testPlayerSubmitWrongAnswer()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [24438] RiddleGame::setRiddle(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   ├─ emit RiddleSet(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], answerHash: 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [4076] RiddleGame::submitAnswer("fire")
    │   ├─ emit GameEnded(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], playerWon: false, prizeAmount: 0)
    │   └─ ← [Stop] 
    ├─ [0] VM::assertEq(4900000000000000000 [4.9e18], 4900000000000000000 [4.9e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1100000000000000000 [1.1e18], 1100000000000000000 [1.1e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

[PASS] testPlayerTimeout() (gas: 82782)
Traces:
  [86995] RiddleGame_Test::testPlayerTimeout()
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [52421] RiddleGame::startGame{value: 100000000000000000}()
    │   ├─ emit GameStarted(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Stop] 
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [24438] RiddleGame::setRiddle(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   ├─ emit RiddleSet(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], answerHash: 0x7464bd924e765ce487910dde7cf78faee47c96a6328f88a0cd374cd7c2491abd)
    │   └─ ← [Stop] 
    ├─ [0] VM::warp(361)
    │   └─ ← [Return] 
    ├─ [0] VM::prank(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   └─ ← [Return] 
    ├─ [0] VM::expectRevert(Time limit exceeded)
    │   └─ ← [Return] 
    ├─ [1279] RiddleGame::submitAnswer("water")
    │   └─ ← [Revert] revert: Time limit exceeded
    ├─ [0] VM::prank(0x1: [0xaD9E68D1AdB84e81CF73AC230eb9B90554cf6260])
    │   └─ ← [Return] 
    ├─ [3275] RiddleGame::endGame(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D])
    │   ├─ emit GameEnded(player: 0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D], playerWon: false, prizeAmount: 0)
    │   └─ ← [Stop] 
    ├─ [818] RiddleGame::playerInfo(0x2: [0x654A21f366eB878cab6981Dfef32c8a263F7539D]) [staticcall]
    │   └─ ← [Return] 0x0000000000000000000000000000000000000000000000000000000000000000, 0, false
    ├─ [0] VM::assertFalse(false) [staticcall]
    │   └─ ← [Return] 
    └─ ← [Stop] 

Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 16.96ms (15.77ms CPU time)

Ran 1 test suite in 3.11s (16.96ms CPU time): 7 tests passed, 0 failed, 0 skipped (7 total tests)
