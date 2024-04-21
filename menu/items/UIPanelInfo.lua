local isDuiCreated, DuiUrl = false, nil

function CreateOrUpdateDui(ImgUrl, ImgWidth, ImgHeight)
    if not isDuiCreated or DuiUrl ~= ImgUrl then
        local TxImage = CreateDui(ImgUrl, ImgWidth, ImgHeight)
        CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('TXD'), "DUI", GetDuiHandle(TxImage))
        isDuiCreated = true
        DuiUrl = ImgUrl
    end
end

function RageUI.InfoPanel(Img, Title, LeftText, RightText, RightBar)
    CreateOrUpdateDui(Img.Url, Img.Width, Img.Height)

    RenderRectangle(330 + 10 + 95 + 30, 5 + 32, 400, 410, 10, 15, 20, 255)
    RenderSprite('TXD', 'DUI', 450 + 30, 90, 372, 200, 0.0, 255, 255, 255, 255)
    RenderText("~h~"..Title, 515 + 530 / #Title * 2, 50, 0, 0.30, 255, 255, 255, 255, 3)

    for i = 1, #LeftText do
        RenderText("~bold~"..LeftText[i], 452 + 30, 280 + 30 * i, 0, 0.30, 255, 255, 255, 255, 0, true)
    end

    for i = 1, #RightText do
        RenderText("~bold~"..RightText[i], 452 + 30 + 400 - 30, 280 + 30 * i, 0, 0.30, 255, 255, 255, 255, 2, true)
    end

    -- RightBar Exemple :
    -- RenderRectangle(715, 320 + 32 * i, 140, 10, 37,37,37,255)
    -- RenderRectangle(715, 320 + 32 * i, RightBar[i] / 100 * 140, 10, 190,190,190,255)

    for i = 1, #RightBar do
        if #RightText >= #RightBar then
            RenderRectangle(715, 320 + 32 * i, 140, 10, 37,37,37,255)
            RenderRectangle(715, 320 + 32 * i, RightBar[i] / 100 * 140, 10, 190,190,190,255)
        else
            RenderRectangle(715, 320 + 32 * i, 140, 10, 37,37,37,255)
            RenderRectangle(715, 320 + 32 * i, RightBar[i] / 100 * 140, 10, 190,190,190,255)
        end
    end
end
