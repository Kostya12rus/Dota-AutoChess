local AutoChestHelper = {}
local KostyaUtils = require("KostyaUtils/Utils")

AutoChestHelper.TrigerActiv =        Menu.AddOption({"Kostya12rus","AutoChest Helper"}, "Enabling|Disabling Script", "")
AutoChestHelper.AutoChessStack =     Menu.AddOption({"Kostya12rus","AutoChest Helper","Игровой помощник"}, "Помощь в стаке", "Помогает вам собрать из маленького в большого юнита")
AutoChestHelper.AutoChessItem =      Menu.AddOption({"Kostya12rus","AutoChest Helper","Игровой помощник"}, "Подбирать вещи", "Автоматически собирает лежащие вещи")
AutoChestHelper.AutoChessMoveToPos = Menu.AddOption({"Kostya12rus","AutoChest Helper","Игровой помощник"}, "Занимать оптимальную позицию", "курьер автоматически бежит на оптимальную позицию")

AutoChestHelper.AutoChessPlayers =   Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Таблица игроков", "Создает таблицу на экране, которую можно открыть и закрыть")
AutoChestHelper.AutoChessConsole =   Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Информация в консоли", "Перед игрой пишет статистику о игроках в консоль чита")
AutoChestHelper.AutoChessChessHero = Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Рисовать шахматы под игроками", "Рисует иконки шахмат и их количество у каждого игрока")
AutoChestHelper.AutoChessAllChess =  Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Рисовать таблицу шахмат", "Рисует иконками таблицу всех шахмат и их количество")
AutoChestHelper.AutoChessDrowItem =  Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Рисовать лежащие вещи", "Рисует иконками вещи на земле")
AutoChestHelper.AutoChessWinChance = Menu.AddOption({"Kostya12rus","AutoChest Helper","Графический помощник"}, "Показывать возможный шанс победы", "Показывает счетчит возможной победы")




--AutoChestHelper.Key =        Menu.AddKeyOption({"Kostya12rus","AutoChest Helper"}, " ", Enum.ButtonCode.BUTTON_CODE_NONE)
--AutoChestHelper.Slider =        Menu.AddOption({"Kostya12rus","AutoChest Helper"}, " ", "", 0, 1, 100000)
AutoChestHelper.Font = Renderer.LoadFont("Tahoma", 23, Enum.FontWeight.EXTRABOLD)
AutoChestHelper.Font1 = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)

