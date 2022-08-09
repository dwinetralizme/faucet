// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./Logger.sol";

contract Faucet is Owned, Logger{
    
    mapping(address=>bool) public funders;
    mapping(uint=>address) public lutFunders; // lut = look up table
    uint public numOfFunders;

    receive() external payable{}

    modifier limitWithdraw(uint _amount){
        require(_amount <= 1000000000000000000, "Cannot withdraw more than 1 ether");
        _;
    }

    function getTestNum() external view override returns(uint){
        return testNum;
    }

    function testOnlyOwner()external onlyOwner{

    }

    function addFunds()external payable{
        address funder = msg.sender;
        if(!funders[funder]){
            uint index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdraw(uint _amount)external limitWithdraw(_amount){
        payable(msg.sender).transfer(_amount);
    }

    function getAllFunders()public view returns(address[] memory){
        address[] memory _funder = new address[](numOfFunders);

        for(uint i=0; i<numOfFunders; i++){
            _funder[i] = lutFunders[i];
        }

        return _funder;
    }

    function getFunderByIndex(uint8 _index) external view returns(address){
        address[] memory funderAddress = getAllFunders();

        return funderAddress[_index];
    }


}