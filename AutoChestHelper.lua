local AutoChessHelper = {}
local KostyaUtils = require("KostyaUtils/Utils")
local size_x, size_y = Renderer.GetScreenSize()


AutoChessHelper.CurrentTranslation = Menu.AddOption({"Kostya12rus","AutoChest Helper"}, "Translation", "AutoChest Helper Translation language", 1,  2, 1)
Menu.SetValueName(AutoChessHelper.CurrentTranslation, 1, 'Russian')
Menu.SetValueName(AutoChessHelper.CurrentTranslation, 2, 'English')

AutoChessHelper.Translations = 
{
    {
        ["toggle"]                           = " - Включение/Выключение -",
        ["game_helper"]                      = "Игровой помощник",
        ["visual_helper"]                    = "Графический помощник",
        ["print_chess_toggle"]               = " - Включение/Выключение Print Chess -",
        ["print_chess"]                      = "Таблица шахмат",
        ["print_chess_desc"]                 = "Рисует иконками таблицу всех шахмат и их количество",
        ["print_chess_position_on_window"]   = "Позиция на экране Print Chess",
        ["players_table_toggle"]             = " - Включение/Выключение Players Table - ",
        ["players_table"]                    = "Таблица игроков",
        ["players_table_desc"]               = "Создает таблицу игроков на экране, которую можно открыть и закрыть",
        ["players_table_position_on_window"] = "Позиция на экране Players Table",
        ["deck_helper_toggle"]               = " - Включение/Выключение Deck Helper -",
        ["deck_helper"]                      = "Дек хелпер",
        ["deck_helper_desc"]                 = "Помогает выбрать непопулярную колоду и подсвечивает героев в шопе с выбранной деки",
        ["deck_helper_position_on_window"]   = "Позиция на экране Deck Helper",
        ["hero_marker"]                      = "Подсветка героев в магазине",
        ["hero_marker_desc"]                 = "Подсвечивает героев в покупке если они уже имется на доске",
        ["hero_marker_deck_desc"]            = "Подсвечивает героев из билда в окне покупки",
        ["stack_helping"]                    = "Помощь в стаке",
        ["stack_helping_desc"]               = "Помогает вам собрать из маленького в большого юнита",
        ["items_pickup"]                     = "Подбирать вещи",
        ["items_pickup_desc"]                = "Автоматически собирает лежащие вещи",
        ["optimal_position"]                 = "Занимать оптимальную позицию",
        ["optimal_position_desc"]            = "Курьер автоматически бежит на оптимальную позицию",
        ["move_x_desc"]                      = "Перемещение панели по вертикали",
        ["move_y_desc"]                      = "Перемещение панели по горизонтали",
        ["col_size"]                         = "Размер столбца с шахматами",
        ["col_size_desc"]                    = "Изменяет максимальную высоту столбца",
        ["console_info"]                     = "Информация в консоли",
        ["console_info_desc"]                = "Перед игрой пишет статистику о игроках в консоль чита",
        ["draw_chesses_under_players"]       = "Рисовать шахматы под игроками",
        ["draw_chesses_under_players_desc"]  = "Рисует иконки шахмат и их количество у каждого игрока",
        ["draw_items_in_presents"]           = "Рисовать лежащие вещи",
        ["draw_items_in_presents_desc"]      = "Рисует иконками вещи на земле",
        ["win_chance"]                       = "Показывать возможный шанс победы",
        ["win_chance_desc"]                  = "Показывает счетчит возможной победы"
    },
    {
        ["toggle"]                           = " - Enable/Disable Script - ",
        ["game_helper"]                      = "Game helper",
        ["visual_helper"]                    = "Visual helper",
        ["print_chess_toggle"]               = " - Enable/Disable Print Chess - ",
        ["print_chess"]                      = "Print Chess",
        ["print_chess_desc"]                 = "Draw icons table of all chess and their count in game",
        ["print_chess_position_on_window"]   = "Print chess position on window",
        ["players_table_toggle"]             = " - Enable/Disable Players Table - ",
        ["players_table"]                    = "Players Table",
        ["players_table_desc"]               = "Creates a table of players on the screen that can be opened and closed",
        ["players_table_position_on_window"] = "Players table position on window",
        ["deck_helper_toggle"]               = " - Enable/Disable Deck Helper - ",
        ["deck_helper"]                      = "Deck Helper",
        ["deck_helper_desc"]                 = "Helps you to choose an unpopular deck and mark heroes in the shop of that specific deck",
        ["deck_helper_position_on_window"]   = "Deck helper position on window",
        ["hero_marker"]                      = "Hero marker in shop",
        ["hero_marker_desc"]                 = "Show heroes from the chess deck in the purchase window",
        ["hero_marker_deck_desc"]            = "Show heroes from the chosen build in the purchase window",
        ["stack_helping"]                    = "Helps with card collecting",
        ["stack_helping_desc"]               = "Helps you to collect from smaller to larger NPCs",
        ["items_pickup"]                     = "Pick up dropped items",
        ["items_pickup_desc"]                = "Helps to pick up items",
        ["optimal_position"]                 = "Take the optimal position",
        ["optimal_position_desc"]            = "Courier will automatically run at the optimal position",
        ["move_x_desc"]                      = "Move the panel vertically",
        ["move_y_desc"]                      = "Move the panel horizontally",
        ["col_size"]                         = "Chess size of the column",
        ["col_size_desc"]                    = "Chess size of the column",
        ["console_info"]                     = "Console information",
        ["console_info_desc"]                = "Before the game start writes statistics about the players in the cheat console",
        ["draw_chesses_under_players"]       = "Draw chesses under the every player",
        ["draw_chesses_under_players_desc"]  = "Draw chess icons and their number for each player",
        ["draw_items_in_presents"]           = "Draw dropped items icons",
        ["draw_items_in_presents_desc"]      = "Draw items icons under dropped items",
        ["win_chance"]                       = "Show possible chance of winning",
        ["win_chance_desc"]                  = "Show possible chance of winning"
    }
}

function AutoChessHelper.GetTranslate(key)
    local lang = Menu.GetValue(AutoChessHelper.CurrentTranslation)+1
    return AutoChessHelper.Translations[lang][key]
end

AutoChessHelper.TrigerActiv           = Menu.AddOption({ "Kostya12rus", "AutoChest Helper" }, AutoChessHelper.GetTranslate("toggle"), "")
AutoChessHelper.AutoChessStack        = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("game_helper") }, AutoChessHelper.GetTranslate("stack_helping"), AutoChessHelper.GetTranslate("stack_helping_desc"))
AutoChessHelper.AutoChessItem         = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("game_helper") }, AutoChessHelper.GetTranslate("items_pickup"), AutoChessHelper.GetTranslate("items_pickup_desc"))
AutoChessHelper.AutoChessMoveToPos    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("game_helper") }, AutoChessHelper.GetTranslate("optimal_position"), AutoChessHelper.GetTranslate("optimal_position_desc"))
AutoChessHelper.AutoChessblinHero     = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("game_helper") }, AutoChessHelper.GetTranslate("hero_marker"), AutoChessHelper.GetTranslate("hero_marker_desc"))

