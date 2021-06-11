---------------------------------------------
-- Functions
---------------------------------------------

local board = {}

-- Creates the tic-tac-toe board logic
function boardLogic()
    for i = 1, 3 do
        board[i] = {}
        for j = 1, 3 do
            board[i][j] = " "
        end
    end
end

-- Displays the tic-tac-toe board
function displayBoard()
    print("   1   2   3")
    for i = 1, 3 do
        print(i .. " [" .. board[i][1] .. "]" .. " [" .. board[i][2] .. "]" .. " [" .. board[i][3] .. "]")
    end
end

-- Checks if there is a tie
function tieChecker()
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == " " then
                return false
            end
        end
    end
    return true
end 

-- Checks if there is a winner!
function winnerChecker()

    -- Checking the columns
    if board[1][1] ~= " " and board[1][2] == board[1][1] and board[1][3] == board[1][2] then
        return board[1][3]
    elseif board[2][1] ~= " " and board[2][2] == board[2][1] and board[2][3] == board[2][2] then
        return board[2][3]
    elseif board[3][1] ~= " " and board[3][2] == board[3][1] and board[3][3] == board[3][2] then
        return board[3][3]
    end
    
    -- Checking the rows
    if board[1][1] ~= " " and board[2][1] == board[1][1] and board[3][1] == board[2][1] then
        return board[3][1]
    elseif board[1][2] ~= " " and board[2][2] == board[1][2] and board[3][2] == board[2][2] then
        return board[3][2]
    elseif board[1][3] ~= " " and board[2][3] == board[1][3] and board[3][3] == board[2][3] then
        return board[3][3]
    end 

    -- Checking the diagonals
    if board[1][1] ~= " " and board[2][2] == board[1][1] and board[3][3] == board[2][2] then
        return board[3][3]
    elseif board[1][3] ~= " " and board[2][2] == board[1][3] and board[3][1] == board[2][2] then
        return board[3][1]
    end

    return nil
end 

---------------------------------------------
-- Game logic
---------------------------------------------

boardLogic()
os.execute("cls")
displayBoard()

-- Some variables
local plays = 0
local player = "X"
local gameOver = false 
local rowToPlay, columnToplay = 0, 0

-- Game loop
while not gameOver do

    -- Asks which position the player wanna play!
    print("Which row do you wanna play, " .. player .. "?")
    rowToPlay = io.read("*n")
    print("Which column do you wanna play, " .. player .. "?")
    columnToplay = io.read("*n")

    -- Checks if the position that player choose is empty
    if board[rowToPlay][columnToplay] == " " then
        board[rowToPlay][columnToplay] = player
        plays = plays + 1

        if plays % 2 == 0 then
            player = "X"
        else
            player = "O"
        end
    end

    os.execute("cls")
    displayBoard()

    -- Win
    if winnerChecker() ~= nil then
        print(winnerChecker() .. " wins!")
        gameOver = true 
    -- Tie
    elseif tieChecker() then
        print("Tie!")
        gameOver = true
    end

end
