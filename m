Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792A48F03F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815740; cv=none; b=nbYduiL6Shhn7O8PY8yBXR+EBAnv1lqaOs912Q/ylMYZIATQ6gDusWljVrtgO3ZgtochBXk5z0OE6GhDYe/Lpm6hr2BILjHZZxkYtvRJT9rOfOsvwH1errpqkRBdOnhR5pHZXR60JSlGRASMbxT9GxiXap5BTR6SI8ryxm2+uXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815740; c=relaxed/simple;
	bh=BGuAqFALStbwJAXCQzX/vqIyyIDX8IDokWJhJmnJrF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PISqhSTxHvVV9ffLbiVKhMk5oNHHCahZj7i22O8veI26B/Tp1Ig7XPiX7f0cSNqXDDxh28pH09QXwMNzXAHfUcuVIIx1+jRhd7bASYjdPSWQ81AvjRVsC/i0cGQBuKmyWcLKPYhfn9+tI5hcCdi6lNBdRDo3hY2OlOHZMOrShQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBN7ybMt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBN7ybMt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1841374f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815736; x=1792420536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/krusyMYMtVA3LOw6qRB390TfDai7JcLAM0jSVl7dQ=;
        b=CBN7ybMtv7tNyn4Sc4J3V9zhkQ7nng+gnEt0rLNJ6ECm/xRHMnc/79AfeOUS/u+JHO
         LXnlEZYzdOzQfnadkSrgZ10acVoR6FuWtjB42SKPigNgEkJYVeWUqs0qg5zZUMPszzeK
         2AFQR7dY4mwNusTNd+xZ1Kr3qitw0kfYUAoTp+hgnTBnmQXVloDHQL8wN4s2DOjeURcd
         pQpVrMoQh6H4q09AA2pGtfEhQsl7OkWTwN0NYIEqLKs6BJoPeohpdT4MCBv9HAlazmeU
         Au0Upt1nUPv7PuxZHbrLlqTGOIsYUGU7k2SbD/iKnrBugQD8jJ/EPRmFADoI3FgWCWnJ
         QsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815736; x=1792420536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/krusyMYMtVA3LOw6qRB390TfDai7JcLAM0jSVl7dQ=;
        b=i2Zu7IIOtKR7VVUAA9UYQMzDLKk0lF4EdissP6ustyfbM4/MMdUHmdPuiwPrFypV/L
         lQu3/u0iHtHJ2LnBuUNyVoEHLGW9hOPjbWkRELEqiWq5Z4EYTv1/gP6mPu0KqzGFOda+
         s+2yTH6sFFpAHzBfaolp7HH+LNoF4MdOzqjRrvPrD1dQmEjcpWNPFuV/V9zrS+Jkzxm9
         moi6wZ1TTF9bv3x1iJ2tMzc6kaQhBFMPC5m96/Azx9ZDtGSmM+WIteNWD/db/8yeDARQ
         d9KUvH7AImNnbGeROBUhHEec5W/xQfH7ZYwhjGgKxn9tE4MFvSHal5UA6v/svd4BaSMD
         PsWw==
X-Forwarded-Encrypted: i=1; AKwUvBzf/3igOE9CjjIdK1uSSL8U+12XMC023EjqFFqRzATsA+mdOgfPgdYci7f5ngFn3TWponGJ5Q1QaoM4h/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ073o+7DfFPOPIIO5Cti3NA07AlK8i1QZ9oaqTO55MF446WDs
	/v/7VHZZ6vY3tzv5ya9j1mPWeDnFadjFpVTLARzwVIGTvdsFWUkLzaJ9
X-Gm-Gg: AYBFou2QCw/P62YNw9bz4h8vM8+YXYsVthHmjmYuvTQVgv+FJwqCxbtXkACKNo7SnKL
	zD/ZX3yxSITIK1XXgAiSwR9OcG/akkqgdDC28bpWO4qvXZs7CGJO4m1UN4sodlKa/fvdc0e5kkF
	giloQhjZsSN7BbSGaTn8BJgcberrKp65x6YtJNfFP7yYNYfBvIuOKMtgx4YaeilGRX32EIQHcxF
	q2BlduErPKCosJ/WQCiPMvMndA2Eoq4zZaXkQIMbvpu6CwXbhTOYBHHoZKFgHFbb1pmQ2yKtn3S
	GtKLqFvdup9OT+JTXb8N04fvIgtj64AgggypZ21TKBp5kRfqGYLNsYgoFYUFk8VP//C2rLO7EsZ
	uh+Yk6Z+YZDk++9APAgbhSx/ug0PamyHUA3pXpyuCKg5+4IpkClC2U8INN6wI113hy4SxHVbUhD
	YXNZ+bT/e1mzqpRKqzKToxAOLv7RFe/ZpQ4uDZ8gchMs7/BRAQ+ZaHrinyF/fdn6AHhddAS6QBq
	h7OyNOyALcIT7hHtw8wlGKqVGq875ZMDgIYtfKz59cxnXWK7oMEuFds8XMoASPlZcB4v11sddkW
	VNEObqZtydvgKhbOWIT5JCZtVSWRT2xENIowdFSdXDPrwPiphRBvZ5/W8+EP64GcnvTmCWPmlgW
	kdOQDnPQVzZPXo2n3aQNz0M04bsdIeNKR3Ox0fp1KZuKefykOoPKinw==
