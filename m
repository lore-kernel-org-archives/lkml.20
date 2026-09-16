Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B5519928;
	Wed, 16 Sep 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568740; cv=none; b=dlAtwUDTLu7X8AWJif4I0wacCu1iciyYQSoAx4Z0DD4/wAzhlyR6NK0GaHL+WmJ6dYXCXxNAmosRkk962GPSTqVg1rt3bQ975M4pVAIL920yoTfjrj4Jg6JfXl39ui/ClHoms/YUnSUYjU0MSAGFtldqkXxDdzl7GWjnPecvnuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568740; c=relaxed/simple;
	bh=XNxacR9rRNpYWb2+YGNWFMZ9uT1v868SDz6zTGPQgD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGM7BFqWsnNwJ2Sv9xyAwjxvkwahFL6Twqa/E3Lpn0C4t2+65C1Or02SWSPs6kFPizdKMlqYdOLEqIojoHiYPfgyR7/rreprv0jT3qoAqDDejXwT+5QIeXZJHRN/v7vOihso/ZLzZQtj9BGxPipU7V3AhalhX3njuInwdWU1y4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qMlPOTzo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qMlPOTzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568736;
	bh=XNxacR9rRNpYWb2+YGNWFMZ9uT1v868SDz6zTGPQgD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qMlPOTzoIx3WLYjPXmwJpQJBfmPvgAyOOlYZBcg0kMxDCVimSYl2ukIrNX/z0dnJw
	 Vy4QivtqsE29LaeIAfyOqC+DXYaI6nBnjEdMzenWCu/kO7w8P5t69MBCWE0ieiN9s1
	 0K+Aa7P78rIMDVesrR6kosccywKMDBvmCLoOA8BzkM87ZNJE8RE1oAsYLfNled5QTY
	 QY4gicHCyBvc/yEKf5nRdWtl7cZ7c8THjZ8v1iTZMtMAVOYN8umL7B2akz6vNR2efj
	 MlCwGyA+4r82lnkHMeNe+K2svZ+UWKFKg1BPEL+cAii5csQwH7kPoJk9XnbpMBuGSZ
	 BIjWFGOS12dQg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B61C17E09B5;
	Wed, 16 Sep 2026 16:25:34 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:28 -0400
Subject: [PATCH 3/4] media: verisilicon: Switch to tracked dma allocations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-3-900fa45e3e6a@collabora.com>
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
 drivers/media/platform/verisilicon/hantro.h        |   1 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
 drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
 drivers/media/platform/verisilicon/hantro_hevc.c   | 100 +++++++------
 drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +--
 .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
 drivers/media/platform/verisilicon/hantro_vp8.c    |  25 ++--
 drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++--
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160 ++++++++++++---------
 9 files changed, 215 insertions(+), 146 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index d5cddc783688..acf5312d5ed4 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -24,6 +24,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-allocator.h>
 
 #include "hantro_hw.h"
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 32855b14e0f1..2b8aa2033d3f 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -232,6 +232,8 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->dev->vpu_mutex;
 	src_vq->dev = ctx->dev->v4l2_dev.dev;
+	src_vq->v4l2_dev = &ctx->dev->v4l2_dev;
+	src_vq->v4l2_fh = &ctx->fh;
 	src_vq->supports_requests = true;
 
 	ret = vb2_queue_init(src_vq);
@@ -258,6 +260,8 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->vpu_mutex;
 	dst_vq->dev = ctx->dev->v4l2_dev.dev;
+	dst_vq->v4l2_dev = &ctx->dev->v4l2_dev;
+	dst_vq->v4l2_fh = &ctx->fh;
 
 	return vb2_queue_init(dst_vq);
 }
diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..6b6afd74f8ae 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -498,7 +498,7 @@ void hantro_h264_dec_exit(struct hantro_ctx *ctx)
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 
-	dma_free_coherent(vpu->dev, priv->size, priv->cpu, priv->dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, priv->size, priv->cpu, priv->dma, 0);
 }
 
 int hantro_h264_dec_init(struct hantro_ctx *ctx)
