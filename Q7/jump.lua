jumpWindowButton = nil
jumpWindow = nil
jumpWidget = nil
testLabel = nil

function online()
  destroyWindows()
  jumpWindowButton:show()
  jumpWidget = g_ui.createWidget('UIWidget', parent)
end

--Initialize module
function init()
  connect(g_game, { onGameStart = online,
                    onGameEnd   = offline })

  jumpWindow = g_ui.displayUI('jump.otui')
  jumpWindow:hide()

--Creates button on top menu to start and end jump window
  jumpWindowButton = modules.client_topmenu.addLeftGameToggleButton('jumpWindowButton', tr('Jump'), '/images/game/skull_socket', toggle)
  jumpWindowButton:setOn(false)
end

--Change button from on to off and vice versa
function toggle()
  if jumpWindowButton:isOn() then
    jumpWindowButton:setOn(false)
    jumpWindow:hide()
  else
    jumpWindowButton:setOn(true)
    jumpWindow:show()
    jumpWindow:raise()
    jumpWindow:focus()
  end
end

function offline()
  jumpWindow:hide()
  jumpWindowButton:setOn(false)
end

function terminate()
  disconnect(g_game, { onGameStart = online,
                       onGameEnd   = offline })
  jumpWindowButton:destroy()
  jumpWindowButton = nil
  destroyWindows()
end

function destroyWindows()
  if jumpWindow then
    jumpWindow:destroy()
  end
  jumpWindow = nil
end