if exists('g:loaded_music_nvim') | finish | endif

let g:loaded_music_nvim = 1

command! -nargs=1 -complete=file PlayMusic lua require('music_nvim').PlayMusicUrl([[<args>]])
command! -nargs=1 -complete=file MusicPlay lua require('music_nvim').PlayMusicUrl([[<args>]])
command! -nargs=1 -complete=file MusicPlayVideo lua require('music_nvim').PlayMusicVideoUrl([[<args>]])
command! MusicNext lua require('music_nvim').next_music()
command! MusicPrev lua require('music_nvim').next_music()
command! MusicShuffle lua require('music_nvim').shuffle_music()
command! MusicUnShuffle lua require('music_nvim').unshuffle_music()
command! MusicInstall lua require('music_nvim').music_nvim_install()
command! MusicQueue lua require('music_nvim').queue_music()
command! MusicAllPlaylist lua require('music_nvim').allplaylist_music()
