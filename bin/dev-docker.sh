COMPOSE_FILE=docker-compose.dev.yml

function docex {
	docker-compose -f $COMPOSE_FILE run --rm app ${@:-bash}
}

function reinstall_modules {
	echo "removing modules" && \
	docex rm -rf node_modules && \
	echo "installing" && \
	docex npm i --unsafe-perm --quiet --no-save
}

function up {
	docker-compose up -d
}

function down {
	docker-compose down
}

function show_help {
	echo "usage ${0} [action][...action args]

Actions:
	up: Up all containers in detach mode
	down: switch off all containers
	reinstall-modules: remove and install node modules
	help: show this help
"
}

case $1 in
	reinstall-modules)
		reinstall_modules;
		shift
	;;
	up)
		up;
		shift;
	;;
	down)
		down;
		shift;
	;;
	help)
		show_help;
		shift;
	;;
	*)
		show_help;
		exit 1;
	;;
esac

