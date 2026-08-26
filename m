Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2410425860
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750600; cv=none; b=u1hovZWsbcNjWnZVa3hyxKA/EMTGtrq4Hc6VntiwM4Ef8CZwtINjf+28r1ymsQPwX5xsyjd3FM47PWr71RnD4+frcDPmCOLlAVlTv676C7vt0Wo23SbxDaYsaOzzTK7qMZkK9mj0sUfNezvlo+n63CDzOYFnStmlfIWnWhrcB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750600; c=relaxed/simple;
	bh=LyLoXF6tXMwCiKPgithzn41UgyMWaC02Owk4FkJ0mXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOTkbmNAau1JeqfdHimjroeXMr1y/DHO9T691e07ubI7dr1pX0hMdKju2CJrL1MhT6uMDbn/P0LJiH+zJeRBZV1EjG6z1Kx8swIguDSxk+FiiRYNKy+lhM09NCLdzHE+r2vOjB0+0eUUAINFx2k0vdQpR7z+2Ag26D/Th8fSFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoQA1+hG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoQA1+hG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1312512a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750594; x=1788355394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hUd20GpxQCc4d41YDgQHUkh4hezfHFKYEHRgbx10eE=;
        b=RoQA1+hGFsL/agJo8NFL1ldYJKMGSQExZRPn+u10B8n5mBXY8+6qutKz7/A1S24W9Y
         LfE+TIiUIoTx8UaywPrJhGNeKQ3d3CFFQbO2HzTcZpDBEgp0oCi4YvqFSrAAxeX/P4j9
         otxVkKp/5WTqn3qrjhOl7TzVB7biq1kHRVVfnme6JK49kSVvIYZx3xuaFHnZNFziVI2w
         itH9UPwFKncj3Jam5mF10I78dcczPHe6Oeuba0ivh8k1y9mgrtF3xi6AbB6LiTMiJ01+
         uD7LmYw+W0h/Sk+Xn87bfdlni+Fxh7Q/zs+w7kiDxNDP873Fx6U85S1+5sCSYDMfHYOL
         RLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750594; x=1788355394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hUd20GpxQCc4d41YDgQHUkh4hezfHFKYEHRgbx10eE=;
        b=AkMZfK5aPzDW0/PpSOt3kAc0OKov+uXOLEIA7jJQIfFHvOpgkfzmuaO73ro8nizsKp
         OgFP+hWdwbDqp8Yy6fg6oLUMeM41eAQplGwlDqqQ6uh4QRTJEe6uCyMqHn1ds3AjBe6P
         VYBP7EpO9ufuYjZ1MNee7L99FRMFcLSj/b9tppHGEQUe1wGQgcv6CbN3lM79+WG2c1Nz
         CplseeEgvKaNYioZ1J1JITimMYHCjjn93LnXha2Qn6RbuMiSP3cvhCEqckqJmZXp64Ip
         8KK5ve1jL0KYmbfKCWFvfMvXohnifGmwCGglyWglY41yYYdSmdCbMmAwWqMif6eL+1ys
         98rg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1qe4t9MrbsRney9tJoqmURouXSZ5mUAvuCwzPljd4C/9UW4Zj8FTzcnzfKiQ+Fui9nt5hVXsOWAe5WRg=@vger.kernel.org
X-Gm-Message-State: AFuF++mzis245fVUvAb/OsErW6gIYLn4VFGIjTU4nFbQfgK8OKEWpmye
	77gKtgkKmSCQdjfxFdhV+kXs2Z2ln64qWrJHN26osbbFg6YNCuAZuP0X
X-Gm-Gg: AR+sD12bp+LnDfL+k13NAZK5lRdvJJ9UBvXFo5nlsL3OS2tmFW51ra7+MX3sHOQxTPT
	hyNPvpMZnm3dLuHhbmxmGMj8zPLtvd9BORuAw30pDsrx0+SrjMhaQpsHhAHf6kJfVzBvMMEKDx8
	xaqEokpGNjgwfvav8P5e2WW8wPLw8BIHCDuzI0p5vQPUUZdcD+Fjrm4I+8aMT6PikTCJY/r+HGa
	yrUze2ftPUJOiVe09nwGMPERejQUvnAveDAPtTl/VJNww/7oIjGDaAXMQprA1RgM5KHMacghXHj
	4aEYjvK/peevjNN5LluGYPE9eXtp/aNnMpD0ZMNafA81p+iEJMDwmYrXq3/BaSW2pj9Uc+ZwPx7
	ijiH47iFeNvvTrvCWGd+D8yBkndrcXLBGHN+q2YOxCX2tFPSM9JxrSz38fvTIfboeSVwEO+4Rux
	fX4bTvUIVi5u9iIuKYrF0O3BpPtC+O6CK7sRDyT22bwBxoUIEl+ExNchUlUz2nyU5vIa4Osd1Bn
	pkZQ1EYa+OGx/MPL7WnwLnaIuVEM4oV5AFp5sRtuEuh55hocDk5Ow==
