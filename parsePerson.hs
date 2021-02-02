data Error = ParsingError | IncompleteDataError | IncorrectDataError String deriving Show

data Person = Person { firstName :: String, lastName :: String, age :: Int }

parsePerson :: String -> Either Error Person
parsePerson = undefined

splitString :: (String, String) -> Either Error (String, String)
splitString (param, s@(c:ss)) | c /= '=' = splitString (c:param, ss)
                              | c == '=' = Right (reverse param, ss)
splitString (_, []) = Left ParsingError

splitLines :: String -> [(String, String)]
splitLines s = where
    ls = lines s
    (s:ls) = ls

