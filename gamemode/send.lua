-- For including the send.lua from other folders
local include = include

AddCSLuaFile("sb/send.lua")
AddCSLuaFile("vgui/send.lua")
AddCSLuaFile("classes/send.lua")

include("classes/send.lua")
include("sb/send.lua")
include("vgui/send.lua")
