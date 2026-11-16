Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837048;
	b=KnNZefuiT2XScfAhXv18xkytO3bvJZyaYsd22gS8ZlAQwzX9NeJXvY+0nXh4njNBGzcn
	 hqT/cZNEogEbQbKwKOeQ5yqyLhAkoSnkMSlR2PcuULtyuPVX2WTRuu0EzQnxEM/8ZdRAf
	 sw8kSd8e7jB8VOwiukfwtDHlHY31DURl31KR+tqQUBUH4jgH4Kpxyq+ikgQiRJ82TDfrs
	 JByXDfo6bWvFW0n+46HkicUu04Haz5BMaKHmO53uJt6ZADTkJQ24MW6CRX9oYqMIqbjN/
	 fy+mbeuxtNLa6CpKmNYdANUCL57C5iLbKdM+D1Z8gst/eppPPTcT9XpSpOiKbBdGsGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837048;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=BdaOVyXp5FLYqf2KnPEJmOT9duRu5mqSEItjrHOef1s=;
	b=fi8UzUkuMSkfjWJoO65EzEm04C8xibok9zgjqpLMdH273zc1X7bjl42ij+MkAxOhy2mm
	 czapEY/v+ygDd7BUZAuLwhEP1uXrilxrssZ2TNbNtDiMe0DsmqvqoOkCXyoR19foHFprl
	 jDwjkJlCP57c5bvK098kzbn7VEoRRqFOJ6dv8HU0LQ0gzRbj+F0XBD7ckos7/sabWhJ0b
	 el7oTg4mTTPEJ0sK14Rk4hTH/4wxstf0QsXNqD5yKxAzEe74DR/eBQvergaHANn7fsHze
	 E7LIb+ezOi12VS7dF+TNYrt1Wctm0oZwdqKeyEmYAB/X83nfmVnAYN34wIS4aATOzrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=guI2+Gdo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B760A3839;
	Mon, 16 Nov 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=guI2+Gdo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794837048;
	b=WocF5fKnoLtxL7HOsOPm3ZzcjMD+riPWYJtMXls+ZYOf6JuzBhhMrOjeq/NoY8eQl5Uo
	 tJWhHhGCiL7zitN09JgkMJf1Md5eQlFK1JXMl0rtIHonXuznnY5sKH4RC7rphV9ER5kla
	 Zb4LCPJGLBGf0X9pv4sa9B3obmuXRlWJgXIO8OZCFSQynoYFtlUJF9hrwccbR+ZYNGVnW
	 gDIzIHirUxdTv0kUwEa7T8gIwECcxJUmTa0TxKwbdXbLKI3ei3MFfw2qEvC0OVyHQ9P4z
	 fpMBFwsuMyQVWT+h+Hbg+518ULmwBp1u6STD+wM0xhMuhnf9f81s72hKF5DaZC5Qdaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794837048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=BdaOVyXp5FLYqf2KnPEJmOT9duRu5mqSEItjrHOef1s=;
	b=RlAo8jhz49zA8YqV+Acgek6cRjanhQATBXPr/K19bUYf/mFHQlKeBX/ES5fU4qfVMwcr
	 OeK+VQp4NPplmPzu+1PEPb62rB5e7e/bDK+mUaWpP102M7bV4+d56kyDp/10v129yMzvv
	 d8yhBVWfMOV4W+VGdad7bIL01rUN1chEgA9V3Pn8tKgIjaPkh+X5H67yIg6YbYyA5iXQP
	 Ocn8WtZ2XDAZtHqaWvvNnDuGDtko/BmGhc3N3ztqkpQWT0yv4GtHsmYKg2xF9aidTkkMs
	 KtCH9QTz3dPcaNFxcMEEoiA7gGQlMRvyAn6Oo5EOk1t9Z7nUxqo+00cmL6GvNiWh3Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 588F51F00927;
	Mon, 16 Nov 2026 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794837048; bh=BdaOVyXp5FLYqf2KnPEJmOT9duRu5mqSEItjrHOef1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=guI2+Gdob8akQ+b3nPRpC2nRowKBxaSPaJKl5eCyIe7Z8uTJ4vTKJT7efDLRyrTbZ
	 BMcxskls/wTfoKtjHVyOr/TSMupEZkH2zZU6rapRV9a0RHP/WqPjHiqXixIPIAvU1F
	 MxeyWRmAPidPQvZyXp6KVmt1Wpyf0Ft3yTRgLOfA=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 61BC14A4AF;
	Mon, 16 Nov 2026 13:50:44 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 16 Nov 2026 14:50:29 +0100
