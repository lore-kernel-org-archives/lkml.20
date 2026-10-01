Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E04A2A52;
	Thu,  1 Oct 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859339; cv=none; b=Sguy/LyatFLc6YgzRBJ+mcse91vWUOfS5fKT2lA0XPh1JFRx5u/ktLuLtuDzrsf3P3AoxbMhyjG+191g7TpnLD1rRdLduCmIZ5kNsrLOZSM1YpzKIBsPNE7aS/xvTXlIH4qs2d1UWRYU1m5oboFtTakwtMMFYD8TL2Z0HX1cmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859339; c=relaxed/simple;
	bh=7vYZCqk405zrK3FBdUJFIXKymkrqQjeABFiIyv453PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAe0xEhMSYqDYAClVovMKKDpTGOqmfbk7GH5r4PycARTFFFoMU9nAzzhfsN6bFfqhfeju20IFwi295WbHhptqErTP22SDSkjYhvcCHTc9nqUtJKTgFRr08mnIxTGFHAT2ZI0Zdh//noam0kjgLd/9eeC+0ZnO6j2VOrAEpfSkoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DePYC/87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DePYC/87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1251F000FF;
	Thu,  1 Oct 2026 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859338;
	bh=ISbpY3ZSiPIdR8dLHK3KhEN3TM5IQkcVHUDDlyQG9pI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DePYC/87uqTDkkhPmOz/smy5XRhm/KGGfN0Y+M2556BBMZb1gU1rdFiExH8L4n0wh
	 qTfPEoZLmKJm8aAqDLWw56GJrTtXPEDIwMDFV/fCdCowFcrnmJsDu6Esd4fpCfoktd
	 jI+VoYEoxSiuOqHFVhLRKjoWUMUaW7lRJ5z8jzUwFc64YWyLdAHrte13HgALtmXs5X
	 CBwLLSrMVoQJIhbvsaRqUsErqHTjwWBoWL8mrnEs9YNKU94X2JvXQCanHDoJbKlLU5
	 ifdwgOCIebm9R4sjFFb74LEFosSzG2poT2Z56sYZX0CChwxmeIUUcxryXtCFd5e51x
	 FrblFr2PC49VA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 01 Oct 2026 14:55:21 +0200
Subject: [PATCH RFC 3/5] media: imx219: Allow driver probe with missing
 sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4309;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=7vYZCqk405zrK3FBdUJFIXKymkrqQjeABFiIyv453PY=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg+kpXYSg4uCC2t02HoOJXFb2DukNXGRxHdd
 zgY2KvVTgGJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPgAKCRAZDR20Zk4Z
 NaWxCACCWlWV/aHZ0gCrPINrBG88qj6usT/pFnYoCBy2RrCv8SHJYdphAR/GVwprXtYPe6Eg98R
 SdYSZw8IyZZ+wMahkPdaCtJCdh7w3Hvmnd88kL0xIKEaQS0D125JpC/BpKIBF/pOReCHci4VzX0
 DwYjnTeDvbWnfNftuDVhNLFDOqB9z6HM6VgPTJZhKOa9v8/7ypVfbK0SjsgGOnMJnuuRIv3YwiZ
 ZZ+Y8XB88o0cd6CgMdJZl6l7QB38GDRifgX1PZbweIefUSU5eOwtuBQ2XKjSGZenGvC1XBUiIOE
 LPIiz/OdOCTcglDJhEA0LSZjxAfGAc+h5dLfgDgagSA247yG
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Probe() should complete even when a sensor is disconnected. This would
allow the v4l-subdev to be created and improve fault tolerance.

Currently, the driver reads the CHIP_ID over i2c in the probe().
When we can't read CHIP_ID, the probe errors out - which result in the
v4l2-subdev not being created.

Remove all i2c communications to allow the driver to probe with a
missing sensor.

Note: Since we no longer power on the sensor during probe, the driver
now starts in suspended mode by default.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/media/i2c/imx219.c | 72 +++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7978fee5f4a2..aeac70123b9b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1000,6 +1000,29 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return imx219_set_pad_format(sd, state, &fmt);
 }
 
+/* Verify chip ID */
+static int imx219_identify_module(struct imx219 *imx219)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	int ret;
+	u64 val;
+
+	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
+	if (ret) {
+		dev_dbg(&client->dev, "failed to read chip id %x\n",
+			IMX219_CHIP_ID);
+		return ret;
+	}
+
+	if (val != IMX219_CHIP_ID) {
+		dev_dbg(&client->dev, "chip id mismatch: %x!=%llx\n",
+			IMX219_CHIP_ID, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -1056,6 +1079,14 @@ static int imx219_power_on(struct device *dev)
 	usleep_range(IMX219_XCLR_MIN_DELAY_US,
 		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
 
+	/*
+	 * If we can't identify the module here, it might be disconnected.
+	 * Consider power_on() complete and exit early in that case.
+	 */
+	ret = imx219_identify_module(imx219);
+	if (ret)
+		return 0;
+
 	/*
 	 * Sensor doesn't enter LP-11 state upon power up until and unless
 	 * streaming is started, so upon power up switch the modes to:
@@ -1117,27 +1148,6 @@ static int imx219_get_regulators(struct imx219 *imx219)
 				       imx219->supplies);
 }
 
-/* Verify chip ID */
-static int imx219_identify_module(struct imx219 *imx219)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
-	int ret;
-	u64 val;
-
-	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
-	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "failed to read chip id %x\n",
-				     IMX219_CHIP_ID);
-
-	if (val != IMX219_CHIP_ID)
-		return dev_err_probe(&client->dev, -EIO,
-				     "chip id mismatch: %x!=%llx\n",
-				     IMX219_CHIP_ID, val);
-
-	return 0;
-}
-
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
 	struct fwnode_handle *endpoint;
@@ -1252,21 +1262,9 @@ static int imx219_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
 				     "failed to get reset gpio\n");
 
-	/*
-	 * The sensor must be powered for imx219_identify_module()
-	 * to be able to read the CHIP_ID register
-	 */
-	ret = imx219_power_on(dev);
-	if (ret)
-		return ret;
-
-	ret = imx219_identify_module(imx219);
-	if (ret)
-		goto error_power_off;
-
 	ret = imx219_init_controls(imx219);
 	if (ret)
-		goto error_power_off;
+		return ret;
 
 	/* Initialize subdev */
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -1288,7 +1286,7 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
-	pm_runtime_set_active(dev);
+	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
@@ -1298,7 +1296,6 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
@@ -1315,9 +1312,6 @@ static int imx219_probe(struct i2c_client *client)
 error_handler_free:
 	imx219_free_controls(imx219);
 
-error_power_off:
-	imx219_power_off(dev);
-
 	return ret;
 }
 

-- 
2.55.0

