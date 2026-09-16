Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2537DAD7;
	Wed, 16 Sep 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563294; cv=none; b=XiZGXDbPjksvK2sgUyOxY0cXVmBbkLGVF0fyyBhfZ7jfzqGJRfIJ16lokefbjE+740QGDHqHxvvQ3xmx3MldGrvMDkaXBHPIbRc9438QpgbK5cMjUgIKMD/ZElHEPk8wZ34WmiXH1aZuUfmz0S45IB1XfPrNarOEIbybnu9bYFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563294; c=relaxed/simple;
	bh=qUx4hsf6eU4bj1x64ZWHjM8moLvtJhuV3tVMfQYaZOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWfvjmt1z0Na77TJWOyxEt+vuqWpN42oIZSRAM46zOkE0Qd19RYEm0/Lha9H61EcPuKPUQfOsZtmZcz0lItrddZ2MEQbhXDyeMPg2nbHZlLckcrIMd/lAAmlPq75hNXm/ghGbEIHlRdZ8MilfXSBxBZQg1u2dP1RsOJmaPJQglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NqoAekRt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NqoAekRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563290;
	bh=qUx4hsf6eU4bj1x64ZWHjM8moLvtJhuV3tVMfQYaZOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqoAekRtgVNCDR3hKlL17SGzg9fGWjHvpIFWQftUc0zvHPv6M6t6Y4KQAfkw/IPfT
	 nzG0OzfozDMQsJXRxD8+ouZUvN4RDSWDXgvB5SV6V6rrZq10fX7nrZYtCEDoxhITwR
	 yj0GIPFQ612JROA33/95ei7siYtiizW+1ae8aIGlGCvZbvzzDG9ylhKM+OQawS3MqT
	 7bPMSkjgDWWq/lWseZtnZVaSeMR1ek2QCfWqTLBmuCRUkfGSZ9tcsflvl+5sYfQ2y0
	 QPaXOj3j8Kofjy8tOcvE1GRfy5V5i5QWeyd/SFQrRr3YYcG0ftMIZ0xSEVOqvw3e3a
	 BRAkFTdZkv6FA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2329917E12B9;
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
Subject: [PATCH v1 3/7] media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:39 +0200
Message-ID: <20260916125443.78602-4-benjamin.gaignard@collabora.com>
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
 drivers/media/platform/verisilicon/hantro_h264.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..68dde1cd1ac2 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -494,26 +494,21 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 
 void hantro_h264_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 
-	dma_free_coherent(vpu->dev, priv->size, priv->cpu, priv->dma);
+	hantro_free_aux_buf(ctx, priv);
 }
 
 int hantro_h264_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 	struct hantro_h264_dec_priv_tbl *tbl;
 
-	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
-				       GFP_KERNEL);
-	if (!priv->cpu)
+	if (hantro_allocate_aux_buf(ctx, priv, sizeof(*tbl)))
 		return -ENOMEM;
 
-	priv->size = sizeof(*tbl);
 	tbl = priv->cpu;
 	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
 
-- 
2.53.0

