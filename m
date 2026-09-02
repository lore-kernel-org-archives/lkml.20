Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E750B4A843A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360860; cv=none; b=ubi9Na4KPqRQZzChr6tw9ZCW4ztN8z4AePIcNobgMDjiYtPfAwBzb9bcHHyNYPPIZFTTg/PENwKWhILOgA9G7alB7IjJS6ybio1yy1NS/ttuKNd75JCCRCGTm4WAFdmjC9rNGFKUC1Ff6hPQHc+JqV3sWrDx96ugcnkztVePMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360860; c=relaxed/simple;
	bh=CGqSku8s6I9xNM49fj0vJ+QHoL2Fr7Pt+BZAaxIjnVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+CCDcLAAte60Er7R7tNwJIUV/ahiHpluviye1GCaJtQ8jdy/s6OFF3FJFI+9L2l9WdjkuRbcT3O3B+3bPrc6ZyfdDQ3dLG6ZU9203dHHk8pqumC4hBEbgc3ca+cAsstLzoTHfiVoci/snA3M0qptNY6mezbexvDpeZ06dP1nmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzkhUU1/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzkhUU1/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1103812f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360855; x=1788965655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxYVuNTHZtvBWJm7YqYSyMDBs6saulAawUQpfC7rrKY=;
        b=gzkhUU1/eGK0zzpmbOB0cya3g3/Vn6HojCm2Se9n0dusDoiv/ixj9OAmSV37rne/i1
         psl0wkvOf1b5iCYbNW2UmjePdtAb0wvY5E6dLmcZeZQ2+qN6WvkN5UxBQiySDNKpzwNF
         LcSCF4RUVEDHiT0AsnJ30pPuSo99nqB4Qo/ns9XNrOIVgV2MQj4LXlDixXH/UliQEHfV
         lJWblHf5PySTjk4QQaDf0lsrqSr8tIDtKbDh0ULcWeFUlmuvIsUpcQpN772lG1ASu0AB
         Y1qvY/Va1YV+mSuC4YZv8HP5E97YQYglfEnLTtc7n7IBOJHZ76HuM1hvzwoF/m/KqHBW
         JW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360855; x=1788965655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxYVuNTHZtvBWJm7YqYSyMDBs6saulAawUQpfC7rrKY=;
        b=foE15IRrjCNuRlYUOudAkQtthdSI+xR/BAuQiBSG1/O69S+RMuIn2KgW7Py4vAyC+z
         tVrhx5gj+Yu4SXJpxslJ6SASK03EimUk8v3nDajtVn2euRiNrze2SZzQGuCuXwF8JHCd
         aTIvzt75MQR72ekdMwX1z2UKABtghABhbqMu0SXR4MICAotB991dBdNujtGnz3EK+QIN
         heO9BJwTSOvf3u1cCB73+hJbvKgq2yEZSOiKzmLsbPPx0hb85J5s/DlwgQZN2OaqaylF
         O3ug45MrBEhdg+FIXEwkci7DIXo7OY+m44QVbyscroggyrQQVtf4HyleJTskCDw2SrfK
         lbUw==
X-Forwarded-Encrypted: i=1; AKwUvBy+Nj9l/83/JYTvWyjqp60z026oAxv5n/WTiAIWWE9N6T/qjOTiPkzdDgrmFZyH0sqv1waDqd121vmHVeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqeOMdqoyRj0GkAqFWuO0nOgvOfBG45tMpuJDtjcbGCLHJZFFe
	4wm766qoZl9ldJ7nEho4wwQkl5JA/O/SC45b+gdAErYYhEXgK2HsHSxJ
