module Functions exposing (..)

import Html exposing (text)


main =
  -- 評価された値を関数の引数として渡せるパイプ演算子というものがある
  -- after <| before
  -- before |> after
  text <| toString <| addOne <| add 5 10
  -- > 16

addOne : Int -> Int
addOne x = 
  x + 1

add : Int -> Int -> Int
add x y =
  x + y