AutoChessHelper.AutoChessPlayers      = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("players_table") }, AutoChessHelper.GetTranslate("players_table_toggle"), AutoChessHelper.GetTranslate("players_table_desc"))
AutoChessHelper.AutoChessPlayersX     = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("players_table") }, "[X] " .. AutoChessHelper.GetTranslate("players_table_position_on_window"), AutoChessHelper.GetTranslate("move_x_desc"), 0, size_x - 100, 20)
AutoChessHelper.AutoChessPlayersY     = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("players_table") }, "[Y] " .. AutoChessHelper.GetTranslate("players_table_position_on_window"), AutoChessHelper.GetTranslate("move_y_desc"), 0, size_y - 100, 20)
AutoChessHelper.AutoChessAllChess     = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("print_chess") }, AutoChessHelper.GetTranslate("print_chess_toggle"), AutoChessHelper.GetTranslate("print_chess_desc"))
AutoChessHelper.AutoChessAllChessX    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("print_chess") }, "[X] " .. AutoChessHelper.GetTranslate("print_chess_position_on_window"), AutoChessHelper.GetTranslate("move_x_desc"), 0, size_x - 100, 20)
AutoChessHelper.AutoChessAllChessY    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("print_chess") }, "[Y] " .. AutoChessHelper.GetTranslate("print_chess_position_on_window"), AutoChessHelper.GetTranslate("move_y_desc"), 0, size_y - 100, 20)
AutoChessHelper.AutoChessAllChessS    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper"), AutoChessHelper.GetTranslate("print_chess") }, AutoChessHelper.GetTranslate("col_size"), AutoChessHelper.GetTranslate("col_size_desc"), 0, 1000, 20)
AutoChessHelper.AutoChessConsole      = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper") }, AutoChessHelper.GetTranslate("console_info"), AutoChessHelper.GetTranslate("console_info_desc"))
AutoChessHelper.AutoChessChessHero    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper") }, AutoChessHelper.GetTranslate("draw_chesses_under_players"), AutoChessHelper.GetTranslate("draw_chesses_under_players_desc"))
AutoChessHelper.AutoChessDrowItem     = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper") }, AutoChessHelper.GetTranslate("draw_items_in_presents"), AutoChessHelper.GetTranslate("draw_items_in_presents_desc"))
AutoChessHelper.AutoChessWinChance    = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("visual_helper") }, AutoChessHelper.GetTranslate("win_chance"), AutoChessHelper.GetTranslate("win_chance_desc"))

AutoChessHelper.AutoChessDeckBuilder  = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("deck_helper") }, AutoChessHelper.GetTranslate("deck_helper_toggle"), AutoChessHelper.GetTranslate("deck_helper_desc"))
AutoChessHelper.AutoChessDeckblinHero = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("deck_helper") }, AutoChessHelper.GetTranslate("hero_marker"), AutoChessHelper.GetTranslate("hero_marker_deck_desc"))
AutoChessHelper.AutoChessDeckX        = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("deck_helper") }, "[X] " .. AutoChessHelper.GetTranslate("deck_helper_position_on_window"), AutoChessHelper.GetTranslate("move_x_desc"), 0, size_x - 100, 20)
AutoChessHelper.AutoChessDeckY        = Menu.AddOption({ "Kostya12rus", "AutoChest Helper", AutoChessHelper.GetTranslate("deck_helper") }, "[Y] " .. AutoChessHelper.GetTranslate("deck_helper_position_on_window"), AutoChessHelper.GetTranslate("move_y_desc"), 0, size_y - 100, 20)

AutoChessHelper.Font      = Renderer.LoadFont("Tahoma", 23, Enum.FontWeight.EXTRABOLD)
AutoChessHelper.Font1     = Renderer.LoadFont("Tahoma", 15, Enum.FontWeight.EXTRABOLD)
AutoChessHelper.FontChess = Renderer.LoadFont("Tahoma", 50, Enum.FontWeight.EXTRABOLD)

AutoChessHelper.Spots =
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

AutoChessHelper.Chess =
{
    ["chess_tusk"] = 'npc_dota_hero_tusk',
    ["chess_cm"] = 'npc_dota_hero_crystal_maiden',
    ["chess_axe"] = 'npc_dota_hero_axe',
    ["chess_eh"] = 'npc_dota_hero_enchantress',
    ["chess_om"] = 'npc_dota_hero_ogre_magi',
    ["chess_am"] = 'npc_dota_hero_antimage',
    ["chess_clock"] = 'npc_dota_hero_rattletrap',
    ["chess_ss"] = 'npc_dota_hero_shadow_shaman',
    ["chess_bh"] = 'npc_dota_hero_bounty_hunter',
    ["chess_wd"] = 'npc_dota_hero_witch_doctor',
    ["chess_tk"] = 'npc_dota_hero_tinker',
    ["chess_bm"] = 'npc_dota_hero_beastmaster',
    ["chess_jugg"] = 'npc_dota_hero_juggernaut',
    ["chess_lyc"] = 'npc_dota_hero_lycan',
    ["chess_shredder"] = 'npc_dota_hero_shredder',
    ["chess_pa"] = 'npc_dota_hero_phantom_assassin',
    ["chess_puck"] = 'npc_dota_hero_puck',
    ["chess_slardar"] = 'npc_dota_hero_slardar',
    ["chess_ck"] = 'npc_dota_hero_chaos_knight',
    ["chess_dr"] = 'npc_dota_hero_drow_ranger',
    ["chess_light"] = 'npc_dota_hero_keeper_of_the_light',
    ["chess_razor"] = 'npc_dota_hero_razor',
    ["chess_ok"] = 'npc_dota_hero_omniknight',
    ["chess_wr"] = 'npc_dota_hero_windrunner',
    ["chess_sk"] = 'npc_dota_hero_sand_king',
    ["chess_abaddon"] = 'npc_dota_hero_abaddon',
    ["chess_slark"] = 'npc_dota_hero_slark',
    ["chess_sniper"] = 'npc_dota_hero_sniper',
    ["chess_kunkka"] = 'npc_dota_hero_kunkka',
    ["chess_doom"] = 'npc_dota_hero_doom_bringer',
    ["chess_lina"] = 'npc_dota_hero_lina',
    ["chess_troll"] = 'npc_dota_hero_troll_warlord',
    ["chess_veno"] = 'npc_dota_hero_venomancer',
    ["chess_nec"] = 'npc_dota_hero_necrolyte',
    ["chess_ta"] = 'npc_dota_hero_templar_assassin',
    ["chess_gyro"] = 'npc_dota_hero_gyrocopter',
    ["chess_lich"] = 'npc_dota_hero_lich',
    ["chess_qop"] = 'npc_dota_hero_queenofpain',
    ["chess_th"] = 'npc_dota_hero_tidehunter',
    ["chess_enigma"] = 'npc_dota_hero_enigma',

    ["chess_bat"] = 'npc_dota_hero_batrider',
    ["chess_luna"] = 'npc_dota_hero_luna',
    ["chess_tp"] = 'npc_dota_hero_treant',
    ["chess_sf"] = 'npc_dota_hero_nevermore',
    ["chess_dk"] = 'npc_dota_hero_dragon_knight',
    ["chess_viper"] = 'npc_dota_hero_viper',
    ["chess_medusa"] = 'npc_dota_hero_medusa',
    ["chess_disruptor"] = 'npc_dota_hero_disruptor',
    ["chess_ga"] = 'npc_dota_hero_alchemist',
    ["chess_tech"] = 'npc_dota_hero_techies',

    ["chess_fur"] = 'npc_dota_hero_furion',
    ["chess_ld"] = 'npc_dota_hero_lone_druid',
    ["chess_morph"] = 'npc_dota_hero_morphling',
    ["chess_tb"] = 'npc_dota_hero_terrorblade',
    ["chess_tiny"] = 'npc_dota_hero_tiny',
    ["chess_nec_ssr"] = 'npc_dota_hero_necrolyte',
    ["chess_ck_ssr"] = 'npc_dota_hero_chaos_knight'
}

