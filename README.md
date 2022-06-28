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


## installation

`this plugin require mpv executable installed and and discoverable in your PATH`
`pacman -S mpv`
`apt install mpv`

- with packer

```lua
use {
	'Saverio976/music.nvim',
	requires = { 'voldikss/vim-floaterm' }
}
```

you can look at https://github.com/rcarriga/nvim-notify for better notification (default is an echo)

## command

- PlayMusic (path of file/folder)|(url link)

open a terminal and run mpv to get sound + video if video

and there is a function for lua:
```lua
url = "https://youtu.be/1DoI5WTjd3w"
require('music_nvim').PlayMusicUrl(url)
```

## mpv interraction

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

## thanks

repo archi: https://github.com/RishabhRD/nvim-cheat.sh
