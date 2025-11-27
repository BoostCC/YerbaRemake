-- Yerba UI Library
local library = {}
local tabs = {}
local sections = {}
local currentTab = nil

-- Library Configuration
library.config = {
    title = "Yerba",
    logo = "rbxassetid://91936638224609",
    font = Enum.Font.SourceSans,
    textSize = 14,
    interface_keybind = Enum.KeyCode.Insert,
    colors = {
        main = Color3.fromRGB(12, 12, 12),
        accent = Color3.fromRGB(38, 81, 103),
        text = Color3.fromRGB(255, 255, 255),
        textDimmed = Color3.fromRGB(128, 128, 128),
        section = Color3.fromRGB(15, 15, 17),
        header = Color3.fromRGB(31, 31, 31),
        headerGradient = {
            Color3.fromRGB(31, 31, 31),
            Color3.fromRGB(20, 20, 20)
        },
        divider = {
            Color3.fromRGB(27, 57, 73),
            Color3.fromRGB(38, 81, 103),
            Color3.fromRGB(27, 57, 73)
        }
    }
}

-- Create Base GUI
local function createBaseGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Enabled = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.ClipsDescendants = true
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Name = "MainFrame"
    MainFrame.Position = UDim2.new(0.26230770349502563, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 560, 0, 488)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.Parent = ScreenGui

    local Header = Instance.new("Frame")
    Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Header.AnchorPoint = Vector2.new(0.5, 0)
    Header.Name = "Header"
    Header.Position = UDim2.new(0.5, 0, 0, 0)
    Header.Size = UDim2.new(0, 560, 0, 50)
    Header.ZIndex = 15
    Header.BorderSizePixel = 0
    Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Header.Parent = MainFrame

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Header

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Rotation = 90
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 31, 31)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
    }
    UIGradient.Parent = Header

    local Liner = Instance.new("Frame")
    Liner.AnchorPoint = Vector2.new(0, 1)
    Liner.Name = "Liner"
    Liner.Position = UDim2.new(0, 0, 1, 0)
    Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Liner.Size = UDim2.new(1, 1, 0, 2)
    Liner.BorderSizePixel = 0
    Liner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Liner.Parent = Header

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 57, 73)),
        ColorSequenceKeypoint.new(0.495, Color3.fromRGB(38, 81, 103)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 57, 73))
    }
    UIGradient.Parent = Liner

    local Holder = Instance.new("Frame")
    Holder.BackgroundTransparency = 1
    Holder.Name = "Holder"
    Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Holder.Size = UDim2.new(0, 332, 0, 50)
    Holder.BorderSizePixel = 0
    Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder.Parent = Header

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Parent = Holder

    local LibaryLogo = Instance.new("Frame")
    LibaryLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LibaryLogo.AnchorPoint = Vector2.new(0, 0.5)
    LibaryLogo.BackgroundTransparency = 1
    LibaryLogo.Position = UDim2.new(0, 0, 0.47999998927116394, 0)
    LibaryLogo.Name = "LibaryLogo"
    LibaryLogo.Size = UDim2.new(0, 32, 0, 48)
    LibaryLogo.BorderSizePixel = 0
    LibaryLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LibaryLogo.Parent = Holder

    local Logo = Instance.new("ImageLabel")
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.Name = "Logo"
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.Image = "rbxassetid://91936638224609"
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
    Logo.Size = UDim2.new(0, 32, 0, 32)
    Logo.BorderSizePixel = 0
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.Parent = LibaryLogo

    local Divider = Instance.new("Frame")
    Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Divider.AnchorPoint = Vector2.new(0.5, 0.5)
    Divider.BackgroundTransparency = 1
    Divider.Position = UDim2.new(0.5, 0, 0.5, 0)
    Divider.Name = "Divider_Logo" -- Special name for the logo divider
    Divider.Size = UDim2.new(0, 2, 0, 50)
    Divider.BorderSizePixel = 0
    Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Divider.LayoutOrder = 1 -- Set layout order for proper positioning
    Divider.Parent = Holder

    local Line = Instance.new("Frame")
    Line.AnchorPoint = Vector2.new(0.5, 0.5)
    Line.Name = "Line"
    Line.Position = UDim2.new(0.5, 0, 0.5, 0)
    Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line.Size = UDim2.new(0.05263157933950424, 1, 0.30399537086486816, 1)
    Line.BorderSizePixel = 0
    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Line.Parent = Divider

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Rotation = 90
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 57, 73)),
        ColorSequenceKeypoint.new(0.495, Color3.fromRGB(38, 81, 103)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 57, 73))
    }
    UIGradient.Parent = Line

    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingLeft = UDim.new(0, 7)
    UIPadding.Parent = Holder

    local Search = Instance.new("Frame")
    Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Search.AnchorPoint = Vector2.new(1, 0.5)
    Search.BackgroundTransparency = 0.6499999761581421
    Search.Position = UDim2.new(1, -14, 0.5, 0)
    Search.Name = "Search"
    Search.Size = UDim2.new(0, 150, 0, 26)
    Search.BorderSizePixel = 0
    Search.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
    Search.Parent = Header

    local RoundedSearch = Instance.new("UICorner")
    RoundedSearch.Name = "RoundedSearch"
    RoundedSearch.CornerRadius = UDim.new(0, 3)
    RoundedSearch.Parent = Search

    local Outline = Instance.new("UIStroke")
    Outline.Color = Color3.fromRGB(42, 42, 43)
    Outline.Name = "Outline"
    Outline.Parent = Search

    local Icon = Instance.new("ImageLabel")
    Icon.ImageColor3 = Color3.fromRGB(168, 168, 168)
    Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon.Name = "Icon"
    Icon.AnchorPoint = Vector2.new(0, 0.5)
    Icon.Image = "rbxassetid://125430388526923"
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 5, 0.5, 0)
    Icon.Size = UDim2.new(0, 14, 0, 14)
    Icon.BorderSizePixel = 0
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.Parent = Search

    local TextBox = Instance.new("TextBox")
    TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextBox.Size = UDim2.new(0, 1, 0, 1)
    TextBox.TextColor3 = Color3.fromRGB(127, 127, 127)
    TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextBox.Text = ""
    TextBox.Position = UDim2.new(1, -87, 0.5, 0)
    TextBox.TextStrokeTransparency = 0
    TextBox.AnchorPoint = Vector2.new(1, 0.5)
    TextBox.BorderSizePixel = 0
    TextBox.BackgroundTransparency = 1
    TextBox.PlaceholderColor3 = Color3.fromRGB(127, 127, 127)
    TextBox.AutomaticSize = Enum.AutomaticSize.XY
    TextBox.PlaceholderText = "Search"
    TextBox.TextSize = 14
    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Parent = Search

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = MainFrame

    local Page = Instance.new("Frame")
    Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Page.AnchorPoint = Vector2.new(0.5, 1)
    Page.BackgroundTransparency = 1
    Page.Position = UDim2.new(0.5, 0, 1, 0)
    Page.Name = "Page"
    Page.Size = UDim2.new(0, 560, 0, 438)
    Page.BorderSizePixel = 0
    Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Page.Parent = MainFrame

    local Container = Instance.new("ScrollingFrame")
    Container.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    Container.Active = true
    Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Container.BackgroundTransparency = 1
    Container.Name = "Container"
    Container.Size = UDim2.new(0, 560, 0, 438)
    Container.BorderSizePixel = 0
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.Parent = Page

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Wraps = true
    UIListLayout.Padding = UDim.new(0, 9)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Parent = Container

    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 11)
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.Parent = Container

    local BG_TEXTURE = Instance.new("ImageLabel")
    BG_TEXTURE.ScaleType = Enum.ScaleType.Slice
    BG_TEXTURE.ImageTransparency = 0.9800000190734863
    BG_TEXTURE.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BG_TEXTURE.Name = "BG_TEXTURE"
    BG_TEXTURE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BG_TEXTURE.Image = "rbxassetid://136562337748317"
    BG_TEXTURE.BackgroundTransparency = 1
    BG_TEXTURE.Size = UDim2.new(1, 1, 1, 1)
    BG_TEXTURE.ZIndex = -5
    BG_TEXTURE.BorderSizePixel = 0
    BG_TEXTURE.SliceCenter = Rect.new(Vector2.new(238, 66), Vector2.new(238, 413))
    BG_TEXTURE.Parent = MainFrame

    local Outline = Instance.new("UIStroke")
    Outline.Color = Color3.fromRGB(62, 119, 150)
    Outline.Name = "Outline"
    Outline.Parent = MainFrame

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        Header = Header,
        Holder = Holder,
        Page = Page,
        Container = Container
    }
