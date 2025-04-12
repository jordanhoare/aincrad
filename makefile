# *******************************************************************************
# Terminal Colors
# *******************************************************************************
ifneq ($(OS),Windows_NT)
  # ANSI Color codes for Unix-like systems
  COLOR_RESET  := $(shell tput sgr0 2>/dev/null || echo "")
  COLOR_RED    := $(shell tput setaf 1 2>/dev/null || echo "")
  COLOR_GREEN  := $(shell tput setaf 2 2>/dev/null || echo "")
  COLOR_YELLOW := $(shell tput setaf 3 2>/dev/null || echo "")
  COLOR_BLUE   := $(shell tput setaf 4 2>/dev/null || echo "")
  COLOR_PURPLE := $(shell tput setaf 5 2>/dev/null || echo "")
  COLOR_CYAN   := $(shell tput setaf 6 2>/dev/null || echo "")
  COLOR_WHITE  := $(shell tput setaf 7 2>/dev/null || echo "")
 
  # Styled text
  STYLE_BOLD   := $(shell tput bold 2>/dev/null || echo "")
  STYLE_DIM    := $(shell tput dim 2>/dev/null || echo "")
  STYLE_ITALIC := $(shell tput sitm 2>/dev/null || echo "")
else
  # For Windows, no colors
  COLOR_RESET  :=
  COLOR_RED    :=
  COLOR_GREEN  :=
  COLOR_YELLOW :=
  COLOR_BLUE   :=
  COLOR_PURPLE :=
  COLOR_CYAN   :=
  COLOR_WHITE  :=
 
  STYLE_BOLD   :=
  STYLE_DIM    :=
  STYLE_ITALIC :=
endif
# *******************************************************************************
# Platform Detection
# *******************************************************************************
ifeq ($(OS),Windows_NT)
  PLATFORM := windows
  SHELL := powershell.exe
  .SHELLFLAGS := -NoProfile -Command
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Linux)
    PLATFORM := linux
  endif
  ifeq ($(UNAME_S),Darwin)
    PLATFORM := macos
  endif
endif
# *******************************************************************************
# Architecture Detection
# *******************************************************************************
ARCH ?= $(shell uname -m 2>/dev/null || echo x86_64)
ifeq ($(ARCH),x86_64)
  RELEASE_ARCH ?= release_x64
  VCPKG_TRIPLET ?= x64-linux
else ifeq ($(ARCH),aarch64)
  RELEASE_ARCH ?= release_arm64
  VCPKG_TRIPLET ?= arm64-linux
else ifeq ($(ARCH),arm64)
  RELEASE_ARCH ?= release_arm64
  VCPKG_TRIPLET ?= arm64-linux
else
  RELEASE_ARCH ?= release_x64
  VCPKG_TRIPLET ?= x64-linux
endif
ENV_FILE ?= ./.env
COMPOSE_FILE ?= docker/docker-compose.yml

docker-up: docker-env
	@echo "$(COLOR_GREEN)Starting Docker containers...$(COLOR_RESET)"
ifeq ($(OS),Windows_NT)
	@powershell -Command "docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d"
else
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d
endif

docker-env:
ifeq ($(OS),Windows_NT)
	@powershell -Command "if (!(Test-Path $(ENV_FILE))) { Write-Host '$(COLOR_BLUE)Creating .env file from example...$(COLOR_RESET)'; Copy-Item .env.example $(ENV_FILE) }"
else
	@if [ ! -f $(ENV_FILE) ]; then \
		echo "$(COLOR_BLUE)Creating .env file from example...$(COLOR_RESET)"; \
		cp .env.example $(ENV_FILE); \
	fi
endif

clean:
	@echo "$(COLOR_RED)Cleaning up Docker resources...$(COLOR_RESET)"
ifeq ($(OS),Windows_NT)
	@powershell -Command "docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v"
	@powershell -Command "docker system prune -a --volumes -f"
else
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v
	docker system prune -a --volumes -f
endif
	@echo "$(COLOR_GREEN)Cleanup complete!$(COLOR_RESET)"
