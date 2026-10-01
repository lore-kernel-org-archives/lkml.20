Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1B33EBF1A;
	Thu,  1 Oct 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844792; cv=none; b=RQtTSryjE0iRvkWFbrVX2aqCgVQoyrdCerKTjmlUkII1GQnd6frAurKDOii1BTteDfvoSXLJ746rWy25HJCu26YPQcTV0ujGMJMezkbBXXYeRrr6g69rUnLUbNELkdGIVMsXx0sQ2bLlMNQ1a61G7sD9COfTbrUnAUyebQVi8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844792; c=relaxed/simple;
	bh=AdLZNKnIsHkb/105aNVcukDgsZ7MAIvTyFATmH8uFlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h8jQ6JvEht0Ott5/Gpy6UGrVbTgy+KIuwoYV156GVSvlszR5ghbtZaEeO2jawdZdZruJm1ZGDZgRTmat8GiP9BVtkQP50DZJlgYXdRE9vxEvXUEP0TGMOBYggE2wKM3U8uX9h2j5JgKEcJK/ZhFx14JCWB/XtLQU/LNAmr0drho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wWrOwVj7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wWrOwVj7"
Received: from pb-laptop.local (185.182.214.55.nat.pool.zt.hu [185.182.214.55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A28593;
	Thu,  1 Oct 2026 10:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790844675;
	bh=AdLZNKnIsHkb/105aNVcukDgsZ7MAIvTyFATmH8uFlY=;
	h=From:To:Cc:Subject:Date:From;
	b=wWrOwVj7gSwt6LolnDNVSbziRkOv1w4rF+4CeJXCiF7UzneIlIBXUeACtfJUILy0k
	 iB4I0TLRRhkA3lGyJNOVc9DG3zMRHLMYCJK82SxOgkOMS3qnVMAN2Y4jcyrB10WzlX
	 LBPVE+XDQsrBanXz0oUQwsUoUrJm+n3Q7oXf+hVk=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v2] media: rcar-vin: Implement VIDIOC_ENUM_FRMSIZES
Date: Thu,  1 Oct 2026 10:53:04 +0200
Message-ID: <20261001085304.85930-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently there is no way for applications to query the available frame
sizes, so implement `VIDIOC_ENUM_FRMSIZES` based on what is allowed in
`rvin_format_align()`.

Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
changes in v2:
  * drop ` from title

v1: https://lore.kernel.org/linux-media/20260929133720.344955-1-barnabas.pocze+renesas@ideasonboard.com/
---
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 70 ++++++++++++++-----
 1 file changed, 51 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 9d45e11898c13..4961d28f42c78 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -19,6 +19,8 @@
 #include "rcar-vin.h"
 
 #define RVIN_DEFAULT_FORMAT	V4L2_PIX_FMT_YUYV
+#define RVIN_MIN_WIDTH		5
+#define RVIN_MIN_HEIGHT		2
 #define RVIN_DEFAULT_WIDTH	800
 #define RVIN_DEFAULT_HEIGHT	600
 #define RVIN_DEFAULT_FIELD	V4L2_FIELD_NONE
@@ -187,6 +189,24 @@ static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
 	}
 }
 
+static u32 rvin_format_width_alignment(u32 pixelformat)
+{
+	/* Hardware limits width alignment based on format. */
+	switch (pixelformat) {
+	/* Multiple of 32 (2^5) for NV12/16. */
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV16:
+		return 5;
+	/* Multiple of 2 (2^1) for YUV. */
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+		return 1;
+	/* No multiple for RGB. */
+	default:
+		return 0;
+	}
+}
+
 static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 {
 	u32 walign;
@@ -208,27 +228,12 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 		break;
 	}
 
-	/* Hardware limits width alignment based on format. */
-	switch (pix->pixelformat) {
-	/* Multiple of 32 (2^5) for NV12/16. */
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV16:
-		walign = 5;
-		break;
-	/* Multiple of 2 (2^1) for YUV. */
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_UYVY:
-		walign = 1;
-		break;
-	/* No multiple for RGB. */
-	default:
-		walign = 0;
-		break;
-	}
+	walign = rvin_format_width_alignment(pix->pixelformat);
 
 	/* Limit to VIN capabilities */
-	v4l_bound_align_image(&pix->width, 5, vin->info->max_width, walign,
-			      &pix->height, 2, vin->info->max_height, 0, 0);
+	v4l_bound_align_image(&pix->width, RVIN_MIN_WIDTH, vin->info->max_width, walign,
+			      &pix->height, RVIN_MIN_HEIGHT, vin->info->max_height, 0,
+			      0);
 
 	pix->bytesperline = rvin_format_bytesperline(vin, pix);
 	pix->sizeimage = rvin_format_sizeimage(pix);
@@ -343,6 +348,32 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	return -EINVAL;
 }
 
+static int rvin_enum_framesizes(struct file *file, void *priv,
+				struct v4l2_frmsizeenum *fsize)
+{
+	struct rvin_dev *vin = video_drvdata(file);
+	u32 wstep;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	if (!rvin_format_from_pixel(vin, fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+
+	wstep = 1u << rvin_format_width_alignment(fsize->pixel_format);
+	fsize->stepwise.min_width = round_up(RVIN_MIN_WIDTH, wstep);
+	fsize->stepwise.max_width = vin->info->max_width;
+	fsize->stepwise.step_width = wstep;
+
+	fsize->stepwise.min_height = RVIN_MIN_HEIGHT;
+	fsize->stepwise.max_height = vin->info->max_height;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 {
 	struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
@@ -564,6 +595,7 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap		= rvin_g_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes		= rvin_enum_framesizes,
 
 	.vidioc_g_selection		= rvin_g_selection,
 	.vidioc_s_selection		= rvin_s_selection,
-- 
2.55.0

