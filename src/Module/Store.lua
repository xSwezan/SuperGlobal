local HttpService = game:GetService("HttpService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local MessagingService = game:GetService("MessagingService")

local Types = require(script.Parent.Types)

--[=[
	@class Store

	A Store contains data (items) and is shared across all servers in the game.
	A Store allow you to manipulate items that can be accessed throughout all of the servers in the game.
]=]
local Store = {}
Store.__index = Store

--[=[
	@private
	Create a new StoreClass

	@param Name string
	@return StoreType
]=]
function Store.new(Name: string): Types.Store
	local self = setmetatable({}, Store)

	self.Name = Name
	self.Key = ("SuperGlobal:Store-%s"):format(Name)

	self.DataMap = MemoryStoreService:GetSortedMap(self.Key)

	self._ItemAdded = Instance.new("BindableEvent")
	self.ItemAdded = self._ItemAdded.Event

	self._ItemRemoved = Instance.new("BindableEvent")
	self.ItemRemoved = self._ItemRemoved.Event

	MessagingService:SubscribeAsync(self.Key,function(Info: {Data: string})
		local Info = HttpService:JSONDecode(Info.Data)
		if not (typeof(Info) == "table") then return end
		
		local Name: string = Info[1]
		local Data: any = Info[2]

		if (Name == "ItemAdded") then
			self._ItemAdded:Fire(Data)
		elseif (Name == "ItemRemoved") then
			self._ItemRemoved:Fire(Data)
		end
	end)

	return self
end

function Store:FireServers(Name: string, Data: any)
	local Encoded = HttpService:JSONEncode({Name, Data})
	MessagingService:PublishAsync(self.Key, Encoded)
end

--[=[
	Add an Item into the Store
]=]
function Store:AddItem(Key: string, Data: Types.ItemData, Expiration: number?): nil
	local DataMap: MemoryStoreSortedMap = self.DataMap
	DataMap:SetAsync(Key, Data, Expiration or 604800) -- 1 Week

	self:FireServers("ItemAdded", Key)
end

--[=[
	Remove an Item from the Store
]=]
function Store:RemoveItem(Key: string): nil
	local DataMap: MemoryStoreSortedMap = self.DataMap
	DataMap:RemoveAsync(Key)

	self:FireServers("ItemRemoved", Key)
end

--[=[
	Get an Item from the Store
]=]
function Store:GetItem(Key: string): any?
	local DataMap: MemoryStoreSortedMap = self.DataMap

	return DataMap:GetAsync(Key)
end

--[=[
	Get an Amount of items from the Store

	@return ItemData
]=]
function Store:GetItems(Count: number?, SortDirection: Enum.SortDirection?): {[string]: Types.ItemData}
	local DataMap: MemoryStoreSortedMap = self.DataMap

	local RawData: {{key: string, value: {}}} = DataMap:GetRangeAsync(SortDirection or Enum.SortDirection.Descending, Count or 10)
	if not (RawData) then return end

	local Data = {}

	for _, Info in RawData do
		Data[Info.key] = Info.value
	end

	return Data
end

return Store