AutoChessHelper.DotaChessXYZ = JSON.Decode('[{"hero":"npc_dota_hero_axe","cost":1},{"hero":"npc_dota_hero_enchantress","cost":1},{"hero":"npc_dota_hero_ogre_magi","cost":1},{"hero":"npc_dota_hero_tusk","cost":1},{"hero":"npc_dota_hero_drow_ranger","cost":1},{"hero":"npc_dota_hero_bounty_hunter","cost":1},{"hero":"npc_dota_hero_rattletrap","cost":1},{"hero":"npc_dota_hero_shadow_shaman","cost":1},{"hero":"npc_dota_hero_batrider","cost":1},{"hero":"npc_dota_hero_tinker","cost":1},{"hero":"npc_dota_hero_antimage","cost":1},{"hero":"npc_dota_hero_crystal_maiden","cost":2},{"hero":"npc_dota_hero_beastmaster","cost":2},{"hero":"npc_dota_hero_juggernaut","cost":2},{"hero":"npc_dota_hero_shredder","cost":2},{"hero":"npc_dota_hero_queenofpain","cost":2},{"hero":"npc_dota_hero_puck","cost":2},{"hero":"npc_dota_hero_witch_doctor","cost":2},{"hero":"npc_dota_hero_slardar","cost":2},{"hero":"npc_dota_hero_chaos_knight","cost":2},{"hero":"npc_dota_hero_treant","cost":2},{"hero":"npc_dota_hero_luna","cost":2},{"hero":"npc_dota_hero_furion","cost":2},{"hero":"npc_dota_hero_lycan","cost":3},{"hero":"npc_dota_hero_venomancer","cost":3},{"hero":"npc_dota_hero_omniknight","cost":3},{"hero":"npc_dota_hero_razor","cost":3},{"hero":"npc_dota_hero_windrunner","cost":3},{"hero":"npc_dota_hero_phantom_assassin","cost":3},{"hero":"npc_dota_hero_abaddon","cost":3},{"hero":"npc_dota_hero_sand_king","cost":3},{"hero":"npc_dota_hero_slark","cost":3},{"hero":"npc_dota_hero_sniper","cost":3},{"hero":"npc_dota_hero_viper","cost":3},{"hero":"npc_dota_hero_nevermore","cost":3},{"hero":"npc_dota_hero_lina","cost":3},{"hero":"npc_dota_hero_doom_bringer","cost":4},{"hero":"npc_dota_hero_kunkka","cost":4},{"hero":"npc_dota_hero_troll_warlord","cost":4},{"hero":"npc_dota_hero_keeper_of_the_light","cost":4},{"hero":"npc_dota_hero_necrolyte","cost":4},{"hero":"npc_dota_hero_templar_assassin","cost":4},{"hero":"npc_dota_hero_alchemist","cost":4},{"hero":"npc_dota_hero_disruptor","cost":4},{"hero":"npc_dota_hero_medusa","cost":4},{"hero":"npc_dota_hero_dragon_knight","cost":4},{"hero":"npc_dota_hero_lone_druid","cost":4},{"hero":"npc_dota_hero_gyrocopter","cost":5},{"hero":"npc_dota_hero_lich","cost":5},{"hero":"npc_dota_hero_tidehunter","cost":5},{"hero":"npc_dota_hero_enigma","cost":5},{"hero":"npc_dota_hero_techies","cost":5},{"hero":"npc_dota_hero_tiny","cost":1},{"hero":"npc_dota_hero_morphling","cost":2},{"hero":"npc_dota_hero_terrorblade","cost":3}]');

AutoChessHelper.Builds = 
{
    {
        ["url"]         = "https://dotachess.xyz/?build=17-3,20-13,24-0,26-52,27-37,28-18,29-23,30-36,31-38&enemy",
        ["description"] = "x9 WARRIORS"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=12-25,17-34,19-19,21-10,23-29,24-15,26-54,28-36,30-45&enemy",
        ["description"] = "Deamons + knights"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-3,17-23,18-22,19-20,20-40,24-1,25-46,26-24,27-30,28-50&enemy",
        ["description"] = "Druids + BEASTs"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=17-8,18-12,19-0,20-13,21-38,26-7,27-43,28-17&enemy",
        ["description"] = "Troll + orc + shamans"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=8-10,9-45,10-20,16-22,17-46,18-41,24-1,25-33,26-16,31-28&enemy",
        ["description"] = "Elf + Druid + Dragons"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-0,17-13,18-3,19-23,20-36,21-38,24-43,25-7,26-8,27-17&enemy",
        ["description"] = "Warriors + Trolls"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-8,17-19,18-25,19-29,20-45,24-21,25-17,26-7,27-38&enemy",
        ["description"] = "knights + Trolls"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-5,17-6,18-14,19-42,24-9,25-51,26-47&enemy",
        ["description"] = "Goblin + Mech"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-12,17-29,18-40,19-49,24-32,25-27,26-4,27-44,28-48&enemy",
        ["description"] = "Hunters + UNDEAD"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=16-5,17-30,18-41,19-40,20-29,24-15,25-28,26-31,27-4,28-48&enemy",
        ["description"] = "Assasins + UNDEAD"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=8-45,9-33,10-50,16-2,17-48,18-16,24-26,25-39,26-35&enemy",
        ["description"] = "Mage + Dragons"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=0-34,2-39,4-26,9-47,11-6,16-42,18-48,20-14,25-50,27-9&enemy",
        ["description"] = "Mech + Mage + Warlocks"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=9-36,10-13,11-12,12-0,13-49,18-4,19-43,20-27,22-44,24-32&enemy",
        ["description"] = "Orc + Hunters"
    },
    {
        ["url"]         = "https://dotachess.xyz/?build=10-28,12-30,19-24,24-41,26-34,27-50,28-31,30-53,31-33&enemy",
        ["description"] = "ASSASSIN + WARLOCK"
    }
}