AutoChestHelper.Spots = 
{
    {
        pos1 = Vector(-3015.232421875, 2955.3837890625, 136.70153808594),
        pos2 = Vector(-1049.0877685547, 1117.1684570313, 136.70166015625),
        pos3 = Vector(-2557.3735351563, 1523.9616699219, 384.0),
        pos4 = Vector(-1561.5209960938, 1414.1791992188, 384.0),
        pos5 = Vector(-2047.0317382813, 1652.8146972656, 384.0)
    },
    {
        pos1 = Vector(-1001.8231811523, 2918.853515625, 136.70166015625),
        pos2 = Vector(977.33673095703, 1124.9624023438, 136.70166015625),
        pos3 = Vector(-508.2702331543, 1524.259765625, 384.0),
        pos4 = Vector(498.20077514648, 1418.4786376953, 384.0),
        pos5 = Vector(-0.954345703125, 1662.525390625, 384.0)
    },
    {
        pos1 = Vector(1030.9058837891, 2945.1235351563, 136.70178222656), 
        pos2 = Vector(3003.2485351563, 1080.7349853516, 136.70166015625),
        pos3 = Vector(1535.9860839844, 1522.7668457031, 384.0),
        pos4 = Vector(2551.0185546875, 1411.8171386719, 384.0),
        pos5 = Vector(2048.1848144531, 1660.8583984375, 384.0)
    },
    {
        pos1 = Vector(-3099.9787597656, 901.83441162109, 136.70166015625), 
        pos2 = Vector(-1054.8946533203, -952.1181640625, 136.70166015625),
        pos3 = Vector(-2552.5551757813, -524.70532226563, 384.0),
        pos4 = Vector(-1536.330078125, -630.302734375, 384.0),
        pos5 = Vector(-2047.9554443359, -385.98382568359, 384.0)
    },
    {
        pos1 = Vector(1020.7689819336, 938.02075195313, 136.70178222656), 
        pos2 = Vector(3020.7768554688, -992.51928710938, 136.70178222656),
        pos3 = Vector(1546.8913574219, -530.4560546875, 384.0),
        pos4 = Vector(2559.1896972656, -629.76568603516, 384.0),
        pos5 = Vector(2045.9573974609, -387.5891418457, 384.0)
    },
    {
        pos1 = Vector(-3097.0329589844, -1179.6909179688, 136.70178222656), 
        pos2 = Vector(-1040.4088134766, -2992.0891113281, 136.70166015625),
        pos3 = Vector(-2552.3176269531, -2564.6018066406, 384.0),
        pos4 = Vector(-1542.5319824219, -2672.9814453125, 384.0),
        pos5 = Vector(-2045.99609375, -2438.8073730469, 384.0)
    },
    {
        pos1 = Vector(-992.06555175781, -1141.9373779297, 136.70166015625), 
        pos2 = Vector(949.35418701172, -3016.4772949219, 136.70166015625),
        pos3 = Vector(-501.90307617188, -2574.2624511719, 384.0),
        pos4 = Vector(510.12664794922, -2664.5725097656, 384.0),
        pos5 = Vector(-0.30775451660156, -2432.1042480469, 384.0)
    },
    {
        pos1 = Vector(1015.9002685547, -1132.0100097656, 136.70166015625), 
        pos2 = Vector(3070.5297851563, -3020.6591796875, 136.70166015625),
        pos3 = Vector(1542.8742675781, -2577.1818847656, 384.0),
        pos4 = Vector(2543.6459960938, -2671.1875, 384.0),
        pos5 = Vector(2049.2346191406, -2436.1518554688, 384.0)
    }
}

AutoChestHelper.Chess =
{		
    ["npc_dota_hero_tusk"] = 'chess_tusk',
    ["npc_dota_hero_axe"] = 'chess_axe',
    ["npc_dota_hero_enchantress"] = 'chess_eh',
    ["npc_dota_hero_ogre_magi"] = 'chess_om',
    ["npc_dota_hero_rattletrap"] = 'chess_clock',
    ["npc_dota_hero_shadow_shaman"] = 'chess_ss',
    ["npc_dota_hero_bounty_hunter"] = 'chess_bh',
    ["npc_dota_hero_batrider"] = 'chess_bat',
    ["npc_dota_hero_drow_ranger"] = 'chess_dr',
    ["npc_dota_hero_tinker"] = 'chess_tk',
    ["npc_dota_hero_antimage"] = 'chess_am',
    ["npc_dota_hero_tiny"] = 'chess_tiny',
    
    ["npc_dota_hero_beastmaster"] = 'chess_bm',
    ["npc_dota_hero_juggernaut"] = 'chess_jugg',
    ["npc_dota_hero_shredder"] = 'chess_shredder',
    ["npc_dota_hero_puck"] = 'chess_puck',
    ["npc_dota_hero_chaos_knight"] = 'chess_ck',
    ["npc_dota_hero_slardar"] = 'chess_slardar',
    ["npc_dota_hero_luna"] = 'chess_luna',
    ["npc_dota_hero_treant"] = 'chess_tp',
    ["npc_dota_hero_queenofpain"] = 'chess_qop',
    ["npc_dota_hero_witch_doctor"] = 'chess_wd',
    ["npc_dota_hero_crystal_maiden"] = 'chess_cm',
    ["npc_dota_hero_furion"] = 'chess_fur',
    ["npc_dota_hero_morphling"] = 'chess_morph',
    
    ["npc_dota_hero_omniknight"] = 'chess_ok',
    ["npc_dota_hero_razor"] = 'chess_razor',
    ["npc_dota_hero_windrunner"] = 'chess_wr',
    ["npc_dota_hero_sand_king"] = 'chess_sk',
    ["npc_dota_hero_abaddon"] = 'chess_abaddon',
    ["npc_dota_hero_slark"] = 'chess_slark',
    ["npc_dota_hero_sniper"] = 'chess_sniper',
    ["npc_dota_hero_nevermore"] = 'chess_sf',
    ["npc_dota_hero_viper"] = 'chess_viper',
    ["npc_dota_hero_lycan"] = 'chess_lyc',
    ["npc_dota_hero_phantom_assassin"] = 'chess_pa',
    ["npc_dota_hero_venomancer"] = 'chess_veno',
    ["npc_dota_hero_lina"] = 'chess_lina',
    ["npc_dota_hero_terrorblade"] = 'chess_tb',
    
    ["npc_dota_hero_kunkka"] = 'chess_kunkka',
    ["npc_dota_hero_doom_bringer"] = 'chess_doom',
    ["npc_dota_hero_troll_warlord"] = 'chess_troll',
    ["npc_dota_hero_necrolyte"] = 'chess_nec',
    ["npc_dota_hero_templar_assassin"] = 'chess_ta',
    ["npc_dota_hero_medusa"] = 'chess_medusa',
    ["npc_dota_hero_disruptor"] = 'chess_disruptor',
    ["npc_dota_hero_alchemist"] = 'chess_ga',
    ["npc_dota_hero_dragon_knight"] = 'chess_dk',
    ["npc_dota_hero_keeper_of_the_light"] = 'chess_light',
    ["npc_dota_hero_lone_druid"] = 'chess_ld',
    
    ["npc_dota_hero_gyrocopter"] = 'chess_gyro',
    ["npc_dota_hero_lich"] = 'chess_lich',
    ["npc_dota_hero_tidehunter"] = 'chess_th',
    ["npc_dota_hero_enigma"] = 'chess_enigma',
    ["npc_dota_hero_techies"] = 'chess_tech'
}

