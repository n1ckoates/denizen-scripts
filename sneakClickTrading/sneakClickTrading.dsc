sneakClickTrading:
    debug: false
    type: world
    events:
        on player right clicks player:
            - if !<player.is_sneaking>:
                  - stop
            - execute as_player "trade <context.entity.name>"
