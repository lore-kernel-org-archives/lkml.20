Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB940C5AE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750591; cv=none; b=GtJvWzGO2z0fHUzOKOf4+irwQ9wW3xeUNXdtKByM/Qo91ieMBBvr2ch+j8Wk8tt/qFdnbl7eUXToCm6odGT8Rk9ImHIfi2LBSX/DU47zJF991A5exo74Buw7FWTXiY6JKw/7QWxwcN7S56g0Ph9OBUdoTpdtOQr2VpZmqH4wVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750591; c=relaxed/simple;
	bh=ERoCNTZ/CHn8B9pukzOen5JWEiK+GdKUOJzwBwFx7QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXd5Kedao7GJnSdchFTwduUV6wWFCf+pbPGepiGKU1L6It9PgiPNufjVykUqoOH5RUNVs2ZNa//Y4Lgjz8w+/fEZqTEYxlnAB+pUrOzplZxcje8D3NoGoSezlE9BEo5z6vgq70RaA20xVghVgycI3Odul9fO7H8qLvOsdcDpI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfilKAnl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfilKAnl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1312268a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750587; x=1788355387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG3JNu73SFfzEruBErjSVJbPbEEwmrekUywQqhuxvaw=;
        b=PfilKAnlW9Alb8vi8kIfkR5TQPGToKXR9QMtdQwsgMdDoKrInEoWorlF51hT5Tim2N
         2ygSuhsIe9RkpuB2t6H3pg1sKSUkSF891xUUytqMLBFYhlU+QzAv3m5Rs8fb3rjbIZ29
         FyZ/PW775PzUv5wY5PSKjUTW1vSpdm9fM8ICAsPPFhugQ7kAALP6h8tsSoUKE6DY5J+J
         VnCF+PtdBfuX73gmyYeUgrw7qVWn6sGm6EkvcoioPYJFky35o7FCNNitMrAmKB7St/jY
         eE021GEMBDJWVYl8W2sRwpF5ummuta9kgqBxGM+wGdNKDGbFDnPCEA1eGK0KdSuLvGS9
         /pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750587; x=1788355387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IG3JNu73SFfzEruBErjSVJbPbEEwmrekUywQqhuxvaw=;
        b=lUX0lEIN/CGwON+pmH2fV3sEnHbyRNkuKDPXj7vj6I6M3Vtk93TtEdJ2UY2cgElFYf
         a4ZJMLgUMtQP/QrtkOcMs4FA1UH5poSDW4g5Wlck4OtV4EPYYZ1J0+rNkC7EzNl3sYWE
         7rYo3SMtqAsPFDCouyYPgnCXbwQ0YHnM3ZioTuAx6ox4QCX7yO4Lhuo3bXEXrqhVpgRm
         KCcidVwOsXxSpBpzwpts9sPbaQDfUvFUrMr/pZa1lgjfd+bceJ0WVeGINPL+wR8Fh3w2
         zlttOtU71jM5szPXYKRASA1Cs7Y98o1PKZJs9mQmegNp2uacXNxIs15TGlIhZrA1dlwX
         3X7g==
X-Forwarded-Encrypted: i=1; AHgh+RqFF1Gl1Brx1K7uwQqqZpH9JXOVZBqVA+yMf7x9tjYjvJ0mek5JyG/YC/7Q0RGnsm40uDFseV0sN/6/ofo=@vger.kernel.org
X-Gm-Message-State: AFuF++mQWlZw5HdttRD+xS0cHIikiqgLlk+ffj16Tg9xl0d3zgB5yQzX
	r38baPNA6zx5Tk/wcb1KI4xHEO3sGbZjmaBjI95JS1TpyGhp08rQIsY1
X-Gm-Gg: AR+sD12ZaSU+iPRsXK+yvnTjn3ZUXbRzhVAsq8/tsHAx19xWF3I6OdoR2MLAQwrSvm1
	0RUoMnRetXhocl5tXb1mn/E1js9E8G1t0NNF5BJz7Hr3A/MtxuedaLyimh5WMHw+TdI1/au+cAr
	cf6qQCD9HbeX5Iv+a1BUkMcl/4yLlSUQIVTXhLoQNO3GSJ1bTQvQpwidlkWK7iiVLhc8AfLp4SM
	0kdVM4B0KZBqGEzDonqTd5PSyAg5eHpdlYxKv5PVwxKUtg1kl9imCK4MQCYeJiOSelOxbs+IdRd
	sYyAK/HP1iodXUc2Tk0RxY31N4FIKcoupLmT4b3fKm8P9FuNaIk8Nahbfe7OW+SH5CgnUEEvYVl
	43Yz1/FQH/8O1PBROD345Ui+0x2EUxFN87Kb29XWiJW7W5qZl/iGQxiiJqTurLFsb8zzLuwkCeN
	0cpvJnS6+IQLpeduWCWZjuY6ljfNj3sdIynVz0iB4OAy1c283I7XypVQP0hp5q9wp+U7oMKZF6I
	iJSme3Nk+RUnirUHlPcg7rfcDHN/RN+7YSLAlHfu4A=
