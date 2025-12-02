# LUX Protocol

**LUX is the reward layer of World Chain.**

LUX Protocol provides smart contracts and infrastructure for:
- Staking with on-chain yield
- Quest system for on-chain/off-chain tasks
- Referral rewards
- PowerBoost tier system

## Quick Links
- 🌐 Website: [luminex.world](https://luminex.world) (or your website URL)
- 🪙 Token: [Worldscan](https://worldscan.org/address/0x6289D5B756982bbc2535f345D9D68Cb50c853F35)
- 📊 Staking Contract: [Worldscan](https://worldscan.org/address/0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5)
- 📖 Documentation: [docs/README.md](./docs/README.md)
- 📦 GitHub: [github.com/aoooa147/lux-protocol](https://github.com/aoooa147/lux-protocol)

## Installation

```bash
npm install @lux-protocol/abis
```

**Note:** This package will be published to NPM after the repository is set up on GitHub.

For now, you can:
- Copy ABIs from `abis/` directory
- Or clone this repository

## Quick Start

See [docs/QUICK_START.md](./docs/QUICK_START.md) for code examples.

## Contracts

- **LUX Token:** `0x6289D5B756982bbc2535f345D9D68Cb50c853F35`
- **Staking:** `0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5`
- **Network:** World Chain (Chain ID: 480)

## Repository Structure

```
lux-protocol/
├── abis/
│   ├── LUX_TOKEN.json
│   ├── LUX_STAKING.json
│   └── README.md
├── docs/
│   ├── README.md
│   ├── QUICK_START.md
│   └── API_REFERENCE.md
├── .gitignore
├── package.json
├── LICENSE
├── README.md
├── DEPLOYMENT.md
└── PUSH_TO_GITHUB.md
```

## Usage

### With viem

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

### With ethers.js

```typescript
import LUX_STAKING_ABI from '@lux-protocol/abis/LUX_STAKING.json';
import { ethers } from 'ethers';

const provider = new ethers.providers.JsonRpcProvider(RPC_URL);
const contract = new ethers.Contract(STAKING_ADDRESS, LUX_STAKING_ABI, provider);
const userInfo = await contract.getUserInfo(userAddress);
```

## Documentation

- [Quick Start Guide](./docs/QUICK_START.md) - Get started with code examples
- [API Reference](./docs/API_REFERENCE.md) - Complete contract function reference
- [Main Documentation](./docs/README.md) - Overview and network configuration

## Contributing

This is the official LUX Protocol repository. For questions or contributions, please open an issue on GitHub.

## License

MIT License - see [LICENSE](./LICENSE) file for details.
