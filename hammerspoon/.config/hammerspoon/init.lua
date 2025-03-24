local lastMode = hs.host.interfaceStyle()

local function themeChangedCallback()
    local currentMode = hs.host.interfaceStyle()
    if currentMode ~= lastMode then
        lastMode = currentMode

        -- 向所有终端窗口发送 SIGUSR1 信号
        local terminals = {"Terminal", "iTerm2", "kitty"}
        for _, terminal in ipairs(terminals) do
            local output, status, type, rc = hs.execute("pgrep -f " .. terminal)
            if status then
                for pid in output:gmatch("(%d+)") do
                    hs.execute("kill -SIGUSR1 " .. pid)
                end
            end
        end
    end
end

-- Create a new distributed notification observer
local themeObserver = hs.distributednotifications.new(themeChangedCallback, "AppleInterfaceThemeChangedNotification")
themeObserver:start()
