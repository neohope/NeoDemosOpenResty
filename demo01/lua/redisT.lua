-- close redis
local function close_redis(red)  
    if not red then  
        return  
    end  
  
    local pool_max_idle_time = 10000  
    local pool_size = 100   
    local ok, err = red:set_keepalive(pool_max_idle_time, pool_size)  
    if not ok then  
        ngx.say("set keepalive error : ", err)  
    end  
end


local ip = "127.0.0.1"  
local port = 6379


-- open connection
local redis = require("resty.redis")  
local red = redis:new()  
red:set_timeout(1000)  

local ok, err = red:connect(ip, port)  
if not ok then  
    ngx.say("connect to redis error : ", err)  
    return close_redis(red)  
end  


--[[
-- auth
local ok, err = red:auth("foobared")
if not ok then
    ngx.say("failed to authenticate: ", err)
    return
end
]]--


-- get kv
local rsp, err = red:get("count")  
local count = 0;
if rsp==ngx.null then  
    count = 0
else
    count = rsp
end  


-- set kv
local newCount=count+1
ok, err = red:set("count", newCount)  
if not ok then  
    ngx.say("set count error : ", err)  
    return close_redis(red)  
end  


-- get kv
local rsp, err = red:get("count")  
if rsp == ngx.null then  
    rsp = 'is null'  
end  
ngx.say("count : ", rsp)  


-- close
close_redis(red) 