X-Received: by 2002:a05:6402:2742:b0:6a1:4fc7:94b3 with SMTP id 4fb4d7f45d1cf-6a5df5b04b8mr8718503a12.1.1787750594285;
        Wed, 26 Aug 2026 06:23:14 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:13 -0700 (PDT)
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
Subject: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Date: Wed, 26 Aug 2026 15:22:53 +0200
Message-ID: <20260826132256.3343451-6-mauriziocasciano7@gmail.com>
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

The YB1-X91L firmware does not describe the complete camera link. Its
front OV2740 uses two CSI-2 lanes at a 288 MHz link frequency and sends
a 1932x1092 BGGR transport frame with 12 pixels of horizontal and
vertical padding around the 1920x1080 image.

Allow the AtomISP bridge to provide per-sensor link frequencies and
padding, add the matching OV2740 mode, and derive ISP2401 D-PHY timing
from the sensor link-frequency control.

The register values are hardware configuration facts checked against
the Lenovo YB1-X91L configuration and physical captures; no proprietary
driver code or tuning binary is included.

Tested on a Lenovo Yoga Book YB1-X91L with continuous front-camera raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c                    | 98 ++++++++++++++++++-
 drivers/media/pci/intel/ipu-bridge.c          | 15 ++-
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 17 +++-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 65 ++++++++++++
 include/media/ipu-bridge.h                    |  2 +
 6 files changed, 186 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index d85d83bdd203..b760d4dc0e68 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV2740_LINK_FREQ_360MHZ		360000000ULL
+#define OV2740_LINK_FREQ_288MHZ		288000000ULL
 #define OV2740_LINK_FREQ_180MHZ		180000000ULL
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
@@ -91,6 +92,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
@@ -130,8 +132,14 @@ struct ov2740_mode {
 	/* Link frequency needed for this resolution */
 	u32 link_freq_index;
 
+	/* Optional common settings applied before the mode-specific settings */
+	const struct ov2740_reg_list init_reg_list;
+
 	/* Sensor register settings for this resolution */
 	const struct ov2740_reg_list reg_list;
+
+	/* Bayer order produced by this mode */
+	u32 code;
 };
 
 static const struct ov2740_reg mipi_data_rate_720mbps[] = {
@@ -142,6 +150,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -458,6 +474,36 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
 	{0x4003, 0x40},	/* set Black level to 0x40 */
 };
 
+/*
+ * Lenovo's Yoga Book vendor driver uses the generic initialization settings
+ * above followed by these mode overrides.  Unlike the generic 720 Mbps mode,
+ * this is a 576 Mbps two-lane mode with BGGR output from the optical array.
+ */
+static const struct ov2740_reg mode_1932x1092_regs_288mhz[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+	{0x3808, 0x07},
+	{0x3809, 0x8c},
+	{0x380a, 0x04},
+	{0x380b, 0x44},
+	{0x380c, 0x04},
+	{0x380d, 0x38},
+	{0x380e, 0x06},
+	{0x380f, 0xf0},
+	{0x3810, 0x00},
+	{0x3811, 0x02},
+	{0x3812, 0x00},
+	{0x3813, 0x02},
+	{0x481f, 0x29},
+	{0x4820, 0x01},
+	{0x4837, 0x1b},
+	{0x5000, 0x7f},
+	{0x58f4, 0x32},
+};
+
 static const char * const ov2740_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -468,6 +514,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };
 
@@ -478,6 +525,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -499,6 +552,28 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
 			.regs = mode_1932x1092_regs_360mhz,
 		},
 		.link_freq_index = OV2740_LINK_FREQ_360MHZ_INDEX,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	},
+};
+
+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.init_reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_288mhz),
+			.regs = mode_1932x1092_regs_288mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 	},
 };
 
@@ -515,6 +590,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
 			.regs = mode_1932x1092_regs_180mhz,
 		},
 		.link_freq_index = OV2740_LINK_FREQ_180MHZ_INDEX,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 	},
 };
 
@@ -842,7 +918,7 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->code = mode->code;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -966,6 +1042,15 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 		return ret;
 	}
 
