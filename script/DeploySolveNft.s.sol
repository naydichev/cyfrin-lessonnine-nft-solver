// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {Helper} from "script/Helper.s.sol";
import {SolveNft} from "src/SolveNft.sol";

contract DeploySolveNft is Script {
    function run() public returns (SolveNft) {
        Helper helper = new Helper();
        Helper.Config memory config = helper.getConfig();

        vm.startBroadcast();
        SolveNft solveNft = new SolveNft(config.challengeAddress, config.nftAddress);
        vm.stopBroadcast();

        return solveNft;
    }
}
