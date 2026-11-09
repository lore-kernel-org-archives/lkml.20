Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248318;
	b=qzqZAOxYU+VNZzqB+tH7yApTJud8UmdwnZm0MLDuT2FQd3aO335IJXyj205qyd6dJEWL
	 uI4or4b1Npj1JcWEeWSjwxu8bVcRn2n9VqRFshP7abXARsW1Bx566AxScX85sr8Cfzf5W
	 IdMvCbXqUjDypMEg7gN0hvH81eZDmB+yyWfl1d8i1807jgO4t2UtXcwpgJwN8Q+05NcYB
	 WfhKe2njsf+m+7M9PnEbU+aMxKX0qK+VhKg3RNAmQkjU/avbbPK83zdR6P5ME/NmKQe+F
	 j9FSA8qC0T8ASh4L74xz0FBrk5nyrM7PCXrwGqEhPYW0UQCr6PwdpD1YZFS1LS6mHqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248318;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1GV7TJwlgwN8Mj2meRpPY/A6x3RvXtMaL8MWxloPtxE=;
	b=2GakOUlLAHS1vNEvhYrT96MVXli4G4vdbuwaN4kU3I5vYymOTMvmaqZFqjvwC8fYUHTS
	 SREehKkrqWVlI28iGonPEEj1br2vjKjaWNaSh4o/Ji9qaoVk6sShTp6KJqhEGc5n0eoog
	 /zhLy1JxIRoFwaY8XXezuhftTtBSaXU2FUaNnQCM14qcFoVaa4QnGgkcqN0e0iIWW3GUi
	 qQ1cqaIC6DNSiuKIuXBwhrhK6sXxa5GtS9o55HggLI3tF0G4iihZxVNbhZ7qbdZ27wEFN
	 x/OfFz1plajE6BCqO0Ii0+JP4aNpnSyv0omd8NgKCM5Cue5Ys8fInicDaBPla3Rs8aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qu1Nzif6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FF606A333;
	Mon,  9 Nov 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qu1Nzif6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794248317;
	b=lE1bO0UCosm/ePXSYp0Bg3Np54sINX1qs9KFa1og+zC/rDpn+3d1YCU/IP7JBCKIoBru
	 7sd9uVobDqSEdWLHT/6UiLlWLf0x9eTkua6B6GLfAYzfC/GEXdLwVpkSA73Iiwqy0kAHt
	 /S3axnZTRPxbrvIs522y50qct2l4oAZATKwMcNs1fSVtuDiMVws5yRWCYYxTPZdpOzvD6
	 AG+bfoT0aWrzKaKOvexyn06ovD1PGE+bCD8Xe/ZKVcHFyaiE0/VwwK7e+bgxj9x53gHNC
	 lYEYocbwWFCEshN3SzBwmgGB/UhMiRFACGeUC7K04L3Au6VUrPjLrmfBgQ7pBtlCSdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1GV7TJwlgwN8Mj2meRpPY/A6x3RvXtMaL8MWxloPtxE=;
	b=gpRKiFN54ywpWJjuBP73wc54DfEBSK85SdVW5EEA2vgGM/Q8UePZT1K/ayrN24I55d8v
	 CaiEdFUy6irXhcYpPaJYex+e/2NqDVIsdq+AtW4YcLFbjOyaBx9LWihGNXpQmdv02GB0Y
	 ZsYYoeEnffgt5vhbtqIN1kHf3L0qQK5uBuHsFw5EzqVtWsebwKKtJjDlSt5GZZXgK4Ig+
	 YxWjIMqZSs7petfhzsFigxKfshpULQjeyFq74TiCVMMXezwLz+tg4hZY7dv7SIL27ChJu
	 m0VuV0bFuBTYeoE2aqP9lb1WOrQk248jFcFhGDH8zQOMjHpMLAJXF7D/H0HQ1xmDVeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 691341F008A1;
	Mon,  9 Nov 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248317;
	bh=1GV7TJwlgwN8Mj2meRpPY/A6x3RvXtMaL8MWxloPtxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Qu1Nzif6GKbhzGj6EhqJVBNa43hnwiw7J76jAqeOh9KNRtwlLH7bxfdZu5Sn6pqHI
	 x9UJ6bHG1ZADidJDnUGAfNgdcg/+g0oNKCc6xI7W6OWuFhgefkaTfT9yhP+OPK97Cn
	 k5uB/SnLjhcrKqWJtlczOW+9JUPeU2dRSNyIquJa7+AaqxcsOKNX5v7TuFIpPQK4iO
	 a9F6e3v5W1vrEsELXDKvWPDWkqFGiUKd0ZmJUZUvCRVmQFQhFBXvGJfiKIqQGMN1ir
	 AHJ3e7OYG7yb2mnYi2p7kMEbHXz1+zDCEO18R8fynceazhZ87gwnj1/Rgy4zLk0Ba5
	 skPlGUgLiuHxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E0BDD485B9;
	Mon,  9 Nov 2026 18:18:35 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 19:17:51 +0100
