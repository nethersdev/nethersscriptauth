-- =========================================
-- NETTHERS AUTH - PROTECTED SCRIPT
-- =========================================

-- 1. SYSTÈME ANTI-CRACK (HONEYPOT)
-- Ce bloc vérifie si le script est exécuté via le loader officiel.
-- Si la variable "NethersAuthValidated" n'est pas définie, c'est que le script a été volé.
if not (getgenv and getgenv().NethersAuthValidated) then
    local HttpService = game:GetService("HttpService")
    local hwid = "unknown"
    
    pcall(function()
        if gethwid then 
            hwid = gethwid() 
        end
    end)
    
    local player = game:GetService("Players").LocalPlayer
    local userId = player and player.UserId or 0
    local placeId = game.PlaceId
    
    local data = HttpService:JSONEncode({
        hwid = tostring(hwid),
        userId = tostring(userId),
        placeId = tostring(placeId)
    })
    
    -- Envoie l'alerte à ton API en arrière-plan
    pcall(function()
        if syn and syn.request then
            syn.request({ 
                Url = "https://nethers-api.onrender.com/api/leak-detected", 
                Method = "POST", 
                Headers = { ["Content-Type"] = "application/json" }, 
                Body = data 
            })
        elseif request then
            request({ 
                Url = "https://nethers-api.onrender.com/api/leak-detected", 
                Method = "POST", 
                Headers = { ["Content-Type"] = "application/json" }, 
                Body = data 
            })
        end
    end)
end

-- =========================================
-- TON SCRIPT COMMENCE ICI
-- =========================================

-- 👇👇👇 COLLE TON VRAI SCRIPT JUSTE EN DESSOUS 👇👇👇
-- Par exemple, si tu as un script "Élite Optimizer", tu colles tout son code ici.

-- (Supprime ces lignes de commentaire et colle ton code)
