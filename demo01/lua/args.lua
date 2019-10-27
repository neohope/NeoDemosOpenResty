-- list all args
local arg = ngx.req.get_uri_args()
for k,v in pairs(arg) do
   ngx.say("[URL ] key:", k, " v:", v)
end

-- list all post keys
ngx.req.read_body()
local arg = ngx.req.get_post_args()
for k,v in pairs(arg) do
   ngx.say("[BODY] key:", k, " v:", v)
end

