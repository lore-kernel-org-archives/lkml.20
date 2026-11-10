Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316224;
	b=c+AxsGvehOejrzPsklAt9vudfbPwUovm2sJyKDiDrejfa1HEDslQjFXFTZQeZUFms3mO
	 wIuEvGtyT8Ts7RWndapvtF5IbRRbRnRfIJe/bLRNHydMn/W+gAj47w+mmR9XsTVCKW/8X
	 hFIJqyFiN2McEDdeVJdsggNJoIUjuYkztrnotlIV29SjBJNpdbiUU3EqTpUxJH+CrV0kE
	 2Os0QCJqZBjkHDXMJRx+c31KvbQobj1C5X/t0kycNWxzw0ZIlUOHQQI2rrZeo1AC1Z+Ud
	 kUXnbdFMg0q2khd5OfX5PfnI9JGNC3+LlZQ2z5jPiDxkrXZEoE6y8NqAnlmAfEFlPNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316224;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=Wf6FI8o1Tmvt6MPDSJKVt2QYAFo7R4D0jsMuZlMzEGg=;
	b=Cg1rjl5LG3CtE/RCpc0l4KnmthLnZMoMY2r7dFxQ2LFStpKquFs8HTovA5Z1TrIbM4IP
	 rrSvMS7sFlsbIiVqCbTtR4QeIXQ6HJjQXBfnhqyeksKd/pLfk88vXMQRTNbEOMe4/t6OK
	 HOWrKJMR82Tka8GjIaKl+oGaALkPdxTxTh3RhTG1QlRx7B1fsCyYKLjs2FfCVsA+pd66Y
	 SxRJ/LI75eI9Vyz5+vryYEFt7f+5Am9iFyn6jg0Mkncf/HN1PwhCoKxLe+gkL5RR3B9+7
	 O9N8gG0qeNopDwaMvze+zq85/4sgGSgDca8NC80DKZR2jp3AJMiRtx6Gi8so6wvqHbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b="Y28A7/A8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76898606B2E5;
	Tue, 10 Nov 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=Y28A7/A8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794316224;
	b=u96ctbK15fimvpEwFSCsKBblMwwlygJD6MHK+NnVU5Cp/Ij1szYtkFGAgNX8rrnTmUHm
	 oIuGTqFaiXpAqn1T5p+d4fUFWlzqAHLfJeGi54/mtZIPDiWyb5No/fFdTx7MqE2MyhY1S
	 //PdXe9WFMRK8ya1Atr2izahdRaN4su0p5Nqv1Ym9viOV6TP94qWeqAL/OjRdhKwMWVOR
	 0n9+BPzE+Z9nIm3vhhu+cJFcY4t+JBeKhet5nBWTGgDGnrd1OB4z6l0enfM1BB0AFYbp0
	 FXfJblJ7tFZj/4qIbOxwbcfHdU9dEBobJn5upAb1oTuXN5eZ872GGCQ1gf4uJ+mGuEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794316224;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=Wf6FI8o1Tmvt6MPDSJKVt2QYAFo7R4D0jsMuZlMzEGg=;
	b=GvZ9lpMcGuqgAj7AiiOgMbci7/5la+43CZdNo/NH3l328RnxTC5fCIHgRLY+bwGd4D3O
	 pGdSXjZlbhrK68FxbGuFdMFHrt/qIVEWR83hVxp5XPnjJSGsoEqxMgCeUXOPar/ZCLZu1
	 qn+ssFp3fQRfek589CcDYEep6ObElidU/thCNp3Bh99ORu7rQQTSPJPFmbSaHPlHudpVa
	 Db+p0zTO+2QubYr78mg37a0jXU1F2w124jZ0Lh1qaQgqTDIGo+S7Ml7RL4MdIQxnZS022
	 AOgTxdS1WBLhOrSrN68Mh29xL4TIHqxgGwaevk5nCvi7XjkDQT4C7KXIRWt+qdiIK9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F6F31F008BD;
	Tue, 10 Nov 2026 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794316224; bh=Wf6FI8o1Tmvt6MPDSJKVt2QYAFo7R4D0jsMuZlMzEGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y28A7/A8UFD8O77GCIzFcrZ8ts//ln1zP7UboCXErbGumATp9JewvS+uLCqoLbt6h
	 aCBYj8QL2uFc7VwQto9zheVXWV0DV06X1B5Q5VRdqy8aL6tR94PV7TZo0xAVx51yEN
	 zahmJm9HsSNcL2vQvwiUolbrjkS7QPFh6Jbi+LfM=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6DBF348B82;
	Tue, 10 Nov 2026 13:10:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 10 Nov 2026 14:10:17 +0100
Subject: [PATCH v3 8/8] media: i2c: ov9282: harmonize dev_err_probe usage
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
Message-Id: <20261110-ov9282-fixes-v3-8-cb6df80cbc22@linux.dev>
References: <20261110-ov9282-fixes-v3-0-cb6df80cbc22@linux.dev>
In-Reply-To: <20261110-ov9282-fixes-v3-0-cb6df80cbc22@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316220; l=3822;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=AdqD65jRSys4ZCILKgwTUAa4BvnkFI00p9DtzkspV4U=;
 b=vY6obKzzB7mkF9EVat+K65QhCPlMcS2aBpZNjG+iXyj/bbb046O7I8bIrhZ81c99VnApqRL6x
 yR3YbrKwzFVBn09mzPYpJ76CT5MpIqpZrhB0vgngDsVnEoCaQ+1Gbmb
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
index d24fcdd4bcc33..59443b18d83cc 100644
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


