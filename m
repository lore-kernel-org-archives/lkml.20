Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A93EC2E6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872686; cv=none; b=jigc4x2RXjHC7uJwfYLma7NxGXspSX+UUvLV50ygzGO469znuF6ggcn+xBw/v95x2LPiCOhoaKKqnojojQM5rNCeSQY8RyZvcruhq0GaJQeCzFf9YeBmPckFhOs5WZFBo8FI87mDY4TZ5uL+Km9vyytd5C1HFmvdXRs9GkSL3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872686; c=relaxed/simple;
	bh=/jOhce2BN6VpAXwoiqB7U1OURXwM6bRy+qBptBCallw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXW86tyc/PMDzDc//qHEukNksUq9zajq5RurFBI8Op6H6rJc2VaBpj6R6W1xuQ0brAyjO9jEiIyHsoDL50572sFWkdnmGUZtHUxKz6/k/Y8J3fV5CD1BMAaojLrsQlkRT+JgluoJRcCxbu57AV4wW5FPBiaDMb28I7IaIV+vLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bweb6dzp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bweb6dzp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso78415f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872682; x=1788477482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHPz8eBJKsS4HfZNihKxORDaEopiSH7AswobSRa+vUI=;
        b=bweb6dzpD7bxiS325bW4f+mIeSSvo0aUiEax8Cy6L1iwrFa+NNOYNmLwwmSY4XxKtl
         qrGwBT823I9mz/KiJU6JDykhsvzG4qBsd594zhqJBXLhCQpk6o1uQKKZrsZcwQCAKalU
         0UbxMA6hBG4elkXTDq9ObSIyMos7k/nRRr+qyspB5KWmS3Xf262kCmxxgkmt4SjkUGL3
         j1SEeJYiQ952c/alVWgV9g7xe0iAxl0anovy/mxhCvAHOfGXfq7mdb8TRJbMJxBCn7fw
         V2DhtnpEHK3AM6Yqtn04wTu0bL+rMzSE6Djo1TxuAinMsUifVcY87zCJkZV4aFJmMHSY
         rNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872682; x=1788477482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHPz8eBJKsS4HfZNihKxORDaEopiSH7AswobSRa+vUI=;
        b=rMV7UOJ4n0ULGfacmW1c7bIhMC8Jsh8bX5/10KfcoYlKCuXGQRib9DCGPR1GumY9L3
         SxboSoacm7q6+yqLwmW8a3ePUAmHYUwdvtKkZ/QUxpz8hnsZyQaF7/SekSqSSsfdod9l
         TVpyoBRz+GODb1YysvUXB4SW7N9A49541HGpDu7v5TABQeRNrU/APKbJADkvLVTnD0i9
         Ft7gyALmU2nrfooeqAN48e4jhY9DYomYwTChMS4VqzP3H+R4I8Bk8Lkt2XrNtlTE8qCR
         GT17f5KiyVSeYjVwLVAgZicpMx7xtyXbGzKH0EVLkLRBceLfaXHOYo81U9c2KCx+naqu
         Oggw==
X-Forwarded-Encrypted: i=1; AHgh+RrjdrMPR0glaxl5WiNVrSFIB8c//o+Zt3wfRuakiOpuiTt7AuIQPYjPAy2pPSbDa/J3YZKT1ieHIgSpyo0=@vger.kernel.org
X-Gm-Message-State: AFuF++kXy+qnJjvrj8AfUyWuZoAw6ajI2/5dej8t4yu4qxdgzmb/Ww8i
	FK2ock0jFefHDku+QG+jW7ajdPm2DHxLVCs44szJWHI/KP7MaJA4LbCf
X-Gm-Gg: AR+sD10vzkBdAUgL/DZGoXAmpCAxrxBxC/pWWr5poo8CtGaWRz/Ml4cq0R0u9IFKtgv
	Tp+gHfc5YIiNqC1HpaI/XgeaFU4Kq+CY+rlmT/1P+PRZgkod2qNWrlMEP00YFRj+tjTsfslM+aa
	5tdTHxIfsA4yyILK1rriio3dF2hk6lHN9+deFAkFtmHR5+7Z6OmxM7R7taQhmdeDWmn1V/hP2Dd
	IMzA16tE4rbFOFE/SZQCDxVvRH0VUQjIoOaAXdx8Nm4aNvuUF9hRtv7iqseiYhgkJOfhbm5QI+L
	Af82FXz4YqzGISxWw1w8I5/6Oh79a7fyPlAVehrkBc1odbexEoj41rrwh+fDyyFwhPu+rNqSjhp
	q2WCPoku8rF865sZlZ7FuwnJzPMij6PPyLXN+BDsost7MW9HL0qG8qMJDIS8kv9xzjdrYAfA8s9
	eciK0CClKjaFidcKPslVsrKMULLCr7/JHIjMnYaYWF0/VCWNp14EfQd8WXr7KHDaZ3V0LJ+WjwL
	AKBCo9mWBbifD7c099398NgkkXb2EpOtLvWECz5QqCe
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49b91c486c3mr28282985e9.14.1787872681917;
        Thu, 27 Aug 2026 16:18:01 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:01 -0700 (PDT)
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
Subject: [PATCH v3 10/12] media: atomisp: Use struct v4l2_area for padding
Date: Fri, 28 Aug 2026 01:17:28 +0200
Message-ID: <2202cbcaf51189b3886c2b2d92b320eb261a4e85.1787872237.git.mauriziocasciano7@gmail.com>
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

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This also simplifies all three callers before extending the helper with
sensor-specific padding.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 51 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 14 +++--
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..51dd59d98b3b 100644
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
@@ -3617,8 +3618,8 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3800,7 +3801,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,10 +3829,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	size.width = f->width;
+	size.height = f->height;
+	atomisp_get_padding(isp, size, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
@@ -3847,8 +3851,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4334,6 +4338,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
 	struct v4l2_rect isp_sink_crop;
@@ -4366,8 +4372,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
 	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
+		size.width = f->fmt.pix.width;
+		size.height = f->fmt.pix.height;
+		atomisp_get_padding(isp, size, &padding);
+		asd->sink_pad_padding_w = padding.width;
+		asd->sink_pad_padding_h = padding.height;
 	} else {
 		asd->sink_pad_padding_w = 0;
 		asd->sink_pad_padding_h = 0;
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
index 50366bf10f32..43bca68d1e6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -470,15 +470,19 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area size = {
+			.width = frame_sizes[i].width,
+			.height = frame_sizes[i].height,
+		};
+		struct v4l2_area padding;
 
-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, size, &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;
 
 		/*
-- 
2.53.0

