Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295078;
	b=DYyk9ByWbQUsQIOr/iBpOlrzINdOv4uipEe/aB3nsNbqfXMi6lDH00xD1eB0wrV2PcMA
	 LZZIkr7OR3vB0/QIly53sRRLiPqRerSwfrOYK58+z1xj8Q3o5kYR22e0PusT5CwMNlM03
	 cb+IU0smFEM8S7sJk99W2/H4u5LYr1xmqG6YASD4kze0Q5TBaXUqaxKW758zcV3j8gcCD
	 rXl1nu/f6yfIw5qDGyfuLn7JWOcMysAdrOAqmZRJuaGDl8NRWdP1Dm6bIyHLGaZwfXyK6
	 Y4BlmzDnCLlVMptIyOfzFP82DRHqyfSL6Lcd3sb89sDqHWWBKh07vrqNqAI+xIF5GVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295078;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5dTHvGBDugYE4eA3b+cwrzQ7C1CqTB30IHaEtp1Dp4Y=;
	b=ZqYNiUjo3vBVRksSSnOMwulYR/kU4C58v6W5akqzXQSDZsIF2/fpB4a+ykHjFAY+8n+L
	 ab3NHEJtk1yePad+YT31OgdpDsUW7xFqNmCf/JMpL2eH9/gpi8IifwEVrNZqrNVqsScIS
	 Orqc2G/MVYd02WjdOsMT4qr9woBx837QTIzMyX6/EFD6uHQmlnQf4zaOrWWgD5IvFTwJf
	 apeQA8zudMlYZE52RE67X8ZDDE1soZjk2rLb5nnQoy8CLs9pMHB2+nRESf1nxIXz537Wy
	 dJgKLF/KSmBJjJ2s7f9sc4Bz1T1Yjk9/ysbQH26dmIOJaIkOBZTnNrHeUNzsecso6JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4MYn0Au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD060A383E;
	Tue, 10 Nov 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4MYn0Au
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295078;
	b=oeFBBvyO0cMgF2ssDYfZQwMaoEscZUVDGwT3KELTbmt0B6yVZ2AvWVei5ArRxcYRAf9E
	 WZc0WnSBp0meNdBv/Izu20fib2bOGAHZhM7ofj6H3iQOh2Tfa+ySPIf+nkyyq0EDsWd6u
	 OdGZnACQuQeAjaGXjFxu4fJX8itHOA80bSuVewak0Kz2qFNN2B93u7drcYCXoTj7wcw2+
	 VXdm8UHTDjaOPXNwH7hnMR5CVuFw3HmwMHbo3sAAgjO8o9g6gGUPdBJQflPp9/b5NrP4l
	 2EjtACjqbJaMLxFHNW6bbg/h5yM96v64otZz21oWvnX1yEHR1zyCKQbYS5XKOhWZB8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295078;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5dTHvGBDugYE4eA3b+cwrzQ7C1CqTB30IHaEtp1Dp4Y=;
	b=Zlr3srjPOxmRL9L9weQihX/Ro2a1Mv12J3jsSgczj/URdHCWVhEEyt2RzGXWq58UH0As
	 CeSasMAzyw+CGiJnNiVwSjjyO9CdwxKgc5OjRaAAr688r579oKRJEbelKSblyS2o/hikl
	 8CiSrLC/4Obevoh/8HLN13Uk83UUILex6t6f76yg2+rzjOicEpS90Ynyk444Pnv6AfjhA
	 oRwh8aIztG4kj6e3sX5i6Ui3r/lqk8+6XHpzan43SXej/s3l6kwISf/0UJ6NfOcm58hdX
	 LAmLJZb5S0NP9MOCag8d1YyvlFebq1WAXWyMBuOOiWCqOYI4iqpQfhkVbOxe6MLfaBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9BFF1F008A1;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295078;
	bh=5dTHvGBDugYE4eA3b+cwrzQ7C1CqTB30IHaEtp1Dp4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=a4MYn0AuUN1VMSmY1VcQ+F0Mb3OGZ4UNRZb/ZEnPuJQeYtBMTbfPqlIvkbjoXYmdb
	 YsXr7lUaD8z7t57LfQc6ZZH1hOFRmI3s6jt6OWDeFZ3CquZ5TX3Md5qQIjLUkuLaME
	 n9q9gfch68qjHtuaXfy4lACBGIMwnbVppLVP7EPi/ECaob5OMq8NX5/klHMtkoUf08
	 pyu2WxiBmQeHYaBbI912oNL7YY/B4ZxIrVXnjfjzdcQ3NI3LykH+qf/bIv0iMrakZ9
	 /iSnVxGHc1GkLYM7yEYrMwnulFivrPGPZnFrvivLBvC+E9nXkt4aEaitdJCPzr7BDp
	 H1Rj0ytcGPw+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3BB9748990;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:58 +0000
Subject: [PATCH 3/6] media: verisilicon: Refuse JPEG encode jobs with
 inconsistent geometry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-3-fc4dc7e985d2@gmail.com>
