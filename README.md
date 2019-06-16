# `yale`
Are you a Yale student? Do you just not feel self-righteous enough? Have you nothing better to do than replace arbitrary portions of your workflow with command-line apps? Do you spend all day in iTerm and `tmux` and exclusively edit files in `vim`? Does your `.vimrc` have more lines than you've been on dates? Then `yale` is the tool for you.

![Screenshot](screenshot.png) (TODO)

## Installation
From the `yale` directory, run:
```sh
make install
```
for a full installation.

Alternatively, if you're working on `yale` in a development environment, you may wish to symlink the executable for ease of testing:
```sh
make link
```
To uninstall:
```sh
make uninstall
```
Any of these commands may require root privileges depending on your environment.

## Use
TODO

## Configuration
At first run, your credentials will be requested and saved to `~/.psc_credentials.yml`. Other configuration options will populate `~/.psc.yml`, and may be tweaked as desired.

## License
[MIT](LICENSE)

## Author
[Erik Boesen](https://github.com/ErikBoesen)
