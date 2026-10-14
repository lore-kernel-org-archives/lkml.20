Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F45518138
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000477; cv=none; b=ifwgRpqc1nNQJBr4xs9FZyZZGptsIgldzN865jdOt4jkR97Myb1bXhonjHv20AVSKyN4ytQz+pAeerjjeSa3bjZSu/eYbfdXpTV52WH0kFABhzvAQZEmbFCA/gYxwYKJILkNjgKdMvvwSviM3HilhQW8KCg/MfWHm2cfmUv3COU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000477; c=relaxed/simple;
	bh=EnXrYpjb/Z7UC1gkh9i1JTlCNPJwmwBCV3SYQzAiheY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+yXVCXgWsfcD2qqxtFGuL0zH4iQo7Avm6DfzbXXgyWJPPjd1TpQvlmOKDMEJCti20s2tBlYDxQDI910Qc0bJ0rX9be5cvXgeGfOvXGT0sQjac0/1tnvSlDzW/3YPBdC49oh46l5jCmKU71U77/x0x7M+fIWCb58rAd66SmMcak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=d9YzjiKx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="d9YzjiKx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11681365e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000473; x=1792605273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFQHGy3DBr6nmogFYNGxghtZmG8SFDTzSz89iDGAE4c=;
        b=d9YzjiKx6/GJoaPzx4mgOCdxZkuhzJGjdzwi4vapvDb/J2IiGm1q0fMkwCgO7m0nIX
         WPZ/b5QyWsnee92yBGuKdWFY3vsFhnYfM+l4rLAsrp4H4olsrmNTMQ8HbfPVZeGB/PYG
         jVoiL6wXP9U7ST9fUz3P4DM/l0ZyGNKe1uZAFFOmfBPsfLCXE7iA2mTpDdkMtzdW9mYD
         30YuSTsByJWLl4Ypn76SKzD6eM/zDY+s5K4Odp4XK6o0sMRw/+KZgRIlQAmYxqGqT7W7
         ipK8Uu33cP+XS/0InrMZNoDm+1HUR9SgJDGp16AC4/soUkRuSzFd8jDhXJv8Q68KDErb
         cdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000473; x=1792605273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFQHGy3DBr6nmogFYNGxghtZmG8SFDTzSz89iDGAE4c=;
        b=C26xSJhkfawEdhGd0PTBhJk0z/EPRwqzU2fc8FRP95Mo/EhhbsT84/3ZQXeZYVI/xY
         edHSiKB9h1R0DSKvAAgV7u2D7Ox+jBCB8IPIvhu6SNy9C3wssASnPdjGS0zqTN3bPZH0
         CBrk6wrGj8vU0ZkSFDdGl+SJ0HVaamuf2LU3wN1aT1z3HRAIsK3q02mfqZl0E86Ezygy
         l/4kHeC8+O3bKdveUUUVDmr03uzhlr7Cs1vU+js4YonpILKKpt9B0Ye7GBiue5Lo8HFk
         kSpfE+COiEK9HfC6E5JWo+mUAJRgQWMzmpNiX1NQ2nZJBHXgidFoIaPNu0Olw5MDLxZF
         Xc8w==
X-Forwarded-Encrypted: i=1; AKwUvBxutCF1NQ+pEBnGENO32QY7rXhAIvM5/FVNwaajdc6Iq7rSz1iHx1/YIqu6b2uwpeulctubCBucRC44o6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWcGrVjYhWYe9mIgklXYPytNIpqWC3+dlEYPqu8J7vLuSd4a8C
	VpjJ1Xr/5hI5tJL/0aU83qOAm13bZZ34wyGCWkS5v/IBtF4Jsa4WQ+/Td4okXepJhRA=
X-Gm-Gg: AYBFou0zcVd7USbngl+LPTAgcst5aTP8BaC/9ngqhxtIBGOZziCCQslOOgO3FEbz4Yn
	TaAq0YUqwM7UDXm66iqrQI3khKq1G+0c01ZlP8HL6nRGXwov9IxHTcfN2lOMXCt4TUsQRf/bOL8
	57hBy8WLVvp7evo9zExpNDZfwrtg2Qju6IbcWZwmEmE17l9FKoadhpYGuzTvZr65+6qsjOnZyBk
	XdCEoKnzO40TDpSYrEe7/976GskNe6xBXCy0HhF7K/YiMS29V1yMzV+NjHUoel03oJ5X7bXX0LI
	fLsgyqbu0M48GSOIeSba50yxcUA6NYR15x29ZIsKdgYhDZg2BH4GG+6kZ2zhqX1ZcK3/5t8ZS5R
	tSH1baX7Qo9uI1WEv7fEUwSkpCSsIvKq/ZfnHAijVzBzxU2O65UcbK8MUE5jQjyMm0hTz7fFmI4
	4Jkqm/1/cB10JUBHS6/Cozi+BrcOEG0cs7oO7ID64YQg2MEAgsaHSG8+28BLpiGecG2gqZwDm8v
	VSgPbxzxPoytuz6h1GU5Rf4f8CAZcvdMroerpUavbRaP4/BVg==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr343536665e9.2.1792000472868;
        Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:26 +0100
Subject: [PATCH v3 05/14] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-5-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
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

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 4f437f4c849b..1f3b33a5e44d 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -631,7 +631,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1203,11 +1205,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1224,7 +1223,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