References: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
In-Reply-To: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=5281;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=do5fff0E77HztRZ7LZ0DBdjmX88jN/xzYgE6TJmApXI=;
 b=5ecRMYzhG87W1R1GcnfpbIkRyjcO7mKyaawyBusIX6qDd9JpZe0FuK2lKeTcA0fKXZdhT4AY1
 B/TGr74YK83AZ0g5FLNTmwTElehkTvVGNPQILcsRyYFxP3WjX2Sz774
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The JPEG encoders program the hardware with the macroblock count of the
OUTPUT format and treat the difference between the OUTPUT and CAPTURE
sizes as the crop inside the last macroblock, which is written into
narrow register fields. They also write the JPEG header into the
CAPTURE buffer without checking its size.

When the two formats disagree beyond that, as could happen before the
coded size was kept in sync with the OUTPUT format, the encoder on
RK3588 generated IOMMU page faults close to address 0, timed out, and
left the IOMMU unable to stall, requiring a reboot.

The format ioctls are now expected to keep the formats consistent, but
as getting this wrong takes down the whole encoder, check the geometry
and the CAPTURE buffer size before programming the hardware and fail
the job instead.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../platform/verisilicon/hantro_h1_jpeg_enc.c      |  5 +++
 drivers/media/platform/verisilicon/hantro_jpeg.c   | 37 ++++++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_jpeg.h   |  5 +++
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  5 +++
 4 files changed, 52 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
index 86cc1a07026f..d8c71676a3f2 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
@@ -109,10 +109,15 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
+	int ret;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
 
+	ret = hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
+	if (ret)
+		return ret;
+
 	hantro_start_prepare_run(ctx);
 
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.c b/drivers/media/platform/verisilicon/hantro_jpeg.c
index 13a60638e43f..2f2afd632c1b 100644
--- a/drivers/media/platform/verisilicon/hantro_jpeg.c
+++ b/drivers/media/platform/verisilicon/hantro_jpeg.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-jpeg.h>
 #include "hantro_jpeg.h"
 #include "hantro.h"
+#include "hantro_hw.h"
 
 #define LUMA_QUANT_OFF		25
 #define CHROMA_QUANT_OFF	90
@@ -243,3 +244,39 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
 
 	jpeg_set_quality(ctx);
 }
+
+/*
+ * Check that the formats describe a frame the JPEG encoders can be
+ * programmed with: the coded size may only crop the OUTPUT frame inside
+ * the right-most and bottom-most macroblocks, and the CAPTURE buffer
+ * must have room for the header and some payload. The V4L2 ioctls are
+ * expected to guarantee this, but programming the hardware with
+ * anything else makes it access memory outside the buffers, so refuse
+ * the job instead.
+ */
+int hantro_jpeg_enc_check_job(struct hantro_ctx *ctx,
+			      struct vb2_buffer *dst_buf)
+{
+	const struct v4l2_pix_format_mplane *src = &ctx->src_fmt;
+	const struct v4l2_pix_format_mplane *dst = &ctx->dst_fmt;
+
+	if (!dst->width || !dst->height ||
+	    !IS_ALIGNED(src->width, MB_DIM) ||
+	    !IS_ALIGNED(src->height, MB_DIM) ||
+	    dst->width > src->width || dst->height > src->height ||
+	    src->width - dst->width >= MB_DIM ||
+	    src->height - dst->height >= MB_DIM ||
+	    !IS_ALIGNED(src->width - dst->width, 4)) {
+		vpu_err("inconsistent geometry: OUTPUT %ux%u, CAPTURE %ux%u\n",
+			src->width, src->height, dst->width, dst->height);
+		return -EINVAL;
+	}
+
+	if (vb2_plane_size(dst_buf, 0) <= ctx->vpu_dst_fmt->header_size) {
+		vpu_err("CAPTURE buffer too small: %lu bytes\n",
+			vb2_plane_size(dst_buf, 0));
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.h b/drivers/media/platform/verisilicon/hantro_jpeg.h
index 0b49d0b82caa..296ad1e821c7 100644
--- a/drivers/media/platform/verisilicon/hantro_jpeg.h
+++ b/drivers/media/platform/verisilicon/hantro_jpeg.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
+struct hantro_ctx;
+struct vb2_buffer;
+
 #define JPEG_HEADER_SIZE	624
 #define JPEG_QUANT_SIZE		64
 
@@ -13,3 +16,5 @@ struct hantro_jpeg_ctx {
 };
 
 void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx);
+int hantro_jpeg_enc_check_job(struct hantro_ctx *ctx,
+			      struct vb2_buffer *dst_buf);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index 61621b1be8a2..b6217e332fc0 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -135,10 +135,15 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
+	int ret;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
 
+	ret = hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
+	if (ret)
+		return ret;
+
 	hantro_start_prepare_run(ctx);
 
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));

-- 
2.55.0


