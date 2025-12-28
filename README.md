# SlnLauncher

SlnLauncher is a small PowerShell module that helps you quickly open Visual Studio solution files (`.sln`) from the terminal.

## Features

- Opens the first `.sln` found in the current directory
- Searches recursively in common folders (`src`, `solutions`, `projects`, etc.)
- Prompts to select a solution when multiple files are found
- Supports filtering by solution name
- Uses the default application associated with `.sln` files
- No icons, no external dependencies

## Installation

```powershell
Install-Module SlnLauncher -Scope CurrentUser
```

The module will be loaded automatically. You can also import it manually:

```powershell
Import-Module SlnLauncher
```

## Usage

From any project directory:

```powershell
sln
```

If only one solution is found, it will open automatically.
If multiple solutions are found, you will be prompted to select one.

### Filter by name

```powershell
sln api
```

Opens a solution containing `api` in its filename.

## Requirements

- PowerShell 5.1 or later
- Visual Studio (or any application associated with `.sln` files)

## License

This is free and unencumbered software released into the public domain.

For more information, please refer to [https://unlicense.org](https://unlicense.org).
