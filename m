Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1913815C3;
	Wed, 16 Sep 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563295; cv=none; b=g24LH1OCOcHUt4dsLUk+TISNpS/XabEz/xqsIpv2adw8bYqt9pC/W/36UEXMaDG8MK/FDEzOnanq2uabRj3BjTrvQm/aj2GWg5XtET4vO5lIvRXUUAjLJCQzbU3e0YViaUgGgNj/i7MlM1zGLFpRssYnejvA2Kxg9y8rDhaRVJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563295; c=relaxed/simple;
	bh=024vXHBL3M4Nza6LGz1p+RSiowISrkhNEPP+TzTqIUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=So7qzRCK5MccylW8mX6o8AwR6AJcN6nujOawCBtrEbtBWMsuzN6rP4cRCvfqh1qXpv9IQfP8CnVAOH+PLCcMSWBWf7F/Uf8qIQ8TsNtexoSNOUH4iiVJRfpuYFMFH1820PsRbjNVY5461C2DNhtqxPW8VRMeWptWQZt2YKuTikU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BjNh4kyK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BjNh4kyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563290;
	bh=024vXHBL3M4Nza6LGz1p+RSiowISrkhNEPP+TzTqIUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjNh4kyKv2bWwfoYAxCrmXnDEjpt0ID9cNVrNrteimR3Wc9wrRwZk0xsBJr8jBYfz
	 qtaOc9mMnARoudVijGVcF7t59YP7qR2vJiL2nTn6tuYFO9ybGWZT8/3Go3WJVHEAwa
	 ZByZ2wZ/j0DEgnIY2Is8d01/sSgVwtw5NaBenUOMjQhocrJi/CPvEg1hKznVfM468b
	 iBW3OlkN7leGGkRj3QNMeaR2qR9Il/ho/Qt8WzOkVDX+X0EgMN01eGNmtaqlAUsh5H
	 NKfvBrUn5PIhXDwisGwezHc2cjl6utj5eQr2QfBI/Z5NgPeTME3T9+hEta++sd/Lxq
	 oAderI16sN1OQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFCAC17E1289;
	Wed, 16 Sep 2026 14:54:49 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 2/7] media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:38 +0200
Message-ID: <20260916125443.78602-3-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
 1 file changed, 39 insertions(+), 138 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
index 2cde32f0e935..e05816c7dfa3 100644
--- a/drivers/media/platform/verisilicon/hantro_av1.c
+++ b/drivers/media/platform/verisilicon/hantro_av1.c
@@ -235,40 +235,17 @@ size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
 
 static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
-	if (av1_dec->db_data_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
-				  av1_dec->db_data_col.cpu,
-				  av1_dec->db_data_col.dma);
-	av1_dec->db_data_col.cpu = NULL;
-
-	if (av1_dec->db_ctrl_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
-				  av1_dec->db_ctrl_col.cpu,
-				  av1_dec->db_ctrl_col.dma);
-	av1_dec->db_ctrl_col.cpu = NULL;
-
-	if (av1_dec->cdef_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
-				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
-	av1_dec->cdef_col.cpu = NULL;
-
-	if (av1_dec->sr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
-				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
-	av1_dec->sr_col.cpu = NULL;
-
-	if (av1_dec->lr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
-				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
-	av1_dec->lr_col.cpu = NULL;
+	hantro_free_aux_buf(ctx, &av1_dec->db_data_col);
+	hantro_free_aux_buf(ctx, &av1_dec->db_ctrl_col);
+	hantro_free_aux_buf(ctx, &av1_dec->cdef_col);
+	hantro_free_aux_buf(ctx, &av1_dec->sr_col);
+	hantro_free_aux_buf(ctx, &av1_dec->lr_col);
 }
 
 static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
@@ -277,6 +254,7 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 	unsigned int height_in_sb = height / 64;
 	unsigned int stripe_num = ((height + 8) + 63) / 64;
 	size_t size;
+	int ret;
 
 	if (av1_dec->db_data_col.size >=
 	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
@@ -285,44 +263,22 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 	hantro_av1_tiles_free(ctx);
 
 	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_data_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_data_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_data_col.size = size;
+	ret = hantro_allocate_aux_buf(ctx, &av1_dec->db_data_col, size);
 
 	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
-	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_ctrl_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_ctrl_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_ctrl_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->db_ctrl_col, size);
 
 	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
-	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						   &av1_dec->cdef_col.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->cdef_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->cdef_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->cdef_col, size);
 
 	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
-	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->sr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->sr_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->sr_col.size = size;
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->sr_col, size);
 
 	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->lr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->lr_col.cpu)
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->lr_col, size);
+
+	if (ret)
 		goto buffer_allocation_error;
