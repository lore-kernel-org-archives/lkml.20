Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852503;
	b=p0W1TXj4mQlIkzlsi1/lKMPoYfCZl4o1a+5Qgoz9CdMz4+bkKeXUA1Xd3O/1q4Q0lDdU
	 XGefMwvV9ZmebCVbWSKe3dCKdcRXS8oPtZ7BSddzyhH6MkDxY67K9crBR6b7XerMyLPvC
	 fOx9LncAd0brsBR/hd3XPv62Aio3S6vkHUTn7VCsr0GFSMiuvg0Xiwuv0FTENhYEV9dSJ
	 sQkMcwVc/HyDV1Cka/mtU2qQbnxDLxKpmzijuM0r3fw6vN0xI85yWaLgnTp5/6/5nptD3
	 95uDgjzIcJpUL39ERlDjd/hHOzQ3Asqz0Ixgbno2n/MntC0WT4oeITFYQUfeMC1tdEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
	b=TkuR1zwEPL6lIHEBpNIJbZaqMLjiUpecNja1EMVEXdXqrfjapWaNBTQnTPq19UluPmMq
	 Xu9m3wjr1qMLeGfq9/Ij6Tue2hS+KMiZgl1hMtr5gUnC6Ue9QbEZdX94Dk7EXfg8xUXHt
	 tOQJW1Frbb9P6b7nTSYQ4UywVscvzsAuZBSP6dDKipB4OWDjy6S2v63ZXgNeoX8M5IdFa
	 q8XEmZw+qxDNRHTEsA/8hwS/jKpq5N/lcD8QtAmwaOAejmQOTtWaIZqRwCQ+F/K7ZSRuh
	 MkeMU9aSLZAwzoexMjCOiUeetLm+7yaBYYPyq4N1FW6rAG/PutDmNdTJ2Aavoc+8vdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opvy84eW;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095D606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8095D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opvy84eW
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1909679f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852501; x=1795457301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
        b=opvy84eWgM09ln+Ti/gMANDD6ipJROun+dkh7c/5GC/3H4VxqGtFQu4qPioAheU+Te
         CeR3uV4cvQb2EWNeFzaBDvVQ0AfX/vjjE5gOyOfbUVXBUw+3klb6bUuJI4YJA0ngGjPC
         FSBuizks6p4m7kv8DKGpZ2gSQYQeelqRu+6Y9V7oulQ4S0hqm7OKhhAUtDYAVd9eExim
         NUAf6fngUqnC5MvZFOW1uwELcOyxoTJi+HiLbU91GVZRcZpwjOsuyNLQezc6my5cUipe
         JGZp+KapWQzMdEvCPr/A10EgYFdedZvZJX+YEgFRf2QxealoI9ENFuWfzKYrpH6z8iU7
         gosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852501; x=1795457301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t92aTLgSQFgAtbZh31ucXDF90ij9OtvpoozTmZs6UUA=;
        b=C0H960Ng7ir6kxgoda3hqjonykEBR0K+HCsIg0xsvX5nbmhv11T3t1dXDUy5n5ppRO
         vt6hqdSgLaGGiDRD9Oy6OyRWZr88vUxSAA1mxYZuPACbW21lAOLk8RtLN4k8YVNz8WJI
         RR9z/yuO6NfOBaLecurgOvz4s/ATFktrWFXAFkx4m4kmHH46qtvlKdAvT48DQsGnUqaX
         FWSKwlbLXeG7qICqOeo9kuD0HXzoxmx+OLCtU5+XXLAVQvnGRXqQBB2bIaBerE6+q0Kn
         9iLSavH8Qux0Hf2x8oEEBeiwNsHMPdsse5RNXZuERAaG20sdMG5S+eP2ycV2LsBl0Irp
         zdgQ==
X-Forwarded-Encrypted: i=1; AL+hErFnEODT0UzBmI0T+RikZ4s9lylLkhSnHRATbo5mCmW1wDTAQGk04u+85BG0k3YMJseb3fgKdtNSv+ET5Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EIY4RIse4GQeDnYYzi4xtvz4ESSnR6kDYEk4D7E/hc8KZsjWm
	BJb5tIeSQBIh+cC6DkGljpkR7q6L6ITMhF1dQS9LGKMMIjB1Kjz/dP4Y
