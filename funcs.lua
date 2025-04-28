-- this file will be used for functions to be called by main.lua
print("funcs.lua has been executed.")

local function iGetRemainingCharacterMacros()
	local count = 0
	-- since player macros are stored AFTER global macros, we must begin at macro index 121
	local range_start = 121
	local range_end = 120 + 30
	for i = range_start, range_end do
		local current_macro = GetMacroInfo(i)
		if current_macro ~= nil then
			count = count + 1
		end
		if current_macro == nil then
			print("First empty player macro found at index: " .. i)
			break
		end
	end

	return 30 - count
end

local function iGetRemainingGlobalMacros()
	local count = 0
	local range_start = 1
	local range_end = 120


	for i = range_start, range_end do
		local current_macro = GetMacroInfo(i)
		if current_macro ~= nil then
			count = count + 1
		end
		if current_macro == nil then
			print("First global macro found at index: " .. i)
			break
		end
	end

	return range_end - count
end

local function bIsFreeCharacterMacroSlot()
	if iGetRemainingCharacterMacros() > 0 then
		return true
	else
		return false
	end
end


local function bIsFreeGlobalMacroSlot()
	if iGetRemainingGlobalMacros() > 0 then
		return true
	else
		return false
	end
end


local function bMacroExists(mname)
	local macro_name = mname
	local macro_found = false

	for i = 1, 150 do
    		local current_macro = GetMacroInfo(i)
		if current_macro == macro_name then
			return true
		end
	end    
	return false
end

local function iGetMacroIndexByName(mname)
	local macro_name = mname
	for i = 1, 150 do
    		local current_macro = GetMacroInfo(i)
		if current_macro == macro_name then
			return i
		end
	end
end
