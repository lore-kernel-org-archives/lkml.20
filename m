Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939C36EAB1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199274; cv=none; b=g9dNNjJIIoCFFX8qTUO9P9R4CAydGNGE2cFx7QcEpOB755DVgk0lG8xyO7FjVG6z/9YRvS1ryuis/D9g+GAED0eL2hbKb6jyuEpzsLchKAEYa5MmsCNyoyNoEACeQ1W7xCO98AjIS64O/MT1s0sFom6HvKwK2RincgFb6TlwXFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199274; c=relaxed/simple;
	bh=X3y0+huGeBkqz2SIeq+v7VgkzaC0sHaiJPQz2ZX1DK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1mIvRnlcHyu+eRqzKF8NJn9Ob2kxf+HRPGZki9KnDxA7UvJnkAYalT25uLMS83EAdCRbtpT/xQHJppDXNql55iKApgrq+7s16EH1uaoJSnfadFDVyFM+PLq1bmhWsLqoXz55ey3sMVM81uR7sNW6Kwr8BOsX4/kAttOuau6O4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7nJ1Lxx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7nJ1Lxx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e9c5960so30368f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199270; x=1788804070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYpa27SwXt8L5hkAEPMbN96uEotCPJqdNFD3yiUDF0s=;
        b=V7nJ1LxxPtFDS3K38kuaBTaa/ZYJilJEnP3bz0m6fnBd2d7WICwzF68LSwkv/zr1Hj
         s+p7O48+/QiK44QPLlbNAidIXnhgDKkMGo7zSzDuFewJ+QBvx9wBSdHa92tOKKTYnOay
         zSV3Ea0VnBwzvL6jlrghbl3cCq3i/jVo7B8fRVm0eT5xVTagDIZCxg233KeDiY/rqFTu
         DK8esgXpp37sZ8eDH3Gn+TxLt7Ed7gwX5UWblAY03xuwn1RbOQm08S/1dVH5l672hjcU
         k84nZArGqIWySQ6eBk5w6FDPidH7BhmmXNXe/tyqu1isv9UgkZcrV6pN+IGu5HpAWPHR
         cZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199270; x=1788804070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYpa27SwXt8L5hkAEPMbN96uEotCPJqdNFD3yiUDF0s=;
        b=j7mMGxd9nAF8wdSFLlLnLRCwgmXn5y2K2SdXD2wcf0SqU+pjwoCNHns7+Vqq/YcNgK
         XQebcuU9MncAyUIlSUrvrAG3RQASVQKzje4Fno6BTq6yOI/mzYqpCQ7NoovsKP9JI2M5
         KsC3DDPhFxyj6Ti++DAkIWRbcDoxE/orFwg11zTvGmbypK99IcJE/OyuXYwL9D6w/Ocy
         5Bi0jB2gqiYv0RAYYMV/ieN7kPaiWb0cPs7Z6A1K0kglfAq6Xr4flbFy67MmJiGD470q
         GC/98TjPOtYJihb/uALCINGRnvzSXdaNxmXhbd+9jrNexzAZwy1mIEb+02/6CP/esScM
         G0CQ==
X-Forwarded-Encrypted: i=1; AKwUvByPqFsrZ7rXRFw0rUSahBmmFbuP9gB4AOZrY7a4qyCCEdup0nVUJHAt0U0R2k8B109LsaecNQ9Gqoq1jos=@vger.kernel.org
X-Gm-Message-State: AFuF++lkJvm8lANykU9tEzKkfVd1WHrOpxYaHeF+oKpjaDxXy3OHBAnR
	OoRIG1w8r0bgEQzMU2PgRCjMr4cltO4wyn24I0orzXhe6Y9iXcNtWCG/
X-Gm-Gg: AYBFou04Mfl7CN0120YlcZiQQoSFJY0Wpjq/qwBojXCWiz40UMvX2rp+Zr6bW1SXx4e
	LXhzxpqAa94XlMUy3jFiMOWCVvm8kMBsJXL75pOjiy+Ou7x3N+Tcxh6NR2Gq6IKZ/6ntZXNzwP1
	fWWBnSwSD2rgTaQOP+VcWX40yRJch/WSL0JdjSeaVuwzyJT+jdLTwaLPhl9WksyqYTFRKLdR/pT
	x3UiUK7asif0nYaPB6D6trpeJfzZFJ/WASYkIbZYEvrAXgiAQFWjdkjUkM5TlPyolCeHXbJL5vC
	cFFlnms4T2+mzdB94HHSA6TuW3piEyFGYhJQUiTBGs2lOW/t1YeVhTEChHC/3CN0Yb1usWzASNK
	3L3uH60i4we1abWQlSmnmPiWiOOvWMPOmu7X3CfTVpSqwT1wNYBNiCtmRv7ttLO5XYkAB8ARBEf
	KxvjsIr7SatHinkqdYUUdZoDixL662D5HUv+7pElrIgpvs6FTTKJSGRwOwKNPQ9O1T5xaY6bEqP
	guz3OotfjR4hRIBmb1FcWqs346q7FziXCwKSIqaS0g=
X-Received: by 2002:a05:6000:4b0c:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-482f7977ad2mr44035745f8f.4.1788199269196;
        Mon, 31 Aug 2026 11:01:09 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:08 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Mon, 31 Aug 2026 20:00:47 +0200
Message-ID: <20260831180101.3109854-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
index d95f034de752..d45659bd5dda 100644
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
+#define OV8858_XVCLK_FREQ		(24 * HZ_PER_MHZ)
+#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)
 
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
+	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported xvclk rate %lu Hz\n",
+				     ov8858->xvclk_rate);
+
 	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov8858->reset_gpio))
-- 
With Best Regards,
Maurizio Casciano

