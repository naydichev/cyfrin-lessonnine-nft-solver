// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

interface Challenge {
    function solveChallenge(uint256 randomGuess, string memory yourTwitterHandle) external;
}

interface Nft {
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract SolveNft {
    Nft private immutable i_nft;
    Challenge private immutable i_challenge;

    constructor(address challenge_address, address nft_address) {
        i_challenge = Challenge(challenge_address);
        i_nft = Nft(nft_address);
    }

    function solveNft(string calldata twitterHandle) public {
        uint256 solution =
            uint256(keccak256(abi.encodePacked(address(this), block.prevrandao, block.timestamp))) % 100000;

        i_challenge.solveChallenge(solution, twitterHandle);
    }

    function transferNft(uint256 tokenId) public {
        i_nft.transferFrom(address(this), msg.sender, tokenId);
    }

    function onERC721Received(address, address, uint256, bytes memory) external view returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}
