#!/bin/bash
# Waybar custom module: show/toggle ibus input engine (EN <-> Vietnamese Unikey)

case "$1" in
    toggle)
        current=$(ibus engine)
        if [ "$current" = "Unikey" ]; then
            ibus engine xkb:us::eng
        else
            ibus engine Unikey
        fi
        ;;
    *)
        current=$(ibus engine)
        if [ "$current" = "Unikey" ]; then
            echo '{"text":"VI","class":"vi","tooltip":"Vietnamese (Unikey) — click to switch to English"}'
        else
            echo '{"text":"EN","class":"en","tooltip":"English (US) — click to switch to Vietnamese"}'
        fi
        ;;
esac