Subject: [PATCH v2 2/3] media: i2c: ov9734: Add power on/off sequencing
 support
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
Message-Id: <20261109-ov9734-ipu6-v2-2-0481b512c4c0@gmail.com>
References: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
In-Reply-To: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Afonso Figuinha <afonso.figuinha@gmail.com>, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248315; l=6947;
 i=tin.posavec04@gmail.com; s=20261109; h=from:subject:message-id;
 bh=es6pXQP0uLLRMZ6vIKju63VFxojgIzqvDHBF3zfRJe0=;
 b=muuBbogM1WJh+iQAd+optzAzLKGM/WGtghmWcP7Zmu8rezy1f/dywxabXxj0wiOVq4brv9GDt
 0td/NebOIY4CCKUjSUXht3OSMoW3ARmvQjxoJxxymR3eLQajAQtUTrt
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=h4O+VaAXzwd3B9L6H8RltugTkzF65lam1c1ls5knAVg=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261109 with
 auth_id=1463
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com
Content-Transfer-Encoding: 7bit

From: Tin Posavec <tin.posavec04@gmail.com>

So far the driver has relied on ACPI to power the sensor on and off. On
the Intel NUC M15 (LAPRC710), however, the sensor's ACPI device has
neither _PS0 nor _PR0. Its avdd supply and clock are provided by an
INT3472 discrete device instead, and as the driver does not enable
them, reading the chip ID in probe fails with -EREMOTEIO.

Get the dovdd, avdd and dvdd supplies and the optional reset GPIO, and
power the sensor on and off in the runtime PM callbacks. Also power it
on in probe before identifying it, and off on probe errors and in
remove() if it is still powered on. The 2 ms reset assertion time is
taken from ov01a10. After releasing reset, or after enabling the clock
if there is no reset GPIO, wait for 8192 external clock cycles (about
427 us at 19.2 MHz) before accessing the sensor.

Move pm_runtime_idle() after the sub-device registration, so that the
sensor is not powered off twice if the registration fails, and drop the
comment saying that the I2C core has already powered the device on.

Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
---
 drivers/media/i2c/ov9734.c | 114 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 107 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 49711fa17..c359a4746 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -4,9 +4,13 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -16,6 +20,7 @@
 #define OV9734_LINK_FREQ_180MHZ		180000000ULL
 #define OV9734_SCLK			36000000LL
 #define OV9734_MCLK			19200000
+#define OV9734_POWER_ON_DELAY_CYCLES	8192
 /* ov9734 only support 1-lane mipi output */
 #define OV9734_DATA_LANES		1
 #define OV9734_RGB_DEPTH		10
@@ -322,9 +327,17 @@ static const struct ov9734_mode supported_modes[] = {
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
@@ -870,6 +883,76 @@ static int ov9734_check_hwcfg(struct device *dev)
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
+	if (ov9734->reset) {
+		fsleep(2 * USEC_PER_MSEC);
+		gpiod_set_value_cansleep(ov9734->reset, 0);
+	}
+
+	fsleep(DIV_ROUND_UP(OV9734_POWER_ON_DELAY_CYCLES * USEC_PER_MSEC,
+			    OV9734_MCLK / MSEC_PER_SEC));
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
@@ -879,7 +962,10 @@ static void ov9734_remove(struct i2c_client *client)
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
 
@@ -910,11 +996,20 @@ static int ov9734_probe(struct i2c_client *client)
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
@@ -936,13 +1031,8 @@ static int ov9734_probe(struct i2c_client *client)
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
@@ -951,6 +1041,8 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup_pm;
 	}
 
+	pm_runtime_idle(ov9734->dev);
+
 	return 0;
 
 probe_error_media_entity_cleanup_pm:
@@ -962,9 +1054,16 @@ static int ov9734_probe(struct i2c_client *client)
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
@@ -975,6 +1074,7 @@ MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
 static struct i2c_driver ov9734_i2c_driver = {
 	.driver = {
 		.name = "ov9734",
+		.pm = pm_ptr(&ov9734_pm_ops),
 		.acpi_match_table = ov9734_acpi_ids,
 	},
 	.probe = ov9734_probe,

-- 
2.53.0