@@ -508,8 +508,9 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 	struct hantro_h264_dec_priv_tbl *tbl;
 
-	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
-				       GFP_KERNEL);
+	priv->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+					 sizeof(*tbl), &priv->dma,
+					 GFP_KERNEL, 0, &ctx->fh, "h264-priv");
 	if (!priv->cpu)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index 83cd12b0ddd6..e73498285bf7 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "hantro.h"
 #include "hantro_hw.h"
@@ -89,46 +90,52 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 
 	/* Need to reallocate due to tiles passed via PPS */
 	if (hevc_dec->tile_filter.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_filter.size,
+				    hevc_dec->tile_filter.cpu,
+				    hevc_dec->tile_filter.dma, 0);
 		hevc_dec->tile_filter.cpu = NULL;
 	}
 
 	if (hevc_dec->tile_sao.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_sao.size,
+				    hevc_dec->tile_sao.cpu,
+				    hevc_dec->tile_sao.dma, 0);
 		hevc_dec->tile_sao.cpu = NULL;
 	}
 
 	if (hevc_dec->tile_bsd.cpu) {
-		dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
-				  hevc_dec->tile_bsd.cpu,
-				  hevc_dec->tile_bsd.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_bsd.size,
+				    hevc_dec->tile_bsd.cpu,
+				    hevc_dec->tile_bsd.dma, 0);
 		hevc_dec->tile_bsd.cpu = NULL;
 	}
 
 	size = (VERT_FILTER_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
-	hevc_dec->tile_filter.cpu = dma_alloc_coherent(vpu->dev, size,
-						       &hevc_dec->tile_filter.dma,
-						       GFP_KERNEL);
+	hevc_dec->tile_filter.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+							 &hevc_dec->tile_filter.dma,
+							 GFP_KERNEL,
+							 DMA_ATTR_NO_KERNEL_MAPPING,
+							 &ctx->fh, "hevc-tile-filter");
 	if (!hevc_dec->tile_filter.cpu)
 		return -ENOMEM;
 	hevc_dec->tile_filter.size = size;
 
 	size = (VERT_SAO_RAM_SIZE * height64 * (num_tile_cols - 1) * ctx->bit_depth) / 8;
-	hevc_dec->tile_sao.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_sao.dma,
-						    GFP_KERNEL);
+	hevc_dec->tile_sao.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+						      &hevc_dec->tile_sao.dma,
+						      GFP_KERNEL,
+						      DMA_ATTR_NO_KERNEL_MAPPING,
+						      &ctx->fh, "hevc-tile-sao");
 	if (!hevc_dec->tile_sao.cpu)
 		goto err_free_tile_buffers;
 	hevc_dec->tile_sao.size = size;
 
 	size = BSD_CTRL_RAM_SIZE * height64 * (num_tile_cols - 1);
-	hevc_dec->tile_bsd.cpu = dma_alloc_coherent(vpu->dev, size,
-						    &hevc_dec->tile_bsd.dma,
-						    GFP_KERNEL);
+	hevc_dec->tile_bsd.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+						      &hevc_dec->tile_bsd.dma,
+						      GFP_KERNEL,
+						      DMA_ATTR_NO_KERNEL_MAPPING,
+						      &ctx->fh, "hevc-tile-bsd");
 	if (!hevc_dec->tile_bsd.cpu)
 		goto err_free_sao_buffers;
 	hevc_dec->tile_bsd.size = size;
