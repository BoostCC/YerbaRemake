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
    MainFrame.BackgroundColor3 = library.config.colors.main
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = MainFrame
    
    -- Create Header
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
        ColorSequenceKeypoint.new(0, library.config.colors.headerGradient[1]),
        ColorSequenceKeypoint.new(1, library.config.colors.headerGradient[2])
    }
    UIGradient.Parent = Header
    
    -- Header Liner
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
        ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
        ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
        ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
    }
    UIGradient.Parent = Liner
    
    -- Header Holder for Logo and Tabs
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
    
    -- Library Logo
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
    Logo.Image = library.config.logo
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
    Logo.Size = UDim2.new(0, 32, 0, 32)
    Logo.BorderSizePixel = 0
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.Parent = LibaryLogo
    
    -- Divider after logo
    local Divider = Instance.new("Frame")
    Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Divider.AnchorPoint = Vector2.new(0.5, 0.5)
    Divider.BackgroundTransparency = 1
    Divider.Position = UDim2.new(0.16566264629364014, 0, 0.5, 0)
    Divider.Name = "Divider"
    Divider.Size = UDim2.new(0, 2, 0, 50)
    Divider.BorderSizePixel = 0
    Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
        ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
        ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
        ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
    }
    UIGradient.Parent = Line
    
    -- Search Bar
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
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(42, 42, 43)
    UIStroke.Parent = Search
    
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
    TextBox.TextSize = library.config.textSize
    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Parent = Search
    
    -- Page Container
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
    
    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        Header = Header,
        Holder = Holder,
        Container = Container
    }
end
-- Create Tab Function
function library:CreateTab(name)
    local tabData = {}
    local tabIndex = #tabs + 1
    
    -- Create Tab Holder
    local TabHolder = Instance.new("Frame")
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.Name = "TabHolder"
    TabHolder.BackgroundTransparency = 1
    TabHolder.Size = UDim2.new(0, 33, 0, 48)
    TabHolder.BorderSizePixel = 0
    TabHolder.AutomaticSize = Enum.AutomaticSize.XY
    TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHolder.Parent = self.gui.Holder
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = TabHolder
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 13)
    UIPadding.Parent = TabHolder
    
    -- Create Tab Name
    local TabName = Instance.new("TextLabel")
    TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TabName.TextColor3 = library.config.colors.textDimmed -- Default to dimmed
    TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabName.Text = name
    TabName.Name = "TabName"
    TabName.TextStrokeTransparency = 0.5
    TabName.AnchorPoint = Vector2.new(0.5, 0.5)
    TabName.Size = UDim2.new(0, 1, 0, 1)
    TabName.BackgroundTransparency = 1
    TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
    TabName.BorderSizePixel = 0
    TabName.AutomaticSize = Enum.AutomaticSize.XY
    TabName.TextSize = library.config.textSize
    TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabName.Parent = TabHolder
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingRight = UDim.new(0, 6)
    UIPadding.PaddingLeft = UDim.new(0, 6)
    UIPadding.Parent = TabName
    
    -- Create Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabContainer.Name = name.."_Container"
    TabContainer.BackgroundTransparency = 1
    TabContainer.Size = UDim2.new(1, 0, 1, 0)
    TabContainer.BorderSizePixel = 0
    TabContainer.Visible = false
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.Parent = self.gui.Container
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 9)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Parent = TabContainer
    
    -- Create Tab Liner (indicator for active tab)
    local Liner = Instance.new("Frame")
    Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Liner.AnchorPoint = Vector2.new(0.5, 1)
    Liner.Name = "Liner"
    Liner.Position = UDim2.new(0.5, 0, 1, 4)
    Liner.Size = UDim2.new(1, 1, 0, 2)
    Liner.BorderSizePixel = 0
    Liner.AutomaticSize = Enum.AutomaticSize.XY
    Liner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Liner.Visible = false
    Liner.Parent = TabName
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
        ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
        ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
    }
    UIGradient.Parent = Liner
    
    -- Tab Click Functionality
    TabHolder.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            library:SelectTab(name)
        end
    end)
    
    -- Tab Functions
    function tabData:CreateSection(sectionName)
        local sectionData = {}
        
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
        Section.Parent = TabContainer
        
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = Section
        
        -- Create Section Header
        local Header = Instance.new("Frame")
        Header.AnchorPoint = Vector2.new(0.5, 0)
        Header.Name = "Header"
        Header.Position = UDim2.new(0.5, 0, 0, 0)
        Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Header.Size = UDim2.new(0, 264, 0, 28)
        Header.BorderSizePixel = 0
        Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Header.BackgroundTransparency = 1
        Header.Parent = Section
        
        local SectionTitle = Instance.new("TextLabel")
        SectionTitle.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        SectionTitle.TextColor3 = library.config.colors.text
        SectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SectionTitle.Text = sectionName
        SectionTitle.Name = "SectionTitle"
        SectionTitle.TextStrokeTransparency = 0.5
        SectionTitle.AnchorPoint = Vector2.new(0, 0.5)
        SectionTitle.Size = UDim2.new(0, 1, 0, 1)
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Position = UDim2.new(0, 10, 0.5, 0)
        SectionTitle.BorderSizePixel = 0
        SectionTitle.AutomaticSize = Enum.AutomaticSize.XY
        SectionTitle.TextSize = library.config.textSize
        SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.Parent = Header
        
        -- Create Section Content Holder
        local Holder = Instance.new("Frame")
        Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Holder.AnchorPoint = Vector2.new(0.5, 0)
        Holder.Name = "Holder"
        Holder.BackgroundTransparency = 1
        Holder.Position = UDim2.new(0.5, 0, 1, 0)
        Holder.Size = UDim2.new(0, 1, 0, 1)
        Holder.BorderSizePixel = 0
        Holder.AutomaticSize = Enum.AutomaticSize.XY
        Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Holder.Parent = Header
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = Holder
        
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingBottom = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 5)
        UIPadding.Parent = Holder
        
        return sectionData
    end
    
    tabs[tabIndex] = {
        name = name,
        tabHolder = TabHolder,
        tabName = TabName,
        tabContainer = TabContainer,
        liner = Liner
    }
    
    return tabData
end

-- Select Tab Function
function library:SelectTab(tabName)
    for _, tab in pairs(tabs) do
        if tab.name == tabName then
            -- Activate this tab
            tab.tabName.TextColor3 = library.config.colors.text
            tab.liner.Visible = true
            tab.tabContainer.Visible = true
            currentTab = tab
        else
            -- Deactivate other tabs
            tab.tabName.TextColor3 = library.config.colors.textDimmed
            tab.liner.Visible = false
            tab.tabContainer.Visible = false
        end
    end
