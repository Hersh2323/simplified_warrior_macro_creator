require("internals.lua")
require("funcs.lua")

local function simple_warrior_macro_config()
	print("simple_warrior_macro_config() has executed!")

    local selected_class = UnitClass("Player")
    --print("SWMC has executed with Class: " .. selected_class)
    if selected_class ~= "Warrior" then
        print("Incorrect class selected for SWMC. Exiting...")
        return
    end
    if selected_class == "Warrior" then
        print("Correct class selected for SWMC!")
    end

    local numAccountMacros, numCharacterMacros = GetNumMacros()
    local PlayerMacroCap = 5*6
    local AccountMacroCap = 20*6
    local MacroCap = PlayerMacroCap * AccountMacroCap

    local bFound_dw = false
    local bFound_shield = false
    local bFound_2h = false


    for i = 121, MacroCap do
        local current_macro = GetMacroInfo(i)
        if current_macro ~= nil then
            print(i .. " " .. current_macro)
            if current_macro == ":1h1h:" then
                bFound_dw = true
                print("dw macro text: \n" .. GetMacroBody(i))
            elseif current_macro == ":1h1s:" then
                bFound_shield = true
                print("shield macro text: \n" .. GetMacroBody(i))
            elseif current_macro == ":2h:" then
                bFound_2h = true
                print("2h macro text: \n" .. GetMacroBody(i))
            else
            end
        end
    end

    if bFound_dw ~= true then
        print("bFound_dw ~= true")
        bFound_dw = true
        local dw = CreateMacro(":1h1h:", 132147, "/equipslot 16 \n/equipslot 17 ", true)

    end
    if bFound_shield ~= true then
        print("bFound_shield ~= true")
        bFound_shield = true
        local shield = CreateMacro(":1h1s:", 132110, "/equipslot 16 \n/equipslot 17 ", true)

    end
    if bFound_2h ~= true then
        print("bFound_2h ~= true")
        bFound_2h = true
        local two_hander = CreateMacro(":2h:", 133052, "/equipslot 16 \n/equipslot 17 ", true)

    end


    --[[
		:esh: used for equipping desired shield
    ]] 
    local macro = nil
    local macro_name = ":esh:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip\n/stopcasting\n" .. GetMacroBody(":1h1s:")
    print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            print("macro_index found to be: " .. macro_index)
            print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
    	print("macro variables cleared.")
    end

    --[[
		:e2h: used for equipping 2h weapon
    ]] 
    local macro = nil
    local macro_name = ":e2h:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip\n/stopcasting\n" .. GetMacroBody(":2h:")
    --print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            --print("macro_index found to be: " .. macro_index)
            --print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
    	print("macro variables cleared.")
    end

    --[[
		:edw: used for equipping 2h weapon
    ]] 
    local macro = nil
    local macro_name = ":edw:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip\n/stopcasting\n" .. GetMacroBody(":1h1h:")
    --print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            --print("macro_index found to be: " .. macro_index)
            --print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
    	print("macro variables cleared.")
    end

    --[[
		:sb: used for casting shield block
    ]] 
    local macro = nil
    local macro_name = ":sb:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip shield block\n/startattack\n" .. GetMacroBody(":1h1s:") .. "/cast defensive stance\n/cast shield block"
    --print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            --print("macro_index found to be: " .. macro_index)
            --print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
    	print("macro variables cleared.")
    end

    --[[
		:sbash: used for casting shield bash
    ]] 
    local macro = nil
    local macro_name = ":sbash:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip shield bash\n/startattack\n/stopcasting\n" .. GetMacroBody(":1h1s:") .. "/cast shield bash"
    --print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            --print("macro_index found to be: " .. macro_index)
            --print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
    	print("macro variables cleared.")
    end

    --[[
                :sw: used for casting shield wall
    ]]
    local macro = nil
    local macro_name = ":sw:"
    local icon_id = "INV_Misc_QuestionMark"
    local macro_body = "#showtooltip shield wall\n/startattack\n/stopcasting\n" .. GetMacroBody(":1h1s:") .. "/cast shield wall"
    --print("macro_body: " .. macro_body)
    macro = GetMacroInfo(macro_name)
    if macro ~= nil then
        local macro_index = GetMacroIndexByName(macro_name)
        if macro_index ~= 0 then
            --print("macro_index found to be: " .. macro_index)
            --print("macro: " .. GetMacroBody(macro_index))
            local _var = EditMacro(GetMacroIndexByName(macro_name), macro_name, icon_id, macro_body)
        end
    end
    if macro == nil then
        local esh = CreateMacro(macro_name, icon_id, macro_body, true)
    end
    macro, macro_name, icon_id, macro_body = nil
    if macro == nil and macro_name == nil and icon_id == nil and macro_body == nil then
        print("macro variables cleared.")
    end


end



SLASH_SWM1 = "/swm"
SlashCmdList["SWM"] = function()
   simple_warrior_macro_config()
end
