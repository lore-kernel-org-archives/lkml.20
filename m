Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114C446851
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929130; cv=pass; b=IzlHwVn8g90qVhGUGNmIi6QBW6ulLErQz8BQ2hSrM3tWTSVpNjOx8KIKmpDVw/BahYC8t4T+1FwUKM6JL3Vvc6P1KH85EusWbOmw/N4PVLoxNZhI1g5YtfpaRDmlqbD1ZPkqXwK+N81B5iZzc1PVvJK6obfTGxcRwG1BYyslSCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929130; c=relaxed/simple;
	bh=WPtWd49EiKlguQgy6B8D9o729ZRJHyDjZKXzik94Qig=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmE8WZUPnbE/hHIkRbfmiUoGssYCQMvkJ7e567D75uAQUNERxH6ES/cWSh4LyAJNu6boyj/SA1S9rAOZ9ZF3NoxMzna/lb6spI5KBwcPuYne3PwmDhnOHvErnoNE82jIflDJysu8HNexSehRYDBxElqttOxP5yW6xv6jckvzkz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuGT1qx0; arc=pass smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuGT1qx0"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-499c0f06935so2841110fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929126; cv=none;
        d=google.com; s=arc-20260327;
        b=YmIm2dnTdsPCrAMUy065Lo2qem7cDsxNjBuVsac/GLpi/ZcCF4GKDDu8K4ymBDiAsT
         Mw/BzCX9HGNhKSCHChtzaGWzn0rXJdiJqggb6D+FkRbJze9mFdzFxoiMV9DfRHASMlkK
         iMPrVMvDk/9c+esh192Sd64kEGlsxrjNh2AI3mm714Tox6zZs2d0rda2G3W1wGPNrkco
         oH1dIy5lN2tXQi9MULiKZHdakcSlFY7/ppQkvyWq1IMv9TrCtEni0C/SbZlMAalg4onp
         oH+09XaQoYYSEu+RRofkfTUWHTjEkVWEKZG1N3dZg1D2AwB6JpOUhXBurRp8OXTRIg6h
         xOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=t2RmP43ESgvJlZDxaBNEaXHcD9a/vhbRcZJMfZrT2IU=;
        fh=wAOSuvwGQsSG4FG7IAnVXSLdq2pomGEVy1aCGmcWPqE=;
        b=hdJf2rgKnrPhU0GC4Vlvn3Ju+3CvcrY1yiXwng6ZgkeQBNXHb+by5/L/kmGFs7YEA2
         ccGOVuAICLSjeZUl2G+2+b3nxzFZ2wicHL4lLlxk0xaVQo+C64yCS1lM/MJJ6pa3MB28
         GdUcGxR3xLx0EMivyVwRY0JzuK3hFICdSP6y/ZglT/G+ukuoYuGeL59kmWsqe84xUA2v
         neoj+oU09jT3ZOCA8I1jXOstmAgUemd8wBDaZiXMbjBUB7pec/+dpC/fGz/wq2O/D5/p
         v4wsDvZWohT7zp/aVW+SEAIJYXDaWdBknFIklOJv7arTvapwyMBgYmDWZn7r8ObI8aVG
         n5Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929125; x=1791533925; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2RmP43ESgvJlZDxaBNEaXHcD9a/vhbRcZJMfZrT2IU=;
        b=TuGT1qx0GgEEmL+/p4LRtIaq+ZoAN2s2dXVTNyPuQYapvWeB3vbTlNtnhtcwwW+ZMg
         5pDg64ksO97j/teLAqRvFd4E6Ar4p2GurzJk/pWgDwT7O8Tvrth1Q+sjCq6pryfS/EW8
         N5uTYwoSBTDdsc5hr1qeEBjN5+Vz2ysTtAIQhJdx4lN62+5nSBUYxNxxPfLGnzhjLe/K
         vOqnXNX3v4f0KT/hI77yBqKl9+PexeU2bLvvhvwAC93f0srnqfL/8taC/Nu1yiUbllOs
         KmXMRSPsLAv89r9X/nQpCQtOrapBH4IpeJCX3S+dWVw1aqJ7Qym3lHc6jE5NmuCqc6to
         E50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929126; x=1791533926;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2RmP43ESgvJlZDxaBNEaXHcD9a/vhbRcZJMfZrT2IU=;
        b=LWYMDcY5aKqQqOCQoT/LUUqBIP/SdQkQB9de3+JzAwEjEnlxrhomaklmFQskN4fveg
         Aa6sdOIgahkQc3kJx18Vuc/l3BuLaIs7abkbyTBTGwAhDB8DrPiP7Q/DGZewpyadLvdW
         OprJmGS0urVxyHZ8kdh6SZybTikofGLH+IXF3R4rKlPSa0vq9oq0SXchq74g5cAn5OLV
         0lm13/GaT2FcvtnwSBMfA5Ct89CUxvXg+AuFn/sns8QcaeyPXCD8umCCD7Hz+LAfp0Wh
         8KQi7joftBA1i9JSRc+oiSyH9tB0bTgLNwXdThX49a9TL1TQzwOFRAIVR5a6HwlgGlhO
         nEEA==
