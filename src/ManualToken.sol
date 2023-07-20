// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToekn {

    mapping(address => uint256) private s_balances;
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 1000000 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function symbol() public pure returns (string memory) {
        return "MNUL";
    }

    function balanceOf(address _holder) public view returns (uint256) {
        return s_balances[_holder];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(s_balances[msg.sender] >= _value, "INSF BAL");
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        return true;
    }
}