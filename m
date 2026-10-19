Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92D572E90
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420114; cv=none; b=GibMqFLSvUvWlm3Xd1JFwxVxpfev470hovsf7wV022O2Ce493NYhJALV+jOz2xESpiyg1zy1J0HGKhyHGKD8tkuFAwFdLg6yDO28Mt70fMrMztFmHWjL2P5axEPEflw+gl8EjvkOvEH0pL5p0ozgWguGit5rI5KPrk6q4J1WFP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420114; c=relaxed/simple;
	bh=P3FSR1c6MnxhzL0GI/5iWpzh2bmk6diuGfyHQlCtj9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krnBDmVyE/sc8GyhIFxVTtn4pZ5NWx4YofHl0AGkfKCMv3qBu8DKy6m0pwNjeWR9Ua8jDq1emEovjh81da1/dlaGYYps2wNkGQuRjMHAGNH5OvwYpEK8foD2ygZV925xTV0ciXcyF7pktOzsSQrD7YFOutODnQAqZTM0NzX9Amk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=W8srNp+I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="W8srNp+I"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1246797f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420110; x=1793024910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCVrldNPB2MCdfV9J8p15ZczzcYKHFI66IPRnJ1gPk8=;
        b=W8srNp+IMJ+zaiTMoIhrlrQBe8vjKvOT4c8w4quz8kjzeHXO4PEVHUwCEJTWKoa6Vm
         +UtjNqy0T5FRenZDvmlPNt3N7laZIJwtM9J1Zdv7gzDG3dqZ6xC6UUnlrBNiVIUC8HKj
         2JFT5EgWkZhwD0IoeeWLNBm35u0RIRqTxENAKAVzD3pVg0kkX1hMnIqLynUAhv/3FYfr
         P2v/XMgGrDqH0DnF4G0lRamsJfuimjbXwsUqr/CG15q3KIXVEWrT3ijFzHYTPck1NzJb
         TbCHBGzH37ujNkSE6RS84Ig6Xd2new8tatNUXHvob3v/uiVzmaGwgkDn29v0Up7USazy
         AIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420110; x=1793024910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCVrldNPB2MCdfV9J8p15ZczzcYKHFI66IPRnJ1gPk8=;
        b=lJ6OFCZlLKtKsbBFxiEWGbpVfhsb2v7++fgObM9fnfWewRl2AMa/56vUKP3rwf5ktU
         OTlhMIx9B+dEVf0TPuqZN65P4QBZ0L9XgcTV9UHW/RaulCvVuuUlwMr0jVzHb/pjRR1u
         sVEVYAy5uUsp/WC59BYyndkMdr6CTOvfySPeYpq4xeyKnqb6Eu8n4dQbNT2Rykg0xyJ2
         Ii03VVGZdYIM8v7Zb13jGexBq97Ze5yQXObH0b0knbi1ewoLXniJa4M1Tp1ObLAd0osh
         A2AsJUDPfhTLbkgkQ4gEqoY/OX/FVD/1IcQFxJ76qDTM54PdcKKnekZYgRfrDVea+wlj
         ZqTg==
X-Forwarded-Encrypted: i=1; AKwUvBw/JmcU1FiZznb7HtawbUlY1nWLkLUvkW0KSO7Vq3X9t7hjwa+ftoS5GQZk6Ud082nOBk4CfHX8WyO0pJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+V+EPWnAScfTNkQZ/URy45kMHk16AKTlOx7FwbBe2VFz59m8c
	4c4DL8lPK2K2KX2ZUZ/XjX6s46BK4uOh9XOZMxnSk+JVMHJbW2tMYNaQSQgGo5Cb2oY=
X-Gm-Gg: AYBFou2+UcLVKEG+nk4n5AJdphu63DiIsumyY/YgcnejEUzhfM3BkcBCtuRtruFUbze
	jOW9cpf1AKxPMQmbF7Q1faoNUZZDImy7UcbOdFWGjm5i1sgJr2VztRHEvZIVoHUaLv4xnnneQjl
	Qd+y55yp1hK4o0zV1Nt8A3y7tYZV8RGOwzlEu353Bca39LD4yD/LwOPyw6TD5Fc4wqK0//b7EkC
	liliodSn/+cKAjrt9N0zD5trSRTBJJGuNrmwLZcSC6J80ZQ1g/Qt2G5bGy/eVhGlCIXEGwdenMh
	QEyTtceYm43T8nUgCPjFJebE7KVgs98YbMj5xZMth50bKFYpuAr8M9cT0h/3FiblbI9EDHiKO3r
	UhqT4And6IyI7ID1+irBU5HlfDX1P6RQRaQET7kmTcmMrLT5SyrkxvvI4yU9pphAEhxzu8e39hT
	Ooi+LuH2ee3mvQGWpWlm4nRLUMGCS3ze8hpjE+Vpks6iQEGsRSaIeByaGYyFIzP+hI4MTGiLLQZ
	L+Vn9J7TBMenpGYnpMuSKScyxZlf8uqSstvNYZ3k8t5ROcRUA==
X-Received: by 2002:a5d:6290:0:b0:48d:fdc0:8bf2 with SMTP id ffacd0b85a97d-48e07fb0a8dmr10841312f8f.41.1792420110354;
        Mon, 19 Oct 2026 07:28:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:13 +0100
Subject: [PATCH v5 06/16] media: sony-starvis2: Allow runtime control of
 link frequency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-6-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
 drivers/media/i2c/sony-starvis2.c | 82 +++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b0b1716a86e2..56fa2d5ea3fe 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -725,6 +725,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -755,6 +756,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -778,6 +780,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
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
+		ret = __v4l2_ctrl_modify_range(starvis2->hblank,
+					       hblank,
+					       starvis2->hblank->maximum,
+					       starvis2->hblank->step,
+					       hblank);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Only apply control values when device is powered on (RPM ACTIVE)
 	 * and streaming (usage count != 0)
@@ -824,6 +845,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -938,9 +965,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1019,6 +1043,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
 	return 0;
 
 err_rpm_put:
@@ -1043,6 +1068,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1209,7 +1236,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1225,25 +1251,26 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
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
+			       ~(starvis2->link_freq_bitmap),
+			       __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1251,6 +1278,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
@@ -1285,17 +1316,20 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
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
+	ret = ctrl_hdlr->error;
+	dev_err(&client->dev, "%s control init failed (%d)\n",
+		__func__, ret);
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
 }
 
 static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)

-- 
2.34.1

