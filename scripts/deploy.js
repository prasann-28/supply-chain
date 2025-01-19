// Import Hardhat's libraries
const hre = require("hardhat");

async function main() {
    // Get the contract to deploy
    const SupplyChain = await hre.ethers.getContractFactory("SupplyChain");

    // Deploy the contract
    const supplyChain = await SupplyChain.deploy();

    // Log the entire supplyChain object to inspect its properties
    console.log("SupplyChain object:", supplyChain);

    // Try to access the address
    const deployedAddress = supplyChain.address || supplyChain.target;
    console.log("SupplyChain deployed to:", deployedAddress);
}

// Run the main function and handle errors
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
