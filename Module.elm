module Module exposing (..)

import Players.Utils exposing (attack)
import Html exposing (text)

main =
  attack 10 100 |> toString |> text
