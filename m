Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305290;
	b=xC2yRiByyFywLK4d5GUCAij0yVizEoXpq8BMmMuFRopVzW4avPml5ZzpWB+b4YipRu9V
	 DnutILFZf+ZvNSaWGITSDJclRmCY2M961TdsEbtAUuIcPPTf4gsh+HzeMD+w6DjGII/lY
	 uzVEhxPtcrfpX8/Ywlti4JhI30yBd3f3EGSBgDA3miPHgV+MNSePQv0qx/UmV5w+S6ojW
	 6EAmeRmaemV4aAZrFJp47s1M6CIR5X6DZnUlQ1L+SItwqkMi36PirFfJBxca9vuHT4qN4
	 H8CKLqZPtniWAoqy0+yR/hfCLrU4HFiObYxEn0frwY/fbyavpATqNNQBdjuYqbSLjTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305290;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sAtO1ui35lKQKmmC9SSVGfb9Aw3vRzE4A4i1731weE0=;
	b=PhCx/UfASM8DJLyL+rgzfz8a8+f8kqE9w8iwb1dJAIjp3x6VsREm0wKzJQAUy2ZeVkSP
	 IuiDpa6x83VJall9vYOHqBYSIb0pQ5mmJS/Ck9G6XuYcZEh/ubPT3CDHcdjWi/h6O4/vp
	 4cgGoDAwo9/kTUTEOnW+yDTZ4b27eDG/oEfZG484we2+oumbS05OiD9ucVmLpyMJJ/5m9
	 IjkVZWqlbWTZ4KdChK7YzKxDF4bQ7NwI2GDVy61JTKQG0q1XT/v5G899n+ZJ18xub50nn
	 JcOZBG78+OisA5mSWg53IeKxNjKvnn2Sf7HDDMNBBmggE3G2FUzYvqh3PglqvPeKfqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAb59tv2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F960A263A;
	Tue, 10 Nov 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAb59tv2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305289;
	b=cu4S7iH/mu4Vy/cFSUE+jwOog/HZxRQyKPj1hnGBeFQTxHQRwxegzf3HwM36Z7MUjyJ4
	 HoKGFFlCbi1w3ggIFgJB0nS1jkrfBl/iuT1/I4tEYeqh9Mydwjv5Bnqybr2pR5Q8WYO5X
	 OE1yOtkTCjLlWI9hjX4H5e4JRQVBgBBXoKr+4W0HJWypRt4/ySxUr4Xnzq4rkFMiSnmWi
	 s1u7qgZ8ZIi6wstN8mjS+HMRVwD1BsLGz/7bdcA774xTeXQUNAlfQLIr7AqwZ1pPrw35N
	 0Mbb7A6GVNHglVjv1lDgHJZLY1vgEG3/VmRSl0LGS74cVibcXBnr6OSY4Qu39XARCpQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305289;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sAtO1ui35lKQKmmC9SSVGfb9Aw3vRzE4A4i1731weE0=;
	b=2H3+ZFw6QRQgh+jshRG16p4cXweG/6h+F3g2lewU5HTb52aqZicG45bqYhP+bG9VLjfi
	 FRQYNpVHQZ5+4pcYYt/doEGf+pGZ4gC4PW3ZYUn1YPWpGZF61e8JuCgjISojMTi/I95QO
	 NMhF6NR1sDmWRARIUq7FXw5R62uUrx4DyAKbNkucp2pgdaxS90dLk3e0uCbpwqoxHGERL
	 hz5MsT8eeQ5WMRyCiVi3V1dcAgJ6pO0syCaYy60nbYsNilIZLpB2Ane/9hIpdafbwqH5l
	 iN5TaqWh+9n47xqsOPr5SwC/qKfFyrYOwUEU0sGJRObDPzuL6eaGx8vnlsGUu6TP/8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 404D61F008BE;
	Tue, 10 Nov 2026 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305289;
	bh=sAtO1ui35lKQKmmC9SSVGfb9Aw3vRzE4A4i1731weE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XAb59tv2nYSBluZfBf12DR6+7jY+5OYJipxCX2reIjPZi0w4YsCzb3CUO47bQDlaW
	 VLSFmokz0yggGo0WvtMPiwJ4cpk314QR84lH3TrijJ0X2izssVJXMNUoaQpaLMgwNc
	 Xrb2CwWtjQL84L73f7TBkyY/6V4WADxuOWY1ns7vjYxIr200A+igFkMbhYmGeG+DXu
	 okCs+HH5RPAKDkgL06szwRuQKF3zk6HJtOzDf68mQMtDVJ6EvOEmKlFB1iDcNBXPnH
	 NLtz/XkIOxSukGX6eMSqD7YGOEwQkoITb++iQAgHzQYZzdjIjeAO1c5647hTBi66PE
	 bcvoHoNWzRJJg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B7FF748ADB;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:09 +0000
