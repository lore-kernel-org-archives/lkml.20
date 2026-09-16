Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0543812FB;
	Wed, 16 Sep 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563293; cv=none; b=lz60yLlftcGV1vhhOkoJVx33WStyNfkVTJwlV7psIbsOkbf4OZScOUR80SYTq59I1crAUMpvVmeYlsbgbVm4mjRR69kNWiWTGn2Tj4WJbztJdIwtYPjeAiRYeHnf194UJzmzpmFF2LVb6AdEMB1e5YWNIPrWnFM+J+nwSJP6DP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563293; c=relaxed/simple;
	bh=NQVqy4hE+EYQflOm/DmxGobFKmKFXpxdIAMwBlCuXFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT8NGSnP4GG8EDiQ4tsU9KmTo2tVWzI35xm/JKMi6vVYC+qgvWQXkUqflUjdCWp74qVAY6icruHOW16ILinaUNyFtjqPTGAe2pwL/nRrjPyAF8spcbo2mTbPNBQpSsEeNVCJkLWse90WinvwlRKpIcDtwSwgcOhjubGHNa/3jTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X70Y/Pjm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X70Y/Pjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563289;
	bh=NQVqy4hE+EYQflOm/DmxGobFKmKFXpxdIAMwBlCuXFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X70Y/Pjmu6XmGEaxyMewbmGW/v6HiNjHdNWMN3VRrI1fMgbOghI2XK3KSh9PReAOD
	 UWPAgScPWTGjFoNUsTZHJKP/Te9HcoWWRMZg18vqvMQ/gdM3YZIET2EdZwvz0jqYSi
	 LmCTjuDGuSw7NkkTOoOPlurjN4HTt2vAa4tKQnH2pQOY5Pz/uBDowq5lr87WGr5dN7
	 3bEyNV02EvluaAvwVozhRvKbk7bB7laCkQdsUzxQl+hILXS32SVXQhh+soiSWa8W+h
	 OBF71IgJrM1TjR/xeU9Bw40svIjM0qjECiOULvKrgdZqv8kd9LyT9L0znGrHkxdNsW
	 sWVGMt6o+7lfA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6513417E0C7E;
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
Subject: [PATCH v1 1/7] media: verisilicon: Add helpers to allocate and free auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:37 +0200
Message-ID: <20260916125443.78602-2-benjamin.gaignard@collabora.com>
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

Add helpers functions to allocate and free the auxiliary buffers.
That simplify the code and make it more easy to read and maintain.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  4 +++
 .../platform/verisilicon/hantro_postproc.c    | 21 ++---------
 .../media/platform/verisilicon/hantro_v4l2.c  | 35 +++++++++++++++++++
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..f2f02522a543 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -507,4 +507,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx);
 int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
 				   struct v4l2_frmsizeenum *fsize);
 
+int hantro_allocate_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf,
+			    size_t size);
+void hantro_free_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e94d1ba5ef10..3e202076bd2f 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -180,7 +180,6 @@ static int hantro_postproc_g2_enum_framesizes(struct hantro_ctx *ctx,
 
 void hantro_postproc_free(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *queue = &m2m_ctx->cap_q_ctx.q;
 	unsigned int i;
@@ -188,11 +187,7 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 	for (i = 0; i < queue->max_num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
 
-		if (priv->cpu) {
-			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-				       priv->dma, priv->attrs);
-			priv->cpu = NULL;
-		}
+		hantro_free_aux_buf(ctx, priv);
 	}
 }
 
@@ -223,7 +218,6 @@ static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 
 static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
 	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
 
@@ -235,13 +229,7 @@ static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 	 * buffers for the decoder, so no mapping is needed.
 	 */
 	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
-				    GFP_KERNEL, priv->attrs);
-	if (!priv->cpu)
-		return -ENOMEM;
-	priv->size = buf_size;
-
-	return 0;
+	return hantro_allocate_aux_buf(ctx, priv, buf_size);
 }
 
 int hantro_postproc_init(struct hantro_ctx *ctx)
@@ -268,14 +256,11 @@ hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
 {
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
 	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
-	struct hantro_dev *vpu = ctx->dev;
 	int ret;
 
 	if (priv->size < buf_size && priv->cpu) {
 		/* buffer is too small, release it */
-		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
-			       priv->dma, priv->attrs);
-		priv->cpu = NULL;
+		hantro_free_aux_buf(ctx, priv);
 	}
 
 	if (!priv->cpu) {
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..ec12950a1ae1 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -1029,3 +1029,38 @@ const struct vb2_ops hantro_queue_ops = {
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
 };
+
+int hantro_allocate_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf,
+			    size_t size)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (!aux_buf || !ctx || !size)
+		return -EINVAL;
+
+	aux_buf->cpu = dma_alloc_attrs(vpu->dev, size,
+				       &aux_buf->dma,
+				       GFP_KERNEL,
+				       aux_buf->attrs);
+	if (!aux_buf->cpu)
+		return -ENOMEM;
+
+	aux_buf->size = size;
+
+	return 0;
+}
+
+void hantro_free_aux_buf(struct hantro_ctx *ctx, struct hantro_aux_buf *aux_buf)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (!aux_buf || !ctx)
+		return;
+
+	if (aux_buf->cpu)
+		dma_free_attrs(vpu->dev, aux_buf->size,
+			       aux_buf->cpu, aux_buf->dma,
+			       aux_buf->attrs);
+	aux_buf->cpu = NULL;
+	aux_buf->size = 0;
+}
-- 
2.53.0

