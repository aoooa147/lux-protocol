# LUX Protocol - Deployment Guide

## Pushing to GitHub

### Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and create a new repository
2. Repository name: `lux-protocol`
3. Description: "LUX Protocol - Smart contracts and ABIs for the reward layer of World Chain"
4. Visibility: Public (recommended) or Private
5. **Do NOT** initialize with README, .gitignore, or license (we already have these)

### Step 2: Initialize Git and Push

```bash
# Navigate to protocol directory
cd protocol

# Initialize git (if not already initialized)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: LUX Protocol repository

- ABIs for LUX Token and Staking contracts
- Developer documentation (README, QUICK_START, API_REFERENCE)
- Contract addresses and network configuration"

# Add remote repository (replace YOUR_ORG with your GitHub username/org)
git remote add origin https://github.com/YOUR_ORG/lux-protocol.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Update Repository URLs

After pushing, update these files with the actual GitHub URL:

1. `protocol/README.md` - Update Quick Links section
2. `protocol/package.json` - Update repository URL
3. `protocol/docs/README.md` - Update links if needed

### Step 4: Create GitHub Release (Optional)

For versioning and npm publishing:

1. Go to repository → Releases → Create a new release
2. Tag: `v0.1.0`
3. Title: `v0.1.0 - Initial Release`
4. Description: "Initial release of LUX Protocol ABIs and documentation"

## Publishing to NPM (Future)

Once the repository is on GitHub:

1. Create NPM account (if not already)
2. Create NPM organization: `@lux-protocol`
3. Add NPM token to GitHub Secrets: `NPM_TOKEN`
4. The GitHub Actions workflow will automatically publish on release

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
├── README.md
└── DEPLOYMENT.md
```

## Next Steps

After pushing to GitHub:

1. Update all documentation with actual GitHub URLs
2. Share repository link with developers
3. Consider publishing to NPM for easier installation
4. Set up GitHub Pages for documentation (optional)

