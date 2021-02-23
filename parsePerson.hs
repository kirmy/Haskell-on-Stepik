data Error = ParsingError | IncompleteDataError | IncorrectDataError String 
    deriving Show

data Person = Person { firstName :: String, lastName :: String, age :: Int }

--parsePerson :: String -> [String] --Either Error Person
--parsePerson  = undefined where
--s = lines s
 --   if length ls /= 3 then ParsingError else ls
splitString :: (String, String) -> (String, String)
splitString (param, s@(c:ss)) 
    | c /= '=' = splitString (c:param, ss)
    | c == '=' = (trim . reverse $ param, trim ss)
splitString (_, []) = ([],[]) --Left ParsingError

leftTrim :: String -> String
leftTrim s@(c:ss) | c == ' '  = leftTrim ss
                  | otherwise = s
leftTrim [] = []

rightTrim :: String -> String
rightTrim  = reverse . leftTrim . reverse

trim :: String -> String
trim = leftTrim . rightTrim

splitLines :: String -> [(String, String)]
splitLines  = func1 . lines 
func1 :: [String] -> [(String, String)]
func1 (s:ls) = (splitString ([],s)) : func1 ls
func1 [] = []
{-splitLines :: String -> [Either Error (String, String)]
splitLines  = func1 . lines 
func1 :: [String] -> [Either Error (String, String)]
func1 (s:ls) = (splitString ([],s)) : func1 ls
func1 [] = []
-}
    sl = splitLines "firstName = John\nlastName = Connor\nage = 30"
    firstName = loolup "firstName" sl
    parsePerson = if firstMane == Nothing then Left IncompleteDataError 
        else Person { firstName ==  firstName }
    lastName = loolup "lastName" sl
    parsePerson = if lastName == Nothing then Left IncompleteDataError 
        else Person { lastName ==  lastName }
    age = lookup "age" sl



