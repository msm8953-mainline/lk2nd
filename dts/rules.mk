LOCAL_DIR := $(GET_LOCAL_DIR)

ifeq ($(PROJECT), msm8916-secondary)
DTBS += \
	$(LOCAL_DIR)/apq8016-samsung-r07.dtb \
	$(LOCAL_DIR)/msm8916-longcheer-l8150.dtb \
	$(LOCAL_DIR)/msm8916-motorola-harpia.dtb \
	$(LOCAL_DIR)/msm8916-samsung-r01.dtb \
	$(LOCAL_DIR)/msm8916-samsung-r03.dtb \
	$(LOCAL_DIR)/msm8916-samsung-r04.dtb \
	$(LOCAL_DIR)/msm8916-samsung-r06.dtb
endif
ifeq ($(PROJECT), msm8953-secondary)
DTBS += \
	$(LOCAL_DIR)/sdm450-samsung-r04.dtb \
	$(LOCAL_DIR)/msm8953-xiaomi-mido.dtb \
	$(LOCAL_DIR)/msm8953-xiaomi-vince.dtb
endif
ifeq ($(PROJECT), msm8952-secondary)
DTBS += \
	$(LOCAL_DIR)/msm8940-xiaomi-santoni.dtb
endif
