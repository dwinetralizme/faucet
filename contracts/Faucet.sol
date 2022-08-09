// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet{
    receive() external payable{}
    address[] public Funders;

    function addFunds()external payable{
        Funders.push(msg.sender);
    }

    function getAllFunders()public view returns(address[] memory){
        return Funders;
    }

    function getFunderByIndex(uint _index) external view returns(address){
        address[] memory funderAddress = getAllFunders();

        return funderAddress[_index];
    }


}