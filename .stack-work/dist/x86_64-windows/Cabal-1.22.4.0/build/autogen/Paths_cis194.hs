module Paths_cis194 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Development\\Learning\\Haskell\\cis194\\.stack-work\\install\\x86_64-windows\\lts-3.5\\7.10.2\\bin"
libdir     = "D:\\Development\\Learning\\Haskell\\cis194\\.stack-work\\install\\x86_64-windows\\lts-3.5\\7.10.2\\lib\\x86_64-windows-ghc-7.10.2\\cis194-0.1.0.0-7g3A7hH5fzGKZ5a1ZVaAiL"
datadir    = "D:\\Development\\Learning\\Haskell\\cis194\\.stack-work\\install\\x86_64-windows\\lts-3.5\\7.10.2\\share\\x86_64-windows-ghc-7.10.2\\cis194-0.1.0.0"
libexecdir = "D:\\Development\\Learning\\Haskell\\cis194\\.stack-work\\install\\x86_64-windows\\lts-3.5\\7.10.2\\libexec"
sysconfdir = "D:\\Development\\Learning\\Haskell\\cis194\\.stack-work\\install\\x86_64-windows\\lts-3.5\\7.10.2\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cis194_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cis194_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "cis194_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cis194_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cis194_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