X-Received: by 2002:a05:6000:438a:b0:48c:7dac:895a with SMTP id ffacd0b85a97d-48db940d2demr20638392f8f.1.1791815735444;
        Mon, 12 Oct 2026 07:35:35 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:34 -0700 (PDT)
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
Subject: [PATCH v2 4/7] media: i2c: gc5035: Add crop support
Date: Mon, 12 Oct 2026 16:34:40 +0200
Message-ID: <20261012143443.34897-5-nicfio@gmail.com>
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

Implement the crop selection on the source pad. The vertical crop is done
by the readout window, which shortens the frame: 640x480 runs at up to
106 fps with the minimum vertical blanking. The horizontal crop is done by
the sensor output crop, as a narrower readout window gives black images
and the column start register only moves in steps of four columns, with
even values giving corrupted images. Crop offsets are even, to keep the
GRBG order, and sizes are multiples of 4, from 64x64 to 2608x1964.

Without binning or scaling, the format size is the crop size. As in
ov01a10, set_fmt centres the crop rectangle on CROP_DEFAULT for userspace
that does not set the crop first, and setting the format or the crop
rectangle resets the vertical blanking to its default. The crop and the
format can't be changed while streaming.

Tested with v4l2-compliance (54/54, no warning) and with crop rectangles
at the bounds, in the corners, at the minimum size and in the centre: the
position was checked to the pixel and the frame period is the computed
one.

Assisted-by: claude-opus-5-5 coccinelle sparse smatch
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/i2c/gc5035.c | 167 ++++++++++++++++++++++++++++++++++---
 1 file changed, 157 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/gc5035.c b/drivers/media/i2c/gc5035.c
index 87c3742f1..b7190aa52 100644
--- a/drivers/media/i2c/gc5035.c
+++ b/drivers/media/i2c/gc5035.c
@@ -11,6 +11,7 @@
  * Liang Wang <liang1.wang@intel.com>, derived from the ChromeOS series by
  * Tomasz Figa <tfiga@chromium.org>.
  */
+#include <linux/align.h>
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
@@ -20,6 +21,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -106,6 +108,8 @@
 #define GC5035_CROP_TOP			8
 #define GC5035_WIDTH			2592
 #define GC5035_HEIGHT			1944
+#define GC5035_MIN_WIDTH		64
+#define GC5035_MIN_HEIGHT		64
 
 /*
  * The line length register counts units of 4 pixels. The frame length is the
@@ -207,6 +211,7 @@ struct gc5035 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
 	struct regmap *regmap;
@@ -463,14 +468,58 @@ static int gc5035_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
-	fse->min_width = GC5035_WIDTH;
-	fse->max_width = GC5035_WIDTH;
-	fse->min_height = GC5035_HEIGHT;
-	fse->max_height = GC5035_HEIGHT;
+	/* The output size is the size of the crop rectangle. */
+	fse->min_width = GC5035_MIN_WIDTH;
+	fse->max_width = GC5035_AREA_WIDTH;
+	fse->min_height = GC5035_MIN_HEIGHT;
+	fse->max_height = GC5035_AREA_HEIGHT;
 
 	return 0;
 }
 
