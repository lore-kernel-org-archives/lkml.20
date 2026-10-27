Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101823;
	b=Cn4uP/J0B3QBHFfvA6d6oAupKf5zO0fLAJcE7d64mEehoKghQ8b81NVyOnMRoMkfVKrO
	 Ju5FSeNT5C69C4TRF0088kwkpxIDwl9WUelytTKS5kXvjaaVmJPLEiuOVa+niAgY7Dgyt
	 XdDF0lvpfCFClbOD4gOiX3NSetwuFOJiOiWNgaU87azDK1iLj/rcAS03ixH74KWpgBQdz
	 BRIrh2S1GqyQyPcgmHW7LLOPu+bpPT8Nbq0BSwtimUlQ3iFp+cpZWdg9HGbRZ6p/oFm5I
	 ogxgH1vkIPmaOkw5ShDBLg6wNX5zHXvztxlhRphDv5r+NKw76f72PvY3XZgrBZtoZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
	b=GL8zuD0Wpd93emu41YKNI/cn69BqsNZO8z0SjDBjXAMXndoGblBQYGtlMRlVu5eSkL4P
	 Ltjd2A6zlycK+iTJqFIoQCkUeIwAjqsB76bb0WSjiXBH1Nd1Lsu9a9mvyHBIlbPsAGqZU
	 TkzjJv3bbTe7PU16l3jGGCClWEgECzRnF5evybf+cyEJwIvjaLfabZfuKYRnckNEhYWAk
	 3tYeu7dxuhfMwY5a5WuS5QRvjYJk9OAk1nraHJFV3owTYGrtXRHZI6PpGhzBuSrTF1Lsk
	 RpN+w5VbGqjZsIOlS9rsiLnBQAYIALoyUt/opfGzzl5XCCeULg/nWJ6buXbPOhqwbkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kXHZsWY+;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD260A2634
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CD260A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kXHZsWY+
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so6661653a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101821; x=1793706621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=kXHZsWY+kj5TIkoh0WfAKdmLDDDygaaLWHTz59vgUxqBU9XqHLGSyEeOBVT0NpCOKY
         6Sl+XY1VOTVXvhH2ASUBjs1oftKHDBzZ/06o91nJDfxTaynx5PfrqLLaSZ7Ckuc71E+H
         4b0VBy+ot0p8pAoqBY8c0D48W9BKo1UaSfVB43SbJD0NNmUH7SGwEkFRJ8oWeDkwaQJ5
         RNfmQ+W1L32TvQ7CaKQG1QgeRM4rnlf3XqT3sTkwQf6mMZ8UWDGYopnQuneWvOxFdYok
         bM0htyZZ3hia2laFJLaWjLNczXgfVpJDN0BX7rVIbnpK++/vDoQYdtlob+FI2NUSv5g3
         sTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101821; x=1793706621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=hhUWYee+qnWKmnLSyhGizCT8tMvJKSjf1Uxud+TcbLgNkWlH2FQsOTGdbCCjCSJLFA
         xyrkJADXTF74ayIPmhX8DKUq4StBQrAm/LbCmGIPZpbVpIKRwhoh2FuSUMh8675PLgrK
         FqF/zFJSOd+GjvnoL0NgT8UiEImLSLCBHliqEVQNRsBL5nORjHLQvUC5Z9V9XyENSRYW
         nH4D/pzHNYoJN5+zgH4ZvBA5CqsZ7Gh8xBjKaMkEjaXhClBrfS/UyAGfrhKV8PITkMw4
         yox9IY9NCGrmxCEvMj6eqcsrZ0WDrEsGI3rmbkZu7tQTbFMShW0qNRkAvFUaBxSJ5uZ3
         nlSA==
X-Gm-Message-State: AFq9FYIvqn0BlRt7cqOvSZlPc6WcLycznOums1kPEtfn8n++7P8Tl7mx
	V5fiTfnA1UId1rMLF6k3PdIGyofoIaMkdVHMJZ4stkOa9WPYUz4K1aL6
X-Gm-Gg: AYBFou0iKuviEXvpFAQoytjL875hu92SKBBeVZb3aGOBPbdt2bvdkrYvgdIIahF4zOs
	0WNW2Ek/4ZnT6zXeo6deCZEY6gnqhldK7+Q9bWGmjavEqhLuVlJH5S/GaQK/CltO/EFqg4KADAm
	UqK8srJCfGEB0oGiZvSMxnyaGuTNINqVYoiOFb/oLW2NZrg05WRKSCmgW86W0f3CP9zSJdoNqB2
	8+hM+dbtHCdQuyLvpMYSqe/vqQtcairmJSwTW+f7vxpOJN5T3HTfD/HrNvR3dwmEu4pltUIlmJt
	W6cGo0xsSZyoRcGka2rTZV0FUG018SGcnIHN94L4tZ54xlk+GZbywcMu180tH9xUuswRii6TttN
	d1jwqyq7CDNcfVnsa9M4fNXU+G9S2cdEChsC6+o+5vCCx+VMF4xuw6gBAeymhEVUKrjIrmsnDvr
	2D5gCtz1glNuznGEmVctXr59/3AwRebHq5Z47iV+Hfg39Lh2feBnaR3sk43ODEJQVTFcH8fxzbY
	d/nVu1ojBGJcWKBaaOpIc3gQonpQlmui9XVKeQahwFC3iILbQh+DmVuBsUmEq/6A+/4onEve/F2
X-Received: by 2002:a05:6402:1945:b0:6b3:f7f6:649e with SMTP id 4fb4d7f45d1cf-6b44311a75emr9097597a12.7.1793101821159;
        Tue, 27 Oct 2026 04:50:21 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4958652a12.19.2026.10.27.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4] leds: Add driver for MAX8907 LED cell
Date: Tue, 27 Oct 2026 13:50:06 +0200
Message-ID: <20261027115006.86032-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS
---
 drivers/leds/Kconfig        |  7 +++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..3796c562919fe 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,13 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 3da746279bb81..24efda3fbaa44 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..a5c445f75d1b1
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
+	struct max8907 *max8907;
+	struct regmap *regmap;
+	struct led_classdev cdev;
+};
+
+static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	unsigned int brightness_lvl;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
+	if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
+		return LED_OFF;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
+	if (ret)
+		return LED_OFF;
+
+	return brightness_lvl;
+}
+
+static int max8907_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	int brightness_lvl, ret;
+
+	brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
+
+	if (brightness_lvl) {
+		ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
+				  MAX8907_REG_WLED_MODE_ON,
+				  brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->max8907 = max8907;
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = dev_fwnode(dev->parent);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver.name = "max8907-leds",
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..35b2ede54f856 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -112,7 +112,7 @@
 #define MAX8907_REG_CHG_IRQ2_MASK	0x81
 #define MAX8907_REG_CHG_STAT		0x82
 #define MAX8907_REG_WLED_MODE_CNTL	0x84
-#define MAX8907_REG_ILED_CNTL		0x84
+#define MAX8907_REG_WLED_CNTL		0x85
 #define MAX8907_REG_II1RR		0x8E
 #define MAX8907_REG_II2RR		0x8F
 #define MAX8907_REG_LDOCTL20		0x9C
-- 
2.53.0