Subject: [PATCH v4 8/8] media: i2c: ov9282: harmonize dev_err_probe usage
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ov9282-fixes-v4-8-f78e5d415c6f@linux.dev>
References: <20261116-ov9282-fixes-v4-0-f78e5d415c6f@linux.dev>
In-Reply-To: <20261116-ov9282-fixes-v4-0-f78e5d415c6f@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794837042; l=3822;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=I9wIotiDTkl96sFViOGUNgag5B0Xx3xLSgKVKQsqlMk=;
 b=YRYTfid65uRKmyEondGLxzffkljQaE0lv8WEBidq1T+J6ypZU/yQSqaem40OF4BbsQ5ah5uH4
 /fqlBpGRQG+AdTTnfWNhTMMG9kizoFLFLXFmANmhqM6w3hytHlJ6uZX
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Use dev_err_probe() for all error messages during probing. This ensures
there's a common "look-and-feel" in the drivers source code as well as
the system log.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 01a9144cf8df3..a4407466205b0 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1079,9 +1079,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %pe",
-			ov9282->reset_gpio);
-		return PTR_ERR(ov9282->reset_gpio);
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
+				     "failed to get reset gpio\n");
 	}
 
 	/* Get sensor input clock */
@@ -1097,8 +1096,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 
 	rate = clk_get_rate(ov9282->inclk);
 	if (rate != OV9282_INCLK_RATE) {
-		dev_err(ov9282->dev, "inclk frequency mismatch");
-		return -EINVAL;
+		return dev_err_probe(ov9282->dev, -EINVAL,
+				     "inclk frequency mismatch\n");
 	}
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -1114,16 +1113,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
-		dev_err(ov9282->dev,
-			"number of CSI2 data lanes %d is not supported",
-			bus_cfg.bus.mipi_csi2.num_data_lanes);
-		ret = -EINVAL;
+		ret = dev_err_probe(ov9282->dev, -EINVAL,
+				    "number of CSI2 data lanes %d is not supported\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
 		goto done_endpoint_free;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(ov9282->dev, "no link frequencies defined");
-		ret = -EINVAL;
+		ret = dev_err_probe(ov9282->dev, -EINVAL,
+				    "no link frequencies defined\n");
 		goto done_endpoint_free;
 	}
 
@@ -1354,8 +1352,8 @@ static int ov9282_probe(struct i2c_client *client)
 
 	ret = ov9282_parse_hw_config(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "HW configuration is not supported");
-		return ret;
+		return dev_err_probe(ov9282->dev, ret,
+				     "HW configuration is not supported\n");
 	}
 
 	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
@@ -1366,12 +1364,12 @@ static int ov9282_probe(struct i2c_client *client)
 	ret = ov9282_power_on(ov9282->dev);
 	if (ret)
 		return dev_err_probe(ov9282->dev, ret,
-				     "failed to power-on the sensor");
+				     "failed to power-on the sensor\n");
 
 	/* Check module identity */
 	ret = ov9282_detect(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to find sensor\n");
 		goto error_power_off;
 	}
 
@@ -1381,7 +1379,7 @@ static int ov9282_probe(struct i2c_client *client)
 
 	ret = ov9282_init_controls(ov9282);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to init controls: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init controls\n");
 		goto error_power_off;
 	}
 
@@ -1394,7 +1392,7 @@ static int ov9282_probe(struct i2c_client *client)
 	ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
 	if (ret) {
-		dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
 	}
 

-- 
2.53.0


