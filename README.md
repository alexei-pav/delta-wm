# deltaWM
deltaWM is just fork of dwm with some patches and my configs. For now.

## Requirements
- Terminal emulator (XTerm by default)
- X11 server (tested on XOrg and XLibre)
- GNU Make (for building)
- GCC (not tested with clang)
- feh for background image (optional)
- maim for screenshots (optional)

## Key bindigs (default):
Mod => "Win" or "Super", usually next to "Alt" key

| Action | Keys | 
|--------|------|
| Close window | Mod+Shift+c |
| Open terminal | Mod+Enter |
| Open dmenu | Mod+p |
| Select tag | Mod+1..9 |
| Select all tags | Mod+0 |

## Build and install
First it's necessary to build it, type:
```shell
make
```
and then **as root**:
```shell
make install
```
After installing, copy file *startwm.sh* to /usr/local/bin or another directory you want.
Also, you need to configure it in your .xinitrc, so add:
```shell
exec path/to/startwm.sh
```
And finally, type this in terminal:
```shell
chmod 0755 path/to/startwm.sh
```

## Start
The command may be different, depends on operating system, but usually it is:
```shell
startx
```
