function fish_right_prompt
    set cmd_status_ $status
    if test $status = 0
        echo -n (set_color green)
        set cmd_status_ ''
	else
        echo -n (set_color red)
        set cmd_status_ "[$cmd_status_]"
	end

    echo $cmd_status_(set_color normal) "$CMD_DURATION"ms (set_color yellow) (__fish_git_prompt "%s") (set_color normal)
end
