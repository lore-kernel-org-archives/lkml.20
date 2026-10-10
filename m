Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F413451998;
	Sat, 10 Oct 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625429; cv=none; b=M/hqYxlxmDeRq3KI1SgG4194wNrkSa5qVBU8rUg+2BLc8YWOHGqsISgVSh4xTp9bXlZP8XXLgAE6I5UpMuWwsPxWsSVbRlcAtfDvLP4xnLDjIigkvbyvtru4uD3HPeAPiLCQqxp1lef8ZkeHiDMC9EGe34N6AfIil17qWebaF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625429; c=relaxed/simple;
	bh=IuqZyd41IKoXkHRSBca4LUP06pXm1Y760E0wcbhKTQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNj1IbUXrkreEq0E4CL9dGBnvDcpOGaEr6w0Ec42IIHmvtN6mNaUlK2XOPPUUqkuJZWtwelXz9ubv8GX5hnIGn60spl3R78TvvvCko9EevK5Eiy9L4YZhKJGLB2vWJNOX3+BPHAVKLQ1m7TD7SalTkEuyZg+9f+uegePqegCJS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=ukXh3gRU; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="ukXh3gRU"
Received: by chaosmail.tech (Postfix) id 5B70E1CC3F3;
	Sat, 10 Oct 2026 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1791625087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuz1NCAPzdIRuP4KyCfFTkcTVoV0hcBBaFvz5nXOQ5M=;
	b=ukXh3gRUjwnmlolHo2peIvkVIKEKjA/HnFi1PfnA6ij/Hn6XLo/j5hw3aY0d8xPhhJ3Ct3
	Y+tgM9BHFFiuJC6UK4fAEfiSLls0SJiyfM2IuaYzdUDcFzmiWZUzHQILKtQ1ljXxdPczOk
	PAeB1HNauW0JtMEpwC7VcCEIiNnOi48=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 10 Oct 2026 11:37:56 +0200
Subject: [PATCH RESEND v7 2/3] usb: typec: tipd: Factor out i2c specifics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tipd-ace3-v7-2-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
In-Reply-To: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791625084; l=21435;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ITs3EwnFaew5uYo1/vYlutcPRYCbxnpLdR9cVY2dO8k=;
 b=lhRW9C/F9TsX8Mzl/WSceoR6okDfSZWIVKI+TwmW5vs/xDVtpxHfPTloBajuowjdAe/H67/ly
 /jvT5MiqnqKASZlAF8Tz3SoacYBDcgjgCONDRuaizniV9ABSAHGeAHP
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
index 9248f0dd3f49..bdcc6f75d93f 100644
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
@@ -1137,11 +1034,12 @@ static int tps6598x_check_mode(struct tps6598x *tps)
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
@@ -1789,27 +1687,13 @@ static void cd321x_remove(struct tps6598x *tps)
 	cancel_delayed_work_sync(&cd321x->update_work);
 }
 
-static int tps6598x_probe(struct i2c_client *client)
+int tipd_init(struct tps6598x *tps)
 {
-	const struct tipd_data *data;
-	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
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
@@ -1817,10 +1701,6 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (tps->reset)
 		msleep(TPS_SETUP_MS);
 
-	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
-	if (IS_ERR(tps->regmap))
-		return PTR_ERR(tps->regmap);
-
 	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
 		if (ret < 0 || !vid) {
@@ -1830,13 +1710,6 @@ static int tps6598x_probe(struct i2c_client *client)
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
@@ -1943,15 +1815,14 @@ static int tps6598x_probe(struct i2c_client *client)
 
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
@@ -1966,29 +1837,26 @@ static void tps6598x_remove(struct i2c_client *client)
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
@@ -2002,25 +1870,22 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
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
@@ -2041,7 +1906,7 @@ static const struct tipd_data cd321x_data = {
 	.connect = cd321x_connect,
 };
 
-static const struct tipd_data tps6598x_data = {
+static const struct tipd_data tipd_tps6598x_data = {
 	.irq_handler = tps6598x_interrupt,
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
@@ -2060,7 +1925,7 @@ static const struct tipd_data tps6598x_data = {
 	.connect = tps6598x_connect,
 };
 
-static const struct tipd_data tps66993_data = {
+static const struct tipd_data tipd_tps66993_data = {
 	.irq_handler = tps6598x_interrupt,
 	.irq_mask1 = TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
@@ -2078,7 +1943,7 @@ static const struct tipd_data tps66993_data = {
 	.connect = tps6598x_connect,
 };
 
-static const struct tipd_data tps25750_data = {
+static const struct tipd_data tipd_tps25750_data = {
 	.irq_handler = tps25750_interrupt,
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
@@ -2097,33 +1962,14 @@ static const struct tipd_data tps25750_data = {
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