end

-- Window Creation Function
function library:CreateWindow(options)
    options = options or {}
    local window = {}
    
    -- Configure library based on options
    if options.library_config then
        if options.library_config.Cheat_Name then
            library.config.title = options.library_config.Cheat_Name
        end
        
        if options.library_config.Cheat_Icon then
            library.config.logo = options.library_config.Cheat_Icon
        end
        
        if options.library_config.interface_keybind then
            library.config.interface_keybind = options.library_config.interface_keybind
        end
    end
    
    -- Create the base GUI
    local gui = createBaseGui()
    library.gui = gui
    
    -- Clear any example elements from the UI template
    for _, child in pairs(gui.Holder:GetChildren()) do
        if child:IsA("Frame") and (child.Name:find("TabHolder") or (child.Name == "Divider" and child.Name ~= "Divider_Logo")) then
            child:Destroy()
        end
    end
    
    -- Print a debug message to confirm the UI is being created
    print("Yerba UI Library initialized")
    
    -- Clear any example sections from the Container
    for _, child in pairs(gui.Container:GetChildren()) do
        if child:IsA("Frame") and (child.Name == "Section_Left" or child.Name == "Section_Right") then
            child:Destroy()
        end
    end
    
    -- Create Divider Function
    function window:CreateDivider()
        local divider = {}
        
        -- Count existing dividers to position this one
        local dividerCount = 0
        for _, child in pairs(library.gui.Header:GetChildren()) do
            if child.Name:find("Divider_") then
                dividerCount = dividerCount + 1
            end
        end
        
        -- Create a visible divider directly in the header
        local DividerFrame = Instance.new("Frame")
        DividerFrame.Name = "Divider_" .. tostring(math.random(1000, 9999))
        DividerFrame.Size = UDim2.new(0, 2, 0, 30)
        DividerFrame.Position = UDim2.new(0, 40 + (dividerCount * 90), 0, 10)
        DividerFrame.BackgroundColor3 = library.config.colors.accent
        DividerFrame.BackgroundTransparency = 0.5
        DividerFrame.BorderSizePixel = 0
        DividerFrame.ZIndex = 15
        DividerFrame.Parent = library.gui.Header
        
        -- Add gradient to divider
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Rotation = 90
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
            ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
            ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
        }
        UIGradient.Parent = DividerFrame
        
        -- Print debug message
        print("Created divider at position: " .. tostring(DividerFrame.Position))
        
        local Line = Instance.new("Frame")
        Line.AnchorPoint = Vector2.new(0.5, 0.5)
        Line.Name = "Line"
        Line.Position = UDim2.new(0.5, 0, 0.5, 0)
        Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Line.Size = UDim2.new(0, 4, 0, 30) -- Fixed size for better visibility
        Line.BorderSizePixel = 0
        Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Line.ZIndex = 16 -- Make sure it's visible above the divider frame
        Line.Parent = DividerFrame
        
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Rotation = 90
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
            ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
            ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
        }
        UIGradient.Parent = Line
        
        return divider
    end
    
    -- Tab Creation Function
    function window:CreateTab(name)
        local tabData = {}
        local tabIndex = #tabs + 1
        
        -- Create a direct tab button in the header
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "Tab_" .. name
        TabButton.Text = name
        TabButton.Size = UDim2.new(0, 80, 0, 30)
        TabButton.Position = UDim2.new(0, 50 + (tabIndex * 90), 0, 10)
        TabButton.BackgroundColor3 = library.config.colors.accent
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Font = library.config.font
        TabButton.TextSize = 16
        TabButton.BorderSizePixel = 1
        TabButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.ZIndex = 20
        TabButton.Parent = library.gui.Header -- Add directly to the header
        
        -- Add a UICorner to make it look better
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = TabButton
        
        -- Create a liner under the tab
        local Liner = Instance.new("Frame")
        Liner.Name = "Liner"
        Liner.Size = UDim2.new(1, 0, 0, 2)
        Liner.Position = UDim2.new(0, 0, 1, 0)
        Liner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Liner.BorderSizePixel = 0
        Liner.ZIndex = 20
        Liner.Parent = TabButton
        
        -- Add gradient to liner
        local UIGradient = Instance.new("UIGradient")
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
            ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
            ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
        }
        UIGradient.Parent = Liner
        
        -- Create Tab Container
        local TabContainer = Instance.new("Frame")
        TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabContainer.Name = name.."_Container"
        TabContainer.BackgroundTransparency = 1
        TabContainer.Size = UDim2.new(1, 0, 1, -50)
        TabContainer.Position = UDim2.new(0, 0, 0, 50)
        TabContainer.BorderSizePixel = 0
        TabContainer.Visible = (tabIndex == 1) -- First tab is visible by default
        TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabContainer.Parent = library.gui.Page
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Padding = UDim.new(0, 9)
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.Parent = TabContainer
        
        -- Tab click functionality
        TabButton.MouseButton1Click:Connect(function()
            -- Hide all tab containers
            for _, tab in pairs(tabs) do
                if tab.container then
                    tab.container.Visible = false
                end
            end
            
            -- Show this tab container
            TabContainer.Visible = true
            
            -- Update tab colors
            for _, tab in pairs(tabs) do
                if tab.button then
                    tab.button.BackgroundColor3 = library.config.colors.accent:Lerp(Color3.fromRGB(0, 0, 0), 0.7)
                end
            end
            
            -- Highlight this tab
            TabButton.BackgroundColor3 = library.config.colors.accent
            
            -- Update current tab
            currentTab = name
        end)
        
        -- Add tab data
        tabData.CreateSection = function(options)
            local sectionOptions = type(options) == "table" and options or {SectionText = options}
            local sectionName = sectionOptions.SectionText or "Section"
            local position = sectionOptions.position or "left"
            local subTabs = sectionOptions.SubTabs or {}
            
            local sectionData = {}
            -- Store subtab data
            local subTabsData = {}
            
            -- Create Section
            local Section = Instance.new("Frame")
            Section.ClipsDescendants = true
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.Name = sectionName.."_Section"
            Section.BackgroundTransparency = 0.6499999761581421
            Section.Size = UDim2.new(0, 264, 0, 40)
            Section.BorderSizePixel = 0
            Section.AutomaticSize = Enum.AutomaticSize.Y
            Section.BackgroundColor3 = library.config.colors.section
            
            -- Position based on left/right
            if position == "left" then
                Section.LayoutOrder = 1
            else
                Section.LayoutOrder = 2
            end
            
            Section.Parent = TabContainer
            
            -- Create section header and content
            -- (Add your section implementation here)
            
            return sectionData
        end
        
        -- Store tab data
        tabs[tabIndex] = {
            name = name,
            button = TabButton,
            container = TabContainer
        }
        
        return tabData
    end
    
    return window
