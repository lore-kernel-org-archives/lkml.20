Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914384A688D;
	Thu,  1 Oct 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844698; cv=none; b=or4I1q110NZFngBJMjIMulGoSiImCEd4nzggPMS2OVu6fPbfoNxu9t8l5hS4a4X4STp2P1YZnKzzPo41mgeb8DqNTqc33xxhKIcS33hl4Gvj4WZBwHqMXB4PyAjVbY+AvzsX1Gzo9WQ2ThVlG6FvclxAu1BdN85JGQg071hCIBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844698; c=relaxed/simple;
	bh=Gf/erM2X4bMMBKjxD99nHhhCql2UqvHfnorRhXFDxRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hH/iD488fkG1ZbV1wu6DGAbu7Nu/3QbLKBtWEYtiwRt7qDZvoAe/2yytrerL1z9F+uiARN07QelS0fpwY1FYqeYOqcmwBSySOObz2nokcc09Lnz8BD6l/jo4mQXPzv0dcJqiF5beWSq/O8fLRla5oCq9wuKA4mf5tn865sRq/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QkAvxNnS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QkAvxNnS"
Received: from pb-laptop.local (185.182.214.55.nat.pool.zt.hu [185.182.214.55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EDE0593;
	Thu,  1 Oct 2026 10:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790844581;
	bh=Gf/erM2X4bMMBKjxD99nHhhCql2UqvHfnorRhXFDxRA=;
	h=From:To:Cc:Subject:Date:From;
	b=QkAvxNnSGg+8btw1IXCMEClUjdOCGdoeqGW+MhpDZXUfFl9gR8TJea23BI3D3rmBx
	 j4czvOO5AFhK2vAyMXKrFX0k5jyyGM+EIoW83wBzimpE4Xmx0JQ80c3RClYTJgTUzx
	 GO159Rpo5chsPYUDFDlbUf4bfX9/5GiG6lDQHcc0=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [PATCH v2] media: rcar-isp: ispcore: Fix inconsistent step sizes
Date: Thu,  1 Oct 2026 10:51:30 +0200
Message-ID: <20261001085130.84565-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`risp_io_{input,capture}_enum_framesizes()` sets the horizontal and vertical
step size to 2. However, `risp_io_{input,capture}_try_format()` passes 2
to `v4l_bound_align_image()`, which corresponds to a step size of 2^2 = 4.

So move these constants into macros to avoid the repetition, and with that,
use 4 as the step size everywhere.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
changes in v2:
  * fix typo

v1: https://lore.kernel.org/linux-media/20260929133020.342677-2-barnabas.pocze+renesas@ideasonboard.com
---
 .../media/platform/renesas/rcar-isp/core-io.c | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index 820af506f896c..b60b91f43d42d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -15,6 +15,12 @@
 
 #include "risp-core.h"
 
+#define RISP_MIN_WIDTH 128
+#define RISP_MAX_WIDTH 5120
+#define RISP_MIN_HEIGHT 128
+#define RISP_MAX_HEIGHT 4096
+#define RISP_SIZE_ALIGNMENT 2 /* 2^2 = 4 */
+
 #define risp_io_err(d, fmt, arg...)         dev_err((d)->core->dev, fmt, ##arg)
 
 static struct risp_buffer *risp_io_vb2buf(struct vb2_v4l2_buffer *vb)
@@ -330,8 +336,9 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
 {
 	unsigned int bpp = 0;
 
-	v4l_bound_align_image(&pix->width, 128, 5120, 2,
-			      &pix->height, 128, 4096, 2, 0);
+	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
+			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
+			      0);
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
 		if (risp_io_input_formats[i].fourcc == pix->pixelformat) {
@@ -423,13 +430,13 @@ static int risp_io_input_enum_framesizes(struct file *file, void *fh,
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 
-	fsize->stepwise.min_width = 128;
-	fsize->stepwise.max_width = 5120;
-	fsize->stepwise.step_width = 2;
+	fsize->stepwise.min_width = RISP_MIN_WIDTH;
+	fsize->stepwise.max_width = RISP_MAX_WIDTH;
+	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
 
-	fsize->stepwise.min_height = 128;
-	fsize->stepwise.max_height = 4096;
-	fsize->stepwise.step_height = 2;
+	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
+	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
+	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
 
 	return 0;
 }
@@ -720,8 +727,9 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
 static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 				       struct v4l2_pix_format_mplane *pix)
 {
-	v4l_bound_align_image(&pix->width, 128, 5120, 2,
-			      &pix->height, 128, 4096, 2, 0);
+	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
+			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
+			      0);
 
 	pix->field = V4L2_FIELD_NONE;
 	pix->colorspace = V4L2_COLORSPACE_SRGB;
@@ -824,13 +832,13 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 
-	fsize->stepwise.min_width = 128;
-	fsize->stepwise.max_width = 5120;
-	fsize->stepwise.step_width = 2;
+	fsize->stepwise.min_width = RISP_MIN_WIDTH;
+	fsize->stepwise.max_width = RISP_MAX_WIDTH;
+	fsize->stepwise.step_width = 1u << RISP_SIZE_ALIGNMENT;
 
-	fsize->stepwise.min_height = 128;
-	fsize->stepwise.max_height = 4096;
-	fsize->stepwise.step_height = 2;
+	fsize->stepwise.min_height = RISP_MIN_HEIGHT;
+	fsize->stepwise.max_height = RISP_MAX_HEIGHT;
+	fsize->stepwise.step_height = 1u << RISP_SIZE_ALIGNMENT;
 
 	return 0;
 }
-- 
2.55.0

