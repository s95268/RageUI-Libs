---

# Advanced RageUI 🚀

This project is a menu library that allows you to easily create user interfaces for your FiveM servers. RageUI is designed to be simple, powerful, and highly customizable, providing a smooth development experience for your menu needs.

## 📋 Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## 🚀 Installation

To start using RageUI in your FiveM project, follow these simple steps:

1. Clone / Download this repository to your machine.
2. Move the `RageUI` folder into your `resources` folder of your FiveM server.
3. Ensure the resource to your `cfg` file.
4. You're ready to start using RageUI in your FiveM project!

## 💡 Usage
```lua
function ExempleMenu()
    local mainMenu = RageUI.CreateMenu('Title', 'This is a subtitle')
    local submenu = RageUI.CreateSubMenu(mainMenu, 'Submenu', 'This is a subtitle')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    while mainMenu do
        Citizen.Wait(0)
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Button', 'This is an exemple of a description !', { RightLabel = '→' }, true, {
                onSelected = function()
                    print('Button selected')
                end
            })
            RageUI.Button('Info', nil, {}, true, {
                onActive = function()
                    RageUI.Info('Title', {"Left #1", "Left #2", "Left #3"}, {'Right #1', 'Right #2', 'Right #3'}, true)
                end
            })
            RageUI.Checkbox('Checkbox', nil, data.Checkbox, {}, {
                onChecked = function()
                    data.Checkbox = not data.Checkbox
                end,
                onUnChecked = function()
                    data.Checkbox = not data.Checkbox
                end
            })
            RageUI.List("List", {"Option 1", "Option 2", "Option 3"}, data.Index, nil, {}, true, {
                onListChange = function(Index, Item)
                    data.Index = Index;
                end
            })
            RageUI.Separator('Separator')
            RageUI.Button('Submenu', nil, { RightLabel = '→' }, true, {}, submenu)
            --@TODO: RageUI.InfoPanel need to be updated
            RageUI.Button('Panel', nil, { RightLabel = '→' }, true, {
                onActive = function()
                    RageUI.InfoPanel({
                        Url = 'Image-URL',
                        -- Exemple, your image size is "1920x1080" set Width = 1920 and Height = 1080
                        Width = 1920,
                        Height = 1080
                    }, 'Mercedes GT63 S AMG', {'Left #1', 'Left #2', 'Left #3', 'Left #4'}, {'Right #1'}, {50, 75, 20})
                end
            })
        end)
        RageUI.IsVisible(submenu, function()
            RageUI.Checkbox('Show Banner', nil, data.Checkbox2, {}, {
                onChecked = function()
                    data.Checkbox2 = not data.Checkbox2
                end,
                onUnChecked = function()
                    data.Checkbox2 = not data.Checkbox2
                end
            })
        end, nil, not data.Checkbox2)
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(submenu) then
            mainMenu = RMenu:DeleteType("mainMenu", true)
            submenu = RMenu:DeleteType("submenu", true)
            break
        end
    end
end
```

## 🌟 Examples

Check out the example code provided up to see how to use RageUI for different types of menus and interactions.

## 👥 Contributing

Contributions to RageUI are welcome! If you'd like to contribute.

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---
