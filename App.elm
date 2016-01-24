module App where

import Signal exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Effects exposing (Effects, Never)
import Http exposing (get)
import Json.Decode as Json exposing ((:=))
import Task

-- MODEL

type alias Model =
  {
    ip: String
  }

init : (Model, Effects Action)
init =
  (
    {
      ip = "Unknown"
    },
    Effects.none
  )

--- UPDATE

type Action
  = DoNothing
  | RequestIP
  | UpdateIP (Maybe String)

update: Action -> Model -> (Model, Effects Action)
update action model =
  case action of

    DoNothing ->
      (model, Effects.none)

    RequestIP ->
      (model, requestIP)

    UpdateIP ip ->
      (
        { model | ip = (Maybe.withDefault "No response" ip) },
        Effects.none
      )

-- VIEW

view : Address Action -> Model -> Html
view address model =
  div [] [
    button [ onClick address RequestIP ] [ text "Get IP address" ],
    div [] [ text model.ip ]
  ]


--- Effects

requestIP : Effects Action
requestIP =
  Http.get ("ip" := Json.string) "http://jsonip.com"
    |> Task.toMaybe
    |> Task.map UpdateIP
    |> Effects.task
