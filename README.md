# Bess56_infra
Bess56 Infra repository

#SSH подключение к внутреннему хосту someinternalhost одной командой:
ssh 10.128.0.14 -J 62.84.126.130

# Alias для команды подключения к внутреннему хосту:
alias someinternalhost='ssh 10.128.0.14 -J 62.84.126.130'

bastion_IP = 10.128.0.13
someinternalhost_IP = 10.128.0.14
