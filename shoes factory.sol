// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShoesFactoryManagement {
    address public owner;

    enum ProductionStatus { Pending, InProgress, Completed }

    struct ShoeModel {
        string name;
        uint256 productionCost;
        ProductionStatus status;
        uint256 quantity;
    }

    mapping(uint256 => ShoeModel) public shoeModels;
    uint256 public totalModels;

    event ShoeModelAdded(uint256 indexed id, string name, uint256 productionCost, ProductionStatus status, uint256 quantity);
    event ShoeModelUpdated(uint256 indexed id, ProductionStatus status, uint256 quantity);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addShoeModel(string memory _name, uint256 _productionCost) external onlyOwner {
        totalModels++;
        shoeModels[totalModels] = ShoeModel(_name, _productionCost, ProductionStatus.Pending, 0);
        emit ShoeModelAdded(totalModels, _name, _productionCost, ProductionStatus.Pending, 0);
    }

    function updateShoeModelStatus(uint256 _id, ProductionStatus _status) external onlyOwner {
        require(_id > 0 && _id <= totalModels, "Invalid shoe model ID");
        shoeModels[_id].status = _status;
        emit ShoeModelUpdated(_id, _status, shoeModels[_id].quantity);
    }

    function updateShoeModelQuantity(uint256 _id, uint256 _quantity) external onlyOwner {
        require(_id > 0 && _id <= totalModels, "Invalid shoe model ID");
        shoeModels[_id].quantity = _quantity;
        emit ShoeModelUpdated(_id, shoeModels[_id].status, _quantity);
    }
}
