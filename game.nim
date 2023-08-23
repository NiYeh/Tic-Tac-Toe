import strutils
import random

type
  arry = array[3, array[3, int]]

let
  text1 = """
$$$$$$$\  $$\                                         $$\      $$\ $$\           
$$  __$$\ $$ |                                        $$ | $\  $$ |\__|          
$$ |  $$ |$$ | $$$$$$\  $$\   $$\  $$$$$$\   $$$$$$\  $$ |$$$\ $$ |$$\ $$$$$$$\  
$$$$$$$  |$$ | \____$$\ $$ |  $$ |$$  __$$\ $$  __$$\ $$ $$ $$\$$ |$$ |$$  __$$\ 
$$  ____/ $$ | $$$$$$$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|$$$$  _$$$$ |$$ |$$ |  $$ |
$$ |      $$ |$$  __$$ |$$ |  $$ |$$   ____|$$ |      $$$  / \$$$ |$$ |$$ |  $$ |
$$ |      $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ $$ |      $$  /   \$$ |$$ |$$ |  $$ |
\__|      \__| \_______| \____$$ | \_______|\__|      \__/     \__|\__|\__|  \__|
                        $$\   $$ |                                               
                        \$$$$$$  |                                               
                         \______/
  """
  text2 = """
 $$$$$$\  $$\ $$\      $$\ $$\           
$$  __$$\ \__|$$ | $\  $$ |\__|          
$$ /  $$ |$$\ $$ |$$$\ $$ |$$\ $$$$$$$\  
$$$$$$$$ |$$ |$$ $$ $$\$$ |$$ |$$  __$$\ 
$$  __$$ |$$ |$$$$  _$$$$ |$$ |$$ |  $$ |
$$ |  $$ |$$ |$$$  / \$$$ |$$ |$$ |  $$ |
$$ |  $$ |$$ |$$  /   \$$ |$$ |$$ |  $$ |
\__|  \__|\__|\__/     \__|\__|\__|  \__|
  """
  text3 = """
$$$$$$$$\ $$\                 $$$$$$$$\                        $$$$$$$$\                  
\__$$  __|\__|                \__$$  __|                       \__$$  __|                 
   $$ |   $$\  $$$$$$$\          $$ | $$$$$$\   $$$$$$$\          $$ | $$$$$$\   $$$$$$\  
   $$ |   $$ |$$  _____|         $$ | \____$$\ $$  _____|         $$ |$$  __$$\ $$  __$$\ 
   $$ |   $$ |$$ /               $$ | $$$$$$$ |$$ /               $$ |$$ /  $$ |$$$$$$$$ |
   $$ |   $$ |$$ |               $$ |$$  __$$ |$$ |               $$ |$$ |  $$ |$$   ____|
   $$ |   $$ |\$$$$$$$\          $$ |\$$$$$$$ |\$$$$$$$\          $$ |\$$$$$$  |\$$$$$$$\ 
   \__|   \__| \_______|         \__| \_______| \_______|         \__| \______/  \_______|
  """
  text4 = """
$$$$$$$$\ $$\           
\__$$  __|\__|          
   $$ |   $$\  $$$$$$\  
   $$ |   $$ |$$  __$$\ 
   $$ |   $$ |$$$$$$$$ |
   $$ |   $$ |$$   ____|
   $$ |   $$ |\$$$$$$$\ 
   \__|   \__| \_______|
  """

echo text3
echo "Player:1 AI:2"

var
  arr:arry =
    [[0,0,0],
     [0,0,0],
     [0,0,0]]
  playerNum:int = 0
  player:int = 1
  ai:int = 2
  count:int = 2
  flag:bool = false

# Function ========================================================================***

proc input(s:string):int =
  stdout.write s
  result = parseInt(stdin.readLine)

proc pattern() =
  for i in 0..2:
    for j in 0..2:
      stdout.write arr[i][j]
      if j == 2:
        echo ""

