Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5C54A7CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872900; cv=none; b=G1OgX8bCdIW4zFxdlBGoCGQ7wRdgYPBqV36RV51epdhOLTZIOz178VUYirsbwkBaHgYefuYKa8B35gXFML2v13HpU24m56GNkCd8hB+oOReEw+8jLfVQj1eQuBXwtSBk/PbTMwkRJ9MM/KggNStc6bxLF0e+xVwUgLKizYsi/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872900; c=relaxed/simple;
	bh=gS76ZUxJGII/IfQJPP3cQBrBvwEJIEfz3eGV0ojgosc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVycEEKyfJLanGjEafb+0D4tKiyGPjVFOdX7w2f8tauy5vl5Hcdgeb4kq1u2rZkSMoEhxUx6NLES47FdaeAys0OpTjC7UR9KxYASZtRHqIP7KxWmKPECaj0VcEXjLbn3+JUshUp0HJ8I5QXY5c6ndhwsOuerqFh/t7C7xbYH/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dshc00bz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dshc00bz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4970325e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872897; x=1789477697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+P6yu5LK3ZN7OT5GNukgXFTes6g5Rd5+fxFP67JMrY=;
        b=Dshc00bzt06Pz3AjqDH+fu968X+35BI07RWQaADIOVWv4JiWnaUqyx5LFVm7u8uYlJ
         NUi8hWltlkoK112sZM3SfFNJXMmIeedNjM1mhfAAOdfaeMX1rryOL/8wUJNsOmQ4X/Rf
         TWG41qEmoTLIzO89yiaWNZ+IoTlqNtqBGE5iz40qhVJ3Iaq0/VRWlrXsn/17l0G+uquE
         2pmPSOlUXS9Hu+VMHPGmXpwE0GZ1tD9I26cvv1mo+65LYADykLenMqnD092BI6sEGUTB
         5VjYYW59kl7n4u4Mo9986gqQFnc8g8lOzuUIm5x4pUWqLyumpGB8FJVe0qXjbjEspV6X
         cPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872897; x=1789477697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+P6yu5LK3ZN7OT5GNukgXFTes6g5Rd5+fxFP67JMrY=;
        b=hW5O0QfuVAvx/Ecc+g/CFhP9lRKbKLWhPBpOylUd7jNUNlZmYcyuA4OATcyl9e9VK2
         7KTPslelmdrMDibvSvAqeLiVy1zM83BRYYC9n5waEdPPPleVOrLeAP2ZGo80sEOnXhxh
         Ppz1rzLURXjtdy51Xbkv1XNXlFfSV+s8OzWlXXoUNpeIlfsWtB8AZu+AQjdT7zJ/n3Xi
         bJa6CPIMFkyoLyh0GTq0nL86MrB2P2t5fqFU9lrL3YAGsUY54CzgEj6f4YPU3NQgUcPk
         rohesXrEJVSxLuxaJffNQyDbqr9bLhWRhoZp9tl4CP//QvOiGnTdyJb9mxlV/1fsGgPq
         47VA==
X-Forwarded-Encrypted: i=1; AKwUvBx9RI40+CisILIARzj1UsuzkKGEZ/5kRXq0/y803Q/3gPmNNwLqeH10w/yuSN5EoNktaJSXEnqWReg4KXA=@vger.kernel.org
X-Gm-Message-State: AFuF++ntH7HbWTJbpTQ9YeLZjLzeqj2kLWLtXecbpzwbLmmDW27S6IfT
	ZVaRUbcZgDOMaCS/iyThOLXoCZIa2ItnXwkNugI0Kxmmcn7pwX37ozJP/I68ySvIylG5aA==
X-Gm-Gg: AYBFou0nRB1vpTlHtiOMMjNRF5JEREVTSB9MNlJLBobkN8irYeiBlP4edcLaZqFGavt
	i84I5v2u08uil2rmUPkRz8Sp4W02GYlrBCB9ogL5iHEOwIWBHebIj2mqVux/Talj2/UX0Rb+e9u
	AS4I4s11ywxQ95Cc/mP/ko2x8dzqFBesqtdoeaeF6FfaWiAdpkqBwK74qlzrrYWxkgWaBbuM2EH
	GMgqNTA6pc39LDDXnyXvaS89EqDDO+iDdAOZDmsBv3YeiDwBKzFVaY0Zw8hGT5+2lUwmFftx618
	4KBjcpVr4Z+nVcyTbXGmgZ9GW4uRK8VWVz3k8RGfZD/pbzVmC0rhbSSQn0Oy5ZpzuQsOY8kJY/v
	j/VmMOguHhAQ/G7n+fxH+9RV8a9tTUeRmWJmolZocf/ACATIYazBzYsNYv95uQeaxtseEQzPFOg
	aJJORAllKGY5B1SS3AezBTuTUCbHh+smswDKc8v0Rm0DazZzS75kuR5Vgjqhe1xItqljNIEh+Va
	a/PiLdMOPP930BIf62/NOOZAhjYPYX8
