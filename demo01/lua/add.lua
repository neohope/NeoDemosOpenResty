--[[
ngx.STDERR – 标准输出
ngx.EMERG – 紧急报错
ngx.ALERT – 报警
ngx.CRIT – 严重，系统故障，触发运维告警系统
ngx.ERR – 错误，业务不可恢复性错误
ngx.WARN – 告警，业务中可忽略错误
ngx.NOTICE – 提醒，业务比较重要信息
ngx.INFO – 信息，业务琐碎日志信息，包含不同情况判断等
ngx.DEBUG – 调试
]]--


local headers = ngx.req.get_headers()
local a= ngx.var.arg_a
local b= ngx.var.arg_b


if a==nil then
    ngx.log(ngx.WARN, ">>>a is nil")
    ngx.say("a : ", a, " , b : ", b)  
    return 
end


if b==nil then
    ngx.log(ngx.WARN, ">>>b is nil")
    ngx.say("a : ", a, " , b : ", b)  
    return  
end


ngx.say("type(a) : ", type(a), " , type(b) : ", type(b),"</br>")

local na=tonumber(a)
local nb=tonumber(b)

if(na~=nil and nb~=nil) then
    ngx.say("a : ", a, " , b : ", b, " , a+b : ", a+b)
else
    ngx.say("a : ", a, " , b : ", b, " , a+b : ", a..b)
end



