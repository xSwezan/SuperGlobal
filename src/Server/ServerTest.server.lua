local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local SuperGlobal = require(ReplicatedStorage:WaitForChild("MainModule"))

local Market = SuperGlobal:GetStore("Market")

local function CreateListing(Key, Data)
	local NewListing = Instance.new("IntValue")
	NewListing.Name = Key
	NewListing.Value = Data.Cost
	NewListing:SetAttribute("Item", Data.Item)
	NewListing:SetAttribute("Name", Data.Name)
	NewListing.Parent = ReplicatedStorage:WaitForChild("Listings")
end

for Key, Data in Market:GetItems(10) do
	CreateListing(Key, Data)
end

Market.ItemAdded:Connect(function(Key: string)
	local Data = Market:GetItem(Key)
	if not (Data) then return end

	CreateListing(Key, Data)
end)

Market.ItemRemoved:Connect(function(Key: string)
	
end)

ReplicatedStorage:WaitForChild("CreateListing").OnServerEvent:Connect(function(Player: Player, Data: {Name: string, Cost: number})
	if not (typeof(Data) == "table") then return end

	local FilteredText: string?
	local Success = pcall(function()
		FilteredText = TextService:FilterStringAsync(Data.Name, Player.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForBroadcastAsync()
	end)

	if not (Success) then return end

	print(FilteredText, Data.Name)

	if (FilteredText ~= Data.Name) then return warn("Couldn't create a listing with the name:", Data.Name or "") end

	local ItemKey = ("%s-%s"):format(Player.UserId, Data.Name)
	Market:AddItem(ItemKey,{
		Item = FilteredText;
		Cost = Data.Cost;
		Name = Player.Name;
	})
end)

ReplicatedStorage:WaitForChild("RemoveListing").OnServerEvent:Connect(function(Player: Player, Name: string)
	local ItemKey = ("%s-%s"):format(Player.UserId, Name or "")
	Market:RemoveItem(ItemKey)
end)