Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C2A4DA556
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854706; cv=none; b=O1RksV2Wxf9mYxB8Ykd3DaoeUq2AebjQ1CJr5WqKiLUOOO4jxIA+rPREozTvC29UEOlf0VlwstWa4ftR+W9qElOxwMKXT25sLW0CV4SYKU9J2w0aOk6I0kU4KXGkJ+lJiTtFb2U176u79sxcOE66IEXU25TquKQWyIzbsobzCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854706; c=relaxed/simple;
	bh=RYdrLwH4h+db+xtAWeNMl52pZgc+y52f5gMk/8n3UwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlqfBgiSMl8YPNkHzKYR4JSTn/j+bYkEeQU+0oE0A7qqAFbrVxIKtmpcXbts740yVmr/Cm8ebno+EmvYPHgYmNoeAI2muTOnP5mt7F6lTOwWqfF0qbf+9QkOBqjZur5MMNx+dpcxhw1NwWLe1fCA0SlcjNqUpNhBtFOHdlByO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiC7bbvu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiC7bbvu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so374975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854703; x=1788459503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdfQB75hwQ5O/YIBlhw3RWCBdEtxxEHY16kGD6NRP9U=;
        b=GiC7bbvuIw0p2uEJsEk3W0m8L2wTa5VXeVK3nUBtM/vLRJHhrUahsc1nE1YaQlDWJQ
         A0JEKfO/hCVzl+s970K0qreMc81LMeCBxagA5VDF8//iNKOE2t5/Jk9rG+Xzl7Ky5FdY
         KCxx8c8Dz4cIv/bDTVYJqHvAiP6QZXJonLf72vqZmEk7tJ6EpO+wTTixG3+Feybs7YDi
         XwecRiNwDOH3bdjNCDKSVQqrkTdv4hKFYcUenEMvNrt3ODJ53yrEKslPEkSu4wU2NJBw
         mJYBIf9fqBH4taRVf+d+YyL+bdDZEcfnM/hTuwatAcCyAeyMZaHhCi6zvXgd3X3GZszA
         G5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854703; x=1788459503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdfQB75hwQ5O/YIBlhw3RWCBdEtxxEHY16kGD6NRP9U=;
        b=UsfOLqD2O2mo0QljjzxpnGYmqHJ2Bi3JrkZwIoqDSZm4hhQFjCh4ZWfM5JH/JRo1O+
         NijHmT1kJ6eeN/r7gSOWUkMul4guWVXDAj9kbqbTG/ot8cb1UqIaKL7J+0x7QqE6ce/5
         LskQcTeJAsy/NkrSKQGBp1HSfPImbhvvrEbamIj9tyQX8Dq8YUAwgJVvmk/E1nCSEvwa
         DCWR7ZWPeWdyWXF+7NIWhQSskGDdZ8yTn55AcWqM47JXeIGQQEgjbx/pAPVcTnNCL/Bm
         l2+P+NeGWpjpwus0oYcNvq0fZ2ynQ11shkgSptOHUfOXK1suhWA2FZlWh+X4nV9aSa3m
         gB/g==
X-Forwarded-Encrypted: i=1; AHgh+RpNPVYwYnEA9vUxz3o2Zw02yI2ZfYe5xWPZA5pz6kRwunj3BJfK6z53fBRKxH+Q0L/e85WY5mlLl9b67hE=@vger.kernel.org
X-Gm-Message-State: AFuF++lnborFYM9k+0aPXC+EzrQ1bHRGKDzyg1Kv0PykxJMmfPMtVcR8
	16yzpQtdKIo+4S/UFOBinyNQaEFhGLboYWZrrFZ4m7La3qeTFOPL8q55g64RPiPv
X-Gm-Gg: AR+sD11+84izdsRBTyezK/56YdUDb6wJL2oEEwBwdv2EHgNqhZfN8X/DSSUNFpizZ2E
	qlWVZyaS6SCXVn4ANz1y9l8dGMGne/jSnliwqs+0DqdFAgpcZ/ujgEAK0CnWxv5hbbXFm79KbCW
	0nBaunQecqOM4mqfAsy16M1i6ns/E8xUBjsDo6WIcDJWAJgTbz1H/37KFhzG+MfPKjLf/rXblz2
	VWqN+wu6518SDqrmlNFXeK+YIcEC4h8hd4ftDwWrFVLXi7HGvmeay8SuGYKVshFlk3s32dfCams
	uwgRcJIgFwLYjDrJviMoNu4HEY+nRB+yv2Qv4cRIBnuz7FSKrw6fiTmdMX6rxVPA7hbKuWO62oi
	HgRMDAd4UujsAlfh29iSHKImuCfxApLfF9T90L73KrTyvZvY0SrryB59bxqUtKqt7Eyzc26/x9h
	kHdVmVs9XwbSw37z7EKFpwp3S2axhJuBRXB0o7VZnPkWnHqFIiEGJIWYRXQ/hqD2/kNtxL3tedX
	2nyhVkwYJF262ly0LRpLpJBxiynS474UFVnnKYL5bGX