function AutoChessHelper.OnDraw()
    if GameRules.GetGameMode() ~= 15 then return end
    if Menu.IsEnabled(AutoChessHelper.TrigerActiv) and Engine.IsInGame() then
        AutoChessHelper.AllNpc = {}

        for i,j in pairs(Heroes.GetAll()) do --создание списка нпс у героев
            if not AutoChessHelper.CountNpc then
                AutoChessHelper.CountNpc = {}
            end
            if j and Heroes.Contains(j) and Entity.IsAlive(j) then
                if AutoChessHelper.GetCountAllNPC(j) then
                    if not AutoChessHelper.CountNpc[j] then
                        AutoChessHelper.CountNpc[j] = {}
                    end
                    AutoChessHelper.CountNpc[j] = AutoChessHelper.GetCountAllNPC(j)
                end
                if AutoChessHelper.CountNpc[j] then
                    Renderer.SetDrawColor(255, 255, 255, 255)
                    local x,y,v = KostyaUtils.WorldToScreen(j)
                    local sizeimg = 20
                    local x = math.floor(x - (sizeimg*0.5*AutoChessHelper.tablemax(AutoChessHelper.CountNpc[j])))
                    for name,count in pairs(AutoChessHelper.CountNpc[j]) do
                        if not AutoChessHelper.AllNpc[name] then
                            AutoChessHelper.AllNpc[name] = 0
                        end
                        AutoChessHelper.AllNpc[name] = AutoChessHelper.AllNpc[name] + count
                        local img = KostyaUtils.LoadingImgFullName("panorama/images/heroes/selection/".. name .. "_png.vtex_c")
                        if img and v and Menu.IsEnabled(AutoChessHelper.AutoChessChessHero) then
                            Renderer.DrawImage(img, x, y, math.floor(sizeimg), math.floor(sizeimg*1.2))
                            Renderer.DrawTextCentered(AutoChessHelper.Font, math.floor(x + sizeimg * 0.5), math.floor(y + sizeimg * 1.5), count, 1)
                            x = x + sizeimg
                        end
                    end
                end
            end
        end
        if AutoChessHelper.AllNpc then -- создание таблицы всех нпс
            local counttable = {}
            for i,j in pairs(AutoChessHelper.AllNpc) do
                if i and j then
                    table.insert(counttable, {i, j})
                end
            end
            if counttable then
                table.sort (counttable, function (a, b) return (a[2] > b[2]) end)
                local x,y = Menu.GetValue(AutoChessHelper.AutoChessAllChessX),Menu.GetValue(AutoChessHelper.AutoChessAllChessY)
                for i,j in pairs(counttable) do
                    local img = KostyaUtils.LoadingImgFullName("panorama/images/heroes/selection/".. j[1] .. "_png.vtex_c")
                    if img then
                        Renderer.SetDrawColor(255, 255, 255, 255)
                        if Menu.IsEnabled(AutoChessHelper.AutoChessAllChess) then
                            Renderer.DrawImage(img, x, y, 20, 23)
                            if AutoChessHelper.FindHasUnit(j[1],Heroes.GetLocal()) then
                                Renderer.SetDrawColor(255, 0, 0, 255)
                            else
                                Renderer.SetDrawColor(255, 255, 255, 255)
                            end
                            Renderer.DrawTextCentered(AutoChessHelper.Font, x + 30, y + 11, j[2], 1)
                            y = y + 25
                        end
                        if y - Menu.GetValue(AutoChessHelper.AutoChessAllChessY) > Menu.GetValue(AutoChessHelper.AutoChessAllChessS) then
                            x = x + 50
                            y = Menu.GetValue(AutoChessHelper.AutoChessAllChessY)
                        end
                    end
                end
            end
        end
        if HTTP.IsHostWhitelisted("101.200.189.65") then --- поиск статистики игроков
            for _,player in pairs(Players.GetAll()) do
                if player and Players.Contains(player) then
                    if Player.GetPlayerData(player) then
                        if not AutoChessHelper.PlayerGametable then
                            AutoChessHelper.PlayerGametable = {}
                        end
                        if not AutoChessHelper.PlayerGametable[player] then
                            local steamids = Player.GetPlayerData(player).steamid
                            if steamids and AutoChessHelper.Steam32id(steamids) > 0 and AutoChessHelper.Steam32id(steamids) < 9387111184 then
                                AutoChessHelper.PlayerGametable[player] =
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
                        if AutoChessHelper.PlayerGametable[player] then
                            if not AutoChessHelper.PlayerGametable[player].match or not AutoChessHelper.PlayerGametable[player].rank then
                                if not AutoChessHelper.PlayerGametable[player].rqst1 or not AutoChessHelper.PlayerGametable[player].rqst1:IsValid() then
                                    AutoChessHelper.PlayerGametable[player].rqst1 = AutoChessHelper.PlayerGametable[player].connect1:AsyncRequest("GET")
                                end
                                if  AutoChessHelper.PlayerGametable[player].rqst1
                                        and AutoChessHelper.PlayerGametable[player].rqst1:IsValid()
                                        and AutoChessHelper.PlayerGametable[player].rqst1:IsResolved() then
                                    local body = AutoChessHelper.PlayerGametable[player].rqst1:Get()
                                    local result = JSON.Decode(body)
                                    if string.find(body,"success") and result then
                                        local gamest = result.user_info
                                        if gamest then
                                            for i,j in pairs(gamest) do
                                                if j.match then
                                                    AutoChessHelper.PlayerGametable[player].match = j.match
                                                else
                                                    AutoChessHelper.PlayerGametable[player].match = 0.0
                                                end
                                                if j.mmr_level then
                                                    AutoChessHelper.PlayerGametable[player].rank = j.mmr_level
                                                else
                                                    AutoChessHelper.PlayerGametable[player].rank = 0.0
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            ---------------------------
                            if not AutoChessHelper.PlayerGametable[player].mmr then
                                if not AutoChessHelper.PlayerGametable[player].rqst2 or not AutoChessHelper.PlayerGametable[player].rqst2:IsValid() then
                                    AutoChessHelper.PlayerGametable[player].rqst2 = AutoChessHelper.PlayerGametable[player].connect2:AsyncRequest("GET")
                                end
                                if  AutoChessHelper.PlayerGametable[player].rqst2
                                        and AutoChessHelper.PlayerGametable[player].rqst2:IsValid()
                                        and AutoChessHelper.PlayerGametable[player].rqst2:IsResolved() then
                                    local body = AutoChessHelper.PlayerGametable[player].rqst2:Get()
                                    local result = JSON.Decode(body)
                                    if string.find(body,"success") and result then
                                        local gamest = result.ranking_info
                                        if string.len(body) < 44 then
                                            AutoChessHelper.PlayerGametable[player].mmr = 0
                                        else
                                            if gamest then
                                                for i,j in pairs(gamest) do
                                                    if j.score then
                                                        AutoChessHelper.PlayerGametable[player].mmr = j.score
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if AutoChessHelper.PlayerGametable[player].needwrite then
                                if AutoChessHelper.PlayerGametable[player].mmr and AutoChessHelper.PlayerGametable[player].match and AutoChessHelper.PlayerGametable[player].rank then
                                    if Menu.IsEnabled(AutoChessHelper.AutoChessConsole) then
                                        Console.Print
                                        (
                                                "----[AutoChess]---- " ..
                                                        Player.GetName(player) .." - "..
                                                        AutoChessHelper.PlayerGametable[player].match .. " сыгранно игр, " ..
                                                        AutoChessHelper.PlayerGametable[player].mmr .. " ммр, " ..
                                                        AutoChessHelper.PlayerGametable[player].rank .. " ранг"
                                        )
                                    end
                                    AutoChessHelper.PlayerGametable[player].needwrite = false
                                end
                            end
                        end
                    end
                end
            end
        end
        if Heroes.GetLocal() and Menu.IsEnabled(AutoChessHelper.AutoChessPlayers) then -- таблица игроков
            local x,y = Menu.GetValue(AutoChessHelper.AutoChessPlayersX),Menu.GetValue(AutoChessHelper.AutoChessPlayersY)
            if AutoChessHelper.DrawTable then
                Renderer.SetDrawColor(0, 255, 0, 200)
            else
                Renderer.SetDrawColor(255, 0, 0, 200)
            end
            Renderer.DrawFilledRect(x-30, y-20, 20, 20)
            if Input.IsCursorInRect(x-30, y-20, 20, 20) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
                AutoChessHelper.DrawTable = not AutoChessHelper.DrawTable
            end
            if AutoChessHelper.DrawTable then
                local first = true
                for i,j in pairs(Heroes.GetAll()) do
                    if j and Heroes.Contains(j) and NPCs.Contains(j) then
                        local playerdata = AutoChessHelper.FindPlayer(Hero.GetPlayerID(j))
                        if playerdata then
                            Renderer.SetDrawColor(255, 255, 255, 255)
                            local name = tostring(Player.GetName(playerdata))
                            if name then
                                if string.len(name) > 10 then
                                    name = string.sub(name, 0, 10)
                                end
                                Renderer.DrawText(AutoChessHelper.Font1, x, y, name, 1)
                                if first then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "Nickname", 1)
                                end
                                x = x + 100
                            end
                            local Level = NPC.GetCurrentLevel(j)
                            if Level then
                                Renderer.DrawText(AutoChessHelper.Font1, x, y, math.ceil(Level), 1)
                                if first then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "Level", 1)
                                end
                                x = x + 50
                            end
                            local hp = Entity.GetHealth(j)
                            if hp then
                                Renderer.DrawText(AutoChessHelper.Font1, x, y, math.ceil(hp), 1)
                                if first then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "Health", 1)
                                end
                                x = x + 50
                            end
                            local mana = NPC.GetMana(j)
                            if mana then
                                Renderer.DrawText(AutoChessHelper.Font1, x, y, math.ceil(mana), 1)
                                if first then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "Gold", 1)
                                end
                                x = x + 50
                            end
                            local playerinfo = AutoChessHelper.PlayerGametable[playerdata]
                            if playerinfo then
                                local match = playerinfo.match
                                if match then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y, math.ceil(match), 1)
                                    if first then
                                        Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "Matches", 1)
                                    end
                                    x = x + 50
                                end
                                local mmr = playerinfo.mmr
                                if mmr then
                                    Renderer.DrawText(AutoChessHelper.Font1, x, y, math.ceil(mmr), 1)
                                    h,w = Renderer.MeasureText(AutoChessHelper.Font1, mmr)
                                    if first then
                                        Renderer.DrawText(AutoChessHelper.Font1, x, y-20, "MMR", 1)
                                    end
                                    x = x + 50
                                end
                            end

                            if first then
                                first = false
                            end
                            y = y + 20
                            x = Menu.GetValue(AutoChessHelper.AutoChessPlayersX)
                        end
                    end
                end
            end
        end
    end

    if not AutoChessHelper.CanWork or not AutoChessHelper.Hero then return end

    if Menu.IsEnabled(AutoChessHelper.AutoChessWinChance) then --создание надписи шанс на победу
        local size_x, size_y = Renderer.GetScreenSize()
        size_x, size_y = size_x * 0.5, size_y*0.3
        if AutoChessHelper.WinChance then
            Renderer.DrawTextCentered(AutoChessHelper.Font, size_x, size_y, AutoChessHelper.WinChance, 1)
        else
            Renderer.DrawTextCentered(AutoChessHelper.Font, size_x, size_y, "Round not started", 1)
        end
    end
    if Menu.IsEnabled(AutoChessHelper.AutoChessDrowItem) then -- функция рисования иконок предметов на земле и подберание их 
        local items = PhysicalItems.GetAll()
        AutoChessHelper.MyBoxHasItem = false
        for i,j in pairs(items) do
            if j and PhysicalItems.Contains(j) then
                local item = PhysicalItem.GetItem(j)
                if item and Entity.IsAbility(item) and AutoChessHelper.ObjectInBox(AutoChessHelper.MyBox.pos1,AutoChessHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                    local x, y, v = KostyaUtils.WorldToScreen(Entity.GetAbsOrigin(j))
                    if v then
                        local img = KostyaUtils.LoadingImgFullName("panorama/images/items/".. string.gsub(Ability.GetTextureName(item),"item_","")  .."_png.vtex_c")
                        if img then
                            local sizeimg = 25
                            Renderer.DrawImage(img, x-16, y, math.floor(sizeimg*1.3), math.floor(sizeimg))
                            AutoChessHelper.MyBoxHasItem = true
                            if not NPC.IsRunning(AutoChessHelper.Hero) and Menu.IsEnabled(AutoChessHelper.AutoChessItem) then
                                Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_PICKUP_ITEM, j, Vector(0, 0, 0), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_SELECTED_UNITS, AutoChessHelper.Hero)
                            end
                            if not Menu.IsEnabled(AutoChessHelper.AutoChessItem) then
                                AutoChessHelper.MyBoxHasItem = false
                            end
                        end
                    end
                end
            end
        end
    end
    if AutoChessHelper.StackDraw then -- писать о стаке на экране
        local size_x, size_y = Renderer.GetScreenSize()
        size_x, size_y = size_x * 0.5, size_y * 0.4
        Renderer.DrawTextCentered(AutoChessHelper.Font, size_x, size_y, "Можно создать большого юнита нажмите левую кнопку мыши", 1)
    end

    if Menu.IsEnabled(AutoChessHelper.AutoChessDeckBuilder) then -- DeckBuilder

        local x, y =  Menu.GetValue(AutoChessHelper.AutoChessDeckX),  Menu.GetValue(AutoChessHelper.AutoChessDeckY)
        local padding_x, padding_y = 6, 5
        local image_w, image_h = 24, 27
        local boardmatrix_x, boardmatrix_y = 8, 4

        local pred_x, pred_y, pred_r = x-50, y-40, 30

        if not AutoChessHelper.NeedPrediction then
            Renderer.DrawText(AutoChessHelper.FontChess, pred_x, pred_y - 18, "⟳")
            if Input.IsCursorInRect(pred_x, pred_y, pred_r, pred_r) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
                AutoChessHelper.NeedPrediction = true
            end
        end

        local numofrows = 12
        local row_y = pred_y + 35

        if AutoChessHelper.buildUniques then
            if Input.IsCursorInRect(pred_x - 4, row_y, 50, 12 * numofrows) and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
                for buildn = 0, numofrows do
                    if Input.IsCursorInRect(pred_x - 4, row_y + (buildn * 12), 50, 12) then
                        Console.RunCommand(string.format("ach.choose_build %s", AutoChessHelper.buildUniques[buildn + 1][1]))
                    end
                end
            end
        end

        if AutoChessHelper.buildUniques then
            Renderer.SetDrawColor(185, 214, 124, 255)
            local itemsdrowes = 0

            local colorstep = 255 / numofrows
            for n, m in pairs(AutoChessHelper.buildUniques) do
                Renderer.SetDrawColor(math.floor(colorstep * itemsdrowes), 255 - (itemsdrowes * 12), itemsdrowes, 255)
                Renderer.DrawText(AutoChessHelper.Font1, pred_x - 4, row_y, string.format("%2.2d - %s", m[1], m[2]))

                row_y = row_y + 12

                itemsdrowes = itemsdrowes + 1
                if itemsdrowes >= numofrows then
                    break
                end
            end
            Renderer.SetDrawColor(255, 255, 255, 255)
        end

        if AutoChessHelper.NeedPrediction and not AutoChessHelper.isPredictionWorking then
            -- вычисление самой неповторяющейся сборки
            AutoChessHelper.isPredictionWorking = true
            Alerts.Add(string.format("Find unpopular builds..."), 1)
            AutoChessHelper.buildUniques = {}

            for i, b in ipairs(AutoChessHelper.Builds) do
                local build = AutoChessHelper.getBuildByUrl(b.url)
                local buildHeroes = {}
                for i2, p in pairs(build) do
                    local chp = AutoChessHelper.explode("-", p)
                    local unit_id = tonumber(chp[2])
                    local hero = AutoChessHelper.DotaChessXYZ[unit_id + 1].hero
                    buildHeroes[hero] = unit_id
                end

                local buildCleanPoints = 0
                for t, f in pairs(AutoChessHelper.AllNpc) do

                    local isTeamNpc = Entity.IsSameTeam(NPCs.Get(f), AutoChessHelper.Hero)
                    --Log.Write(string.format("%s is teammate: %s", t, isTeamNpc));

                    if not isTeamNpc then
                        if buildHeroes[t] then
                            buildCleanPoints = buildCleanPoints + 1
                            -- Log.Write(string.format("%s %s",t,f));
                        end
                    end
                end
                -- Log.Write(string.format("build %s - popularity: %s",i, buildCleanPoints));
                table.insert(AutoChessHelper.buildUniques, { i, buildCleanPoints })
            end

            table.sort(AutoChessHelper.buildUniques, function(a, b) return (a[2] < b[2]) end)
            AutoChessHelper.NeedPrediction = false
            AutoChessHelper.isPredictionWorking = false
        end

        if AutoChessHelper.ChoosenBuild then
            -- отрисовка билда

            Renderer.SetDrawColor(255, 255, 255, 45)

            if AutoChessHelper.ChoosenBuildName then
                Renderer.DrawText(AutoChessHelper.Font1, x, y - 15, AutoChessHelper.ChoosenBuildName)
            end

            for i = 0, boardmatrix_x - 1 do
                for j = 0, boardmatrix_y - 1 do
                    Renderer.DrawOutlineRect(x + (i * image_w) + (i * padding_x), y + (j * image_h) + (j * padding_y), image_w, image_h)
                end
            end
            Renderer.SetDrawColor(255, 255, 255, 255)

            for key, pair in pairs(AutoChessHelper.ChoosenBuild) do
                local chp = AutoChessHelper.explode("-", pair)
                local chess_coord = tonumber(chp[1])
                local unit_id = tonumber(chp[2])
                local hero = AutoChessHelper.DotaChessXYZ[unit_id + 1].hero

                local img = KostyaUtils.LoadingImgFullName("panorama/images/heroes/selection/" .. hero .. "_png.vtex_c")
                if img then
                    local row_int = math.floor(chess_coord / boardmatrix_x) - 1
                    local tempx = ((chess_coord - (row_int * boardmatrix_x)) - boardmatrix_x)
                    local cx = x + (tempx * image_w) + (tempx * padding_x)
                    local cy = y + ((row_int + 1) * image_h) + (row_int * padding_y) + padding_y
                    Renderer.DrawImage(img, cx, cy, image_w, image_h)
                end
            end
        end
    end