@@ -139,16 +146,16 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 
 err_free_sao_buffers:
 	if (hevc_dec->tile_sao.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_sao.size,
+				    hevc_dec->tile_sao.cpu,
+				    hevc_dec->tile_sao.dma, 0);
 	hevc_dec->tile_sao.cpu = NULL;
 
 err_free_tile_buffers:
 	if (hevc_dec->tile_filter.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_filter.size,
+				    hevc_dec->tile_filter.cpu,
+				    hevc_dec->tile_filter.dma, 0);
 	hevc_dec->tile_filter.cpu = NULL;
 
 	return -ENOMEM;
@@ -218,33 +225,33 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 
 	if (hevc_dec->tile_sizes.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sizes.size,
-				  hevc_dec->tile_sizes.cpu,
-				  hevc_dec->tile_sizes.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_sizes.size,
+				    hevc_dec->tile_sizes.cpu,
+				    hevc_dec->tile_sizes.dma, 0);
 	hevc_dec->tile_sizes.cpu = NULL;
 
 	if (hevc_dec->scaling_lists.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->scaling_lists.size,
-				  hevc_dec->scaling_lists.cpu,
-				  hevc_dec->scaling_lists.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->scaling_lists.size,
+				    hevc_dec->scaling_lists.cpu,
+				    hevc_dec->scaling_lists.dma, 0);
 	hevc_dec->scaling_lists.cpu = NULL;
 
 	if (hevc_dec->tile_filter.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_filter.size,
-				  hevc_dec->tile_filter.cpu,
-				  hevc_dec->tile_filter.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_filter.size,
+				    hevc_dec->tile_filter.cpu,
+				    hevc_dec->tile_filter.dma, 0);
 	hevc_dec->tile_filter.cpu = NULL;
 
 	if (hevc_dec->tile_sao.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_sao.size,
-				  hevc_dec->tile_sao.cpu,
-				  hevc_dec->tile_sao.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_sao.size,
+				    hevc_dec->tile_sao.cpu,
+				    hevc_dec->tile_sao.dma, 0);
 	hevc_dec->tile_sao.cpu = NULL;
 
 	if (hevc_dec->tile_bsd.cpu)
-		dma_free_coherent(vpu->dev, hevc_dec->tile_bsd.size,
-				  hevc_dec->tile_bsd.cpu,
-				  hevc_dec->tile_bsd.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, hevc_dec->tile_bsd.size,
+				    hevc_dec->tile_bsd.cpu,
+				    hevc_dec->tile_bsd.dma, 0);
 	hevc_dec->tile_bsd.cpu = NULL;
 }
 
@@ -262,17 +269,20 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx)
 	 * chunk (HW guys wanted to have this).
 	 */
 	size = round_up(MAX_TILE_COLS * MAX_TILE_ROWS * 4 * sizeof(u16) + 16, 16);
-	hevc_dec->tile_sizes.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &hevc_dec->tile_sizes.dma,
-						      GFP_KERNEL);
+	hevc_dec->tile_sizes.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+							&hevc_dec->tile_sizes.dma,
+							GFP_KERNEL, 0,
+							&ctx->fh, "hevc-tile-sizes");
 	if (!hevc_dec->tile_sizes.cpu)
 		return -ENOMEM;
 
 	hevc_dec->tile_sizes.size = size;
 
-	hevc_dec->scaling_lists.cpu = dma_alloc_coherent(vpu->dev, SCALING_LIST_SIZE,
-							 &hevc_dec->scaling_lists.dma,
-							 GFP_KERNEL);
+	hevc_dec->scaling_lists.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+							   SCALING_LIST_SIZE,
+							   &hevc_dec->scaling_lists.dma,
+							   GFP_KERNEL, 0,
+							   &ctx->fh, "hevc-scaling-lists");
 	if (!hevc_dec->scaling_lists.cpu)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
index 04e545eb0a83..edb29204b9c2 100644
--- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
@@ -41,10 +41,10 @@ int hantro_mpeg2_dec_init(struct hantro_ctx *ctx)
 
 	ctx->mpeg2_dec.qtable.size = ARRAY_SIZE(zigzag) * 4;
 	ctx->mpeg2_dec.qtable.cpu =
