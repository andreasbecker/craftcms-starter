.PHONY: prod dev install setup clean

prod: 
	ddev exec npm run build

dev: 
	ddev exec npm run dev

start: 
	ddev start
	ddev exec npm run dev

install:
	ddev start
	ddev exec npm install
	ddev composer install
	@if [ ! -f .env ]; then \
		if [ -f .env.example.dev ]; then \
			cp .env.example.dev .env; \
			echo ".env file created from .env.example.dev"; \
		else \
			echo "Error: .env.example.dev file not found"; \
			exit 1; \
		fi \
	fi
	ddev exec php craft install
	@if [ -z "$(CRAFT_SITE_NAME)" ]; then \
		read -p "Site Name: " site_name; \
		sed -i '' "s/^CRAFT_SITE_NAME=.*/CRAFT_SITE_NAME=\"$$site_name\"/" .env || echo "CRAFT_SITE_NAME=\"$$site_name\"" >> .env; \
	fi; \
	if [ -z "$(CRAFT_SYSTEM_EMAIL)" ]; then \
		read -p "System Email: " system_email; \
		sed -i '' "s/^CRAFT_SYSTEM_EMAIL=.*/CRAFT_SYSTEM_EMAIL=\"$$system_email\"/" .env || echo "CRAFT_SYSTEM_EMAIL=\"$$system_email\"" >> .env; \
	fi; \
	ddev exec php craft plugin/install seomatic
	ddev exec php craft plugin/install vite
	ddev exec php craft plugin/install blitz
	ddev exec php craft plugin/install formie
	ddev exec php craft plugin/install minify
	ddev exec php craft plugin/install ckeditor
	ddev exec php craft plugin/install navigation
	ddev exec php craft plugin/install wordsmith
	ddev exec php craft plugin/install blurhash
	ddev exec php craft up --interactive=0
	ddev exec php craft update all
	ddev launch; \
	echo "Install complete 🎉"

setup: 
	ddev start
	git pull
	ddev exec npm install
	ddev composer install
	ddev exec php craft setup/keys
	ddev exec php craft up --interactive=0
	ddev exec npm run dev

clean: 
	rm -rf vendor/
	rm -rf node_modules/
	ddev composer clear-cache
	ddev exec npm cache clean --force
	ddev composer install
	ddev exec npm install

clean-logs:
	rm -rf storage/logs/*.log

update: 
	ddev exec php craft update all

up: 
	ddev exec php craft up --interactive=0

tp: 
	ddev tableplus

l: 
	ddev launch
