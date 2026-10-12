Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE1490C07
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815742; cv=none; b=eGubRB+dMB649HyUt9opxKDZW2sf4wXiUGZmKoeRDBa8CVp2IDU/0GFj4R6hKN5pZauAJE81US6y1MRPtWKKnauGwS8/woVmSkoTi1QCeors/bn2nFP8Y/QwjWsHPCLU3XrxEQDuo6fv2opiKjr9w7nQ6SVjVPjbeC7+i2VjUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815742; c=relaxed/simple;
	bh=Ss47ZgD09dOj/UKeJPH9Y9COWloBGKnaLz+6F8Ki/do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ng1RiGhmJZTeNL8L5wYMUSAZMiB96Gn7zukkrbvSTSlxFBxW6EUpzGu+yjSnEiZMdf77pY7JFHcQTAEsA1WlE5Hu6el1NRbpX78lQXGN4jWHcbERCfft2vMthFUsGtgeyxHsMfpm2Dcp1CqyZwL2GQk3zlYQIH8KCbqcDbRmq1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5FbbveF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5FbbveF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dc202a60eso611263f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815737; x=1792420537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNPmkzGpWJi91RdX/MwSYm28MsounCEy4wd+YqulLmE=;
        b=l5FbbveFlnegMr4GFNQXjN08h5GRPUaA7V7gzfD7tOPLsLET++xeaRjEPnpuaR1D5O
         BDb5nnHSRP82LiLX/gXl1Xvjbh+8KN/LFsF51yY+NXAD8Nv5WfSFARRPOOxkZydxeduh
         CgOC0MZYWTMoVAoEgobKtk6UbcbQ/Q4/ZA5yN1/pqPYQdCoj7a+liv6n/97FTySgqyGx
         BG35W9WE/taS4t4jyWsHPgrvBvsmoYqvLts6WcNrqX/XMXAOnlH46sK2d2ecWcipPdiX
         7YV1K1QiTUPDDrn9CsvgYyefrICREgWipZLNtNjM1ROd7owUoAyYWgr8rkQtfbbnd4D8
         VKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815737; x=1792420537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNPmkzGpWJi91RdX/MwSYm28MsounCEy4wd+YqulLmE=;
        b=JCLkuLKx+M6bRtoEnht8jS17hQIIWCMsA350xI5/y67X855GTMJ3zV57Y1xhUK6D/0
         wzkVAOTxAP5EBvfjlYgoIYmMTUxx07WwZkTuxwWcPEtAnN5Ikr2MkVdorZvrW/r90j7R
         ZsPRujmqVZXeBE6GfOhD6OS4nN+jUVIl5dcZtGDvpngOe3zWlMFtgmz43+V55NS6cOsU
         sgD4EkFa/aSY8oDw7lrCzlpBayQ+AoSSaJdI19AAd+v3Y6VgnkqknnmbHXxmOOxyqtW1
         eqwovDmsbI0F7VWNBwBkw1Ozh6kb4YYvCseohVFUAsJkpjNJE+loOkfTYJdnLSbIUdIS
         HnpA==
X-Forwarded-Encrypted: i=1; AKwUvByLF6sBTXcRR6GzVA+FkJ7h2HEATNvoTnyXqfzO0fsYQ6J9ZCw5ymN0/NrVh847jgddAqhNCowQtvMMAwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT9g1kNKc58h/z87/HhlW/ZuRtxBWmZN9YbQMQZmReSnSqiOH6
	zf94BHT2V4JGjToHJmYr8I6PLyWeHWDt36Rn3xC12wSGhEbC7qzP0vF3unVZWv68dPK3wQ==
X-Gm-Gg: AYBFou2KZ/fqbKzrrLOMxxOhD5bswUUWRsV4xPZQ+kkuWYsXQw8q6UY7jyr0/UNnUq2
	INkHJXzd3inxFy7q3zGIog7PnRg9ZCzFStrk/Eut00Th34yT3VAVEwq3cT7Vrjr9tw9fzN9npkg
	ItjrtR82b8XrJQps692XJJg33vdOsIYWddu00wo3RVypzvH14Ahu2I/XNlO4yXM0OxqOiUrUBWw
	EuD8nZnyOSYuc7a6DUmZdXA28qQHZPpwHjalPygj01/fFJkYn41RbDrhWK8AQbfaWr4j1a9cufa
	3VHmnFKQQ0NOlS/qo+Gue33peksQwFATlSpx9zVKtyp+Kx5TcjnK1usDqbeKcrNRwt1BfaKlzcd
	FMcwboxmTYG4cG9a/aZXIDVmvsrLZ6bsUK9sp1KtsHc2o1Hklu06spdYBY5YWslXVpgHKRz9vsM
	KJ0t0oEHXogSBGUp7DFTEtBjzadNBgEVHfgMcDXelxy7pF+fD+UfbqBXtZPaYgfdQPxhxeMH92V
	+nZ1HbHBnrPBK3sCVxbDt1aQYzE9J5Zv/iYVlHKJHR4B+ziqIWlQ7c2uLSOna3EWvCte6G2X/CA
	hi/EiAiKtTgUca/uV/TFYWQL+2zvwtwIJReAgnVE6VxkS8fsdWRCXWYyzzUCNvflGWhIwYoKyvH
	gIJPAj7Yg3oVelw+/YKWxp2vdZth1KwStGU4JdAgTAiRvKu4G8F0seII=