-		dma_alloc_coherent(vpu->dev,
-				   ctx->mpeg2_dec.qtable.size,
-				   &ctx->mpeg2_dec.qtable.dma,
-				   GFP_KERNEL);
+		v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+				     ctx->mpeg2_dec.qtable.size,
+				     &ctx->mpeg2_dec.qtable.dma,
+				     GFP_KERNEL, 0, &ctx->fh, "mpeg2-qtable");
 	if (!ctx->mpeg2_dec.qtable.cpu)
 		return -ENOMEM;
 	return 0;
@@ -54,8 +54,8 @@ void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 
-	dma_free_coherent(vpu->dev,
-			  ctx->mpeg2_dec.qtable.size,
-			  ctx->mpeg2_dec.qtable.cpu,
-			  ctx->mpeg2_dec.qtable.dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    ctx->mpeg2_dec.qtable.size,
+			    ctx->mpeg2_dec.qtable.cpu,
+			    ctx->mpeg2_dec.qtable.dma, 0);
 }
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e94d1ba5ef10..030db07f96e3 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -189,8 +189,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
 
 		if (priv->cpu) {
-			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-				       priv->dma, priv->attrs);
+			v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, priv->size, priv->cpu,
+					    priv->dma, priv->attrs);
 			priv->cpu = NULL;
 		}
 	}
@@ -226,6 +226,7 @@ static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
 	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+	char name[32];
 
 	if (!buf_size)
 		return -EINVAL;
@@ -235,8 +236,9 @@ static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 	 * buffers for the decoder, so no mapping is needed.
 	 */
 	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
-				    GFP_KERNEL, priv->attrs);
+	snprintf(name, sizeof(name), "postproc-dec-%d", index);
+	priv->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, buf_size, &priv->dma,
+					 GFP_KERNEL, priv->attrs, &ctx->fh, name);
 	if (!priv->cpu)
 		return -ENOMEM;
 	priv->size = buf_size;
@@ -273,8 +275,8 @@ hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
 
 	if (priv->size < buf_size && priv->cpu) {
 		/* buffer is too small, release it */
-		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-			       priv->dma, priv->attrs);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, priv->size, priv->cpu,
+				    priv->dma, priv->attrs);
 		priv->cpu = NULL;
 	}
 
diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
index 381bc1d3bfda..c94b1692adbb 100644
--- a/drivers/media/platform/verisilicon/hantro_vp8.c
+++ b/drivers/media/platform/verisilicon/hantro_vp8.c
@@ -161,8 +161,9 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	 */
 	aux_buf = &ctx->vp8_dec.segment_map;
 	aux_buf->size = segment_map_size;
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
+	aux_buf->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+					    aux_buf->size, &aux_buf->dma,
+					    GFP_KERNEL, 0, &ctx->fh, "vp8-segment-map");
 	if (!aux_buf->cpu)
 		return -ENOMEM;
 
@@ -172,8 +173,9 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	 */
 	aux_buf = &ctx->vp8_dec.prob_tbl;
 	aux_buf->size = sizeof(struct vp8_prob_tbl_packed);
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
+	aux_buf->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+					    aux_buf->size, &aux_buf->dma,
+					    GFP_KERNEL, 0, &ctx->fh, "vp8-prob-tbl");
 	if (!aux_buf->cpu) {
 		ret = -ENOMEM;
 		goto err_free_seg_map;
@@ -182,9 +184,10 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	return 0;
 
 err_free_seg_map:
-	dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
-			  ctx->vp8_dec.segment_map.cpu,
-			  ctx->vp8_dec.segment_map.dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    ctx->vp8_dec.segment_map.size,
+			    ctx->vp8_dec.segment_map.cpu,
+			    ctx->vp8_dec.segment_map.dma, 0);
 
 	return ret;
 }
