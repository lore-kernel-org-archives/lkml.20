Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655E353A61
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929023; cv=pass; b=saVmxPtHQthuw0O2HBo9rLraSwluxA+ujBILRbfBjM6dsVVYLEIDVmsSmfloeyI7pOQVSTTcqZ0fjAXXhZn9GPKsWwmyKDQ02R18DCWICBEA/Qc3Z5ahmwoig4GmPN3L0V9XKGo62CsyRhVyomgSj5mfnJcREq/QURAeMUyGtK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929023; c=relaxed/simple;
	bh=E1S30aaLSNXLugfqYC6RxUGcQKtNXQMBj0FvVDBUXrs=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6UW0UHtQXVYsxWZB+ib+tHL/zmYvCq8SKQVgkQcIPTzfQAGlSJhxhr5gAYQ8V+DjyuPX3jPNguKNQOH7LhNTeM2KO1Xk/uW5wZBst6EJyc/pphp+dmGT18QGeoj8RDD+At2O7Exx2OCVrXQtTR1bkVPZWLHsbti767oYTK/nkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpul1WMT; arc=pass smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpul1WMT"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-494ab4d6128so5390219fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929019; cv=none;
        d=google.com; s=arc-20260327;
        b=V+0Gs5eMXBkCOgwStWOvPyX/kSukfnjSSCJ5uEJwIL1dvlJmCQx3DxKuKE8sZ1bYzn
         THoDC0PRJ9It9y4gz1SqGo+3okgOkLuNeT5EPhSB5T2eRFNITclY9S8aEoq1cs/PehaX
         SOiALSWS9BJ9S6TKLjuQCce2DK7WGEWe8Pe6Rj9v1IiieiAwCzY+P6oYV33x0uYE8y8o
         so3XfVAkk3hzjup3iJZnaPLoTlUtLvxzEM7CNeUW4mjFoiLdhdr7eM+quN2W3Qsr7i+m
         wkSNCTLw9q+9/BaVu+k220U1DM2cnihizdABME6OIdALy6zEqvIhY6waMPVhaubvWtaC
         6xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=V9OXUuoQXD8kYCGb04VV1Wc29KkzzfWJvz+REELFI+E=;
        fh=wEnoSQkV43mTLbehNAjpr4NyMFIiDnQiRHKgf0bZSgc=;
        b=GIgCcLYWMH96HZbW7oyFSfBhEBtoYt35GMpgiq3wrDoiFw4YTqIxRyiMxMonNtxmBB
         m6acepI0EAyP8LjAqVTgCO0lr/7dLVEBkGBeqh9+JTumgMr/IL00mLdF/MY+D3nX4CAz
         FBYHtaSNHHCC41DWn7osjBtiCGm/oWCE0c2pAC8z4q5g1dMTv1DCcZQ1ga08A/K95X7D
         IuIBBUshENv64IoYmwPrhlkvwLpN8dOxNe7oyhnxfbTApHVWQV73c4OnGY/mhXDsoNn/
         twvO/VnfNnImpUi3+D1Gjlfwz2t3zxkuPizV7gu0x4vtgSPFOd1MnsisbAkJ/badKO9J
         kAqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929019; x=1791533819; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9OXUuoQXD8kYCGb04VV1Wc29KkzzfWJvz+REELFI+E=;
        b=lpul1WMTEipvvYupespyhHmaS4bppDNgcZGw+ItdtZjqp4KMRDjXHwJfdpCy/tUkfz
         p0JUqKqVeLuTQve51Uad+5/vEz1rWvXI49emzvKgKFjnR/lpQBAVVqWt0PXYDA6yLwzo
         nKPM3lgVM4pKjK+iCIk1aKA/QXi8cnlVwTF7bwb2PukGGe+YnOUaxthMbaDDr/5QyM/O
         lIArUnFNm51QROKlR5F1z3reXFeJCgpZzxgA2p3yx4Nfk9aqEbX9JBff5s8q91YH3jcV
         o3UDq4oI1Q7QNt5chkgFSpgOCIdYA/KRDSE1O8YYSTxacj+x4XX3kgGhgWE6Eu3Sz/IZ
         J67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929019; x=1791533819;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9OXUuoQXD8kYCGb04VV1Wc29KkzzfWJvz+REELFI+E=;
        b=zkLrWSxvRjzOvk0Y+FkSY/5TWRCv3xqzHYSMGEArTshWIMmHctdwMwuomyKKLAbgso
         KNxZelyVq3J4OVT2xJKyU1bbsDmwiDXMOryswU8JExKPbLrq38PlQGmDLcwp36JIxwlZ
         ckZSwdLayushaAbyBEgvfYY8dDTdW8qVaBniSZKvw0p19rVQNwvNNQK1yf3zTOJs2k2u
         VeqbVaBDDWEGr3GVW0JRKBuae8RQUyP607i4Qijsy2QJfk/gtRhoEulIwJUc9uNoc9xu
         np3lGbPURYSprU5b5cWFiSmZlkBeRgwBaQq2hVz9z6SXScCa7yaecoSsP4l0PvR+lh1i
         oFhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgjKHwK5EVV9rKHEkYmp0/eSMcPZ4MIQXHO9pMgqGt1Kbq92TVuMI52bSoInlxCCx/lMdy7h2/X58qBYM=@vger.kernel.org