function AutoChestHelper.OnDraw()
    if Menu.IsEnabled(AutoChestHelper.TrigerActiv) and Engine.IsInGame() then
        AutoChestHelper.AllNpc = {}
        for i,j in pairs(Heroes.GetAll()) do --создание списка нпс у героев
            if not AutoChestHelper.CountNpc then
                AutoChestHelper.CountNpc = {}
            end
            if j and Heroes.Contains(j) and Entity.IsAlive(j) then
                if AutoChestHelper.GetCountAllNPC(j) then
                    if not AutoChestHelper.CountNpc[j] then
                        AutoChestHelper.CountNpc[j] = {}
                    end
                    AutoChestHelper.CountNpc[j] = AutoChestHelper.GetCountAllNPC(j)
                end
                if AutoChestHelper.CountNpc[j] then
                    Renderer.SetDrawColor(255, 255, 255, 255)
                    local x,y,v = KostyaUtils.WorldToScreen(j)
                    local sizeimg = 20
                    local x = math.floor(x - (sizeimg*0.5*AutoChestHelper.tablemax(AutoChestHelper.CountNpc[j]))) 
                    for name,count in pairs(AutoChestHelper.CountNpc[j]) do
                        if not AutoChestHelper.AllNpc[name] then
                            AutoChestHelper.AllNpc[name] = 0
                        end
                        AutoChestHelper.AllNpc[name] = AutoChestHelper.AllNpc[name] + count
                        local img = KostyaUtils.LoadingImgFullName("panorama/images/heroes/selection/".. name .. "_png.vtex_c")
                        if img and v and Menu.IsEnabled(AutoChestHelper.AutoChessChessHero) then
                            Renderer.DrawImage(img, x, y, math.floor(sizeimg), math.floor(sizeimg*1.2))
                            Renderer.DrawTextCentered(AutoChestHelper.Font, math.floor(x + sizeimg * 0.5), math.floor(y + sizeimg * 1.5), count, 1)
                            x = x + sizeimg
                        end
                    end
                end
            end
        end
        if AutoChestHelper.AllNpc then -- создание таблицы всех нпс
            local counttable = {}
            for i,j in pairs(AutoChestHelper.AllNpc) do
                if i and j then
                    table.insert(counttable, {i, j})
                end
            end
            if counttable then
                table.sort (counttable, function (a, b) return (a[2] > b[2]) end)
                local x,y = 10,400
                for i,j in pairs(counttable) do
                    local img = KostyaUtils.LoadingImgFullName("panorama/images/heroes/selection/".. j[1] .. "_png.vtex_c")
                    if img then
                        Renderer.SetDrawColor(255, 255, 255, 255)
                        if Menu.IsEnabled(AutoChestHelper.AutoChessAllChess) then
                            Renderer.DrawImage(img, x, y, 20, 23)
                            if AutoChestHelper.FindHasUnit(j[1],Heroes.GetLocal()) then
                                Renderer.SetDrawColor(255, 0, 0, 255)
                            else
                                Renderer.SetDrawColor(255, 255, 255, 255)
                            end
                            Renderer.DrawTextCentered(AutoChestHelper.Font, x + 30, y + 11, j[2], 1)
                            y = y + 25
                        end
                        if y > 700 then
                            x = x + 50
                            y = 400
                        end
                    end
                end
            end
        end
        if HTTP.IsHostWhitelisted("101.200.189.65") then --- поиск статистики игроков
            for _,player in pairs(Players.GetAll()) do
                if player and Players.Contains(player) then
                    if Player.GetPlayerData(player) then
                        if not AutoChestHelper.PlayerGametable then
                            AutoChestHelper.PlayerGametable = {}
                        end
                        if not AutoChestHelper.PlayerGametable[player] then
                            local steamids = Player.GetPlayerData(player).steamid
                            if steamids and AutoChestHelper.Steam32id(steamids) > 0 and AutoChestHelper.Steam32id(steamids) < 9387111184 then
                                AutoChestHelper.PlayerGametable[player] = 
                                {
                                    connect1 = HTTP.NewConnection("http://101.200.189.65:431/dac/heros/get/@" .. steamids),
                                    connect2 = HTTP.NewConnection("http://101.200.189.65:431/dac/ranking/get?player_ids=" .. steamids),
                                    rqst1 = nil,
                                    rqst2 = nil,
                                    match = nil,
                                    rank = nil,
                                    mmr = nil,
                                    needwrite = true
                                }
                            end
                        end
                        if AutoChestHelper.PlayerGametable[player] then
                            if not AutoChestHelper.PlayerGametable[player].match or not AutoChestHelper.PlayerGametable[player].rank then
                                if not AutoChestHelper.PlayerGametable[player].rqst1 or not AutoChestHelper.PlayerGametable[player].rqst1:IsValid() then
                                    AutoChestHelper.PlayerGametable[player].rqst1 = AutoChestHelper.PlayerGametable[player].connect1:AsyncRequest("GET")
                                end
                                if  AutoChestHelper.PlayerGametable[player].rqst1 
                                and AutoChestHelper.PlayerGametable[player].rqst1:IsValid() 
                                and AutoChestHelper.PlayerGametable[player].rqst1:IsResolved() then
                                    local body = AutoChestHelper.PlayerGametable[player].rqst1:Get()
                                    local result = JSON.Decode(body)
                                    if string.find(body,"success") and result then
                                        local gamest = result.user_info
                                        if gamest then
                                            for i,j in pairs(gamest) do
                                                if j.match then
                                                    AutoChestHelper.PlayerGametable[player].match = j.match
                                                else
                                                    AutoChestHelper.PlayerGametable[player].match = 0.0
                                                end
                                                if j.mmr_level then
                                                    AutoChestHelper.PlayerGametable[player].rank = j.mmr_level
                                                else
                                                    AutoChestHelper.PlayerGametable[player].rank = 0.0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            ---------------------------
                            if not AutoChestHelper.PlayerGametable[player].mmr then
                                if not AutoChestHelper.PlayerGametable[player].rqst2 or not AutoChestHelper.PlayerGametable[player].rqst2:IsValid() then
                                    AutoChestHelper.PlayerGametable[player].rqst2 = AutoChestHelper.PlayerGametable[player].connect2:AsyncRequest("GET")
                                end
                                if  AutoChestHelper.PlayerGametable[player].rqst2 
                                and AutoChestHelper.PlayerGametable[player].rqst2:IsValid() 
                                and AutoChestHelper.PlayerGametable[player].rqst2:IsResolved() then
                                    local body = AutoChestHelper.PlayerGametable[player].rqst2:Get()
                                    local result = JSON.Decode(body)
                                    if string.find(body,"success") and result then
                                        local gamest = result.ranking_info
                                        if gamest then
                                            for i,j in pairs(gamest) do
                                                if j.score then
                                                    AutoChestHelper.PlayerGametable[player].mmr = j.score
                                                else
                                                    AutoChestHelper.PlayerGametable[player].mmr = 0.0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if AutoChestHelper.PlayerGametable[player].needwrite then
                                if AutoChestHelper.PlayerGametable[player].mmr and AutoChestHelper.PlayerGametable[player].match and AutoChestHelper.PlayerGametable[player].rank then
                                    if Menu.IsEnabled(AutoChestHelper.AutoChessConsole) then
                                        Console.Print
                                        (
                                            "----[AutoChess]---- " .. 
                                            Player.GetName(player) .." - ".. 
                                            AutoChestHelper.PlayerGametable[player].match .. " сыгранно игр, " ..
                                            AutoChestHelper.PlayerGametable[player].mmr .. " ммр, " ..
                                            AutoChestHelper.PlayerGametable[player].rank .. " ранг"
                                        )
                                    end
                                    AutoChestHelper.PlayerGametable[player].needwrite = false
                                end
                            end
                        end
                    end
                end
            end
        end
        if Heroes.GetLocal() and Menu.IsEnabled(AutoChestHelper.AutoChessPlayers) then -- таблица игроков
            local x,y = 320,30
            if AutoChestHelper.DrawTable then
                Renderer.SetDrawColor(0, 255, 0, 200)
            else
                Renderer.SetDrawColor(255, 0, 0, 200)
            end
            Renderer.DrawFilledRect(x-30, y-20, 20, 20)
            if Input.IsCursorInRect(x-30, y-20, 20, 20) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
                AutoChestHelper.DrawTable = not AutoChestHelper.DrawTable
            end
            if AutoChestHelper.DrawTable then
                local first = true
                for i,j in pairs(Heroes.GetAll()) do
                    if j and Heroes.Contains(j) and NPCs.Contains(j) then
                        local playerdata = AutoChestHelper.FindPlayer(Hero.GetPlayerID(j))
                        if playerdata then
                            Renderer.SetDrawColor(255, 255, 255, 255)
                            local name = tostring(Player.GetName(playerdata)) 
                            if name then
                                if string.len(name) > 10 then
                                    name = string.sub(name, 0, 10)
                                end
                                Renderer.DrawText(AutoChestHelper.Font1, x, y, name, 1)
                                if first then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "Nickname", 1)
                                end
                                x = x + 100
                            end
                            local hp = Entity.GetHealth(j)
                            if hp then
                                Renderer.DrawText(AutoChestHelper.Font1, x, y, math.floor(hp), 1)
                                if first then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "Health", 1)
                                end
                                x = x + 50
                            end
                            local mana = NPC.GetMana(j)
                            if mana then
                                Renderer.DrawText(AutoChestHelper.Font1, x, y, math.floor(mana), 1)
                                if first then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "Gold", 1)
                                end
                                x = x + 50
                            end
                            local playerinfo = AutoChestHelper.PlayerGametable[playerdata]
                            if playerinfo then
                                local match = playerinfo.match
                                if match then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y, math.floor(match), 1)
                                    if first then
                                        Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "Matches", 1)
                                    end
                                    x = x + 50
                                end
                                local rank = playerinfo.rank
                                if rank then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y, math.floor(rank), 1)
                                    if first then
                                        Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "Rank", 1)
                                    end
                                    x = x + 50
                                end
                                local mmr = playerinfo.mmr
                                if mmr then
                                    Renderer.DrawText(AutoChestHelper.Font1, x, y, math.floor(mmr), 1)
                                    h,w = Renderer.MeasureText(AutoChestHelper.Font1, mmr)
                                    if first then
                                        Renderer.DrawText(AutoChestHelper.Font1, x, y-20, "MMR", 1)
                                    end
                                    x = x + 50
                                end
                            end
                            
                            if first then
                                first = false
                            end
                            y = y + 20
                            x = 320
                        end
                    end
                end
            end
        end
    end
    
    if not AutoChestHelper.CanWork then return end

    if Menu.IsEnabled(AutoChestHelper.AutoChessStack) then -- стак юнитов в одного большого
        local skill1 = NPC.GetAbility(AutoChestHelper.Hero, "pick_chess")
        local x,y = 1000,500
        if skill1 and Ability.IsCastable(skill1, 0) and Ability.IsActivated(skill1) then
            local tablenpscount = AutoChestHelper.SimpleFindNpcHelper()
            for i,j in pairs(tablenpscount) do
                if j and j > 2 then
                    Renderer.DrawTextCentered(AutoChestHelper.Font, 1000,500, "Можно создать большого юнита нажмите левую кнопку мыши", 1)
                    AutoChestHelper.NeedStackUnit(i)
                end
            end
        end
    end
    if Menu.IsEnabled(AutoChestHelper.AutoChessWinChance) then --создание надписи шанс на победу
        local size_x, size_y = Renderer.GetScreenSize()
        size_x, size_y = size_x * 0.5, size_y*0.3
        if AutoChestHelper.WinChance then
            Renderer.DrawTextCentered(AutoChestHelper.Font, size_x, size_y, AutoChestHelper.WinChance, 1)
        else
            Renderer.DrawTextCentered(AutoChestHelper.Font, size_x, size_y, "Round not started", 1)
        end
    end
    if Menu.IsEnabled(AutoChestHelper.AutoChessDrowItem) then -- функция рисования иконок предметов на земле и подберание их 
        local items = PhysicalItems.GetAll()
        AutoChestHelper.MyBoxHasItem = false
        for i,j in pairs(items) do
            if j and PhysicalItems.Contains(j) then
                local item = PhysicalItem.GetItem(j)
                if item and Entity.IsAbility(item) and AutoChestHelper.ObjectInBox(AutoChestHelper.MyBox.pos1,AutoChestHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                    local x, y, v = KostyaUtils.WorldToScreen(Entity.GetAbsOrigin(j))
                    if v then
                        local img = KostyaUtils.LoadingImgFullName("panorama/images/items/".. string.gsub(Ability.GetTextureName(item),"item_","")  .."_png.vtex_c")
                        if img then
                            Renderer.DrawImage(img, x-16, y, 32, 32)
                            AutoChestHelper.MyBoxHasItem = true
                            if not NPC.IsRunning(AutoChestHelper.Hero) and Menu.IsEnabled(AutoChestHelper.AutoChessItem) then
                                Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PICKUP_ITEM, j, Vector(0, 0, 0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_SELECTED_UNITS, AutoChestHelper.Hero)
                            end
                        end
                    end
                end
            end
        end
    end
end

function AutoChestHelper.OnUpdate()
    AutoChestHelper.CanWork = false
    if not Menu.IsEnabled(AutoChestHelper.TrigerActiv) or not Engine.IsInGame() then return end
    if not AutoChestHelper.Hero or not Heroes.Contains(AutoChestHelper.Hero) then
        AutoChestHelper.Hero = Heroes.GetLocal()
    end
    if not AutoChestHelper.Hero or not NPCs.Contains(AutoChestHelper.Hero) then return end
    if not AutoChestHelper.MyBox then -- поиск своего спота на карте
        AutoChestHelper.MyBox = {}
        AutoChestHelper.MyBox.pos1,AutoChestHelper.MyBox.pos2,AutoChestHelper.Ipos = AutoChestHelper.FindMyBox()
    end
    AutoChestHelper.MyNpcs,AutoChestHelper.EnemyNpcs = AutoChestHelper.TableNpcOnBox(AutoChestHelper.MyBox.pos1,AutoChestHelper.MyBox.pos2)
    
    if not AutoChestHelper.MyBoxHasItem and AutoChestHelper.Ipos then -- бежать герою на оптимальную позицию
        local needpos = AutoChestHelper.Spots[AutoChestHelper.Ipos].pos5
        if KostyaUtils.Distance2Objects(AutoChestHelper.Hero, needpos) > 100 then
            if not NPC.IsRunning(AutoChestHelper.Hero) and Menu.IsEnabled(AutoChestHelper.AutoChessMoveToPos) then
                NPC.MoveTo(AutoChestHelper.Hero, needpos)
            end
        end
    end

    do -- создание ДПС для моей команды и противника
        if AutoChestHelper.MyNpcs and AutoChestHelper.EnemyNpcs then
            AutoChestHelper.MyBox.MyDps,AutoChestHelper.MyBox.MyHp = AutoChestHelper.FindDpsOnSec(AutoChestHelper.MyNpcs,1)
            AutoChestHelper.MyBox.EnemyDps,AutoChestHelper.MyBox.EnemyHp = AutoChestHelper.FindDpsOnSec(AutoChestHelper.EnemyNpcs,1)
            local howsecondsformesec, howsecondsforenemysec = 0,0
            if AutoChestHelper.MyBox.MyDps > 0 then
                howsecondsformesec = AutoChestHelper.MyBox.EnemyHp/AutoChestHelper.MyBox.MyDps
            end
            if AutoChestHelper.MyBox.EnemyDps > 0 then
                howsecondsforenemysec = AutoChestHelper.MyBox.MyHp/AutoChestHelper.MyBox.EnemyDps
            end
            if howsecondsforenemysec ~= 0 and howsecondsformesec ~= 0 then
                local temp = howsecondsforenemysec - howsecondsformesec
                    AutoChestHelper.WinChance = temp
            else
                AutoChestHelper.WinChance = nil
            end

        end
    end
    AutoChestHelper.CanWork = true
end

function AutoChestHelper.FindPlayer(id)
    if not id then return end
    for i,j in pairs(Players.GetAll()) do
        if j and Players.Contains(j) then
            if Player.GetPlayerID(j) == id then
                return j
            end
        end
    end
    return nil
end

function AutoChestHelper.tablemax(table)
    if not table then return 0 end
    local count = 0 
    for i,j in pairs(table) do
        if i and j then
            count = count + 1
        end
    end
    return count
end

function AutoChestHelper.FindHasUnit(unit,owner)
    if not unit or not owner or not Entity.IsAlive(owner) or not NPCs.Contains(owner) then return false end
    if AutoChestHelper.CountNpc[owner] then
        for name,count in pairs(AutoChestHelper.CountNpc[owner]) do
            if name == unit then
                return true
            end
        end
    end
    return false
end

function AutoChestHelper.GetCountAllNPC(hero)
    local temp = nil
    local npcs = NPCs.GetAll()
    local tableposnpc = AutoChestHelper.FountSpotNpc(hero)
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and NPC.IsCreep(j) and Entity.IsAlive(j) and AutoChestHelper.ObjectInBox(tableposnpc.pos1,tableposnpc.pos2,Entity.GetAbsOrigin(j)) then
            if Entity.IsSameTeam(j, hero) and NPC.HasState(j, Enum.ModifierState.MODIFIER_STATE_NO_HEALTH_BAR) then
                for o,p in pairs(AutoChestHelper.Chess) do
                    if string.find(NPC.GetUnitName(j),p) then
                        if not temp then 
                            temp = {}
                        end
                        if not temp[o] then
                            temp[o] = 0
                        end
                        if temp[o] then
                            if string.find(NPC.GetUnitName(j),"11") then
                                temp[o] = temp[o] + 9
                            elseif string.find(NPC.GetUnitName(j),"1") then
                                temp[o] = temp[o] + 3
                            else
                                temp[o] = temp[o] + 1
                            end
                        end
                    end
                end
            else
                return nil
            end
        end
    end
    return temp
end

function AutoChestHelper.FountSpotNpc(npc)
    if not npc or not NPCs.Contains(npc) then return end
    for i,j in pairs(AutoChestHelper.Spots) do
        if AutoChestHelper.ObjectInBox(j.pos1,j.pos2, Entity.GetAbsOrigin(npc)) then
            return j
        end
    end
end

function AutoChestHelper.NeedStackUnit(nameunit)
    if not nameunit then return end
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsCreep(j) and Entity.IsSameTeam(j, AutoChestHelper.Hero) and NPC.GetUnitName(j) == nameunit then
            if AutoChestHelper.ObjectInBox(AutoChestHelper.MyBox.pos1,AutoChestHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                if AutoChestHelper.ObjectInBox(AutoChestHelper.Spots[AutoChestHelper.Ipos].pos3,AutoChestHelper.Spots[AutoChestHelper.Ipos].pos4,Entity.GetAbsOrigin(j)) then
                    local mod = NPC.GetModifier(j, "modifier_chess_picked")
                    if not mod then
                        local skill1 = NPC.GetAbility(AutoChestHelper.Hero, "pick_chess")
                        if skill1 and Ability.IsCastable(skill1, 0) then
                            Ability.CastTarget(skill1, j)
                        end
                    end
                end
            end
        end
    end
end

function AutoChestHelper.SimpleFindNpcHelper()
    local temptable = {}
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsCreep(j) then
            if AutoChestHelper.ObjectInBox(AutoChestHelper.MyBox.pos1,AutoChestHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                if Entity.IsSameTeam(j, AutoChestHelper.Hero) then
                    if not temptable[NPC.GetUnitName(j)] then
                        temptable[NPC.GetUnitName(j)] = 1
                    else
                        temptable[NPC.GetUnitName(j)] = temptable[NPC.GetUnitName(j)] + 1
                    end
                end
            end
        end
    end
    return temptable
end

function AutoChestHelper.FindDpsOnSec(tablenpcs,sec)
    if not tablenpcs or not sec then return end
    local dpc = 0
    local hpteam = 0
    for i,j in pairs(tablenpcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) then
            hpteam = hpteam + (Entity.GetHealth(j)*(NPC.GetPhysicalDamageReduction(j)+1))
            dpc = dpc + (NPC.GetTrueDamage(j) * NPC.GetAttacksPerSecond(j) * sec)
        end
    end
    return dpc,hpteam
end

function AutoChestHelper.TableNpcOnBox(pos1,pos2)
    if not pos1 or not pos2 then return nil,nil end
    local mynpc = {}
    local enemynpc = {}
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsKillable(j) then
            if Entity.GetAbsOrigin(j) and AutoChestHelper.ObjectInBox(pos1,pos2,Entity.GetAbsOrigin(j)) then
                if Entity.IsSameTeam(j, AutoChestHelper.Hero) then
                    table.insert(mynpc, j)
                else
                    table.insert(enemynpc, j)
                end
            end
        end
    end
    return mynpc,enemynpc
end

function AutoChestHelper.ObjectInBox(object1,object2,checkObject)
    if not object1 or not object2 or not checkObject then return end
    local x1,y1 = object1:GetX(),object1:GetY()
    local x2,y2 = object2:GetX(),object2:GetY()
    local x5,y5 = checkObject:GetX(),checkObject:GetY()
    if x5 > x1 and x5 < x2 then
        if y5 > y2 and y5 < y1 then
            return true
        end
    end
    return false
end

function AutoChestHelper.FindMyBox()
    if AutoChestHelper.Spots then
        for i,j in pairs(AutoChestHelper.Spots) do
            if AutoChestHelper.ObjectInBox(j.pos1,j.pos2, Entity.GetAbsOrigin(Heroes.GetLocal())) then
                return j.pos1,j.pos2,i
            end
        end
    end
end

function AutoChestHelper.Steam32id(Input)
    return Input - 76561197960265728
end

function AutoChestHelper.init()
    Console.Print("------------AutoChestUpdate------------")
    AutoChestHelper.Hero = nil
    AutoChestHelper.MyBox = nil
    AutoChestHelper.WinChance = nil
    AutoChestHelper.MyBoxHasItem = false
    AutoChestHelper.MyNpcsTable = nil
    AutoChestHelper.CountNpc = nil
    AutoChestHelper.DrawTable = true
end

function AutoChestHelper.OnGameStart()
  AutoChestHelper.init()
end
function AutoChestHelper.OnGameEnd()
  AutoChestHelper.init()
  AutoChestHelper.PlayerGametable = {}
end
AutoChestHelper.init()

return AutoChestHelper