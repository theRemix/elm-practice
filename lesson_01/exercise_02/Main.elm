module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


model =
    { result =
        { id = 1
        , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
        , stars = 66
        }
    }


elmHubHeader =
    header []
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
        ]


main =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ]
            [ li []
                [ a [ href ("https://github.com/" ++ model.result.name) ]
                    [ span [ class "star-count" ]
                        [ text (toString model.result.stars)
                        ]
                    ]
                ]
            ]
        ]
