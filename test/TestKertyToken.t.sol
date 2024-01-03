//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {KertyToken} from "../src/KertyToken.sol";

contract TestKertyToken is Test {
    
    KertyToken public kerty;
    DeployToken public deployer;


    address bob = makeAddr("Bob");
    address alice = makeAddr("alice");

    uint256 public constant INIT_BALANCE = 1 ether;

    function setUp() public {
        deployer = new DeployToken();
        kerty = deployer.run();

        vm.prank(msg.sender);
        kerty.transfer(bob, INIT_BALANCE);
    }

    function testBobBalance() public view{
        assert(INIT_BALANCE == kerty.balanceOf(bob));
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        //BOb lets bob to spend tokens on her behalf
        vm.prank(bob);
        kerty.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        kerty.transferFrom(bob, alice, transferAmount);

        assert(kerty.balanceOf(alice) == transferAmount);
        assert(kerty.balanceOf(bob) == INIT_BALANCE - transferAmount);

    }
}
