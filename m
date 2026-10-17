Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6F3815F3;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225935; cv=none; b=XIEiIJkAvY45bRVdUFZ6WVcmuLx6KrusSeBokHyNAR+0RoYPpsRJA4yGUouaJ37/+mt+FIwJTEMSrA9RMiJqhAtWajsHtWaIkyz8+/18EMUQRiwFS/XIzNMDaHrBMVkrk9zkuesg1i/RNzRmvRXSsuqzImmWeXpYty/UdcZ69pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225935; c=relaxed/simple;
	bh=DZmxefMG7FnLQ5tjHxSaOt8I6ym2p8oL0eK9QC84e6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CA2Nqd8E0b66qa8JQnriRjSCuZYAgoA4MYnY2oFSCzQRYQPtCJRJY4yMYShP/Y+G99ov24RcP1m34gBarnbmML3GHNNoLYzoXQkdtuP1YeNjxIrPne/TEGLms3WlWJSvguaPtKH95VAbQxtXjOcAA7geyOHKyepZfXSSubV1JyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fr6PJKCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fr6PJKCc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C7AFC2BCFC;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792225935;
	bh=DZmxefMG7FnLQ5tjHxSaOt8I6ym2p8oL0eK9QC84e6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fr6PJKCcORZxUkx2773k27nK7T9nhuZqBb4K5KuraP5KVD2OVOdwIIQyTlf5m11QK
	 v3EeZTY6GdY0g/HmymRrSUksITrtWMXbbCEOF3JsWKUDpgIk0aGdsLRDUkvwgw5xcb
	 KffMBTkXeo1bcbJBPYCcUQESg+QohAAhrbYsDF6j0ShoI2BDJBIf4X9TRYsq3TiLqx
	 F8COFj2cEWRemVP/ZuigX5zqHx1UbFepHd4LijWovpfoz+3Ij+LWSxiJ1pcZPn0nGq
	 mGV6M2Ad7Apg2YedFBcgS2ErTYyMGM7tntY1kNjf12ePtyts4B7v8wXUrJCIuWs5vq
	 YziTewZX73mbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB9BCCF2C7;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Sat, 17 Oct 2026 10:31:58 +0200
Subject: [PATCH 2/3] media: i2c: ov9734: Add power on/off sequencing
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-ov9734-ipu6-v1-2-86eab22ae258@gmail.com>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
In-Reply-To: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792225933; l=7026;
 i=tin.posavec04@gmail.com; s=20261017; h=from:subject:message-id;
 bh=G+A64TOfBfamE9krKpD+uEXs2ubNWteQfnc5ypFAhEs=;
 b=SiWixlQKZg7eimTScnarM2D0/p0Wjy4duDqFLAMiypUCuoq1iz6uOhZyEmvehudJCfo6SmHUP
 mV8MktvwSSSD5sknecOjEcZ7s9bCRTW9bHoZD0qATwQraJRjhdjqRUv
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=SHQVmXmK88mO08JT/P9vzu9gKd208IICWLSbsX3TmcI=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261017 with
 auth_id=1222
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com

From: Tin Posavec <tin.posavec04@gmail.com>

So far the driver has relied on ACPI to power the sensor on and off. On
the Intel NUC M15 (LAPRC710), however, the sensor's ACPI device has
neither _PS0 nor _PR0. Its avdd supply and clock are provided by an
INT3472 discrete device instead, and as the driver does not enable
them, reading the chip ID in probe fails with -EREMOTEIO.

Get the dovdd, avdd and dvdd supplies and the optional reset and
powerdown GPIOs, and power the sensor on and off in the runtime PM
callbacks. Also power it on in probe before identifying it, and off on
probe errors and in remove() if it is still powered on. The 2 ms reset
assertion time and the 20 ms start-up delay are taken from ov01a10.

Move pm_runtime_idle() after the sub-device registration, so that the
sensor is not powered off twice if the registration fails, and drop the
comment saying that the I2C core has already powered the device on.

Assisted-by: LLM
Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
---
 drivers/media/i2c/ov9734.c | 125 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 118 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index f9280ef0e..feb15de2c 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -4,9 +4,12 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -322,9 +325,18 @@ static const struct ov9734_mode supported_modes[] = {
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
+	struct gpio_desc *powerdown;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov9734_supply_names)];
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -878,6 +890,88 @@ static int ov9734_check_hwcfg(struct device *dev)
 	return ret;
 }
 