end

function AutoChessHelper.OnUpdate()
    if GameRules.GetGameMode() ~= 15 then return end
    AutoChessHelper.CanWork = false
    if not Menu.IsEnabled(AutoChessHelper.TrigerActiv) or not Engine.IsInGame() then return end
    if not AutoChessHelper.Hero or not Heroes.Contains(AutoChessHelper.Hero) then
        AutoChessHelper.Hero = Heroes.GetLocal()
    end
    if not AutoChessHelper.Hero or not NPCs.Contains(AutoChessHelper.Hero) then return end
    if not AutoChessHelper.MyBox then -- поиск своего спота на карте
        AutoChessHelper.MyBox = {}
        AutoChessHelper.MyBox.pos1,AutoChessHelper.MyBox.pos2,AutoChessHelper.Ipos = AutoChessHelper.FindMyBox()
    end
    AutoChessHelper.MyNpcs,AutoChessHelper.EnemyNpcs = AutoChessHelper.TableNpcOnBox(AutoChessHelper.MyBox.pos1,AutoChessHelper.MyBox.pos2)

    if not AutoChessHelper.MyBoxHasItem and AutoChessHelper.Ipos then -- бежать герою на оптимальную позицию
        local needpos = AutoChessHelper.Spots[AutoChessHelper.Ipos].pos5
        if KostyaUtils.Distance2Objects(AutoChessHelper.Hero, needpos) > 100 then
            if not NPC.IsRunning(AutoChessHelper.Hero) and Menu.IsEnabled(AutoChessHelper.AutoChessMoveToPos) then
                NPC.MoveTo(AutoChessHelper.Hero, needpos)
            end
        end
    end

    if Menu.IsEnabled(AutoChessHelper.AutoChessStack) then -- стак юнитов в одного большого
        AutoChessHelper.StackDraw = false
        local skill1 = NPC.GetAbility(AutoChessHelper.Hero, "pick_chess")
        local x,y = 1000,500
        if skill1 and Ability.IsCastable(skill1, 0) and Ability.IsActivated(skill1) then
            local tablenpscount = AutoChessHelper.SimpleFindNpcHelper()
            for i,j in pairs(tablenpscount) do
                if j and j > 2 then
                    AutoChessHelper.StackDraw = true
                    AutoChessHelper.NeedStackUnit(i)
                end
            end
        end
    end

    do -- создание ДПС для моей команды и противника
        if AutoChessHelper.MyNpcs and AutoChessHelper.EnemyNpcs then
            AutoChessHelper.MyBox.MyDps,AutoChessHelper.MyBox.MyHp = AutoChessHelper.FindDpsOnSec(AutoChessHelper.MyNpcs,1)
            AutoChessHelper.MyBox.EnemyDps,AutoChessHelper.MyBox.EnemyHp = AutoChessHelper.FindDpsOnSec(AutoChessHelper.EnemyNpcs,1)
            local howsecondsformesec, howsecondsforenemysec = 0,0
            if AutoChessHelper.MyBox.MyDps > 0 then
                howsecondsformesec = AutoChessHelper.MyBox.EnemyHp/AutoChessHelper.MyBox.MyDps
            end
            if AutoChessHelper.MyBox.EnemyDps > 0 then
                howsecondsforenemysec = AutoChessHelper.MyBox.MyHp/AutoChessHelper.MyBox.EnemyDps
            end
            if howsecondsforenemysec ~= 0 and howsecondsformesec ~= 0 then
                local temp = howsecondsforenemysec - howsecondsformesec
                AutoChessHelper.WinChance = temp
            else
                AutoChessHelper.WinChance = nil
            end

        end
    end
    AutoChessHelper.CanWork = true