X-Received: by 2002:a5d:4404:0:b0:488:8c99:fbc8 with SMTP id ffacd0b85a97d-48dbacec9c3mr13938633f8f.50.1791815736792;
        Mon, 12 Oct 2026 07:35:36 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:36 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] media: i2c: gc8034: Add crop support
Date: Mon, 12 Oct 2026 16:34:41 +0200
Message-ID: <20261012143443.34897-6-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the crop selection on the source pad, as for the GC5035: the
vertical crop is done by the readout window, the horizontal crop by the
sensor output crop, as the column start register only gives valid images
at some values. Crop offsets are even, to keep the RGGB order, and sizes
are multiples of 4. The width ranges from 512 to 3280: up to 384 columns
the CSI-2 receiver gets corrupted frames, 448 worked and 512 is kept as a
conservative minimum; an output as wide as the readout window causes
CSI-2 errors. The height ranges from 64 to 2448: with readout windows
taller than the vendor one (2464 rows) the frames get longer than
computed.

set_fmt and the vertical blanking behave as in the GC5035 driver.

Tested in the same way as the GC5035: v4l2-compliance and crop rectangles
at the bounds, in the corners, at the minimum size and in the centre.

Assisted-by: claude-opus-5-5 coccinelle sparse smatch
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/i2c/gc8034.c | 168 +++++++++++++++++++++++++++++++++++--
 1 file changed, 161 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/gc8034.c b/drivers/media/i2c/gc8034.c
index c21fb8510..732ee6c78 100644
--- a/drivers/media/i2c/gc8034.c
+++ b/drivers/media/i2c/gc8034.c
@@ -8,6 +8,7 @@
  * The registers and sequences come from the Rockchip BSP driver,
  * rockchip-linux/kernel, branch develop-5.10.
  */
+#include <linux/align.h>
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
@@ -17,6 +18,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -89,6 +91,12 @@
  *
  * The default crop rectangle is the 3264x2448 image of the vendor register
  * sequence, at (8, 52) in the area.
+ *
+ * Output widths up to 384 pixels gave corrupted frames on the CSI-2 receiver,
+ * 448 pixels and above worked; 512 is kept as the minimum. With a readout
+ * window taller than the 2464 rows of the vendor sequence, the frames were
+ * longer than the timing model below by the extra rows, so the output height
+ * is limited to 2448.
  */
 #define GC8034_AREA_WIDTH		3282
 #define GC8034_AREA_HEIGHT		2500
@@ -102,6 +110,10 @@
 #define GC8034_CROP_TOP			52
 #define GC8034_WIDTH			3264
 #define GC8034_HEIGHT			2448
+#define GC8034_MIN_WIDTH		512
+#define GC8034_MIN_HEIGHT		64
+#define GC8034_MAX_WIDTH		(GC8034_WIN_WIDTH - 4)
+#define GC8034_MAX_HEIGHT		2448
 
 /*
  * The frame is the readout window plus 20 lines plus the blanking register.
@@ -210,6 +222,7 @@ struct gc8034 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
 	struct regmap *regmap;
@@ -487,14 +500,55 @@ static int gc8034_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
-	fse->min_width = GC8034_WIDTH;
-	fse->max_width = GC8034_WIDTH;
-	fse->min_height = GC8034_HEIGHT;
-	fse->max_height = GC8034_HEIGHT;
+	/* The output size is the size of the crop rectangle. */
+	fse->min_width = GC8034_MIN_WIDTH;
+	fse->max_width = GC8034_MAX_WIDTH;
+	fse->min_height = GC8034_MIN_HEIGHT;
+	fse->max_height = GC8034_MAX_HEIGHT;
 
 	return 0;
 }
 
