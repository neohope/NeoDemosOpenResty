local shared_data = ngx.shared.shared_data
local i = shared_data:get("i")

if not i then
  i = 0
  shared_data:set("i",i)
end

i = shared_data:incr("i",1)

ngx.say("visit count:",i)

