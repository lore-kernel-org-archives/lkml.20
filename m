Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6034A49AA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360837; cv=none; b=rMZ3BY/Me60O8BjU63ewsIcBye/C6h0Sh3F3iHt1rR4P/iakxQ5+FwJMYHa2ka4BWmJ9rBxmKF+VYfTspEvWtZkSif4Q6PH+uedTUwJuuuiIiEFlYFEMtYgqSI52CgF4xN93hjrB5kItxd3G72ktmMTzqKv0Cll0kNFe8TXQ4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360837; c=relaxed/simple;
	bh=Ouc/wVhe1kx+d2EXVFit3VKGVbls5oMRIX/O7GKCAPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASl0w4vDRBsQmOpnKiFHj+QGYf4L0pqSieEE6+TB9qyhg59dKSdRl7qFE3srzUSL/MVBxFFW/43btqq39G5LzGtkzLc5uogkEk18Up5KnOvY/Z76klpelL9IxRvvHhe1yh6y/hPhNpf9arrHrCbzcV6WUyX2UqR/Ja3xA3bjf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcdJPpwP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcdJPpwP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so862854f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360833; x=1788965633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrkNOriJX9DgyhiRvmYfIW8aEH5T9O16KOXwGHDt2mY=;
        b=kcdJPpwPW7s/JKKQ9thPtVIp6KR5YBRYR7HSKw6kDtxY5SwXasuKk2lUHQc7eRYql2
         M7uGRP95grfvPN2qwbgUTejAzg3Zaze7CbpT80V99d6nXPMXKCm7QHoKE0IGeZ0FgPgo
         yE/xy7Z+bInrwqQJB9XRbzoF5mIt8p5UZSIX98iGFF9NwEHT6kQc/e/aY0om8vn6CMha
         vLPFFZc+0a+pFL9IdTWuzJKzJKshuoxBCfPYyW37Qjc6zitf4wry8XBjJ/YiGL9c4IPj
         1h/KUmJ6+qiw7dUxMTZ56Qsg9akEtVVStC5U+x3oIuCHjDK6cMRKjGttGuKP1kJ7+7Xq
         wbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360833; x=1788965633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrkNOriJX9DgyhiRvmYfIW8aEH5T9O16KOXwGHDt2mY=;
        b=XFU8Q2KICO5l7jI5XK0FgnwhvwIQKHAYw5TnvCBSA1ixfgYY1UkWuagVYuw+t0YqpX
         Muy1zGuVl2BRKyaepfoMceH2HEANzsRgqvvCLqNScTQQKKaIvNUL6FfbRo96HU+i5iXk
         1KwKBCK0i7d5nQNngZnZRYAyjbSYrvIv4QSOStrfo8HycWkdygvm1cLRhtP7293xfZF8
         qgGXtKcCbmuF8hUiWVh7MTDv5SW0PoIQA+INqYLAe5XfZdJKAil5VakHLo7Jsm8jbSkU
         S6bY1asr9roYpHd8PdcGM9XbPAcCFfthB8SqN6cKIoq15P9dzpmDh7HK/wih6IkGRJE8
         CRJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC9yGUEnfWEusw/NIo3o0HS9DaSrRyXq/7atws0tj0ygWS1f4Ar+qVK2GyWwjeDE26mpkLOMOL5WEhcmI=@vger.kernel.org
X-Gm-Message-State: AFuF++mfx6Edm8jwsCIDqc/Ic6yZQ/bDvddGMqW7zJUNh5l65aCbqM+P
	1jtgg/zUf8rhzJPSR3d/mzLOqhjUW1LzFfslk3BhJxdjmxyj9YCzff/s
X-Gm-Gg: AYBFou2Kbx+ROlAxQtybJCaM0QUbVRhuWxJVcGufXPl3Rxu968XMfwVlYrPkGHGPRFl
	oH6scUKJIcDZk6HobgX0I6P5BJJ9TrTNcAv/Ltjr4miDMD1CrSIPKv7DEBtXWEnLCcrg0TxqxKl
	xRvQK3bvpylGpSqPUu3F+spkYCYeTCQn8Zw2fHjsZJNaqg9QGJYK4Hv8kQ3HAQumwnBwNtmR5l5
	W6L1Z9NWNON0+fYUpLhvlaW6wgp+FDh/x2DU6lF6trHXkoohhIIuAvQx0bWPD5uomYa47NjPbp5
	GYCxYHdM0hUcqAQ0h5ukHhmtVTCiVD1UDxwDdOGaolpz5MKg/okRi/y+krtlEs1DR4kBd209/yw
	MBVMAtwYnA8YJIOvaFCrZAgZr5mnBMeztJPLZtxO3kBx06AQRRY4oXGwDkt/KyFw2Mko5tGGVpx
	afBV5GXpZCrjmwT7MDcUhBSeQ7jn1dfmIbNHNMaG4aR8v2/xugWggLA0WV4493bOfAiBcaM7oUe
	NItkqRzsZdW6WY/f0uM4y6y3hk0d75ahk5AqIkEXhQA
