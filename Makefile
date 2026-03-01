BIN_DIR := ./bin
DEFAULT_SEEDS_DIR := ./seeds

.PHONY: migrator migrate-up migrate-down seeder seed-up seed-up-default seed-down seed-down-default

migrator:
	@mkdir -p $(BIN_DIR)
	go build -o $(BIN_DIR)/migrator ./cmd/migrator

migrate-up: migrator
	$(BIN_DIR)/migrator --up

migrate-down: migrator
	$(BIN_DIR)/migrator --down

seeder:
	@mkdir -p $(BIN_DIR)
	go build -o $(BIN_DIR)/seeder ./cmd/seeder

seed-up: seeder
	@if [ -z "$(FILE)" ]; then \
		echo "usage: make seed-up FILE=<filepath>"; \
		exit 1; \
	fi
	$(BIN_DIR)/seeder --up --file "$(FILE)"

seed-up-default: seeder
	./scripts/seed_default.sh up "$(BIN_DIR)/seeder" "$(DEFAULT_SEEDS_DIR)"

seed-down: seeder
	@if [ -z "$(FILE)" ]; then \
		echo "usage: make seed-down FILE=<filepath>"; \
		exit 1; \
	fi
	$(BIN_DIR)/seeder --down --file "$(FILE)"

seed-down-default: seeder
	./scripts/seed_default.sh down "$(BIN_DIR)/seeder" "$(DEFAULT_SEEDS_DIR)"
