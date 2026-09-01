Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABBA4A015D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289489; cv=none; b=Y6572Ikbx7BrTjoAKodzZrhf7tqLI4LOD6dAB24p+Vc1r4x+O7lvWpDC+8mR7r0RoXDMb8os8aHDxaXc3zjWOOoRTZEqf53Hq70V3cSjCitumNqVwB0xSXtT7fWdSqb1Fhpy3GopLHJbN6DFx/3yT0MlcACzg4AjwrsDOSTnJM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289489; c=relaxed/simple;
	bh=DUuUJMa3yyKrrOtsgfYnRwbO7tX9qRYwesjVaJLdInI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luforV6woMgi+KTwnw4JDM9zy/O09/aEInSa8qIWC+IvYLC5+cSEaz5jaYuzTnk7LSPX0zq0VMhNuStOB8rAMmLXU5PyZKW7I10hbjFIrsMLKmVV64QzeISAsF7DkN7gKp2BpOP+FhOaycJiqSlbT8w+lCcWbFIU2wE3NCaF7tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKAjcwL+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKAjcwL+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so893235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289485; x=1788894285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dHo1fpZBEgH1+4X904HRQ0OthAziuQvRZWXEFyYffY=;
        b=IKAjcwL+jqn/edIlfKfXWchCejuKr8apIZN5R0oVJI2PM2bMuXTcTv6ltECA0Y6O4V
         Qi9/7YjF8uCG7GxlT4ae50qjhFrE3/0U/u3D96Fk6GHF/ESJ/edAWdY323ZAsPfPke0/
         VPyEySGjmS7cyDUsr56alC1m4gn4nuDjv6mrsZyfC/QJxzKEw9kkjZ38+8rvmUj5lXkk
         aDoMt52i0ucyc5wiCogLylkkQ4qf+VEPCzeWXR0dGK25PhmNUhOHsmimDUaC8LLQMaCV
         UU2s9JrOk5RwtMYHtHlIMRiBgb4UMjvi/vHQuNEENxAN37YaHNSxXA9U6MKsumO1HguX
         gSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289485; x=1788894285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dHo1fpZBEgH1+4X904HRQ0OthAziuQvRZWXEFyYffY=;
        b=Oot/AUDV37JJU/1dN49fDlOxex3FYFeh3aMA9OFmSL5YDqnvUO0JGfajHDzK8OTs53
         Nadryo1osn+OX/g3q01SrHfmdoQ+d0rZ2RBsLWVgBw170TxTgPVBuk8omXIuoF3oAPyp
         zBzwu/vdpaj4Whru0ceTXhK7cmyekr4NfmPaUlXLTjHMXTSDOxmb3BpWPxbmdCakwwCD
         9wYTdaUnjFqZAmGFaEPXCOdWJz0m91jSWdeHfbPQbq+6676+fc4WSgVKrYuyJS9iyzrn
         yhXuUCobuhz4vJwqeBUZIhHqpVR4DVDjrn1CYM5hei6Ldzx6uddxGCbenkFUHaMV+lYp
         0hxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRQfS44c8PiPJhW8h5vHOlgTJPRuCOIsye0Sy4AiMaxwBUmpfg9cZrcJyoXKfoNy4GqLHwpX0ws3I1D+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lHDkSUjKel6LR48cIx+c3R+ygKS55jjywmgS6eVAjYmXx7dPPh
	cHafyo/sBEjXMsiysnntcAay+1/4uU3wb4cTTLDNfdVKOA9q6a2BA9CA
X-Gm-Gg: AR+sD12py0fcxS3VPgFqh5gUx5cKnJCo0QcC6+8bls3qy/j0BoFkmGJML0NiiHjAf84
	DmcMvWMvwFykVYCdlbEOQZmWcIljdqn6UzulZnQDgYDZxlaoo6N+A4nXB7GnrtEM4tl9NvPZQiT
	9YMlLbUBWqBpJj+fefFxnzp7v57yLCxf+cT0KWTrXXVduBY0Z3lmDFQHhQsf5iF0RXMIwaJ5+wq
	XLrt5EiDeMsCVbRdfxbwoSVgowveQ5IkkWbFOaZp1lXb3mQ1S5fYoCctqYBmcdfKmLk+R4q6gR5
	bxka6+sYv5M5lSEuRji9hPGk8/jC4h8QNyvCgnBJ/dnl7B4fVYWBoRIguAH8S6XPLYGMj66a6VX
	u0mmzs6jDXJspKClV5q3ISPjs4QzjBbR3F+4CJwQFF8pt/Xfg3TRkQQwODPrHnFaYz2YD5ql+nF
	xKKfKJSM7kaSaZVM5yKWgyLLnZsIPrPh1NiOIeLNaoBdkNxD//1D8MsZ6RNO6Tu3JL1xYjzpKdN
	Vg1vZzdq1SjAkzbJ6dkNj1bouE/tVvg42/3ozB+cxAjByEE0cxGRQ==
