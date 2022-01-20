-- Salvar em ~/.config/devilspie2/


-- O comando debug_print só imprime no stdout
-- se devilspie2 for executado usando a opção --debug
debug_print("Window Name: " .. get_window_name());
debug_print("Application name: " .. get_application_name())

debug_print("Window Name: " .. get_window_name());
debug_print("Application name: " .. get_application_name())


--Para informações e mais opções: http://www.gusnan.se/devilspie2/manual.php
if (get_window_name() == "BackgroundTerminator") then
    undecorate_window()
    -- set_window_geometry(0,0,1366,768); --Trocar resolução caso queira
    maximize()
    pin_window()
    set_window_type("_NET_WM_WINDOW_TYPE_DESKTOP")
--    set_window_opacity(0.85)
    center()
end
