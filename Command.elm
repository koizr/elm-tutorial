module Main exposing (..)

import Html exposing (Html, div, button, text, program)
import Html.Events exposing (onClick)
import Random


-- Model


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 1, Cmd.none )


-- Msg


type Msg
    = Roll -- 新しい数字を表示するためのメッセージ
    | OnResult Int -- 生成された数値を取得するためのメッセージ


-- View


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ]
        , text (toString model)
        ]


-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            -- Cmd は Elm runtime へ処理を投げるための機能
            -- Random.generate の場合は、処理が完了したときに投げるメッセージのコンストラクタと生成する乱数の範囲を受け取る
            -- 受け取った範囲の乱数を生成し、その乱数をメッセージのコンストラクタに渡し、そのメッセージを update に投げる
            ( model, Random.generate OnResult (Random.int 1 6) )
        OnResult res ->
            ( res, Cmd.none )


-- Main


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }
