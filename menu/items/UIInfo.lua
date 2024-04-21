function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~s~", 330 + 20 + 97, 5, 0, 0.30, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 330 + 20 + 93, Title ~= nil and 45 or 15, 0, 0.25, 145,148,150, 255, 0, true)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 330 + 432 + 97, Title ~= nil and 45 or 15, 0, 0.25, 255, 255, 255, 255, 2, true)
    end

    RenderRectangle(330 + 10 + 95, -7, 432, Title ~= nil and 55 + (LineCount * 20) or ((LineCount + 1) * 20) + 15, 10, 15, 20, 255)
end