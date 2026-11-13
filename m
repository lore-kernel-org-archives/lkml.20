Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537707;
	b=t9tb+zKtaLO0X/5HCYtYMSU4UsYj599xCOA89tOK072+8fkxyS0DMFdYooONOdZXBXL4
	 yWxyiPiP5Vzqqw4dBCqMXdL3kZpoMQj802QyuNtPFx4hk98omQC8XjLNBwfVeySuRheRn
	 /FM08KZIbFafoP+4kqq64RyhADmY6GVdI3cIH3DhslolFka1QDBtkDa0t5BLsFHYy2Xbs
	 SEm8e2dlmCbsRXXIcpiuzwiWNjF42N+kf1HzR+rJYzhVgSwMKFUYIW6wNutF0zPOopghT
	 UNESwwFH515gPKj71Rt6gYGiNWAhdfn0DXLlO8cp7U07tcDInF0dc4cY9DIWPgeyBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
	b=0lIDF8qikmXVrhP4fPcZbqzyUNoKSV8L4IktpAg5DpFGydDitjiP0shoV8hhof3dmqId
	 5f6kPn1ypiyahGV5Y91DV9/4jXpgC/CBv82YEftb6lmurGRfePCnuxy8oI2x3xJ//db9b
	 WIY80vcsDLYZ5bcTFgr+Xa/ZRRgMUSZq/Cawqxx0jM3fXM3b4BES5/qB2FFNu9juDZmK3
	 F1lXAS3VSMGmEF7kc7G8zGZxytRe1m8oeJI6Br/7ztIwdeLy+tsXXWM/sPm6LOxOUlh2R
	 9t7UuOwtgtXb/k5Rt2Da/QBqkdnAfgIgHhmMtAC15j18OauVVVfQa5xDPAohcdvKhlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JX/bkH2O";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10627606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10627606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX/bkH2O
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e90071735so82352eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537706; x=1795142506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
        b=JX/bkH2OO+zkH+u0TLXi4XhLMiHSB1i855Dks24O10Z2oMf3yWTg+My2CweZ4JQBUc
         iF7ufnyeh9vfkWa3FS7oJrGcuukGxObZ/4M8hnL9Mz98umtbyP1ryErvtUICym6YEPLf
         2cvUJ4d6rilQZGmuEFedyjGgGE49ZvJQj/wAhzzn2OQIXpPW17s4MeU0h1JjCei6kK3e
         l8F7Wj5zUWRUhl7bNrs2gg35bT21uOltlUkLRnX7rZkmZ/iDxqnJxbA+AWH0STFKXvbz
         eztr0tcjyhDZoDTye9Ih+LQT9VNkvVY/9mrUcGlrAq05wj/jKslwYuy+9D9KhiJF3RL0
         VgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537706; x=1795142506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u6lNp8lnIwL0NWxmhBen6oXEwfx6srUbxa1sij+LFbA=;
        b=UXzCOZIKbvNebe1jpUiF7P0Sp6x59wkOs6amdeIOpBWKPDqO88H+ToNMiPBZDw8EZk
         a3Z7HbEvs1UrE3/WG3goFiMq1a3GtV9hWxBMykHF491VkRjLCrcBbteY04fPk6v6x0xT
         iiH2lI2iaD+QE7j/6ZIaA7JP/xVYFnaJlERsq5qioTFuWd0xAVg4xcMdYTZsW17NHRaV
         mVGEhxD01oqIAuqIBztDBz/FzS/m0nFfsgaln4rJ0EKnLhWczPRnDVJ/YKTlbl6F3Jhp
         ubGWIR2veWfNBg6ltx9UGOYlG705hjSgM2Lb3t3VxXuFrv2/fx2Ia4703ZOMslJzFRJG
         gxwg==
