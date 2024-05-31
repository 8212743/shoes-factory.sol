# ShoesFactoryManagement Smart Contract

## Overview

The `ShoesFactoryManagement` smart contract is designed to manage the production of different shoe models in a factory. It allows the owner to add new shoe models, update their production status, and adjust their quantities. The contract ensures that only the owner has the authority to perform these actions.

## Contract Details

### Owner

- **owner**: The address of the contract owner. Only the owner can perform certain actions within the contract.

### Enums

- **ProductionStatus**: An enum representing the production status of a shoe model. It can have three values:
  - `Pending`
  - `InProgress`
  - `Completed`

### Structs

- **ShoeModel**: A struct representing a shoe model with the following properties:
  - `name`: The name of the shoe model.
  - `productionCost`: The production cost of the shoe model.
  - `status`: The current production status of the shoe model.
  - `quantity`: The quantity of shoes produced for this model.

### Mappings

- **shoeModels**: A mapping from a unique ID to a `ShoeModel` struct. This stores all the shoe models managed by the contract.

### State Variables

- **totalModels**: A counter for the total number of shoe models added to the contract.

### Events

- **ShoeModelAdded**: Emitted when a new shoe model is added. Contains the following parameters:
  - `id`: The unique ID of the shoe model.
  - `name`: The name of the shoe model.
  - `productionCost`: The production cost of the shoe model.
  - `status`: The initial production status of the shoe model.
  - `quantity`: The initial quantity of the shoe model (always 0 when added).

- **ShoeModelUpdated**: Emitted when a shoe model's status or quantity is updated. Contains the following parameters:
  - `id`: The unique ID of the shoe model.
  - `status`: The updated production status of the shoe model.
  - `quantity`: The updated quantity of the shoe model.

### Modifiers

- **onlyOwner**: A modifier that restricts the execution of certain functions to the contract owner only.

## Functions

### Constructor

- **constructor()**
  - Initializes the contract by setting the contract owner to the address that deploys the contract.

### External Functions

- **addShoeModel(string memory _name, uint256 _productionCost)**
  - Adds a new shoe model to the contract.
  - Parameters:
    - `_name`: The name of the shoe model.
    - `_productionCost`: The production cost of the shoe model.
  - Emits a `ShoeModelAdded` event.

- **updateShoeModelStatus(uint256 _id, ProductionStatus _status)**
  - Updates the production status of an existing shoe model.
  - Parameters:
    - `_id`: The unique ID of the shoe model.
    - `_status`: The new production status of the shoe model.
  - Emits a `ShoeModelUpdated` event.
  - Requires the `onlyOwner` modifier.

- **updateShoeModelQuantity(uint256 _id, uint256 _quantity)**
  - Updates the quantity of an existing shoe model.
  - Parameters:
    - `_id`: The unique ID of the shoe model.
    - `_quantity`: The new quantity of the shoe model.
  - Emits a `ShoeModelUpdated` event.
  - Requires the `onlyOwner` modifier.

## Usage

1. **Deploy the Contract**: The owner deploys the contract.
2. **Add Shoe Models**: The owner adds new shoe models using the `addShoeModel` function.
3. **Update Shoe Model Status**: The owner updates the production status of a shoe model using the `updateShoeModelStatus` function.
4. **Update Shoe Model Quantity**: The owner updates the quantity of a shoe model using the `updateShoeModelQuantity` function.

## Requirements

- The contract is written in Solidity and requires version 0.8.0 or later.
- Only the owner can add new shoe models and update their status or quantity.
- The contract owner is set during deployment and cannot be changed.

## License

This contract is licensed under the MIT License.
