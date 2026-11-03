Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715642;
	b=4Q8Uk0wsjSGjBQlxx0t+acshNak8rvI40pej7j1KfguANyxiOteDXZ+m+mSR6QcfcPqa
	 zq0X7kPl2GsgGcP4HkanKsjSf1JBr2g7mnWeZlP22GYtETbOMqw/z7Up5OPiDcgvqnZiI
	 2VKP8DfGDqNAbOlctRPrZ28BaGFi+xuFRzy+NrzETQxFUQA9IWn9/OsED0p9Ooikuu18R
	 nV9T68nYQ16mxA+NvIy3+l7HeWEnftnmVDjcJ/92ekCSJi5Z52g0o2NBV/SP7hc/1MltM
	 wPG6L/eGFwLkX5pu0IZjQCmHJMmDcZ4y4F9Qf2s+QEf5PiMYs0ysgYv+0WlLUOTbibQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715642;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=5JgNxddHg+jJsjMrOj5gCqmZrkgH4YstRu1iGT0UxFs=;
	b=hpPAFmdDGiM5mpwX+gPX7RDjONJ+gU/eugNby7w7nD1ooyLrePI+IvM5p4UDdjbHeV7A
	 g9orGr5GE1udfb/cIxIWP8ECEx3ykaaX5kF9TVD2M8BFIgNLlXxSPU9fscoAVE7hJ9CRg
	 e5xUYXOzYi957zInbVmLv1I12+NAlbJmlnVuRyVX3ukOkpwnP6ysvMXvKu3CVFLHxXT1g
	 Bt/JMq+I8aA+ADhs7FU4Mi1M4EVI9v3iwCsDcWwe21QXMe98N+VUarn0umEyOKtA1/8qB
	 r/NeJ2UDc65MPAgW1fBxv5arQ8FXb6ugfQt8dTMksp7es7tgegnjtybt5WJYDRZvHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E769606D821;
	Tue,  3 Nov 2026 14:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E769606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Received: by chaosmail.tech (Postfix) id DB6FB1CA450;
	Tue, 03 Nov 2026 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793715632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JgNxddHg+jJsjMrOj5gCqmZrkgH4YstRu1iGT0UxFs=;
	b=XQMZME52LjPmvps90U95vok1DpARvJsD3FVg9TbdkoUbMec6zML054hSS2LJT16N0dYWkj
	dNf/FEU69sSk16bJ4xxQSrTNXtxii8FYNjp/XR0HRpybN+2a+ehgJgyUAZmC0zlFBnCQW/
	8nIdIBSQeop+9qw1m5fOWp1cix3a164=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 03 Nov 2026 15:20:24 +0100
Subject: [PATCH v8 2/3] usb: typec: tipd: Factor out i2c specifics
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-tipd-ace3-v8-2-770f42421753@chaosmail.tech>
References: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
In-Reply-To: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715630; l=21465;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ZRylVO2ksomQJyXJLYm0f7ZfVXvUJXBV81zctHK37KE=;
 b=5KfkB8V/CO2SYIfHo87BuHoTuRq4jNkGmyUXqminMHSlbkKwgotMUcUtvkPnf1iWIhZm6F79a
 xpEtKLA1zQzBVeuGP3nIo/706u15LkGebsQGTJj3C7wJO0EKqz24BTT
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alyssa Milburn <amilburn@zall.org>

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip

Signed-off-by: Alyssa Milburn <amilburn@zall.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/usb/typec/tipd/Kconfig    |   8 +++--
 drivers/usb/typec/tipd/Makefile   |  11 ++++---
 drivers/usb/typec/tipd/core.c     | 230 ++++++++++++++++++++++++-----------------------------------------------------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c      | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 281 insertions(+), 198 deletions(-)

diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kconfig
index b82715293072..c87cbe6109ca 100644
--- a/drivers/usb/typec/tipd/Kconfig
+++ b/drivers/usb/typec/tipd/Kconfig
@@ -1,9 +1,13 @@
+config TYPEC_TPS6598X_CORE
+	tristate
+	select USB_ROLE_SWITCH
+	select POWER_SUPPLY
+
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
-	select POWER_SUPPLY
 	select REGMAP_I2C
