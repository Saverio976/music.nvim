# music.nvim

> [!IMPORTANT]  
> I don't take time to update this, give a look at <https://github.com/tamton-aquib/mpv.nvim>

play music/video in neovim using mpv

## Installation

- require

1. [mpv](https://mpv.io/)

**this plugin require mpv executable installed and discoverable in your PATH**

- `pacman -S mpv`
- `apt install mpv`
- ...

2. [socat](http://www.dest-unreach.org/socat/) (interraction with mpv while playing playlist/music)

- `pacman -S socat`
- `apt install socat`
- ...

3. [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm) (to run mpv)

see its github readme for how to install it on your neovim config ([voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm))

4. bonus

- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) for better notification (default is an echo)

5. and, the plugin:

- with packer

```lua
use {
	'Saverio976/music.nvim',
	run = ':MusicInstall',
	requires = { 'voldikss/vim-floaterm' }
}
```

## Command

- **PlayMusic** (path of file/folder)|(url link)|(keywords search)
```vim
command! -nargs=1 -complete=file PlayMusic lua require('music_nvim').PlayMusicUrl([[<args>]])
```
open a terminal and run mpv to play only the sound

- **MusicPlay** (path of file/folder)|(url link)|(keywords search)
```vim
command! -nargs=1 -complete=file MusicPlay lua require('music_nvim').PlayMusicUrl([[<args>]])
```
open a terminal and run mpv to play only the sound

- **MusicPlayVideo** (path of file/folder)|(url link)|(keywords search)
```vim
command! -nargs=1 -complete=file MusicPlayVideo lua require('music_nvim').PlayMusicVideoUrl([[<args>]])
```
open a terminal and run mpv to play the sound + video

- **MusicNext**
```vim
command! MusicNext lua require('music_nvim').next_music()
```
pass to the next music (or stop it if not a playlist)

- **MusicPrev**
```vim
command! MusicPrev lua require('music_nvim').next_music()
```
pass to the previous music (if playlist)

- **MusicShuffle**
```vim
command! MusicUnShuffle lua require('music_nvim').unshuffle_music()
```
shuffle the playlist

- **MusicUnShuffle**
```vim
command! MusicUnShuffle lua require('music_nvim').unshuffle_music()
```
unshuffle the playlist

- **MusicQueue**
```vim
command! MusicQueue lua require('music_nvim').queue_music()
```
show queue

- **MusicAllPlaylist**
```vim
command! MusicAllPlaylist lua require('music_nvim').allplaylist_music()
```
show all the play list

## Mpv Interraction (in the splited terminal) (`man mpv` for better info)
<details>
  <summary>click to see mpv basic interraction in the floating terminal</summary>

- `p`

pause music

(same as <Space>)

- `<Space>`

pause music

(same as p)

- `Left` and `Right` `arrow`

go backaward/forward a little

- `Down` and `Up` `arrow`

go backaward/forward

- `<Enter>`

pass to the next music (or stop music if not a playlist)

- `>`

go to next music

- `<`

go to last music
</details>


## Thanks

- repo archi for a plugin: [RishabhRD/nvim-cheat.sh](https://github.com/RishabhRD/nvim-cheat.sh)

- play sound / video: [mpv](https://mpv.io/)

- control mpv in a terminal: [mpvc](https://github.com/lwilletts/mpvc)
