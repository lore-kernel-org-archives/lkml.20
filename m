Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E573572E84
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420112; cv=none; b=DytzUjHfxLfIczunEkbu76kx4OC+d8FpuduRS6bs9HH5PBjkSpjb9tzNjfZA+jpGnb5+zo7hjRXM3YrQdLEObBgt4nA5tDX4dBGZniMSo506SGuZbBsutuyJJvP7tIOQJKK39Oj14kz35glgAtaJK/DbxUBl7NnGSM+1tSdxS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420112; c=relaxed/simple;
	bh=hHFS7weOeh7MlbVnimcj23nbQxnv9YYKvm4fxJDnZJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cw49yrLPNrBZmNWoHN5AY7vTyHhFyDFrLqBZ9fGJUnWFB82fH+Y7MC+KShtHnnuVV2xp6nuCVNtqxPtjSmDJqrEzWknxrjIXZxXbYMHja8AAHYauAa6PEUPlNd52kgAzDTvrpeajhegR8jFWbfh/mFG+8Y80IW7x+xDq+Op0Q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kr8CAAae; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kr8CAAae"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1858873f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420109; x=1793024909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znN+FpH/h7hzZPlrBC031EXR7woraq5BiA29QTDHt8g=;
        b=kr8CAAaeWCG2l8EoLw22NZdGS28mOfHdyznKBhAPHoVDSyZGF8IHjeIOLA9dzOYOTR
         /ByYuEvC2vdo9fLzgPp3ttHs9CMnEdnpY72Z7qiaY+vEZwgLw6wqMc69M/f8ZwwCLYfZ
         r4mwQEURuwVmLO9yjwj4W2tUSGifSkRp6M2DHCk7O9Q2ncPgdJZUaJVUxfujzwZsP/EZ
         xjAGukufgvaGyWqmSQ2UWaflHQcFW0udJ26jy8I8pOuDLAsZQ0y7uW31oPnvvsT1GN2C
         5J1NddNQsrXTt5kIJdHMIjFv0sg2XIZY6Qgh7xjn3Wibr0O8t2LCldfcIae9zMTGzrz5
         1H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420109; x=1793024909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znN+FpH/h7hzZPlrBC031EXR7woraq5BiA29QTDHt8g=;
        b=FX5oNNc96WBSS7W8ywS45b+JYu5ZyzT41EdpXoakEEDgwaRNX/L9+p0WWLnbAmL1TY
         WFvTO25T/w4U0TsL/3TCOvM89RqJNYVzIFNLcc4UFwYIJl58zA4KAe6i2WsKcvfET19s
         Pv6gVbmrgXj4qgGEOEtfk3oRaJJbSGNzAl3RuiPqUSuMSjZgunGRrkp5FUKOAIFJVbb9
         lUFQsQv/nCC4s+iHFW/Rh+0lXS/sHV+DNzQVYevKMWflsnj5eflwy99uGjHIX6BdnJhg
         b6eLo6VJpzjk55DZo/ohUrRNzsVzxkGZXcTc1I/x6RrLNj/d4LGBkSUF3R8lqxz08vHk
         tU0A==
X-Forwarded-Encrypted: i=1; AKwUvByWY+SVzyYWDK2twWjM2GnAjFDLier4YoVQgZoi09/x4iatU3W6M5DkvLn8XHaIxH8btdrPLrYHCvS9Ulk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd3EbNucd8zAAdFlk13B4seBTktdoX3+OhmH4JJm46OOaW29qY
	VSGHFwVudcWiEX1Di4x+pnAFoDUWX9V7GZm5hrLrHoor0i6ULTtc8oYu++tIMJIZJO4=
X-Gm-Gg: AYBFou1ifa661/mkLFx2rGfUt4ve6YntWDZYdgPLnSdux8ZZec5UwJfzew6uJ7iWZmW
	HzgrxHj7XUfBdLVMDIJ+AQXBMa8HKYFrYJUnd+F+pYH4Y8zXswFy0Rt4lfLzD3Dqo0SfASQc/Mz
	JCSAsyFAKDBWx/UIAYyaUIqIRAgn0MgePqEcheDN15iK5vikbk2K0SV+5giuvdRq+mamvLIA61E
	gZcQtHfmp3MCWB2JwXrWAPI5bnRoIiPH9MWvHe19dkQ9G0JPA8nh6MKSXLRYkdDdvS3g2/mGEhZ
	jBUBzBirwHunksgHLLoPhld1rq60hGCUd+4GDf3ZtDMscFazG+IukLsmzx0OTEZocTS1497yIgt
	chkUcT7DF/CcYDIcZauN6cJwpxHmKI46AopYkaWaBE7NrhYN7F07ilPYM06wJAGQaZ3eZVMDEUW
	1R1giiJrJqAGSPN+Qq5RpHLJoVC4ohn8377fiWe2sK1QyFYTODw3EzGfKWhRMNFqUuhpjE5KVL4
	taRjqPwY91+mHv13AIVuM67GD7SWqjMQtFhs/PB8PhjLsIr4vj5sEig1xNr
X-Received: by 2002:a5d:4dc6:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e07fa9d89mr11874163f8f.44.1792420109347;
        Mon, 19 Oct 2026 07:28:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:12 +0100
Subject: [PATCH v5 05/16] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-5-eef935347ce9@raspberrypi.com>
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
index eb7662c43989..b0b1716a86e2 100644
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
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1204,11 +1206,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
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
@@ -1225,7 +1224,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

