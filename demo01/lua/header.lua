local headers = ngx.req.get_headers()

ngx.say("all headers:", "<br/>")
for k,v in pairs(headers) do
    if type(v) == "table" then
        ngx.say(k, " : ", table.concat(v, ","), "<br/>")
    else
        ngx.say(k, " : ", v, "<br/>")
    end
end

ngx.say("", "<br/>")
ngx.say("", "<br/>")
ngx.say("get headers:", "<br/>")
ngx.say("host : ", headers["host"], "<br/>")
ngx.say("user-agent : ", headers["user-agent"], "<br/>")
-- ngx.say("host : ", headers.host, "<br/>")
-- ngx.say("user-agent : ", headers.user_agent, "<br/>")

ngx.say("ngx.req.http_version : ", ngx.req.http_version(), "<br/>")  
ngx.say("ngx.req.get_method : ", ngx.req.get_method(), "<br/>")  
ngx.say("ngx.req.raw_header : ",  ngx.req.raw_header(), "<br/>")  
ngx.say("ngx.req.get_body_data() : ", ngx.req.get_body_data(), "<br/>")