-	select USB_ROLE_SWITCH
+	select TYPEC_TPS6598X_CORE
 	help
 	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
 	  Delivery controller.
diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
index aa439f80a889..c741bf44f52f 100644
--- a/drivers/usb/typec/tipd/Makefile
+++ b/drivers/usb/typec/tipd/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS_trace.o			:= -I$(src)
+CFLAGS_trace.o				:= -I$(src)
 
-obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
-tps6598x-y			:= core.o
-tps6598x-$(CONFIG_TRACING)	+= trace.o
+obj-$(CONFIG_TYPEC_TPS6598X_CORE)	+= tps6598x-core.o
+tps6598x-core-y				:= core.o
+tps6598x-core-$(CONFIG_TRACING)		+= trace.o
+
+obj-$(CONFIG_TYPEC_TPS6598X)		+= tps6598x.o
+tps6598x-y				:= i2c.o
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 02539378ffed..6c953e4a66d5 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -9,11 +9,9 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
-#include <linux/interrupt.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
@@ -92,30 +90,6 @@ struct tps6598x_rx_identity_reg {
 	struct usb_pd_identity identity;
 } __packed;
 
-/* TPS_REG_USB4_STATUS */
-struct tps6598x_usb4_status_reg {
-	u8 mode_status;
-	__le32 eudo;
-	__le32 unknown;
-} __packed;
-
-/* TPS_REG_DP_SID_STATUS */
-struct tps6598x_dp_sid_status_reg {
-	u8 mode_status;
-	__le32 status_tx;
-	__le32 status_rx;
-	__le32 configure;
-	__le32 mode_data;
-} __packed;
-
-/* TPS_REG_INTEL_VID_STATUS */
-struct tps6598x_intel_vid_status_reg {
-	u8 mode_status;
-	__le32 attention_vdo;
-	__le16 enter_vdo;
-	__le16 device_mode;
-} __packed;
-
 /* Standard Task return codes */
 #define TPS_TASK_TIMEOUT		1
 #define TPS_TASK_REJECTED		3
@@ -144,83 +118,6 @@ static const char *const modes[] = {
 /* Unrecognized commands will be replaced with "!CMD" */
 #define INVALID_CMD(_cmd_)		(_cmd_ == 0x444d4321)
 
-struct tps6598x;
-
-struct tipd_data {
-	irq_handler_t irq_handler;
-	u64 irq_mask1;
-	size_t tps_struct_size;
-	bool no_mode_control;
-	void (*remove)(struct tps6598x *tps);
-	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
-	void (*unregister_port)(struct tps6598x *tps);
-	void (*trace_data_status)(u32 status);
-	void (*trace_power_status)(u16 status);
-	void (*trace_status)(u32 status);
-	int (*apply_patch)(struct tps6598x *tps);
-	int (*init)(struct tps6598x *tps);
-	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
-	bool (*read_data_status)(struct tps6598x *tps);
-	bool (*read_power_status)(struct tps6598x *tps);
-	int (*reset)(struct tps6598x *tps);
-	int (*connect)(struct tps6598x *tps, u32 status);
-};
-
-struct tps6598x {
-	struct device *dev;
-	struct regmap *regmap;
-	struct mutex lock; /* device lock */
-	u8 i2c_protocol:1;
-
-	struct gpio_desc *reset;
-	struct typec_port *port;
-	struct typec_partner *partner;
-	struct usb_pd_identity partner_identity;
-	struct usb_role_switch *role_sw;
-	struct typec_capability typec_cap;
-
-	struct power_supply *psy;
-	struct power_supply_desc psy_desc;
-	enum power_supply_usb_type usb_type;
-
-	int wakeup;
-	u32 status; /* status reg */
-	u32 data_status;
-	u16 pwr_status;
-	struct delayed_work	wq_poll;
-
-	const struct tipd_data *data;
-};
-
-struct cd321x_status {
-	u32 status;
-	u32 pwr_status;
-	u32 data_status;
-	u32 status_changed;
-	struct usb_pd_identity partner_identity;
-	struct tps6598x_dp_sid_status_reg dp_sid_status;
-	struct tps6598x_intel_vid_status_reg intel_vid_status;
-	struct tps6598x_usb4_status_reg usb4_status;
-};
-
-struct cd321x {
-	struct tps6598x tps;
-
-	struct tps6598x_dp_sid_status_reg dp_sid_status;
-	struct tps6598x_intel_vid_status_reg intel_vid_status;
-	struct tps6598x_usb4_status_reg usb4_status;
-
-	struct typec_altmode *port_altmode_dp;
-	struct typec_altmode *port_altmode_tbt;
-
-	struct typec_mux *mux;
-	struct typec_mux_state state;
-
-	struct cd321x_status update_status;
-	struct delayed_work update_work;
-	struct usb_pd_identity cur_partner_identity;
-};
-
 static enum power_supply_property tps6598x_psy_props[] = {
 	POWER_SUPPLY_PROP_USB_TYPE,
 	POWER_SUPPLY_PROP_ONLINE,
@@ -1135,11 +1032,12 @@ static int tps6598x_check_mode(struct tps6598x *tps)
 	return -ENODEV;
 }
 
-static const struct regmap_config tps6598x_regmap_config = {
+const struct regmap_config tps6598x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x7F,
 };
+EXPORT_SYMBOL_GPL(tps6598x_regmap_config);
 
 static int tps6598x_psy_get_online(struct tps6598x *tps,
 				   union power_supply_propval *val)
@@ -1787,28 +1685,14 @@ static void cd321x_remove(struct tps6598x *tps)
 	cancel_delayed_work_sync(&cd321x->update_work);
 }
 
