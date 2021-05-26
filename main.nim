import dimscord, asyncdispatch, times, options, dimscmd

let discord = newDiscordClient("<token>")
var cmd = discord.newHandler()

# Handle event for on_ready.
proc onReady(s: Shard, r: Ready) {.event(discord).} =
    echo "Ready as " & $r.user

# Handle event for message_create.
proc messageCreate(s: Shard, msg: Message) {.event(discord).} =
    if msg.author.bot: return
    discard await cmd.handleMessage("/", msg)

cmd.addChat("echo") do (word: string, m: Message):
    discard await discord.api.sendMessage(m.channelID, word)

# Connect to Discord and run the bot.
waitFor discord.startSession()
