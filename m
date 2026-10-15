Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B94BD352
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079880; cv=none; b=iydq+YQCKZkK17n/i2cB8Gww9mUzgPM8cJa1UEs7ZsYkYrB1wN3E+pf9jm4dyEOaesRw7UXGIaH3ZPxae86m+dQNIFNIOjIwjXOd4G7/zAfVsX2vHzrNN2VPwQn/9jA0iF8AceDGfFI/WuidI6OcdeXToJbiG7xeTJWbbDj5e+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079880; c=relaxed/simple;
	bh=xlz1aJcQsxI1RxGKjx4OjpXjyfXcbEun6a8tB/jVeY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBLVWGK8rZKh0L7MRJ7HEVugEG+b17lDbRlEn9O1Qea8/LMp2nVMJqAki7ANEimjTTRCj344vatkHTbQs2ALSBe8HODVCwzA42Yy7LNk6cuJQBZfsvv3nufnKevk/KnJc1DoqysVJpabMVsO5nk8az6pSs+rAy6Wtjv1MKSB/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dOwwdxjp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dOwwdxjp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso39280745e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079860; x=1792684660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOE2xdskRnH67zUZ+zBRnUdIyES9sMUlXt4ERLvpFy4=;
        b=dOwwdxjpUjeUqqu/tFdsCcRfPNKEnVGOe/s/kOGwH6OmiltfdoA2KIZZghpSx9QqEv
         z/rhvBjgYa5MWFIAysrdB3XubX09Fr8lNiMxk4hCcp+cA8rGOpUyubBTIxR8QrNHk3t+
         AswhivxIk1GrCHfcAePYFXCZkyzGXfqkKyoQPsHvCN2cwTC7mMYpy+MnrCsa+NadN365
         tH9h1S38emeg1ilFZIwHQNWD/ktKE4310s8UPyIfZAJypQbR/+D+iIvfbivgGZAppE3B
         BRxk+JRLAjmytxLA2+Nf2Kf6aOdSsgZioiJvYd24akU63drI94a5LKB0znfS3HMg5bdM
         vv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079860; x=1792684660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOE2xdskRnH67zUZ+zBRnUdIyES9sMUlXt4ERLvpFy4=;
        b=XPhA/FegLwhRH2LtnP833eW9kpEFmF+R1d/4HD/g/L4XQ07gUudNClslqMEDhDzVW/
         U654nKi/xQp5KYnXUV5brrRG/9o/ZJ9wlyPvN5VPpk0SHCIOvehL/ZMONTtXtfTUZ5Jv
         X6vptaqyVltRbUIJJlDmzQ85zy90SZ2JmkMeD4ue0i+Ojx/DqxqdeRRQdTQ3fA5U6Cn/
         xQyG1qIqdFkPwKW+4JB5nO/y2adYT0T8gnOhrtP0OntMYjYAhXDKcRylK6WpzABZ5xBM
         4Ds05U82VRlGYFX7oksnbT2Q99aS2xjGjamh5arxQOd506hxzuQi/pFZ2TYo2htl6Vmr
         ViSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8a3abFBEbD8h2stWWotTxolIbfT2up0lhCObIdzL3MMeL0QC1jxQritYRfJ791/wW5aDQyfx838BLsmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsvU8/SJnxfATm/ObOYScSUzOJdhje8tUKxtU90mn8ao9OCXqV
	plQSg60OOTkJc8WdAq8/7+9z01n+xVYxtEMashovQ5CB+ViR9pAYAiR6TmApffE3K0te0npyFxE
	gDfb4Uew=