end

-- Initialize Library
function library:Init()
    local gui = createBaseGui()
    self.gui = gui
    
    -- Select first tab if available
    if #tabs > 0 then
        self:SelectTab(tabs[1].name)
    end
    
    return self
end

return library
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
Divider.Position = UDim2.new(0.16566264629364014, 0, 0.5, 0)
Divider.Name = "Divider"
Divider.Size = UDim2.new(0, 2, 0, 50)
Divider.BorderSizePixel = 0
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

local TabHolder = Instance.new("Frame")
TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHolder.Name = "TabHolder"
TabHolder.BackgroundTransparency = 1
TabHolder.Position = UDim2.new(0.5357142686843872, 0, 0, 0)
TabHolder.Size = UDim2.new(0, 33, 0, 48)
TabHolder.BorderSizePixel = 0
TabHolder.AutomaticSize = Enum.AutomaticSize.XY
TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHolder.Parent = Holder

local TabName = Instance.new("TextLabel")
TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName.Text = "ExampleTab"
TabName.Name = "TabName"
TabName.TextStrokeTransparency = 0.5
TabName.AnchorPoint = Vector2.new(0.5, 0.5)
TabName.Size = UDim2.new(0, 1, 0, 1)
TabName.BackgroundTransparency = 1
TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
TabName.BorderSizePixel = 0
TabName.AutomaticSize = Enum.AutomaticSize.XY
TabName.TextSize = 14
TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName.Parent = TabHolder

local Liner = Instance.new("Frame")
Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Liner.AnchorPoint = Vector2.new(0.5, 1)
Liner.Name = "Liner"
Liner.Position = UDim2.new(0.5, 0, 1, 4)
Liner.Size = UDim2.new(1, 1, 0, 2)
Liner.BorderSizePixel = 0
Liner.AutomaticSize = Enum.AutomaticSize.XY
Liner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Liner.Parent = TabName

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 57, 73)),
	ColorSequenceKeypoint.new(0.495, Color3.fromRGB(38, 81, 103)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 57, 73))
}
UIGradient.Parent = Liner

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 2)
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.Parent = TabName

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = TabHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 13)
UIPadding.Parent = TabHolder

local TabHolder = Instance.new("Frame")
TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHolder.Name = "TabHolder"
TabHolder.BackgroundTransparency = 1
TabHolder.Position = UDim2.new(0.6857143044471741, 0, 0, 0)
TabHolder.Size = UDim2.new(0, 33, 0, 48)
TabHolder.BorderSizePixel = 0
TabHolder.AutomaticSize = Enum.AutomaticSize.XY
TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHolder.Parent = Holder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = TabHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 16)
UIPadding.Parent = TabHolder

local TabName = Instance.new("TextLabel")
TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TabName.TextColor3 = Color3.fromRGB(128, 128, 128)
TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName.Text = "ExampleTab"
TabName.Name = "TabName"
TabName.TextStrokeTransparency = 0.5
TabName.AnchorPoint = Vector2.new(0.5, 0.5)
TabName.Size = UDim2.new(0, 1, 0, 1)
TabName.BackgroundTransparency = 1
TabName.Position = UDim2.new(0.5405405163764954, 0, 8.03125, 0)
TabName.BorderSizePixel = 0
TabName.AutomaticSize = Enum.AutomaticSize.XY
TabName.TextSize = 14
TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName.Parent = TabHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.Parent = TabName

local TabHolder = Instance.new("Frame")
TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHolder.Name = "TabHolder"
TabHolder.BackgroundTransparency = 1
TabHolder.Position = UDim2.new(0.6857143044471741, 0, 0, 0)
TabHolder.Size = UDim2.new(0, 33, 0, 48)
TabHolder.BorderSizePixel = 0
TabHolder.AutomaticSize = Enum.AutomaticSize.XY
TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHolder.Parent = Holder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = TabHolder

local TabName = Instance.new("TextLabel")
TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TabName.TextColor3 = Color3.fromRGB(128, 128, 128)
TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName.Text = "ExampleTab"
TabName.Name = "TabName"
TabName.TextStrokeTransparency = 0.5
TabName.AnchorPoint = Vector2.new(0.5, 0.5)
TabName.Size = UDim2.new(0, 1, 0, 1)
TabName.BackgroundTransparency = 1
TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
TabName.BorderSizePixel = 0
TabName.AutomaticSize = Enum.AutomaticSize.XY
TabName.TextSize = 14
TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName.Parent = TabHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.Parent = TabName

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 16)
UIPadding.Parent = TabHolder

local TabHolder = Instance.new("Frame")
TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHolder.Name = "TabHolder"
TabHolder.BackgroundTransparency = 1
TabHolder.Position = UDim2.new(0.8795180916786194, 0, 0, 0)
TabHolder.Size = UDim2.new(0, 52, 0, 48)
TabHolder.BorderSizePixel = 0
TabHolder.AutomaticSize = Enum.AutomaticSize.XY
TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHolder.Parent = Holder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = TabHolder

local TabName = Instance.new("TextLabel")
TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TabName.TextColor3 = Color3.fromRGB(128, 128, 128)
TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName.Text = "ExampleTab"
TabName.Name = "TabName"
TabName.TextStrokeTransparency = 0.5
TabName.AnchorPoint = Vector2.new(0.5, 0.5)
TabName.Size = UDim2.new(0, 1, 0, 1)
TabName.BackgroundTransparency = 1
TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
TabName.BorderSizePixel = 0
TabName.AutomaticSize = Enum.AutomaticSize.XY
TabName.TextSize = 14
TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName.Parent = TabHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.Parent = TabName

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 16)
UIPadding.Parent = TabHolder

local Divider = Instance.new("Frame")
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.AnchorPoint = Vector2.new(0.5, 0.5)
Divider.BackgroundTransparency = 1
Divider.Position = UDim2.new(0.5, 0, 0.5, 0)
Divider.Name = "Divider"
Divider.Size = UDim2.new(0, 2, 0, 50)
Divider.BorderSizePixel = 0
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(42, 42, 43)
UIStroke.Parent = Search

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

