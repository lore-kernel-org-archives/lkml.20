Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283526;
	b=s0PgDv76czOmTCuWSRosbWi669oLBhJTr7baK9LYVavHNXPCZPRNACHF6jlSnkL86CM1
	 W+m79EvULvRzf5YWi4LK/ta0s+MSc1inmEPnWKA3qN+oM90qP5ENAvb417dYE4jw+Lu2n
	 CTDbf7zyBoKL1vN+AX9cpDCkbk+OG/U+uMR2O6qavr0VOtbfBbTrzLkIhHCjhzG7eHmkF
	 ouVqvgvr/+3Kb/vgjJn1bfVtTl6n9kOPPcgQpEiUibUn2RdBlgZ1hSrdnsKSv5yPUxKRH
	 02QbGdL0kQsUTlFjFd73lQ6eXr3CudPF+5gAPcsJPF02DyA9mcBLpwsifXFienmWiyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
	b=x0hXW1XzADVHHEFI9neH9hqfGPTS5lAPiCsdQHrnqtDXuiTnSHGENjrUlXcIKTKXvKFq
	 Lpwoz0uv1iHzkfQw/BJQYkPv05jBdMsbxYmVYJ1WOWNQgmtCfi3smPCwlGjFAHIIUKoFQ
	 ZnlH1VuqvYJTojJvH42vhGIMbMluRW78LlOC24NwyFVdXywt83CyWfy5LyraO+g22a3Rx
	 Cr2NDcgw5ULF3ife8yruwS4aFgOOhfziwZKRiS3FQUYSXIvMj6YnmPdILsYXKeLuv20pd
	 yqCHXsFUSTAOwGbn0RAGM5Azoeqiy6tgNlrBBqcgZ+ATXcvFgXUkM8vjqNVhnTcJw9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=a02Jt9Io;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65C60A380A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E65C60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=a02Jt9Io
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214af2076so18428665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283524; x=1793888324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
        b=a02Jt9IojmyINtD2Tjj+r/hL00MkpZW6e9SaNBUNWYb6We2hnsAYkMlvweg+lryf8J
         8qjnUBzot/Ft+Ursp5IZOZ5I0pu6rm47BJTOys3qwbB1LTCIcqiT+HtujEXtqPtoEVKs
         Y0tvNWBxR/GTLc/d9HZ80qOaoXbQ+PNcsSYU9YVUvtVX75+vXrVG+hy4WV6XjKUoafCk
         cglQwr7PDj33Vv+AM1ydoLz717pqwoA/flvsiGiFNuH8ZgZ1Nd8aKXzWTLCLxJiXzX6b
         WElpdhThxn4wKa96YTWCrmWaDCl6nT3dGfehAyxf8WA2tPPc17zIetWLJf4LqAq3rhIS
         sxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283524; x=1793888324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
        b=ImJTR65P7uyZfWgzvOg3cv8g3RYjo/nkLs4d4zclnthoXqO4xXd1/TDCtoAtuQFJ72
         KI2GpF4k824cE1jve5IrElwdCDlnqdx/MzyZ6drnNdD9TSbIIC6az6ry8qT/eTt5ROzR
         q9svcfu3OY5fAQ4D7mQBKWduXRwxgz8Fhni/gllDzAeLeA3VNg3wJuZ4/jHH4xo6PkjZ
         Xmhrx15b2ypHkWQmfVSXfq8LoXBXr73Xnw5N8PHeG8kd4qlHP7ZFGrc6lniE5dQUZ2sO
         lTVVHwA6U28xsj2gzQaDGA6QjRTIzktok0wXzP6Vyu/8oAZJtxiNWL2F1+M9gsDQtnZk
         ybgQ==
X-Forwarded-Encrypted: i=1; AKwUvByqnJlFre+RgmEIJp7kTX8IP5MFfQOOXGP1Ue/obu0YXgIDmQsV6ApKo57EcHkF2d98f7pimy/BTGeTQEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNmAHtuYzVvsRCa6oqkAM8cpAKoPs94NiWl1bwSIx5+eH4VR3j
	FipmK1KH8nUgLoRMP3dqwVKAYospVD9BHW+c79YVxeNkEn5xBtvx3QtlUZunK258HZs=
