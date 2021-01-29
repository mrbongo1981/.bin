#!/bin/bash
    tool_grp=$(pacman -Sg|grep blackarch-)
    echo '--------------------------------------------------------------------------------'
    echo -e "packages not in either blackarch group or blackarch-<category> group,\n\
    won't be installed by \e[1mpacman -S blackarch-<category>\e[0m or \e[1mpacman -S blackarch\e[0m"
    comm -23 <(comm -3 <(pacman -Ssq ^blackarch|sort) <(pacman -Sgq blackarch|sort)) \
    <(pacman -Sgq $tool_grp|sort -u)
    echo '--------------------------------------------------------------------------------'
    echo -e "packages in blackarch group but not in blackarch-<category> group,\n\
    won't be installed by \e[1mpacman -S blackarch-<category>\e[0m"
    comm -23 <(pacman -Sgq blackarch|sort) <(pacman -Sgq $tool_grp|sort -u)
    echo '--------------------------------------------------------------------------------'
    echo -e "packages not in blackarch group but in blackarch-<category> group,\n\
    won't be installed by \e[1mpacman -S blackarch\e[0m"
    comm -13 <(pacman -Sgq blackarch|sort) <(pacman -Sgq $tool_grp|sort -u)
    echo '--------------------------------------------------------------------------------'