Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283525;
	b=ZuXiE0yXY/JwlkWZHb93G8YFoo3anK5FS7UilYIdLYHSN5/cJtHEb/O65OWcUZ8I+2Rj
	 aQvKe35KN1wF+TUweXbwfKsep1Pv14K1+kkWynDyiWYMdYvsk4OPGfeKbGu3Y/gWDc0KU
	 gjbITN6Zj0pu23Tu/duPejGUWBAYN58N+j9eoMuscIeBaM1XYsT/lh4TupzDCpR901pIX
	 nW/pqP4bN9RnOc2JlqHiJvN9DPGsRtXhfb3tHdCIvphVVmyHyUXHJlozOISMCrptyx1LS
	 RfViOH2f4vzQSy3LzITYWaqQ64QY6723d/Ez5AJ1QI5rj3PkElqYAnbV+XoQDvEufBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4igyGi55MaudIHEAxVdidERXeJK3vgMCughZT/NZkT8=;
	b=VAR1ASN/wt4X9bZponf9KUKse9mFHTVs80WNxuNgdVh2F42MsyAhjGO6YmLi7YPiKhhU
	 0Dp4OrETukyYw6W1j4ndguGHOLvyVEDPYtqKAomh/SYysKwe+huWDNVs767K1FhmFvXMw
	 Mg4MRYVsgRgC9OBkA0F6hbEsWajTr/HDxO0n9GX2rrN3YLvRUBcli7TTW3cunsv+WixGr
	 E39n5tZNIQWS8XSLitC1/KEa5GPKV+I2VRzHNXWCcjLE7LxJbEk4UtvX8kCiz49sKADiK
	 lWFymS7ftts+WeTWRPB1kri7AQgvGcRW+q4cdqcuM6gdmIN8fU3oI+kLkIkE/HyQr9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ZWcIIcpT;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F9960A2621
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F9960A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ZWcIIcpT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so18428235e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283523; x=1793888323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4igyGi55MaudIHEAxVdidERXeJK3vgMCughZT/NZkT8=;
        b=ZWcIIcpTgSCAzXCPhcGY0KOX4pq9i+ABkMk+9MXF2Vw8ihBByKn4i08GyWzkHdXY5j
         d6/jBrzJ9XLgOTni+i24TRzqjgqdg75E1FP+9i//bNDLliblIS8SdTItUNjpfkH7515w
         KOoxzW0iKXsLnvnr6z8GlAG6SkAnnn25i4nPqO77jb0habAMTkt+ZK8Oevp36YH4xdv6
         zPR0ubnPgG0Duk5OgbgftJWqJaKgYzW2vpk4fkFmXvETNHV8quRYYd4QDhFEAfHEENyJ
         Z8hRlc0pGNRnRMPszPfzeJNVejIMXZCId8EWJm1oCV+X9lyV7ZshpPetNoDNSHirujb/
         eFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283523; x=1793888323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4igyGi55MaudIHEAxVdidERXeJK3vgMCughZT/NZkT8=;
        b=S8MJL9m6bWCyKkMzD1GDEiAB2NfXRahDuCoGmZcvrgjcBfQFaBU7oaYCH6jZwVZ7yc
         tBDUOCTdWTXXa7RzH1iyGhAjfNfeagbCBGikJ2n8tk3vmAgXJY/RBtQ1IM3uRimF18Yn
         0CApvlytuskNnSThWCnypKWF6Q5DCmOgesy8dQux1itZVhKOZH4ZTtzguY2bhMgTwF3o
         7whJg26cMw+3WOzJVZwxjZnMQlZB05ceN1rOATr0z72I8+euPwtT5NBf/FLrO0ffNwMb
         IC/xIO0COj6evyecmN3OS/ycPvtyMzMs4VaEzRs5wB2JrqrhgAPQBxmG/9QTNBOKMdpu
         J4wg==
X-Forwarded-Encrypted: i=1; AKwUvBwa0IrCfcSpvjpJk1DFZxKUP5nxm5jP+DUxgTxBBhWQriYN+mSYVKSkwy8CCHcvS5j0b/hP/VAKCiN8aVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHSettSG2XiV1sX2IJY5CzvPKyLx/Z2oYVNQdrMJozgEDxxRdd
	Jv/0oiyitvWyvVX9AYVODrjPY8Rl6/1vPwo0eSp616qpZRwX+zwvK9qE5J+aS8FFX3Q=
X-Gm-Gg: AYBFou3Wf69wcrpz8vmm++ggC0RB2ZUzbfXXinhKJqLWsdD4qMSL8GuF/8ctMPRX3xa
	hDmrDxP2V2WVheT+W2Pjc/lX+iALbLsS+iX0zSWaNOtUSiS857TCykz9iLCV+UvZW5OF8aitGSr
	NDInNSC1Aev1NfPhHhGCvCoeqOJ2BHYfa8hWKxshicn/3UmG4u2cVKcrJ9ZSXwQFzqbRgzcL4Mf
	rkFmZnMP4aJqvRPFEpONCzqWE53EQevScLiuTdY8yIHAFkvxZFnRecjfxPkMgZY8r8DT2NJYGOL
	vtnTl257iSEEerwn1DlEuC9kyudJEEkTuMfazy2pVm6ZZXx08CDIWxDO6Wfhb02kYwkb1Llz1Zz
	zOEaJELm+oI2Gg0PHml9q9Pq7FLZ9vM4opnh3hFDOKmkQOKJHi6fQa5Sm7j35tNrwqR6xekaZ3h
	Bj2DFL+Mx3tuK52xYb7Rg9E5faqRxwi3T4YdPKR2DDQSb+AiUr7DKhxzy0YLo9WRA4ApQ/9FCRF
	osqCViiOmdAqU/QQxwqf7E2jA7dcgvqR2MDQXg+WhByFUdGMpWwt7MDgnhGbIsgLEdbKGpw2qIq
	dZYNsr8WqYmrwSNGY7avTSVzhY7wxVbNbeB20O1F4mgdfUrSEfAJUnMOfxq0GJvSDLbSxdnn4ZI
	mFMwM
