--TRAINERGENERATORSTART--
--这是自动生成的代码. 请在此区域内个修改代码
--如果你更新了修改器代码，将被删除并重新写入

--Uncomment the following line if this is a Cheat Table format trainer and you don't want CE to show (Tip, save as .CETRAINER alternatively)
--hideAllCEWindows()

RequiredCEVersion=7.5
if (getCEVersion==nil) or (getCEVersion()<RequiredCEVersion) then
  messageDialog('Please install Cheat Engine '..RequiredCEVersion, mtError, mbOK)
  closeCE()
end
addresslist=getAddressList()
memrec9=addresslist.getMemoryRecordByID(9)

memrec9_hotkey0=memrec9.getHotkeyByID(0)

function onPostHotkey0(Hotkey)
  --Executed after the "toggle*" cheat got executed
  local memrec=Hotkey.Owner
  local isActive=memrec.Active --get the state after the hotkey got triggered
  CETrainer.CHEAT0.setActive(isActive) --gui update, nothing else
  if gPlaySoundOnAction then
    if isActive then
      playSound(gActivateSound)
    else
      playSound(gDeactivateSound)
    end
  end
end

memrec9_hotkey0.onPostHotkey=onPostHotkey0

CETrainer.SEPERATOR.Visible=false

getAutoAttachList().add("PlantsVsZombies.exe")
gPlaySoundOnAction=false
CETrainer.fixDPI() --remove this if you have already taken care of DPI issues yourself
CETrainer.show()
function AboutClick()
  showMessage(gAboutText)
end
gAboutText=[[This trainer was made liuyichen]]

function CloseClick()
  --called by the close button onClick event, and when closing the form
  closeCE()
  return caFree --onClick doesn't care, but onClose would like a result
end

--TRAINERGENERATORSTOP--