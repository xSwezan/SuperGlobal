---
sidebar_position: 2
---

# Getting Started

### Getting Stores

SuperGlobal lets you to create/get Stores and store data in them.

A Store will let you to Store data and listen for incomming/outgoing data.
Stores can be useful when making a **Global Marketplace System** or a **Global Matchmaking System**.

To get a Store with SuperGlobal you have to use the `:GetStore()` method.

A Store stores Items like this: `{[Key] = Data}`
#### FruitStore Example
```lua
{-- [Key] = Data
	["Apple"] = {
		Cost = 10,
		Amount = 5
	},
	["Banana"] = {
		Cost = 5,
		Amount = 2
	}
}
```

:::tip Store API
More info about Stores are in the [Store documentation](http://xSwezan.github.io/SuperGlobal/api/Store)!
:::

#### Example (Listening to a Store)
```lua
local SuperGlobal = require(PARENT.SuperGlobal)

-- Get the Store
local Marketplace = SuperGlobal:GetStore("Marketplace")

-- Listen for when Items get added into the store (global)
Marketplace.ItemAdded:Connect(function(Key: string)
	-- Get the Data for the Item
	local ItemData = Marketplace:GetItem(Key)
	print(Key, "was added to the Marketplace with data:", ItemData)
end)

-- Listen for when Items get removed from the store (global)
Marketplace.ItemRemoved.Connect(function(Key: string)
	print(Key, "was removed from the Marketplace")
end)
```
#### Example (Manipulating Items in a Store)
```lua
local SuperGlobal = require(PARENT.SuperGlobal)

-- Get the Store
local Marketplace = SuperGlobal:GetStore("Marketplace")

local Item = { -- Doesn't have to be a table!
	Name = "Apple";
	Amount = 3;
	Cost = 15;
	Seller = 116387673; -- UserId for xSwezan
}

-- Add Item to the Marketplace
Marketplace:AddItem("A_Unique_Key", Item)

task.wait(5)

-- Remove the Item from the Marketplace
Marketplace:RemoveItem("A_Unique_Key")
```
:::tip
If you want an expiration you can put `Expiration: number` as the third argument, like this:

```lua
Marketplace:AddItem("A_Unique_Key", Item, 5)
```

Instead of:

```lua
Marketplace:AddItem("A_Unique_Key", Item)

task.wait(5)

Marketplace:RemoveItem("A_Unique_Key")
```
:::