+static int ov9734_get_pm_resources(struct ov9734 *ov9734)
+{
+	int ret;
+
+	ov9734->reset = devm_gpiod_get_optional(ov9734->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(ov9734->reset))
+		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->reset),
+				     "failed to get reset gpio\n");
+
+	ov9734->powerdown = devm_gpiod_get_optional(ov9734->dev, "powerdown",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(ov9734->powerdown))
+		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->powerdown),
+				     "failed to get powerdown gpio\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(ov9734_supply_names); i++)
+		ov9734->supplies[i].supply = ov9734_supply_names[i];
+
+	ret = devm_regulator_bulk_get(ov9734->dev,
+				      ARRAY_SIZE(ov9734_supply_names),
+				      ov9734->supplies);
+	if (ret)
+		return dev_err_probe(ov9734->dev, ret,
+				     "failed to get regulators\n");
+
+	return 0;
+}
+
+static int ov9734_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov9734 *ov9734 = to_ov9734(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov9734_supply_names),
+				    ov9734->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ov9734->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov9734_supply_names),
+				       ov9734->supplies);
+		return ret;
+	}
+
+	if (ov9734->reset || ov9734->powerdown) {
+		/*
+		 * Keep reset/powerdown asserted for at least 2 ms on a
+		 * back-to-back off-on cycle.
+		 */
+		fsleep(2 * USEC_PER_MSEC);
+		gpiod_set_value_cansleep(ov9734->powerdown, 0);
+		gpiod_set_value_cansleep(ov9734->reset, 0);
+	}
+
+	/* Give the sensor time to start up before accessing it */
+	fsleep(20 * USEC_PER_MSEC);
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
+	gpiod_set_value_cansleep(ov9734->powerdown, 1);
+
+	clk_disable_unprepare(ov9734->clk);
+
+	regulator_bulk_disable(ARRAY_SIZE(ov9734_supply_names),
+			       ov9734->supplies);
+
+	return 0;
+}
+
 static void ov9734_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -887,7 +981,10 @@ static void ov9734_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov9734->dev);
-	pm_runtime_set_suspended(ov9734->dev);
+	if (!pm_runtime_status_suspended(ov9734->dev)) {
+		ov9734_power_off(ov9734->dev);
+		pm_runtime_set_suspended(ov9734->dev);
+	}
 	mutex_destroy(&ov9734->mutex);
 }
 
@@ -918,11 +1015,20 @@ static int ov9734_probe(struct i2c_client *client)
 				     "external clock %lu is not supported",
 				     freq);
 
+	ret = ov9734_get_pm_resources(ov9734);
+	if (ret)
+		return ret;
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
@@ -944,13 +1050,8 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
 	pm_runtime_set_active(ov9734->dev);
 	pm_runtime_enable(ov9734->dev);
-	pm_runtime_idle(ov9734->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
 	if (ret < 0) {
@@ -959,6 +1060,8 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup_pm;
 	}
 
+	pm_runtime_idle(ov9734->dev);
+
 	return 0;
 
 probe_error_media_entity_cleanup_pm:
@@ -970,9 +1073,16 @@ static int ov9734_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov9734->sd.ctrl_handler);
 	mutex_destroy(&ov9734->mutex);
 
+probe_error_power_off:
+	ov9734_power_off(ov9734->dev);
+
 	return ret;
 }
 
+static const struct dev_pm_ops ov9734_pm_ops = {
+	RUNTIME_PM_OPS(ov9734_power_off, ov9734_power_on, NULL)
+};
+
 static const struct acpi_device_id ov9734_acpi_ids[] = {
 	{ "OVTI9734", },
 	{}
@@ -983,6 +1093,7 @@ MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
 static struct i2c_driver ov9734_i2c_driver = {
 	.driver = {
 		.name = "ov9734",
+		.pm = pm_ptr(&ov9734_pm_ops),
 		.acpi_match_table = ov9734_acpi_ids,
 	},
 	.probe = ov9734_probe,

-- 
2.53.0


