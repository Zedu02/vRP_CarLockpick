local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_lockpick")


vRP.defInventoryItem({"lockpick","Lockpick","Se foloseste pentru a sparge o masina",
		function(args)
				local choices = {}
				choices["> Foloseste"] = {function(source,choice)
						local xPlayer = vRP.getUserId({source})
						if xPlayer ~= nil then
							if vRP.tryGetInventoryItem({xPlayer, "lockpick", 1, true}) then
								TriggerClientEvent("hjalte:open", xPlayer)
						end
					vRP.closeMenu({xPlayer})
				end
		end,""}

		return choices
end, 1.50
})