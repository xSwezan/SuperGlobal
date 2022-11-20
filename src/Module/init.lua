local Types = require(script.Types)
local StoreClass = require(script.Store)

--[=[
	@class SuperGlobal
]=]
local SuperGlobal = {}
SuperGlobal.__index = SuperGlobal

--[=[
	Returns a Store that you can use to add/remove items from.
	:::tip
	You can find more info about Stores in the [Store documentation](Store).
	:::

	:::tip Example
	```lua
	local FruitStore = SuperGlobal:GetStore("FruitStore")
	```
	:::

	@return Store
]=]
function SuperGlobal:GetStore(StoreName: string): Types.Store
	return StoreClass.new(StoreName)
end

return SuperGlobal