X-Received: by 2002:a05:6000:4a0a:b0:484:39b4:5bc9 with SMTP id ffacd0b85a97d-484914cba9amr10008560f8f.26.1788360832533;
        Wed, 02 Sep 2026 07:53:52 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:52 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Wed,  2 Sep 2026 16:53:31 +0200
Message-ID: <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

Accept both input rates and use the actual rate for the reset delay.
Move the 24 MHz PLL and global timing registers out of the common mode
tables, provide revision- and lane-specific arrays, and select the
matching clock programming explicitly when starting the stream.

Keep the existing long digital-gain control independent of the input
clock. Expose the per-channel manual white-balance registers as separate
red and blue balance controls, keep green at unity, and accumulate write
errors while programming the three channels.

The manual white-balance register definitions and programming follow
Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright
notice in this file. No proprietary source or tuning binary is included.

Tested on the Lenovo Yoga Book YB1-X91L OV8858 with three complete
10-bit raw Bayer frames, independent red, blue and digital gain updates
during active streaming, and front and rear camera capture in Cheese.

Link: https://lore.kernel.org/linux-media/apf7cJOoXrl_wZfr@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM [Codex] [Sparse]
---
 drivers/media/i2c/ov8858.c | 182 +++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index d95f034de752..e040c1fa0a94 100644
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
@@ -104,6 +114,7 @@ struct ov8858_mode {
 
 struct ov8858 {
 	struct clk		*xvclk;
+	unsigned long		xvclk_rate;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*pwdn_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];
@@ -115,12 +126,87 @@ struct ov8858 {
 	struct v4l2_ctrl	*exposure;
 	struct v4l2_ctrl	*hblank;
 	struct v4l2_ctrl	*vblank;
+	struct v4l2_ctrl	*red_balance;
+	struct v4l2_ctrl	*blue_balance;
 
 	const struct regval	*global_regs;
+	const struct regval	*xvclk_regs;
 
 	unsigned int		num_lanes;
 };
 
+/* Keep input-clock programming separate from the common sensor setup. */
+static const struct regval ov8858_24mhz_r1a_2lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x00},
+	{0x030f, 0x09},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00},
+};
+
+static const struct regval ov8858_24mhz_r2a_2lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x02},
+	{0x030f, 0x04},
+	{0x0312, 0x03},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00},
+};
+
+static const struct regval ov8858_24mhz_r2a_4lane[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x030e, 0x00},
+	{0x030f, 0x04},
+	{0x0312, 0x01},
+	{0x031e, 0x0c},
+	{0x4837, 0x16},
+	{REG_NULL, 0x00},
+};
+
+/*
+ * Cherry Trail MRD production settings for a 19.2 MHz input and 360 MHz
+ * CSI-2 link.
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
@@ -131,13 +217,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
 	{0x0100, 0x00},
 	{0x0100, 0x00},
 	{0x0100, 0x00},
-	{0x0302, 0x1e},
-	{0x0303, 0x00},
-	{0x0304, 0x03},
-	{0x030e, 0x00},
-	{0x030f, 0x09},
-	{0x0312, 0x01},
-	{0x031e, 0x0c},
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -370,7 +449,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32},
-	{0x4837, 0x16},
 	{0x4850, 0x10},
 	{0x4851, 0x32},
 	{0x4b00, 0x2a},
@@ -405,13 +483,6 @@ static const struct regval ov8858_global_regs_r2a_2lane[] = {
 	 */
 	{0x0103, 0x01}, /* software reset */
 	{0x0100, 0x00}, /* software standby */
