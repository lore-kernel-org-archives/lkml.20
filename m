Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3643E1729
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872688; cv=none; b=UqBTU8e/vKpONB+DggxwMxx+EQrTfhDaNjVZNvjk/GFqZXyxskYE0Ukf6s2h7zvpwhZCR/wUdZl/2nzQMmzs+eWe95CisEzs3v6Ixe16mPneKYg43PIXwijs4wzaN2dUVNZfqEbtAv8TmYL/HwHWNf80030kvC61HIYKR5QuwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872688; c=relaxed/simple;
	bh=06BDGSeWZrjkZVq9Ybz+15BuOvmcmEElYtcKAg3fP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8iRDXpgiys5WKDbxpPJPwzLp3gmvwY8QWCLVI0YdxG9F8OWJeIz5F8kDOeCHWG4hmFx/SiGqEtnlFbm2wOU60ll3OtXS3e3mMhdlRz34ZC1Lw+1seQLoEuP9WBgfNLVsN9pPTRJ6cUEHzNP7s2Q1tDQWA8FaXxJln+aMjLDYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofUFleS0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofUFleS0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2875385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872684; x=1788477484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5EzfrebV+cnYwiBLDxybXNRHeOONSFXixxdRBnShE0=;
        b=ofUFleS03xU+pwOeXSxJ6voN0FJZzcDyv2OVNalrMkRTHAsyGFoql2Wv46KS0nf7To
         Jmx/Fn+PviPRXEFLNtBCeh2ecTh6CnPMK8wvZBoWJ502/Y1mfh4AYHp1wHKX+lnEMMx0
         TVmRUf2/hGYVrXyS1IGqDmtKL+5jBRmZkz7ELHXxVH+JkR97VA7/wgDS0IiPogvt/bD2
         2y0Twp8XgGsQ+aL5kl5MsGibEv2aY6MC008A31fmB3lKhgPxFvCyLqx+G17Y/acbgUIM
         ojq7iIo4eQhy3Igm6QXQtkkKBh8ksDYqUg1297f1GYA8D125XNXTQppDWWZ5HYQ7XVwF
         qTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872684; x=1788477484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5EzfrebV+cnYwiBLDxybXNRHeOONSFXixxdRBnShE0=;
        b=MOmUeBQorLuQSWnQ4dIwnnDW4bJ/HyAf0W1OwF0j840S4iOy8cxAYi36e7BKYawPf3
         mc2xEwQ8LXOBlNiGi01W9yru1BAoCgAbq6zmzbg32e7uvUR7IPNn7T2iVPU+kxQKbQAD
         aQ7OaApO4x2Ze3+dTKD39o1AkG81+85IrUrjnx4042LtqEnfQQz2qrm8/DDE3GTtptfj
         j8Gra7b05wbHVKR/lo8ceGH0boaAQKcMQskYgbxstzUZZNxnw/SQ057NQ068QZXMDM4b
         g1VSBZezeyOmHz+4ox83gWHvBeMRpLUlHnAO/2c5RI5c/tNS2K3lFBOj1Hs8zehG+eMb
         bBag==
X-Forwarded-Encrypted: i=1; AHgh+RoYVk29g2vHKNwvJpflZMiYNfplw90w7Y0NbzcrIlw4yje1qPK/ml0ok5aeb6ixvGF0ouTbVkogbgZZup4=@vger.kernel.org
X-Gm-Message-State: AFuF++kIdw646NUHvVXoLLGnGCUUiW848k2AaH0SwrsAFRKVIiFZZeNM
	ZbAXd1laG8RcuFZpkfkTeJ4lMqfaXS622xcDrNPpHLAtkoIDwLrEw32L
X-Gm-Gg: AR+sD11/CsR7CVBNKbdQ2jIWZLcxAPyHh8o0gzPifOIhPZI5s32BXL+EIOUqJTYHb1d
	bDwHoYl7SVZAf86BMCSOpIXDA+vRxeqUcO8axcWEyDdiUVoJHIwQ8Vhn+MSKP1RS5lDi3Mmk6ww
	eqBcjpyVSjp8sBUWcOJhqgj7s2djroVp4GXMWiv4u+GruXQL9Mc0I0L3yR4lHlTIysU6D9LU2Yf
	0Akd8phZ+LDxi+fJ7rPh8+bk9bghsntq0YP722y+ChRsFctp/vB7txY2abx/9aKMe4ytx3jTHzz
	wfTcoQ9Ohoo31rB+ylfPn6ggHLTYD2pV/66b9up96bAyVaBaIyzGgBzScNvu7u0cDeptVCUTwL4
	PpzIv2EBeEMh4ka+jwCQMWNuKX+4PjdeTBqtVY6th3TfRJif5BmNPnI91X4mGIJOnXfmrsQI7Ze
	VtcK0o6E/ZVRPBXVnEAyhr74wv8fKyQKzMONVuUCJB5qJXET8w3gKTLZaaiD8+1cuJDm9yrtFGq
	SOvUvhjZw/o1XnJANzAJGIAUFuhndGsp1+aDVGRrfjj
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr31843145e9.6.1787872684380;
        Thu, 27 Aug 2026 16:18:04 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:03 -0700 (PDT)
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
Subject: [PATCH v3 11/12] media: atomisp: allow raw Bayer capture
Date: Fri, 28 Aug 2026 01:17:29 +0200
Message-ID: <9535d6ecaa9b12421a6b17de54a954aa336a7819.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 34 ++++++++++++++-----
 .../media/atomisp/pci/atomisp_internal.h      |  3 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 21 ++++++++++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  9 +++++
 4 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 51dd59d98b3b..501a1fb5b83a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3572,10 +3572,16 @@ void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
 	u32 min_pad_w = ISP2400_MIN_PAD_W;
 	u32 min_pad_h = ISP2400_MIN_PAD_H;
 	struct v4l2_mbus_framefmt *sink;
+	struct v4l2_area input_padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
+
+	if (input->padding_override)
+		input_padding = input->padding;
 
 	if (!input->crop_support) {
-		pad->width = pad_w;
-		pad->height = pad_h;
+		*pad = input_padding;
 		return;
 	}
 
@@ -3589,8 +3595,10 @@ void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
 		native_rect.height /= 2;
 	}
 
-	pad->width = min_t(u32, (native_rect.width - size.width) & ~1, pad_w);
-	pad->height = min_t(u32, (native_rect.height - size.height) & ~1, pad_h);
+	pad->width = min_t(u32, (native_rect.width - size.width) & ~1,
+			   input_padding.width);
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1,
+			    input_padding.height);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3806,8 +3814,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3829,9 +3836,13 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	size.width = f->width;
-	size.height = f->height;
-	atomisp_get_padding(isp, size, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		padding = (struct v4l2_area) { };
+	} else {
+		size.width = f->width;
+		size.height = f->height;
+		atomisp_get_padding(isp, size, &padding);
+	}
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3850,6 +3861,11 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			ffmt.code);
 		return -EINVAL;
 	}
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
 
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
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
index 43bca68d1e6d..cd479b272469 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -540,12 +540,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
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
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -557,9 +566,14 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else if (input->padding_override)
+		padding = input->padding;
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -633,7 +647,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
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