+	if (ov2740->cur_mode->init_reg_list.num_of_regs) {
+		reg_list = &ov2740->cur_mode->init_reg_list;
+		ret = ov2740_write_reg_list(ov2740, reg_list);
+		if (ret) {
+			dev_err(ov2740->dev, "failed to set common mode registers\n");
+			return ret;
+		}
+	}
+
 	reg_list = &ov2740->cur_mode->reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
@@ -1062,10 +1147,12 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct ov2740 *ov2740 = to_ov2740(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = ov2740->supported_modes[0].code;
 
 	return 0;
 }
@@ -1080,7 +1167,7 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ov2740->supported_modes_count)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != supported_modes[0].code)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
@@ -1178,6 +1265,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..035f1addeaae 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -288,18 +289,19 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
+	struct v4l2_subdev *sensor;
+	s64 link_freq;
 	int mipi_freq = 0;
 	enum atomisp_camera_port port;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	link_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (link_freq > 0 && link_freq <= S32_MAX)
+		mipi_freq = link_freq;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -310,6 +312,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %d Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index ec762f8fb922..dd36659e7984 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -45,6 +45,8 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 					struct v4l2_device *vdev);
 int atomisp_csi2_bridge_init(struct atomisp_device *isp);
 int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
+bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
+				     u32 *padding_h);
 
 void atomisp_csi2_configure(struct atomisp_sub_device *asd);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 207ab69385b5..0b9577ffb98c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -77,6 +77,11 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
 	/* The vendor driver and sensor modes use two CSI data lanes. */
 	{ "OVTI2740:00", "CsiLanes", "2" },
+	/* The vendor 1932x1092 mode uses a 576 Mbps two-lane link. */
+	{ "OVTI2740:00", "CsiLinkFreq", "288000000" },
+	/* Crop the vendor mode's 1932x1092 transport frame to 1920x1080. */
+	{ "OVTI2740:00", "CsiPaddingWidth", "12" },
+	{ "OVTI2740:00", "CsiPaddingHeight", "12" },
 	{}
 };
 
@@ -207,6 +212,49 @@ static int gmin_cfg_get_int(struct acpi_device *adev, const char *key, int defau
 	return default_val;
 }
 
+bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
+				     u32 *padding_h)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	bool override = false;
+	char *str_val;
+	unsigned int val;
+
+	*padding_w = pad_w;
+	*padding_h = pad_h;
+
+	if (!adev)
+		return false;
+
+	str_val = gmin_cfg_get(adev, "CsiPaddingWidth");
+	if (str_val) {
+		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
+			*padding_w = val;
+			override = true;
+		} else {
+			acpi_handle_warn(adev->handle,
+					 "%s: Invalid CSI padding width %s\n",
+					 dev_name(dev), str_val);
+		}
+		kfree(str_val);
+	}
+
+	str_val = gmin_cfg_get(adev, "CsiPaddingHeight");
+	if (str_val) {
+		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
+			*padding_h = val;
+			override = true;
+		} else {
+			acpi_handle_warn(adev->handle,
+					 "%s: Invalid CSI padding height %s\n",
+					 dev_name(dev), str_val);
+		}
+		kfree(str_val);
+	}
+
+	return override;
+}
+
 static int atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(struct acpi_device *adev)
 {
 	/* ACPI_PATH_SEGMENT_LENGTH is guaranteed to be big enough for name + 0 term. */
@@ -383,6 +431,8 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
 					    struct ipu_sensor *sensor)
 {
 	const struct acpi_device_id *id;
+	char *link_freq_str;
+	unsigned long long link_freq;
 	int ret, clock_num;
 	bool vcm = false;
 	int lanes = 1;
@@ -422,6 +472,21 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
 		return -EINVAL;
 	}
 
+	link_freq_str = gmin_cfg_get(adev, "CsiLinkFreq");
+	if (link_freq_str) {
+		ret = kstrtoull(link_freq_str, 0, &link_freq);
+		kfree(link_freq_str);
+		if (ret || !link_freq) {
+			acpi_handle_err(adev->handle,
+					"%s: Invalid CSI link frequency\n",
+					dev_name(&adev->dev));
+			return ret ?: -EINVAL;
+		}
+
+		sensor->link_freqs[0] = link_freq;
+		sensor->nr_link_freqs = 1;
+	}
+
 	ret = atomisp_csi2_add_gpio_mappings(adev);
 	if (ret)
 		return ret;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..633ef0c4cf59 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -135,6 +135,8 @@ struct ipu_sensor {
 
 	u8 link;
 	u8 lanes;
+	u8 nr_link_freqs;
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 	u32 mclkspeed;
 	u32 rotation;
 	enum v4l2_fwnode_orientation orientation;
-- 
2.53.0