X-Received: by 2002:a05:600c:3513:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49d1e07e622mr12635625e9.0.1788872897012;
        Tue, 08 Sep 2026 06:08:17 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm523660125e9.1.2026.09.08.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:08:14 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov08x40: implement get_selection
Date: Tue,  8 Sep 2026 15:08:03 +0200
Message-ID: <20260908130803.2632-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not implement any pad selection op, so userspace gets
-ENOTTY when asking for the pixel array geometry. libcamera then has to
guess: it defaults PixelArraySize to the output size and
PixelArrayActiveAreas to a zero-sized rectangle, and warns that the driver
needs fixing.

Report the full pixel array and the per-mode analogue crop. The values are
those the register lists already program: X_ADDR_START/END give a 3872
pixel wide array and Y_ADDR_START/END give 2432 lines, with each mode
cropping that window vertically.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/media/i2c/ov08x40.c | 87 +++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4763..0299d50222ad 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -151,6 +151,9 @@ struct ov08x40_mode {
 	/* Exposure calculation */
 	u16 exposure_margin;
 	u16 exposure_shift;
+
+	/* Analogue crop programmed by reg_list */
+	struct v4l2_rect crop;
 };
 
 static const struct ov08x40_reg ov08x40_global_regs[] = {
@@ -1183,6 +1186,10 @@ static const char * const ov08x40_test_pattern_menu[] = {
 #define OV08X40_LINK_FREQ_749MHZ	749000000ULL
 #define OV08X40_SCLK_96MHZ		96000000ULL
 #define OV08X40_XVCLK			19200000
+
+/* Full pixel array, from X/Y_ADDR_START..END in the register lists */
+#define OV08X40_NATIVE_WIDTH		3872
+#define OV08X40_NATIVE_HEIGHT		2432
 #define OV08X40_DATA_LANES		4
 
 /*
@@ -1235,6 +1242,12 @@ static const struct ov08x40_mode supported_modes[] = {
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 3872,
+			.height = 2432,
+		},
 	},
 	{
 		.width = 3856,
@@ -1250,6 +1263,12 @@ static const struct ov08x40_mode supported_modes[] = {
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+		.crop = {
+			.left = 0,
+			.top = 112,
+			.width = 3872,
+			.height = 2208,
+		},
 	},
 
 	{
@@ -1266,6 +1285,12 @@ static const struct ov08x40_mode supported_modes[] = {
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_BIN_MAX_MARGIN,
+		.crop = {
+			.left = 0,
+			.top = 0,
+			.width = 3872,
+			.height = 2432,
+		},
 	},
 	{
 		.width = 3856,
@@ -1281,6 +1306,12 @@ static const struct ov08x40_mode supported_modes[] = {
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+		.crop = {
+			.left = 0,
+			.top = 112,
+			.width = 3872,
+			.height = 2208,
+		},
 	},
 	{
 		.width = 1928,
@@ -1296,6 +1327,12 @@ static const struct ov08x40_mode supported_modes[] = {
 		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+		.crop = {
+			.left = 0,
+			.top = 120,
+			.width = 3872,
+			.height = 2192,
+		},
 	},
 };
 
@@ -2055,10 +2092,60 @@ static const struct v4l2_subdev_video_ops ov08x40_video_ops = {
 	.s_stream = ov08x40_set_stream,
 };
 
+static const struct v4l2_rect *
+__ov08x40_get_pad_crop(struct ov08x40 *ov08x,
+		       struct v4l2_subdev_state *sd_state, unsigned int pad,
+		       enum v4l2_subdev_format_whence which)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct ov08x40_mode *mode;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &ov08x->cur_mode->crop;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, pad);
+	mode = v4l2_find_nearest_size_conditional(supported_modes,
+						  ARRAY_SIZE(supported_modes),
+						  width, height,
+						  fmt->width, fmt->height,
+						  filter_by_mipi_lanes, ov08x);
+
+	return &mode->crop;
+}
+
+static int ov08x40_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&ov08x->mutex);
+		sel->r = *__ov08x40_get_pad_crop(ov08x, sd_state, sel->pad,
+						 sel->which);
+		mutex_unlock(&ov08x->mutex);
+
+		return 0;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = OV08X40_NATIVE_WIDTH;
+		sel->r.height = OV08X40_NATIVE_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov08x40_pad_ops = {
 	.enum_mbus_code = ov08x40_enum_mbus_code,
 	.get_fmt = ov08x40_get_pad_format,
 	.set_fmt = ov08x40_set_pad_format,
+	.get_selection = ov08x40_get_selection,
 	.enum_frame_size = ov08x40_enum_frame_size,
 };
 
-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
