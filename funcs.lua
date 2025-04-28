-- this file will be used for functions to be called by main.lua
print("internals.lua has been executed.")

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


