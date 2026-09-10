.PHONY: _compile-impl
_compile-impl:
	mix compile

# Shared targets from Bot Army Infra
BOT_ARMY_COMMON_MK := $(abspath $(CURDIR)/../bot_army_infra/make/common.mk)
ifeq ($(wildcard $(BOT_ARMY_COMMON_MK)),)
$(warning bot_army_infra not found — shared targets unavailable)
else
include $(BOT_ARMY_COMMON_MK)
endif
