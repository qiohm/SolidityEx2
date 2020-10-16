// SPDX-License-Identifier: MIT                 r
pragma solidity >=0.6.0;

contract FirstToken {
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    receive() external payable {
        buyToken();
    }

    fallback() external payable {
        wallet.transfer(msg.value);
    }

    function buyToken() public payable{
        // buy a token
        if (msg.sender == 0xe6aE4206e75531736fDCdc5e7C8E394884D22277) {
             balances[msg.sender] += 10*(msg.value / 1 ether);
             wallet.transfer(msg.value);
        emit Purchase(msg.sender, 10*(msg.value / 1 ether));
        } else {
        balances[msg.sender] += 1*(msg.value / 1 ether);
             wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1*(msg.value / 1 ether));
        }
       
    }
}

//ad compte acheteur 0xe6aE4206e75531736fDCdc5e7C8E394884D22277

//ad sofiane 0x57D401B8502bC5CBBaAfD2564236dE4571165051