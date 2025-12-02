# LUX Protocol - Quick Start Guide

This guide will help you integrate LUX Protocol into your application.

## Prerequisites

- Node.js 18+ 
- A Web3 library: `viem` or `ethers.js`
- RPC endpoint to World Chain (or use public RPC)

## Installation

### Using viem (Recommended)

```bash
npm install viem
```

### Using ethers.js

```bash
npm install ethers
```

## Contract Addresses

```typescript
const LUX_TOKEN_ADDRESS = "0x6289D5B756982bbc2535f345D9D68Cb50c853F35";
const STAKING_CONTRACT_ADDRESS = "0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5";
```

## Examples with viem

### 1. Setup Client

```typescript
import { createPublicClient, http } from 'viem';
import { defineChain } from 'viem';

const worldChain = defineChain({
  id: 480,
  name: 'World Chain',
  nativeCurrency: {
    name: 'Worldcoin',
    symbol: 'WLD',
    decimals: 18,
  },
  rpcUrls: {
    default: {
      http: ['https://worldchain-rpc.publicnode.com'],
    },
  },
  blockExplorers: {
    default: {
      name: 'Worldscan',
      url: 'https://worldscan.org',
    },
  },
});

const client = createPublicClient({
  chain: worldChain,
  transport: http('https://worldchain-rpc.publicnode.com')
});
```

### 2. Read User Staking Info

```typescript
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';

const userAddress = "0x..."; // User's wallet address

// Get user staking info
const userInfo = await client.readContract({
  address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  abi: LUX_STAKING_ABI,
  functionName: 'getUserInfo',
  args: [userAddress]
});

console.log('Staked Balance:', userInfo.balance.toString());
console.log('Pending Rewards:', userInfo.intereses.toString());
console.log('Power Boost Tier:', userInfo.powerBoost);
```

### 3. Read Pending Reward

```typescript
const pendingRewards = await client.readContract({
  address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  abi: LUX_STAKING_ABI,
  functionName: 'currentReward',
  args: [userAddress]
});

console.log('Pending:', pendingRewards.toString());
```

### 4. Read Total Staked

```typescript
const totalStaked = await client.readContract({
  address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  abi: LUX_STAKING_ABI,
  functionName: 'getTotalStaked',
  args: []
});

console.log('Total Staked:', totalStaked.toString());
```

### 5. Stake LUX (with wagmi)

```typescript
import { useWriteContract, useWaitForTransactionReceipt } from 'wagmi';
import LUX_TOKEN_ABI from '@lux-protocol/abis/LUX_TOKEN.json';
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';

function StakeButton() {
  const { writeContract, data: hash } = useWriteContract();
  const { isLoading, isSuccess } = useWaitForTransactionReceipt({ hash });
  const amount = BigInt("1000000000000000000"); // 1 LUX (18 decimals)

  const handleStake = async () => {
    // Step 1: Approve
    await writeContract({
      address: '0x6289D5B756982bbc2535f345D9D68Cb50c853F35',
      abi: LUX_TOKEN_ABI,
      functionName: 'approve',
      args: [
        '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
        amount
      ]
    });

    // Step 2: Stake
    await writeContract({
      address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
      abi: LUX_STAKING_ABI,
      functionName: 'stake',
      args: [amount]
    });
  };

  return (
    <button onClick={handleStake} disabled={isLoading}>
      {isLoading ? 'Staking...' : 'Stake LUX'}
    </button>
  );
}
```

### 6. Withdraw Staked LUX

```typescript
const { writeContract } = useWriteContract();

await writeContract({
  address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  abi: LUX_STAKING_ABI,
  functionName: 'retirarBalance',
  args: [amount] // bigint in wei
});
```

### 7. Claim Rewards

```typescript
await writeContract({
  address: '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  abi: LUX_STAKING_ABI,
  functionName: 'claim',
  args: []
});
```

## Examples with ethers.js

### Setup Provider

```typescript
import { ethers } from 'ethers';

const provider = new ethers.providers.JsonRpcProvider(
  'https://worldchain-rpc.publicnode.com'
);
```

### Read User Info

```typescript
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';

const stakingContract = new ethers.Contract(
  '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  LUX_STAKING_ABI,
  provider
);

const userInfo = await stakingContract.getUserInfo(userAddress);
console.log('Staked:', userInfo.balance.toString());
console.log('Pending:', userInfo.intereses.toString());
```

### Stake LUX

```typescript
import LUX_TOKEN_ABI from '@lux-protocol/abis/LUX_TOKEN.json';
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';

// Connect wallet
const signer = provider.getSigner();

// Get contracts
const tokenContract = new ethers.Contract(
  '0x6289D5B756982bbc2535f345D9D68Cb50c853F35',
  LUX_TOKEN_ABI,
  signer
);

const stakingContract = new ethers.Contract(
  '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  LUX_STAKING_ABI,
  signer
);

// Approve
const approveTx = await tokenContract.approve(
  '0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5',
  ethers.utils.parseEther('1.0')
);
await approveTx.wait();

// Stake
const stakeTx = await stakingContract.stake(ethers.utils.parseEther('1.0'));
await stakeTx.wait();
```

## Error Handling

Always wrap contract calls in try-catch:

```typescript
try {
  const userInfo = await client.readContract({
    address: STAKING_ADDRESS,
    abi: LUX_STAKING_ABI,
    functionName: 'getUserInfo',
    args: [userAddress]
  });
} catch (error) {
  console.error('Error reading contract:', error);
  // Handle error (network issue, contract error, etc.)
}
```

## Next Steps

- Explore [API Reference](./API_REFERENCE.md) (Coming soon)
- Check out the [full documentation](../README.md)
- Join our community for support

