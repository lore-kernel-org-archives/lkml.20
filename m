Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23234C10C6;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=QYZrJ9W6AF1IjsoB+WkU8Lv497NGNBjCTb/n9kTQ8a0nxU84RMhUC0ZayfVfCE4C0uZ8KzDGQiV+DacjBf4vsMOO38b4LeuIZntDSkjAh2qAJYB8yvhVdzHEEUSJRsY+VRTgQtdf03JciU9o3GgH0ugrPvBK0WTVVjUaVQWPudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=zaiIsMVlR0L37K2L49j1FJTCGyIjXcVgMUBYYAGBYCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mk/MlLZ3x/r3cFt33SB7Q2D7ONqHShrgPkOq0xd1yfCjLEy3xgI7hgnu8HH2lzmDdc1Nrl9jts+yVJu3NHF13JenzCIgqYmlmqMBu7Pr9Gu1y+OU7znvbF9X0MdaOt6VLpD9iAUlA8eHAcEcaSoX6IiBFmjekPNbgyh6OwHd7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlqHb+y8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlqHb+y8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 040F4C4AF0B;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721841;
	bh=zaiIsMVlR0L37K2L49j1FJTCGyIjXcVgMUBYYAGBYCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FlqHb+y86tt3ASUPULshn9tM/kxRAEvElfZtQK7FxK6oxs6F7WrEVgCoitIcguZsE
	 0t4ETyArBRYYw6qhh70rpIXDT3Juuap2HsDYeauEqPIoYubb4SNxGoIYeZGhlW4Yjv
	 qUmoGNSeaQGopsfn0tODlFUqCk+wCRZszr6QtG0Y/iCZqEXPyP5iE2BqctDZr4nkhf
	 5V14X0hO3hKb1wj4VUapPTYDH/jqU0njmeCaEHKPVG9YCjCciSDVZrvHcHy9AZ+Mnk
	 hzI7ldox+/2GjCRG2srxwLqbd1tQ0SnRkrG6WM35crHVy58OpSQwiNuTfnW5bw16Zg
	 NbLxIXTkSvIfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CBBC982DA;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:34 +0800
Subject: [PATCH 19/21] media: i2c: it6625: fold subdev initialization into
 probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-19-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=3426;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=ndWi/BQPjYEEQd8U3qZXPlkzWBPSSf2B88726aLj/Qs=;
 b=j6jfLXguBkYvIZdOU6sVBQl5aVQtz6Act2beWPPbvm68KwgwleULAe6UXFNwGHX5SxDUssOk9
 4xPRxLU3jMZDud/a/peu9pvu+nGb/vt3dkrMR36dQZ2q5WnNiWCBMTP
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_init_v4l2_subdev() split subdev/control-handler/media-entity
initialization out of probe(), which made error handling harder to
follow across the two functions and forced probe() to normalize every
init_v4l2_subdev() failure to -ENOMEM regardless of the real error
(e.g. a media_entity_pads_init() failure was reported to the caller as
-ENOMEM instead of its actual code).

Inline it into it6625_probe() so initialization and its unwind path
are visible together, and propagate the real error from
it6625_v4l2_init_controls() instead of replacing it. Cleanup behavior
on each failure path is unchanged: it6625_v4l2_init_controls() already
frees the control handler internally before returning an error, and a
media_entity_pads_init() failure still frees it explicitly before
unwinding, so neither path double-frees it through the later
err_clean_hdl label.

State finalization (v4l2_subdev_init_finalize()/cleanup()) is
deliberately left for a follow-up change, to keep this a pure
restructuring and keep the locking-model transition atomic on its own.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 46 +++++++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 40cd413e0ed49c118421ce3dec77bb2df08cf042..ec6aaa878471ff210264a35e4aa66dfb1e63ed3b 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -2142,33 +2142,6 @@ static int it6625_parse_dt(struct it6625 *it6625)
 	return it6625_parse_endpoint(it6625);
 }
 
-static int it6625_init_v4l2_subdev(struct it6625 *it6625)
-{
-	struct v4l2_subdev *sd = &it6625->sd;
-	int err;
-
-	sd->dev = it6625->dev;
-
-	v4l2_i2c_subdev_init(sd, it6625->i2c_client, &it6625_ops);
-	sd->internal_ops = &it6625_internal_ops;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
-	if (it6625_v4l2_init_controls(sd)) {
-		dev_err(it6625->dev, "Failed to initialize v4l2 controls");
-		return -ENOMEM;
-	}
-
-	it6625->pad.flags = MEDIA_PAD_FL_SOURCE;
-	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	err = media_entity_pads_init(&sd->entity, 1, &it6625->pad);
-	if (err < 0) {
-		dev_err(it6625->dev, "%s %d err=%d", __func__, __LINE__, err);
-		v4l2_ctrl_handler_free(sd->ctrl_handler);
-		return err;
-	}
-
-	return 0;
-}
-
 static int it6625_check_device(struct it6625 *it6625)
 {
 	static const u8 chip_ids[][2] = {
@@ -2254,9 +2227,24 @@ static int it6625_probe(struct i2c_client *client)
 	}
 
 	sd = &it6625->sd;
-	err = it6625_init_v4l2_subdev(it6625);
-	if (err)
+	v4l2_i2c_subdev_init(sd, it6625->i2c_client, &it6625_ops);
+	sd->internal_ops = &it6625_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+
+	err = it6625_v4l2_init_controls(sd);
+	if (err) {
+		dev_err(it6625->dev, "failed to initialize v4l2 controls: %d", err);
 		goto err_clean_work_queues;
+	}
+
+	it6625->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	err = media_entity_pads_init(&sd->entity, 1, &it6625->pad);
+	if (err < 0) {
+		dev_err(it6625->dev, "%s %d err=%d", __func__, __LINE__, err);
+		v4l2_ctrl_handler_free(sd->ctrl_handler);
+		goto err_clean_work_queues;
+	}
 
 	err = v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (err)

-- 
2.34.1


