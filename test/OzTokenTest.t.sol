// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OzToken} from "../src/OzToken.sol";
import {DeployOzToken} from "../script/DeployOzToken.s.sol";

contract OzTokenTest is Test {
    OzToken public ozToken;
    DeployOzToken public deployer;

    uint256 public constant START_BAL = 100 ether;

    address public alice = makeAddr("alice");
    address public bob = makeAddr("bob");

    function setUp() public  {
        deployer = new DeployOzToken();
        ozToken = deployer.run();

        vm.prank(msg.sender);
        ozToken.transfer(alice, START_BAL);
    }

    function testAliceStartBalance() public {
        assertEq(ozToken.balanceOf(alice), START_BAL);
    }

    function testAllowances() public {
        assertEq(ozToken.allowance(alice, bob), 0);
        vm.prank(alice);
        ozToken.approve(bob, 100 ether);
        assertEq(ozToken.allowance(alice, bob), 100 ether);
        vm.prank(bob);
        ozToken.transferFrom(alice, bob, 100 ether);
        assertEq(ozToken.allowance(alice, bob), 0);
    }
}