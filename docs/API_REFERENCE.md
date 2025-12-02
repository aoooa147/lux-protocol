# LUX Protocol - API Reference

## Contract Functions

### LUX Token Contract

**Address:** `0x6289D5B756982bbc2535f345D9D68Cb50c853F35`

#### View Functions

##### `totalSupply() → uint256`
Returns the total supply of LUX tokens.

##### `balanceOf(address account) → uint256`
Returns the balance of LUX tokens for a given address.

##### `name() → string`
Returns the name of the token (LUX).

##### `symbol() → string`
Returns the symbol of the token (LUX).

##### `decimals() → uint8`
Returns the number of decimals (18).

##### `allowance(address owner, address spender) → uint256`
Returns the amount of tokens that `spender` is allowed to spend on behalf of `owner`.

#### Write Functions

##### `approve(address spender, uint256 amount) → bool`
Approves `spender` to spend `amount` tokens on behalf of the caller.

##### `transfer(address to, uint256 amount) → bool`
Transfers `amount` tokens to `to`.

---

### Staking Contract

**Address:** `0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5`

#### View Functions

##### `getUserInfo(address userAddress) → tuple`
Returns user staking information:
- `intereses` (uint256): Pending rewards
- `balance` (uint256): Staked balance
- `startTime` (uint256): When user started staking
- `lastClaimIntereses` (uint256): Last time rewards were claimed
- `lastClaimBalance` (uint256): Last time balance was withdrawn
- `powerBoost` (uint8): Current PowerBoost tier

##### `currentReward(address userAddress) → uint256`
Returns the current pending reward for a user.

##### `getTotalStaked() → uint256`
Returns the total amount of LUX staked across all users.

##### `getPowerBoostTable(uint8 tier) → tuple`
Returns PowerBoost tier information:
- `APY` (uint16): APY percentage
- `cost` (uint256): Cost to upgrade to this tier
- `APY_Block` (uint256): Block-based APY calculation
- `cantidad` (uint256): Required staked amount

##### `getPowerBoostRanking() → uint256[]`
Returns array of addresses ranked by PowerBoost tier.

#### Write Functions

##### `stake(uint256 amount)`
Stakes `amount` of LUX tokens. Requires approval first.

##### `retirarBalance(uint256 amount)`
Withdraws `amount` of staked LUX tokens.

##### `retirarIntereses()`
Claims pending rewards.

##### `claim()`
Claims available rewards (alternative to `retirarIntereses`).

##### `buyPowerBoost(uint256 amount, uint8 powerBoost_id, tuple permit, tuple transferDetails, bytes signature)`
Purchases PowerBoost tier upgrade.

---

## Events

### Staking Contract Events

#### `Stake(address indexed user, uint256 amount)`
Emitted when a user stakes LUX tokens.

#### `Withdraw(address indexed user, uint256 amount)`
Emitted when a user withdraws staked tokens.

#### `RewardClaimed(address indexed user, uint256 amount)`
Emitted when a user claims rewards.

---

## Error Handling

All contract calls should be wrapped in try-catch blocks:

```typescript
try {
  const result = await client.readContract({...});
} catch (error) {
  // Handle error
  // - Network errors: retry with fallback RPC
  // - Contract errors: check function name, parameters
  // - Rate limits: wait and retry
}
```

---

## Rate Limiting

- Use `readContractWithFallback` for automatic RPC fallback
- Implement request queuing for high-frequency calls
- Cache results when possible (30-60 seconds)

---

## Best Practices

1. **Always check chain ID** before making contract calls
2. **Use proper error handling** for all contract interactions
3. **Cache results** when appropriate to reduce RPC calls
4. **Use batch reads** when querying multiple values
5. **Handle bigint conversions** properly (18 decimals)

---

**Note:** This is a living document. More functions and events will be added as the protocol evolves.