Subject: [PATCH RFC 07/12] media: rockchip: rkvenc: Encode pictures wider
 than 4096 pixels
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
Message-Id: <20261110-rkvenc-v1-7-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=7132;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=56b7J5fUEmfLr8Fj+TP9yyNIRX3fqgMQpuiuYDuQe0k=;
 b=YJG7IIZbn+1H7XmugCQJIpUWIBMUzPf7b49krYrJy0urWaN0yXq8LYI6DaUPP67KT3MVcgAeq
 uE9PlWt7NEOCgM1xRnPHoKIdw9GWDg3ET8rmfAYlIJ6VcVHiz3PaIjg
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The internal line buffers of the VEPU580 cover pictures up to 4096
pixels wide. Wider pictures need an external line buffer of 480 bytes per
64-pixel column, given to the encoder by its bottom address and its
(exclusive) top address in ADR_ELBB and ADR_ELBT. Both registers hold
address bits 31:8.

Allocate that buffer per context at stream start when the encoded width
is above 4096, program it for every picture, and raise the frame size
limits of both codecs to the 16384x8192 the encoder supports.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/rockchip/rkvenc/rkvenc-h264.c   |  6 ++--
 .../media/platform/rockchip/rkvenc/rkvenc-hevc.c   |  6 ++--
 .../media/platform/rockchip/rkvenc/rkvenc-regs.h   |  2 ++
 .../platform/rockchip/rkvenc/rkvenc-vepu580.c      | 38 ++++++++++++++++++++--
 drivers/media/platform/rockchip/rkvenc/rkvenc.c    |  8 ++++-
 drivers/media/platform/rockchip/rkvenc/rkvenc.h    |  4 +++
 6 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