end

function AutoChessHelper.OnEntityCreate(ent)
    if not ent or not Entity.IsNPC(ent) or not NPC.GetUnitName(ent) then return end
    local HasItChess = false
    if Menu.IsEnabled(AutoChessHelper.AutoChessDeckBuilder) and Menu.IsEnabled(AutoChessHelper.AutoChessDeckblinHero) then  -- если включена опция подсветки героя из билда

        local heroname = NPC.GetUnitName(ent)

        if AutoChessHelper.ChoosenBuild then
            for i, value in ipairs(AutoChessHelper.DotaChessXYZ) do
                if value.hero == heroname then
                    for j, pair in ipairs(AutoChessHelper.ChoosenBuild) do
                        local chp = AutoChessHelper.explode("-", pair)
                        local unit_id = tonumber(chp[2])
                        if AutoChessHelper.DotaChessXYZ[unit_id +1].hero == heroname then
                            HasItChess = true
                            break
                        end
                    end
                end
            end
        end
    elseif Menu.IsEnabled(AutoChessHelper.AutoChessblinHero) then -- если включена опция подсветки героя на доске
        if AutoChessHelper.FindHasUnit(NPC.GetUnitName(ent),Heroes.GetLocal()) then
            HasItChess = true
        end
    end

    if HasItChess then
        Particle.Create("particles/econ/items/dazzle/dazzle_ti6_gold/dazzle_ti6_shallow_grave_gold.vpcf",Enum.ParticleAttachment.PATTACH_POINT_FOLLOW, ent)
        Particle.Create("particles/units/heroes/hero_dazzle/dazzle_armor_friend_ring_sparks.vpcf",Enum.ParticleAttachment.PATTACH_CENTER_FOLLOW, ent)
    end
