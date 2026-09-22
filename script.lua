local MovementConfig = {
    Mode = "Dummy" -- or "Ir Direto"
}

local function WalkTo(targetPos)
    local char = Players.LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    if MovementConfig.Mode == "Ir Direto" then
        -- Normal Roblox walking, no stiff CFrame
        hum:MoveTo(targetPos)
        -- Keep moving if interrupted
        local con
        con = hum.MoveToFinished:Connect(function(reached)
            con:Disconnect()
        end)
        -- Fallback loop to ensure it doesn't stop prematurely
        task.spawn(function()
            while hum and hum.Parent and (hrp.Position - targetPos).Magnitude > 3 do
                hum:MoveTo(targetPos)
                task.wait(0.5)
            end
        end)
    else
        -- Dummy mode (e.g., slower, or just standard walk)
        hum.WalkSpeed = 8
        hum:MoveTo(targetPos)
        task.wait(2)
        hum.WalkSpeed = 16
    end
end
