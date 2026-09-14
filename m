Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3265B3A9014;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413686; cv=none; b=dXTUryJZE1JyqCBepix6pF5Ky8/ATcyt07piwWmUfF1yy3+CH2/urlrkM1HMk430S/+rejXfYEvbk1cq/qQLAnb1xz77z9hOagldHG45yf9KRML5o0Wrmngp03qSQostmPFbou4k4CO6UJKJzmhCgZ9uWOwOTRKYjch+CHnHHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413686; c=relaxed/simple;
	bh=X/+unClTspOJekYPPWuq/bkgvMrI/GbDcnT0WppbeMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NaxFY8Gq3mQ+6Gfs3l1NsJsMxjOIlB3LG5GqQJQwuY0phicsB2YfPpS6YluEdJv5LVbWt9//QY9QUAELmYzK2e/WWcf+UWTZmZELTV5KRAA+Vr4OcGBTbyFJYPAoCRjw5UD/esXwwBrHjkEtFsA8x0MHOz0eaWBS1xnZjHdhp18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DuPmEASU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DuPmEASU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB0EBC2BD00;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413686; bh=X/+unClTspOJekYPPWuq/bkgvMrI/GbDcnT0WppbeMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DuPmEASUjqdIQ9hW80s3eNKCjyc1X70Yihd7TGRBxcoggYP7mZ4iDDQmLlXBGCshg
	 f4K2LxftL2wf5P8XKwY67jHIOYCn28szYidDy5L6fXkSTCLktXcTcZ8wrbNu6BmG2I
	 FbAKDQlTsjEs4bB8s++oEYrHA8D9ouS1AJ/CxnIU=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9509C88E7D;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:05 +0200
Subject: [PATCH 08/10] media: i2c: ov9282: harmonize dev_err_probe usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-8-f520af59df1b@linux.dev>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=4413;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=X/+unClTspOJekYPPWuq/bkgvMrI/GbDcnT0WppbeMM=;
 b=8nQkBVitJ5/voIL3ISwnrZDJYm67GwDuPPb5ALQx/e9KAhyqnVlBpidImRnmmgv51vHIPgpI7
 Uj1oY5dakLdDb6d0eJvZGclj/lIyLQWwADEhUGBKJPRHRZngskqLaRb
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Use dev_err_probe() for all error messages during probing. This ensures
there's a common "look-and-feel" in the drivers source code as well as
the system log.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 28f8b05b4c09e..f728709fcf0a6 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1109,26 +1109,25 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %pe",
-			ov9282->reset_gpio);
-		return PTR_ERR(ov9282->reset_gpio);
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
+				     "failed to get reset gpio");
 	}
 
 	/* Get sensor input clock */
 	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
 	if (IS_ERR(ov9282->inclk))
 		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->inclk),
-				     "could not get inclk\n");
+				     "could not get inclk");
 
 	ret = ov9282_configure_regulators(ov9282);
 	if (ret)
 		return dev_err_probe(ov9282->dev, ret,
-				     "Failed to get power regulators\n");
+				     "Failed to get power regulators");
 
 	rate = clk_get_rate(ov9282->inclk);
 	if (rate != OV9282_INCLK_RATE) {
-		dev_err(ov9282->dev, "inclk frequency mismatch");
-		return -EINVAL;
+		return dev_err_probe(ov9282->dev, -EINVAL,
+				     "inclk frequency mismatch");
 	}
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -1144,16 +1143,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
-		dev_err(ov9282->dev,
-			"number of CSI2 data lanes %d is not supported",
-			bus_cfg.bus.mipi_csi2.num_data_lanes);
-		ret = -EINVAL;
+		ret = dev_err_probe(ov9282->dev, -EINVAL,
+				    "number of CSI2 data lanes %d is not supported",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
 		goto done_endpoint_free;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(ov9282->dev, "no link frequencies defined");
-		ret = -EINVAL;
+		ret = dev_err_probe(ov9282->dev, -EINVAL,
+				    "no link frequencies defined");
 		goto done_endpoint_free;
 	}
 
@@ -1382,14 +1380,14 @@ static int ov9282_probe(struct i2c_client *client)
 
 	ret = ov9282_parse_hw_config(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "HW configuration is not supported");
-		return ret;
+		return dev_err_probe(ov9282->dev, ret,
+				     "HW configuration is not supported");
 	}
 
 	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov9282->regmap))
 		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
-				     "Failed to init CCI\n");
+				     "Failed to init CCI");
 
 	ret = ov9282_power_on(ov9282->dev);
 	if (ret)
@@ -1399,7 +1397,7 @@ static int ov9282_probe(struct i2c_client *client)
 	/* Check module identity */
 	ret = ov9282_detect(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to find sensor");
 		goto error_power_off;
 	}
 
@@ -1409,7 +1407,7 @@ static int ov9282_probe(struct i2c_client *client)
 
 	ret = ov9282_init_controls(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to init controls: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init controls");
 		goto error_power_off;
 	}
 
@@ -1422,14 +1420,14 @@ static int ov9282_probe(struct i2c_client *client)
 	ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init entity pads");
 		goto error_handler_free;
 	}
 
 	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&ov9282->sd);
 	if (ret < 0) {
-		dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
+		dev_err_probe(ov9282->dev, ret, "failed to init subdev");
 		goto error_media_entity;
 	}
 

-- 
2.53.0