X-Forwarded-Encrypted: i=1; AKwUvByLK6iS+bEBJ9qbzLdyK7FCvlbH3n9ziyj8+1a79x09lcfXIQUBPfksT5Jz7Maf6uz91g2LCy/qOQ2iibs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgGmCoHTlS4JV1LrXckbQ4VkceC6oQwWxIFuYQA/HG5Mk3s0c1
	F1pZhMes0TDoYYfyRSmSxjthYjQDtRWsKygzilb+XQf95xMjAlzkDpWWasmPxgtERvSBddPdxQY
	dK1FGMz0QwFIFPY5jSLko8M7tSzIsu+w=
X-Gm-Gg: AYBFou0OEmz8jfG99Qk2JNS+iyCHIdcAWWiBDgQmI5GK30lxlhtfy9gN4RtMqJuzkoO
	XaRvLuKP2DIBeLsb4TqkLF7wnBY7G8m63CRr5Y2iRM/Oiir7EJhdpMPdZRW+2OF/ZGO5snzZRfz
	Hhvbkwjj8kqxwGt0rAjyy2JUQeO3T7/vS4drkBZQ5oOMDbXV1BqBq+tvJ8fmXh8PK3XwCQFd/Um
	P9NQ44MOnYYcUa2n3IkaWt5qAmxqvdviDnr1Z6YrPDZ6TPLYDqG3imHIJWrNdk6piwRFbw6kpSQ
	7IDXwqzqcTUMIcV2xVQFtZ0taxixC3ctocEsbMbaFB48mrFxAbAJCnRlZXHZmlo0nX5Ovr4i1xe
	HVvIsLauTDqnBKO16zmCbjXnS66FJkKrW
X-Received: by 2002:a05:6870:b528:b0:494:b4f2:3d87 with SMTP id
 586e51a60fabf-49e15e4506fmr1620681fac.35.1790929125566; Fri, 02 Oct 2026
 01:18:45 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:45 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:44 -0700
X-Gm-Features: AclHuK8uWr9wI7OK_Nvzj5oLr0hrnya3T4ukhBcVWU_2vTiFQh0DPCHXsVaKDxM
Message-ID: <CAO7O_xjvVvpCCXALhGK8h9FeAzisr_XFQF2VnsjH_pYBrVw0tw@mail.gmail.com>
Subject: [PATCH v8 13/15] media: atomisp: Use struct v4l2_area for padding
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This makes the dimensions explicit and simplifies all three callers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 69 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 15 ++--
 .../media/atomisp/pci/atomisp_subdev.c        |  4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +-
 5 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 52c71cd86dec..4d4c0726d9de 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3562,9 +3562,9 @@ static void atomisp_fill_pix_format(struct
v4l2_pix_format *f,
 	f->xfer_func = V4L2_XFER_FUNC_709;
 }

-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h)
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect native_rect = input->native_rect;
@@ -3574,22 +3574,24 @@ void atomisp_get_padding(struct atomisp_device
*isp, u32 width, u32 height,
 	struct v4l2_mbus_framefmt *sink;

 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		pad->width = pad_w;
+		pad->height = pad_h;
 		return;
 	}

-	width = min(width, input->active_rect.width);
-	height = min(height, input->active_rect.height);
+	size.width = min(size.width, input->active_rect.width);
+	size.height = min(size.height, input->active_rect.height);