local Section_Left = Instance.new("Frame")
Section_Left.ClipsDescendants = true
Section_Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section_Left.Name = "Section_Left"
Section_Left.BackgroundTransparency = 0.6499999761581421
Section_Left.Position = UDim2.new(0.14868520200252533, 0, 0.4112521708011627, 0)
Section_Left.Size = UDim2.new(0, 264, 0, 40)
Section_Left.BorderSizePixel = 0
Section_Left.AutomaticSize = Enum.AutomaticSize.Y
Section_Left.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
Section_Left.Parent = Container

local Header = Instance.new("Frame")
Header.AnchorPoint = Vector2.new(0.5, 0)
Header.Name = "Header"
Header.Position = UDim2.new(0.5, 0, 0, 0)
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.Size = UDim2.new(0, 264, 0, 28)
Header.BorderSizePixel = 0
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.Parent = Section_Left

local Holder = Instance.new("Frame")
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.AnchorPoint = Vector2.new(0.5, 0)
Holder.Name = "Holder"
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0.5, 0, 1, 0)
Holder.Size = UDim2.new(0, 1, 0, 1)
Holder.BorderSizePixel = 0
Holder.AutomaticSize = Enum.AutomaticSize.XY
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.Parent = Header

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Holder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 45)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.Parent = Holder

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.Name = "Toggle"
Toggle.Position = UDim2.new(1, -35, 0.5, 0)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "NonActiveToggle"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local ConfigurationPopup = Instance.new("ImageLabel")
ConfigurationPopup.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigurationPopup.Name = "ConfigurationPopup"
ConfigurationPopup.AnchorPoint = Vector2.new(1, 0.5)
ConfigurationPopup.Image = "rbxassetid://106536566121869"
ConfigurationPopup.BackgroundTransparency = 1
ConfigurationPopup.Position = UDim2.new(1, -12, 0.5, 0)

ConfigurationPopup.Size = UDim2.new(0, 16, 0, 16)
ConfigurationPopup.BorderSizePixel = 0
ConfigurationPopup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigurationPopup.Parent = Toggle_Component

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.BackgroundTransparency = 0.5
Toggle.Position = UDim2.new(1, -35, 0.5, 0)
Toggle.Name = "Toggle"
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(62, 119, 150)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(62, 119, 150)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "ActiveToggle"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local ConfigurationPopup = Instance.new("ImageLabel")
ConfigurationPopup.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigurationPopup.Name = "ConfigurationPopup"
ConfigurationPopup.AnchorPoint = Vector2.new(1, 0.5)
ConfigurationPopup.Image = "rbxassetid://106536566121869"
ConfigurationPopup.BackgroundTransparency = 1
ConfigurationPopup.Position = UDim2.new(1, -12, 0.5, 0)

ConfigurationPopup.Size = UDim2.new(0, 16, 0, 16)
ConfigurationPopup.BorderSizePixel = 0
ConfigurationPopup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigurationPopup.Parent = Toggle_Component

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.BackgroundTransparency = 0.5
Toggle.Position = UDim2.new(1, -69, 0.5, 0)
Toggle.Name = "Toggle"
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(62, 119, 150)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(62, 119, 150)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "ActiveColorToggle"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local ConfigurationPopup = Instance.new("ImageLabel")
ConfigurationPopup.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigurationPopup.Name = "ConfigurationPopup"
ConfigurationPopup.AnchorPoint = Vector2.new(1, 0.5)
ConfigurationPopup.Image = "rbxassetid://106536566121869"
ConfigurationPopup.BackgroundTransparency = 1
ConfigurationPopup.Position = UDim2.new(1, -12, 0.5, 0)

ConfigurationPopup.Size = UDim2.new(0, 16, 0, 16)
ConfigurationPopup.BorderSizePixel = 0
ConfigurationPopup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigurationPopup.Parent = Toggle_Component

local ColorFrame = Instance.new("Frame")
ColorFrame.AnchorPoint = Vector2.new(1, 0.5)
ColorFrame.Name = "ColorFrame"
ColorFrame.Position = UDim2.new(1, -32, 0.5, 0)
ColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ColorFrame.Size = UDim2.new(0, 28, 0, 14)
ColorFrame.BorderSizePixel = 0
ColorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorFrame.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = ColorFrame

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.Name = "Toggle"
Toggle.Position = UDim2.new(1, -44, 0.5, 0)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "NonActiveToggleWithColor"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local ColorFrame = Instance.new("Frame")
ColorFrame.AnchorPoint = Vector2.new(1, 0.5)
ColorFrame.Name = "ColorFrame"
ColorFrame.Position = UDim2.new(1, -10, 0.5, 0)
ColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ColorFrame.Size = UDim2.new(0, 28, 0, 14)
ColorFrame.BorderSizePixel = 0
ColorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorFrame.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = ColorFrame

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.BackgroundTransparency = 0.5
Toggle.Position = UDim2.new(1, -98, 0.5, 0)
Toggle.Name = "Toggle"
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(62, 119, 150)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(62, 119, 150)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "ActiveColor+OptionToggle"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local ConfigurationPopup = Instance.new("ImageLabel")
ConfigurationPopup.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigurationPopup.Name = "ConfigurationPopup"
ConfigurationPopup.Size = UDim2.new(0, 16, 0, 16)
ConfigurationPopup.AnchorPoint = Vector2.new(1, 0.5)
ConfigurationPopup.Image = "rbxassetid://106536566121869"
ConfigurationPopup.BackgroundTransparency = 1
ConfigurationPopup.Position = UDim2.new(1, -12, 0.5, 0)

ConfigurationPopup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigurationPopup.BorderSizePixel = 0
ConfigurationPopup.SliceCenter = Rect.new(Vector2.new(0, 0), Vector2.new(1024, 1024))
ConfigurationPopup.Parent = Toggle_Component

local ColorFrame1 = Instance.new("Frame")
ColorFrame1.AnchorPoint = Vector2.new(1, 0.5)
ColorFrame1.Name = "ColorFrame1"
ColorFrame1.Position = UDim2.new(0.9959999918937683, -30, 0.5, 0)
ColorFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
ColorFrame1.Size = UDim2.new(0, 27, 0, 14)
ColorFrame1.BorderSizePixel = 0
ColorFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorFrame1.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = ColorFrame1

local ColorFrame2 = Instance.new("Frame")
ColorFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ColorFrame2.AnchorPoint = Vector2.new(1, 0.5)
ColorFrame2.BackgroundTransparency = 1
ColorFrame2.Position = UDim2.new(1, -64, 0.5, 0)
ColorFrame2.Name = "ColorFrame2"
ColorFrame2.Size = UDim2.new(0, 28, 0, 14)
ColorFrame2.BorderSizePixel = 0
ColorFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorFrame2.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = ColorFrame2

