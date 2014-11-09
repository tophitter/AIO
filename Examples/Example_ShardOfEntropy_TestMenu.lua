require("AIO")

    -- Frame
    local Frame = AIO:CreateFrame("Frame", "FrameTest", "UIParent", nil)
    Frame:SetSize(42, 179)
    Frame:SetMovable(false)
    Frame:SetEnabledMouse(true)
    Frame:RegisterForDrag("LeftButton")
    Frame:SetPoint("RIGHT")
    Frame:SetClampedToScreen(true)
    Frame:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 10,
        nsets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    -- Frame End

    -- Frame Children
    local TrainingFrame = AIO:CreateFrame("Frame", "TrainingFrame", nil, "UIPanelDialogTemplate")
    TrainingFrame:SetSize(500, 300)
    TrainingFrame:SetMovable(true)
    TrainingFrame:SetEnabledMouse(true)
    TrainingFrame:RegisterForDrag("LeftButton")
    TrainingFrame:SetPoint("CENTER")
    TrainingFrame:SetClampedToScreen(true)
    TrainingFrame:SetBackdrop({
        bgFile = "Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal",
        insets = { left = 9, right = 6, top = 5, bottom = 5 }
    })
    TrainingFrame:Hide()
    -- Frame Children End

    -- Buttons
    local TrainingButton = AIO:CreateFrame("Button", "TrainingButton", Frame)
    TrainingButton:SetSize(32, 32)
    TrainingButton:SetPoint("CENTER", 0, 67)
    TrainingButton:SetEnabledMouse(true)
    TrainingButton:SetNormalTexture("Interface/ICONS/INV_Misc_Book_11")
    TrainingButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TrainingButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
    TrainingButton:SetScript("OnMouseUp", AIO:ToFunction("TrainingFrame:Show()"))
    local TrainingsButton_Tooltip_OnEnter = [[
        GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT")
        GameTooltip:SetText("Test\nNew Line")
        GameTooltip:Show()
    ]]
    TrainingButton:SetScript("OnEnter", AIO:ToFunction(TrainingsButton_Tooltip_OnEnter))
    local TrainingsButton_Tooltip_OnLeave = [[
        GameTooltip:Hide()
    ]]
    TrainingButton:SetScript("OnLeave", AIO:ToFunction(TrainingsButton_Tooltip_OnLeave))

    local TestButton1 = AIO:CreateFrame("Button", "TestButton1", Frame)
    TestButton1:SetSize(32, 32)
    TestButton1:SetPoint("CENTER", 0, 33)
    TestButton1:SetEnabledMouse(true)
    TestButton1:SetNormalTexture("Interface/ICONS/Ability_Warrior_StrengthOfArms")
    TestButton1:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton1:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

    local TestButton2 = AIO:CreateFrame("Button", "TestButton2", Frame)
    TestButton2:SetSize(32, 32)
    TestButton2:SetPoint("CENTER", 0, -1)
    TestButton2:SetEnabledMouse(true)
    TestButton2:SetNormalTexture("Interface/ICONS/Spell_Arcane_Rune")
    TestButton2:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton2:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

    local TestButton3 = AIO:CreateFrame("Button", "TestButton3", Frame)
    TestButton3:SetSize(32, 32)
    TestButton3:SetPoint("CENTER", 0, -35)
    TestButton3:SetEnabledMouse(true)
    TestButton3:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_Outland_Dungeon_Hero")
    TestButton3:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton3:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

    local TestButton4 = AIO:CreateFrame("Button", "TestButton4", Frame)
    TestButton4:SetSize(32, 32)
    TestButton4:SetPoint("CENTER", 0, -69)
    TestButton4:SetEnabledMouse(true)
    TestButton4:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_PlagueWing")
    TestButton4:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton4:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
    -- Buttons end

    -- FrameUI
    local FrameUI = AIO:CreateMsg()
    FrameUI:Append(Frame)
    -- FrameUI End

    -- Frame Children FrameUI
    local TrainingFrameUI = AIO:CreateMsg()
    TrainingFrameUI:Append(TrainingFrame)
    -- Frame Children FrameUI End

local function create_objects(event, player)

    -- You need this to send it to the player again, e.g. when he relogs
    FrameUI:SendIgnoreIf(Frame, player)
    TrainingFrameUI:SendIgnoreIf(TrainingFrame, player)
    -- Send after relog End

    -- Send Frame
    Frame:Send(player)
    Frame:Clear()
    -- Send Frame End

    -- Send Frame Children
    TrainingFrame:Send(player)
    TrainingFrame:Clear()
    -- Send Frame Children End
end

RegisterPlayerEvent(3, create_objects)