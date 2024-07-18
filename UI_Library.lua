local UI_Library = {}

function UI_Library:CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CustomUILibrary"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 300, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Parent = ScreenGui

    -- Add a UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    return ScreenGui, MainFrame
end

function UI_Library:AddTabs(mainFrame)
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = "TabFrame"
    TabFrame.Size = UDim2.new(1, 0, 0, 30)
    TabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabFrame.Parent = mainFrame

    local TabLayout = Instance.new("UIListLayout")
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.Parent = TabFrame

    return TabFrame
end

function UI_Library:AddTab(tabFrame, tabName)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tabName .. "Button"
    TabButton.Size = UDim2.new(0, 100, 1, 0)
    TabButton.Text = tabName
    TabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Parent = tabFrame

    -- Add UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = TabButton

    local TabContent = Instance.new("Frame")
    TabContent.Name = tabName .. "Content"
    TabContent.Size = UDim2.new(1, 0, 1, -30)
    TabContent.Position = UDim2.new(0, 0, 0, 30)
    TabContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabContent.Visible = false
    TabContent.Parent = tabFrame.Parent

    -- Tab switching functionality
    TabButton.MouseButton1Click:Connect(function()
        for _, sibling in pairs(tabFrame.Parent:GetChildren()) do
            if sibling:IsA("Frame") and sibling.Name:match("Content") then
                sibling.Visible = false
            end
        end
        TabContent.Visible = true
    end)

    return TabContent
end

function UI_Library:AddButton(parent, buttonText)
    local Button = Instance.new("TextButton")
    Button.Name = "Button"
    Button.Size = UDim2.new(0, 280, 0, 50)
    Button.Position = UDim2.new(0.5, -140, 0, 10)
    Button.Text = buttonText
    Button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = parent

    -- Add UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Button

    return Button
end

function UI_Library:AddTextbox(parent, placeholderText)
    local TextBox = Instance.new("TextBox")
    TextBox.Name = "TextBox"
    TextBox.Size = UDim2.new(0, 280, 0, 50)
    TextBox.Position = UDim2.new(0.5, -140, 0, 70)
    TextBox.PlaceholderText = placeholderText
    TextBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Parent = parent

    -- Add UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = TextBox

    return TextBox
end

function UI_Library:AddDropdown(parent, options)
    local Dropdown = Instance.new("Frame")
    Dropdown.Name = "Dropdown"
    Dropdown.Size = UDim2.new(0, 280, 0, 50)
    Dropdown.Position = UDim2.new(0.5, -140, 0, 130)
    Dropdown.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Dropdown.Parent = parent

    -- Add UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Dropdown

    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Name = "DropdownButton"
    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
    DropdownButton.Text = "Select"
    DropdownButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownButton.Parent = Dropdown

    local DropdownList = Instance.new("ScrollingFrame")
    DropdownList.Name = "DropdownList"
    DropdownList.Size = UDim2.new(1, 0, 0, 100)
    DropdownList.Position = UDim2.new(0, 0, 1, 0)
    DropdownList.Visible = false
    DropdownList.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    DropdownList.CanvasSize = UDim2.new(0, 0, 0, #options * 30)
    DropdownList.Parent = Dropdown

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = DropdownList

    DropdownButton.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)

    for _, option in pairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Name = option .. "Button"
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Text = option
        OptionButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.Parent = DropdownList

        OptionButton.MouseButton1Click:Connect(function()
            DropdownButton.Text = option
            DropdownList.Visible = false
        end)
    end

    return Dropdown
end

function UI_Library:AddToggle(parent, toggleText)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = "ToggleFrame"
    ToggleFrame.Size = UDim2.new(0, 280, 0, 50)
    ToggleFrame.Position = UDim2.new(0.5, -140, 0, 240)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    ToggleFrame.Parent = parent

    -- Add UI corner for rounded edges
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Size = UDim2.new(0.8, 0, 1, 0)
    ToggleButton.Position = UDim2.new(0, 10, 0, 0)
    ToggleButton.Text = toggleText
    ToggleButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Parent = ToggleFrame

    local ToggleIndicator = Instance.new("Frame")
    ToggleIndicator.Name = "ToggleIndicator"
    ToggleIndicator.Size = UDim2.new(0.1, 0, 0.8, 0)
    ToggleIndicator.Position = UDim2.new(0.9, -10, 0.1, 0)
    ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ToggleIndicator.Parent = ToggleFrame

    ToggleButton.MouseButton1Click:Connect(function()
        ToggleIndicator.BackgroundColor3 = ToggleIndicator.BackgroundColor3 == Color3.fromRGB(0, 255, 0) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
    end)

    return ToggleFrame
end

function UI_Library:Initialize()
    local screenGui, mainFrame = self:CreateUI()
    local tabFrame = self:AddTabs(mainFrame)

    local tab1 = self:AddTab(tabFrame, "Tab1")
    local tab2 = self:AddTab(tabFrame, "Tab2")

    self:AddButton(tab1, "Click Me!")
    self:AddTextbox(tab1, "Enter Text")
    self:AddDropdown(tab1, {"Option 1", "Option 2", "Option 3"})
    self:AddToggle(tab1, "Enable Feature")

    self:AddButton(tab2, "Another Button")
    self:AddTextbox(tab2, "Another Textbox")
    self:AddDropdown(tab2, {"Option A", "Option B", "Option C"})
    self:AddToggle(tab2, "Another Toggle")
end

UI_Library:Initialize()

return UI_Library
