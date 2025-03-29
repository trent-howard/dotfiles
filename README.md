# Config file management

## Requirements

- git
- stow

## Installation

To setup all of the files as symlinks in your home directory, clone the repo and from the root run

```sh
stow .
```

> [!NOTE]  
> `stow` will scan targets for conflicts - items in the tree that have the same name as something stow needs to create - and if any are found display them before terminating the operation.

## git config

A base git config will be symlinked with a couple of preferences I like, but user details are omitted to prevent leaking anything potentially sensitive.

They'll need to be configured manually for now. Maybe I can use private submodules to manage more private config?

Create a file `~/.config/git/gitconfig-personal` and populate it with your user config

```
[user]
	name = Your Name
	email = you@example.com
	signingKey = ~/.ssh/id_rsa.pub
[gpg]
	format = ssh
[commit]
	gpgsign = true
```

> [!IMPORTANT]
> Remember to create and add a new SSH key!
> [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## MacOS

To help bootstrap a new system run the following shell script to:

- install [Hombrew](https://brew.sh/)
- install a few apps and tools
- configure some system preferences

```sh
./scripts/mac-setup.sh
```

I usually remap <kbd>caps lock</kbd> to <kbd>ctrl</kbd> but haven't looked into how this could be done programmatically yet.