X-Forwarded-Encrypted: i=1; AL+hErHiuK1p59Dfua2C+2ozzeSGannH/eZqgkcdzbWT1NIQekWyawuAkK4zoJSBZp7C8q44frAge7FXGlnj82E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I//P1kfbmtfJXc9iCTJp1DvXHKOSxy5gRosibt0oyeTjF8Mzk
	ZTqR5ecZGzgGm5iYMwDXI8BfKZpoIkat+5PbG9xTEkRNjngmUTA2W9cX
X-Gm-Gg: AYBFou3kBmOectG4NM/DyotcqowoG+L5hiFyJfBDlt8YCX4q7xtrOp39JqtoBryXdig
	NrQk+rKyazRCuCG20HGRB9Kb7dzO1CKWwCT0790pTLOjMzNi2E5H45GT8eLs6ArGAeJTtJUxG5V
	IJYMR6YVASJoCEAJ4UGfK+cpz+hpa9BbN1C2DtGfTG3UsEYjOIiwEHrl6ZuiGiJvNDpffqdJv/L
	eNyQOaQdNowhH4vbOs93fmiSgPQn1NTUskyIdmyJRHwrKvNioBmAq3boRQPjxEh30NNqliIys6L
	13IP6Udvc821uk8CePUIl3n7KW4l+qj0PXY3Py/C5F1BBQtKLe+KYa3zoj1dF7hXl8+QoxnZo39
	8ms0M37se3th78yr3vsU+Rc3qFuWQVPF9Kfhx9jPiMvBijoZDO6xxlVPvFs+cc6XJnf7jrT34Bj
	8kQDw7kXBKrnhvcLFaEpd8lFABFMzM9j9XIFtdT5lbXdfmgDniHXmR3WjUgGMMzDXRgZuwajXBo
	f11IH7ddPyqDVTfs2KWXJc3XfgHmKVTIqYSxib2psRLKwLju5jJMYWqaZ2bAzh3y0BD8K0KvD0i
	ZBnxpQZCYd/lKGyfHS+9mbyKuMnGUiICjfEsJjk4IUMr96Q+JM6JGSn9Pe+aAu7S7kQjI8qMpYf
	W/eRJWtMNKdMDq0J9HzO44ct9W6I3XGPwHFtNstEvJESJvLVMAeA7T+J+RCGdYgMC+fwZX6DWxn
	fTyn755x0rDg==
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr1701515eec.1.1794537706078;
        Thu, 12 Nov 2026 18:41:46 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:45 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] media: i2c: ov7251: Use sub-device active state
Date: Fri, 13 Nov 2026 11:40:55 +0900
Message-ID: <20261113024059.1087031-6-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

Port the ov7251 driver to the sub-device active state.

The driver kept its own copies of the active format and crop rectangle
and selected between them and the try state with a pair of helpers
switching on the format's "which" field. Move the format and the crop
rectangle to the sub-device state for both the try and the active case,
drop the helpers and the private copies, and use the v4l2_subdev_get_fmt
helper for get_fmt. The init_state operation now fills whichever state
it is given through set_fmt, so the explicit ov7251_init_state() call at
the end of probe goes away; the exposure control gets the default mode's
range at creation instead of being adjusted by that call.

The driver mutex went away with it. The control handler's own lock now
serves as the state lock as well, so the control framework and the
sub-device core serialise the pad operations, the control operations
and the stream start between them; s_stream takes the active state lock
itself. The mode pointer, which the frame interval operations still
select by frame rate, stays and is protected by the same lock.

Behaviour is unchanged for applications. As a side effect the core now
reports V4L2_SUBDEV_FL_HAS_EVENTS for the sub-device and handles control
event subscription, so v4l2-compliance's VIDIOC_(UN)SUBSCRIBE_EVENT test
passes without the driver having to declare the event operations.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/linux-media/at863XdUDea7JDA8@kekkonen.localdomain/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 154 +++++++++++--------------------------
 1 file changed, 43 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 81520833120a..c7489c6305aa 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -131,8 +131,6 @@ struct ov7251 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 	struct clk *xclk;
 	u32 xclk_freq;
 