X-Received: by 2002:a05:6402:4285:b0:698:5610:76e5 with SMTP id 4fb4d7f45d1cf-6a5df5cae52mr11531030a12.6.1787750586429;
        Wed, 26 Aug 2026 06:23:06 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Wed, 26 Aug 2026 15:22:49 +0200
Message-ID: <20260826132256.3343451-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
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
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov8858.c | 126 ++++++++++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..f2bed3e88382 100644
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
@@ -18,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -29,7 +29,8 @@
 #include <media/v4l2-subdev.h>
 
 #define OV8858_LINK_FREQ		360000000U
-#define OV8858_XVCLK_FREQ		24000000
+#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
+#define OV8858_XVCLK_FREQ_24MHZ		24000000
 
 #define OV8858_REG_SIZE_SHIFT		16
 #define OV8858_REG_ADDR_MASK		0xffff
@@ -59,15 +60,23 @@
 #define OV8858_LONG_GAIN_STEP		1
 #define OV8858_LONG_GAIN_DEFAULT	0x80
 
+#define OV8858_REG_MWB_RED_GAIN		OV8858_REG_16BIT(0x5032)
+#define OV8858_REG_MWB_GREEN_GAIN	OV8858_REG_16BIT(0x5034)
+#define OV8858_REG_MWB_BLUE_GAIN	OV8858_REG_16BIT(0x5036)
+#define OV8858_MWB_GAIN_MIN		0x400
+#define OV8858_MWB_GAIN_MAX		0xfff
+#define OV8858_MWB_GAIN_DEFAULT		0x400
+
 #define OV8858_REG_LONG_DIGIGAIN	OV8858_REG_16BIT(0x350a)
 #define OV8858_LONG_DIGIGAIN_H_MASK	0x3fc0
 #define OV8858_LONG_DIGIGAIN_L_MASK	0x3f
 #define OV8858_LONG_DIGIGAIN_H_SHIFT	2
 #define OV8858_LONG_DIGIGAIN_MIN	0x0
 #define OV8858_LONG_DIGIGAIN_MAX	0x3fff
-#define OV8858_LONG_DIGIGAIN_STEP	1
 #define OV8858_LONG_DIGIGAIN_DEFAULT	0x200
 
+#define OV8858_DIGITAL_GAIN_STEP	1
+
 #define OV8858_REG_VTS			OV8858_REG_16BIT(0x380e)
 #define OV8858_VTS_MAX			0x7fff
 
@@ -104,6 +113,7 @@ struct ov8858_mode {
 
 struct ov8858 {
 	struct clk		*xvclk;
+	unsigned long		xvclk_rate;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*pwdn_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
@@ -121,6 +131,41 @@ struct ov8858 {
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
@@ -1345,6 +1390,14 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
+	/* The mode tables contain PLL settings for a 24 MHz input clock. */
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
+		ret = ov8858_write_array(ov8858,
+					 ov8858_cht_mrd_19_2mhz);
+		if (ret)
+			return ret;
+	}
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);
 
@@ -1523,6 +1576,31 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+	int ret;
+
+	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ) {
+		long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+			    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+			     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+		return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
+				    long_gain, NULL);
+	}
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
@@ -1531,7 +1609,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1647,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
@@ -1616,9 +1683,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;
 
-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1637,7 +1701,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / 1000 / 1000);
 
 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1697,6 +1761,9 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
 	const struct ov8858_mode *mode = &ov8858_modes[0];
 	struct v4l2_fwnode_device_properties props;
+	u32 digital_gain_default = OV8858_LONG_DIGIGAIN_DEFAULT;
+	u32 digital_gain_max = OV8858_LONG_DIGIGAIN_MAX;
+	u32 digital_gain_min = OV8858_LONG_DIGIGAIN_MIN;
 	s64 exposure_max, vblank_def;
 	unsigned int pixel_rate;
 	struct v4l2_ctrl *ctrl;
@@ -1740,10 +1807,16 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
 			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
 
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
+		digital_gain_min = OV8858_MWB_GAIN_MIN;
+		digital_gain_max = OV8858_MWB_GAIN_MAX;
+		digital_gain_default = OV8858_MWB_GAIN_DEFAULT;
+	}
+
 	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV8858_LONG_DIGIGAIN_MIN, OV8858_LONG_DIGIGAIN_MAX,
-			  OV8858_LONG_DIGIGAIN_STEP,
-			  OV8858_LONG_DIGIGAIN_DEFAULT);
+			  digital_gain_min, digital_gain_max,
+			  OV8858_DIGITAL_GAIN_STEP,
+			  digital_gain_default);
 
 	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
@@ -1881,6 +1954,13 @@ static int ov8858_probe(struct i2c_client *client)
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

