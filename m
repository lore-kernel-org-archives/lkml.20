Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150861;
	b=y5jU7ZT0HjYRKDTj1jILoVh6j13iwH+RVmB1rPa+1QReRgU7GmaNEML6g45KnHg8TCzz
	 EydWR2Co3Qp0CSK602C9S5SqJ3jI6AY3gLkbrNNj0hIo1OEh9eTVcZdf+avb3a0fZuTL7
	 +fNN6wcLlXi+B2l3tjKYVkp9xvLsFM5tRyvGtm+8DPAKeHnxLU8sWf/3Qja3ftCsPOzrq
	 mtk0/wYA2yAXiGji0jWr/iiZgsT6GsZ3/pICUvtDva0EFeZ0n62vbzyeeeNywKlMAIYDT
	 pKTu5zzb9WtgkyafApUTMkhWKpp14n1XkBTu0TR/5n8ED9Aer6Ww+6yY4JfC44FH5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
	b=bIX10bwjVE+reiyIQzu1SS91dvQjpMAterNXeOJlWGyhmFOuTKNS+18iGzyeCPWrjI34
	 0cYWkFJKFQAxefpI0JYmy1Vntd3pANSBD9O+wpZuyQIbtLKw84m2qqnzsudN17a2EgIEa
	 rR+KMX2NxU3OcihEdRzak5WRluUQzHPcJLH33fLEz8s/ssqyzAskAXAYVIzpBMpLe7f5J
	 ownNyE72Czu9z3kk3MKAKlPkWFOQfdEUyK7D0vspmQxM51cZWDTChpjJiVDvs0iz5H5/q
	 tA5QpgYmOI0mKv7PWavmIWoLhNO3Nkw34jad6skcGXsq0Kvhx4Kg6YdFkBlurP2BVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30104606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30104606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso17209466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150854; x=1794755654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=0jCDCRLMKln027NFtBCDUX9Nk3mKuhWrKQz2oC2tzqubtlZAnb+Ls2YiGiG0EQPSXC
         GK6PsG1Lt72qXpPuNlOdkg2oMXzI1nGxD6LRzLNL1logBe0mRXVNMfDZhwhBFpOj9pUb
         NeMNWRFO1oDUGJOUgx8Rpy7g/s1sctXllDTo0lMKPwqX/g6rHeXf25OTmMejF+8ZAHgQ
         BdvnrKWGSYQaXLWT/ZvPCb2Hc5dUUCl9Qxixf+Ccm/7WhrCAr+nc3zjAv1HXyebbdYmt
         5scVW3h80wS8dsdMdnR1yFx9WT6bcUcMy2vSdBnGLWWcks54m0Vdq5AUl8IJBtU68aFR
         EC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150854; x=1794755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=lyVFx1stsMrCOKD+pYUG3yRSEL/epf0Zg+Ot81bboHOU+499Xzme+l8/f3Z0brS3pM
         g1dHEdSDPP2A3VXOYrYh4J7+g6jU+YQxkad3fQ9G5diG/9EnGGf9DS4L7qVfRD4GlnVq
         7nH3GpY5lsnmW8LzJ17mSrCXrkQcT60C7zpkj22G0jix9QC+9IOfmsuJkbOPZoYicc1c
         OPde0pF6UdTmUpp58n1Vo8uRfvOR3mIPY0CpeyPT+rjSgQ9Isd7Y2FQSc7WTnrFWGoZF
         uh0NjhtmtegPkAmdTKk6ujeTbO1AU1kb/gW8dxpY/DT64WP6JfzFbkah90eVwXbhe6cp
         e/gg==
X-Gm-Message-State: APuU4Z9wXythv5Nd2eWT+eqxweXGHSllEHNjJiKpPO7pRvJdefgb1Jhd
	eu8qw6YzvHBBRM2wWpKCaQOPx5CuXOyAD156n2rJ3+OnHL3nP5iqx95m
X-Gm-Gg: AYBFou0BBQP30y7IJ5FhwMYjKPuOAZjDBZpmGaPEMG5i5tA1rZByt+NipJTOWD3ewL9
	jGdGFc8sLmpHrK8d7xLSpWNe3fLUsNaWivZ9AqCuAZ76npEETvFyamhOP/n2fT++Hv6AwxUOT+f
	EVDbBeVs/JPGqTRXkDjfmXt3D7MdFgx/0rm1xEaRy/YOoNjyMf2u9XSVgMmOYVPMNjvZxkmecYO
	KFMwFMEOsnRspbFaDlTUlkUToFbIrkTUFxvr2dVN9aeinz9liLqjeZ+zAb19+6jPocX68F11qx+
	AEV5nlzSpvvWuXY8ArHjwAikFwiOCJUOeuPGDj+cFc2sVaC0GhcyKU0MncgmiQlusvWdN5zCLNA
	apAxN9F5Tq07Epn2m4KJqPM4rXKlYU6jcEqGmYUK25zztKOvY4RePLSLXoTBqHNH/qA8KJZ6nlz
	Fmg+RiqlEqjPRu7eZauZhwcjvvZ3Q1Rgxl6E8r5Kb1iw0LEmvoqFu+AFe23BSq/bmvzJC04QrwK
	IqtCF5fMU0c242pJVj7B8cgQ22kT0GM++YKcwo2wBKnrEmzhHwsMj11NWG85wdXkkXmGpXbCHCJ
	MZ0ZAkYvOvJhUZDKVBNTzIL+EqRsg0BzC4VKqfgYicxLdWCpu66wiyRByUHt8OVRtaa4uZvbfsF
	ZfgoafrpdBg==
X-Received: by 2002:a17:907:5ce:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c4d6db1f141mr151964566b.19.1794150854401;
        Sun, 08 Nov 2026 07:14:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:47 +0200
Message-ID: <20261108151348.204182-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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
The LED node is a child of the PMIC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        | 10 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h |  2 +-
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..d4e0f514bd667 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,16 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-max8907.
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
index 0000000000000..795b35390b039
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
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
+	struct device_node *led_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev->parent), "led");
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	if (!led_np)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = of_fwnode_handle(led_np);
+	init_data.devicename = "max8907";
+	init_data.default_label = ":wled";
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
+	.driver = {
+		.name = "max8907-leds",
+	},
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
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