X-Gm-Gg: AZFdTZd/EnE0HW+BB1rWdnAgRhCGqCYNzVn1y/+nXCg5plg5VuCKJz1IGVkAN7FDWFO
	DTZ8xi46G4Adjj8uybevLA144tvG4iMgHxxE8OLd7SPRpzGpXUU1cfdNnwdBhMHsp9l8cNDJGy6
	dVUdPT8wL5k23GKQ5fdGjQrC9CzL/2DbNB+/BZKr6cB1XTL3tvJV8R/lC1nB45Ev1u7nR4Ud88z
	ZInpm5O6QxM82Np3vCbs28LCZx9M08Cek52QQ3uf6hqZd9Qir4Y1/rUm98yYH9sTLjusjSb8W5/
	BeMOJA+73G312uVxVxayUBuk9dhfsWmXpHKnJDD4c05Q1ZkI4dIwoWXPPaLaJ7dwKRpmd/c6/e3
	WGJ5whJ4j5jHtinjOrVF3CSh6YbwtG4uj9EdwN6fpqmhyUCaQ0w/UqXHNsvuXvtTzwUsaCZNeHP
	Yqj/k7HtOTPLfp3vsSB+m6XtQwUtBNYQbujPapFQ9NA2bNNrd84zAaTAixGXcWI9fKtHYyBN0bI
	P52shENOgRiJPdYf0zcm3341fWbVK94yMZP0szNKgC9oEAX/q4SVyU8rymfPmYx7HYzzNQ98UUy
	WLQWvnv+PlVy93Eg38bcfE02LazfzmtVsxGkBeofK6KXeg==
X-Received: by 2002:a05:6000:1626:b0:498:be72:6365 with SMTP id ffacd0b85a97d-49c73164876mr17893053f8f.16.1794852500691;
        Mon, 16 Nov 2026 10:08:20 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm39025291f8f.44.2026.11.16.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:08:20 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] leds: flash: Add driver for the TI LM3554
Date: Mon, 16 Nov 2026 18:08:09 +0000
Message-ID: <20261116180809.26946-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Texas Instruments LM3554 is a flash LED driver with two current
sources for a flash LED, used together, and an indicator LED output,
controlled over I2C. It is used for the rear camera flash of the Lenovo
ThinkPad 10 (20C1/20C3), where the firmware describes it as ACPI device
INTCF1C, at I2C address 0x53, with the STROBE, TORCH and HWEN GPIOs
listed in that order and without names.

An atomisp specific driver for the LM3554 was removed in commit
f1aa35ab5943 ("media: atomisp: Drop the atomisp custom lm3554 flash
driver"), which suggested re-implementing it with the LED flash class
API if needed. This is such a driver, written from the datasheet and
using the removed driver as a reference for the ACPI GPIO order.

The driver controls the LED over I2C only and keeps the STROBE and TORCH
inputs low. It registers a flash LED class device with 8 torch levels
(34 to 295 mA), a flash current of 71 to 1037 mA and a flash timeout of
32 to 512 ms. The chip allows up to 1191 mA and 1024 ms, but the
firmware does not describe the LED's ratings, so the flash current and
timeout are limited to the chip's power-on defaults. Faults are read
from the flags register. The indicator output is not supported, it is
not connected on the ThinkPad 10.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795), with the driver and
led-class-flash built out of tree against a 7.2.15 kernel: torch at
levels 1 and 8, flash at 71 mA / 256 ms (the flash ends by itself and
the timeout fault is reported) and at 365 mA / 96 ms, s2idle suspend and
resume with the torch on (the LED is off while suspended and on again
after resume) and off, and unloading. This was also build-tested with
W=1 on top of for-leds-next and media.git next.

The driver was written with the help of an AI coding assistant (Claude);
the testing was done on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 MAINTAINERS                      |   6 +
 drivers/leds/flash/Kconfig       |  12 ++
 drivers/leds/flash/Makefile      |   1 +
 drivers/leds/flash/leds-lm3554.c | 337 +++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+)
 create mode 100644 drivers/leds/flash/leds-lm3554.c

diff --git a/MAINTAINERS b/MAINTAINERS
index af302622c..6382ea861 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27685,6 +27685,12 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 X:	drivers/dma/ti/cppi41.c
 
