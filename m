Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472285;
	b=dLX5QdIItpMSUjCGqgqu4y4xH0XTBY+dmT7TV6gX1oxlDFS7NV8g//mmt21d791ZdnuA
	 mLbex/j1FpFEjP1JPpkOxAfzr+wV4R0Zrohshzhspe5f3O+VT79BA+GbpHIG5HCo1Q3jO
	 3uCPzfBOLh//sRlAAJJ1dDcCCUb4LiGW2kAOF/hlUPM76NTEttrudxJpXf3cwWRFGpauC
	 q+BJmw45EvDWXELN4BDhrM58IEUbB9KfoIh2YlUemkBF8VYowhHoG07WvI1C2aCdWNpgn
	 N/RTuSSsk8zOy4Na1f+cfeUGV4NgZCH/GOdeNMIkaHuC5fAfDAkR1wNqPr7oLtBOZ9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472285;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BRE9Wp/qzKJ/jj/qp0daRzHR7uAsl2HsLAvPmE//84E=;
	b=zZ25atINN745P1kOqDKVd6rsIdqa1TAumgIBaaMxaIb0aZU6o8gSdDM8DveXl/tFbzaV
	 I5kepDhHUIGGMQ0a52kmAOyZ/XdJfrFX5KCq9XFtR0l5HrywcOEhsdOJ2Xqqb7pczycEx
	 8qnVFY6pZuHR54pU0Nto10rKwpwFgZAgoGG6PnygXeB6oEpxqqxwJ9XO8kWqKQVWXuDC1
	 G79rC4HKNyCD0044OMHTl3HteQ1jU5sZTlbO9zsQ02SdSqgeeoH89qWJENiErdfmaCpgg
	 1GOF+6LeRXdqflLJPfzh71Q44Mf6T4btly/A8OqPB8WPL6WsdqY/lgIN0xWFpdXIFCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DqGTNIF0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6D60A260B;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DqGTNIF0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472285;
	b=Ao0nXssu7uqw1V+EMu7IQI0WdQkTYJrY3HIbKQcp+5qhC1VPi+/FIq7ilT3rpy5nLdj5
	 3EADBxaU39iy+F0ajQWbdpcvaQnSm4RanE9Wb787qHaCNE2jaXWI77hkGLHE66PtcIERe
	 w6s9xMe9ojZO0iyseBBsVVCj1LVbiLxcpEzI3oUWkw63kUO3DsMVw59A4synkFjCgIj79
	 QiyLxu7h+1mw2nJK60cT6t96tLtV3HdUgXNSpcOlMSrzuuNaH1hJe6CwrAxzEuR4EgQdW
	 Gx8DomRwCVTJTJ9me/DIbQP2D0of4lad8x0nSynemqfo2kxfBYGphyZS0c2ogs+dIUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BRE9Wp/qzKJ/jj/qp0daRzHR7uAsl2HsLAvPmE//84E=;
	b=xlx6x+6+Tgu4BH0lR5DLBoFoI4wtvyXbPkRdnaRFXNZUvl2HTFjzwnB1cGnJrGn6UrJL
	 thYHNUoaUup6/5VINJLfXQrhwhO+iQNGDaJdi7eMSDHbTO7sSw2zmCKDnlgpMOE1vppgH
	 noFSXoS5SxBx68nVszDTFkmd/BdPLf8waBYn0Dh0t+t9gWDZ443V4hd9W6FP+ur6oSanA
	 R25NKpGqJC7jHP0XKM8U+fAnsZJgVtBH5SCD7u0GEL13WPqwtVKEzvzU2OOWS6qa90DAD
	 kvR2/K0zq4/aVg10RZaT8aYbDZmHF26kLewA9TMx710ZzB7EqJjE6UjU8ATHJAo3S3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 368131F00A0D;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472285;
	bh=BRE9Wp/qzKJ/jj/qp0daRzHR7uAsl2HsLAvPmE//84E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DqGTNIF0jsuQ2LcypkOhl/jp2ooGAryo58DZ4vSagXF+1KjRLFrr1pj32ecQ0TCWE
	 zxW23SZEyRUgF4+T2KETVBzP5X8GRLeflopiZeUyUNhgPzSDbr3MP3BEqPjE1zqH+j
	 oE50/qGWEh+kUJt3lQg9zxXR+eIj3uwUnC9XImwHxCp7mV4Iqyy7XaKsspRsmoWh9z
	 Pj28UYYdj2ZpCkN2kmyo/MIxu7OIVP58JSKWpjk2f6rpl9Ntx8k+8O1OfnkYCSiTY2
	 DicGZZBtTke9ruGzGaYjSYk2MNCYmlSrR5r/96l6TjLV7eBLZSWK/X15dKHeyFH3Cz
	 58ry1LrEBSsEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B8C224939A;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:26 +0000
Subject: [PATCH v2 4/7] media: verisilicon: Refuse JPEG encode jobs with
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
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-4-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472282; l=5619;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=HnY0cQme+yKx81BYUIEIgWDelP7AzCPV47XBmGayUB8=;
 b=MWG0AkNPWMTpprRQThbzgpKVzGfQKzFhVLMfc8fXUgIYDHehJCg0HG6jIXvFZMtmPhSK7rWXu
 txCtJCza+2SAV+jyLZg8mqk+leAeqMR1OlaaLoVre8KHI6Z/ZAFsdz5
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
 .../platform/verisilicon/hantro_h1_jpeg_enc.c      |  9 ++++++
 drivers/media/platform/verisilicon/hantro_jpeg.c   | 37 ++++++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_jpeg.h   |  5 +++
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |  9 ++++++
 4 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
index 86cc1a07026f..b2f97f45e0ac 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
@@ -109,10 +109,19 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
+	int ret;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
 
+	ret = hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
+	if (ret) {
+		/* Complete the controls of the request, the job is not run */
+		v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+		return ret;
+	}
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
index 61621b1be8a2..c7a1323506f5 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -135,10 +135,19 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
+	int ret;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
 
+	ret = hantro_jpeg_enc_check_job(ctx, &dst_buf->vb2_buf);
+	if (ret) {
+		/* Complete the controls of the request, the job is not run */
+		v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+		return ret;
+	}
+
 	hantro_start_prepare_run(ctx);
 
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));

-- 
2.55.0


