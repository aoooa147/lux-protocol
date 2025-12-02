# LUX Protocol ABIs

## Installation

```bash
npm install @lux-protocol/abis
# or
yarn add @lux-protocol/abis
```

## Usage with viem

```typescript
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';
import { createPublicClient } from 'viem';

const client = createPublicClient({...});
const balance = await client.readContract({
  address: STAKING_ADDRESS,
  abi: LUX_STAKING_ABI,
  functionName: 'getUserInfo',
  args: [userAddress]
});
```

## Usage with ethers.js

```typescript
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';
import { ethers } from 'ethers';

const provider = new ethers.providers.JsonRpcProvider(RPC_URL);
const contract = new ethers.Contract(STAKING_ADDRESS, LUX_STAKING_ABI, provider);
const userInfo = await contract.getUserInfo(userAddress);
```

## Available ABIs

- `LUX_TOKEN.json` - ERC-20 token ABI for LUX token
- `LUX_STAKING.json` - Staking contract ABI

## Contract Addresses

- **LUX Token:** `0x6289D5B756982bbc2535f345D9D68Cb50c853F35`
- **Staking Contract:** `0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5`
- **Network:** World Chain (Chain ID: 480)

