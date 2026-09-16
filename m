Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBFB499F11;
	Wed, 16 Sep 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563297; cv=none; b=SSpubhTsNrDbcvrrxGVufNQV4QzvXlhRSVxyGhjAsmIQ2c4J2ATp+4lBDmt9SmNBuE53ipzKdEXgEm0JQHr3+x08yYjvfs5D9rRCKHt2fa6TPJvXi7DC0wHx/4qBnmwvrVRRnLCO/yuM1hFmYLfuGKj5GB5YVnRsBxNLWmWqxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563297; c=relaxed/simple;
	bh=6PqgZGG44xEHnNJLqRnqFADHyuaxg3PALlytKAhKjTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Znb3O3AhLL1U+a+WnWjvOZhdfpiNhq/GGISM7tv13A4YXzefiqHPuDk881zoPQge+y3W+kdztqn2IhuMmM3Lp/u7sl91cW3uSOH2B5iD9T9/Ex62rK7q86RVkDuYr750ibgn057sT5IqL1gmPEJVa7igVTIKiVisuqqujIsP4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LSbyXXWV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LSbyXXWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563291;
	bh=6PqgZGG44xEHnNJLqRnqFADHyuaxg3PALlytKAhKjTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSbyXXWVIiUUmKzRY4I/h1E103Y2p9TNVCckhdyOobQNuk+tn4xbOV1eqQjx+vXmj
	 THvoJkBJOS2jAxKZX82VWRZCTNo3wPtn5NmFkb6K8ECuZ+PAPVmXMZMNM7LH4FezYA
	 b61FtyULRiTWN/1XCi1uGvFrxgCvbVEhz2ShrJ6yM0lnyEIhecAMN891POgwlDRExO
	 KpeUj452HzXfIX/X1fDLXUradLAXFzw/+7eFP+gLz1ZrpdLXelNL8xIgruc7ym0BUK
	 QX8Es6LIsYRoIYAf1RLqMd+NVzFaN1JVYL/YEjMUWAyv3t8n2w6A5VmRrMx88tC0yS
	 i+p/6FoQ9w2zQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A8AD17E13A8;
	Wed, 16 Sep 2026 14:54:51 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 6/7] media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:42 +0200
Message-ID: <20260916125443.78602-7-benjamin.gaignard@collabora.com>
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
For upstream it should be merged into only one commit.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_vp9.c   | 37 ++++++-------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
index 566cd376c097..7a46a4767254 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.c
+++ b/drivers/media/platform/verisilicon/hantro_vp9.c
@@ -181,23 +181,17 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	size = hantro_vp9_tile_filter_size(max_height);
 	vp9_dec->bsd_ctrl_offset = size;
 	size += hantro_vp9_bsd_control_size(max_height);
-
-	tile_edge->cpu = dma_alloc_coherent(vpu->dev, size, &tile_edge->dma, GFP_KERNEL);
-	if (!tile_edge->cpu)
+	if (hantro_allocate_aux_buf(ctx, tile_edge, size))
 		return -ENOMEM;
 
-	tile_edge->size = size;
 	memset(tile_edge->cpu, 0, size);
 
 	size = hantro_vp9_segment_map_size(max_width, max_height);
 	vp9_dec->segment_map_size = size;
 	size *= 2; /* we need two areas of this size, used alternately */
+	if (hantro_allocate_aux_buf(ctx, segment_map, size))
+		goto error;
 
-	segment_map->cpu = dma_alloc_coherent(vpu->dev, size, &segment_map->dma, GFP_KERNEL);
-	if (!segment_map->cpu)
-		goto err_segment_map;
-
-	segment_map->size = size;
 	memset(segment_map->cpu, 0, size);
 
 	size = hantro_vp9_prob_tab_size();
@@ -205,36 +199,27 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	size += hantro_vp9_count_tab_size();
 	vp9_dec->tile_info_offset = size;
 	size += hantro_vp9_tile_info_size();
+	if (hantro_allocate_aux_buf(ctx, misc, size))
+		goto error;
 
-	misc->cpu = dma_alloc_coherent(vpu->dev, size, &misc->dma, GFP_KERNEL);
-	if (!misc->cpu)
-		goto err_misc;
-
-	misc->size = size;
 	memset(misc->cpu, 0, size);
 
 	init_v4l2_vp9_count_tbl(ctx);
 
 	return 0;
 
-err_misc:
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
-
-err_segment_map:
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+error:
+	hantro_free_aux_buf(ctx, segment_map);
+	hantro_free_aux_buf(ctx, tile_edge);
 
 	return -ENOMEM;
 }
 
 void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_vp9_dec_hw_ctx *vp9_dec = &ctx->vp9_dec;
-	struct hantro_aux_buf *tile_edge = &vp9_dec->tile_edge;
-	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
-	struct hantro_aux_buf *misc = &vp9_dec->misc;
 
-	dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+	hantro_free_aux_buf(ctx, &vp9_dec->tile_edge);
+	hantro_free_aux_buf(ctx, &vp9_dec->segment_map);
+	hantro_free_aux_buf(ctx, &vp9_dec->misc);
 }
-- 
2.53.0

