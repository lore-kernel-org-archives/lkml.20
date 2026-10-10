Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F345348A;
	Sat, 10 Oct 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625429; cv=none; b=YVHyQ+5uKuytVI6OxuQVBdrICcPRFRW2SUgAP1HjatDZg1drO4duswrkfQQ3D0PD3eLqH3UmVlxRtYBkWkJPc+B2gNLPe6hMf6QCxTDSfpqm4S9p7x/mrQ+u275iVTKMc8Xe6nNG2iOEEHyZ1JrECBBblvso+z2iHB6QSNN84uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625429; c=relaxed/simple;
	bh=yPz47tnDJi1ALuWLSFDoLVUVJrO3KpWOWApIMMI5dtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDCMVvrkQKRpm3rpGuwiRK4opgB4WP/M5IOSLYTOJNvjfiWEyl2jZXilx0PnUuTWKr5rC0wJjbu8IwJU1riAVZdkmGB+P0Qe0nU84VZDAMfqbWcrRXTYnMVaNA1ubDcFcI3g+q1A6i4vu0u4WIKXtgIO0N8TuHJ36sop1OiP294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=UNXpSoNS; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="UNXpSoNS"
Received: by chaosmail.tech (Postfix) id 380511CC432;
	Sat, 10 Oct 2026 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1791625087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+i8jj6tU7F1dTxMjkSb99DZsj1EQHuVerOhJXvzw0Kk=;
	b=UNXpSoNS3kYt1v7q/rUs0wJSUwa//jVLBjOLFUaQp6shPf+q+mWTIo4Ia5KvMjyg+F0I3L
	+2JDxPKmj6z508bTqDDmU1gOZXtALwgWqvMpQ0MFm2vqI13ziPSjimtE7ICVKJOmbYfw5P
	5j/Owy07B801gwzud3O6McIupdLnCjE=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 10 Oct 2026 11:37:57 +0200
