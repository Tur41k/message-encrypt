-- Copyright (c) 2022 Tur41ks Prod.

-- ���������� � �������
script_name("�Enc. Channel�")
script_version(1)
script_author("Henrich_Rogge")

-- ����������
require("lib.moonloader")
require("lib.sampfuncs")

local sampev = require("lib.samp.events")

-- ���������� ���������
sInfo = {
	myId = nil,
	myNick = ""
}

-- Access to Enc. Channel
access = { status = 0, encode = 0, nicks = {} }

-- Enumerations structure status
Status = {
	GOOD_REQUEST = 1,
	BAD_REQUEST = 2,
	FORBIDDEN = 3
}

-- Enumerations structure encode
Encode = {
	ACCESSED = 1,
	BAD_REQUEST = 2,
	FORBIDDEN = 3
}

function main()
	-- ��������� �������� �� sampfuncs � SAMP ���� �� ��������� - ������������ � ������
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	-- ��������� �������� �� SA-MP
	while not isSampAvailable() do wait(0) end
	-- ��������� ����� �� ����� �� ������
	while not sampIsLocalPlayerSpawned() do wait(0) end
	-- ��������� ���������� ���������
	sInfo.myId = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))
	sInfo.myNick = sampGetPlayerNickname(sInfo.myId)
	-- ����������� ������
	sampRegisterChatCommand("enc", cmd_encode) 
	-- ����� script ��������
	stext("������ ������� ��������! ��������� ����. ��������� - /enc [text]")
	-- ����������� ���� ��� ���������� ������ �������
  	while true do wait(0) end
end
  
