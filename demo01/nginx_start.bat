SET PERL_HOME=D:\NeoLang\Perl5
SET OR_HOME=D:\NeoServer\Nginx\openresty-1.15.8.2-win64
SET PATH=%PERL_HOME%\bin;%OR_HOME%;%PATH%

nginx -c conf/nginx.conf

pause