X-Gm-Gg: AYBFou0Fw5OFR2KqIbDLjto8LTBG8My3W2RDvRywVPX1x0BVYI/hMM21zCee5He/FRd
	uO3/k5ZuzsSFFw6F8Tg+aYk0tmjwaopmEv4kGq8BRRblS64sMGrZ7JikxgIejzg2t8pCcqL0Yi5
	U0+kSzX7VjZr+ScutfyZJS2OsZJkHkfvONS7yvWqVjCC0vJXH+kKtyBniD6dppocobHowIMuy8w
	SH5R3a+70Hf+3L7M5tSPPGhDMwLYN6gzCKIXRuZlB5G5ldk8UB9vsxwYtgvAKt+lrFaYBCV51EX
	ZMvFPNpy65ypyauv3ulHiJ/3MuZlKGIgjHFfqoi6bfjK50UhyFBDyqLb7KDb/aD0NrJN2CqZ7As
	QIisWp8agSt9Ow9LvDNsSQ/MBgV11deXdOiNyBVA7p3ypnzR06QS5KhSIVpRFiesACDWcYnSDiE
	9xurXpexUR1rM8aygkkRT44c7AKbiHf0qyhIpx7mCQLPGNE2eWgSx1pewPcHpspRl55AzrkXk6J
	lbkIprGYOWdLjy+rqvkRwvZvpSJTmh8I7j0618ozBbsv5mXkAQ0Dul4snfR
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr285884815e9.30.1792079860138;
        Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:30 +0100
Subject: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

Several of the Sony Starvis 2 sensors are identical in the
majority of their programming, but differ largely only in the
size of pixel array and some timing parameters.

Parameterise those parameters in preparation for supporting other
variants.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 170 ++++++++++++++++++++++++--------------
 1 file changed, 109 insertions(+), 61 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index c4f590c489d9..189caac78066 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -51,17 +51,9 @@
 /* Lane Count */
 #define STARVIS2_REG_LANEMODE             CCI_REG8(0x3040)
 
-/*
- * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
- * pixels, thus giving us a rate of 74.25 * 8 = 594 MPix/s
- */
-#define IMX678_PIXEL_RATE		594000000
-#define IMX678_PIX_PER_CLK		8
-
 /* VMAX - Frame Length in Lines */
 #define STARVIS2_REG_VMAX                 CCI_REG24_LE(0x3028)
 #define STARVIS2_VMAX_MAX                 0xfffff
-#define IMX678_VMAX_DEFAULT             2250
 
 /* HMAX - Line Length in Cycles (8 Pixels) */
 #define STARVIS2_REG_HMAX                 CCI_REG16_LE(0x302c)
@@ -102,8 +94,6 @@
 /* Sensor Identification */
 #define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
 #define STARVIS2_TYPE			BIT(0)
-#define IMX678_REG_MODULE_ID		CCI_REG16_LE(0x4d1c)
-#define IMX678_ID			0x02a6
 #define STARVIS2_MODULE_ID_DELAY	80000
 
 /* Common configuration registers */
@@ -153,32 +143,11 @@
 /* Subdev pads */
 #define STARVIS2_SOURCE_PAD		0
 
-/* IMX678 native and active pixel array size. */
-static const struct v4l2_rect imx678_native_area = {
-	.top = 0,
-	.left = 0,
-	.width = 3857,
-	.height = 2201,
-};
-
-static const struct v4l2_rect imx678_active_area = {
-	.top = 20,
-	.left = 0,
-	.width = 3856,
-	.height = 2180,
-};
-
 enum starvis2_type {
 	STARVIS2_COLOR = 0,
 	STARVIS2_MONOCHROME = 1,
 };
 
