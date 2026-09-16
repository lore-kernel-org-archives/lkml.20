Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99148D874;
	Wed, 16 Sep 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563297; cv=none; b=N+f1E56ybJj63ET5Oy+CntbkLG7pbCFD/9cCkHUJ2jpOHOMHRWfnwyOCTOBAloN7xfsqjojpaHx+otrAsXXSQAdFoTkLqts2yRNqewh8pbNZXkykSUR9R9a+x4WS+ryXHWIzrMDPw07OyjLfmoff1TZlXADrBykrirg3AtDl7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563297; c=relaxed/simple;
	bh=3zKw4K0SxfBg0yduDZURnZ1s2u3ud89HZ8goJk4/ZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCQKXv1itdsytBBnWrfAc7Ju5bWWx0Y6OjGGatNPC0sYwCc8NkjkggJ+59qxLtM7aYr9qlKdV/YUXrUKr2/k0/Zb0AUrk0O2ezcHirTuoZ9lXYGitrhRJ5psoAb9FrA/4Lts1xFhX+ZZsCNlMcDZIR1FCT7YioBrof2P9p5RI50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gxMvh4Kb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gxMvh4Kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563291;
	bh=3zKw4K0SxfBg0yduDZURnZ1s2u3ud89HZ8goJk4/ZGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxMvh4KbzfJgdo5wyOaRN1EtdQAsSwX0NVCpX9OageWzyYwkeFiKFcx/M3Y2pExuq
	 QMSfyGnkW9w6tpU0SqCICYkef4aUgFIzO90iE4Kzr8+Or2+no5PMC3IonuJwVxnc0i
	 FYKg9Mm1r/kkdKIDIRPiDuH4RkS3nZ39qz6Vg/pT1c3h0jW7stcBs31CES9jS9WfA1
	 0fnRfpTMpCyEbTNaH6lH7euR783RtnrO2Fus8VsCcw/URwf5kWkj15L6Eh6uD1LsMT
	 EbxrF1FnuhsPDyqtLnkaGLPQDz4xXPOtlCY37AXDq4DJTC7K+ODuN89cmH36IpO/KX
	 ITTdmqnr3D2Sg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D710D17E138B;
	Wed, 16 Sep 2026 14:54:50 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 5/7] media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:41 +0200
Message-ID: <20260916125443.78602-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
References: <20260916125443.78602-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify and clean up the code by using the helpers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_vp8.c   | 37 +++++--------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
index 381bc1d3bfda..881e6c21f0fa 100644
--- a/drivers/media/platform/verisilicon/hantro_vp8.c
+++ b/drivers/media/platform/verisilicon/hantro_vp8.c
@@ -144,11 +144,9 @@ void hantro_vp8_prob_update(struct hantro_ctx *ctx,
 
 int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *aux_buf;
 	unsigned int mb_width, mb_height;
 	size_t segment_map_size;
-	int ret;
 
 	/* segment map table size calculation */
 	mb_width = DIV_ROUND_UP(ctx->dst_fmt.width, 16);
@@ -160,42 +158,27 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	 * And the data in segment map buffer must be set to all zero.
 	 */
 	aux_buf = &ctx->vp8_dec.segment_map;
-	aux_buf->size = segment_map_size;
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu)
-		return -ENOMEM;
+	if (hantro_allocate_aux_buf(ctx, aux_buf, segment_map_size))
+		goto error;
 
 	/*
 	 * Allocate probability table buffer,
 	 * total 1208 bytes, 4K page is far enough.
 	 */
 	aux_buf = &ctx->vp8_dec.prob_tbl;
-	aux_buf->size = sizeof(struct vp8_prob_tbl_packed);
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu) {
-		ret = -ENOMEM;
-		goto err_free_seg_map;
-	}
+	if (hantro_allocate_aux_buf(ctx, aux_buf, sizeof(struct vp8_prob_tbl_packed)))
+		goto error;
 
 	return 0;
 
-err_free_seg_map:
-	dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
-			  ctx->vp8_dec.segment_map.cpu,
-			  ctx->vp8_dec.segment_map.dma);
-
-	return ret;
+error:
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
+	return -ENOMEM;
 }
 
 void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_vp8_dec_hw_ctx *vp8_dec = &ctx->vp8_dec;
-	struct hantro_dev *vpu = ctx->dev;
-
-	dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
-			  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
-	dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
-			  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
 }
-- 
2.53.0

