// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    struct Item {
        uint id;
        string name;
        string status;
        address owner;
        string ipfsHash; // For storing metadata on IPFS
    }

    mapping(uint => Item) public items;
    uint public itemCount;

    event ItemCreated(uint id, string name, string status, address owner, string ipfsHash);
    event ItemStatusUpdated(uint id, string status);

    function createItem(string memory _name, string memory _status, string memory _ipfsHash) public {
        itemCount++;
        items[itemCount] = Item(itemCount, _name, _status, msg.sender, _ipfsHash);
        emit ItemCreated(itemCount, _name, _status, msg.sender, _ipfsHash);
    }

    function updateStatus(uint _id, string memory _status) public {
        require(msg.sender == items[_id].owner, "You are not the owner");
        items[_id].status = _status;
        emit ItemStatusUpdated(_id, _status);
    }
}