X-Received: by 2002:a05:600c:a11b:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a9672f97cfmr93797235e9.30.1793283522568;
        Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:25 +0000
Subject: [PATCH v7 04/18] media: sony-starvis2: Parameterise the
 configuration to allow for other models
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
Message-Id: <20261029-media-starvis2-v7-4-b33a1332fdfc@raspberrypi.com>
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

Several of the Sony Starvis 2 sensors are identical in the
majority of their programming, but differ largely only in the
size of pixel array and some timing parameters.

Parameterise those parameters in preparation for supporting other
variants.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 178 ++++++++++++++++++++++++--------------
 1 file changed, 114 insertions(+), 64 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 31aa1ec6ba40..b54e1c68afa0 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -52,17 +52,9 @@
 /* Lane Count */
 #define STARVIS2_REG_LANEMODE		CCI_REG8(0x3040)
 
-/*
- * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
- * pixels, thus giving us a rate of 74.25 * 8 = 594 MPix/s
- */
-#define IMX678_PIXEL_RATE		594000000
-#define IMX678_PIX_PER_CLK		8
-
 /* VMAX - Frame Length in Lines */
 #define STARVIS2_REG_VMAX		CCI_REG24_LE(0x3028)
 #define STARVIS2_VMAX_MAX		0xfffff
-#define IMX678_VMAX_DEFAULT		2250
 
 /* HMAX - Line Length in Cycles */
 #define STARVIS2_REG_HMAX		CCI_REG16_LE(0x302c)
@@ -103,8 +95,6 @@
 /* Sensor Identification */
 #define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
 #define STARVIS2_TYPE			BIT(0)
-#define IMX678_REG_MODULE_ID		CCI_REG16_LE(0x4d1c)
-#define IMX678_ID			0x02a6
 #define STARVIS2_MODULE_ID_DELAY	80000
 
 /* Common configuration registers */
@@ -137,7 +127,6 @@
 #define STARVIS2_TPG_COLORWIDTH_320PIX	2
 #define STARVIS2_TPG_COLORWIDTH_640PIX	3
 
-#define STARVIS2_REG_INTERFACE_SEL	CCI_REG8(0x4e3c)
 #define STARVIS2_INTERFACE_2L_4L	0x07
 #define STARVIS2_INTERFACE_8L_2x4L	0x7f
 
@@ -154,32 +143,11 @@
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
@@ -208,7 +176,7 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 min_hmax_4lane[] = {
+static const u16 imx678_min_hmax_4lane[] = {
 	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
 	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
 	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
@@ -268,7 +236,7 @@ static const int starvis2_tpg_val[] = {
 };
 
 /* Common configuration */
-static const struct cci_reg_sequence common_regs[] = {
+static const struct cci_reg_sequence imx678_common_regs[] = {
 	{ STARVIS2_REG_THIN_V_EN, 0x00 },
 	{ STARVIS2_REG_VCMODE, 0x01 },
 	{ CCI_REG8(0x306b), 0x00 },
@@ -651,16 +619,76 @@ static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
 };
 
+struct starvis2_variant {
+	const char *name;
+	u32 id_reg;
+	u32 id_mask;
+	u32 id_value;
+	u32 interface_sel_reg;
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
+	.interface_sel_reg = CCI_REG8(0x4e3c),
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
@@ -675,6 +703,7 @@ struct starvis2 {
 	struct regmap *cci;
 
 	const struct starvis2_model_info *info;
+	const struct starvis2_variant *variant;
 
 	struct clk *xclk;
 	u32 xclk_freq;
@@ -771,7 +800,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK: {
-		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
+		u32 hmax = (format->width + ctrl->val) /
+						starvis2->variant->pix_per_clk;
 
 		cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
 		break;
@@ -852,18 +882,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
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
 
@@ -878,12 +910,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
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
@@ -897,8 +929,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
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
@@ -908,8 +944,9 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
-	cci_write(starvis2->cci, STARVIS2_REG_INTERFACE_SEL,
-		  STARVIS2_INTERFACE_2L_4L, &ret);
+	if (starvis2->variant->interface_sel_reg)
+		cci_write(starvis2->cci, starvis2->variant->interface_sel_reg,
+			  STARVIS2_INTERFACE_2L_4L, &ret);
 
 	if (!ret)
 		starvis2->common_regs_written = true;
@@ -925,10 +962,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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
 
@@ -1082,11 +1119,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1095,7 +1137,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
-	cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
+	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1103,9 +1145,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
 
@@ -1120,7 +1163,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	detected = val & STARVIS2_TYPE;
 
 	/* Prefer to use sensor type specified in device tree */
-	if (info) {
+	if (info->codes) {
 		starvis2->info = info;
 		if (detected != info->type)
 			dev_err(&client->dev,
@@ -1129,11 +1172,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1164,7 +1208,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
+		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
@@ -1183,13 +1227,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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
@@ -1201,23 +1246,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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
@@ -1358,6 +1405,9 @@ static int starvis2_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
+	v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
+				 NULL);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -1438,7 +1488,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
-	{ .compatible = "sony,imx678" },
+	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