proc fillIn(this:int) =
  case this
  of 1:
    if arr[0][0] == 0:
      arr[0][0] = 1
    else:
      echo "輸入無效"
  of 2:
    if arr[0][1] == 0:
      arr[0][1] = 1
    else:
      echo "輸入無效"
  of 3:
    if arr[0][2] == 0:
      arr[0][2] = 1
    else:
      echo "輸入無效"
  of 4:
    if arr[1][0] == 0:
      arr[1][0] = 1
    else:
      echo "輸入無效"
  of 5:
    if arr[1][1] == 0:
      arr[1][1] = 1
    else:
      echo "輸入無效"
  of 6:
    if arr[1][2] == 0:
      arr[1][2] = 1
    else:
      echo "輸入無效"
  of 7:
    if arr[2][0] == 0:
      arr[2][0] = 1
    else:
      echo "輸入無效"
  of 8:
    if arr[2][1] == 0:
      arr[2][1] = 1
    else:
      echo "輸入無效"
  of 9:
    if arr[2][2] == 0:
      arr[2][2] = 1
    else:
      echo "輸入無效"
  else:
    echo "輸入無效"

proc checkTie() =
  for i in 0..2:
    for j in 0..2:
      count += arr[i][j]
  
  if count == 13:
    echo text4
    flag = true
  else:
    count = 0

proc checkWin(user:int) =
  if arr[0][0] == user and arr[0][1] == user and arr[0][2] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[1][0] == user and arr[1][1] == user and arr[1][2] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[2][0] == user and arr[2][1] == user and arr[2][2] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[0][0] == user and arr[1][0] == user and arr[2][0] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[0][1] == user and arr[1][1] == user and arr[2][1] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[0][2] == user and arr[1][2] == user and arr[2][2] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  
  if arr[0][0] == user and arr[1][1] == user and arr[2][2] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true
  if arr[0][2] == user and arr[1][1] == user and arr[2][0] == user:
    if user == player:
      echo text1
      flag = true
    else:
      echo text2
      flag = true

proc AiThink() =
  if count == 0 :
    if arr[1][1] == 0:
      arr[1][1] = 2

    elif arr[0][0] == 2 and arr[0][2] == 2 and arr[0][1] == 0:
      arr[0][1] = 2
    elif arr[0][0] == 2 and arr[2][0] == 2 and arr[1][0] == 0:
      arr[1][0] = 2 
    elif arr[0][2] == 2 and arr[2][2] == 2 and arr[1][2] == 0:
      arr[1][2] = 2
    elif arr[2][0] == 2 and arr[2][2] == 2 and arr[2][1] == 0:
      arr[2][1] = 2

    elif arr[0][0] == 0 or arr[0][2] == 0 or arr[2][0] == 0 or arr[2][2] == 0:
      var num = 0
      num = rand(0..3)
      case num
      of 0:
        if arr[0][0] == 0:
          arr[0][0] = 2
        else:
          AiThink()
      of 1:
        if arr[0][2] == 0:
          arr[0][2] = 2
        else:
          AiThink()
      of 2:
        if arr[2][0] == 0:
          arr[2][0] = 2
        else:
          AiThink()
      of 3:
        if arr[2][2] == 0:
          arr[2][2] = 2
        else:
          AiThink()
      else:
        discard

    elif arr[0][0] != 0 and arr[0][2] != 0 and arr[2][0] != 0 and arr[2][2] != 0:
      var num = 0
      num = rand(0..3)
      case num
      of 0:
        if arr[0][1] == 0:
          arr[0][1] = 2
        else:
          AiThink()
      of 1:
        if arr[1][0] == 0:
          arr[1][0] = 2
        else:
          AiThink()
      of 2:
        if arr[1][2] == 0:
          arr[1][2] = 2
        else:
          AiThink()
      of 3:
        if arr[2][1] == 0:
          arr[2][1] = 2
        else:
          AiThink()
      else:
        discard



# main ======================================================================***

proc main() =

  while true:
    playerNum = input("輸入1到9其中一個數字:")
    fillIn(playerNum)
    checkTie()
    AiThink()
    checkWin(player)
    checkWin(ai)
    if flag == true:
      break
    pattern()


main()
discard input("請按任意鍵結束...")
