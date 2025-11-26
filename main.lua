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

-- No example tabs here - they will be created dynamically

local Divider = Instance.new("Frame")
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.AnchorPoint = Vector2.new(0.5, 0.5)
Divider.BackgroundTransparency = 1
Divider.Position = UDim2.new(0.5, 0, 0.5, 0)
Divider.Name = "Divider_Logo" -- Special name for the logo divider
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
        
        -- Create Divider
        local DividerFrame = Instance.new("Frame")
        DividerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        DividerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        DividerFrame.BackgroundTransparency = 1
        
        -- Get the last element in the Holder to position this divider after it
        local lastPos = 0.15 -- Default position after logo divider
        local lastWidth = 0
        
        for _, child in pairs(library.gui.Holder:GetChildren()) do
            if child:IsA("Frame") and child ~= DividerFrame then
                local childPos = child.Position.X.Scale
                local childSize = child.Size.X.Offset
                
                if childPos > lastPos then
                    lastPos = childPos
                    lastWidth = childSize
                end
            end
        end
        
        -- Position after the last element
        DividerFrame.Position = UDim2.new(lastPos + (lastWidth/500) + 0.02, 0, 0.5, 0)
        DividerFrame.Name = "Divider_" .. tostring(math.random(1000, 9999)) -- Random name to make it unique
        DividerFrame.Size = UDim2.new(0, 2, 0, 50)
        DividerFrame.BorderSizePixel = 0
        DividerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DividerFrame.ZIndex = 15 -- Make sure it's visible
        DividerFrame.Parent = library.gui.Holder
        
        local Line = Instance.new("Frame")
        Line.AnchorPoint = Vector2.new(0.5, 0.5)
        Line.Name = "Line"
        Line.Position = UDim2.new(0.5, 0, 0.5, 0)
        Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Line.Size = UDim2.new(0.5, 1, 0.5, 1) -- Make the line bigger
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
        
        -- Create Tab Holder
        local TabHolder = Instance.new("Frame")
        TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabHolder.Name = "TabHolder_" .. name -- Add name to make it unique
        TabHolder.BackgroundTransparency = 1
        TabHolder.Size = UDim2.new(0, 70, 0, 48) -- Make it wider to fit tab names
        TabHolder.BorderSizePixel = 0
        TabHolder.AutomaticSize = Enum.AutomaticSize.XY
        TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        
        -- Get the last element in the Holder to position this tab after it
        local lastPos = 0.15 -- Default position after logo divider
        local lastWidth = 0
        
        for _, child in pairs(library.gui.Holder:GetChildren()) do
            if child:IsA("Frame") and child ~= TabHolder then
                local childPos = child.Position.X.Scale
                local childSize = child.Size.X.Offset
                
                if childPos > lastPos then
                    lastPos = childPos
                    lastWidth = childSize
                end
            end
        end
        
        -- Position after the last element with a small gap
        TabHolder.Position = UDim2.new(lastPos + (lastWidth/500) + 0.05, 0, 0, 0)
        TabHolder.ZIndex = 15 -- Make sure it's visible
        TabHolder.Parent = library.gui.Holder
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = TabHolder
        
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingTop = UDim.new(0, 13)
        UIPadding.Parent = TabHolder
        
        -- Create Tab Name
        local TabName = Instance.new("TextButton") -- Change to TextButton for better interaction
        TabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        TabName.TextColor3 = library.config.colors.textDimmed -- Default to dimmed
        TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabName.Text = name
        TabName.Name = "TabName"
        TabName.TextStrokeTransparency = 0.5
        TabName.AnchorPoint = Vector2.new(0.5, 0.5)
        TabName.Size = UDim2.new(0, 60, 0, 25) -- Fixed size for better visibility
        TabName.BackgroundTransparency = 0.9 -- Slight background for visibility
        TabName.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabName.BorderSizePixel = 0
        TabName.TextSize = library.config.textSize
        TabName.BackgroundColor3 = library.config.colors.accent:Lerp(Color3.fromRGB(0, 0, 0), 0.7)
        TabName.ZIndex = 20 -- Make sure it's visible above other elements
        TabName.Parent = TabHolder
        
        -- Print debug message when tab is created
        print("Created tab: " .. name)
        
        -- No need for tweening as we've already positioned it correctly
        
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
        TabContainer.Parent = library.gui.Container
        
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
        function tabData:CreateSection(options)
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
            Section.Parent = TabContainer
            
            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Section
            
            local UIStroke = Instance.new("UIStroke")
            UIStroke.Color = Color3.fromRGB(43, 43, 43)
            UIStroke.Parent = Section
            
            -- Create Section Header
            local Header = Instance.new("Frame")
            Header.AnchorPoint = Vector2.new(0.5, 0)
            Header.Name = "Header"
            Header.Position = UDim2.new(0.5, 0, 0, 0)
            Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Header.Size = UDim2.new(0, 264, 0, 28)
            Header.BorderSizePixel = 0
            Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Header.Parent = Section
            
            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 6)
            UICorner.Parent = Header
            
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
                ColorSequenceKeypoint.new(0, library.config.colors.divider[1]),
                ColorSequenceKeypoint.new(0.495, library.config.colors.divider[2]),
                ColorSequenceKeypoint.new(1, library.config.colors.divider[3])
            }
            UIGradient.Parent = Liner
            
            local SectionTitle = Instance.new("TextLabel")
            SectionTitle.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            SectionTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
            SectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SectionTitle.Text = sectionName
            SectionTitle.Name = "SectionName"
            SectionTitle.TextStrokeTransparency = 0
            SectionTitle.AnchorPoint = Vector2.new(0, 0.5)
            SectionTitle.Size = UDim2.new(0, 1, 0, 1)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Position = UDim2.new(0, 7, 0.5, -1)
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
            
            -- Create SubTabs if specified
            if #subTabs > 0 then
                -- Create SubHolder for the tabs themselves
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
                
                local UIListLayout = Instance.new("UIListLayout")
                UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                UIListLayout.Padding = UDim.new(0, 9)
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Parent = SubHolder
                
                local UIPadding = Instance.new("UIPadding")
                UIPadding.PaddingRight = UDim.new(0, 6)
                UIPadding.Parent = SubHolder
                
                -- Create a container for all subtab content
                local SubTabsContainer = Instance.new("Frame")
                SubTabsContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
                SubTabsContainer.Name = "SubTabsContainer"
                SubTabsContainer.BackgroundTransparency = 1
                SubTabsContainer.Size = UDim2.new(1, 0, 0, 0)
                SubTabsContainer.BorderSizePixel = 0
                SubTabsContainer.AutomaticSize = Enum.AutomaticSize.Y
                SubTabsContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SubTabsContainer.Parent = Holder
                
                -- Create SubTab holders
                for i, subTabName in ipairs(subTabs) do
                    local isActive = (i == 1)
                    
                    -- Create the subtab button in the SubHolder
                    local SectionSubTab = Instance.new("Frame")
                    SectionSubTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    SectionSubTab.Name = "SectionSubTab"
                    SectionSubTab.BackgroundTransparency = 1
                    SectionSubTab.Size = UDim2.new(0, 32, 0, 27)
                    SectionSubTab.BorderSizePixel = 0
                    SectionSubTab.AutomaticSize = Enum.AutomaticSize.X
                    SectionSubTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SectionSubTab.Parent = SubHolder
                    
                    local SubtabName = Instance.new("TextLabel")
                    SubtabName.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    SubtabName.TextColor3 = isActive and Color3.fromRGB(180, 180, 180) or Color3.fromRGB(133, 133, 133)
                    SubtabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    SubtabName.Text = subTabName
                    SubtabName.Name = "SubtabName"
                    SubtabName.TextStrokeTransparency = 0
                    SubtabName.AnchorPoint = Vector2.new(0.5, 0.5)
                    SubtabName.Size = UDim2.new(0, 1, 0, 1)
                    SubtabName.BackgroundTransparency = 1
                    SubtabName.Position = UDim2.new(0.5, 0, 0.5, 0)
                    SubtabName.BorderSizePixel = 0
                    SubtabName.AutomaticSize = Enum.AutomaticSize.XY
                    SubtabName.TextSize = library.config.textSize
                    SubtabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SubtabName.Parent = SectionSubTab
                    
                    local UIListLayout = Instance.new("UIListLayout")
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Parent = SectionSubTab
                    
                    local UIPadding = Instance.new("UIPadding")
                    UIPadding.PaddingTop = UDim.new(0, 6)
                    UIPadding.Parent = SectionSubTab
                    
                    -- Create the content container for this subtab
                    local SubTabContent = Instance.new("Frame")
                    SubTabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    SubTabContent.Name = subTabName .. "Content"
                    SubTabContent.BackgroundTransparency = 1
                    SubTabContent.Size = UDim2.new(1, 0, 0, 0)
                    SubTabContent.BorderSizePixel = 0
                    SubTabContent.AutomaticSize = Enum.AutomaticSize.Y
                    SubTabContent.Visible = isActive
                    SubTabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SubTabContent.Parent = SubTabsContainer
                    
                    local UIListLayout = Instance.new("UIListLayout")
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Parent = SubTabContent
                    
                    -- SubTab click functionality
                    SectionSubTab.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            -- Hide all subtab content
                            for _, child in pairs(SubTabsContainer:GetChildren()) do
                                if child:IsA("Frame") and child.Name:find("Content") then
                                    child.Visible = false
                                end
                            end
                            
                            -- Show this subtab content
                            SubTabContent.Visible = true
                            
                            -- Update colors of tab buttons
                            for _, otherSubTab in pairs(SubHolder:GetChildren()) do
                                if otherSubTab:IsA("Frame") and otherSubTab.Name == "SectionSubTab" then
                                    local label = otherSubTab:FindFirstChild("SubtabName")
                                    if label then
                                        label.TextColor3 = Color3.fromRGB(133, 133, 133)
                                    end
                                end
                            end
                            SubtabName.TextColor3 = Color3.fromRGB(180, 180, 180)
                        end
                    end)
                    
                    -- Create the subtab data with element creation functions
                    local subTabData = {
                        CreateToggle = function(options) 
                            -- Toggle implementation
                            return {}
                        end,
                        CreateSlider = function(options) 
                            -- Slider implementation
                            return {}
                        end,
                        CreateDropdown = function(options) 
                            -- Dropdown implementation
                            return {}
                        end,
                        CreateButton = function(options) 
                            -- Button implementation
                            return {}
                        end,
                        CreateLabel = function(options) 
                            -- Label implementation
                            return {}
                        end,
                        CreateTextInput = function(options) 
                            -- TextInput implementation
                            return {}
                        end,
                        CreateKeybind = function(options) 
                            -- Keybind implementation
                            return {}
                        end,
                        CreateColorpicker = function(options) 
                            -- Colorpicker implementation
                            return {}
                        end,
                        AddColorToggle = function(name, default, callback) 
                            -- ColorToggle implementation
                            return {}
                        end,
                        _frame = SubTabContent -- Store reference to the frame
                    }
                    
                    -- Store the subtab data
                    subTabsData[subTabName] = subTabData
                end
            else
                -- If no subtabs, create a default content holder
                local DefaultContent = Instance.new("Frame")
                DefaultContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DefaultContent.Name = "DefaultContent"
                DefaultContent.BackgroundTransparency = 1
                DefaultContent.Size = UDim2.new(1, 0, 0, 0)
                DefaultContent.BorderSizePixel = 0
                DefaultContent.AutomaticSize = Enum.AutomaticSize.Y
                DefaultContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DefaultContent.Parent = Holder
                
                local UIListLayout = Instance.new("UIListLayout")
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Parent = DefaultContent
            end
            
            -- Add section to sections table
            sections[sectionName] = {
                frame = Section,
                holder = Holder
            }
            
            -- Add subtabs to the section data if they exist
            if #subTabs > 0 then
                for name, data in pairs(subTabsData) do
                    sectionData[name] = data
                end
            end
            
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
    
    return window
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
