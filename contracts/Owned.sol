// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Owned{
    address public owner;

    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner Can Access this function");
        _;
    }

    constructor(){
        owner = msg.sender;
    }
}