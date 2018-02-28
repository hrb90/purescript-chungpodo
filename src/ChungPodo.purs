module ChungPodo (class DisjointLabels, class NoDuplicateLabels, mergeSafe) where

import Type.Row (class RowToList, class RowListNub)

class NoDuplicateLabels (r :: # Type)

instance noDuplicateLabels :: (RowToList r rl, RowListNub rl rl) => NoDuplicateLabels r

class DisjointLabels (r1 :: # Type) (r2 :: # Type)

instance unionNoDupsDisjoint :: (Union r1 r2 u, NoDuplicateLabels u) => DisjointLabels r1 r2

foreign import mergeSafe :: forall r1 r2 u. DisjointLabels r1 r2 
                            => Union r1 r2 u 
                            => { | r1 } 
                            -> { | r2 } 
                            -> { | u }

class RowSubset (small :: # Type) (big :: # Type)

instance unionSubRow :: Union small x big => RowSubset small big

class Intersection (r1 :: # Type) (r2 :: # Type) (i :: # Type) | r1 r2 -> i

instance prfIntersection :: (NoDuplicateLabels r1, NoDuplicateLabels r2, Union i x1 r1, Union i x2 r2, DisjointLabels x1 x2) => Intersection r1 r2 i