X-Gm-Gg: AYBFou2e+wlWJVWi1+lWBXyT10tIFvqXipXsI8ocSXDajFz/hzCR5Xsx1BiK7U7Z3TX
	nA6S21mOZUC/j8WvVgE5Tf/6qvuG6ymNhdAUYXeHWMhXnmEaZqFaXIjbkE68c0RV/5T5BNRE7jO
	P/sPex9Ooaytybkxk4REUweW//w5PofF5ERIOIvR0X42viTEAuGt8FQZvLmSggJdsU3guR5eouy
	kvaX+YNKFShySu/dhLX5y3GXVtxdN+Oz+l+0Qqvqa33r7F4zSVs8Uc2vpcAuRC7GtkM7OPLL+43
	FOSbx/U67oNOFf49x3kvCK3gmI2Hlbsh861hm3fiQ/DO9F6LyE95zuRuDQwk+sBeCpZyV+oa54u
	va/R6yeaF9/fHow1vm9PmCXetDTi6IrKuv2w/c+qTHZpekMKz0qEDUHlW3YDl7zprQovUdnC/6u
	Pdbf4RSNwWbJurVJtYTT2T8X7bT/yaTGM2ENEgM6SlVE+T6uIF5KbcPx9huAy5+cq/yog4XVqte
	tlTRcBYOtrhpBw2HdLACOHj55ZkhPmyhUR6Xgp+jHMGVzH9+ssVQVmrJzzkrxljdWvYFF/nzSb9
	7xSjnqYxMByu1+ulHfZHTm+gxT4Fo1ptd+J7Hraa1iaW00FyLvG2uRW7BBlCc/+ZhqzOTMWiivk
	iWjzN
X-Received: by 2002:a05:600c:4f55:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4abc4474a08mr1154725e9.23.1793283524315;
        Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:27 +0000
Subject: [PATCH v7 06/18] media: sony-starvis2: Allow runtime control of
 link frequency
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
Message-Id: <20261029-media-starvis2-v7-6-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

DT allows configuration of multiple link frequencies.
V4L2_CID_LINK_FREQ allows read write control.

Join these up so that link frequency can be configured at run time,
as long as the sensor isn't streaming.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 79 +++++++++++++++++++++++++++------------
 1 file changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 5dcd760c1a27..340f2ff0ef87 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -727,6 +727,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -757,6 +758,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -780,6 +782,23 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
+	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+		u32 hmax = variant->hmax_min_link_freq[ctrl->val];
+		s32 hblank;
+
+		if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+			hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
+		hblank = hmax * variant->pix_per_clk -
+					variant->active_area.width;
+
+		ret = __v4l2_ctrl_modify_range(starvis2->hblank, hblank,
+					       starvis2->hblank->maximum,
+					       starvis2->hblank->step, hblank);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Only apply control values when device is powered on (RPM ACTIVE)
 	 * and streaming (usage count != 0)
@@ -826,6 +845,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
 			  &ret);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		/* The STARVIS2_LINK_FREQ_ enums match up with the register */
+		cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL, ctrl->val,
+			  &ret);
+		break;
+
 	default:
 		dev_warn(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -940,9 +965,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1022,6 +1044,8 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
+
 	return 0;
 
 err_rpm_put:
@@ -1046,6 +1070,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1212,7 +1238,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1228,25 +1253,26 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->vmax = starvis2->variant->vmax_default;
 
-	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
-	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
-		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
-
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  starvis2->variant->pixel_rate,
 			  starvis2->variant->pixel_rate, 1,
 			  starvis2->variant->pixel_rate);
 
-	/* LINK_FREQ is also read only */
-	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
-					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_freqs) - 1,
-					   __ffs(starvis2->link_freq_bitmap),
-					   link_freqs);
-
-	if (link_freq)
-		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	starvis2->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(starvis2->link_freq_bitmap),
+				       __ffs(starvis2->link_freq_bitmap),
+				       link_freqs);
+	if (!starvis2->link_freq)
+		goto err_free_handler;
+
+	v4l2_ctrl_modify_range(starvis2->link_freq,
+			       __ffs(starvis2->link_freq_bitmap),
+			       __fls(starvis2->link_freq_bitmap),
+			       ~starvis2->link_freq_bitmap,
+			       __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1254,6 +1280,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
@@ -1288,17 +1318,18 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
 
-	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
-			__func__, ret);
-		v4l2_ctrl_handler_free(ctrl_hdlr);
-		return ret;
-	}
+	if (ctrl_hdlr->error)
+		goto err_free_handler;
 
 	starvis2->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
+
+err_free_handler:
+	dev_err(&client->dev, "%s control init failed (%d)\n",
+		__func__, ctrl_hdlr->error);
+
+	return v4l2_ctrl_handler_free(ctrl_hdlr);
 }
 
 static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)

-- 
2.34.1