end

-- SelectTab Function
function library:SelectTab(tabName)
    for _, tab in pairs(tabs) do
        if tab.name == tabName then
            -- Show this tab container
            if tab.container then
                tab.container.Visible = true
            end
            
            -- Highlight this tab
            if tab.button then
                tab.button.BackgroundColor3 = library.config.colors.accent
            end
        else
            -- Hide other tab containers
            if tab.container then
                tab.container.Visible = false
            end
            
            -- Dim other tabs
            if tab.button then
                tab.button.BackgroundColor3 = library.config.colors.accent:Lerp(Color3.fromRGB(0, 0, 0), 0.7)
            end
        end
    end
    
    -- Update current tab
    currentTab = tabName
end

-- Set Accent Color Function
function library:SetAccentColor(color)
    library.config.colors.accent = color
    library.config.colors.divider = {
        color:Lerp(Color3.fromRGB(0, 0, 0), 0.3),
        color,
        color:Lerp(Color3.fromRGB(0, 0, 0), 0.3)
    }
    
    -- Update all UI elements with accent color
    -- This would need to update all gradients, liners, etc.
end

-- Keybind List Function
function library:KeybindList()
    -- Implementation for keybind list display
    -- This would create a floating panel showing active keybinds
end

-- Notification Function
function library:CreateNotification(options)
    -- Implementation for notifications
    -- This would create and display a notification with the given options
end

return library