local Checkered = Instance.new("ImageLabel")
Checkered.ScaleType = Enum.ScaleType.Slice
Checkered.ImageTransparency = 0.3100000023841858
Checkered.BorderColor3 = Color3.fromRGB(0, 0, 0)
Checkered.Name = "Checkered"
Checkered.Image = "rbxassetid://92428296448540"
Checkered.BackgroundTransparency = 1
Checkered.Size = UDim2.new(1, 1, 1, 1)

Checkered.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Checkered.BorderSizePixel = 0
Checkered.SliceCenter = Rect.new(Vector2.new(0, 80), Vector2.new(433, 352))
Checkered.Parent = ColorFrame2

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Checkered

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = ColorFrame2

local Dropdown_Component = Instance.new("Frame")
Dropdown_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dropdown_Component.AnchorPoint = Vector2.new(0.5, 0)
Dropdown_Component.BackgroundTransparency = 1
Dropdown_Component.Position = UDim2.new(0.5, 0, 0, 0)
Dropdown_Component.Name = "Dropdown_Component"
Dropdown_Component.Size = UDim2.new(0, 262, 0, 25)
Dropdown_Component.BorderSizePixel = 0
Dropdown_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Dropdown_Component.Parent = Holder

local DropdownLabel = Instance.new("TextLabel")
DropdownLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
DropdownLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
DropdownLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
DropdownLabel.Text = "ExampleDropdown"
DropdownLabel.Name = "DropdownLabel"
DropdownLabel.TextStrokeTransparency = 0
DropdownLabel.AnchorPoint = Vector2.new(0, 0.5)
DropdownLabel.Size = UDim2.new(0, 1, 0, 1)
DropdownLabel.BackgroundTransparency = 1
DropdownLabel.Position = UDim2.new(0, 9, 0.5, 0)
DropdownLabel.BorderSizePixel = 0
DropdownLabel.AutomaticSize = Enum.AutomaticSize.XY
DropdownLabel.TextSize = 14
DropdownLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownLabel.Parent = Dropdown_Component

local Dropdown = Instance.new("Frame")
Dropdown.AnchorPoint = Vector2.new(1, 0.5)
Dropdown.Name = "Dropdown"
Dropdown.Position = UDim2.new(1, -9, 0.5, 0)
Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dropdown.Size = UDim2.new(0, 100, 0, 18)
Dropdown.BorderSizePixel = 0
Dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Dropdown.Parent = Dropdown_Component

local Icon = Instance.new("ImageLabel")
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.Name = "Icon"
Icon.Size = UDim2.new(0, 16, 0, 16)
Icon.AnchorPoint = Vector2.new(1, 0.5)
Icon.Image = "rbxassetid://106536566121869"
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(1, -4, 0.5, 0)

Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BorderSizePixel = 0
Icon.SliceCenter = Rect.new(Vector2.new(0, 0), Vector2.new(1024, 1024))
Icon.Parent = Dropdown

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(55, 55, 55)
UIStroke.Parent = Dropdown

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Dropdown

local Option = Instance.new("TextLabel")
Option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Option.TextColor3 = Color3.fromRGB(133, 133, 133)
Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
Option.Text = "Option1"
Option.Name = "Option"
Option.TextStrokeTransparency = 0
Option.AnchorPoint = Vector2.new(0, 0.5)
Option.Size = UDim2.new(0, 1, 0, 1)
Option.BackgroundTransparency = 1
Option.Position = UDim2.new(0, 2, 0.5, 0)
Option.BorderSizePixel = 0
Option.AutomaticSize = Enum.AutomaticSize.XY
Option.TextSize = 14
Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Option.Parent = Dropdown

local Dropdown_Component = Instance.new("Frame")
Dropdown_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dropdown_Component.AnchorPoint = Vector2.new(0.5, 0)
Dropdown_Component.BackgroundTransparency = 1
Dropdown_Component.Position = UDim2.new(0.5, 0, 0, 0)
Dropdown_Component.Name = "Dropdown_Component"
Dropdown_Component.Size = UDim2.new(0, 262, 0, 25)
Dropdown_Component.BorderSizePixel = 0
Dropdown_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Dropdown_Component.Parent = Holder

local DropdownLabel = Instance.new("TextLabel")
DropdownLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
DropdownLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
DropdownLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
DropdownLabel.Text = "Dropdown+Toggle"
DropdownLabel.Name = "DropdownLabel"
DropdownLabel.TextStrokeTransparency = 0
DropdownLabel.AnchorPoint = Vector2.new(0, 0.5)
DropdownLabel.Size = UDim2.new(0, 1, 0, 1)
DropdownLabel.BackgroundTransparency = 1
DropdownLabel.Position = UDim2.new(0, 9, 0.5, 0)
DropdownLabel.BorderSizePixel = 0
DropdownLabel.AutomaticSize = Enum.AutomaticSize.XY
DropdownLabel.TextSize = 14
DropdownLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownLabel.Parent = Dropdown_Component

local Dropdown = Instance.new("Frame")
Dropdown.AnchorPoint = Vector2.new(1, 0.5)
Dropdown.Name = "Dropdown"
Dropdown.Position = UDim2.new(1, -9, 0.5, 0)
Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dropdown.Size = UDim2.new(0, 100, 0, 18)
Dropdown.BorderSizePixel = 0
Dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Dropdown.Parent = Dropdown_Component

local Option = Instance.new("TextLabel")
Option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Option.TextColor3 = Color3.fromRGB(133, 133, 133)
Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
Option.Text = "Option1"
Option.Name = "Option"
Option.TextStrokeTransparency = 0
Option.AnchorPoint = Vector2.new(0, 0.5)
Option.Size = UDim2.new(0, 1, 0, 1)
Option.BackgroundTransparency = 1
Option.Position = UDim2.new(0, 2, 0.5, 0)
Option.BorderSizePixel = 0
Option.AutomaticSize = Enum.AutomaticSize.XY
Option.TextSize = 14
Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Option.Parent = Dropdown

local Icon = Instance.new("ImageLabel")
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.Name = "Icon"
Icon.Size = UDim2.new(0, 16, 0, 16)
Icon.AnchorPoint = Vector2.new(1, 0.5)
Icon.Image = "rbxassetid://106536566121869"
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(1, -4, 0.5, 0)

Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BorderSizePixel = 0
Icon.SliceCenter = Rect.new(Vector2.new(0, 0), Vector2.new(1024, 1024))
Icon.Parent = Dropdown

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(55, 55, 55)
UIStroke.Parent = Dropdown

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Dropdown