@@ -194,8 +197,8 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
 	struct hantro_vp8_dec_hw_ctx *vp8_dec = &ctx->vp8_dec;
 	struct hantro_dev *vpu = ctx->dev;
 
-	dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
-			  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
-	dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
-			  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, vp8_dec->segment_map.size,
+			    vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma, 0);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev, vp8_dec->prob_tbl.size,
+			    vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma, 0);
 }
diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
index 566cd376c097..3933a835cc57 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.c
+++ b/drivers/media/platform/verisilicon/hantro_vp9.c
@@ -182,7 +182,10 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	vp9_dec->bsd_ctrl_offset = size;
 	size += hantro_vp9_bsd_control_size(max_height);
 
-	tile_edge->cpu = dma_alloc_coherent(vpu->dev, size, &tile_edge->dma, GFP_KERNEL);
+	tile_edge->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+					      size, &tile_edge->dma,
+					      GFP_KERNEL, 0, &ctx->fh,
+					      "vp9-tile-edge");
 	if (!tile_edge->cpu)
 		return -ENOMEM;
 
@@ -193,7 +196,10 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	vp9_dec->segment_map_size = size;
 	size *= 2; /* we need two areas of this size, used alternately */
 
-	segment_map->cpu = dma_alloc_coherent(vpu->dev, size, &segment_map->dma, GFP_KERNEL);
+	segment_map->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+						size, &segment_map->dma,
+						GFP_KERNEL, 0, &ctx->fh,
+						"vp9-segment-map");
 	if (!segment_map->cpu)
 		goto err_segment_map;
 
@@ -206,7 +212,10 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	vp9_dec->tile_info_offset = size;
 	size += hantro_vp9_tile_info_size();
 
-	misc->cpu = dma_alloc_coherent(vpu->dev, size, &misc->dma, GFP_KERNEL);
+	misc->cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+					 size, &misc->dma,
+					 GFP_KERNEL, 0, &ctx->fh,
+					 "vp9-misc");
 	if (!misc->cpu)
 		goto err_misc;
 
@@ -218,10 +227,14 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	return 0;
 
 err_misc:
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    segment_map->size, segment_map->cpu,
+			    segment_map->dma, 0);
 
 err_segment_map:
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    tile_edge->size, tile_edge->cpu,
+			    tile_edge->dma, 0);
 
 	return -ENOMEM;
 }
@@ -234,7 +247,12 @@ void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
 	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
 	struct hantro_aux_buf *misc = &vp9_dec->misc;
 
-	dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    misc->size, misc->cpu, misc->dma, 0);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    segment_map->size, segment_map->cpu,
+			    segment_map->dma, 0);
+	v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+			    tile_edge->size, tile_edge->cpu,
+			    tile_edge->dma, 0);
 }
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad37323..f48e8dbfc880 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -232,30 +232,38 @@ static void rockchip_vpu981_av1_dec_tiles_free(struct hantro_ctx *ctx)
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
 	if (av1_dec->db_data_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
-				  av1_dec->db_data_col.cpu,
-				  av1_dec->db_data_col.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->db_data_col.size,
+				    av1_dec->db_data_col.cpu,
+				    av1_dec->db_data_col.dma, 0);
 	av1_dec->db_data_col.cpu = NULL;
 
 	if (av1_dec->db_ctrl_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
-				  av1_dec->db_ctrl_col.cpu,
-				  av1_dec->db_ctrl_col.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->db_ctrl_col.size,
+				    av1_dec->db_ctrl_col.cpu,
+				    av1_dec->db_ctrl_col.dma, 0);
 	av1_dec->db_ctrl_col.cpu = NULL;
 
 	if (av1_dec->cdef_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
-				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->cdef_col.size,
+				    av1_dec->cdef_col.cpu,
+				    av1_dec->cdef_col.dma, 0);
 	av1_dec->cdef_col.cpu = NULL;
 
 	if (av1_dec->sr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
-				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->sr_col.size,
+				    av1_dec->sr_col.cpu,
+				    av1_dec->sr_col.dma, 0);
 	av1_dec->sr_col.cpu = NULL;
 
 	if (av1_dec->lr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
-				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->lr_col.size,
+				    av1_dec->lr_col.cpu,
+				    av1_dec->lr_col.dma, 0);
 	av1_dec->lr_col.cpu = NULL;
 }
 
