Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5A4A8A10
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360861; cv=none; b=C4N6xhz3EEo6hBsujPtyr5xuomWQcZ7v3FTgub5QVZva13g+2E5ZaqQotC+kTjV+2OHxs/Z3OvowLclcKFYTQhwo7vQsl05AOplb0A5RUBrd8XluYmlM69gJpiyRgSOpfzrv3mnKAQxRlLgSk2QZDGBoNBbAIkxXo60LnXP709s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360861; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX9gORCvpvZ5BQmSPZBEDLZFv167OsMVr3WebOT+urGocKdneaxuUy2cFLmlDJdfOVsrQPUWOHLYQNsXADH8DPJt9NYAa8XfJWSaaV5OoP94Kp2uGXfZW8hvWZCcGQBcBtMQH01S/C4Bgo2CyFzQJAJybbQr5OSSScKO0NQclNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTf3ZsKu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTf3ZsKu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso8054955e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360857; x=1788965657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=PTf3ZsKu43DNemKwCtOCKTd4+2FDPV7poHONylNZ6fe9T/2+9kF7zjhATVHDngMSAN
         grjUWOmskKbZ3hQVLukDxqQE50cSyjcEImB0eq+X0YOn0T9RfW7c4MD5aVXQ8qhGgbnz
         grz7P81JFrH1LPxDe/cP8M54KqAj86PFOG/A3b5t5U4kcwuCie9iraS23JT8xioYvDeY
         4SqyqGbKuSTsPy/gCvQQTVKjoSloZ2sjtVoVgW5ibQfs0OupSlP4Zw8kn2oiP4tmGHJv
         Ol0s7S0b8+bkalnrizYXLn872P8E1pLIHplNl2Y2EWSWjG74wWJXHgZd+KyCY96Ga3qV
         DX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360857; x=1788965657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=ax+mxnuYiEKy99JLle/GYkH52jE6ZwveLYAFl0jueSihG8uCxoaG3GsKV3/pYyehde
         AToSBaioY7GOgeykYuUwUeAFLwMuf9NGi2YBgk9p5cJ2vlJ0Hup3IQMfrieTc8bQTx10
         dXvkBrkA+JQOWYdPQOAE8MOLr3fZendAMXg9UC4Wo21vCqeH7iXn9vGJRfMaW17NPybF
         PS0KshhxmAsLm4ZSwst8wWBzF889FNUwPI/LZAXHdHFXDpjq6Cf1w8Wzh61w9wQrI7Lm
         1hb3a+gsVB/SzvBspj6txxgxCQ4IoON/MDwcSP2IFgcKXLBIBjyA1LPvlodlsib64ZYO
         fJlw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy7Ueniu4GgH+t4i+nuK/DlLyjLKwlEtkVkwjDpndU079t2TuPIHZFwgw/6d4tRi70pTCBQ04j8GxDEEs=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Mf/O+s/X2sKmUW2PD6GE3b802UjyXQpIGXWIkEEi9vx82IF6
	/IkxZ4AsK3NERuAEGe3HVlw6950UscUYx+M6ceIAT/sd1ptmyyAW4EAN
X-Gm-Gg: AR+sD10YZRhBxEcHZGGgQjsJg7n9TH0xXen0traBOdxR14s8dDG3eeLy/v3tJBrd3t5
	YxKapr1gYY+GDTVCtelrduHhslQ4sUiO0u6axlIWqyFfzQwYgBOC3VFHjGzrJ1WVP/TctWWwNMK
	omw9iXr2lmVO9YeZaNs1ticlXouKiIGO8DjnWqUqsHlQvwv+uha0/xbrUql2dPb0Zqq/5Vw1sG1
	gvEwc7AZFnNBEbO6upQ+X11Hwwm/U1BsW9LKlLZMfVlVAVivDCFTqQFyZgs5hv0gln87WWRoYbL
	hT93168i6dd9ToC7NsebEXg5naB+HIcb2soRx0gD3fSrYEQfwFLjTxUNEFJk5/dXPUyXBLffBVF
	qoZYmOe0y4UryqlKMovDBNDPWY2TgghH5XIJOkEcEGDHNHzj4ImYdBQZJuIh54dxRpHyHRBHoeH
	6x9IwmtPvL7DDgW7xP417oHixxnglQWb6jugOW4H90zWa0LjjOJP+1hvVxJeyZiyOVudKGWTJG7
	yZZqDkSvx7bKIrAY0J4YCUgLPXHq88xYcA5lEpKPFoi
X-Received: by 2002:a05:600c:8411:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49ce58204a0mr95925455e9.8.1788360857170;
        Wed, 02 Sep 2026 07:54:17 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:16 -0700 (PDT)
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
Subject: [PATCH v7 15/16] media: atomisp: allow raw Bayer capture
Date: Wed,  2 Sep 2026 16:53:44 +0200
Message-ID: <5a163a69a3cb3b139f2c7ba5eee5b32bac575d27.1788360629.git.mauriziocasciano7@gmail.com>
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

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759effdb2e8d..99d2b73b160d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3815,8 +3815,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3838,7 +3837,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3858,6 +3860,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..aa6d13a4de89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
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
 
@@ -554,9 +563,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -630,7 +642,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0

