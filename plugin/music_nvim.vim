if exists('g:loaded_music_nvim') | finish | endif

let g:loaded_music_nvim = 1

command! -nargs=1 -complete=file PlayMusic lua require('music_nvim').PlayMusicUrl([[<args>]])