@@ -158,7 +156,6 @@ struct ov7251 {
 	u8 timing_format1;
 	u8 timing_format2;
 
-	struct mutex lock; /* lock to protect power state, ctrls and mode */
 	bool power_on;
 
 	struct gpio_desc *enable_gpio;
@@ -1042,8 +1039,6 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 					     exposure_max));
 	}
 
-	/* v4l2_ctrl_lock() locks our mutex */
-
 	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
@@ -1131,52 +1126,6 @@ static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
 	return -EINVAL;
 }
 
-static struct v4l2_mbus_framefmt *
-__ov7251_get_pad_format(struct ov7251 *ov7251,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad,
-			enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov7251->fmt;
-	default:
-		return NULL;
-	}
-}
-
-static int ov7251_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *format)
-{
-	struct ov7251 *ov7251 = to_ov7251(sd);
-
-	mutex_lock(&ov7251->lock);
-	format->format = *__ov7251_get_pad_format(ov7251, sd_state,
-						  format->pad,
-						  format->which);
-	mutex_unlock(&ov7251->lock);
-
-	return 0;
-}
-
-static struct v4l2_rect *
-__ov7251_get_pad_crop(struct ov7251 *ov7251,
-		      struct v4l2_subdev_state *sd_state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_crop(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov7251->crop;
-	default:
-		return NULL;
-	}
-}
-
 static inline u32 avg_fps(const struct v4l2_fract *t)
 {
 	return (t->denominator + (t->numerator >> 1)) / t->numerator;
@@ -1221,12 +1170,9 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 	int vblank_max, vblank_def;
 	struct v4l2_rect *__crop;
 	const struct ov7251_mode_info *new_mode;
-	int ret = 0;
-
-	mutex_lock(&ov7251->lock);
+	int ret;
 
-	__crop = __ov7251_get_pad_crop(ov7251, sd_state, format->pad,
-				       format->which);
+	__crop = v4l2_subdev_state_get_crop(sd_state, format->pad);
 
 	new_mode = v4l2_find_nearest_size(ov7251_mode_info_data,
 				ARRAY_SIZE(ov7251_mode_info_data),
@@ -1241,16 +1187,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
 					 new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		vblank_max = OV7251_TIMING_MAX_VTS - new_mode->height;
 		vblank_def = new_mode->vts - new_mode->height;
@@ -1258,17 +1204,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 					       OV7251_TIMING_MIN_VTS,
 					       vblank_max, 1, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ov7251->current_mode = new_mode;
 	}
 
-	__format = __ov7251_get_pad_format(ov7251, sd_state, format->pad,
-					   format->which);
+	__format = v4l2_subdev_state_get_format(sd_state, format->pad);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
 	__format->code = MEDIA_BUS_FMT_Y10_1X10;
@@ -1281,27 +1226,21 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 
 	format->format = *__format;
 
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
+	return 0;
 }
 
 static int ov7251_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
-		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.format = {
 			.width = 640,
 			.height = 480
 		}
 	};
 
-	ov7251_set_format(subdev, NULL, sd_state, &fmt);
-
-	return 0;
+	return ov7251_set_format(subdev, NULL, sd_state, &fmt);
 }
 
 static int ov7251_get_selection(struct v4l2_subdev *sd,
@@ -1309,15 +1248,10 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
-	struct ov7251 *ov7251 = to_ov7251(sd);
-
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP:
-	mutex_lock(&ov7251->lock);
-		sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
-						sel->which);
-		mutex_unlock(&ov7251->lock);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r.top = 0;
@@ -1341,14 +1275,15 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&ov7251->lock);
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov7251->dev);
 		if (ret) {
-			mutex_unlock(&ov7251->lock);
+			v4l2_subdev_unlock_state(state);
 			return ret;
 		}
 
@@ -1382,12 +1317,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 		pm_runtime_put(ov7251->dev);
 	}
 
-	mutex_unlock(&ov7251->lock);
+	v4l2_subdev_unlock_state(state);
 	return ret;
 
 err_power_down:
 	pm_runtime_put(ov7251->dev);
