module App where

import Signal exposing (..)
import Html exposing (..)
import Effects exposing (Effects, Never)

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

update: Action -> Model -> (Model, Effects Action)
update action model =
  case action of

    DoNothing ->
      (model, Effects.none)

-- VIEW

view : Address Action -> Model -> Html
view address model =
  div [] [
    button [] [ text "Get IP address" ],
    div [] [ text model.ip ]
  ]
