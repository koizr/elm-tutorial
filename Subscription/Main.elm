module Subscription.Main exposing (..)

import Html exposing (Html, div, text, program)
import Mouse
import Keyboard


-- Model


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


-- Msg


type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode


-- View


view : Model -> Html Msg
view model =
    div []
        [ text (toString model)]


-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    -- Msg の種類によって増加量を変える
    case msg of
        MouseMsg position ->
            ( model + 1, Cmd.none)

        KeyMsg code ->
            ( model + 2, Cmd.none )


-- Subscription
-- イベントを監視し、メッセージを発行する


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch -- batch は複数の subscription を取り、ひとつの subscription を返す
        [ Mouse.clicks MouseMsg
        , Keyboard.downs KeyMsg
        ]


-- Main

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