local Toggle = Instance.new("Frame")
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.Name = "Toggle"
Toggle.Position = UDim2.new(1, -120, 0.5, 0)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.Parent = Dropdown_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Toggle

local Button_Component = Instance.new("Frame")
Button_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button_Component.AnchorPoint = Vector2.new(0.5, 0)
Button_Component.BackgroundTransparency = 1
Button_Component.Position = UDim2.new(0.5, 0, 0, 0)
Button_Component.Name = "Button_Component"
Button_Component.Size = UDim2.new(0, 262, 0, 25)
Button_Component.BorderSizePixel = 0
Button_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Button_Component.Parent = Holder

local Button = Instance.new("Frame")
Button.AnchorPoint = Vector2.new(1, 0.5)
Button.Name = "Button"
Button.Position = UDim2.new(1, -9, 0.5, 0)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.Size = UDim2.new(0, 244, 0, 20)
Button.BorderSizePixel = 0
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.Parent = Button_Component

local ButtonText = Instance.new("TextLabel")
ButtonText.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ButtonText.TextColor3 = Color3.fromRGB(133, 133, 133)
ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonText.Text = "Option1"
ButtonText.Name = "ButtonText"
ButtonText.TextStrokeTransparency = 0
ButtonText.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonText.Size = UDim2.new(0, 1, 0, 1)
ButtonText.BackgroundTransparency = 1
ButtonText.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonText.BorderSizePixel = 0
ButtonText.AutomaticSize = Enum.AutomaticSize.XY
ButtonText.TextSize = 14
ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonText.Parent = Button

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(55, 55, 55)
UIStroke.Parent = Button

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Button

local Keybind_Component = Instance.new("Frame")
Keybind_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind_Component.AnchorPoint = Vector2.new(0.5, 0)
Keybind_Component.BackgroundTransparency = 1
Keybind_Component.Position = UDim2.new(0.5, 0, 0, 0)
Keybind_Component.Name = "Keybind_Component"
Keybind_Component.Size = UDim2.new(0, 262, 0, 25)
Keybind_Component.BorderSizePixel = 0
Keybind_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind_Component.Parent = Holder

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(1, 0.5)
Keybind.Name = "Keybind"
Keybind.Position = UDim2.new(1, -15, 0.5, 0)
Keybind.Size = UDim2.new(0, 43, 0, 14)
Keybind.BorderSizePixel = 0
Keybind.AutomaticSize = Enum.AutomaticSize.XY
Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Keybind.Parent = Keybind_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Keybind

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Keybind

local KeybindValue = Instance.new("TextLabel")
KeybindValue.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
KeybindValue.TextColor3 = Color3.fromRGB(133, 133, 133)
KeybindValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeybindValue.Text = "NonActiveToggle"
KeybindValue.Name = "KeybindValue"
KeybindValue.TextStrokeTransparency = 0
KeybindValue.AnchorPoint = Vector2.new(0, 0.5)
KeybindValue.Size = UDim2.new(0, 1, 0, 1)
KeybindValue.BackgroundTransparency = 1
KeybindValue.Position = UDim2.new(0, 9, 0.5, 0)
KeybindValue.BorderSizePixel = 0
KeybindValue.AutomaticSize = Enum.AutomaticSize.XY
KeybindValue.TextSize = 14
KeybindValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeybindValue.Parent = Keybind

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Keybind

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 2)
UIPadding.PaddingLeft = UDim.new(0, 2)
UIPadding.Parent = Keybind

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "ActiveKeybind"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Keybind_Component

local Toggle_Component = Instance.new("Frame")
Toggle_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Component.AnchorPoint = Vector2.new(0.5, 0)
Toggle_Component.BackgroundTransparency = 1
Toggle_Component.Position = UDim2.new(0.5, 0, 0, 0)
Toggle_Component.Name = "Toggle_Component"
Toggle_Component.Size = UDim2.new(0, 262, 0, 25)
Toggle_Component.BorderSizePixel = 0
Toggle_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Toggle_Component.Parent = Holder

local Toggle = Instance.new("Frame")
Toggle.AnchorPoint = Vector2.new(1, 0.5)
Toggle.Name = "Toggle"
Toggle.Position = UDim2.new(1, -15, 0.5, 0)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Size = UDim2.new(0, 14, 0, 14)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.Parent = Toggle_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Toggle

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Toggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "NonActiveToggle"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Toggle_Component

local Keybind_Component = Instance.new("Frame")
Keybind_Component.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind_Component.AnchorPoint = Vector2.new(0.5, 0)
Keybind_Component.BackgroundTransparency = 1
Keybind_Component.Position = UDim2.new(0.5, 0, 0, 0)
Keybind_Component.Name = "Keybind_Component"
Keybind_Component.Size = UDim2.new(0, 262, 0, 25)
Keybind_Component.BorderSizePixel = 0
Keybind_Component.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind_Component.Parent = Holder

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(1, 0.5)
Keybind.Name = "Keybind"
Keybind.Position = UDim2.new(1, -15, 0.5, 0)
Keybind.Size = UDim2.new(0, 20, 0, 14)
Keybind.BorderSizePixel = 0
Keybind.AutomaticSize = Enum.AutomaticSize.XY
Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Keybind.Parent = Keybind_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Keybind

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = Keybind

local KeybindValue = Instance.new("TextLabel")
KeybindValue.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
KeybindValue.TextColor3 = Color3.fromRGB(180, 180, 180)
KeybindValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeybindValue.Text = "-"
KeybindValue.Name = "KeybindValue"
KeybindValue.TextStrokeTransparency = 0
KeybindValue.AnchorPoint = Vector2.new(0.5, 0.5)
KeybindValue.Size = UDim2.new(0, 1, 0, 1)
KeybindValue.BackgroundTransparency = 1
KeybindValue.Position = UDim2.new(0.5, 0, 0.5, 0)
KeybindValue.BorderSizePixel = 0
KeybindValue.AutomaticSize = Enum.AutomaticSize.XY
KeybindValue.TextSize = 14
KeybindValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeybindValue.Parent = Keybind

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = Keybind

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 2)
UIPadding.PaddingLeft = UDim.new(0, 2)
UIPadding.Parent = Keybind

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ToggleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleLabel.Text = "NonActiveKey"
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.TextStrokeTransparency = 0
ToggleLabel.AnchorPoint = Vector2.new(0, 0.5)
ToggleLabel.Size = UDim2.new(0, 1, 0, 1)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 9, 0.5, 0)
ToggleLabel.BorderSizePixel = 0
ToggleLabel.AutomaticSize = Enum.AutomaticSize.XY
ToggleLabel.TextSize = 14
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Parent = Keybind_Component

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Header

