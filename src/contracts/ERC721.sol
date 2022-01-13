// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
building the minting function:
a. nft to point to an address
b. keep track of the token ids
c. keep track of token owner addresses to token ids
d. keep track of how many tokens an owner address has
e. create an event that emits a transfer log - contract address, 
    Where it is being minted to, _id.. 
*/


contract ERC721 {
    // creates a log of minting tokens
    event Transfer(
    address from,
    address to, 
    uint256 tokenId); 

    // mapping in solidity create a hash table of keypair value 
    mapping(uint256 => address) private _tokenOwner;

    // mapping from owner to number of owned tokens
    mapping(address => uint256) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns(bool){
        // setting the address of the nft ownert to check mapping
        // of the address from tokenOwner at the tokenId
        address owner = _tokenOwner[tokenId];
        // returns owner with a valid address that's not zero
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        // requires that the address isn't zero
        require(to != address(0), 'ERC721: minting to the zero address');
        // requires that the token doesn't already exist
        require(!_exists(tokenId), 'ERC721: Token aleady minted');
        // adding a new address with a token id for minting
        _tokenOwner[tokenId] = to;
        // mapping address of the tokenCount on with each address minting + 1 to the count.
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

}