-struct starvis2_model_info {
-	enum starvis2_type type;
-	const u32 *codes;
-	unsigned int num_codes;
-};
-
 enum starvis2_lanemode {
 	STARVIS2_LANEMODE_2L = 1,
 	STARVIS2_LANEMODE_4L = 3,
@@ -207,7 +176,7 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 min_hmax_4lane[] = {
+static const u16 imx678_min_hmax_4lane[] = {
 	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
 	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
 	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
@@ -267,7 +236,7 @@ static const int starvis2_tpg_val[] = {
 };
 
 /* Common configuration */
-static const struct cci_reg_sequence common_regs[] = {
+static const struct cci_reg_sequence imx678_common_regs[] = {
 	{ STARVIS2_REG_THIN_V_EN, 0x00 },
 	{ STARVIS2_REG_VCMODE, 0x01 },
 	{ CCI_REG8(0x306b), 0x00 },
@@ -650,16 +619,74 @@ static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
 };
 
+struct starvis2_variant {
+	const char *name;
+	u32 id_reg;
+	u32 id_mask;
+	u32 id_value;
+	struct v4l2_rect native_area;
+	struct v4l2_rect active_area;
+	u64 pixel_rate;
+	unsigned int pix_per_clk;
+	const struct cci_reg_sequence *common_regs;
+	unsigned int num_common_regs;
+	unsigned int vmax_default;
+	const u16 *hmax_min;
+};
+
+static const struct starvis2_variant imx678_variant_def = {
+	.name = "imx678",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x2a6,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3857,
+		.height = 2201,
+	},
+	.active_area = {
+		.top = 20,
+		.left = 0,
+		.width = 3856,
+		.height = 2180,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx678_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
+	.vmax_default = 2250,
+	.hmax_min = imx678_min_hmax_4lane,
+};
+
+struct starvis2_model_info {
+	enum starvis2_type type;
+	const u32 *codes;
+	unsigned int num_codes;
+	const struct starvis2_variant *variant;
+
+	const struct starvis2_model_info *auto_detect_colour;
+	const struct starvis2_model_info *auto_detect_mono;
+};
+
 static const struct starvis2_model_info imx678_aaqr_info = {
 	.type = STARVIS2_COLOR,
 	.codes = codes_bayer,
 	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx678_variant_def,
 };
 
 static const struct starvis2_model_info imx678_aamr_info = {
 	.type = STARVIS2_MONOCHROME,
 	.codes = codes_monochrome,
 	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx678_variant_def,
+};
+
+static const struct starvis2_model_info imx678_autodetect_info = {
+	.variant = &imx678_variant_def,
+	.auto_detect_colour = &imx678_aaqr_info,
+	.auto_detect_mono = &imx678_aamr_info,
 };
 
 static const char * const starvis2_supply_name[] = {
@@ -674,6 +701,7 @@ struct starvis2 {
 	struct regmap *cci;
 
 	const struct starvis2_model_info *info;
+	const struct starvis2_variant *variant;
 
 	struct clk *xclk;
 	u32 xclk_freq;
@@ -770,7 +798,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK: {
-		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
+		u32 hmax = (format->width + ctrl->val) /
+						starvis2->variant->pix_per_clk;
 
 		cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
 		break;
@@ -851,18 +880,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
+	struct starvis2 *starvis2 = to_starvis2(sd);
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		return 0;
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r = imx678_native_area;
+		sel->r = starvis2->variant->native_area;
 		return 0;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r = imx678_active_area;
+		sel->r = starvis2->variant->active_area;
 		return 0;
 	}
 
@@ -877,12 +908,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 
 	crop = v4l2_subdev_state_get_crop(state, STARVIS2_SOURCE_PAD);
-	*crop = imx678_active_area;
+	*crop = starvis2->variant->active_area;
 
 	format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
 	format->code = starvis2_default_mbus_code(starvis2);
-	format->width = imx678_active_area.width;
-	format->height = imx678_active_area.height;
+	format->width = starvis2->variant->active_area.width;
+	format->height = starvis2->variant->active_area.height;
 	format->field = V4L2_FIELD_NONE;
 	format->colorspace = V4L2_COLORSPACE_RAW;
 	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -896,8 +927,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 {
 	int ret = 0;
 
-	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
-			    &ret);
+	if (!starvis2->variant)
+		/* Powered on during probe to do detection. Variant unknown. */
+		return 0;
+
+	cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
+			    starvis2->variant->num_common_regs, &ret);
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
@@ -923,10 +958,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
-		  crop->left - imx678_active_area.left, &ret);
+		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_VST,
-		  crop->top - imx678_active_area.top, &ret);
+		  crop->top - starvis2->variant->active_area.top, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_VWIDTH, crop->height, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_ADBIT, 0x01, &ret);
 
@@ -1080,11 +1115,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_model_info *info;
+	const struct starvis2_variant *variant;
 	enum starvis2_type detected;
 	int ret = 0;
 	u64 val = 0;
 
 	info = device_get_match_data(&client->dev);
+	if (!info)
+		return -EINVAL;
+
+	variant = info->variant;
 
 	/*
 	 * This sensor's ID registers become accessible 80ms after coming out
@@ -1093,7 +1133,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
-	cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
+	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1101,9 +1141,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 		return ret;
 	}
 
-	if (val != IMX678_ID) {
-		dev_err(&client->dev,
-			"Chip ID mismatch: %x!=%llx\n", IMX678_ID, val);
+	val &= variant->id_mask;
+	if (val != variant->id_value) {
+		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
+			variant->id_value, val);
 		return -ENXIO;
 	}
 
@@ -1118,7 +1159,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	detected = val & STARVIS2_TYPE;
 
 	/* Prefer to use sensor type specified in device tree */
-	if (info) {
+	if (info->codes) {
 		starvis2->info = info;
 		if (detected != info->type)
 			dev_err(&client->dev,
@@ -1127,11 +1168,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 				info->type == STARVIS2_COLOR ? "color" : "mono");
 	} else {
 		starvis2->info = detected == STARVIS2_MONOCHROME ?
-			       &imx678_aamr_info : &imx678_aaqr_info;
+			    info->auto_detect_mono : info->auto_detect_colour;
 		dev_info(&client->dev,
 			 "sensor type missing in DT; detected %s sensor\n",
 			 detected == STARVIS2_MONOCHROME ? "mono" : "color");
 	}
+	starvis2->variant = starvis2->info->variant;
 
 	return 0;
 }
@@ -1162,7 +1204,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
+		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
@@ -1181,13 +1223,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	if (ret)
 		return ret;
 
-	starvis2->vmax = IMX678_VMAX_DEFAULT;
+	starvis2->vmax = starvis2->variant->vmax_default;
 	hmax = hmax_4lane * lane_scale;
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
-			  IMX678_PIXEL_RATE);
+			  starvis2->variant->pixel_rate,
+			  starvis2->variant->pixel_rate, 1,
+			  starvis2->variant->pixel_rate);
 
 	/* LINK_FREQ is also read only */
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
@@ -1199,23 +1242,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	if (link_freq)
 		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	vblank = starvis2->vmax - imx678_active_area.height;
-	max_vblank = STARVIS2_VMAX_MAX - imx678_active_area.height;
+	vblank = starvis2->vmax - starvis2->variant->active_area.height;
+	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
 	starvis2->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
-	hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
-	max_hblank = STARVIS2_HMAX_MAX * IMX678_PIX_PER_CLK -
-		     imx678_active_area.width;
+	hblank = hmax * starvis2->variant->pix_per_clk -
+					starvis2->variant->active_area.width;
+	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
+		     starvis2->variant->active_area.width;
 	starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					     V4L2_CID_HBLANK, hblank, max_hblank,
-					     IMX678_PIX_PER_CLK, hblank);
+					     starvis2->variant->pix_per_clk,
+					     hblank);
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
 					       STARVIS2_EXPOSURE_MIN,
-					       IMX678_VMAX_DEFAULT -
+					       starvis2->variant->vmax_default -
 					       STARVIS2_SHR_MIN,
 					       STARVIS2_EXPOSURE_STEP,
 					       STARVIS2_EXPOSURE_DEFAULT);
@@ -1356,6 +1401,9 @@ static int starvis2_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
+	v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
+				 NULL);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -1436,7 +1484,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
-	{ .compatible = "sony,imx678" },
+	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

