//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {KertyToken} from "../src/KertyToken.sol";

contract DeployToken is Script {

    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(KertyToken kerty){
        vm.startBroadcast();
        kerty = new KertyToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}
