Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690480;
	b=dY0ABKrhl4oz9N9XNIp3dzimMFPbZyBEKVmxTyTBgIZsHtVOUXAPTCghiPzqo6lwxKOg
	 QULku1dPPEZqk0bs7EMBDGbLA/mlFO5PpWnQHLlzlNteycgvxTLaMyf+sNZe3MVW4OadA
	 +2NLhCfn8btuLvAIAnU3RAZLFGaxhecrFs21Hn/qtrgHR9wf0PHtfBf47ZFJilYYwfT5P
	 Ea/GZHeaj/m7CLyB1cm8HIe6zpAZ6ZrVaL9bdS5dzr9xNFIgJM+H66HMLT6yhh7tSY0hj
	 g4ER37TFuJQz69fg3g8roAuJ7BX3hIlPP8l/m73O1LyJW5IbosRZ/+LZB5loT1tpqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
	b=3zp/kcyojutH8ElTNxEtNZoiPNvRvckotqsY86VqwW0Z5YuvQjezQ6KXR+A0BZOHSfyR
	 I/SPwmgBjvqlv90vxHZTl1PwNfr11R2GGSLozxnuKP4KrY39DmaEaB3FBMj4bpHL9nAcy
	 l0PpRuYZcEzrua3cySBdO+5+iglt5oq3EluA1AP3C8BqXNNVdR3CVx9Qldh+Kf2o4PxeL
	 qMTYnh77HJtcLhiOfhbJrNzi42FNCnb8U+czwnzumOF6JSJiWUmO+U+2XOETGmNKqkJrp
	 qdG8kzgJkMAjY1OMhgDLOBX0Vb7QmvG2FvFeoliBeSiVWvlMznp6yeZJLEMc2UMFfXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Vr5k5IwA;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA360A2614
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CA360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Vr5k5IwA
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso889165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690474; x=1793295274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
        b=Vr5k5IwAYDaSIqQdjaXoJa0XV31Gt3SJoInseQHbs12IjIBI2/FdnOdrn2Zmyr1xo4
         weO5qILKh2UOExAhx4ESiteYqMKx4nuMaaQp03WcB8no3z+/EgZBX25PJII94j/LA00+
         qzkOdYAuHWrXMMS4bNQKzZ0PLSr/puW8/jTKP18bO4mLy2YTMNLCtVQ1R0/83bFkO79T
         u2SWJNepN793yc1lB0rffWyDKcjRntU+ib6Ag/BCof7+yowFGJpPNLB7ZwZR4NESgRJI
         fbMxtfCTTUMXHSh/RhpBK2nkvC0paa0uC1KZxRYsxqvfhlzSKRFaY7z8VSXK3MQF9foE
         27Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690474; x=1793295274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3sKocMPsvLQ6Ecji48V4u4iC5LYvlvzcXipELmlS+U=;
        b=Dmcc756y4le/ZApO/qogLOQZWD/mjYuT/2WL6ep9epI1NzIIrWL/vyRanagzBleiEy
         1dryM8X++ar06mz4kTqvD/gQVPDs/3n5NDe+FmTRDTVLgaZ30iSmSpQ3hNovYK00rlhe
         yX7neduSHPbuIJti+cae8wgFGeMQF043h9vmWmuoqkqjkmqXbzhgAtsUyeRaLnT4ENUP
         3izy1gXM3SGlZ0xZyxH4Z8DpRwipvgGWATPAgb/CK4xN9BeLr+Ulo51YXRHAJydPOWrF
         5DYR/jOc7Ck3hyT00cAlXPGVFgStOHTBBYWoq0GtDfF6DixneQCSAdX7I9HsTib8debl
         UBkA==
X-Forwarded-Encrypted: i=1; AKwUvBxQQ32rU2M4XhaCiloU8dgD8kYWDltpXDhLVLh0hkSAQj9iTtpDgh4iq0bn4xAozgzhaa/kL8dr++RmgHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK18uAZbiIkFBEAwDIbkPEi5VMlEnLoMdw0IdE+lGpJfjQmvgdd
	DHlQf/ZmSmVgn9BSEHd6Fxl4xi8ORdwEMlOiWwbI2SiEK1/n5D8P1WAQBS3S5Cc9dBs=
X-Gm-Gg: AYBFou0EpCzJNnFABhUidA3bDPL5w7TvAItoaoIiMtudhcd9NvwmobBNKCYwLU3dx5g
	CxaMN03P1TaFO2ExgqaDmiB114Z3Ryo8q35m2TZhKd7A+9gqDrHjGoTDISfmK8a6o+NS9N41OTB
	+xAiby2pWJN2PaAqziT3b+hT0/EE5D1dUIBrt8oUVQwbhfTXGzVEGahzOhlF+wxqUdJ/R87WxGM
	RcZZBtY8Ch63Ou1+aS5fCzQ4xf8J+4AVNI0+o7WE5USaXWu3LYbHon0VmyqLeq1eX7AGzQFtQNr
	ZaG0PEBnsSCnkONMbytJ4L+ZagrHjSDtcfCi1Yzg0KA2rMubM8tCNYZGSw2cbnk1yz7RK8hnhzV
	O/tZ/LAW+lxMH/42seOTsklFKYD4sLiw3q3sruPO1sc/Ndq6Z1jBrq2+6p8RyLlnWEJk8xtVQuk
	wRQImqp9x6wpY0K8Dk6dFLByU3NPBetzfQI3htKPpjJCDWeypJ3Z+prZQIvQNFyJfDldjVz3150
	aC/zWAJnH6rtNLdmRWz8qTu3pD4trfQYagiwBPWKjM77EMYEgRvCQTkM2kXOCQPSp9VKiaa8HsJ
	fozxRm4YiPVgOMwu/yEtJzCHErCZcec=
X-Received: by 2002:a05:6000:1612:b0:48e:b32:9d1c with SMTP id ffacd0b85a97d-48e264a726bmr9146042f8f.19.1792690473785;
        Thu, 22 Oct 2026 10:34:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:59 +0100
Subject: [PATCH v6 06/18] media: sony-starvis2: Allow runtime control of
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
Message-Id: <20261022-media-starvis2-v6-6-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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