X-Gm-Gg: AYBFou2LkgmUQ56Y1t4Y8xmnasW4yvOmo2gxVW1s4SU0borkhCEQoABCp/JSy9jOB5j
	DBga9jsYZySmzj7dNJFtCDWV93K8xrJAyInyIfokJSu7OjU9WrK+tO+vAZ6m4nvdSxx623rjmn8
	9cH75A2xTvkF4XhGxGruBoBQ/TEkNUkr5M3LWdVmMdujEtdAhsG6AsKErDwvmIoJLGYqx7Lh+C+
	cRcNMd3hMqMBOey2rrLhFhZ6T3Td7qwrTAL4DX+j2PpqkWOtYo9m4af4jkY/Cmu1NDkqyXht2f1
	KrpAkWYV1H0guJYWrCSDL51BGCNZg5GpXDESClMcaxHPMrxlOLghRp4IKTeGdjpu8BOwlqNiPnJ
	MwMAJtZ4QfIn3T6g8xUkZpy8lKCmfgTdaqV/jia8adHbS5PDbjEt7HpEPlr15MmxElGv3omPWL9
	rkmieGTc6ZeBeXXjNMzfGS6vZZJMQ4TofnqQj0t+65rS4KsyOHICCbe0r1vFG+7aOZXSB8SOg5g
	0cNuDgqsqulZ27ONkt3qpUDWSP8JTeo10Uq6UwrMnNx
X-Received: by 2002:a05:6000:27db:10b0:484:f26c:b9f3 with SMTP id ffacd0b85a97d-484f26cbc06mr7426061f8f.28.1788360855325;
        Wed, 02 Sep 2026 07:54:15 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:14 -0700 (PDT)
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
Subject: [PATCH v7 14/16] media: atomisp: Use struct v4l2_area for padding
Date: Wed,  2 Sep 2026 16:53:43 +0200
Message-ID: <a27087cb5fcc03bff4b3aac2b8d271b98049ddb9.1788360629.git.mauriziocasciano7@gmail.com>
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

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This makes the dimensions explicit and simplifies all three callers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 68 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 15 ++--
 .../media/atomisp/pci/atomisp_subdev.c        |  4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +-
 5 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..759effdb2e8d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3562,9 +3562,9 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
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
@@ -3574,22 +3574,23 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
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
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1, pad_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3617,8 +3618,18 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
+}
+
+static inline void
+atomisp_get_pix_padding(struct atomisp_device *isp,
+			struct v4l2_pix_format *f,
+			struct v4l2_area *pad)
+{
+	struct v4l2_area size = { .width = f->width, .height = f->height };
+
+	atomisp_get_padding(isp, size, pad);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3800,7 +3811,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,10 +3838,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
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
 
@@ -3847,8 +3858,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4268,11 +4279,12 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
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
@@ -4365,13 +4377,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
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
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574e77..8a84e774f4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -225,9 +225,9 @@ int atomisp_makeup_css_parameters(struct atomisp_sub_device *asd,
 int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h);
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad);
 
 /* Set sensor power (no-op if already on/off) */
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..87c29a940f9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -457,7 +457,7 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      const struct v4l2_rect *native,
 					      int *valid_sizes)
 {
-	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+	static const struct v4l2_area frame_sizes[] = {
 		{ 1920, 1440 },
 		{ 1920, 1200 },
 		{ 1920, 1080 },
@@ -470,15 +470,15 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
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
@@ -491,7 +491,8 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 
 		if (*valid_sizes == fsize->index) {
 			fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-			fsize->discrete = frame_sizes[i];
+			fsize->discrete.width = frame_sizes[i].width;
+			fsize->discrete.height = frame_sizes[i].height;
 			return 0;
 		}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..ad97e4691d9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -326,8 +326,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
-			crop[pad]->width -= isp_sd->sink_pad_padding_w;
-			crop[pad]->height -= isp_sd->sink_pad_padding_h;
+			crop[pad]->width -= isp_sd->sink_pad_padding.width;
+			crop[pad]->height -= isp_sd->sink_pad_padding.height;
 		}
 
 		if (isp_sd->params.video_dis_en &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
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

