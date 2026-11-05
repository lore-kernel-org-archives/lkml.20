Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839756;
	b=3hXK/aUAq97EU/29ThpDW35M1LfKNQprAUnrKcGyRnQkgepoChmQyKjE5ZVAT0cxR12D
	 ok7P8AOMQQS48nx+Gtb5JLFEdllcFz/oW3GZhtl8oI8GFQwlNohbwHqSgleJtZQfUYaaH
	 eSi0O+xQcxSixd+ru1jVZB/ieV905ARNrlzIx2fETfusnBckIaVy8aF3WSoJv4rEjuMmz
	 iQFkEnMUe92INXc5dVIHLYtgU7QaI/YxqJFjhntyOZpeOSfQzmX5BbBbnCcKN09Kbj5WL
	 tknxNzcZ7Osb2FzrQ/YND5/hl5/enhmXJZtzQlggx6qfLYfMZUjWKTunOkeCQLVnVzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CpS7GLzyshZWps/kEoS9IRvjJQudydLT99khEiIz7VU=;
	b=1yGH8OsG3AuFyFipE1A/q8c8w9evXDvzTAYpDS27t5Te6wji4u5IXfOgDCDzaWoCTCHC
	 vHLcsQkM1P9I5kzeFyk9qQPBvXrkqjRvP6+0eANWH1mGZENwZAA965fZecveKDQCGka6q
	 x7kQqoTbCEc8BGJJoEeoDr85Z325etMi5noPGbwqXcONQgwo+p3q2V1UAcqIjxHEgr4kB
	 ptFfXBsPmuygKMLzGpedXO0EJjcKKpXBuUvHmE6TPw6vz/QgvNK0FC9FGgQfPs+euEDoA
	 /ptWUOvb4WzHIiGrHjn3dtxIBHN1gQvYqtpQlJNmEoY0dYaANHdlt1fUGCnykvLIq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSyi771a;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95B606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F95B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSyi771a
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15168265e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839754; x=1794444554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpS7GLzyshZWps/kEoS9IRvjJQudydLT99khEiIz7VU=;
        b=jSyi771aSl1Rx4d1iTMMy3LLn2WobFNClF7Q1jPZHE35svH+Jbwk210AN47Q0QgFmf
         v1iILxJ9rIsDPBJx08DuZvs9EIvPWwS3vS6Gu2GpdwsIyZWm1t6KYXQ/Gz7caJgQQ+Eu
         +XkJaUkzQ3HcYhk9t8vR1Gu8cKoJ5/LUzhhwHHLkRPmHJTHrcfe+XG/Vx7515l+X2EtW
         OcW5VZ1a5WMrFgX8e+KntpjbaTPnjdUC3bH68LgZkEZDPDMcjtUrfxOC8dJGc52w1XtV
         n+0PBCqYiqPuOsokZsH/7HIBO86FPRYzLwbnrr4dyjWIInPpFANRcdTdih4prlSqG+CP
         e4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839754; x=1794444554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpS7GLzyshZWps/kEoS9IRvjJQudydLT99khEiIz7VU=;
        b=pk4MQfutZdhFhctlcE9hGtpLs017mApVaqpdauOnTznj6drgMpnoSbZ1+9VUCWHzvS
         uN1DcOG2lCktwTPEG7j4Lj0kxDmBwH01JrVQdvV6jNjdR6nmX0sIrokD/EISJCibfrNV
         WkvrW+igC8ICrBQvh74T/QYa9B0n1SIwFJZNdneVgriiSiKocVZ48qX+dJY/p57oq+JI
         I6EhjFFtaUplfaTjtpzOUQi+7+1/R3i1jsSjlGnANd4lDIE4l2NrA/LVvT+DGfCTWF9C
         j+5/BpKzQ5eydrO7ZplZCIfL+23PhekQHiJmbWi3CHKeeXiMx65q2p4/3HKbA6yLbL7g
         IYtw==
