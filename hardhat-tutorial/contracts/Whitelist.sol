// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Whitelist{
    // 白名单上限数量
    uint8 public maxWhitelistedAddresses;
    // 设置白名单映射
    mapping(address => bool) public whitelistedAddresses;
    // 白名单现有个数
    uint8 public numAddressesWhitelisted;
    // 设置白名单数量上限
    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}