@@ -278,41 +286,46 @@ static int rockchip_vpu981_av1_dec_tiles_reallocate(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_tiles_free(ctx);
 
 	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_data_col.dma,
-						      GFP_KERNEL);
+	av1_dec->db_data_col.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+							&av1_dec->db_data_col.dma,
+							GFP_KERNEL, 0, &ctx->fh,
+							"av1-db-data-col");
 	if (!av1_dec->db_data_col.cpu)
 		goto buffer_allocation_error;
 	av1_dec->db_data_col.size = size;
 
 	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
-	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_ctrl_col.dma,
-						      GFP_KERNEL);
+	av1_dec->db_ctrl_col.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+							&av1_dec->db_ctrl_col.dma,
+							GFP_KERNEL, 0, &ctx->fh,
+							"av1-db-ctrl-col");
 	if (!av1_dec->db_ctrl_col.cpu)
 		goto buffer_allocation_error;
 	av1_dec->db_ctrl_col.size = size;
 
 	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
-	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						   &av1_dec->cdef_col.dma,
-						   GFP_KERNEL);
+	av1_dec->cdef_col.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+						     &av1_dec->cdef_col.dma,
+						     GFP_KERNEL, 0, &ctx->fh,
+						     "av1-cdef-col");
 	if (!av1_dec->cdef_col.cpu)
 		goto buffer_allocation_error;
 	av1_dec->cdef_col.size = size;
 
 	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
-	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->sr_col.dma,
-						 GFP_KERNEL);
+	av1_dec->sr_col.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+						   &av1_dec->sr_col.dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   "av1-sr-col");
 	if (!av1_dec->sr_col.cpu)
 		goto buffer_allocation_error;
 	av1_dec->sr_col.size = size;
 
 	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->lr_col.dma,
-						 GFP_KERNEL);
+	av1_dec->lr_col.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev, size,
+						   &av1_dec->lr_col.dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   "av1-lr-col");
 	if (!av1_dec->lr_col.cpu)
 		goto buffer_allocation_error;
 	av1_dec->lr_col.size = size;
