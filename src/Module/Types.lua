local Types = {}

export type ItemData = string | number | table

export type Store = {
	AddItem: (self: Store, Key: string, Data: ItemData, Expiration: number?) -> nil;
	GetItem: (self: Store, Key: string) -> ItemData?;
	RemoveItem: (self: Store, Key: string) -> nil;

	GetItems: (Count: number?, SortDirection: Enum.SortDirection?) -> {[string]: ItemData};

	ItemAdded: RBXScriptSignal;
	ItemRemoved: RBXScriptSignal;
}

export type SuperGlobal = {
	GetStore: (StoreName: string) -> Store;
}

return Types