X-Received: by 2002:a05:600c:3492:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49cdc4523d5mr216139765e9.10.1788289484609;
        Tue, 01 Sep 2026 12:04:44 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Tue,  1 Sep 2026 21:04:24 +0200
Message-ID: <bfa79097b66fc3ed6155c7b8c5368b2e0fe9e882.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
the existing mode tables program the sensor PLL for 24 MHz. Reusing
those settings produces incorrect internal and CSI-2 clocks.

Accept both input rates and use the actual rate for the reset delay. For
19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
the generic mode table.

The 19.2 MHz platform uses the per-channel manual white-balance
registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
and expose their 1x-to-4x range, while retaining the existing
long-exposure gain block for 24 MHz systems.

The manual white-balance register definitions and programming follow
the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
notice in this file. No proprietary source or tuning binary is included.

Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
and real 10-bit Bayer frames.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov8858.c | 130 +++++++++++++++++++++++++++++++++----
 1 file changed, 118 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index d95f034de752..8d697b8d11c6 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -3,10 +3,9 @@
  * Copyright (C) 2023 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  * Copyright (C) 2022 Nicholas Roth <nicholas@rothemail.net>
  * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2017 Intel Corporation.
  */
 
-#include <linux/unaligned.h>
-
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -18,6 +17,8 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -28,8 +29,9 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
-#define OV8858_LINK_FREQ		360000000U
-#define OV8858_XVCLK_FREQ		24000000
+#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
+#define OV8858_XVCLK_FREQ_24MHZ		24000000
+#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
 
 #define OV8858_REG_SIZE_SHIFT		16
 #define OV8858_REG_ADDR_MASK		0xffff
@@ -59,6 +61,14 @@
 #define OV8858_LONG_GAIN_STEP		1
 #define OV8858_LONG_GAIN_DEFAULT	0x80
 
+#define OV8858_REG_MWB_RED_GAIN		OV8858_REG_16BIT(0x5032)
+#define OV8858_REG_MWB_GREEN_GAIN	OV8858_REG_16BIT(0x5034)
+#define OV8858_REG_MWB_BLUE_GAIN	OV8858_REG_16BIT(0x5036)
+#define OV8858_MWB_GAIN_MIN		0x400
+#define OV8858_MWB_GAIN_MAX		0xfff
+#define OV8858_MWB_GAIN_STEP		1
+#define OV8858_MWB_GAIN_DEFAULT		0x400
+
 #define OV8858_REG_LONG_DIGIGAIN	OV8858_REG_16BIT(0x350a)
 #define OV8858_LONG_DIGIGAIN_H_MASK	0x3fc0
 #define OV8858_LONG_DIGIGAIN_L_MASK	0x3f
@@ -93,6 +103,33 @@ struct regval_modes {
 	const struct regval *mode_4lanes;
 };
 
