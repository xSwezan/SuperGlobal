local Types = {}

--[=[
	@type ItemData string | number | table
	@within Store
]=]
export type ItemData = string | number | table

--[=[
	@interface StoreType
	.AddItem (self: Store, Key: string, Data: ItemData, Expiration: number?) -> nil;
	.RemoveItem (self: Store, Key: string) -> nil;
	
	.GetItem (self: Store, Key: string) -> ItemData?;
	.GetItems (Count: number?, SortDirection: Enum.SortDirection?) -> {[string]: ItemData};

	.ItemAdded RBXScriptSignal;
	.ItemRemoved RBXScriptSignal;

	@within Store
]=]
export type Store = {
	AddItem: (self: Store, Key: string, Data: ItemData, Expiration: number?) -> nil;
	RemoveItem: (self: Store, Key: string) -> nil;
	
	GetItem: (self: Store, Key: string) -> ItemData?;
	GetItems: (Count: number?, SortDirection: Enum.SortDirection?) -> {[string]: ItemData};

	ItemAdded: RBXScriptSignal;
	ItemRemoved: RBXScriptSignal;
}

export type SuperGlobal = {
	GetStore: (StoreName: string) -> Store;
}

return Types