@@ -331,37 +344,45 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
 	if (av1_dec->global_model.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
-				  av1_dec->global_model.cpu,
-				  av1_dec->global_model.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->global_model.size,
+				    av1_dec->global_model.cpu,
+				    av1_dec->global_model.dma, 0);
 	av1_dec->global_model.cpu = NULL;
 
 	if (av1_dec->tile_info.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
-				  av1_dec->tile_info.cpu,
-				  av1_dec->tile_info.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->tile_info.size,
+				    av1_dec->tile_info.cpu,
+				    av1_dec->tile_info.dma, 0);
 	av1_dec->tile_info.cpu = NULL;
 
 	if (av1_dec->film_grain.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
-				  av1_dec->film_grain.cpu,
-				  av1_dec->film_grain.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->film_grain.size,
+				    av1_dec->film_grain.cpu,
+				    av1_dec->film_grain.dma, 0);
 	av1_dec->film_grain.cpu = NULL;
 
 	if (av1_dec->prob_tbl.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
-				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->prob_tbl.size,
+				    av1_dec->prob_tbl.cpu,
+				    av1_dec->prob_tbl.dma, 0);
 	av1_dec->prob_tbl.cpu = NULL;
 
 	if (av1_dec->prob_tbl_out.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
-				  av1_dec->prob_tbl_out.cpu,
-				  av1_dec->prob_tbl_out.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->prob_tbl_out.size,
+				    av1_dec->prob_tbl_out.cpu,
+				    av1_dec->prob_tbl_out.dma, 0);
 	av1_dec->prob_tbl_out.cpu = NULL;
 
 	if (av1_dec->tile_buf.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
-				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
+		v4l2_dma_free_attrs(&vpu->v4l2_dev, vpu->dev,
+				    av1_dec->tile_buf.size,
+				    av1_dec->tile_buf.cpu,
+				    av1_dec->tile_buf.dma, 0);
 	av1_dec->tile_buf.cpu = NULL;
 
 	rockchip_vpu981_av1_dec_tiles_free(ctx);
@@ -374,40 +395,48 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 
 	memset(av1_dec, 0, sizeof(*av1_dec));
 
-	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
-						       &av1_dec->global_model.dma,
-						       GFP_KERNEL);
+	av1_dec->global_model.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+							 GLOBAL_MODEL_SIZE,
+							 &av1_dec->global_model.dma,
+							 GFP_KERNEL, 0, &ctx->fh,
+							 "av1-global-model");
 	if (!av1_dec->global_model.cpu)
 		return -ENOMEM;
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
-						    &av1_dec->tile_info.dma,
-						    GFP_KERNEL);
+	av1_dec->tile_info.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+						      AV1_TILE_INFO_SIZE,
+						      &av1_dec->tile_info.dma,
+						      GFP_KERNEL, 0, &ctx->fh,
+						      "av1-tile-info");
 	if (!av1_dec->tile_info.cpu)
 		return -ENOMEM;
 	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
-	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
-						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
-						     &av1_dec->film_grain.dma,
-						     GFP_KERNEL);
+	av1_dec->film_grain.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+						       ALIGN(sizeof(struct rockchip_av1_film_grain),
+							     2048),
+						       &av1_dec->film_grain.dma,
+						       GFP_KERNEL, 0, &ctx->fh,
+						       "av1-film-grain");
 	if (!av1_dec->film_grain.cpu)
 		return -ENOMEM;
 	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
 
-	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
-						   ALIGN(sizeof(struct av1cdfs), 2048),
-						   &av1_dec->prob_tbl.dma,
-						   GFP_KERNEL);
+	av1_dec->prob_tbl.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+						     ALIGN(sizeof(struct av1cdfs), 2048),
+						     &av1_dec->prob_tbl.dma,
+						     GFP_KERNEL, 0, &ctx->fh,
+						     "av1-prob-tbl");
 	if (!av1_dec->prob_tbl.cpu)
 		return -ENOMEM;
 	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
 
-	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
-						       ALIGN(sizeof(struct av1cdfs), 2048),
-						       &av1_dec->prob_tbl_out.dma,
-						       GFP_KERNEL);
+	av1_dec->prob_tbl_out.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+							 ALIGN(sizeof(struct av1cdfs), 2048),
+							 &av1_dec->prob_tbl_out.dma,
+							 GFP_KERNEL, 0, &ctx->fh,
+							 "av1-prob-tbl-out");
 	if (!av1_dec->prob_tbl_out.cpu)
 		return -ENOMEM;
 	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
@@ -416,10 +445,11 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 
 	rockchip_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
 
-	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
-						   AV1_TILE_SIZE,
-						   &av1_dec->tile_buf.dma,
-						   GFP_KERNEL);
+	av1_dec->tile_buf.cpu = v4l2_dma_alloc_attrs(&vpu->v4l2_dev, vpu->dev,
+						     AV1_TILE_SIZE,
+						     &av1_dec->tile_buf.dma,
+						     GFP_KERNEL, 0, &ctx->fh,
+						     "av1-tile-buf");
 	if (!av1_dec->tile_buf.cpu)
 		return -ENOMEM;
 	av1_dec->tile_buf.size = AV1_TILE_SIZE;

-- 
2.55.0

