Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919919;
	b=pWaMVWNgSUgI1kpeIztWE3kV+B+FZQkXuyRqE6BtRgv4Bnt9I5jYYKPuR6LeeJkFTrbU
	 ZU7g8YN0OaFqyfumkbjoAjFv0ablmIYae9+H/smbe8aUsqN5S4yk3HmXgnS1uDzrNrlqV
	 auXkuCvGBf4dWOJ34hvuAa8D+hv3VV4m7zgPKjO5G9gDMlk6sRFHe02gRJPZUNnCIqEZm
	 g0yJ/ORluf1x7n14M2ZH22H1GHw3LKXWw1GXeQj4LDnyphP65rBgOwkLa7Md3U75hewu0
	 9h5n4BKwFg5m+IGeu/N/q6+I+ViSj2Svon/QR1kYJ1NmVOYGV0xfeHFHmuQWNOJPA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7rMb+rCaxDEGJVyFMGjUsKu3tEjicqJ+xukElcgCjuw=;
	b=mTyDjBF1TQCxGBqnu7xK28M5lvHWR1LdIA3cYv6ZOzXIR9Ggee+MrIYUx9mtCCNvCjWl
	 Hyo20mBsDGpv4iE31myOGWApsxVI2K/sPkCmIAHvUWBTHdlL2YHl1C6yQFicb5g/ebRws
	 2H8izLqV5bYr72qg6Z8qNqBpGhiEGcuIuDqVFO98iP6vdMG1W0G8REkxR4InpLsbUzHwf
	 20w+gA6E/y7/iAyZ5mjDdCLAAMENok7uifpV26M43MA1RHCi+rV4xdIZbe2g4SPzOPFUr
	 YQfnIKiVCLzz+XTJIB3r/BrhQxzdCz7WmnxZ7Kbx5Iwf7VfMSV3SvVyCO5B+vbGw12A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WshUSYt9;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED7606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AED7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WshUSYt9
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e4831c028so75180f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919918; x=1794524718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rMb+rCaxDEGJVyFMGjUsKu3tEjicqJ+xukElcgCjuw=;
        b=WshUSYt9SXXL9aM6KB+YPorYIKHWi8ib6vOHStZXDFhhbVDnJVZBm1API6Gfd23Bcs
         0KsDgsscTcmA1e8mtT82jJeAw2CkZt/mNQF502QE08tPrxcOZHneACJsPLFb3B+5HNVD
         DKOdf/9DSiZt+432qmWK46kPsPjefNMmq4/0JMAKAac0iBs4tLVtf4tqjoGjob6g+iCc
         WxeUCauhW8G59CR76ZBSnrpbQyUj5G+g/9O8Yc0XBtjD0WIA1gT6oC1MnUqESj6gyMCe
         pJtUyZ6+M8VYEg00gj/gOVzG0JuNET+X9x6vyN9ObGQ/mD8h4jKh1LE+07EH+jt8bIKh
         Nx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919918; x=1794524718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rMb+rCaxDEGJVyFMGjUsKu3tEjicqJ+xukElcgCjuw=;
        b=UwZfT+eH+Is2CeBVD9GW6f5WI7yPYhr2CFluozGb+vfPLxnje+7ydUtlxKfIS2pUOn
         81i4EnC5XdKZfQBWxwVp11a4VCjbZfzvN+8S524xtSH8IXir3X8dtGHzjiVCZ6FErZOK
         jhCo39TOuSaTK87MFnoOypOoq/hFccJVyJ/u11nyPqzZJAzLCveopikYpDzNns4rETIV
         ALgkY8Thk+Guo5eV/qnTP9KAKH7cEyZwk7CagKebWgQ5gKaaSMWMsfM1Ac5P1KsHNUff
         lwfI9Bhou1nigQhjcPj7tqOIiM9pHuhfC9QgXdlKHJl3RuHJSB6bas6aOroHbmPlpVZR
         u4sw==
