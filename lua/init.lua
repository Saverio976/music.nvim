local string = require('string')
local io = require('io')

local function file_exists(name)
	local f = io.open(name,"r")
	if f then
		io.close(f)
		return true
	else
		return false
	end
end

local pattern = [[https?]]

local function check_url_correct (url)
	local res = string.match(url, pattern)

	if res then return true end
	if file_exists(url) then return true end
	return false
end

local function get_true_link(url)
	local res = string.match(url, pattern)

	if res then return url end
	HOME = os.getenv('HOME')
	if not os then return url end
	url = string.gsub(url, '~', HOME)
	return url
end

function PlayMusicUrl(url)
	url = url or ""
	url = get_true_link(url)
	if check_url_correct(url) == false then
		vim.notify('url provided is not an url, or not point to music')
		return
	end
	vim.notify('music will start in few seconds (' .. url .. ')')
	local floaterm_command = [[FloatermNew --position=top --wintype=split --autoclose=1]]
	local mpv_command = [[mpv --no-config --vo=tct --really-quiet --profile=sw-fast ']] .. url .. "'"
	vim.cmd(floaterm_command .. " " .. mpv_command)
end

function PlayMusic()
	vim.ui.input("enter url (could be youtube music/playlist)", play_music_url)
end

-- vim.cmd([[command! PlayMusic ]])
vim.cmd([[command! -nargs=1 -complete=file PlayMusic lua PlayMusicUrl(<args>)]])