X-Gm-Message-State: AFuF++lYpYNXASRRWmE/UwhS040akHEyI3vAZe8qCclIBDDUA0dNxWqC
	UKNVol0PRSiwfesYjoC67jmeyH3DhXMfuBwkr7On9hFtyS1HjIrrlh3N+JxM6UjbpCnhE45rjIx
	JFH63u3KMaIsx4Nq2jkPQZbkPRaafLuI=
X-Gm-Gg: AYBFou3pp0oneFchgCBQfKScDM4G/UQTjWD7Gm0IG61GAO7w/d5UGDdNyWl9PvrDINU
	IgRDZlD8Stq24gzTwb79qkiiGv+rTTFq7dJPZjzc91f6ixpBlROQJ9V5X/sjNNU9RO66S8P0gdb
	PW+r9fmBla+T6wf2276QyZkLvvcVRlRxaTSPmp7o6Op3TYZtG/XQ2xpGziPcew9lFlcnT9iXHAu
	5PJpL+KP9zLAcLVenmBIiCAkfhwcbrHl7fsx5KFQWj1cbW0gNDbZ7LXuSA3Q7Chw04lPWkn/0T+
	pxA/iZCFL2B0exYCyqgJKIdDRxBeb7QlGQAe2cly+52UFiAkMpU/rLz8RKIDEwoXOcaR0j3/dlf
	ex5dGTE4U4DuGF02dzqAZ99HUcnWCQe5a
X-Received: by 2002:a05:6870:c115:b0:48f:e107:318a with SMTP id
 586e51a60fabf-49e15df5cffmr1938836fac.42.1790929019520; Fri, 02 Oct 2026
 01:16:59 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:16:58 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:16:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:16:58 -0700
X-Gm-Features: AclHuK8xM8Ty084p9Guc4fe-EcEuHPwVW1vlQGBrD4Mk-TOlaRu3l6FMoMbN5nA
Message-ID: <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
Subject: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual
 white balance
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
global-timing registers out of the common mode tables and select register
settings for the detected revision, lane count, input clock and 360 MHz
link frequency when starting the stream. Use the actual input-clock rate
when calculating the reset delay.

Add standard red and blue balance controls for the sensor's manual white
balance registers. V4L2 defines red and blue balance relative to green but
does not define a standard green-balance control, so keep green at unity.
Accumulate errors while programming all three channels.

