## Circadian Colors for Neovim

### Enrich Your Coding Experience with Dynamic Colorschemes

![Circadian Colors Logo](https://github.com/jessfaux/circadian-colors/blob/main/circadian-colors.png?raw=true)

**Circadian Colors** is a Neovim plugin designed to dynamically adjust your coding environment's colorscheme in sync with the natural progression of the day. Inspired by the concept of circadian rhythms, this plugin smoothly transitions between light and dark themes based on the time. 

## Features
- **Automatic Theme Switching**: Seamlessly switch between light and dark themes based on predefined hours.
- **Customizable Themes**: Choose your preferred themes for both light and dark modes.
- **Easy Configuration**: Simple commands to set up and customize your experience.
- **Adaptive Refreshing**: Intelligent theme updating for minimal distraction.

# Table of Contents
1. [Circadian Colors for Neovim](#circadian-colors-for-neovim)
2. [Features](#features)
3. [Installation](#installation)
   - [Using Packer](#using-packer)
   - [Using Vim-Plug](#using-vim-plug)
   - [Using Dein.vim](#using-deinvim)
   - [Using Pathogen](#using-pathogen)
4. [Setup and Configuration](#setup-and-configuration)
5. [Custom Commands](#custom-commands)
6. [Contributing](#contributing)
7. [License](#license)
8. [Acknowledgments](#acknowledgments)

## Installation

Circadian Colors can be installed using various Neovim package managers. Choose the one that suits your setup:

### Using Packer

Add the following line to your Neovim configuration file (usually located at `~/.config/nvim/init.lua`):

```lua
use ({'jessfaux/circadian-colors', as = 'circadian-colors' })
```

### Using Vim-Plug

Add the following line to your Neovim configuration file (usually in `~/.config/nvim/init.vim`):

```vim
Plug 'jessfaux/circadian-colors'
```

Then run `:PlugInstall` in Neovim to install the plugin.

### Using Dein.vim

Add the following to your `dein.toml` file:

```toml
[[plugins]]
repo = 'jessfaux/circadian-colors'
```

Reload your Neovim configuration or restart Neovim and execute `:call dein#install()` to install the plugin.

### Using Pathogen

Clone the repository into your `~/.vim/bundle` directory:

```sh
cd ~/.vim/bundle
git clone https://github.com/jessfaux/circadian-colors.git
```

Ensure you have the following line in your `~/.vimrc` or `~/.config/nvim/init.vim`:

```vim
execute pathogen#infect()
```

### Setup and Configuration

After installation, add the following lines to your `init.lua` or Neovim configuration file to initialize the plugin with default settings:

```lua
require('circadian-colors').setup({
    light_theme = "rose-pine-dawn", -- Default light theme
    dark_theme = "rose-pine-moon",  -- Default dark theme
    start_hour = 8,                 -- Hour to switch to light theme (24-hour format)
    end_hour = 20                   -- Hour to switch to dark theme (24-hour format)
})
```

### Custom Commands

Circadian Colors provides custom commands to further personalize your experience:

- **CircadianSetHours [start_hour] [end_hour]**: Set the hours for theme transition.
  
  Example: `:CircadianSetHours 7 19`

- **CircadianSetLightTheme [theme_name]**: Set the light theme.
  
  Example: `:CircadianSetLightTheme 'onedark'`

- **CircadianSetDarkTheme [theme_name]**: Set the dark theme.
  
  Example: `:CircadianSetDarkTheme 'gruvbox'`

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request on our [GitHub repository](https://github.com/jessfaux/circadian-colors).

## License

This project is licensed under [MIT License](https://github.com/jessfaux/circadian-colors/blob/main/LICENSE).

## Acknowledgments

A special thanks to the Neovim community who make projects like this possible.
