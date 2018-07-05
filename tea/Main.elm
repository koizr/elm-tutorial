module Main exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing(onClick)


-- Model


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )


-- Message


type Msg
    = Expand
    | Collapse


-- View


view : Model -> Html Msg
view model = 
    -- 受け取ったメッセージに応じて表示する内容を変える
    if model then
        div []
            [ button [ onClick Collapse] [ text "Collapse"]
            , text "Widget"
            ]
    else
        div []
            [ button [ onClick Expand] [text "Expand"] ]


-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )
    
        Collapse ->
            ( False, Cmd.none )
            

-- subscription


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- main


main =
    -- Html.program が唯一状態を保持しており、受け取ったレコードを使ってアプリケーションをオーケストレーションしている
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
    -- view がユーザのアクション等によって Msg を投げ
    -- update 関数が走り
    -- update された Model を使って view を実行することで画面が更新される
