# music.nvim

play music in nvim

- play an audio file on your computer

this can also be a video

![file_audio](/assets/file_audio.png)

![file_audio_playing](/assets/file_audio_playing.png)

- play link

example with a youtube playlist

![youtube_video](/assets/youtube_playlist.png)

![youtube_video_playing](/assets/youtube_playlist_playing.png)


## installation

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