X-Forwarded-Encrypted: i=1; AKwUvBxx3dlAPqWBUsd3EvTaZXpH6RlW+OjYJTSrEtTJblmg9+LQVu5m5YxSvbBDLAehiKVhVc0rRwSDOE6YV1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RY5ZIswNlSbjimLaGJVR6z+Ae7z5h/3ep6IXHR1c73nYTAF0L
	Kwp/zmQOJ6IUFAW30MkXAV5DGuvCusiiqo8RfH9QGqfIVQ1JoDb6J6aS
X-Gm-Gg: AYBFou0+xeTF/tIOqEhPDw92y0EbXjxZB+7+vAnbDxqVs/B/t0jX0B1FBGBM8pfhsiw
	6qN23tsRaKIS10crsl80oFOIDp19V9wbGU6bRtSYREm1QtewwpHZwRYv1FsPcvEE4hfU7t/H9zM
	cXEXSvF2iUJoAxhWuhcU9DNgYGRb64LLF0lMRx4mXYAgR+WMUTC4mt37FCT/NeW44JAaU6tvuQU
	OXIC+edqeyvDVzmdGzDmyBdtXTiU8DFa067JZWoA1VMMx9Dm4cm/XEbyolb5zV3mvUayF0EUzb3
	LmYQwLRc+an3EH5sROBVdPnVHY5kg3YoUbyiOm63mpAt7YvDUj0YzdhbPlZEEhz3LMeDq0NUTbs
	I36eV7aKsrxGhbYMaQHhcJYuvZ4eJC2fJmNtE7ABTgyDYJ/n+wxI2DqubiWp461LJUPY3S3gEvF
	TYYCjycoV4pl49jyooygeWaKu1+Npd546GEnf1pApVWOgywKWPESB2RmRFNOYWmkaQ1w8DA7hl/
	02+Zt6mtXTYkVLk0GNdSoTdPrpXWhBvbQdazys7uEUmihqoVV6y3j89YVEUTztZU8kWQRY7zejJ
	L84XPlx/yHkuApIE5IgxKhaZ6z9n4CFY0xSTEfmqCZy0ZhXGEIebxumSeAq+8nBF/Gx1GhH2kZa
	kOoT/w/nPVw==
X-Received: by 2002:a05:600c:6087:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ac1765ce52mr372660305e9.20.1793839754380;
        Wed, 04 Nov 2026 16:49:14 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm21341515e9.9.2026.11.04.16.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:13 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: vd55g1: Use the control handler lock for the subdev state
Date: Thu,  5 Nov 2026 00:49:05 +0000
Message-ID: <20261105004907.150545-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105004907.150545-1-fernandorimoli11@gmail.com>
References: <20261105004907.150545-1-fernandorimoli11@gmail.com>
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

vd55g1_subdev_init() sets sd.state_lock to ctrl_handler.lock before the
control handler is initialised, while the pointer is still NULL, so the
subdev state gets a mutex of its own. vd55g1_s_ctrl() under
VIDIOC_S_CTRL, and __v4l2_ctrl_modify_range() and
__v4l2_ctrl_handler_setup() under set_fmt and enable_streams, then run
without the lock they assert, and format and control changes can race.

Initialise the controls first and finalise last. The blanking ranges
depend on the format, so set them, and the default frame length, once
the active state exists. vd55g1_grab_ctrls() now runs with the lock
held, so use __v4l2_ctrl_grab().

