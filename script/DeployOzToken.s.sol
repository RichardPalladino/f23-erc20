// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {OzToken} from "../src/OzToken.sol";

contract DeployOzToken is Script {

    function run() external returns(OzToken) {
        vm.startBroadcast();
        OzToken tmpOz = new OzToken(1000000 ether);
        vm.stopBroadcast();
        return tmpOz;
    }
}