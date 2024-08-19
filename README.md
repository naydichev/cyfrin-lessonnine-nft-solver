## SolveNft for Foundry LessonNine Course

I didn't want to try guessing a bunch of numbers, so I wrote a contract to solve the problem - and then it will get the nft and I can transfer it to myself.

### Usage

Use whatever tool you want to deploy and verify the contract (I used foundry).

Use whatever tool you want to call `solveNft`, passing in your `twitterHandle` as the calldata.

Once the call to `solveNft` is done, get the token id of the newly minted token.

Call `transferNft` with the `tokenId`, and then rejoice!

### Via Etherscan

In etherscan, you can use the `write contract` sub-tab on the `contracts` tab to call the functions.

After the call to `solveNft`, you should see an entry in the `NFT Transfers` tab, and you'll see a section called `ERC-721 Tokens Transferred` which will contain the name, and id of the token (the id is in brackets). Use that number in the call to `transferNft`.

## Notes

I haven't tested calling this contract twice - I believe it only works the first time, as the underlying NFT contract does a check to see if you've solved this challenge before.


## TODO

Download the source of the challenge and nft contracts and mock them out to test locally.
