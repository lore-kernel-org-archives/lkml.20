Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37044BFE61;
	Wed, 16 Sep 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563297; cv=none; b=Mo42n8doVDLq28xXDs/P+G3E3Pbx4elN5Jf3VLpO46BhthwO9E+oTnu/zHfoDt3goAltc530OYINykhIEoj81foAZ4tSCWavxiOpfqx6YwR6I/07jl6x7vQsV+9D9ouMEotdqZnNfQwBcWFk312PHftec52AgSHbxfGBUAjXnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563297; c=relaxed/simple;
	bh=eOI2q3uxCKkIliMe03rIur3xYlkC3y6bAVkEvyKeEnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW9tgU41JE8epENxYTWrR52vwEIKbxK0CrosChHZSvmxQ+RYKyinYVsbHkTY+P0kmTTwdOHmjgvLx8WndsCZAYUSEvstN/do9wWlT3r5EQcuaWirC0+vBhrCmCwte2OhL5toMEAk8cBmAL7XOMsbcbVpuQ/Ran2xrsxqwuFTdiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cgcLUcRl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cgcLUcRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563291;
	bh=eOI2q3uxCKkIliMe03rIur3xYlkC3y6bAVkEvyKeEnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgcLUcRl1F3UpKx6T+FPc+kyCicbxNO0aAc1nJzhNfNj9tr0ZSBe7loLNsDL9cX0S
	 Nf93ozBYxWJ54qLgZYYhHcbNpwORE0un5IoQa/EWrrysZ16OPKGtUHkcNaVrD2OoHC
	 3J1LFjc410SxZDKw8pmCJ/oXpmQkul0FV6jl9+O4PLRqowOeupWMTmM4BRppaVKJoP
	 iQOvldl7V+bUVu3Zl7Cat1V+OBre3fZ/+V96xUQz6t3xPr43tfoNMBQVm1kBpnLdn7
	 71ysPJCepqh9RtpTqjdl0ansxP/j0DG5BxfCaV669g+6n1Xyz286FTC8kPhOurSNE7
	 5ivo9iV8vs4uA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9543317E13C3;
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
Subject: [PATCH v1 7/7] media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary buffers
Date: Wed, 16 Sep 2026 14:54:43 +0200
Message-ID: <20260916125443.78602-8-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_mpeg2.c   | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
index 04e545eb0a83..f21115e6bdbe 100644
--- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
@@ -37,25 +37,12 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-
-	ctx->mpeg2_dec.qtable.size = ARRAY_SIZE(zigzag) * 4;
-	ctx->mpeg2_dec.qtable.cpu =
-		dma_alloc_coherent(vpu->dev,
-				   ctx->mpeg2_dec.qtable.size,
-				   &ctx->mpeg2_dec.qtable.dma,
-				   GFP_KERNEL);
-	if (!ctx->mpeg2_dec.qtable.cpu)
+	if (hantro_allocate_aux_buf(ctx, &ctx->mpeg2_dec.qtable, ARRAY_SIZE(zigzag) * 4))
 		return -ENOMEM;
 	return 0;
 }
 
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-
-	dma_free_coherent(vpu->dev,
-			  ctx->mpeg2_dec.qtable.size,
-			  ctx->mpeg2_dec.qtable.cpu,
-			  ctx->mpeg2_dec.qtable.dma);
+	hantro_free_aux_buf(ctx, &ctx->mpeg2_dec.qtable);
 }
-- 
2.53.0

