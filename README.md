# music.nvim

play music in nvim

- play an audio file on your computer

this can also be a video

![file_audio](/assets/file_audio.png)
```vim
:PlayMusic ~/Music/XYLO_-_Yes_No.webm
```

![file_audio_playing](/assets/file_audio_playing.png)

- play link

example with a youtube playlist

![youtube_video](/assets/youtube_playlist.png)
```vim
:PlayMusic https://youtube.com/playlist?list=PLDrdeYmfX5rvQb5FKb5flpGVcXkRb2KK3
```

![youtube_video_playing](/assets/youtube_playlist_playing.png)


## Installation

- require

1. mpv

`this plugin require mpv executable installed and and discoverable in your PATH`
`pacman -S mpv`
`apt install mpv`

- voldikss/vim-floaterm

`with packer`
```lua
use {
	'Saverio976/music.nvim',
	run = ':MusicInstall',
	requires = { 'voldikss/vim-floaterm' }
}
```

- bonus

you can look at https://github.com/rcarriga/nvim-notify for better notification (default is an echo)

## Command

- **PlayMusic** (path of file/folder)|(url link)
```vim
command! -nargs=1 -complete=file PlayMusic lua require('music_nvim').PlayMusicUrl([[<args>]])
```
open a terminal and run mpv to get sound + video if video

- **MusicPlay** (path of file/folder)|(url link)
```vim
command! -nargs=1 -complete=file MusicPlay lua require('music_nvim').PlayMusicUrl([[<args>]])
```
open a terminal and run mpv to get sound + video if video

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

-- **MusicUnShuffle**
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

## Mpv Interraction (in the splited terminal)

- `p`

pause music

(same as <Space>)

- <Space>

pause music

(same as p)

- Left and Right arrow

go backaward/forward a little

- Down and Up arrow

go backaward/forward

- <Enter>

pass to the next music (or stop music if not a playlist)

- `>`

go to next music

- `<`

go to last music

## Thanks

repo archi: https://github.com/RishabhRD/nvim-cheat.sh