local Liner = Instance.new("Frame")
Liner.AnchorPoint = Vector2.new(0.5, 1)
Liner.Name = "Liner"
Liner.Position = UDim2.new(0.5, 0, 1, 0)
Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Liner.Size = UDim2.new(1, 1, 0, 1)
Liner.BorderSizePixel = 0
Liner.BackgroundColor3 = Color3.fromRGB(21, 21, 25)
Liner.Parent = Header

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 90
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 31, 31)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(21, 21, 20))
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

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "LeftSection"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0, 7, 0.5, -1)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = Header

local SubHolder = Instance.new("Frame")
SubHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubHolder.AnchorPoint = Vector2.new(1, 0.5)
SubHolder.Name = "SubHolder"
SubHolder.BackgroundTransparency = 1
SubHolder.Position = UDim2.new(1, 0, 0.5, 0)
SubHolder.Size = UDim2.new(0, 140, 0, 27)
SubHolder.BorderSizePixel = 0
SubHolder.AutomaticSize = Enum.AutomaticSize.XY
SubHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubHolder.Parent = Header

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(180, 180, 180)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "ActiveSubTab"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.Padding = UDim.new(0, 9)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SubHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.Parent = SubHolder

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(133, 133, 133)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "SubTab1"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(133, 133, 133)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "SubTab2"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Section_Left

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(43, 43, 43)
UIStroke.Parent = Section_Left

local Section_Right = Instance.new("Frame")
Section_Right.ClipsDescendants = true
Section_Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section_Right.Name = "Section_Right"
Section_Right.BackgroundTransparency = 0.6499999761581421
Section_Right.Position = UDim2.new(0.14868520200252533, 0, 0.4112521708011627, 0)
Section_Right.Size = UDim2.new(0, 264, 0, 40)
Section_Right.BorderSizePixel = 0
Section_Right.AutomaticSize = Enum.AutomaticSize.Y
Section_Right.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
Section_Right.Parent = Container

local Header = Instance.new("Frame")
Header.AnchorPoint = Vector2.new(0.5, 0)
Header.Name = "Header"
Header.Position = UDim2.new(0.5, 0, 0, 0)
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.Size = UDim2.new(0, 264, 0, 28)
Header.BorderSizePixel = 0
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.Parent = Section_Right

local Holder = Instance.new("Frame")
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.AnchorPoint = Vector2.new(0.5, 0)
Holder.Name = "Holder"
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0.5, 0, 1, 0)
Holder.Size = UDim2.new(0, 1, 0, 1)
Holder.BorderSizePixel = 0
Holder.AutomaticSize = Enum.AutomaticSize.XY
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.Parent = Header

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Holder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 45)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.Parent = Holder

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Header

local Liner = Instance.new("Frame")
Liner.AnchorPoint = Vector2.new(0.5, 1)
Liner.Name = "Liner"
Liner.Position = UDim2.new(0.5, 0, 1, 0)
Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Liner.Size = UDim2.new(1, 1, 0, 1)
Liner.BorderSizePixel = 0
Liner.BackgroundColor3 = Color3.fromRGB(21, 21, 25)
Liner.Parent = Header

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 90
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 31, 31)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(21, 21, 20))
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

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "LeftSection"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0, 7, 0.5, -1)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = Header

local SubHolder = Instance.new("Frame")
SubHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubHolder.AnchorPoint = Vector2.new(1, 0.5)
SubHolder.Name = "SubHolder"
SubHolder.BackgroundTransparency = 1
SubHolder.Position = UDim2.new(1, 0, 0.5, 0)
SubHolder.Size = UDim2.new(0, 140, 0, 27)
SubHolder.BorderSizePixel = 0
SubHolder.AutomaticSize = Enum.AutomaticSize.XY
SubHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubHolder.Parent = Header

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(180, 180, 180)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "ActiveSubTab"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.Padding = UDim.new(0, 9)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SubHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.Parent = SubHolder

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(133, 133, 133)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "SubTab1"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local SubtabName = Instance.new("TextLabel")
SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SubtabName.TextColor3 = Color3.fromRGB(133, 133, 133)
SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubtabName.Text = "SubTab2"
SubtabName.Name = "SubtabName"
SubtabName.TextStrokeTransparency = 0
SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
SubtabName.Size = UDim2.new(0, 1, 0, 1)
SubtabName.BackgroundTransparency = 1
SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
SubtabName.BorderSizePixel = 0
SubtabName.AutomaticSize = Enum.AutomaticSize.XY
SubtabName.TextSize = 14
SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubtabName.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Section_Right

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(43, 43, 43)
UIStroke.Parent = Section_Right

local Config_Section = Instance.new("Frame")
Config_Section.ClipsDescendants = true
Config_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Config_Section.Name = "Config_Section"
Config_Section.BackgroundTransparency = 0.6499999761581421
Config_Section.Position = UDim2.new(0, 0, -0.18501171469688416, 0)
Config_Section.Size = UDim2.new(0, 264, 0, 425)
Config_Section.BorderSizePixel = 0
Config_Section.AutomaticSize = Enum.AutomaticSize.Y
Config_Section.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
Config_Section.Parent = Container

local Header = Instance.new("Frame")
Header.AnchorPoint = Vector2.new(0.5, 0)
Header.Name = "Header"
Header.Position = UDim2.new(0.5, 0, 0, 0)
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.Size = UDim2.new(0, 264, 0, 28)
Header.BorderSizePixel = 0
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.Parent = Config_Section

local Holder = Instance.new("Frame")
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.AnchorPoint = Vector2.new(0.5, 0)
Holder.Name = "Holder"
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0.5, 0, 1, 0)
Holder.Size = UDim2.new(0, 1, 0, 1)
Holder.BorderSizePixel = 0
Holder.AutomaticSize = Enum.AutomaticSize.XY
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.Parent = Header

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Holder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 45)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.Parent = Holder

