// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract Logger{
    uint public testNum;

    constructor(){
        testNum = 1478;
    }

    function getTestNum() external view virtual returns(uint){
        return testNum;
    }
}