+/*
+ * Update the controls that depend on the output size. Called with the state
+ * lock held, which is also the control handler lock.
+ */
+static int gc8034_update_ctrls(struct gc8034 *gc8034,
+			       const struct v4l2_mbus_framefmt *format)
+{
+	s64 exposure_max;
+	int ret;
+
+	ret = __v4l2_ctrl_modify_range(gc8034->hblank,
+				       GC8034_HTS - format->width,
+				       GC8034_HTS - format->width, 1,
+				       GC8034_HTS - format->width);
+	if (ret)
+		return ret;
+
+	/*
+	 * As in ov01a10, setting the format or the crop rectangle resets the
+	 * vertical blanking.
+	 */
+	ret = __v4l2_ctrl_modify_range(gc8034->vblank, GC8034_VBLANK_MIN,
+				       GC8034_VTS_MAX - format->height, 1,
+				       GC8034_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl(gc8034->vblank, GC8034_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	exposure_max = round_down(format->height + gc8034->vblank->val -
+				  GC8034_EXP_MARGIN, GC8034_EXP_STEP);
+
+	return __v4l2_ctrl_modify_range(gc8034->exposure, GC8034_EXP_MIN,
+					exposure_max, GC8034_EXP_STEP,
+					min_t(s64, GC8034_EXP_DEF,
+					      exposure_max));
+}
+
 static void gc8034_fill_format(struct v4l2_mbus_framefmt *fmt,
 			       const struct v4l2_rect *crop)
 {
@@ -537,6 +591,102 @@ static int gc8034_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc8034_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct gc8034 *gc8034 = to_gc8034(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect rect;
+	u32 max_width, max_height;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	/*
+	 * Even offsets keep the RGGB order. The width is a multiple of 4 so
+	 * that RAW10 lines are a whole number of bytes; only heights that are
+	 * multiples of 4 have been tested.
+	 */
+	rect.left = ALIGN_DOWN(clamp(sel->r.left, 0,
+				     GC8034_AREA_WIDTH - GC8034_MIN_WIDTH), 2);
+	rect.top = ALIGN_DOWN(clamp(sel->r.top, 0,
+				    GC8034_AREA_HEIGHT - GC8034_MIN_HEIGHT), 2);
+	max_width = min(GC8034_MAX_WIDTH, GC8034_AREA_WIDTH - rect.left);
+	max_height = min(GC8034_MAX_HEIGHT, GC8034_AREA_HEIGHT - rect.top);
+	rect.width = ALIGN_DOWN(clamp_t(u32, sel->r.width, GC8034_MIN_WIDTH,
+					max_width), 4);
+	rect.height = ALIGN_DOWN(clamp_t(u32, sel->r.height, GC8034_MIN_HEIGHT,
+					 max_height), 4);
+
+	*v4l2_subdev_state_get_crop(state, 0) = rect;
+	sel->r = rect;
+
+	/* No binning or scaling: the output size is the crop size. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc8034_fill_format(format, &rect);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc8034_update_ctrls(gc8034, format);
+
+	return 0;
+}
+
+/*
+ * No binning or scaling: the output size is the size of the crop rectangle. A
+ * new width or height centres the crop rectangle on the default crop
+ * rectangle along that axis, within the area, for userspace that does not set
+ * the crop rectangle first. The default size gives the default rectangle back.
+ */
+static int gc8034_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct gc8034 *gc8034 = to_gc8034(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	u32 width, height;
+	int pos;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	width = ALIGN_DOWN(clamp_t(u32, fmt->format.width, GC8034_MIN_WIDTH,
+				   GC8034_MAX_WIDTH), 4);
+	height = ALIGN_DOWN(clamp_t(u32, fmt->format.height, GC8034_MIN_HEIGHT,
+				    GC8034_MAX_HEIGHT), 4);
+
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	if (width != crop->width) {
+		pos = GC8034_CROP_LEFT + (GC8034_WIDTH - (int)width) / 2;
+		pos = clamp(pos, 0, GC8034_AREA_WIDTH - (int)width);
+		crop->left = ALIGN_DOWN(pos, 2);
+		crop->width = width;
+	}
+	if (height != crop->height) {
+		pos = GC8034_CROP_TOP + (GC8034_HEIGHT - (int)height) / 2;
+		pos = clamp(pos, 0, GC8034_AREA_HEIGHT - (int)height);
+		crop->top = ALIGN_DOWN(pos, 2);
+		crop->height = height;
+	}
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc8034_fill_format(format, crop);
+	fmt->format = *format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc8034_update_ctrls(gc8034, format);
+
+	return 0;
+}
+
 static int gc8034_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -750,7 +900,9 @@ static const struct v4l2_subdev_pad_ops gc8034_pad_ops = {
 	.enum_mbus_code = gc8034_enum_mbus_code,
 	.enum_frame_size = gc8034_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = gc8034_set_fmt,
 	.get_selection = gc8034_get_selection,
+	.set_selection = gc8034_set_selection,
 	.get_frame_desc = gc8034_get_frame_desc,
 	.enable_streams = gc8034_enable_streams,
 	.disable_streams = gc8034_disable_streams,
@@ -825,9 +977,11 @@ static int gc8034_init_controls(struct gc8034 *gc8034)
 			  GC8034_PIXEL_RATE, GC8034_PIXEL_RATE, 1,
 			  GC8034_PIXEL_RATE);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &gc8034_ctrl_ops, V4L2_CID_VBLANK,
-			  GC8034_VBLANK_MIN, GC8034_VTS_MAX - GC8034_HEIGHT, 1,
-			  GC8034_VBLANK_MIN);
+	/* Ranges for the default crop rectangle, see gc8034_update_ctrls(). */
+	gc8034->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &gc8034_ctrl_ops,
+					   V4L2_CID_VBLANK, GC8034_VBLANK_MIN,
+					   GC8034_VTS_MAX - GC8034_HEIGHT, 1,
+					   GC8034_VBLANK_MIN);
 
 	gc8034->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					   GC8034_HTS - GC8034_WIDTH,
-- 
2.47.3