local Config_Container = Instance.new("Frame")
Config_Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
Config_Container.AnchorPoint = Vector2.new(0.5, 0)
Config_Container.BackgroundTransparency = 1
Config_Container.Position = UDim2.new(0.5, 0, 0, 0)
Config_Container.Name = "Config_Container"
Config_Container.Size = UDim2.new(0, 262, 0, 365)
Config_Container.BorderSizePixel = 0
Config_Container.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Config_Container.Parent = Holder

local Label = Instance.new("TextLabel")
Label.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Label.TextColor3 = Color3.fromRGB(180, 180, 180)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.Text = "List"
Label.TextStrokeTransparency = 0
Label.Name = "Label"
Label.Size = UDim2.new(0, 1, 0, 1)
Label.BackgroundTransparency = 1
Label.Position = UDim2.new(0, 9, 0, 11)
Label.BorderSizePixel = 0
Label.AutomaticSize = Enum.AutomaticSize.XY
Label.TextSize = 14
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.Parent = Config_Container

local Holder = Instance.new("Frame")
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.AnchorPoint = Vector2.new(0.5, 1)
Holder.BackgroundTransparency = 0.30000001192092896
Holder.Position = UDim2.new(0.5, 0, 1, -58)
Holder.Name = "Holder"
Holder.Size = UDim2.new(0, 244, 0, 272)
Holder.BorderSizePixel = 0
Holder.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
Holder.Parent = Config_Container

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Holder

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(43, 43, 43)
UIStroke.Parent = Holder

local ListContainer = Instance.new("ScrollingFrame")
ListContainer.ScrollBarImageColor3 = Color3.fromRGB(62, 119, 150)
ListContainer.Active = true
ListContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
ListContainer.ScrollBarThickness = 0
ListContainer.AnchorPoint = Vector2.new(0.5, 0)
ListContainer.BackgroundTransparency = 1
ListContainer.Position = UDim2.new(0.5, 0, 0, 0)
ListContainer.Name = "ListContainer"
ListContainer.Size = UDim2.new(0, 240, 0, 272)
ListContainer.BorderSizePixel = 0
ListContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ListContainer.Parent = Holder

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = ListContainer

local NewConfig = Instance.new("Frame")
NewConfig.BackgroundTransparency = 1
NewConfig.Name = "NewConfig"
NewConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
NewConfig.Size = UDim2.new(0, 242, 0, 25)
NewConfig.BorderSizePixel = 0
NewConfig.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NewConfig.Parent = ListContainer

local ConfigName = Instance.new("TextLabel")
ConfigName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ConfigName.TextColor3 = Color3.fromRGB(62, 119, 150)
ConfigName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigName.Text = "Configs"
ConfigName.Name = "ConfigName"
ConfigName.TextStrokeTransparency = 0
ConfigName.AnchorPoint = Vector2.new(0, 0.5)
ConfigName.Size = UDim2.new(0, 1, 0, 1)
ConfigName.BackgroundTransparency = 1
ConfigName.Position = UDim2.new(0, 7, 0.5, -1)
ConfigName.BorderSizePixel = 0
ConfigName.AutomaticSize = Enum.AutomaticSize.XY
ConfigName.TextSize = 14
ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigName.Parent = NewConfig

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ListContainer

local NewConfig = Instance.new("Frame")
NewConfig.BackgroundTransparency = 1
NewConfig.Name = "NewConfig"
NewConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
NewConfig.Size = UDim2.new(0, 242, 0, 25)
NewConfig.BorderSizePixel = 0
NewConfig.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NewConfig.Parent = ListContainer

local ConfigName = Instance.new("TextLabel")
ConfigName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ConfigName.TextColor3 = Color3.fromRGB(132, 132, 132)
ConfigName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigName.Text = "Configs"
ConfigName.Name = "ConfigName"
ConfigName.TextStrokeTransparency = 0
ConfigName.AnchorPoint = Vector2.new(0, 0.5)
ConfigName.Size = UDim2.new(0, 1, 0, 1)
ConfigName.BackgroundTransparency = 1
ConfigName.Position = UDim2.new(0, 7, 0.5, -1)
ConfigName.BorderSizePixel = 0
ConfigName.AutomaticSize = Enum.AutomaticSize.XY
ConfigName.TextSize = 14
ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigName.Parent = NewConfig

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 3)
UIPadding.Parent = ListContainer

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Header

local Liner = Instance.new("Frame")
Liner.AnchorPoint = Vector2.new(0.5, 1)
Liner.Name = "Liner"
Liner.Position = UDim2.new(0.5, 0, 1, 0)
Liner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Liner.Size = UDim2.new(1, 1, 0, 1)
Liner.BorderSizePixel = 0
Liner.BackgroundColor3 = Color3.fromRGB(21, 21, 25)
Liner.Parent = Header

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 90
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 31, 31)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(21, 21, 20))
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

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "Configs"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0, 7, 0.5, -1)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = Header

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Config_Section

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(43, 43, 43)
UIStroke.Parent = Config_Section

local CreateConfigTextInput = Instance.new("Frame")
CreateConfigTextInput.AnchorPoint = Vector2.new(0, 1)
CreateConfigTextInput.Name = "CreateConfigTextInput"
CreateConfigTextInput.Position = UDim2.new(0, 9, 1, -45)
CreateConfigTextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreateConfigTextInput.Size = UDim2.new(0, 186, 0, 30)
CreateConfigTextInput.BorderSizePixel = 0
CreateConfigTextInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CreateConfigTextInput.Parent = Config_Section

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = CreateConfigTextInput

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = CreateConfigTextInput

local TextBox = Instance.new("TextBox")
TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextBox.Size = UDim2.new(0, 1, 0, 1)
TextBox.TextColor3 = Color3.fromRGB(180, 180, 180)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.Text = ""
TextBox.Position = UDim2.new(0, 7, 0.5, 0)
TextBox.TextStrokeTransparency = 0
TextBox.AnchorPoint = Vector2.new(0, 0.5)
TextBox.BorderSizePixel = 0
TextBox.BackgroundTransparency = 1
TextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
TextBox.AutomaticSize = Enum.AutomaticSize.XY
TextBox.PlaceholderText = "new config"
TextBox.TextSize = 14
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = CreateConfigTextInput

local CreateConfigButton = Instance.new("Frame")
CreateConfigButton.AnchorPoint = Vector2.new(0, 1)
CreateConfigButton.Name = "CreateConfigButton"
CreateConfigButton.Position = UDim2.new(0, 201, 1, -45)
CreateConfigButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreateConfigButton.Size = UDim2.new(0, 51, 0, 30)
CreateConfigButton.BorderSizePixel = 0
CreateConfigButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CreateConfigButton.Parent = Config_Section

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = CreateConfigButton

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = CreateConfigButton

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "create"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0, 7, 0.5, -1)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = CreateConfigButton