X-Received: by 2002:a05:600c:4ecb:b0:499:d95a:44d with SMTP id 5b1f17b1804b1-49b91bd885fmr17247855e9.0.1787854702790;
        Thu, 27 Aug 2026 11:18:22 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:22 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 10/11] media: atomisp: allow raw Bayer capture
Date: Thu, 27 Aug 2026 20:17:55 +0200
Message-ID: <20260827181756.2430054-11-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw format requests with the code selected by the sensor.
Userspace explicitly opts into raw capture by selecting that raw V4L2
pixel format with VIDIOC_S_FMT; no separate module parameter is needed.

Also apply the per-sensor padding discovered by the CSI-2 bridge when
enumerating and negotiating processed frame sizes. Raw formats expose
the full sensor transport frame so ISP2401 can use its copy pipeline.
Existing systems retain the global padding defaults.

Tested on a Lenovo Yoga Book YB1-X91L with raw capture from its OV2740
and OV8858 sensors.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 +++++++++++++++----
 .../media/atomisp/pci/atomisp_internal.h      |  3 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 22 +++++++++++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  9 +++++
 4 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..70ff9b55b52e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3572,10 +3572,17 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	u32 min_pad_w = ISP2400_MIN_PAD_W;
 	u32 min_pad_h = ISP2400_MIN_PAD_H;
 	struct v4l2_mbus_framefmt *sink;
+	u32 input_padding_w = pad_w;
+	u32 input_padding_h = pad_h;
+
+	if (input->padding_override) {
+		input_padding_w = input->padding.width;
+		input_padding_h = input->padding.height;
+	}
 
 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		*padding_w = input_padding_w;
+		*padding_h = input_padding_h;
 		return;
 	}
 
@@ -3588,8 +3595,10 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		native_rect.height /= 2;
 	}
 
-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	*padding_w = min_t(u32, (native_rect.width - width) & ~1,
+			   input_padding_w);
+	*padding_h = min_t(u32, (native_rect.height - height) & ~1,
+			   input_padding_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3804,8 +3813,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,7 +3835,13 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		padding_w = 0;
+		padding_h = 0;
+	} else {
+		atomisp_get_padding(isp, f->width, f->height,
+				    &padding_w, &padding_h);
+	}
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding_w;
 	ffmt.height += padding_h;
@@ -3846,6 +3860,11 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			ffmt.code);
 		return -EINVAL;
 	}
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
 
 	f->width = ffmt.width - padding_w;
 	f->height = ffmt.height - padding_h;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5a69580b8251..66b12461bd40 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -98,6 +98,7 @@
 #define ATOMISP_CSS_SUPPORT_YUVPP     1
 
 #define ATOMISP_CSS_OUTPUT_SECOND_INDEX     1
+
 #define ATOMISP_CSS_OUTPUT_DEFAULT_INDEX    0
 
 /* ISP2401 */
@@ -116,6 +117,8 @@
 struct atomisp_input_subdev {
 	enum atomisp_camera_port port;
 	u32 code; /* MEDIA_BUS_FMT_* */
+	struct v4l2_area padding;
+	bool padding_override;
 	bool binning_support;
 	bool crop_support;
 	bool sensor_on;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..cf3e68983e0d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -536,11 +536,19 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
+	struct v4l2_area padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
 
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
@@ -553,9 +561,16 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		padding.width = 0;
+		padding.height = 0;
+	} else if (input->padding_override) {
+		padding = input->padding;
+	}
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -629,7 +644,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..7b4c1c6c1295 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -25,6 +25,7 @@
 
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
+#include "atomisp_csi2.h"
 #include "atomisp_fops.h"
 #include "atomisp_ioctl.h"
 #include "atomisp_internal.h"
@@ -889,6 +890,14 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	struct v4l2_subdev_state *try_sd_state, *act_sd_state;
 	int i, err;
 
+	input->padding_override =
+		atomisp_csi2_get_sensor_padding(input->sensor->dev,
+						&input->padding);
+	if (input->padding_override)
+		dev_info(input->sensor->dev,
+			 "using ISP input padding %ux%u\n",
+			 input->padding.width, input->padding.height);
+
 	/*
 	 * FIXME: Drivers are not supposed to use __v4l2_subdev_state_alloc()
 	 * but atomisp needs this for try_fmt on its /dev/video# node since
-- 
2.53.0

