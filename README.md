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