local CreateConfigTextInput = Instance.new("Frame")
CreateConfigTextInput.AnchorPoint = Vector2.new(0, 1)
CreateConfigTextInput.Name = "CreateConfigTextInput"
CreateConfigTextInput.Position = UDim2.new(0, 9, 1, -9)
CreateConfigTextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreateConfigTextInput.Size = UDim2.new(0, 117, 0, 30)
CreateConfigTextInput.BorderSizePixel = 0
CreateConfigTextInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CreateConfigTextInput.Parent = Config_Section

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = CreateConfigTextInput

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = CreateConfigTextInput

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "delete"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0.5, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0.5, 0, 0.5, 0)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = CreateConfigTextInput

local CreateConfigTextInput = Instance.new("Frame")
CreateConfigTextInput.AnchorPoint = Vector2.new(0, 1)
CreateConfigTextInput.Name = "CreateConfigTextInput"
CreateConfigTextInput.Position = UDim2.new(0, 132, 1, -9)
CreateConfigTextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreateConfigTextInput.Size = UDim2.new(0, 121, 0, 30)
CreateConfigTextInput.BorderSizePixel = 0
CreateConfigTextInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CreateConfigTextInput.Parent = Config_Section

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(44, 44, 44)
UIStroke.Parent = CreateConfigTextInput

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = CreateConfigTextInput

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "load"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0.5, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0.5, 0, 0.5, 0)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = CreateConfigTextInput

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

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(62, 119, 150)
UIStroke.Parent = MainFrame

local Section_Left = Instance.new("Frame")
Section_Left.ClipsDescendants = true
Section_Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section_Left.AnchorPoint = Vector2.new(0.5, 0.5)
Section_Left.Name = "Section_Left"
Section_Left.Position = UDim2.new(0.6188461780548096, 0, 0.4393564462661743, 0)
Section_Left.Size = UDim2.new(0, 137, 0, 75)
Section_Left.BorderSizePixel = 0
Section_Left.AutomaticSize = Enum.AutomaticSize.XY
Section_Left.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
Section_Left.Parent = ScreenGui

local Header = Instance.new("Frame")
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.AnchorPoint = Vector2.new(0.5, 0)
Header.Name = "Header"
Header.Position = UDim2.new(0.5009124279022217, 0, 0, 0)
Header.Size = UDim2.new(0, 136, 0, 28)
Header.BorderSizePixel = 0
Header.AutomaticSize = Enum.AutomaticSize.X
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.Parent = Section_Left

local Holder = Instance.new("Frame")
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.AnchorPoint = Vector2.new(0.5, 0)
Holder.Name = "Holder"
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0.5, 0, 1, 0)
Holder.Size = UDim2.new(0, 1, 0, 1)
Holder.BorderSizePixel = 0
Holder.AutomaticSize = Enum.AutomaticSize.XY
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.Parent = Header

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Holder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 35)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.Parent = Holder

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[toggle] aimbot  - f"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local Keybind = Instance.new("Frame")
Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keybind.AnchorPoint = Vector2.new(0.5, 0)
Keybind.BackgroundTransparency = 1
Keybind.Position = UDim2.new(0.9562045931816101, 0, 0, 0)
Keybind.Name = "Keybind"
Keybind.Size = UDim2.new(0, 136, 0, 25)
Keybind.BorderSizePixel = 0
Keybind.BackgroundColor3 = Color3.fromRGB(23, 25, 37)
Keybind.Parent = Holder

local ActiveKeybind = Instance.new("TextLabel")
ActiveKeybind.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
ActiveKeybind.TextColor3 = Color3.fromRGB(166, 166, 166)
ActiveKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveKeybind.Text = "[always] speed  -  z"
ActiveKeybind.Name = "ActiveKeybind"
ActiveKeybind.TextStrokeTransparency = 0
ActiveKeybind.AnchorPoint = Vector2.new(0, 0.5)
ActiveKeybind.Size = UDim2.new(0, 1, 0, 1)
ActiveKeybind.BackgroundTransparency = 1
ActiveKeybind.Position = UDim2.new(0, 9, 0.5, 0)
ActiveKeybind.BorderSizePixel = 0
ActiveKeybind.AutomaticSize = Enum.AutomaticSize.XY
ActiveKeybind.TextSize = 14
ActiveKeybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveKeybind.Parent = Keybind

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Header

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 180
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 31, 31)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(21, 21, 20))
}
UIGradient.Parent = Header

local SubHolder = Instance.new("Frame")
SubHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubHolder.AnchorPoint = Vector2.new(1, 0.5)
SubHolder.Name = "SubHolder"
SubHolder.BackgroundTransparency = 1
SubHolder.Position = UDim2.new(1, 0, 0.5, 0)
SubHolder.Size = UDim2.new(0, 140, 0, 27)
SubHolder.BorderSizePixel = 0
SubHolder.AutomaticSize = Enum.AutomaticSize.XY
SubHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubHolder.Parent = Header

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.Padding = UDim.new(0, 9)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SubHolder

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.Parent = SubHolder

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

local SectionSubTab = Instance.new("Frame")
SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionSubTab.Name = "SectionSubTab"
SectionSubTab.BackgroundTransparency = 1
SectionSubTab.Position = UDim2.new(0.478759765625, 0, 0, 0)
SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
SectionSubTab.BorderSizePixel = 0
SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionSubTab.Parent = SubHolder

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = SectionSubTab

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.Parent = SectionSubTab

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

local SectionName = Instance.new("TextLabel")
SectionName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SectionName.TextColor3 = Color3.fromRGB(180, 180, 180)
SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionName.Text = "Keybinds"
SectionName.Name = "SectionName"
SectionName.TextStrokeTransparency = 0
SectionName.AnchorPoint = Vector2.new(0, 0.5)
SectionName.Size = UDim2.new(0, 1, 0, 1)
SectionName.BackgroundTransparency = 1
SectionName.Position = UDim2.new(0, 7, 0.5, -1)
SectionName.BorderSizePixel = 0
SectionName.AutomaticSize = Enum.AutomaticSize.XY
SectionName.TextSize = 14
SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionName.Parent = Header

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Section_Left

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(62, 119, 150)
UIStroke.Parent = Section_Left

