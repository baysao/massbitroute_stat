local _config = {
    server = {
        nginx = {
            port = "80",
            port_ssl = "443",
            server_name = "massbitroute"
        }
    },
    templates = {},
    apps = {},
    supervisor = [[

[program:stat_prometheus]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/portal_prometheus.log

[program:stat_grafana]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_grafana _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/portal_grafana.log
    ]]
}
return _config