+TEXAS INSTRUMENTS LM3554 FLASH LED DRIVER
+M:	Volodymyr Chapman <volodymyrchapman@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/flash/leds-lm3554.c
+
 TEXAS INSTRUMENTS TPS25990 HARDWARE MONITOR DRIVER
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 9b6dd3f1f..bfc1f8888 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -31,6 +31,18 @@ config LEDS_KTD2692
 
 	  Say Y to enable this driver.
 
+config LEDS_LM3554
+	tristate "LED support for the TI LM3554 flash LED driver"
+	depends on ACPI && I2C && GPIOLIB
+	select REGMAP_I2C
+	help
+	  This option enables support for the Texas Instruments LM3554
+	  flash LED driver, as used for the rear camera flash of the
+	  Lenovo ThinkPad 10 (20C1/20C3).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-lm3554.
+
 config LEDS_LM3601X
 	tristate "LED support for LM3601x Chips"
 	depends on LEDS_CLASS && I2C
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 44e6c1b4b..90afe6583 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_LEDS_MT6370_FLASH)	+= leds-mt6370-flash.o
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
 obj-$(CONFIG_LEDS_KTD2692)	+= leds-ktd2692.o
+obj-$(CONFIG_LEDS_LM3554)	+= leds-lm3554.o
 obj-$(CONFIG_LEDS_LM3601X)	+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