+struct ov8858_gain_range {
+	u32 min;
+	u32 max;
+	u32 step;
+	u32 def;
+};
+
+enum ov8858_xvclk_index {
+	OV8858_XVCLK_24MHZ,
+	OV8858_XVCLK_19_2MHZ,
+};
+
+static const struct ov8858_gain_range ov8858_digital_gain_ranges[] = {
+	[OV8858_XVCLK_24MHZ] = {
+		.min = OV8858_LONG_DIGIGAIN_MIN,
+		.max = OV8858_LONG_DIGIGAIN_MAX,
+		.step = OV8858_LONG_DIGIGAIN_STEP,
+		.def = OV8858_LONG_DIGIGAIN_DEFAULT,
+	},
+	[OV8858_XVCLK_19_2MHZ] = {
+		.min = OV8858_MWB_GAIN_MIN,
+		.max = OV8858_MWB_GAIN_MAX,
+		.step = OV8858_MWB_GAIN_STEP,
+		.def = OV8858_MWB_GAIN_DEFAULT,
+	},
+};
+
 struct ov8858_mode {
 	u32 width;
 	u32 height;
@@ -104,6 +141,7 @@ struct ov8858_mode {
 
 struct ov8858 {
 	struct clk		*xvclk;
+	unsigned long		xvclk_rate;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*pwdn_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
@@ -121,6 +159,41 @@ struct ov8858 {
 	unsigned int		num_lanes;
 };
 
+/*
+ * Cherry Trail MRD production settings for a 19.2 MHz input and 360 MHz
+ * CSI-2 link. Apply these after the otherwise reusable 24 MHz mode table.
+ *
+ * Besides the corrected sensor/MIPI PLL divisors, keep the final common
+ * black-level settings here. The per-mode tables retain their resolution
+ * dependent black-column anchors and window sizes.
+ */
+static const struct regval ov8858_cht_mrd_19_2mhz[] = {
+	{0x0300, 0x00},
+	{0x0302, 0x27},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030b, 0x00},
+	{0x030d, 0x27},
+	{0x030e, 0x00},
+	{0x030f, 0x04},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x3f08, 0x08},
+	{0x400a, 0x01},
+	{0x400d, 0x10},
+	{0x4011, 0x20},
+	{0x403e, 0x08},
+	{0x4040, 0x07},
+	{0x4041, 0xc6},
+	{0x4202, 0x00},
+	{0x4500, 0x58},
+	{0x470b, 0x28},
+	{0x4837, 0x15},
+	{0x58f4, 0x32},
+	{0x58f8, 0x3d},
+	{REG_NULL, 0x00},
+};
+
 static inline struct ov8858 *sd_to_ov8858(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ov8858, subdev);
@@ -1345,6 +1418,13 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
+	/* The mode tables contain PLL settings for a 24 MHz input clock. */
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
+		ret = ov8858_write_array(ov8858, ov8858_cht_mrd_19_2mhz);
+		if (ret)
+			return ret;
+	}
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);
 
@@ -1540,6 +1620,21 @@ static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
 	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
 }
 
+static int ov8858_set_mwb_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	int ret;
+
+	ret = ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, NULL);
+	if (ret)
+		return ret;
+
+	ret = ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN, gain, NULL);
+	if (ret)
+		return ret;
+
+	return ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN, gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1586,7 +1681,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
+		if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
+			ret = ov8858_set_mwb_digital_gain(ov8858, ctrl->val);
+		else
+			ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
@@ -1622,9 +1720,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;
 
-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1643,7 +1738,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
 
 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1701,9 +1796,11 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
+	const struct ov8858_gain_range *digital_gain_range;
 	const struct ov8858_mode *mode = &ov8858_modes[0];
 	struct v4l2_fwnode_device_properties props;
 	s64 exposure_max, vblank_def;
+	unsigned int xvclk_index;
 	unsigned int pixel_rate;
 	struct v4l2_ctrl *ctrl;
 	u32 h_blank;
@@ -1746,10 +1843,12 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
 			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
 
+	xvclk_index = ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ ?
+		OV8858_XVCLK_19_2MHZ : OV8858_XVCLK_24MHZ;
+	digital_gain_range = &ov8858_digital_gain_ranges[xvclk_index];
 	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV8858_LONG_DIGIGAIN_MIN, OV8858_LONG_DIGIGAIN_MAX,
-			  OV8858_LONG_DIGIGAIN_STEP,
-			  OV8858_LONG_DIGIGAIN_DEFAULT);
+			  digital_gain_range->min, digital_gain_range->max,
+			  digital_gain_range->step, digital_gain_range->def);
 
 	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
@@ -1887,6 +1986,13 @@ static int ov8858_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
 				     "Failed to get xvclk\n");
 
+	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
+	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
+	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported xvclk rate %lu Hz\n",
+				     ov8858->xvclk_rate);
+
 	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov8858->reset_gpio))
-- 
2.53.0

