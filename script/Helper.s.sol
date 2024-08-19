// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";

contract Helper is Script {
    struct Config {
        address nftAddress;
        address challengeAddress;
    }

    constructor() {}

    function getAnvilConfig() internal pure returns (Config memory) {
        // TODO
        return Config({nftAddress: address(0x1), challengeAddress: address(0x1)});
    }

    function getSepoliaConfig() internal pure returns (Config memory) {
        return Config({
            nftAddress: 0x76B50696B8EFFCA6Ee6Da7F6471110F334536321,
            challengeAddress: 0x33e1fD270599188BB1489a169dF1f0be08b83509
        });
    }

    function getConfig() external view returns (Config memory) {
        if (block.chainid == 31337) {
            return getAnvilConfig();
        }

        return getSepoliaConfig();
    }
}