index 665c54278029..11051aea43b4 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
@@ -501,11 +501,11 @@ const struct rkvenc_coded_fmt_desc rkvenc_h264_fmt_desc = {
 	.size_align = 16,
 	.frmsize = {
 		.min_width = 64,
-		/* The external line buffer for wider pictures is not handled. */
-		.max_width = 4096,
+		/* Wider than 4096 with the external line buffer. */
+		.max_width = 16384,
 		.step_width = 2,
 		.min_height = 64,
-		.max_height = 4096,
+		.max_height = 8192,
 		.step_height = 2,
 	},
 	.ctrls = &rkvenc_h264_ctrls,
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
index a3d35a7fdc3f..638b13d6642a 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
@@ -689,11 +689,11 @@ const struct rkvenc_coded_fmt_desc rkvenc_hevc_fmt_desc = {
 	.size_align = 8,
 	.frmsize = {
 		.min_width = 64,
-		/* Wider pictures need tiles, which are not implemented. */
-		.max_width = 4096,
+		/* Wider than 4096 with the external line buffer. */
+		.max_width = 16384,
 		.step_width = 2,
 		.min_height = 64,
-		.max_height = 4096,
+		.max_height = 8192,
 		.step_height = 2,
 	},
 	.ctrls = &rkvenc_hevc_ctrls,
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h b/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h
index e8e7ce045f90..dd91004e31cf 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-regs.h
@@ -82,6 +82,8 @@
 #define VEPU580_LPFR_ADDR			0x02c4
 #define VEPU580_EBUFT_ADDR			0x02d8
 #define VEPU580_EBUFB_ADDR			0x02dc
+/* Widest picture the internal line buffers cover. */
+#define VEPU580_LINE_BUF_MAX_WIDTH		4096
 
 /* Frame class: control */
 #define VEPU580_ENC_PIC				0x0300
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
index f14d5ae0b7f7..adb1372dff57 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
@@ -179,9 +179,41 @@ void vepu580_setup_common(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 	rkvenc_set(core, VEPU580_SLI_SPLT, 0);
 	rkvenc_set(core, VEPU580_SLI_CFG, VEPU580_SLI_CFG_SLI_CRS_EN);
 
-	/* No external line buffer: widths above 4096 are rejected for now. */
-	rkvenc_set(core, VEPU580_EBUFT_ADDR, 0);
-	rkvenc_set(core, VEPU580_EBUFB_ADDR, 0);
+	/* The external line buffer: top is the exclusive end, 0 when unused. */
+	if (ctx->line_buf.cpu) {
+		rkvenc_set(core, VEPU580_EBUFT_ADDR,
+			   ctx->line_buf.dma + ctx->line_buf.size);
+		rkvenc_set(core, VEPU580_EBUFB_ADDR, ctx->line_buf.dma);
+	} else {
+		rkvenc_set(core, VEPU580_EBUFT_ADDR, 0);
+		rkvenc_set(core, VEPU580_EBUFB_ADDR, 0);
+	}
+}
+
+/*
+ * The internal line buffers cover pictures up to 4096 pixels wide. Wider
+ * pictures need an external one of 480 bytes per 64-pixel column. Its
+ * address registers hold bits 31:8 only, hence the 256-byte rounding (the
+ * DMA allocation itself is page aligned). The content does not outlive a
+ * picture, and a context runs one picture at a time, so one buffer per
+ * context is enough.
+ */
+int vepu580_alloc_line_buf(struct rkvenc_ctx *ctx)
+{
+	unsigned int width = ALIGN(ctx->coded_fmt.fmt.pix_mp.width,
+				   ctx->coded_fmt_desc->size_align);
+
+	if (width <= VEPU580_LINE_BUF_MAX_WIDTH)
+		return 0;
+
+	return rkvenc_alloc_aux(ctx->dev, &ctx->line_buf,
+				ALIGN(DIV_ROUND_UP(width, 64) * 480, 256),
+				false);
+}
+
+void vepu580_free_line_buf(struct rkvenc_ctx *ctx)
+{
+	rkvenc_free_aux(ctx->dev, &ctx->line_buf);
 }
 
 /*
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
index 26bee08d4c2d..61c745994da9 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
@@ -505,7 +505,12 @@ static int rkvenc_start_streaming(struct vb2_queue *q, unsigned int count)
 	    ctx->src_fmt.fmt.pix_mp.height != ctx->coded_fmt.fmt.pix_mp.height)
 		ret = -EINVAL;
 	else
-		ret = desc->ops->start ? desc->ops->start(ctx) : 0;
+		ret = vepu580_alloc_line_buf(ctx);
+	if (!ret && desc->ops->start) {
+		ret = desc->ops->start(ctx);
+		if (ret)
+			vepu580_free_line_buf(ctx);
+	}
 	if (ret) {
 		rkvenc_queue_cleanup(q, VB2_BUF_STATE_QUEUED);
 		return ret;
@@ -524,6 +529,7 @@ static void rkvenc_stop_streaming(struct vb2_queue *q)
 	if (ctx->started) {
 		if (desc->ops->stop)
 			desc->ops->stop(ctx);
+		vepu580_free_line_buf(ctx);
 		ctx->started = false;
 	}
 
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.h b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
index c2dd0bb91c51..ec6a955921b8 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc.h
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
@@ -226,6 +226,8 @@ struct rkvenc_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct rkvenc_core *core;
 	struct v4l2_ctrl *avg_qp_ctrl;
+	/* External line buffer, only for pictures wider than 4096 pixels. */
+	struct rkvenc_aux_buf line_buf;
 	void *priv;
 	bool started;
 };
@@ -249,6 +251,8 @@ static inline void rkvenc_or(struct rkvenc_core *core, u32 reg, u32 val)
 int rkvenc_alloc_aux(struct rkvenc_dev *rkvenc, struct rkvenc_aux_buf *buf,
 		     size_t size, bool kernel_mapping);
 void rkvenc_free_aux(struct rkvenc_dev *rkvenc, struct rkvenc_aux_buf *buf);
+int vepu580_alloc_line_buf(struct rkvenc_ctx *ctx);
+void vepu580_free_line_buf(struct rkvenc_ctx *ctx);
 void vepu580_setup_common(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 			  struct rkvenc_run *run);
 void vepu580_setup_me(struct rkvenc_core *core, unsigned int width_mbs,

-- 
2.55.0


