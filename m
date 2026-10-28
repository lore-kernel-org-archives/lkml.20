Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186534;
	b=RoIxsod13QCtcITUCixoAcp8yN4nRKVxf95DtdFotHosS7uQC7x0buUBct6+m5/eGH2u
	 onnyNX3LQ1EEF8nNFDCQ5bPrios516t0x2HOWqmpSXPVhENneXoOZpdSlQE8FZcL2xFBO
	 hTs3F9BYnySuEvnY2eHoUqjd9Tnd+yL1k06agYo+Qh5UErZ4d9Vqw95OvHKqvfRtRIXKp
	 JroCU5fd9H00l2L64Dyg7ef0T4J2EVdwcilt4PnVc6rBrvBKZYeVTDw6gS2pQI6f9MuTn
	 YyKbCq0kjI5cZGnP7OANTyZvwj+B8M6LNVPaI9+CGpcXFMZH7STdEr9nvd9VSbl/wFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
	b=K3gA45LPZakBy726wFOO/Dg/4MG6sY8g2F3XNoPA3oWfGy7Jk+pyBIdfEVRzOtWOfyxI
	 9CxqfzRmm2KDOZpn6NDAvlbm4ZJv+zCWsbSo8c69WdSJh+ge5qYeJIJn3EGtvZrCSH0z2
	 k6AAxmyr5SMveH92KsO/W8JgPUSsTJDktjHh3PFnYVBqzmGYzyUChKYlrbqMqgeFxc/OW
	 8xZhosNjh2VkaZO31YZjN7FfhG0u/iPR3e/YwLg4J4896ZD5NCKBfw8V9dUNmDu70h4as
	 L/vR+zAUPW4Tm7et2uvPtXgPYXF9Whl+Dj4Q/5bQ3WQ/EBCLAJvmmd0tB1thnVqNfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1leh29n;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13D60A2638
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE13D60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1leh29n
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9ae47b00cso1346675ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186533; x=1793791333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
        b=m1leh29n9ZvLnc9HfzJL3HREV0Um85dQjLJ6fHl6jZbUjuy+MNirq5wswy9tua8Mx0
         gg2O8hbpklz57RrMW0ZLeQumm7UE+36+Ebp0nWPO2fd7q4A+GrCgkAGjrAG6ykc5j86h
         12+7GkX85rlGrBsxDpATYeGmVro0F7G6B8tUQ/roiHExBbcMY5gWgiMd/+h04HPu36Ry
         Ck270BF//HjlYMp1pGcWlqNrvsIwIv9IvbMclIQSTWFQz/7Boop4ef9ZE248zODXH+5v
         B+7dv6HBRvwgs737VzrTku4GvVcUpELZ7f0RjfYxxC2Bxod86UuHv2bnni5A6nipVZ5d
         azcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186533; x=1793791333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54m2TSB1ZZXs4hqFBBBvsB03IQL64h1FC7FnVxPFkyY=;
        b=lpa6HCHkOM1AIA8hVcvw8OYc/OxJ40G59f5YTs6/I+IKAx6kSr1u2qFgSV/aYZcG7x
         pwzoW6WYtJH2/9Bf8IUVFgP40wSLZzLRSMhALySyD37U557kfxGJbLG6KGUHUAXbecEm
         b6LR0h2KOHkid2/pYGNEKFaA2ECtwTMvfU6Jy64u9xH4c1CS8U6qFMCFnhou0Ip13NZh
         zt4DvLXVVtOFCn6AGqkTE+a0FMp4P7idHysssr/wvhZKKKlT8fPQvEIwg5Qm0PN1akhg
         rwRwWTWE3S1C2GvLU8RGzUVoU/z5dOk1KPw9xrXGM3Rk3HQhW4fB3uDv60B81h+EKXlk
         qT1w==
X-Forwarded-Encrypted: i=1; AKwUvBwb44QDPqDS4iLoIeJaqcMD9o5rDcMfZahjz35fPCZ4pisRKFO1ESrF9I5xUz6W306Zan+gxzJq4P/DIK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5uC3Vlq/Sw/oggYMp1DZ9kGJ+jVlfLopqp99fIAdZhN256nGZ
	KQPDZtZjXFUdLmO+M6EpsmxOFjL6hvH3wZyCjzxFmmU+lMFAV76mLJKAxtLH38Fgze8=
