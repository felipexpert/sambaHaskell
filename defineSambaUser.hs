import Samba
import System.Process (createProcess, shell)
import Control.Monad (when)

main = do
  putStrLn $ unlines 
    [ "################################################################"
    , "Instructions: "
    , ""
    , "Firstly, ensure your smb.conf have this section:"
    , "[homes]"
    , "   comment = Home Directories"
    , "   browseable = yes"
    , "   writable = yes"
    , "   read only = no"
    , "   valid users = %S"
    , ""
    , "----------------------------------------------------------------"
    , "To use this program, just enter the names you want to add and the"
    , "whole process of adding a new user to the system and then to Samba"
    , "will be done to you. Also the passwords will be generated "
    , "automatically"
    , ""
    , "*Note: remember to restart Samba after changes"
    , "################################################################" ]
  createUser

createUser :: IO ()
createUser = do
  putStrLn "Insert a username"
  user <- getLine
  when (user /= "") $ do
    let pass = dpass user
    putStrLn $ "The password of the user " ++ user ++ " will be " ++ pass
    putStrLn "Creating user..."
    callCommand $ "./newSambaUser.bash \"" ++ user ++ "\" \"" ++ pass ++ "\""
    createUser

callCommand = createProcess . shell