-	{0x0302, 0x1e}, /* pll1_multi */
-	{0x0303, 0x00}, /* pll1_divm */
-	{0x0304, 0x03}, /* pll1_div_mipi */
-	{0x030e, 0x02}, /* pll2_rdiv */
-	{0x030f, 0x04}, /* pll2_divsp */
-	{0x0312, 0x03}, /* pll2_pre_div0, pll2_r_divdac */
-	{0x031e, 0x0c}, /* pll1_no_lat */
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -648,7 +719,6 @@ static const struct regval ov8858_global_regs_r2a_2lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -810,13 +880,6 @@ static const struct regval ov8858_global_regs_r2a_4lane[] = {
 	{0x0103, 0x01}, /* software reset for OVTATool only */
 	{0x0103, 0x01}, /* software reset */
 	{0x0100, 0x00}, /* software standby */
-	{0x0302, 0x1e}, /* pll1_multi */
-	{0x0303, 0x00}, /* pll1_divm */
-	{0x0304, 0x03}, /* pll1_div_mipi */
-	{0x030e, 0x00}, /* pll2_rdiv */
-	{0x030f, 0x04}, /* pll2_divsp */
-	{0x0312, 0x01}, /* pll2_pre_div0, pll2_r_divdac */
-	{0x031e, 0x0c}, /* pll1_no_lat */
 	{0x3600, 0x00},
 	{0x3601, 0x00},
 	{0x3602, 0x00},
@@ -1053,7 +1116,6 @@ static const struct regval ov8858_global_regs_r2a_4lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -1345,6 +1407,10 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
+	ret = ov8858_write_array(ov8858, ov8858->xvclk_regs);
+	if (ret)
+		return ret;
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);
 
@@ -1540,6 +1606,21 @@ static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
 	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
 }
 
+static int ov8858_set_mwb_gains(struct ov8858 *ov8858)
+{
+	int ret = 0;
+
+	ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN,
+		     ov8858->red_balance->val, &ret);
+	/* Green is the unity reference for the red and blue balance controls. */
+	ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN,
+		     OV8858_MWB_GAIN_DEFAULT, &ret);
+	ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN,
+		     ov8858->blue_balance->val, &ret);
+
+	return ret;
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1588,6 +1669,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_DIGITAL_GAIN:
 		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov8858_set_mwb_gains(ov8858);
+		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
 				   ctrl->val + format->height, NULL);
@@ -1622,9 +1707,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;
 
-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1643,7 +1725,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
 
 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1709,7 +1791,7 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 	u32 h_blank;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(handler, 10);
+	ret = v4l2_ctrl_handler_init(handler, 12);
 	if (ret)
 		return ret;
 
@@ -1751,6 +1833,19 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 			  OV8858_LONG_DIGIGAIN_STEP,
 			  OV8858_LONG_DIGIGAIN_DEFAULT);
 
+	ov8858->red_balance =
+		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
+				  OV8858_MWB_GAIN_STEP,
+				  OV8858_MWB_GAIN_DEFAULT);
+	ov8858->blue_balance =
+		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
+				  OV8858_MWB_GAIN_STEP,
+				  OV8858_MWB_GAIN_DEFAULT);
+
 	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
@@ -1804,15 +1899,20 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
 
 	if (id == OV8858_R2A) {
 		/* R2A supports 2 and 4 lanes modes. */
-		ov8858->global_regs = ov8858->num_lanes == 4
-				    ? ov8858_global_regs_r2a_4lane
-				    : ov8858_global_regs_r2a_2lane;
+		if (ov8858->num_lanes == 4) {
+			ov8858->global_regs = ov8858_global_regs_r2a_4lane;
+			ov8858->xvclk_regs = ov8858_24mhz_r2a_4lane;
+		} else {
+			ov8858->global_regs = ov8858_global_regs_r2a_2lane;
+			ov8858->xvclk_regs = ov8858_24mhz_r2a_2lane;
+		}
 	} else if (ov8858->num_lanes == 2) {
 		/*
 		 * R1A only supports 2 lanes mode and it's only partially
 		 * supported.
 		 */
 		ov8858->global_regs = ov8858_global_regs_r1a;
+		ov8858->xvclk_regs = ov8858_24mhz_r1a_2lane;
 		dev_warn(&client->dev, "R1A may not work well!\n");
 	} else {
 		dev_err(&client->dev,
@@ -1820,6 +1920,9 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
 		return -EINVAL;
 	}
 
+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
+		ov8858->xvclk_regs = ov8858_cht_mrd_19_2mhz;
+
 	return 0;
 }
 
@@ -1887,6 +1990,13 @@ static int ov8858_probe(struct i2c_client *client)
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