-static int tps6598x_probe(struct i2c_client *client)
+int tipd_init(struct tps6598x *tps)
 {
-	const struct tipd_data *data;
-	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	bool patch_loaded = false;
 	u32 status;
 	u32 vid = 0;
 	int ret;
 
-	data = i2c_get_match_data(client);
-	if (!data)
-		return -EINVAL;
-
-	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
-	if (!tps)
-		return -ENOMEM;
-
-	mutex_init(&tps->lock);
-	tps->dev = &client->dev;
-	tps->data = data;
-
 	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(tps->reset))
 		return dev_err_probe(tps->dev, PTR_ERR(tps->reset),
@@ -1816,10 +1700,6 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (tps->reset)
 		msleep(TPS_SETUP_MS);
 
-	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
-	if (IS_ERR(tps->regmap))
-		return PTR_ERR(tps->regmap);
-
 	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
 		if (ret < 0 || !vid) {
@@ -1829,13 +1709,6 @@ static int tps6598x_probe(struct i2c_client *client)
 		}
 	}
 
-	/*
-	 * Checking can the adapter handle SMBus protocol. If it can not, the
-	 * driver needs to take care of block reads separately.
-	 */
-	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
-		tps->i2c_protocol = true;
-
 	if (tps->data->switch_power_state) {
 		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
 		if (ret)
@@ -1872,7 +1745,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	 * with existing DT files, we work around this by deleting any
 	 * fwnode_links to/from this fwnode.
 	 */
-	fwnode = device_get_named_child_node(&client->dev, "connector");
+	fwnode = device_get_named_child_node(tps->dev, "connector");
 	if (fwnode)
 		fw_devlink_purge_absent_suppliers(fwnode);
 
@@ -1898,14 +1771,14 @@ static int tps6598x_probe(struct i2c_client *client)
 			goto err_unregister_port;
 		ret = tps->data->connect(tps, status);
 		if (ret)
-			dev_err(&client->dev, "failed to register partner\n");
+			dev_err(tps->dev, "failed to register partner\n");
 	}
 