+/*
+ * Update the controls that depend on the output size. Called with the state
+ * lock held, which is also the control handler lock.
+ */
+static int gc5035_update_ctrls(struct gc5035 *gc5035,
+			       const struct v4l2_mbus_framefmt *format)
+{
+	s64 vblank_max, exposure_max;
+	int ret;
+
+	ret = __v4l2_ctrl_modify_range(gc5035->hblank,
+				       GC5035_HTS - format->width,
+				       GC5035_HTS - format->width, 1,
+				       GC5035_HTS - format->width);
+	if (ret)
+		return ret;
+
+	vblank_max = GC5035_VBLANK_MIN +
+		     round_down(GC5035_VTS_MAX - format->height -
+				GC5035_VBLANK_MIN, GC5035_VBLANK_STEP);
+	/*
+	 * As in ov01a10, setting the format or the crop rectangle resets the
+	 * vertical blanking.
+	 */
+	ret = __v4l2_ctrl_modify_range(gc5035->vblank, GC5035_VBLANK_MIN,
+				       vblank_max, GC5035_VBLANK_STEP,
+				       GC5035_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl(gc5035->vblank, GC5035_VBLANK_MIN);
+	if (ret)
+		return ret;
+
+	exposure_max = format->height + gc5035->vblank->val -
+		       GC5035_EXP_MARGIN;
+
+	return __v4l2_ctrl_modify_range(gc5035->exposure, GC5035_EXP_MIN,
+					exposure_max, GC5035_EXP_STEP,
+					min_t(s64, GC5035_EXP_DEF,
+					      exposure_max));
+}
+
 static void gc5035_fill_format(struct v4l2_mbus_framefmt *fmt,
 			       const struct v4l2_rect *crop)
 {
@@ -513,6 +562,98 @@ static int gc5035_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int gc5035_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct gc5035 *gc5035 = to_gc5035(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	/*
+	 * Even offsets keep the GRBG order. The sizes are multiples of 4: the
+	 * sensor rounds the frame length to a multiple of 4 lines.
+	 */
+	rect.left = ALIGN_DOWN(clamp(sel->r.left, 0,
+				     GC5035_AREA_WIDTH - GC5035_MIN_WIDTH), 2);
+	rect.top = ALIGN_DOWN(clamp(sel->r.top, 0,
+				    GC5035_AREA_HEIGHT - GC5035_MIN_HEIGHT), 2);
+	rect.width = ALIGN_DOWN(clamp_t(u32, sel->r.width, GC5035_MIN_WIDTH,
+					GC5035_AREA_WIDTH - rect.left), 4);
+	rect.height = ALIGN_DOWN(clamp_t(u32, sel->r.height, GC5035_MIN_HEIGHT,
+					 GC5035_AREA_HEIGHT - rect.top), 4);
+
+	*v4l2_subdev_state_get_crop(state, 0) = rect;
+	sel->r = rect;
+
+	/* No binning or scaling: the output size is the crop size. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc5035_fill_format(format, &rect);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc5035_update_ctrls(gc5035, format);
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
+static int gc5035_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct gc5035 *gc5035 = to_gc5035(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	u32 width, height;
+	int pos;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	width = ALIGN_DOWN(clamp_t(u32, fmt->format.width, GC5035_MIN_WIDTH,
+				   GC5035_AREA_WIDTH), 4);
+	height = ALIGN_DOWN(clamp_t(u32, fmt->format.height, GC5035_MIN_HEIGHT,
+				    GC5035_AREA_HEIGHT), 4);
+
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	if (width != crop->width) {
+		pos = GC5035_CROP_LEFT + (GC5035_WIDTH - (int)width) / 2;
+		pos = clamp(pos, 0, GC5035_AREA_WIDTH - (int)width);
+		crop->left = ALIGN_DOWN(pos, 2);
+		crop->width = width;
+	}
+	if (height != crop->height) {
+		pos = GC5035_CROP_TOP + (GC5035_HEIGHT - (int)height) / 2;
+		pos = clamp(pos, 0, GC5035_AREA_HEIGHT - (int)height);
+		crop->top = ALIGN_DOWN(pos, 2);
+		crop->height = height;
+	}
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	gc5035_fill_format(format, crop);
+	fmt->format = *format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return gc5035_update_ctrls(gc5035, format);
+
+	return 0;
+}
+
 static int gc5035_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -724,7 +865,9 @@ static const struct v4l2_subdev_pad_ops gc5035_pad_ops = {
 	.enum_mbus_code = gc5035_enum_mbus_code,
 	.enum_frame_size = gc5035_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = gc5035_set_fmt,
 	.get_selection = gc5035_get_selection,
+	.set_selection = gc5035_set_selection,
 	.get_frame_desc = gc5035_get_frame_desc,
 	.enable_streams = gc5035_enable_streams,
 	.disable_streams = gc5035_disable_streams,
@@ -799,12 +942,16 @@ static int gc5035_init_controls(struct gc5035 *gc5035)
 			  GC5035_PIXEL_RATE, GC5035_PIXEL_RATE, 1,
 			  GC5035_PIXEL_RATE);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &gc5035_ctrl_ops, V4L2_CID_VBLANK,
-			  GC5035_VBLANK_MIN,
-			  GC5035_VBLANK_MIN +
-			  round_down(GC5035_VTS_MAX - GC5035_HEIGHT -
-				     GC5035_VBLANK_MIN, GC5035_VBLANK_STEP),
-			  GC5035_VBLANK_STEP, GC5035_VBLANK_MIN);
+	/* Ranges for the default crop rectangle, see gc5035_update_ctrls(). */
+	gc5035->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &gc5035_ctrl_ops,
+					   V4L2_CID_VBLANK, GC5035_VBLANK_MIN,
+					   GC5035_VBLANK_MIN +
+					   round_down(GC5035_VTS_MAX -
+						      GC5035_HEIGHT -
+						      GC5035_VBLANK_MIN,
+						      GC5035_VBLANK_STEP),
+					   GC5035_VBLANK_STEP,
+					   GC5035_VBLANK_MIN);
 
 	gc5035->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					   GC5035_HTS - GC5035_WIDTH,
-- 
2.47.3