-	mutex_unlock(&ov7251->lock);
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -1404,9 +1339,7 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
-	mutex_unlock(&ov7251->lock);
 
 	return 0;
 }
@@ -1418,7 +1351,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
 	int vblank_def;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
@@ -1427,7 +1360,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
 	if (new_mode != ov7251->current_mode) {
@@ -1435,16 +1367,16 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
 					 new_mode->exposure_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		vblank_def = new_mode->vts - new_mode->height;
 		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
@@ -1453,21 +1385,18 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 					       new_mode->height,
 					       1, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
 		if (ret < 0)
-			goto exit;
+			return ret;
 
 		ov7251->current_mode = new_mode;
 	}
 
 	fi->interval = ov7251->current_mode->timeperframe;
 
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
@@ -1478,7 +1407,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 	.enum_mbus_code = ov7251_enum_mbus_code,
 	.enum_frame_size = ov7251_enum_frame_size,
 	.enum_frame_interval = ov7251_enum_frame_ival,
-	.get_fmt = ov7251_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov7251_set_format,
 	.get_selection = ov7251_get_selection,
 	.get_frame_interval = ov7251_get_frame_interval,
@@ -1583,18 +1512,20 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	const struct ov7251_mode_info *mode = ov7251->current_mode;
 	int vblank_max, vblank_def;
 	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
-	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	ov7251->exposure = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-					     V4L2_CID_EXPOSURE, 1, 32, 1, 32);
+					     V4L2_CID_EXPOSURE, 1,
+					     mode->exposure_max, 1,
+					     mode->exposure_def);
 	ov7251->gain = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 					 V4L2_CID_GAIN, 16, 1023, 1, 16);
 	v4l2_ctrl_new_std_menu_items(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1704,14 +1635,10 @@ static int ov7251_probe(struct i2c_client *client)
 		return PTR_ERR(ov7251->enable_gpio);
 	}
 
-	mutex_init(&ov7251->lock);
-
 	ov7251->current_mode = &ov7251_mode_info_data[0];
 	ret = ov7251_init_ctrls(ov7251);
-	if (ret) {
-		dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
-		goto destroy_mutex;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
 	ov7251->sd.internal_ops = &ov7251_internal_ops;
@@ -1726,9 +1653,16 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
+	ov7251->sd.state_lock = ov7251->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(&ov7251->sd);
+	if (ret < 0) {
+		dev_err(dev, "could not initialize subdev state\n");
+		goto free_entity;
+	}
+
 	ret = ov7251_set_power_on(ov7251->dev);
 	if (ret)
-		goto free_entity;
+		goto subdev_cleanup;
 
 	ret = ov7251_detect_chip(ov7251);
 	if (ret)
@@ -1769,11 +1703,9 @@ static int ov7251_probe(struct i2c_client *client)
 	ret = v4l2_async_register_subdev(&ov7251->sd);
 	if (ret < 0) {
 		dev_err(dev, "could not register v4l2 device\n");
-		goto free_entity;
+		goto subdev_cleanup;
 	}
 
-	ov7251_init_state(&ov7251->sd, NULL);
-
 	return 0;
 
 err_pm_runtime:
@@ -1781,12 +1713,12 @@ static int ov7251_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(ov7251->dev);
 power_down:
 	ov7251_set_power_off(ov7251->dev);
+subdev_cleanup:
+	v4l2_subdev_cleanup(&ov7251->sd);
 free_entity:
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
-destroy_mutex:
-	mutex_destroy(&ov7251->lock);
 
 	return ret;
 }
@@ -1797,9 +1729,9 @@ static void ov7251_remove(struct i2c_client *client)
 	struct ov7251 *ov7251 = to_ov7251(sd);
 
 	v4l2_async_unregister_subdev(&ov7251->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov7251->sd.entity);
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
-	mutex_destroy(&ov7251->lock);
 
 	pm_runtime_disable(ov7251->dev);
 	if (!pm_runtime_status_suspended(ov7251->dev))
-- 
2.56.0

