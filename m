Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0851B181
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904669; cv=none; b=indfEJDgsQu8Sya06KTVVZ7MjWcNB/DLE/G9hW0PpNZjIM63XCpC5He0wHMN2E70hVCxKy6lYKBvkfiRZdAe9B1Zk248IW6j23nM5Rs8m6YWGJWwXhkPng09DVUjuhCc5vw15zE0HLNWhTpDapobtmVyazmWStaS5TAGnHDgbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904669; c=relaxed/simple;
	bh=+kTYvPd10Ywa/jS1tvi6yzq2iIUP3Rp+cb+T0J1QEmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wf9w7iKlUiF8gTaPEq/VUfHO9fmoilh1jPaTVlLnPxtdzQrk12sCcmrmm/HGKudgk7weOzJkDXRxdZ3KUtE/qE1Jo9RImIsPEotMEOEkZppdcqR8jHT5X5ksJd0hhnSQUYNnW+Xjz26buXWxJi9vDbRImaHjSlQLf+A0QnKvSnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AtyCKgSS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AtyCKgSS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48870973bddso1891578f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904664; x=1792509464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HX7CpfwIV6Tkx/DgWjB8iJ92Nuf7bMdoHnBd2cTugGc=;
        b=AtyCKgSSjqVRD3+GMhjLhfQ6Kgnv9xWG0aUNR38ZuO5pn4jVvDy9AOitfxlGqs8VpN
         RY9kWgUo3MeXCSvq6bhfod6NdVkFTUpLwsJDHLiDk6AKwmIAFtOwYvX+xT4VOpV8s/Ra
         ehwx9XYl5Ic9K9jRL3DJVaMkSKD/c0dYm18iRB7tbSICVA8U+XmXin3IaF0gDpJlzBmU
         Xoqnz8n+Ea7ERTCgWrYBB35/aRNvSz91mUI/sqBDgvsEEx+/ebHKiO03hOyfkHaA6Q6N
         NPYweMBNER4BrWc4QDXKvjPvDMwbWbiF4Jkk22f96Uoy0yiC6JXVPQgs0QxPZRY4Dg3D
         g+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904664; x=1792509464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX7CpfwIV6Tkx/DgWjB8iJ92Nuf7bMdoHnBd2cTugGc=;
        b=axddMhh4bXBTLZXHqz+mxSH4en4dqoQxEDDkx/b3AOXQ9rQRdqs82pgqZ7cvoKy0fQ
         1zd/vPwOkvbL7Tb4ABM0FcueTLtyJ7coSzL9/8LsoT6m8khr1u5doA8en+E1/J8S1oOt
         1FGPRUlpGhJYICvUBOXwnocN3H68aMjN+dnzpCVNEMiAG/IczjCwmhIx1gB5CO1FlLOV
         Pr6eKCPcjXdxKhOpEBPz8ew9Yqvk6aBH6tV3i2m2zyKGN7pRxVWQD2htBnTH6LmWW8Ij
         azZx5nE/ZkZ+N76kS4qdyEIf4PwPMTNiz3/T9gufXRNbvGNblD0PgW/wru/4XR3HiUcg
         xsOg==
X-Forwarded-Encrypted: i=1; AKwUvBxKdQ2/Xsb2+roeroOl438m2lDmtsB2+BCrS39QnrnvQre9EY1gY1ccwvI4MTyYqxxxe5misdwqDZCr8YI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKubJiSRtkTUDrgzZgSQUrQ5q70TIkQqt7/B0toU2eItuUTaZJc
	qDVfllJUnxZKJasuyjRg3KXvMUSqjgMRUo40u9aacnlR0w3Zua3tZ+cNGgYXMRoMsJ4=
X-Gm-Gg: AYBFou13LEAXcqUFewN4WKMbRHbgNeOQfBZwL8U2VSfNXm+QLCfa7nI+DyEBlpUBV5h
	bMySWpYgqLH+gtqMNoaAnBRw8Q4kSgMsDQD4ahB1s3elRYayiRxPRsIC/LIPI/ROvA/41x+99Y3
	aHQJsmLpnR+Z2pTX3Ua3ZrZvph2g+kcuylrJp8rVFubQ+h8cBF0lsum3Tvj5K4yIEAFmfEWtHQR
	AcZKQvntZKfcNee++5t0mO4gpTrRiAh3lBGOIxuPSizVh51rYPkJN5ezQ3awvABj4KjhOJxJJda
	LkT4c+1bAMdyj0kOKyZj20LuHB1AFRjTyGkxr9QY6x0gICJ1eejOPeFPDXTTcg5EIvlKf+u12pZ
	fd3KKYTSaC5s05At/ER+fwlWdmHUtNYa8BWOfxwwzXZ0RRQz55tB2SfDOIpeL/NaqJxr24aEJgS
	F3TLZJPOMDeKsIuk/SZpcx9sOlu4obGPdRzZ2Sbk1hJ2W2kkDp2RBfmeHBp3JRgIczGEfYveV6N
	/IRYOyTWTHRoAz1/9FDmrf9LiLfKkgiwDArBi+MrGjUgT/7AyyckxXrdaML
X-Received: by 2002:a5d:4d45:0:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48dba9e641amr19912259f8f.6.1791904664199;
        Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:43 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:03 +0100
Subject: [PATCH v2 04/13] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-4-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
index 20f3489b58d3..f62a957ff1a8 100644
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
+const struct starvis2_variant imx678_variant_def = {
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
@@ -769,7 +797,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK: {
-		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
+		u32 hmax = (format->width + ctrl->val) /
+						starvis2->variant->pix_per_clk;
 
 		cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
 		break;
@@ -850,18 +879,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
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
 
@@ -876,12 +907,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
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
@@ -895,8 +926,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
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
@@ -920,10 +955,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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
 
@@ -1066,11 +1101,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1079,7 +1119,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
-	cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
+	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1087,9 +1127,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
 
@@ -1104,7 +1145,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	detected = val & STARVIS2_TYPE;
 
 	/* Prefer to use sensor type specified in device tree */
-	if (info) {
+	if (info->codes) {
 		starvis2->info = info;
 		if (detected != info->type)
 			dev_err(&client->dev,
@@ -1113,11 +1154,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1148,7 +1190,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
+		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
@@ -1167,13 +1209,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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
@@ -1185,23 +1228,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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
@@ -1342,6 +1387,9 @@ static int starvis2_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
+	v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
+				 NULL);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -1422,7 +1470,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
-	{ .compatible = "sony,imx678" },
+	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

