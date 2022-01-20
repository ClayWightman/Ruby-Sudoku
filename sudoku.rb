


puzzle = [3,0,5,4,0,2,0,6,0,4,9,0,7,6,0,1,0,8,6,0,0,1,0,3,2,4,5,0,0,3,9,0,0,5,8,0,9,6,0,0,5,8,7,0,3,0,8,1,3,0,4,0,9,2,0,5,0,6,0,1,4,0,0,2,0,0,5,4,9,0,7,0,1,4,9,0,0,7,3,0,6]




def getNextBlankPosition(pos, puzzle)

    puzzle.each_with_index do |value, inx|
        if value == 0 && inx > pos
            return inx
        end
        if inx == 80
            return 81
        end
    end
end

def valueFits(pos, val, puzzle)
    #Horizontal
    checkPosition = pos/9*9
    9.times { |i|
        if puzzle[checkPosition] == val 
            return false
        else
            checkPosition += 1
        end
    }

    #Vertical
    checkPosition = pos%9
    9.times { |i|
        if puzzle[checkPosition] == val
            return false 
        else 
            checkPosition += 9
        end
    }

    #Box
    if [0,1,2,9,10,11,18,19,20].include? pos
        box = [0,1,2,9,10,11,18,19,20]
    elsif [3,4,5,12,13,14,21,22,23].include? pos
        box = [3,4,5,12,13,14,21,22,23]
    elsif [6,7,8,15,16,17,24,25,26].include? pos
        box = [6,7,8,15,16,17,24,25,26]
    elsif [27,28,29,36,37,38,45,46,47].include? pos
        box = [27,28,29,36,37,38,45,46,47]
    elsif [30,31,32,39,40,41,48,49,50].include? pos
        box = [30,31,32,39,40,41,48,49,50]
    elsif [33,34,35,42,43,44,51,52,53].include? pos
        box = [33,34,35,42,43,44,51,52,53]
    elsif [54,55,56,63,64,65,72,73,74].include? pos
        box = [54,55,56,63,64,65,72,73,74]
    elsif [57,58,59,66,67,68,75,76,77].include? pos
        box = [57,58,59,66,67,68,75,76,77]
    else
        box = [60,61,62,69,70,71,78,79,80]
    end

    box.each do |checkPosition|
        if puzzle[checkPosition] == val
            return false
        end
    end
    
    return true
end

def solve(pos, puzzle)
    9.times { |val|
        if valueFits(pos, val+1, puzzle)
            puzzle[pos] = val+1
            if getNextBlankPosition(pos, puzzle) == 81
                outputPuzzle(puzzle)
                return true
            end
            if solve(getNextBlankPosition(pos, puzzle), puzzle)
                return true
            end
        end
    }
    puzzle[pos] = 0
    return false
end

def outputPuzzle(puzzle)
    puzzle.each_with_index do |val, inx|
        print "|#{val}|"
        if (inx+1)%9 == 0
            puts ''
            puts '---------------------------'
        end
    end
end

solve(getNextBlankPosition(0, puzzle), puzzle)

#value = puzzle[pos]
#if currentposition works and solve(nextposition) is true
 #   return true
#else
 #   increment value
#end

#if value is incremented above 9 return false