-	if (client->irq) {
-		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+	if (tps->irq) {
+		ret = devm_request_threaded_irq(tps->dev, tps->irq, NULL,
 						tps->data->irq_handler,
 						IRQF_SHARED | IRQF_ONESHOT,
-						dev_name(&client->dev), tps);
+						dev_name(tps->dev), tps);
 	} else {
 		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
 		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
@@ -1916,13 +1789,12 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (ret)
 		goto err_disconnect;
 
-	i2c_set_clientdata(client, tps);
 	fwnode_handle_put(fwnode);
 
 	tps->wakeup = device_property_read_bool(tps->dev, "wakeup-source");
-	if (tps->wakeup && client->irq) {
-		devm_device_init_wakeup(&client->dev);
-		enable_irq_wake(client->irq);
+	if (tps->wakeup && tps->irq) {
+		devm_device_init_wakeup(tps->dev);
+		enable_irq_wake(tps->irq);
 	}
 
 	return 0;
@@ -1944,15 +1816,14 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(tipd_init);
 
-static void tps6598x_remove(struct i2c_client *client)
+void tipd_remove(struct tps6598x *tps)
 {
-	struct tps6598x *tps = i2c_get_clientdata(client);
-
-	if (!client->irq)
+	if (!tps->irq)
 		cancel_delayed_work_sync(&tps->wq_poll);
 	else
-		devm_free_irq(tps->dev, client->irq, tps);
+		devm_free_irq(tps->dev, tps->irq, tps);
 
 	if (tps->data->remove)
 		tps->data->remove(tps);
@@ -1967,29 +1838,26 @@ static void tps6598x_remove(struct i2c_client *client)
 	if (tps->reset)
 		gpiod_set_value_cansleep(tps->reset, 1);
 }
+EXPORT_SYMBOL_GPL(tipd_remove);
 
-static int __maybe_unused tps6598x_suspend(struct device *dev)
+int tipd_suspend(struct tps6598x *tps)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct tps6598x *tps = i2c_get_clientdata(client);
-
 	if (tps->wakeup) {
-		disable_irq(client->irq);
-		enable_irq_wake(client->irq);
+		disable_irq(tps->irq);
+		enable_irq_wake(tps->irq);
 	} else if (tps->reset) {
 		gpiod_set_value_cansleep(tps->reset, 1);
 	}
 
-	if (!client->irq)
+	if (!tps->irq)
 		cancel_delayed_work_sync(&tps->wq_poll);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tipd_suspend);
 
-static int __maybe_unused tps6598x_resume(struct device *dev)
+int tipd_resume(struct tps6598x *tps)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct tps6598x *tps = i2c_get_clientdata(client);
 	int ret;
 
 	ret = tps6598x_check_mode(tps);
@@ -2003,25 +1871,22 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 	}
 
 	if (tps->wakeup) {
-		disable_irq_wake(client->irq);
-		enable_irq(client->irq);
+		disable_irq_wake(tps->irq);
+		enable_irq(tps->irq);
 	} else if (tps->reset) {
 		gpiod_set_value_cansleep(tps->reset, 0);
 		msleep(TPS_SETUP_MS);
 	}
 
-	if (!client->irq)
+	if (!tps->irq)
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tipd_resume);
 