Subject: [PATCH RESEND v7 3/3] usb: typec: tipd: Add sn201202x support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tipd-ace3-v7-3-317218a96c01@chaosmail.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791625084; l=12928;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=yPz47tnDJi1ALuWLSFDoLVUVJrO3KpWOWApIMMI5dtg=;
 b=h39vnqPyoqXqOIpKMzm+778WE6jP3PlCOMk9jV+1Tp7eKND/820m8HlhETZUg7nlIBUKIeuJn
 /+XghWz4yNADAc7Szc/WXWe/J9MWnP/A6ZFvtIuuPuf8IT6Vnip6amx
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Co-developed-by: Alyssa Milburn <amilburn@zall.org>
Signed-off-by: Alyssa Milburn <amilburn@zall.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 MAINTAINERS                       |   1 +
 drivers/usb/typec/Makefile        |   1 +
 drivers/usb/typec/tipd/Kconfig    |  12 ++++++
 drivers/usb/typec/tipd/Makefile   |   3 ++
 drivers/usb/typec/tipd/core.c     |  21 ++++++++++
 drivers/usb/typec/tipd/spmi.c     | 300 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h |   9 +++++
 7 files changed, 347 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba4274ed9c79..5e631428a6c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2690,6 +2690,7 @@ F:	drivers/soc/apple/*
 F:	drivers/spi/spi-apple.c
 F:	drivers/spmi/spmi-apple-controller.c
 F:	drivers/usb/dwc3/dwc3-apple.c
+F:	drivers/usb/typec/tipd/spmi.c
 F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 8a6a1c663eb6..80d6767667a7 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
+obj-$(CONFIG_TYPEC_SN201202X)	+= tipd/
 obj-$(CONFIG_TYPEC_ANX7411)	+= anx7411.o
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kconfig
index c87cbe6109ca..8177f860f89d 100644
--- a/drivers/usb/typec/tipd/Kconfig
+++ b/drivers/usb/typec/tipd/Kconfig
@@ -14,3 +14,15 @@ config TYPEC_TPS6598X
 
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called tps6598x.ko.
+
+config TYPEC_SN201202X
+	tristate "TI SN201202x USB Power Delivery controller support"
+	depends on SPMI
+	select TYPEC_TPS6598X_CORE
+	help
+	  Say Y here to enable support for SN201202x, a TPS6598x variant
+	  that uses SPMI as a host bus, and is found on Apple devices starting
+	  from the M3 series.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called sn201202x.ko.
diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
index c741bf44f52f..6f5ebc1e1a5f 100644
--- a/drivers/usb/typec/tipd/Makefile
+++ b/drivers/usb/typec/tipd/Makefile
@@ -7,3 +7,6 @@ tps6598x-core-$(CONFIG_TRACING)		+= trace.o
 
 obj-$(CONFIG_TYPEC_TPS6598X)		+= tps6598x.o
 tps6598x-y				:= i2c.o
+
+obj-$(CONFIG_TYPEC_SN201202X)		+= sn201202x.o
+sn201202x-y				:= spmi.o
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index bdcc6f75d93f..82145c9f1cc8 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1962,11 +1962,32 @@ static const struct tipd_data tipd_tps25750_data = {
 	.connect = tps6598x_connect,
 };
 
+static const struct tipd_data tipd_sn201202x_data = {
+	.irq_handler = cd321x_interrupt,
+	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct sn201202x),
+	.remove = cd321x_remove,
+	.register_port = cd321x_register_port,
+	.unregister_port = cd321x_unregister_port,
+	.trace_data_status = trace_cd321x_data_status,
+	.trace_power_status = trace_tps6598x_power_status,
+	.trace_status = trace_tps6598x_status,
+	.init = cd321x_init,
+	.read_data_status = cd321x_read_data_status,
+	.read_power_status = tps6598x_read_power_status,
+	.reset = cd321x_reset,
+	.switch_power_state = cd321x_switch_power_state,
+	.connect = cd321x_connect,
+};
+
 const struct tipd_data *tipd_hw_variants[] = {
 	[TIPD_VARIANT_CD321X] = &tipd_cd321x_data,
 	[TIPD_VARIANT_TPS6598X] = &tipd_tps6598x_data,
 	[TIPD_VARIANT_TPS66993] = &tipd_tps66993_data,
 	[TIPD_VARIANT_TPS25750] = &tipd_tps25750_data,
+	[TIPD_VARIANT_SN201202X] = &tipd_sn201202x_data,
 };
 EXPORT_SYMBOL_GPL(tipd_hw_variants);
 
diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
new file mode 100644
index 000000000000..a165ec39a8ed
--- /dev/null
+++ b/drivers/usb/typec/tipd/spmi.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/interrupt.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+#include <linux/spmi.h>
+
+#include "tps6598x.h"
+
+#define tps_to_sn(tps) container_of_const((tps), struct sn201202x, cd.tps)
+
+static int regmap_sn201202x_select_reg(struct spmi_device *sdev, u8 reg)
+{
+	int err;
+	u8 val;
+	bool warned = false;
+	int attempts = 5;
+	struct tps6598x *tps = spmi_device_get_drvdata(sdev);
+	struct sn201202x *sn = tps_to_sn(tps);
+
+	if (reg >= 0x80) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+	reinit_completion(&sn->select_completion);
+	err = spmi_register_zero_write(sdev, reg);
+	if (err)
+		return err;
+
+	if (!wait_for_completion_timeout(&sn->select_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	while (--attempts) {
+		err = spmi_register_read(sdev, 0, &val);
+		if (err)
+			return err;
+		if (val == (reg | 0x80)) {
+			if (!warned) {
+				dev_warn(tps->dev,
+					 "Got interrupt but selection not complete?\n");
+				warned = true;
+			}
+			msleep(20);
+			continue;
+		}
+		if (val == reg)
+			return 0;
+		return -EIO;
+	}
+
+	return -EIO;
+}
+
+static int regmap_sn201202x_read(void *context,
+				 const void *reg, size_t reg_size,
+				 void *val, size_t val_size)
+{
+	int err;
+	unsigned int offset = 0x20;
+	size_t len;
+	u8 addr;
+
+	if (reg_size != 1) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+	if (val_size > 0x40) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	addr = *(u8 *)reg;
+
+	err = regmap_sn201202x_select_reg(context, addr);
+	if (err)
+		return err;
+
+	while (val_size) {
+		len = min_t(size_t, val_size, 16);
+		err = spmi_ext_register_read(context, offset, val, len);
+		if (err)
+			return err;
+		offset += len;
+		val += len;
+		val_size -= len;
+	}
+
+	return 0;
+}
+
+static int regmap_sn201202x_write(void *context, const void *data,
+				  size_t count)
+{
+	int err = 0;
+	unsigned int offset = 0xa0;
+	size_t len;
+	u8 addr;
+
+	if (count < 1) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	addr = *(u8 *)data;
+	data += 1;
+	count -= 1;
+
+	if (count > 0x40) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	err = regmap_sn201202x_select_reg(context, addr);
+	if (err)
+		return err;
+
+	while (count) {
+		len = min_t(size_t, count, 16);
+		err = spmi_ext_register_write(context, offset, data, len);
+		if (err)
+			return err;
+		offset += len;
+		data += len;
+		count -= len;
+	}
+
+	return err;
+}
+
+static irqreturn_t sn201202x_irq(int irq, void *data)
+{
+	struct completion *c = data;
+
+	complete(c);
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_bus regmap_sn201202x = {
+	.read				= regmap_sn201202x_read,
+	.write				= regmap_sn201202x_write,
+	.reg_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+	.val_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+};
+
+static struct regmap *__devm_regmap_init_sn201202x(struct spmi_device *sdev,
+						   const struct regmap_config *config,
+						   struct lock_class_key *lock_key,
+						   const char *lock_name)
+{
+	return __devm_regmap_init(&sdev->dev, &regmap_sn201202x, sdev, config,
+				  lock_key, lock_name);
+}
+
+#define devm_regmap_init_sn201202x(dev, config)				\
+	__regmap_lockdep_wrapper(__devm_regmap_init_sn201202x, #config,	\
+				dev, config)
+
+static const struct of_device_id sn201202x_of_match[] = {
+	{ .compatible = "apple,sn201202x", (void *)TIPD_VARIANT_SN201202X},
+	{}
+};
+
+static int sn201202x_probe(struct spmi_device *device)
+{
+	const struct of_device_id *match;
+	const struct tipd_data *data;
+	struct sn201202x *sn;
+	struct tps6598x *tps;
+	int irq_select, irq_sleep, irq_wake;
+	int ret;
+
+	match = of_match_device(sn201202x_of_match, &device->dev);
+	if (!match)
+		return -EINVAL;
+	data = tipd_hw_variants[(enum tipd_hw_variant)(uintptr_t)match->data];
+
+	sn = devm_kzalloc(&device->dev, data->tps_struct_size, GFP_KERNEL);
+	if (!sn)
+		return -ENOMEM;
+	sn->sdev = device;
+	tps = &sn->cd.tps;
+
+	mutex_init(&tps->lock);
+	tps->dev = &device->dev;
+	tps->data = data;
+
+	tps->irq = of_irq_get_byname(device->dev.of_node, "irq");
+	if (tps->irq < 0)
+		return tps->irq;
+	irq_select = of_irq_get_byname(device->dev.of_node, "select");
+	if (irq_select < 0)
+		return irq_select;
+	irq_sleep = of_irq_get_byname(device->dev.of_node, "sleep");
+	if (irq_sleep < 0)
+		return irq_sleep;
+	irq_wake = of_irq_get_byname(device->dev.of_node, "wake");
+	if (irq_wake < 0)
+		return irq_wake;
+
+	init_completion(&sn->select_completion);
+	init_completion(&sn->sleep_completion);
+	init_completion(&sn->wake_completion);
+
+	ret = devm_request_irq(&device->dev, irq_select, sn201202x_irq,
+			       0, NULL, &sn->select_completion);
+	if (ret)
+		return ret;
+	ret = devm_request_irq(&device->dev, irq_sleep, sn201202x_irq,
+			       0, NULL, &sn->sleep_completion);
+	if (ret)
+		return ret;
+	ret = devm_request_irq(&device->dev, irq_wake, sn201202x_irq,
+			       0, NULL, &sn->wake_completion);
+	if (ret)
+		return ret;
+
+	spmi_device_set_drvdata(device, tps);
+	tps->regmap = devm_regmap_init_sn201202x(device, &tps6598x_regmap_config);
+	if (IS_ERR(tps->regmap))
+		return PTR_ERR(tps->regmap);
+
+	ret = spmi_command_wakeup(device);
+	if (ret)
+		return ret;
+	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	ret = tipd_init(tps);
+	if (ret)
+		spmi_command_sleep(device);
+	return ret;
+}
+
+static void sn201202x_remove(struct spmi_device *device)
+{
+	struct tps6598x *tps = spmi_device_get_drvdata(device);
+	struct sn201202x *sn = tps_to_sn(tps);
+
+	tipd_remove(tps);
+	spmi_command_sleep(sn->sdev);
+}
+
+static int __maybe_unused sn201202x_resume(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+	struct sn201202x *sn = tps_to_sn(tps);
+	int err;
+
+	reinit_completion(&sn->wake_completion);
+	err = spmi_command_wakeup(sn->sdev);
+	if (err)
+		return err;
+	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+	return tipd_resume(tps);
+}
+
+static int __maybe_unused sn201202x_suspend(struct device *dev)
+{
+	struct tps6598x *tps = dev_get_drvdata(dev);
+	struct sn201202x *sn = tps_to_sn(tps);
+	int err;
+
+	err = tipd_suspend(tps);
+	if (err)
+		return err;
+	reinit_completion(&sn->sleep_completion);
+	err = spmi_command_sleep(sn->sdev);
+	if (err)
+		goto out_resume;
+	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffies(100)))
+		dev_err(dev, "Waiting for sleep complete irq timed out");
+
+	return 0;
+
+out_resume:
+	tipd_resume(tps);
+	return err;
+}
+
+MODULE_DEVICE_TABLE(of, sn201202x_of_match);
+
+static const struct dev_pm_ops sn201202x_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sn201202x_suspend, sn201202x_resume)
+};
+
+static struct spmi_driver sn201202x_driver = {
+	.driver = {
+		.name = "sn201202x",
+		.pm = &sn201202x_pm_ops,
+		.of_match_table = sn201202x_of_match,
+	},
+	.probe = sn201202x_probe,
+	.remove = sn201202x_remove,
+};
+module_spmi_driver(sn201202x_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI SN201202x USB Power Delivery Controller Driver");
diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 5af575d18354..a411392deb39 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -283,6 +283,7 @@ enum tipd_hw_variant {
 	TIPD_VARIANT_TPS6598X,
 	TIPD_VARIANT_TPS66993,
 	TIPD_VARIANT_TPS25750,
+	TIPD_VARIANT_SN201202X,
 	TIPD_VARIANT_MAX,
 };
 
@@ -388,6 +389,14 @@ struct cd321x {
 	struct usb_pd_identity cur_partner_identity;
 };
 
+struct sn201202x {
+	struct cd321x cd;
+	struct completion select_completion;
+	struct completion sleep_completion;
+	struct completion wake_completion;
+	struct spmi_device *sdev;
+};
+
 extern const struct tipd_data *tipd_hw_variants[];
 extern const struct regmap_config tps6598x_regmap_config;
 

-- 
2.56.0