-	av1_dec->lr_col.size = size;
 
 	av1_dec->num_tile_cols_allocated = num_tile_cols;
 	return 0;
@@ -334,105 +290,50 @@ static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
 
 void hantro_av1_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
-	if (av1_dec->global_model.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
-				  av1_dec->global_model.cpu,
-				  av1_dec->global_model.dma);
-	av1_dec->global_model.cpu = NULL;
-
-	if (av1_dec->tile_info.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
-				  av1_dec->tile_info.cpu,
-				  av1_dec->tile_info.dma);
-	av1_dec->tile_info.cpu = NULL;
-
-	if (av1_dec->film_grain.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
-				  av1_dec->film_grain.cpu,
-				  av1_dec->film_grain.dma);
-	av1_dec->film_grain.cpu = NULL;
-
-	if (av1_dec->prob_tbl.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
-				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
-	av1_dec->prob_tbl.cpu = NULL;
-
-	if (av1_dec->prob_tbl_out.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
-				  av1_dec->prob_tbl_out.cpu,
-				  av1_dec->prob_tbl_out.dma);
-	av1_dec->prob_tbl_out.cpu = NULL;
-
-	if (av1_dec->tile_buf.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
-				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
-	av1_dec->tile_buf.cpu = NULL;
+	hantro_free_aux_buf(ctx, &av1_dec->global_model);
+	hantro_free_aux_buf(ctx, &av1_dec->tile_info);
+	hantro_free_aux_buf(ctx, &av1_dec->film_grain);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl_out);
 
 	hantro_av1_tiles_free(ctx);
 }
 
 int hantro_av1_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	int ret = 0;
 
 	memset(av1_dec, 0, sizeof(*av1_dec));
 
-	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
-						       &av1_dec->global_model.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->global_model.cpu)
-		return -ENOMEM;
-	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
-
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
-						    &av1_dec->tile_info.dma,
-						    GFP_KERNEL);
-	if (!av1_dec->tile_info.cpu)
-		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
-
-	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
-						     ALIGN(sizeof(struct hantro_av1_film_grain),
-							   2048),
-						     &av1_dec->film_grain.dma,
-						     GFP_KERNEL);
-	if (!av1_dec->film_grain.cpu)
-		return -ENOMEM;
-	av1_dec->film_grain.size = ALIGN(sizeof(struct hantro_av1_film_grain), 2048);
-
-	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
-						   ALIGN(sizeof(struct av1cdfs), 2048),
-						   &av1_dec->prob_tbl.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->prob_tbl.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
-
-	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
-						       ALIGN(sizeof(struct av1cdfs), 2048),
-						       &av1_dec->prob_tbl_out.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->prob_tbl_out.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->global_model, GLOBAL_MODEL_SIZE);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->tile_info, AV1_TILE_INFO_SIZE);
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->film_grain,
+				       ALIGN(sizeof(struct hantro_av1_film_grain), 2048));
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->prob_tbl,
+				       ALIGN(sizeof(struct av1cdfs), 2048));
+	ret |= hantro_allocate_aux_buf(ctx, &av1_dec->prob_tbl_out,
+				       ALIGN(sizeof(struct av1cdfs), 2048));
+	if (ret)
+		goto buffer_allocation_error;
+
 	av1_dec->cdfs = &av1_dec->default_cdfs;
 	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 
 	hantro_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
 
-	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
-						   AV1_TILE_SIZE,
-						   &av1_dec->tile_buf.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->tile_buf.cpu)
-		return -ENOMEM;
-	av1_dec->tile_buf.size = AV1_TILE_SIZE;
-
 	return 0;
+
+buffer_allocation_error:
+	hantro_free_aux_buf(ctx, &av1_dec->global_model);
+	hantro_free_aux_buf(ctx, &av1_dec->tile_info);
+	hantro_free_aux_buf(ctx, &av1_dec->film_grain);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl);
+	hantro_free_aux_buf(ctx, &av1_dec->prob_tbl_out);
+
+	return -ENOMEM;
 }
 
 int hantro_av1_prepare_run(struct hantro_ctx *ctx)
-- 
2.53.0