-	if (input->binning_support && width <= (input->active_rect.width / 2) &&
-				      height <= (input->active_rect.height / 2)) {
+	if (input->binning_support &&
+	    size.width <= (input->active_rect.width / 2) &&
+	    size.height <= (input->active_rect.height / 2)) {
 		native_rect.width /= 2;
 		native_rect.height /= 2;
 	}

-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	pad->width = min_t(u32, (native_rect.width - size.width) & ~1, pad_w);
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1,
+			    pad_h);

 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3617,8 +3619,18 @@ void atomisp_get_padding(struct atomisp_device
*isp, u32 width, u32 height,
 		min_pad_h += 2;

 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
+}
+
+static void
+atomisp_get_pix_padding(struct atomisp_device *isp,
+			struct v4l2_pix_format *f,
+			struct v4l2_area *pad)
+{
+	struct v4l2_area size = { .width = f->width, .height = f->height };
+
+	atomisp_get_padding(isp, size, pad);
 }

 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int
input, bool on)
@@ -3806,7 +3818,7 @@ int atomisp_try_fmt(struct atomisp_device *isp,
struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
 	int ret;

 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3833,10 +3845,10 @@ int atomisp_try_fmt(struct atomisp_device
*isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;

 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);

@@ -3853,8 +3865,8 @@ int atomisp_try_fmt(struct atomisp_device *isp,
struct v4l2_pix_format *f,
 		return -EINVAL;
 	}

-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;

 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4274,11 +4286,12 @@ static int atomisp_set_fmt_to_snr(struct
video_device *vdev, const struct v4l2_p
 		return -EINVAL;

 	v4l2_fill_mbus_format(&ffmt, f, format->mbus_code);
-	ffmt.height += asd->sink_pad_padding_h + dvs_env_h;
-	ffmt.width += asd->sink_pad_padding_w + dvs_env_w;
+	ffmt.height += asd->sink_pad_padding.height + dvs_env_h;
+	ffmt.width += asd->sink_pad_padding.width + dvs_env_w;

 	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
-		ffmt.width, ffmt.height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
+		ffmt.width, ffmt.height, asd->sink_pad_padding.width,
+		asd->sink_pad_padding.height,
 		dvs_env_w, dvs_env_h);

 	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
@@ -4371,13 +4384,11 @@ int atomisp_set_fmt(struct video_device *vdev,
struct v4l2_format *f)
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);

-	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
-	} else {
-		asd->sink_pad_padding_w = 0;
-		asd->sink_pad_padding_h = 0;
-	}
+	if (atomisp_subdev_format_conversion(asd))
+		atomisp_get_pix_padding(isp, &f->fmt.pix,
+					&asd->sink_pad_padding);
+	else
+		asd->sink_pad_padding = (struct v4l2_area) { };

 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574e77..8a84e774f4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -225,9 +225,9 @@ int atomisp_makeup_css_parameters(struct
atomisp_sub_device *asd,
 int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);

-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h);
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad);

 /* Set sensor power (no-op if already on/off) */
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int
input, bool on);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..87c29a940f9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -457,7 +457,7 @@ static int
atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      const struct v4l2_rect *native,
 					      int *valid_sizes)
 {
-	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+	static const struct v4l2_area frame_sizes[] = {
 		{ 1920, 1440 },
 		{ 1920, 1200 },
 		{ 1920, 1080 },
@@ -470,15 +470,15 @@ static int
atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;

 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area padding;

-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, frame_sizes[i], &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;

 		/*
@@ -491,7 +491,8 @@ static int
atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,

 		if (*valid_sizes == fsize->index) {
 			fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-			fsize->discrete = frame_sizes[i];
+			fsize->discrete.width = frame_sizes[i].width;
+			fsize->discrete.height = frame_sizes[i].height;
 			return 0;
 		}

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18da2..495032966b00 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -327,8 +327,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,

 		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
-			crop[pad]->width -= isp_sd->sink_pad_padding_w;
-			crop[pad]->height -= isp_sd->sink_pad_padding_h;
+			crop[pad]->width -= isp_sd->sink_pad_padding.width;
+			crop[pad]->height -= isp_sd->sink_pad_padding.height;
 		}

 		if (isp_sd->params.video_dis_en &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be3f2..0045f380de74 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -214,8 +214,7 @@ struct atomisp_sub_device {
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
 	/* Padding for currently set sink-pad fmt */
-	u32 sink_pad_padding_w;
-	u32 sink_pad_padding_h;
+	struct v4l2_area sink_pad_padding;

 	unsigned int output;
 	struct atomisp_video_pipe video_out;
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