-- �������� ��������� �� ����� � �������
function split(str)
	local chars = {}
	for c in string.gmatch(str, '.') do
		chars[#chars+1] = c
	end
	return chars
end

-- Samp Events (����)
function sampev.onServerMessage(color, text)
	-- by default decode enc. channel 
	if text:find(".+ .+%[%d+%]%: Enc%. Channel %| 123 .+") then
		local matchRank, matchNick, matchId, matchText = text:match("(.+) (.+)%[(%d+)%]%: Enc%. Channel %| (.+)")
		local encodeText = split(matchText)
		local decodeText = ""
		if #matchText ~= nil then
			for key, value in pairs(encodeText) do
				if value == nil and decodeAlphabet[value] == nil then goto continue end
				decodeText = decodeText .. decodeAlphabet[value]
				::continue::
			end
		end
    	return {-1920073984, ("%s %s[%s]: Enc. Channel | %s"):format(matchRank, matchNick, matchId, decodeText)}
	end
end

-- Command encode enc. channel
function cmd_encode(text)
	local text = split(text)
	local encodeText = ""
	if #text == 0 then
		atext("�����������: /enc [Text]")
		return
	elseif #text ~= nil then
		for key, value in pairs(text) do
			if value == nil and encodeAlphabet[value] == nil then goto continue end
			encodeText = encodeText .. encodeAlphabet[value]
			::continue::
		end
		sampSendChat(string.format("/r Enc. Channel | %s", encodeText))
	end
end

--- ���������� ������� ������ sampAddChatMessage
-- �Spec-Shifr� text
function stext(text)
  sampAddChatMessage((" %s {FFFFFF}%s"):format(script.this.name, text), 0x333333)
end

-- � text
function atext(text)
	sampAddChatMessage((" � {FFFFFF}%s"):format(text), 0x333333)
end

-- ���� ������ ������� �������� ������, � ��������� ������
function onScriptTerminate(LuaScript, quitGame)
	if LuaScript == thisScript() then
		showCursor(false)
  	end
end

--- ������� ��� �����������\������������� ������
-- ������ ��� �������� ������� ������ � �������������
encodeAlphabet = {
	["1"] = "0",
	["2"] = "9",
	["3"] = "8",
	["4"] = "7",
	["5"] = "6",
	["6"] = "5",
	["7"] = "4",
	["8"] = "3",
	["9"] = "2",
	["0"] = "1",
	
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",

	["�"] = "�", 
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",

	["A"] = "B",
	["B"] = "C",
	["C"] = "D",
	["D"] = "E",
	["E"] = "F",
	["F"] = "G",
	["G"] = "H",
	["H"] = "I",
	["I"] = "J",
	["J"] = "K",
	["K"] = "L",
	["L"] = "M",
	["M"] = "N",
	["N"] = "O",
	["O"] = "P",
	["P"] = "Q",
	["Q"] = "R",
	["R"] = "S",
	["S"] = "T",
	["T"] = "U",
	["U"] = "V",
	["V"] = "W",
	["W"] = "X",
	["X"] = "Y",
	["Y"] = "Z",
	["Z"] = "A",

	["a"] = "b",
	["b"] = "c",
	["c"] = "d",
	["d"] = "e",
	["e"] = "f",
	["f"] = "g",
	["g"] = "h",
	["h"] = "i",
	["i"] = "j",
	["j"] = "k",
	["k"] = "l",
	["l"] = "m",
	["m"] = "n",
	["n"] = "o",
	["o"] = "p",
	["p"] = "q",
	["q"] = "r",
	["r"] = "s",
	["s"] = "t",
	["t"] = "u",
	["u"] = "v",
	["v"] = "w",
	["w"] = "x",
	["x"] = "y",
	["y"] = "z",
	["z"] = "a",

	["!"] = "!",
	["@"] = "@",
	["#"] = "#",
	["$"] = "$",
	["%"] = "%",
	["^"] = "^",
	["&"] = "&",
	["*"] = "*",
	["("] = "(",
	[")"] = ")",
	["-"] = "-",
	["+"] = "+",
	["="] = "=",
	["?"] = "?",

	["\""] = "\"",
	["\""] = "\"",
	["\\"] = "\\",
	["."] = ".",
	[","] = ",",
	["`"] = "`",
	["/"] = "/",
	["|"] = "|",
	[";"] = ";",
	[":"] = ":",
	["["] = "[",
	["]"] = "]",
	["{"] = "{",
	["}"] = "}",
	["~"] = "~",
	["<"] = "<",
	[">"] = ">",

	[" "] = " "
}

-- ������ ��� �������� ������������� ������ � ��������
decodeAlphabet = {
	["0"] = "1",
	["9"] = "2",
	["8"] = "3",
	["7"] = "4",
	["6"] = "5",
	["5"] = "6",
	["4"] = "7",
	["3"] = "8",
	["2"] = "9",
	["1"] = "0",

	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",

	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",
	["�"] = "�",

	["B"] = "A",
	["C"] = "B",
	["D"] = "C",
	["E"] = "D",
	["F"] = "E",
	["G"] = "F",
	["H"] = "G",
	["I"] = "H",
	["J"] = "I",
	["K"] = "J",
	["L"] = "K",
	["M"] = "L",
	["N"] = "M",
	["O"] = "N",
	["P"] = "O",
	["Q"] = "P",
	["R"] = "Q",
	["S"] = "R",
	["T"] = "S",
	["U"] = "T",
	["V"] = "U",
	["W"] = "V",
	["X"] = "W",
	["Y"] = "X",
	["Z"] = "Y",
	["A"] = "Z",

	["b"] = "a",
	["c"] = "b",
	["d"] = "c",
	["e"] = "d",
	["f"] = "e",
	["g"] = "f",
	["h"] = "g",
	["i"] = "h",
	["j"] = "i",
	["k"] = "j",
	["l"] = "k",
	["m"] = "l",
	["n"] = "m",
	["o"] = "n",
	["p"] = "o",
	["q"] = "p",
	["r"] = "q",
	["s"] = "r",
	["t"] = "s",
	["u"] = "t",
	["v"] = "u",
	["w"] = "v",
	["x"] = "w",
	["y"] = "x",
	["z"] = "y",
	["a"] = "z",

	["!"] = "!",
	["@"] = "@",
	["#"] = "#",
	["$"] = "$",
	["%"] = "%",
	["^"] = "^",
	["&"] = "&",
	["*"] = "*",
	["("] = "(",
	[")"] = ")",
	["-"] = "-",
	["+"] = "+",
	["="] = "=",
	["?"] = "?",

	["\""] = "\"",
	["\""] = "\"",
	["\\"] = "\\",
	["."] = ".",
	[","] = ",",
	["`"] = "`",
	["/"] = "/",
	["|"] = "|",
	[";"] = ";",
	[":"] = ":",
	["["] = "[",
	["]"] = "]",
	["{"] = "{",
	["}"] = "}",
	["~"] = "~",
	["<"] = "<",
	[">"] = ">",

	[" "] = " "
}