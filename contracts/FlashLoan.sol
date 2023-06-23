//SPDX-Licence-Idntifier: MIT
pragma solidity ^0.8.10;

import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashLoan is FlashLoanSimpleReceiverBase {

    event log(address asset, uint265 val);

    constructor(IPoolAddressProvider provider)
        FlashLoanSimpleReceiverBase(provider)
    {}

    function createFlashLoan(address asset, uint256 amount) external {
        address receiver = address(this);
        bytes memory params = "";
        uint256 referralCode = 0;

        POOL.flashLoanSimple(receiver, asset, amount, params, referralCode);
    }
}