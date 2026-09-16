Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9851A74D;
	Wed, 16 Sep 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568741; cv=none; b=RvVuEY7jHp5U8A6TCQgXJRVxC6oChrHri6vMgHEC2IJ3XcF/a0yQVuYdqmGo7eGvnKkyKBhaFO2a/AqA4n7pXx2ZTDKuBnRvfeEc4uMfuaj3RItpeM/ARghMwqttESFlxBuflBhaCa3OCrjYpqLsCQC8qzgzbJtwNJV7Uo5IwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568741; c=relaxed/simple;
	bh=rffjsrzNUHUz6Ej9X9i0hw88J4ZQTjnnMh0u/4385Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=co+U6wgNfsJYnIQOypNONpDv2eqIb7kwaww8Zju3AZl49W/dc5afgPwlLIWcTzwXS9AnAFojSGAmDG0R4nh/uk4pucLjqcqVOpKZ0duPBRdnZ3zgf1dp8I9tzAX6xSByMzBYg0zBtoTFR9wspCkn7s2QQIjT8FGKIvbB5V+u9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zc1JPrSI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zc1JPrSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568737;
	bh=rffjsrzNUHUz6Ej9X9i0hw88J4ZQTjnnMh0u/4385Lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zc1JPrSIAsq6dDX/gzI9oesvM2y8DXXWwJuP7wtyHlNWx9ZgaD36hLyxTnwjIyXxB
	 4ETG3PUhCT/dCVuj2BC/r2T5p/1dYszIYaZVD/463hNatHRbYWbFHEUxltxVGvR4vt
	 znOY+99Ps/0GwHgzgYxGlBzs2haIEeb+TAuus/W5YPHYkglDM9fLfYuxjoR42FERq0
	 OznCfHETYE+04swM0DOiP9O4MMVZhyVNY/upSGko8605doIArdwK6j55iACfePjNty
	 cQ8ug7InZiFC/oiCHLF0hTVOUC7iaIb2+kH8AYxDeY9IbTCBTE4aQCQOLhAa8JIGmq
	 nCnoHI6c2Bc8Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F4F517E0070;
	Wed, 16 Sep 2026 16:25:36 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:29 -0400
Subject: [PATCH 4/4] media: rkvdec: Switch to tracked dma allocations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-4-900fa45e3e6a@collabora.com>
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Use the newly introduced v4l2_dma_alloc_attrs and v4l2_dma_free_attrs
functions to track all dma allocations and have them exposed to
userspace for easier debug.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 33 +++++++++++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 +++
 9 files changed, 100 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index d3202cecb988..5b5bc091e792 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -11,6 +11,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -379,8 +380,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -404,8 +408,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a..fef8bf6c7625 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -13,6 +13,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -532,8 +533,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"hevc-priv-tbl");
 	if (!priv_tbl) {
 		kfree(hevc_ctx);
 		return -ENOMEM;
@@ -553,8 +557,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f177379..1d43793720c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -13,6 +13,7 @@
 #include <linux/genalloc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <media/v4l2-allocator.h>
 
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
@@ -65,10 +66,10 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(dev->dev,
-					  rcb_size,
-					  cfg->rcb_bufs[i].cpu,
-					  cfg->rcb_bufs[i].dma);
+			v4l2_dma_free_attrs(&dev->v4l2_dev, dev->dev,
+					    rcb_size,
+					    cfg->rcb_bufs[i].cpu,
+					    cfg->rcb_bufs[i].dma, 0);
 			break;
 		}
 	}
@@ -150,10 +151,14 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(ctx->dev->dev,
-						 rcb_size,
-						 &dma,
-						 GFP_KERNEL);
+			char name[32];
+
+			snprintf(name, sizeof(name), "rcb-%d", i);
+			cpu = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, ctx->dev->dev,
+						   rcb_size,
+						   &dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   name);
 			alloc_type = RKVDEC_ALLOC_DMA;
 		}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..b0cb6963c8e0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -387,8 +388,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -412,8 +416,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a17551..c1e16ba6f80f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -555,8 +556,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -580,8 +584,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index fb4f849d7366..3c1d3ca7cb6f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include <linux/iopoll.h>
 
@@ -455,8 +456,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -481,8 +485,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 96d938ee70b0..b0ec46f482fa 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -563,8 +564,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -588,8 +592,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..9f41f6ca82d1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -20,6 +20,7 @@
 #include <linux/vmalloc.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-vp9.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -979,8 +980,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	ctx->priv = vp9_ctx;
 
 	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&vp9_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vp9-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -989,8 +993,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
 
-	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
-				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
+	count_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					 RKVDEC_VP9_COUNT_SIZE,
+					 &vp9_ctx->count_tbl.dma,
+					 GFP_KERNEL, 0, &ctx->fh,
+					 "vp9-count-tbl");
 	if (!count_tbl) {
 		ret = -ENOMEM;
 		goto err_free_priv_tbl;
@@ -1003,8 +1010,10 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	return 0;
 
 err_free_priv_tbl:
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 
 err_free_ctx:
 	kfree(vp9_ctx);
@@ -1016,10 +1025,14 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
-			  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->count_tbl.size,
+			    vp9_ctx->count_tbl.cpu,
+			    vp9_ctx->count_tbl.dma, 0);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 	kfree(vp9_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..8770fdb5c919 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1208,6 +1208,8 @@ static int rkvdec_queue_init(void *priv,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &rkvdec->vdev_lock;
 	src_vq->dev = rkvdec->v4l2_dev.dev;
+	src_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	src_vq->v4l2_fh = &ctx->fh;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
 
@@ -1227,6 +1229,8 @@ static int rkvdec_queue_init(void *priv,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &rkvdec->vdev_lock;
 	dst_vq->dev = rkvdec->v4l2_dev.dev;
+	dst_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	dst_vq->v4l2_fh = &ctx->fh;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.55.0