X-Gm-Gg: AYBFou0vnq3RohAq4WRH7nVZHAbpqPCd7QrZJpRkVJgwChkhA1i6kERszP8N2yAl0JG
	vHQff4+QAoGmZ9zZrN2zrt7Nf78X9HpHBx6O1TTt0XiAVrTJUvyG9ZnAfVOoz1D6HtJQenHP1uU
	aYZ369mKWBk6zQkxSPi3JdL3DJQqxDbtl5MQ0MllTsW62fUU4yxgSfl1EGWPp93xVqVJMnBu+ch
	dGv42+5lPiEK3ECbsv7nb5MHEHLR+c9cktuZB4BvL7FV7W1k1crXBucUHRnLEVG1I+DyvsRlp5y
	u10FwL7fmDY24DLCFGlh9BdA+85+usNcHWVwgnw6eERVG5rdImFB51HUsb8Sm/x2/IVsiEiTsql
	bRCJtPuxeKt5GOhwQliEiYe5wUpI/QbybphOGNViM4nL212TTvhsHlkj/JbSE6q+mFEVkFM6fUE
	In2jpRpVrW2BSc/zCEaqutDgqumXULNF3kJtWl9XSTzlusm+MMsuHgtfpjYd/4CCIE00M+LmWRx
	bVYuECB1u58lFoG/4NXYvenJvjjvCXx427HwHsLUhkqKCM3x1aYbfmwUaVc5YME2K6Ut5E57Qut
	ZzSVzbBpbTz8lHNvGSC3d7xWHIo5ZH5XQu/ii8nrB/XGYvnpY3cwGx+F9vITjMCIbNDxkZOc5gw
	gWHWwJewjTd+eWc82SvYLxQh750pe0ys2F1AXPCJg+caxjnw2+Z7FJh65/xrS4VF0eBxkOBLEmF
	G5CD8x7ZglL49STOob2G4=
X-Received: by 2002:a17:903:1b25:b0:2e2:d929:9c7c with SMTP id d9443c01a7336-2eb003297f4mr35850435ad.2.1793186532991;
        Wed, 28 Oct 2026 04:22:12 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:12 -0700 (PDT)
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
Subject: [PATCH v2 5/9] media: i2c: ov7251: Use sub-device active state
Date: Wed, 28 Oct 2026 20:21:50 +0900
Message-ID: <20261028112154.855185-6-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 154 +++++++++++--------------------------
 1 file changed, 43 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 859bf6c42341..8277e28ac645 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -130,8 +130,6 @@ struct ov7251 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
 	struct clk *xclk;
 	u32 xclk_freq;
 
@@ -157,7 +155,6 @@ struct ov7251 {
 	u8 timing_format1;
 	u8 timing_format2;
 
-	struct mutex lock; /* lock to protect power state, ctrls and mode */
 	bool power_on;
 
 	struct gpio_desc *enable_gpio;
@@ -1041,8 +1038,6 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 					     exposure_max));
 	}
 
-	/* v4l2_ctrl_lock() locks our mutex */
-
 	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
@@ -1130,52 +1125,6 @@ static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
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
@@ -1220,12 +1169,9 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1240,16 +1186,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1257,17 +1203,16 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
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
@@ -1280,27 +1225,21 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 
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
@@ -1308,15 +1247,10 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
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
@@ -1340,14 +1274,15 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
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
 
@@ -1381,12 +1316,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
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
 
@@ -1403,9 +1338,7 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
-	mutex_unlock(&ov7251->lock);
 
 	return 0;
 }
@@ -1417,7 +1350,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
 	int vblank_def;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
@@ -1426,7 +1359,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
 	if (new_mode != ov7251->current_mode) {
@@ -1434,16 +1366,16 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
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
@@ -1452,21 +1384,18 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
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
@@ -1477,7 +1406,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 	.enum_mbus_code = ov7251_enum_mbus_code,
 	.enum_frame_size = ov7251_enum_frame_size,
 	.enum_frame_interval = ov7251_enum_frame_ival,
-	.get_fmt = ov7251_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov7251_set_format,
 	.get_selection = ov7251_get_selection,
 	.get_frame_interval = ov7251_get_frame_interval,
@@ -1582,18 +1511,20 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
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
@@ -1703,14 +1634,10 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1725,9 +1652,16 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1768,11 +1702,9 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1780,12 +1712,12 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1796,9 +1728,9 @@ static void ov7251_remove(struct i2c_client *client)
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