end



function AutoChessHelper.FindPlayer(id) --ищет игрока по ID, возвращает userData
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

function AutoChessHelper.tablemax(table) --ищет количество значений в таблице, возвращает число
    if not table then return 0 end
    local count = 0
    for i,j in pairs(table) do
        if i and j then
            count = count + 1
        end
    end
    return count
end

function AutoChessHelper.FindHasUnit(unit,owner) -- unit Имя нпс(Реальное), owner юзердата героя, возвращает true или false
    if not unit or not owner or not Entity.IsAlive(owner) or not NPCs.Contains(owner) then return false end
    if not AutoChessHelper.CountNpc then return end
    if AutoChessHelper.CountNpc[owner] then
        for name,count in pairs(AutoChessHelper.CountNpc[owner]) do
            if name == unit then
                return true
            end
        end
    end
    return false
end

function AutoChessHelper.GetCountAllNPC(hero) -- hero юзердата героя, ищет количество всех нпс и их количество, возвращает таблицу вида {[РеальноеИмяНпс] = количество}
    local temp = nil
    local npcs = NPCs.GetAll()
    local tableposnpc = AutoChessHelper.FountSpotNpc(hero)
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and NPC.IsCreep(j) and Entity.IsAlive(j) and AutoChessHelper.ObjectInBox(tableposnpc.pos1,tableposnpc.pos2,Entity.GetAbsOrigin(j)) then
            if Entity.IsSameTeam(j, hero) and NPC.HasState(j, Enum.ModifierState.MODIFIER_STATE_NO_HEALTH_BAR) then
                for o,p in pairs(AutoChessHelper.Chess) do
                    if string.find(NPC.GetUnitName(j),o) or string.find(NPC.GetUnitName(j),p) then
                        local name = ""
                        if string.find(o,"npc_dota") then
                            name = o
                        else
                            name = p
                        end
                        if not temp then
                            temp = {}
                        end
                        if not temp[name] then
                            temp[name] = 0
                        end
                        if temp[name] then
                            if string.find(NPC.GetUnitName(j),"11") then
                                temp[name] = temp[name] + 9
                            elseif string.find(NPC.GetUnitName(j),"1") then
                                temp[name] = temp[name] + 3
                            else
                                temp[name] = temp[name] + 1
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

