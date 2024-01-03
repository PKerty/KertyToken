//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract ManualKertyToken {

    mapping(address => uint256) s_balances;

    string public constant name = "Kerty Token";

    function totalSupply() public pure returns(uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(previousBalance == s_balances[msg.sender] + s_balances[_to]);
        return true;
    }
    /*
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
    function approve(address _spender, uint256 _value) public returns (bool success)
    function allowance(address _owner, address _spender) public view returns (uint256 remaining)
    */
}
