U := me

production-setup:
	ansible-playbook ansible/site.yml -i ansible/production --ask-become-pass --ask-vault-pass

production-setup-second:
	ansible-playbook ansible/site.yml -i ansible/production --ask-become-pass --ask-vault-pass --limit "production_second"

production-env-update:
	ansible-playbook ansible/site.yml -i ansible/production -u $U --tag env --ask-become-pass --ask-vault-pass

production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U --ask-vault-pass

production-deploy-second:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U --ask-vault-pass --limit "production_second"

production-deploy-app:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U --tag app --ask-vault-pass