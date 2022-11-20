local Types = require(script.Types)
local StoreClass = require(script.Store)

local SuperGlobal = {}
SuperGlobal.__index = SuperGlobal

function SuperGlobal:GetStore(StoreName: string): Types.Store
	return StoreClass.new(StoreName)
end

return SuperGlobal