local string = require('string')
local io = require('io')
local os = require('os')

local floaterm_command = [[FloatermNew --position=top --wintype=split --autoclose=1]]
local mpv_ipc_path = "/tmp/mpvsocket"
local socat_command = [[socat - "]] .. mpv_ipc_path .. '"'
local mpvc_path = os.getenv('HOME') .. "/.local/bin/mpvc"

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

local function execute_command(command)
	local ok, _ = pcall(vim.cmd, floaterm_command .. " " .. command)
	if ok == false then
		vim.notify("mpv could not load")
	end
end

local M = {}
M.__index = M

function M.music_nvim_install()
	if vim.fn.executable('mpv') ~= 1 then
		error("'mpv' is not installed; please install it")
	end
	if vim.fn.executable('socat') ~= 1 then
		error("'socat' is not installed; please install it")
	end
	if file_exists(mpvc_path) == false then
		local url = 'https://raw.githubusercontent.com/lwilletts/mpvc/master/mpvc'
		if vim.fn.executable('curl') == 1 then
			os.execute('curl ' .. url .. ' > ' .. mpvc_path)
		elseif vim.fn.executable('wget') == 1 then
			os.execute('wget ' .. url .. ' -o ' .. mpvc_path)
		else
			error('please install curl or wget')
		end
		os.execute('chmod +x ' .. mpvc_path)
	end
end

function M.PlayMusicUrl(url)
	url = url or ""
	url = get_true_link(url)
	if check_url_correct(url) == false then
		url = 'ytdl://ytsearch:' .. url
	end
	vim.notify('music will start in few seconds (' .. url .. ')')
	local mpv_print_option = [[--no-config --profile=sw-fast --ytdl-format=bestaudio --no-video]]
	local mpv_ipc_option = [[--input-ipc-server=]] .. mpv_ipc_path
	local mpv_command = "mpv " .. mpv_print_option .. " " .. mpv_ipc_option .. " '" .. url .. "'"
	execute_command(mpv_command)
end

function M.PlayMusicVideoUrl(url)
	url = url or ""
	url = get_true_link(url)
	if check_url_correct(url) == false then
		url = 'ytdl://ytsearch:' .. url
	end
	vim.notify('music will start in few seconds (' .. url .. ')')
	local mpv_print_option = [[--no-config --vo=tct --really-quiet --profile=sw-fast --ytdl-format=bestvideo]]
	local mpv_ipc_option = [[--input-ipc-server=]] .. mpv_ipc_path
	local mpv_command = "mpv " .. mpv_print_option .. " " .. mpv_ipc_option .. " '" .. url .. "'"
	execute_command(mpv_command)
end

function M.PlayMusic()
	vim.ui.input("enter url (could be youtube music/playlist)", M.play_music_url)
end

function M.next_music()
	local mpv_command = [[echo playlist-next force]]
	execute_command(mpv_command .. ' | ' .. socat_command)
end

function M.previous_music()
	local mpv_command = [[echo playlist-prev force]]
	execute_command(mpv_command .. ' | ' .. socat_command)
end

function M.shuffle_music()
	local mpv_command = [[echo playlist-shuffle]]
	execute_command(mpv_command .. ' | ' .. socat_command)
end

function M.unshuffle_music()
	local mpv_command = [[echo playlist-unshuffle]]
	execute_command(mpv_command .. ' | ' .. socat_command)
end

function M.queue_music()
	local mpvc_command = mpvc_path .. [[ --playlist | less]]
	execute_command(mpvc_command)
end

function M.allplaylist_music()
	local mpvc_command = mpvc_path .. [[ --fullplaylist | less]]
	execute_command(mpvc_command)
end

return M
