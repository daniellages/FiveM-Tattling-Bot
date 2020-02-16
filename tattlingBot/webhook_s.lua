local discord_webhook = {
    -- Insert Discord Webhook URL here!!!
    url = "",
    image = "https://i.pinimg.com/originals/ab/a1/d0/aba1d0c0115a70a7493c25cb269bdf0e.png"
}

-- List of commands that you want to get notified of
local commands = {
    "/revive",
    "/heal",
    "/noclip",
    "/car",
    "/goto",
    "/bring",
    "/kick",
    "/ban",
    "/freeze",
    "/unfreeze",
    "/setjob",
    "/giverole",
    "/giveaccountmoney",
    "/giveitem",
    "/giveweapon",
    "/weather",
    "/time",
    "/tp",
    "/restart",
    "/jail",
    "/unjail",
    "/slap",
    "/slay",
    "/kill",
    "/die",
    "/dv",
    "/gametype",
    "/gamename",
    "/jailmenu",
    "/cardel",
    "/mapname"
}

-- POST REQUEST
AddEventHandler(
    "chatMessage",
    function(source, author, text)
        -- Check if the command started with one of the commands
        for i = 1, #commands do
            if text:find(commands[i], 1, true) then
                PerformHttpRequest(discord_webhook.url, 
                function(err, text, header) end, 
                'POST', 
                json.encode({
                    content = "This person: **" .. author .. "** typed: ```yaml\n" .. text .. "```"   -- Discord message
                }), {['Content-Type'] = 'application/json'}) 
                --[[ we will set the username of the webhook as the username of the person ig and the content of the webhook will be whatever the user says in chat ]]
                break
            end
        end
    end
)