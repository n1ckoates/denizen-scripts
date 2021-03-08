playtimeCommand:
    debug: false
    type: command
    name: playtime
    description: Shows your playtime or another player's.
    usage: /playtime <&lt>player<&gt>
    tab completions:
        1: <server.online_players.parse[name]>
    aliases:
        - pt
    script:
        - if <context.args.size> > 0:
              - define tickTime <server.match_offline_player[<context.args.get[1]>].statistic[PLAY_ONE_MINUTE]||null>
              - if <[tickTime]> == null:
                    - narrate "<&8><&l>›<&c> That player doesn't exist!"
                    - stop
        - else:
              - define tickTime <player.statistic[PLAY_ONE_MINUTE]>

        - define humanTime <duration[<[tickTime]>t].formatted>

        - if <context.args.size> > 0:
              - narrate "<&a><&l>›<&7> They've played for <&a><[humanTime]><&7>."
        - else:
              - narrate "<&a><&l>›<&7> You've played for <&a><[humanTime]><&7>."