X-Forwarded-Encrypted: i=1; AKwUvBwqonYiwdeMbEMOkP0ifk26pgKM0/TV0R/S1zqYVKH6mHPOAuRZwCFUuIH8B5eVJT+ziarzpO8Hsq5zxj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G3XRiZjEqtZKifWx4GCdApiZgLfrOrz9BA9NvO0Ajv+U0dnVe
	9RG+x4DP+awJkPNzkyjnTqdUzSjmCzx86NOlgUyfr9s9ePnZ8u/7PzJz
X-Gm-Gg: AYBFou2XN1IBdtXBi2/wO9BtNoTpbqvdSie+c2nEYIly2E7AWTSUCqo/QBrjG3nuUDY
	gRAySt6Udbfp5YJ5WAO3A+Letg44LDx3wbJLAYdcIoRRHt/kK4BXUZs7TjlaUuyqA11QP2fLrmG
	d1qzfNgAEBo0LVLk03YzBcjQabwIGWku695TNVpbUnvatiu/6wRyZkCLcpNsRoWXQsVrLmoCTCX
	nq39fwsuHA8fNGPMyocqGXfx5FQzv+r2NsFuKlg3qkIUHobQSOgP/0swnN55BvCixXIezmjdLp7
	0qfq49hT/b2qGgoTFTv830MLjEy8XkmGObPhKRTzSm91EoJMSkFQlCOCV2G2+1diCL1qn4GkyAD
	bcYb9aXEpVPI+Bg968j1F97JajFcZrozD5ErXBDMlp1sqvlORVFymNAq5+DjUxQNVNHdPLnbvFD
	ybtNwVOHXBcStzp1RrS4/rr9r2UgG/3cP2DDY7PFuqoiQLaYnD3A4IoLSIyYrqV8M4M/MWxY5vD
	+ntLXSS7ilY20CMKS5aMOqgvkSm0d0vOuKzQpO5XEt40jn8atMPJghRhR7vI4H/p5s89Peykoaw
	UuHzlGU8nsPFMo+soMvwbV0zrNiBLNSybO0S6yfqJWZea/aqGf3tksl5blNl2k+v518qeic=
X-Received: by 2002:a05:6000:4312:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4927678e068mr2157859f8f.41.1793919917542;
        Thu, 05 Nov 2026 15:05:17 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm148066f8f.27.2026.11.05.15.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:05:16 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: i2c: ov9734: Add reset GPIO, supplies and PM callbacks
Date: Thu,  5 Nov 2026 23:04:50 +0000
Message-ID: <20261105230450.12394-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The driver relies on ACPI to power the sensor. On the Microsoft Surface
Laptop 1 an INT3472 discrete device controls the sensor clock and reset
line instead, so the sensor stays in reset and probe fails when reading
the chip ID.

Request the optional reset GPIO and the dovdd, avdd and dvdd supplies,
enable the clock, and add runtime PM callbacks that power the sensor on
and off. Power the sensor on in probe before identifying it. Call
pm_runtime_idle() only once the subdev is registered, so the probe
error path does not power the sensor off twice.

The INT3472 on the Surface Laptop 1 provides no supplies, so they fall
back to dummy regulators there. On platforms where ACPI powers the
sensor and no reset GPIO is described, the callbacks only enable and
disable the clock.

The public OV9734 documentation does not give power-up timings. The
2 ms wait before releasing reset and the 6 ms wait after it were chosen
empirically and work on the Surface Laptop 1.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/i2c/ov9734.c | 93 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 5f3e277b9..bf19ea56f 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -4,9 +4,11 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -322,9 +324,17 @@ static const struct ov9734_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov9734_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov9734 {
 	struct device *dev;
 	struct clk *clk;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov9734_supply_names)];
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -824,6 +834,51 @@ static int ov9734_identify_module(struct ov9734 *ov9734)
 	return 0;
 }
 
