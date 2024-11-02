-- Início da definição da library
local KeySystemLib = {}

-- Função principal que cria o sistema de Key
function KeySystemLib.CreateKeySystem(title, correctKey, copyLink, onSuccess)
    -- GUI principal e elementos da interface
    local ScreenGui = Instance.new("ScreenGui")
    local BorderFrame = Instance.new("Frame") -- Borda colorida externa
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local TextBox = Instance.new("TextBox")
    local ConfirmButton = Instance.new("TextButton")
    local CopyButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local Notification = Instance.new("TextLabel")
    local UICornerFrame = Instance.new("UICorner")
    local UICornerTextBox = Instance.new("UICorner")
    local UICornerConfirmButton = Instance.new("UICorner")
    local UICornerCopyButton = Instance.new("UICorner")
    local UICornerCloseButton = Instance.new("UICorner")
    local UICornerNotification = Instance.new("UICorner")

    -- Configurações do GUI
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "KeySystemGui"

    -- Borda colorida externa
    BorderFrame.Parent = ScreenGui
    BorderFrame.BackgroundColor3 = Color3.fromRGB(100, 149, 237) -- Azul claro para a borda
    BorderFrame.Size = UDim2.new(0, 260, 0, 260)
    BorderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    BorderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    BorderFrame.Active = true
    BorderFrame.Draggable = true -- Permite mover o GUI no PC e celular

    -- Frame principal (dentro da borda)
    Frame.Parent = BorderFrame
    Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Frame.Size = UDim2.new(1, -10, 1, -10) -- Menor que a borda para criar o efeito de contorno
    Frame.Position = UDim2.new(0, 5, 0, 5)
    Frame.BorderSizePixel = 0

    -- Título
    Title.Parent = Frame
    Title.Text = title or "Key System"
    Title.Font = Enum.Font.GothamBold -- Fonte mais estilosa
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.5, 0, 0.1, 0)
    Title.AnchorPoint = Vector2.new(0.5, 0)

    -- TextBox
    TextBox.Parent = Frame
    TextBox.PlaceholderText = "Enter key here"
    TextBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    TextBox.Position = UDim2.new(0.5, 0, 0.35, 0)
    TextBox.Size = UDim2.new(0.8, 0, 0, 30)
    TextBox.Font = Enum.Font.Gotham
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 16
    TextBox.AnchorPoint = Vector2.new(0.5, 0)

    -- Botão Confirmar
    ConfirmButton.Parent = Frame
    ConfirmButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    ConfirmButton.Position = UDim2.new(0.25, -50, 0.7, 0)
    ConfirmButton.Size = UDim2.new(0, 100, 0, 30)
    ConfirmButton.Font = Enum.Font.Gotham
    ConfirmButton.Text = "Confirm"
    ConfirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfirmButton.TextSize = 16

    -- Botão de Copiar
    CopyButton.Parent = Frame
    CopyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    CopyButton.Position = UDim2.new(0.75, -50, 0.7, 0)
    CopyButton.Size = UDim2.new(0, 100, 0, 30)
    CopyButton.Font = Enum.Font.Gotham
    CopyButton.Text = "Copy"
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.TextSize = 16

    -- Função de Notificação
    local function ShowNotification(message)
        Notification.Text = message
        Notification.Visible = true
        Notification:TweenPosition(UDim2.new(0.5, 0, 0.4, 0), "Out", "Quad", 0.3, true)
        wait(2) -- Tempo de exibição
        Notification:TweenPosition(UDim2.new(0.5, 0, 0.3, 0), "In", "Quad", 0.3, true, function()
            Notification.Visible = false
        end)
    end

    -- Função de Fechar com Animação
    local function CloseGUI()
        BorderFrame:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.5, true, function()
            ScreenGui:Destroy()
        end)
    end

    -- Verificação da Key
    ConfirmButton.MouseButton1Click:Connect(function()
        local key = TextBox.Text
        if key == correctKey then
            ShowNotification("Key accepted!")
            wait(0.5)
            CloseGUI()
            if onSuccess then
                onSuccess()
            end
        else
            ShowNotification("Incorrect key!")
        end
    end)

    -- Função de Copiar
    CopyButton.MouseButton1Click:Connect(function()
        ShowNotification("Key copied!")
        setclipboard(copyLink) -- Copia o link para a área de transferência
    end)

    -- Fecha o GUI quando o botão "Close" é clicado
    CloseButton.MouseButton1Click:Connect(CloseGUI)
end

return KeySystemLib