diff --git a/drivers/leds/flash/leds-lm3554.c b/drivers/leds/flash/leds-lm3554.c
new file mode 100644
index 000000000..70c526df3
--- /dev/null
+++ b/drivers/leds/flash/leds-lm3554.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Texas Instruments LM3554 flash LED driver
+ *
+ * The LM3554 drives a flash LED through two current sources (LED1, LED2),
+ * which are used together, and an indicator LED (LEDI). It is used e.g. for
+ * the rear camera flash of the Lenovo ThinkPad 10 (20C1/20C3), where the
+ * firmware describes it as ACPI device INTCF1C.
+ *
+ * Copyright (C) 2026 Volodymyr Chapman <volodymyrchapman@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/led-class-flash.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#define LM3554_REG_TORCH		0xa0
+#define   LM3554_TORCH_CURRENT		GENMASK(5, 3)
+#define LM3554_REG_FLASH		0xb0
+#define   LM3554_FLASH_CURRENT		GENMASK(6, 3)
+/* Bits [2:0] of the torch and flash registers are shared */
+#define   LM3554_MODE			GENMASK(2, 0)
+#define   LM3554_MODE_SHUTDOWN		0
+#define   LM3554_MODE_TORCH		2
+#define   LM3554_MODE_FLASH		3
+#define LM3554_REG_DURATION		0xc0
+#define   LM3554_TIMEOUT		GENMASK(4, 0)
+#define LM3554_REG_FLAGS		0xd0
+#define   LM3554_FLAG_TIMEOUT		BIT(0)
+#define   LM3554_FLAG_THERMAL_SHUTDOWN	BIT(1)
+#define   LM3554_FLAG_LED_FAULT		BIT(2)
+#define   LM3554_FLAG_LED_THERMAL	BIT(5)
+#define   LM3554_FLAG_VIN_MONITOR	BIT(7)
+#define LM3554_REG_CONFIG1		0xe0
+#define LM3554_REG_CONFIG2		0xf0
+
+#define LM3554_TIMEOUT_STEP_US		32000
+#define LM3554_TIMEOUT_MIN_US		32000
+/* Power-on default, the chip allows up to 1024 ms */
+#define LM3554_TIMEOUT_MAX_US		512000
+
+/*
+ * 8 torch current settings, LED1 + LED2 together: 34, 71, 108, 146, 180, 218,
+ * 256 and 295 mA.
+ */
+#define LM3554_TORCH_LEVELS		8
+
+/* Total of LED1 + LED2, for the 16 flash current settings */
+static const u32 lm3554_flash_ua[] = {
+	71000, 146000, 218000, 295000, 365000, 441000, 518000, 596000,
+	652000, 729000, 805000, 881000, 960000, 1037000, 1113000, 1191000,
+};
+
+/* Power-on default (13), the chip allows up to 1191 mA */
+#define LM3554_FLASH_MAX_UA		1037000
+
+struct lm3554 {
+	struct led_classdev_flash fled_cdev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	/* Serialises register access between the LED and flash callbacks */
+	struct mutex lock;
+};
+
+static struct lm3554 *fled_cdev_to_lm3554(struct led_classdev_flash *fled_cdev)
+{
+	return container_of(fled_cdev, struct lm3554, fled_cdev);
+}
+
+static bool lm3554_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* The mode bits clear themselves when a flash times out */
+	return reg == LM3554_REG_TORCH || reg == LM3554_REG_FLASH ||
+	       reg == LM3554_REG_FLAGS;
+}
+
+static const struct regmap_config lm3554_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LM3554_REG_CONFIG2,
+	.volatile_reg = lm3554_volatile_reg,
+};
+
+static int lm3554_set_mode(struct lm3554 *lm3554, unsigned int mode)
+{
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_TORCH,
+				  LM3554_MODE, mode);
+}
+
+static int lm3554_brightness_set(struct led_classdev *led_cdev,
+				 enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	if (brightness == LED_OFF)
+		return lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+
+	ret = regmap_update_bits(lm3554->regmap, LM3554_REG_TORCH,
+				 LM3554_TORCH_CURRENT,
+				 FIELD_PREP(LM3554_TORCH_CURRENT, brightness - 1));
+	if (ret)
+		return ret;
+
+	return lm3554_set_mode(lm3554, LM3554_MODE_TORCH);
+}
+
+static int lm3554_flash_brightness_set(struct led_classdev_flash *fled_cdev,
+				       u32 brightness)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int i;
+
+	/* Use the highest setting which does not exceed the requested current */
+	for (i = ARRAY_SIZE(lm3554_flash_ua) - 1; i > 0; i--)
+		if (lm3554_flash_ua[i] <= brightness)
+			break;
+
+	guard(mutex)(&lm3554->lock);
+
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_FLASH,
+				  LM3554_FLASH_CURRENT,
+				  FIELD_PREP(LM3554_FLASH_CURRENT, i));
+}
+
+static int lm3554_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+
+	guard(mutex)(&lm3554->lock);
+
+	return regmap_update_bits(lm3554->regmap, LM3554_REG_DURATION,
+				  LM3554_TIMEOUT,
+				  FIELD_PREP(LM3554_TIMEOUT,
+					     timeout / LM3554_TIMEOUT_STEP_US - 1));
+}
+
+static int lm3554_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int flags;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	if (!state)
+		return lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+
+	/* Clear old flags, the timeout flag would otherwise stay set */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &flags);
+	if (ret)
+		return ret;
+
+	return lm3554_set_mode(lm3554, LM3554_MODE_FLASH);
+}
+
+static int lm3554_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int val;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	ret = regmap_read(lm3554->regmap, LM3554_REG_TORCH, &val);
+	if (ret)
+		return ret;
+
+	*state = FIELD_GET(LM3554_MODE, val) == LM3554_MODE_FLASH;
+
+	return 0;
+}
+
+static int lm3554_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
+{
+	struct lm3554 *lm3554 = fled_cdev_to_lm3554(fled_cdev);
+	unsigned int flags;
+	int ret;
+
+	guard(mutex)(&lm3554->lock);
+
+	/* Reading the flags register clears it */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &flags);
+	if (ret)
+		return ret;
+
+	*fault = 0;
+	if (flags & LM3554_FLAG_TIMEOUT)
+		*fault |= LED_FAULT_TIMEOUT;
+	if (flags & LM3554_FLAG_THERMAL_SHUTDOWN)
+		*fault |= LED_FAULT_OVER_TEMPERATURE;
+	if (flags & LM3554_FLAG_LED_FAULT)
+		*fault |= LED_FAULT_SHORT_CIRCUIT;
+	if (flags & LM3554_FLAG_LED_THERMAL)
+		*fault |= LED_FAULT_LED_OVER_TEMPERATURE;
+	if (flags & LM3554_FLAG_VIN_MONITOR)
+		*fault |= LED_FAULT_INPUT_VOLTAGE;
+
+	return 0;
+}
+
+static const struct led_flash_ops lm3554_flash_ops = {
+	.flash_brightness_set	= lm3554_flash_brightness_set,
+	.strobe_set		= lm3554_strobe_set,
+	.strobe_get		= lm3554_strobe_get,
+	.timeout_set		= lm3554_timeout_set,
+	.fault_get		= lm3554_fault_get,
+};
+
+/*
+ * The ACPI resources list the STROBE, TORCH and HWEN (enable) GPIOs in this
+ * order, without names.
+ */
+static const struct acpi_gpio_params lm3554_strobe_gpio = { 0, 0, false };
+static const struct acpi_gpio_params lm3554_torch_gpio = { 1, 0, false };
+static const struct acpi_gpio_params lm3554_enable_gpio = { 2, 0, false };
+
+static const struct acpi_gpio_mapping lm3554_acpi_gpios[] = {
+	{ "strobe-gpios", &lm3554_strobe_gpio, 1 },
+	{ "torch-gpios", &lm3554_torch_gpio, 1 },
+	{ "enable-gpios", &lm3554_enable_gpio, 1 },
+	{ }
+};
+
+static void lm3554_power_off(void *data)
+{
+	struct lm3554 *lm3554 = data;
+
+	lm3554_set_mode(lm3554, LM3554_MODE_SHUTDOWN);
+	gpiod_set_value_cansleep(lm3554->enable_gpio, 0);
+}
+
+static int lm3554_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct led_flash_setting *setting;
+	struct led_classdev *led_cdev;
+	struct gpio_desc *gpio;
+	struct lm3554 *lm3554;
+	unsigned int val;
+	int ret;
+
+	lm3554 = devm_kzalloc(dev, sizeof(*lm3554), GFP_KERNEL);
+	if (!lm3554)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &lm3554->lock);
+	if (ret)
+		return ret;
+
+	ret = devm_acpi_dev_add_driver_gpios(dev, lm3554_acpi_gpios);
+	if (ret)
+		return ret;
+
+	/*
+	 * This driver only controls the LED over I2C. Keep the STROBE and
+	 * TORCH inputs low so that they do not turn on the LED.
+	 */
+	gpio = devm_gpiod_get_optional(dev, "strobe", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting strobe GPIO\n");
+
+	gpio = devm_gpiod_get_optional(dev, "torch", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting torch GPIO\n");
+
+	lm3554->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(lm3554->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(lm3554->enable_gpio),
+				     "getting enable GPIO\n");
+
+	lm3554->regmap = devm_regmap_init_i2c(client, &lm3554_regmap_config);
+	if (IS_ERR(lm3554->regmap))
+		return PTR_ERR(lm3554->regmap);
+
+	ret = devm_add_action_or_reset(dev, lm3554_power_off, lm3554);
+	if (ret)
+		return ret;
+
+	/* Check that the chip is there, this also clears its flags */
+	ret = regmap_read(lm3554->regmap, LM3554_REG_FLAGS, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "reading flags register\n");
+
+	lm3554->fled_cdev.ops = &lm3554_flash_ops;
+
+	setting = &lm3554->fled_cdev.timeout;
+	setting->min = LM3554_TIMEOUT_MIN_US;
+	setting->max = LM3554_TIMEOUT_MAX_US;
+	setting->step = LM3554_TIMEOUT_STEP_US;
+	setting->val = LM3554_TIMEOUT_MAX_US;
+
+	setting = &lm3554->fled_cdev.brightness;
+	setting->min = lm3554_flash_ua[0];
+	setting->max = LM3554_FLASH_MAX_UA;
+	setting->step = 1;
+	setting->val = LM3554_FLASH_MAX_UA;
+
+	led_cdev = &lm3554->fled_cdev.led_cdev;
+	led_cdev->name = "white:" LED_FUNCTION_FLASH;
+	led_cdev->max_brightness = LM3554_TORCH_LEVELS;
+	led_cdev->brightness_set_blocking = lm3554_brightness_set;
+	led_cdev->flags |= LED_DEV_CAP_FLASH | LED_CORE_SUSPENDRESUME;
+
+	return devm_led_classdev_flash_register(dev, &lm3554->fled_cdev);
+}
+
+static const struct acpi_device_id lm3554_acpi_match[] = {
+	{ "INTCF1C" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, lm3554_acpi_match);
+
+static struct i2c_driver lm3554_driver = {
+	.driver = {
+		.name = "leds-lm3554",
+		.acpi_match_table = lm3554_acpi_match,
+	},
+	.probe = lm3554_probe,
+};
+module_i2c_driver(lm3554_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LM3554 flash LED driver");
+MODULE_AUTHOR("Volodymyr Chapman <volodymyrchapman@gmail.com>");
+MODULE_LICENSE("GPL");

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