+static int ov9734_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov9734 *ov9734 = to_ov9734(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov9734->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov9734_supply_names),
+				    ov9734->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		clk_disable_unprepare(ov9734->clk);
+		return ret;
+	}
+
+	if (ov9734->reset) {
+		fsleep(2000);
+		gpiod_set_value_cansleep(ov9734->reset, 0);
+		fsleep(6000);
+	}
+
+	return 0;
+}
+
+static int ov9734_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov9734 *ov9734 = to_ov9734(sd);
+
+	gpiod_set_value_cansleep(ov9734->reset, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ov9734_supply_names),
+			       ov9734->supplies);
+	clk_disable_unprepare(ov9734->clk);
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov9734_pm_ops, ov9734_power_off,
+				 ov9734_power_on, NULL);
+
 static int ov9734_check_hwcfg(struct device *dev)
 {
 	struct fwnode_handle *ep;
@@ -887,6 +942,8 @@ static void ov9734_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov9734->dev);
+	if (!pm_runtime_status_suspended(ov9734->dev))
+		ov9734_power_off(ov9734->dev);
 	pm_runtime_set_suspended(ov9734->dev);
 	mutex_destroy(&ov9734->mutex);
 }
@@ -895,6 +952,7 @@ static int ov9734_probe(struct i2c_client *client)
 {
 	struct ov9734 *ov9734;
 	unsigned long freq;
+	unsigned int i;
 	int ret;
 
 	ret = ov9734_check_hwcfg(&client->dev);
@@ -918,11 +976,32 @@ static int ov9734_probe(struct i2c_client *client)
 				     "external clock %lu is not supported",
 				     freq);
 
+	ov9734->reset = devm_gpiod_get_optional(ov9734->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(ov9734->reset))
+		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->reset),
+				     "failed to get reset GPIO\n");
+
+	for (i = 0; i < ARRAY_SIZE(ov9734_supply_names); i++)
+		ov9734->supplies[i].supply = ov9734_supply_names[i];
+
+	ret = devm_regulator_bulk_get(ov9734->dev,
+				      ARRAY_SIZE(ov9734_supply_names),
+				      ov9734->supplies);
+	if (ret)
+		return dev_err_probe(ov9734->dev, ret,
+				     "failed to get regulators\n");
+
 	v4l2_i2c_subdev_init(&ov9734->sd, client, &ov9734_subdev_ops);
+
+	ret = ov9734_power_on(ov9734->dev);
+	if (ret)
+		return ret;
+
 	ret = ov9734_identify_module(ov9734);
 	if (ret) {
 		dev_err(ov9734->dev, "failed to find sensor: %d", ret);
-		return ret;
+		goto probe_error_power_off;
 	}
 
 	mutex_init(&ov9734->mutex);
@@ -945,12 +1024,12 @@ static int ov9734_probe(struct i2c_client *client)
 	}
 
 	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
+	 * The device is powered on at this point, by ov9734_power_on() and,
+	 * on some platforms, by i2c-core with ACPI domain PM. Enable runtime
+	 * PM and turn off the device once the subdev is registered.
 	 */
 	pm_runtime_set_active(ov9734->dev);
 	pm_runtime_enable(ov9734->dev);
-	pm_runtime_idle(ov9734->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
 	if (ret < 0) {
@@ -959,6 +1038,8 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup_pm;
 	}
 
+	pm_runtime_idle(ov9734->dev);
+
 	return 0;
 
 probe_error_media_entity_cleanup_pm:
@@ -970,6 +1051,9 @@ static int ov9734_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov9734->sd.ctrl_handler);
 	mutex_destroy(&ov9734->mutex);
 
+probe_error_power_off:
+	ov9734_power_off(ov9734->dev);
+
 	return ret;
 }
 
@@ -984,6 +1068,7 @@ static struct i2c_driver ov9734_i2c_driver = {
 	.driver = {
 		.name = "ov9734",
 		.acpi_match_table = ov9734_acpi_ids,
+		.pm = pm_ptr(&ov9734_pm_ops),
 	},
 	.probe = ov9734_probe,
 	.remove = ov9734_remove,
-- 
2.53.0

