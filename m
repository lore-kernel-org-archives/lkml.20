Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D4541E6A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082838; cv=none; b=dIMXJXstHONYgQSZg5wkfIfv7Mcup8BFT2O4wCYNV0z68/BahnM4m1neYPFCc7zbBRVMaJXd1wfF/sXY12PSH/1G9NDquYYMSOjWY/cuBTNaRCTTNC4DpFwZkhE7wx1t0h5avjM1/LtRzClj5SYDVCr5TSgJEfYhZiFp3rcBDRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082838; c=relaxed/simple;
	bh=UVkLFT/iCNBYM+zZuBoiPE7e9ayV+mTZppqPDWCEcbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Po1nqUBKpBd+ACis1Xce/4TzU4UpEwk/6zhIqW21jP4foJbfeq+/8K/Yi/cChrYyw5F/8SfavyC14GAV1MitSh5uupXRPpLN5Ay8vs7zVzq8wInrYw8BmMH0nciwTSIv2sJL8XAzzVeo1BpwqZwF6fj8ruTxz6Sf6KllHSeZ25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYQuOaLl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYQuOaLl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c02782159so3413186f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082822; x=1792687622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=SYQuOaLlfUmFTCD4uugosnodqNXtl+YIVPvZKu/nXXDfkKXwZ1R7cKtALyhtBqbRzQ
         GPfShfuUdc57OxnSL7Z8RiNP/3y8Nf/G2qJs4ZSrwqFXzBkreTGqo0Ze+nOTa8sDfu6K
         e8mn9PuKpIPqEooUjnMlwftkdn3+efAOfBpHdExFZj0pI9N1NbkLikvnBXJoAZ3+Rjzr
         EXYgpDbQ4/2X44/8QEaqfLRhguMeHpXjf19iH9m6/1mf+NKxk8pxtT+b4nemtldoXDEA
         acQUzF7JFwwLVWqV7LasPzBZYu2B7bSChnydVhlXwJO1k19RGfF1/sez+0p3Q4qZurpz
         bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082822; x=1792687622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=y9+PloCLizVbxa7WN7pY93Vx6doVY1KFIzRTjetBVGHgVg+G1r68hldEjtKjmbo1Rv
         Vy/vsOIggvr4mor+gn1S0d5FFeqXnrj+485VhS4qjcyCWMp9/84ooufIKrE5eug+qwjR
         roAXaeFksHfcoBssWDHqU9N8wIcNqF7r9GCvEZT1V90qwL/jye5g3QS+ApUpByqQRWVH
         wAcOcU1QhBoofzwTEL2dkygslFWp/PCHhjj+EktZvXDd4qJBt9GpEEDGOvU8nV4/kBfV
         9CfDZKC/YHb2UY3+PxgiQCaiMWS3FjmGZbW3DbkSiOAxE1imvZBO6xNo3yL9F/L/Yf2M
         H2HQ==
X-Gm-Message-State: AFq9FYJ6K6nU4j0cNwHHigdROPq8AGzFdImR+FNlWoN4k8DUd7L4lOr0
	8+UKzymKchm1/5vKXRmvf90Hmp3J0DLFvGjf1TH0dwwCL8yPNzM7Ka0M
X-Gm-Gg: AYBFou0/uGIZvRaIXREHnlbKVHnmZCyf92gTWc2Z2rSnDI240WarCdWOtldIO3Zd+BT
	vIEc7cJHlWyOnVmWzHEN+L+HxCvlmuFXAPPF9/XS0dL3MtRQZ5tF/QAcbEY659UI6AZ/byNP2MV
	jD4O1XDnoT9SEvg3IgVPKx/ILSXlHIG7nlm0dtqsCP4TRDCCCDPOztQ37CUn9Y0proMKJQcM9O4
	Gbe4BVns9dhXdBA3UpNetcD9Ps8C5BajgvLggfyt6uZZlPj+4bb4HOZY2fXqt/Bf6E6PXc0th0O
	wQUuTFeproNziz5hbi6vPklBuj4kFsWmSzfqqhPVP9wIfBv4sfuvuRuiet9ivK2x+oNJMBFrnZn
	ic+h9CspJJCMJ4Ij8k/rTp+oSvavU40m3+gji8RzdGSb9qUgte/VLrCJsw4nmOhnackRXfHngl8
	QO5F5ldTsqqGbLmlvkZhpd6GCJzFO2bS7iYLS534F0f8Tz+5kjXy1kPyL58TSrclYKho4S9/amJ
	ksSaanlyBNqiBxCFLjYjTdfBsgtyA==
X-Received: by 2002:a05:6000:46d9:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48dba784b8dmr26077336f8f.4.1792082822068;
        Thu, 15 Oct 2026 09:47:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72d2b13sm14672251f8f.55.2026.10.15.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:47:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2] leds: Add driver for MAX8907 LED cell
Date: Thu, 15 Oct 2026 19:46:41 +0300
Message-ID: <20261015164641.363500-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
Changes in v2:
- rebased so patch is now applicable to linux/next
---
 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
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
index 0000000000000..358505a1c799f
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
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
+				  LED_ON, brightness_lvl ? LED_ON : LED_OFF);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct max8907_led_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->max8907 = max8907;
+	ddata->regmap = max8907->regmap_gen;
+
+	platform_set_drvdata(pdev, ddata);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+	ddata->cdev.name = dev_name(dev);
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register(dev->parent, &ddata->cdev);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver.name = "max8907-leds",
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 6d5e6a1556fd5..9f737ad7eb398 100644
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