function AutoChessHelper.FountSpotNpc(npc) -- npc юзердата нпс, ищет спот на карте, возвращает часть таблицы из AutoChessHelper.Spots
    if not npc or not NPCs.Contains(npc) then return end
    for i,j in pairs(AutoChessHelper.Spots) do
        if AutoChessHelper.ObjectInBox(j.pos1,j.pos2, Entity.GetAbsOrigin(npc)) then
            return j
        end
    end
end

function AutoChessHelper.NeedStackUnit(nameunit) -- nameunit МодНазваниеNPC, стакает союзные шахматы c таким названием
    if not nameunit then return end
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsCreep(j) and Entity.IsSameTeam(j, AutoChessHelper.Hero) and NPC.GetUnitName(j) == nameunit then
            if AutoChessHelper.ObjectInBox(AutoChessHelper.MyBox.pos1,AutoChessHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                if AutoChessHelper.ObjectInBox(AutoChessHelper.Spots[AutoChessHelper.Ipos].pos3,AutoChessHelper.Spots[AutoChessHelper.Ipos].pos4,Entity.GetAbsOrigin(j)) then
                    local mod = NPC.GetModifier(j, "modifier_chess_picked")
                    if not mod then
                        local skill1 = NPC.GetAbility(AutoChessHelper.Hero, "pick_chess")
                        if skill1 and Ability.IsCastable(skill1, 0) then
                            Ability.CastTarget(skill1, j)
                        end
                    else
                        local skill1 = NPC.GetAbility(j, "pick_chess")
                            Ability.CastPosition(skill1, Entity.GetAbsOrigin(AutoChessHelper.Hero))
                    end
                end
            end
        end
    end
end

function AutoChessHelper.SimpleFindNpcHelper() -- ищет все нпс на споте локального игрока, возвращает таблицу вида {[МодНазваниеШахматы] = количество}
    local temptable = {}
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsCreep(j) then
            if AutoChessHelper.ObjectInBox(AutoChessHelper.MyBox.pos1,AutoChessHelper.MyBox.pos2,Entity.GetAbsOrigin(j)) then
                if Entity.IsSameTeam(j, AutoChessHelper.Hero) then
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

function AutoChessHelper.FindDpsOnSec(tablenpcs,sec) -- tablenpcs таблица шахмат, sec на сколько секунд, расчитывает дпс в определенное количество секунд
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

function AutoChessHelper.TableNpcOnBox(pos1,pos2) -- Ищет нпс на определеном квадрате
    if not pos1 or not pos2 then return nil,nil end
    local mynpc = {}
    local enemynpc = {}
    local npcs = NPCs.GetAll()
    for i,j in pairs(npcs) do
        if j and NPCs.Contains(j) and Entity.IsAlive(j) and NPC.IsKillable(j) then
            if Entity.GetAbsOrigin(j) and AutoChessHelper.ObjectInBox(pos1,pos2,Entity.GetAbsOrigin(j)) then
                if Entity.IsSameTeam(j, AutoChessHelper.Hero) then
                    table.insert(mynpc, j)
                else
                    table.insert(enemynpc, j)
                end
            end
        end
    end
    return mynpc,enemynpc
end

function AutoChessHelper.ObjectInBox(object1,object2,checkObject) -- определяет находиться ли позиция внутри квадрата
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

function AutoChessHelper.FindMyBox() -- найти мой спот
    if AutoChessHelper.Spots then
        for i,j in pairs(AutoChessHelper.Spots) do
            if AutoChessHelper.ObjectInBox(j.pos1,j.pos2, Entity.GetAbsOrigin(Heroes.GetLocal())) then
                return j.pos1,j.pos2,i
            end
        end
    end
end

function AutoChessHelper.Steam32id(Input)
    return Input - 76561197960265728
end

function AutoChessHelper.init()
    Console.Print("------------AutoChestUpdate------------")
    AutoChessHelper.Hero = nil
    AutoChessHelper.MyBox = nil
    AutoChessHelper.WinChance = nil
    AutoChessHelper.MyBoxHasItem = false
    AutoChessHelper.MyNpcsTable = nil
    AutoChessHelper.CountNpc = nil
    AutoChessHelper.DrawTable = true
end

function AutoChessHelper.OnGameStart()
    AutoChessHelper.init()
end
function AutoChessHelper.OnGameEnd()
    AutoChessHelper.init()
    AutoChessHelper.PlayerGametable = {}
end

Console.AddCommand("ach.choose_build", 1, function(args) -- ach.choose_build <номер сборки>
    if AutoChessHelper.Builds[tonumber(args[2])] then
        local build = AutoChessHelper.getBuildByUrl(AutoChessHelper.Builds[tonumber(args[2])].url);
        Alerts.Add("ChessBuild successfully setted", 2)
        AutoChessHelper.ChoosenBuildName = AutoChessHelper.Builds[tonumber(args[2])].description;
        AutoChessHelper.ChoosenBuild = build;
    end
end)

Console.AddCommand("ach.list_builds", 0, function() -- ach.list_builds выводит список всех загруженых сборок в консоль
    for i, v in ipairs(AutoChessHelper.Builds) do
        Console.Print(string.format("%s - %s", i, v.description))
    end
end)

Console.AddCommand("ach.custom_build", 1, function(args) -- устанавливает свою сборку с сайта dotachess.xyz
    local build = AutoChessHelper.getBuildByUrl(args[2]);
    Alerts.Add("ChessBuild successfully setted", 2)
    AutoChessHelper.ChoosenBuildName = "Custom build";
    AutoChessHelper.ChoosenBuild = build;
end)

function AutoChessHelper.getBuildByUrl(url) --функция берет build параметр с ссылки на сборку и возвращает пары значений [позиция] - [id_героя] 
    local t = AutoChessHelper.parseurl(url)
    local chess_coords = AutoChessHelper.explode(",", t.build)
    return chess_coords;
end

function AutoChessHelper.parseurl(s) --функция парсит ссылкку и возвращает гет-параметры в виде объекта
    local ans = {}
    for k, v in s:gmatch('([^&=?]-)=([^&=?]+)') do
        ans[k] = v
    end
    return ans
end

function AutoChessHelper.explode(div, str) --функция разбивает строку по делиметру
    if (div == '') then return false end
    local pos, arr = 0, {}
    for st, sp in function() return string.find(str, div, pos, true) end do
        table.insert(arr, string.sub(str, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end

function AutoChessHelper.round(num, numDecimalPlaces) --функция округления чисел до точки
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

AutoChessHelper.init()




return AutoChessHelper