The manual white-balance register definitions and programming follow
Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov8858.c | 183 +++++++++++++++++++++++++++++--------
 1 file changed, 147 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 2a0e2b08b9aa..97bcadda3fd8 100644
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
+#define OV8858_XVCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
+#define OV8858_XVCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)

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
@@ -115,12 +126,86 @@ struct ov8858 {
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
+static const struct regval ov8858_24mhz_360mhz_r1a_2lane[] = {
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
+static const struct regval ov8858_24mhz_360mhz_r2a_2lane[] = {
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
+static const struct regval ov8858_24mhz_360mhz_r2a_4lane[] = {
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
+ * Register settings for a 19.2 MHz input and 360 MHz CSI-2 link.
+ *
+ * Besides the corrected sensor/MIPI PLL divisors, keep the final common
+ * black-level settings here. The per-mode tables retain their resolution
+ * dependent black-column anchors and window sizes.
+ */
+static const struct regval ov8858_19_2mhz_360mhz[] = {
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
@@ -131,13 +216,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
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
@@ -370,7 +448,6 @@ static const struct regval ov8858_global_regs_r1a[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32},
-	{0x4837, 0x16},
 	{0x4850, 0x10},
 	{0x4851, 0x32},
 	{0x4b00, 0x2a},
@@ -405,13 +482,6 @@ static const struct regval
ov8858_global_regs_r2a_2lane[] = {
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
@@ -648,7 +718,6 @@ static const struct regval
ov8858_global_regs_r2a_2lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -810,13 +879,6 @@ static const struct regval
ov8858_global_regs_r2a_4lane[] = {
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
@@ -1053,7 +1115,6 @@ static const struct regval
ov8858_global_regs_r2a_4lane[] = {
 	{0x4600, 0x00},
 	{0x4601, 0xcb},
 	{0x481f, 0x32}, /* clk prepare min */
-	{0x4837, 0x16}, /* global timing */
 	{0x4850, 0x10}, /* lane 1 = 1, lane 0 = 0 */
 	{0x4851, 0x32}, /* lane 3 = 3, lane 2 = 2 */
 	{0x4b00, 0x2a},
@@ -1345,6 +1406,10 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;

+	ret = ov8858_write_array(ov8858, ov8858->xvclk_regs);
+	if (ret)
+		return ret;
+
 	/* 200 usec max to let PLL stabilize. */
 	fsleep(200);

@@ -1541,6 +1606,23 @@ static int ov8858_set_long_digital_gain(struct
ov8858 *ov8858, u32 gain)
 	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
 }

+static int ov8858_set_mwb_gains(struct ov8858 *ov8858)
+{
+	int ret = 0;
+
+	ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN,
+		     ov8858->red_balance->val, &ret);
+	/*
+	 * Green is the unity reference for the red and blue balance controls.
+	 */
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
@@ -1589,6 +1671,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1623,9 +1709,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	unsigned long delay_us;
 	int ret;

-	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
-		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
-
 	ret = clk_prepare_enable(ov8858->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable xvclk\n");
@@ -1644,7 +1727,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
 	 * transaction, but a double sleep between the release of gpios
 	 * helps with sporadic failures observed at probe time.
 	 */
-	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
+	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);

 	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
 	fsleep(delay_us);
@@ -1710,7 +1793,7 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
 	u32 h_blank;
 	int ret;

-	ret = v4l2_ctrl_handler_init(handler, 10);
+	ret = v4l2_ctrl_handler_init(handler, 12);
 	if (ret)
 		return ret;

@@ -1752,6 +1835,19 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
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
@@ -1805,15 +1901,20 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)

 	if (id == OV8858_R2A) {
 		/* R2A supports 2 and 4 lanes modes. */
-		ov8858->global_regs = ov8858->num_lanes == 4
-				    ? ov8858_global_regs_r2a_4lane
-				    : ov8858_global_regs_r2a_2lane;
+		if (ov8858->num_lanes == 4) {
+			ov8858->global_regs = ov8858_global_regs_r2a_4lane;
+			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_4lane;
+		} else {
+			ov8858->global_regs = ov8858_global_regs_r2a_2lane;
+			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_2lane;
+		}
 	} else if (ov8858->num_lanes == 2) {
 		/*
 		 * R1A only supports 2 lanes mode and it's only partially
 		 * supported.
 		 */
 		ov8858->global_regs = ov8858_global_regs_r1a;
+		ov8858->xvclk_regs = ov8858_24mhz_360mhz_r1a_2lane;
 		dev_warn(&client->dev, "R1A may not work well!\n");
 	} else {
 		dev_err(&client->dev,
@@ -1821,6 +1922,9 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
 		return -EINVAL;
 	}

+	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
+		ov8858->xvclk_regs = ov8858_19_2mhz_360mhz;
+
 	return 0;
 }

@@ -1888,6 +1992,13 @@ static int ov8858_probe(struct i2c_client *client)
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



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0