-static const struct dev_pm_ops tps6598x_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tps6598x_suspend, tps6598x_resume)
-};
-
-static const struct tipd_data cd321x_data = {
+static const struct tipd_data tipd_cd321x_data = {
 	.irq_handler = cd321x_interrupt,
 	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
@@ -2042,7 +1907,7 @@ static const struct tipd_data cd321x_data = {
 	.connect = cd321x_connect,
 };
 
-static const struct tipd_data tps6598x_data = {
+static const struct tipd_data tipd_tps6598x_data = {
 	.irq_handler = tps6598x_interrupt,
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
@@ -2061,7 +1926,7 @@ static const struct tipd_data tps6598x_data = {
 	.connect = tps6598x_connect,
 };
 
-static const struct tipd_data tps66993_data = {
+static const struct tipd_data tipd_tps66993_data = {
 	.irq_handler = tps6598x_interrupt,
 	.irq_mask1 = TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
@@ -2079,7 +1944,7 @@ static const struct tipd_data tps66993_data = {
 	.connect = tps6598x_connect,
 };
 
-static const struct tipd_data tps25750_data = {
+static const struct tipd_data tipd_tps25750_data = {
 	.irq_handler = tps25750_interrupt,
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
@@ -2098,33 +1963,14 @@ static const struct tipd_data tps25750_data = {
 	.connect = tps6598x_connect,
 };
 
-static const struct of_device_id tps6598x_of_match[] = {
-	{ .compatible = "ti,tps6598x", &tps6598x_data},
-	{ .compatible = "ti,tps66993", &tps66993_data},
-	{ .compatible = "apple,cd321x", &cd321x_data},
-	{ .compatible = "ti,tps25750", &tps25750_data},
-	{}
-};
-MODULE_DEVICE_TABLE(of, tps6598x_of_match);
-
-static const struct i2c_device_id tps6598x_id[] = {
-	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)&tps6598x_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tps6598x_id);
-
-static struct i2c_driver tps6598x_i2c_driver = {
-	.driver = {
-		.name = "tps6598x",
-		.pm = &tps6598x_pm_ops,
-		.of_match_table = tps6598x_of_match,
-	},
-	.probe = tps6598x_probe,
-	.remove = tps6598x_remove,
-	.id_table = tps6598x_id,
+const struct tipd_data *tipd_hw_variants[] = {
+	[TIPD_VARIANT_CD321X] = &tipd_cd321x_data,
+	[TIPD_VARIANT_TPS6598X] = &tipd_tps6598x_data,
+	[TIPD_VARIANT_TPS66993] = &tipd_tps66993_data,
+	[TIPD_VARIANT_TPS25750] = &tipd_tps25750_data,
 };
-module_i2c_driver(tps6598x_i2c_driver);
+EXPORT_SYMBOL_GPL(tipd_hw_variants);
 
 MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Core Functions");
diff --git a/drivers/usb/typec/tipd/i2c.c b/drivers/usb/typec/tipd/i2c.c
new file mode 100644
index 000000000000..a51fc6c39771
--- /dev/null
+++ b/drivers/usb/typec/tipd/i2c.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for TI TPS6598x USB Power Delivery controller family
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "tps6598x.h"
+
+static int tps6598x_probe_i2c(struct i2c_client *client)
+{
+	enum tipd_hw_variant variant;
+	const struct tipd_data *data;
+	struct tps6598x *tps;
+	int ret;
+
+	variant = (enum tipd_hw_variant)(uintptr_t)i2c_get_match_data(client);
+	if (!variant || variant >= TIPD_VARIANT_MAX)
+		return -EINVAL;
+	data = tipd_hw_variants[variant];
+
+	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	mutex_init(&tps->lock);
+	tps->dev = &client->dev;
+	tps->data = data;
+	tps->irq = client->irq;
+
+	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
+	if (IS_ERR(tps->regmap))
+		return PTR_ERR(tps->regmap);
+
+	/*
+	 * Checking can the adapter handle SMBus protocol. If it can not, the
+	 * driver needs to take care of block reads separately.
+	 */
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		tps->i2c_protocol = true;
+
+	ret = tipd_init(tps);
+
+	if (ret == 0)
+		i2c_set_clientdata(client, tps);
+
+	return ret;
+}
+
+static void tps6598x_remove_i2c(struct i2c_client *client)
+{
+	struct tps6598x *tps = i2c_get_clientdata(client);
+
+	tipd_remove(tps);
+}
+
+static int __maybe_unused tps6598x_suspend(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+
+	return tipd_suspend(tps);
+}
+
+static int __maybe_unused tps6598x_resume(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+
+	return tipd_resume(tps);
+}
+
+static const struct dev_pm_ops tps6598x_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(tps6598x_suspend, tps6598x_resume)
+};
+
+static const struct of_device_id tps6598x_of_match[] = {
+	{ .compatible = "ti,tps6598x", (void *)TIPD_VARIANT_TPS6598X},
+	{ .compatible = "ti,tps66993", (void *)TIPD_VARIANT_TPS66993},
+	{ .compatible = "apple,cd321x",  (void *)TIPD_VARIANT_CD321X},
+	{ .compatible = "ti,tps25750",  (void *)TIPD_VARIANT_TPS25750},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tps6598x_of_match);
+
+static const struct i2c_device_id tps6598x_id[] = {
+	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)TIPD_VARIANT_TPS6598X },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tps6598x_id);
+
+static struct i2c_driver tps6598x_i2c_driver = {
+	.driver = {
+		.name = "tps6598x",
+		.pm = &tps6598x_pm_ops,
+		.of_match_table = tps6598x_of_match,
+	},
+	.probe = tps6598x_probe_i2c,
+	.remove = tps6598x_remove_i2c,
+	.id_table = tps6598x_id,
+};
+module_i2c_driver(tps6598x_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Driver");
diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 11ab58ba9a18..5af575d18354 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -8,6 +8,10 @@
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
+#include <linux/power_supply.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 #ifndef __TPS6598X_H__
 #define __TPS6598X_H__
@@ -273,4 +277,123 @@
 #define TPS_65981_2_6_INTEVENT_LEN             8
 #define TPS_65987_8_INTEVENT_LEN               11
 
+enum tipd_hw_variant {
+	TIPD_VARIANT_INVALID = 0,
+	TIPD_VARIANT_CD321X,
+	TIPD_VARIANT_TPS6598X,
+	TIPD_VARIANT_TPS66993,
+	TIPD_VARIANT_TPS25750,
+	TIPD_VARIANT_MAX,
+};
+
+struct tps6598x;
+
+struct tipd_data {
+	irq_handler_t irq_handler;
+	u64 irq_mask1;
+	size_t tps_struct_size;
+	bool no_mode_control;
+	void (*remove)(struct tps6598x *tps);
+	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
+	void (*unregister_port)(struct tps6598x *tps);
+	void (*trace_data_status)(u32 status);
+	void (*trace_power_status)(u16 status);
+	void (*trace_status)(u32 status);
+	int (*apply_patch)(struct tps6598x *tps);
+	int (*init)(struct tps6598x *tps);
+	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
+	bool (*read_data_status)(struct tps6598x *tps);
+	bool (*read_power_status)(struct tps6598x *tps);
+	int (*reset)(struct tps6598x *tps);
+	int (*connect)(struct tps6598x *tps, u32 status);
+};
+
+struct tps6598x {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock; /* device lock */
+	int irq;
+	u8 i2c_protocol:1;
+
+	struct gpio_desc *reset;
+	struct typec_port *port;
+	struct typec_partner *partner;
+	struct usb_pd_identity partner_identity;
+	struct usb_role_switch *role_sw;
+	struct typec_capability typec_cap;
+
+	struct power_supply *psy;
+	struct power_supply_desc psy_desc;
+	enum power_supply_usb_type usb_type;
+
+	int wakeup;
+	u32 status; /* status reg */
+	u32 data_status;
+	u16 pwr_status;
+	struct delayed_work	wq_poll;
+
+	const struct tipd_data *data;
+};
+
+/* TPS_REG_USB4_STATUS */
+struct tps6598x_usb4_status_reg {
+	u8 mode_status;
+	__le32 eudo;
+	__le32 unknown;
+} __packed;
+
+/* TPS_REG_DP_SID_STATUS */
+struct tps6598x_dp_sid_status_reg {
+	u8 mode_status;
+	__le32 status_tx;
+	__le32 status_rx;
+	__le32 configure;
+	__le32 mode_data;
+} __packed;
+
+/* TPS_REG_INTEL_VID_STATUS */
+struct tps6598x_intel_vid_status_reg {
+	u8 mode_status;
+	__le32 attention_vdo;
+	__le16 enter_vdo;
+	__le16 device_mode;
+} __packed;
+
+struct cd321x_status {
+	u32 status;
+	u32 pwr_status;
+	u32 data_status;
+	u32 status_changed;
+	struct usb_pd_identity partner_identity;
+	struct tps6598x_dp_sid_status_reg dp_sid_status;
+	struct tps6598x_intel_vid_status_reg intel_vid_status;
+	struct tps6598x_usb4_status_reg usb4_status;
+};
+
+struct cd321x {
+	struct tps6598x tps;
+
+	struct tps6598x_dp_sid_status_reg dp_sid_status;
+	struct tps6598x_intel_vid_status_reg intel_vid_status;
+	struct tps6598x_usb4_status_reg usb4_status;
+
+	struct typec_altmode *port_altmode_dp;
+	struct typec_altmode *port_altmode_tbt;
+
+	struct typec_mux *mux;
+	struct typec_mux_state state;
+
+	struct cd321x_status update_status;
+	struct delayed_work update_work;
+	struct usb_pd_identity cur_partner_identity;
+};
+
+extern const struct tipd_data *tipd_hw_variants[];
+extern const struct regmap_config tps6598x_regmap_config;
+
+int tipd_init(struct tps6598x *tps);
+void tipd_remove(struct tps6598x *tps);
+int tipd_suspend(struct tps6598x *tps);
+int tipd_resume(struct tps6598x *tps);
+
 #endif /* __TPS6598X_H__ */

-- 
2.56.0

