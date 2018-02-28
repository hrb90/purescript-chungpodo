module Main where

import Prelude
import ChungPodo (mergeSafe)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

testRecordA :: { foo :: Int, bar :: String, baz :: Array Int }
testRecordA = { foo: 1, bar: "hello", baz: [2, 3, 4] }

testRecordB :: { quux :: Int, var :: Char }
testRecordB = { quux: 17, var: 'a' }

testRecordC :: { baz :: Array Int, quux :: Int}
testRecordC = { baz: [1, 5, 6, 8, 9], quux: 0 }

testRecordD :: { var :: Array Char, quux :: String }
testRecordD = { var: [], quux: "" }

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  let okay1 = mergeSafe testRecordA testRecordB
  let okay2 = mergeSafe testRecordA testRecordD

  -- Uncommenting any of the below lines should break the build.
  -- let bad = combine testRecordA testRecordC
  -- let bad = combine testRecordB testRecordC
  -- let bad = combine testRecordB testRecordD
  -- let bad = combine testRecordC testRecordD
  log "hello"
