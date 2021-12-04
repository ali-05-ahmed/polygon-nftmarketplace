// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Collection is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint public MAX_SUPPLY;
    uint public constant PRICE = 0.01 ether;
    string public baseTokenURI; 
    address payable _owner;



    constructor( uint maxSupply,string memory baseURI, address owner, string memory _name, string memory _symbol) ERC721(_name, _symbol) {
     _owner = payable(owner);
     MAX_SUPPLY = maxSupply;
     setBaseURI(baseURI);
}


function _baseURI() internal 
                    view 
                    virtual 
                    override 
                    returns (string memory) {
     return baseTokenURI;
}
function setBaseURI(string memory _baseTokenURI) public onlyOwner {
     baseTokenURI = _baseTokenURI;
}

function mintNFTs(uint _count) public payable {
     uint totalMinted = _tokenIds.current();
     require(
       totalMinted + _count <= MAX_SUPPLY, "Not enough NFTs!"
     );
     require(
       msg.value >= PRICE * _count, 
       "Not enough ether to purchase NFTs."
     );
     for (uint i = 0; i < _count; i++) {
       uint newTokenID = _tokenIds.current();
      _safeMint(msg.sender, newTokenID);
      _tokenIds.increment();
     }
}

function withdraw() public payable onlyOwner {
     uint balance = address(this).balance;
     require(balance > 0, "No ether left to withdraw");
     (bool success, ) = (msg.sender).call{value: balance}("");
     require(success, "Transfer failed.");
}

}