With the control handler set, v4l2_subdev_init_finalize() also enables
control events, which v4l2-compliance reported missing.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 69ffb3a..9f737ea 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1113,10 +1113,10 @@ static int vd55g1_ro_ctrls_setup(struct vd55g1 *sensor, struct v4l2_rect *crop)
 static void vd55g1_grab_ctrls(struct vd55g1 *sensor, bool enable)
 {
 	/* These settings cannot change during stream */
-	v4l2_ctrl_grab(sensor->hflip_ctrl, enable);
-	v4l2_ctrl_grab(sensor->vflip_ctrl, enable);
-	v4l2_ctrl_grab(sensor->patgen_ctrl, enable);
-	v4l2_ctrl_grab(sensor->hdr_ctrl, enable);
+	__v4l2_ctrl_grab(sensor->hflip_ctrl, enable);
+	__v4l2_ctrl_grab(sensor->vflip_ctrl, enable);
+	__v4l2_ctrl_grab(sensor->patgen_ctrl, enable);
+	__v4l2_ctrl_grab(sensor->hdr_ctrl, enable);
 }
 
 static int vd55g1_enable_streams(struct v4l2_subdev *sd,
@@ -1580,14 +1580,6 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
 	struct v4l2_ctrl *ctrl;
 	struct v4l2_fwnode_device_properties fwnode_props;
-	struct vd55g1_vblank_limits vblank;
-	unsigned int hblank;
-	struct v4l2_subdev_state *state =
-		v4l2_subdev_lock_and_get_active_state(&sensor->sd);
-	struct v4l2_rect *crop =
-		v4l2_subdev_state_get_crop(state, 0);
-	struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_state_get_format(state, 0);
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 16);
@@ -1645,15 +1637,13 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 					     V4L2_CID_HDR_SENSOR_MODE,
 					     ARRAY_SIZE(vd55g1_hdr_menu) - 1, 0,
 					     VD55G1_NO_HDR, vd55g1_hdr_menu);
-	hblank = vd55g1_get_hblank_min(sensor, format, crop);
+	/* Placeholder ranges, set from the format in vd55g1_subdev_init() */
 	sensor->hblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
-						hblank, hblank, 1, hblank);
+						1, 1, 1, 1);
 	if (sensor->hblank_ctrl)
 		sensor->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	vd55g1_get_vblank_limits(sensor, crop, &vblank);
 	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
-						vblank.min, vblank.max,
-						1, vblank.def);
+						1, 1, 1, 1);
 
 	/* Additional controls based on device tree properties */
 	if (sensor->ext_leds_mask) {
@@ -1673,12 +1663,11 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 		goto free_ctrls;
 
 	sensor->sd.ctrl_handler = hdl;
-	goto unlock_state;
+
+	return 0;
 
 free_ctrls:
 	v4l2_ctrl_handler_free(hdl);
-unlock_state:
-	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -1915,6 +1904,9 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
 
 static int vd55g1_subdev_init(struct vd55g1 *sensor)
 {
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
 	int ret;
 
 	/* Init sub device */
@@ -1930,6 +1922,14 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 		return ret;
 	}
 
+	ret = vd55g1_init_ctrls(sensor);
+	if (ret) {
+		dev_err(sensor->dev, "Controls initialization failed %d\n",
+			ret);
+		goto err_media;
+	}
+
+	/* The state shares the control handler lock, so finalize last */
 	sensor->sd.state_lock = sensor->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&sensor->sd);
 	if (ret) {
@@ -1937,19 +1937,24 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 		goto err_ctrls;
 	}
 
-	/*
-	 * Initialize controls after v4l2_subdev_init_finalize() to make sure
-	 * active state is set
-	 */
-	ret = vd55g1_init_ctrls(sensor);
+	/* Set the format dependent ranges and the default frame length */
+	state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	ret = vd55g1_new_format_change_controls(sensor, format, crop);
+	if (!ret)
+		ret = __v4l2_ctrl_s_ctrl(sensor->vblank_ctrl,
+					 sensor->vblank_ctrl->default_value);
+	v4l2_subdev_unlock_state(state);
 	if (ret) {
-		dev_err(sensor->dev, "Controls initialization failed %d\n",
-			ret);
-		goto err_media;
+		dev_err(sensor->dev, "Controls update failed %d\n", ret);
+		goto err_state;
 	}
 
 	return 0;
 
+err_state:
+	v4l2_subdev_cleanup(&sensor->sd);
 err_ctrls:
 	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
 
-- 
2.43.0

