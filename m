Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295079;
	b=REmOL5idi5BgJC6b73nv3mrt2zd0ro7o6TzkusZ/rt8c+JeHaora66HSsH8cpA5tOPGh
	 a+V9kb50xk0za8GzOtBEU42WLmfTKm18svC2xv66sVxoBEWQjFZiVdAHtarFj8jzLsnbx
	 cnN64fVr4H9pBZ6K/mm9PHtcwC/LdwH7oFIYTouhg9EYKLSH/UV++ySV1ftS3yemJLO0/
	 dI7npAa3etMZYrfd4DI8O2nZSMliW6U2uqVIKU1Hjm/6IXJs7UINSuS5ePEr+mIGYDe59
	 6asJKrj6PSUwF6IJEUk3LvqFQPonUNa422maFepJ+XMObO8AiqYW30ODX+cnc2xmg5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295079;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MER664wp6WH5mI6S02fIEsQchQGjwcXv11YrimOV7Z0=;
	b=2u/6kr6i0y/gGwljZ6W7ABpaQXdGo022qHjb+I7DlBvsk5m7ELrs5tVtC+ls2dRM4MOx
	 gD/C2rK47HWy1oExbx+tmHwwEle7kBhTC1U0Xcy3Yl7YqW0a4uj0WTGl0r5EpscfPmrUG
	 MsFg4g+vNXtxUQW8fLSSEItVN5o07Vf2YhC31iWSQ/YodVBGyfOYAI7YfKyVCwB0ZSynF
	 WzFRfYiGQdMuao4W6C8OAx+uHWSdkbEW4muQTOlRjR875UdWMKTKd2kZGi1axFnvHJ6LX
	 NEb4QyOjAo1OcmlJ2OkbFrwsAOi/9DMo5QC+7CmcdvtvwQpdprX/DBf5poUuLQLXeZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvUP8+bz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B060A5BC5;
	Tue, 10 Nov 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvUP8+bz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295078;
	b=YiZbOkc/x01jDrHuOudT618PMVbG6ENYdN0TStJg6cxaWdAzqWPX3LNXkcOg8ZWf9zfO
	 8HxCD12C2YqHedBEn8aKpw7YVoLYazjfmzMypzfQwhQu/LOOzkxmAXHMLhThsW3/gImWX
	 Maro2+nY+t63l93E1zHZ8dFbyhxioxC/UX+JYoJvXXOYB/Ai4+pocdG9SZpH5xtaN9HVh
	 BZwBmicLTKsXeL6lMXV0uTOvud8lUtxke9KBWQzELeR/0UuFStBbBkx43HeDw/nSZgxEg
	 UPGETVvi7PIiFL6DYfnT00wJPlLt7zzLLIumqtQWIZWKeGMkzOee4Yd/R4wUqzUZDHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295078;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MER664wp6WH5mI6S02fIEsQchQGjwcXv11YrimOV7Z0=;
	b=ZYRXeC2XwMu2O11yz0wJ+QxfrYu4seBqwLQCAMJterpGpltUulCzdOOrRNShitjq61LJ
	 0l7xishXUR1a3NeArQENliIOsFU+Z8sIGZ/W8pZSz0VYy78um52Ea8DfEIARV3HfnP/sU
	 j9h4oogFL7bLWiMXWjETovNSjw7Dvfh8Cn8+gLDAH61/NKeoyggfgttnSe0bFuoEQOAlC
	 2NpZ6e7BHYfYmV9B/RQDws38tI+LVssQlm27+QiK6dfpFm3FGmv0Dc1hXaupbYAUguqs4
	 d5ufndrjLTZHryJudSOM0ow+ojeqQSyovJtUDpOxCajlhEVyf1h0R2vDgGnsqz3vsTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B60C81F008BD;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295078;
	bh=MER664wp6WH5mI6S02fIEsQchQGjwcXv11YrimOV7Z0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mvUP8+bz+hgAdpeOY7mAqf6jOL3jAHShwN3uMzHXuwk9RYY4tD1ba2XuiGwOm09Eq
	 BJlefvw9lGEAH+Mdxd0KwnYYhfB5BAr5Y31ObBVg23cBXRnbtbp/SvrkUdriTXG1Le
	 Oy7joazb8O7/qeLU05goXxd1II/MnM9sYYwrcuM+D7j9mTpILn4xZqLHmRRw1tHin2
	 aT6jiD2ycY/jGoKvspjgrw4SvQOgXzLVAoPOTK6v/0x7WLvu5WCi30VR91vryYSoID
	 t2X73fI95gWL+bkrL01P7NPpEceE10q1G0ZSfzXAQydvBeGI+wV4xrZaJo/BPCbKCN
	 MdVtp28gGMfQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5FAB848998;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:00 +0000
Subject: [PATCH 5/6] media: verisilicon: Don't reset the encoder raw format
 while OUTPUT buffers exist
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
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-5-fc4dc7e985d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=4809;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6ZAkyJS2xXZVjmfyUwqoguzm2MWh0Tv8oryah8QSDZw=;
 b=M/D7QYQlGPBD7LO5ikSRpoRG7kPotoeDdytjtgSMB0/SkiDUjHXbHZEqYumv6nfOPEP6Uxai4
 rJNZ2jysBzNDzDdsrw2X0YxCtZOiQ6HxDtjYdSPalMSb3UWRNnZIptn
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For an encoder, hantro_set_fmt_cap() allows S_FMT on the CAPTURE queue
while the OUTPUT queue has buffers as long as the coded pixel format and
size don't change, and then unconditionally resets the raw format through
hantro_reset_raw_fmt(). That helper sets ctx->vpu_src_fmt to the default
raw format before hantro_set_fmt_out() can refuse the change with -EBUSY
(the OUTPUT queue is busy), so the ioctl fails but leaves the context
inconsistent: ctx->src_fmt still describes the negotiated raw format
(e.g. NM12, two planes) while ctx->vpu_src_fmt describes the default one
(YM12, three planes).

The next job then programs the hardware with the wrong input format: on
the RK3588 VEPU121 JPEG encoder the third plane address is never written,
the encoder reads the V plane from IOVA 0 and the job ends in an IOMMU
page fault and a watchdog timeout. v4l2-ctl triggers this on every
--stream-mmap run, because it re-applies the CAPTURE format after the
OUTPUT queue has been set up:

  rk_iommu fdba0800.iommu: Page fault at 0x0000000000000000 of type read
  rk_iommu fdba0800.iommu: Page fault at 0x00000000000003c0 of type read
  ...
  hantro_watchdog:208: frame processing timed out!

Skip the raw format reset when OUTPUT buffers exist: the coded format is
unchanged in that case, so the raw format stays valid, and the S_FMT is
accepted as the busy check intends. Also restore ctx->vpu_src_fmt in
hantro_reset_raw_fmt() when hantro_set_fmt_out() fails, so that no other
caller can leave the two descriptors out of sync.

Fixes: 5980d40276b3 ("media: hantro: Cleanup format negotiation helpers")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2761d37af7cd..ce01ec6ea33d 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -470,7 +470,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 int
 hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 {
-	const struct hantro_fmt *raw_vpu_fmt;
+	const struct hantro_fmt *raw_vpu_fmt, *old_vpu_src_fmt = NULL;
 	struct v4l2_pix_format_mplane raw_fmt, *encoded_fmt;
 	int ret;
 
@@ -480,6 +480,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 
 	if (ctx->is_encoder) {
 		encoded_fmt = &ctx->dst_fmt;
+		old_vpu_src_fmt = ctx->vpu_src_fmt;
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 	} else {
 		encoded_fmt = &ctx->src_fmt;
@@ -496,6 +497,12 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 	if (!ret) {
 		ctx->bit_depth = bit_depth;
 		ctx->need_postproc = need_postproc;
+	} else if (ctx->is_encoder) {
+		/*
+		 * hantro_set_fmt_out() refused the new raw format, so the
+		 * OUTPUT format is unchanged: keep its descriptor in sync.
+		 */
+		ctx->vpu_src_fmt = old_vpu_src_fmt;
 	}
 
 	return ret;
@@ -642,6 +649,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp)
 {
+	bool reset_raw_fmt = ctx->is_encoder;
 	int ret;
 
 	if (ctx->is_encoder) {
@@ -654,11 +662,22 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 		 */
 		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (vb2_is_busy(peer_vq) &&
-		    (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
-		     pix_mp->height != ctx->dst_fmt.height ||
-		     pix_mp->width != ctx->dst_fmt.width))
-			return -EBUSY;
+		if (vb2_is_busy(peer_vq)) {
+			if (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
+			    pix_mp->height != ctx->dst_fmt.height ||
+			    pix_mp->width != ctx->dst_fmt.width)
+				return -EBUSY;
+
+			/*
+			 * The coded format is unchanged, so the raw format
+			 * stays valid. It couldn't be reset anyway while
+			 * OUTPUT buffers exist (hantro_set_fmt_out() would
+			 * refuse), and failing here after the coded format
+			 * has been updated would leave the context
+			 * inconsistent.
+			 */
+			reset_raw_fmt = false;
+		}
 	}
 
 	ret = hantro_try_fmt(ctx, pix_mp, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -680,7 +699,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (ctx->is_encoder)
+	if (reset_raw_fmt)
 		hantro_reset_raw_fmt(ctx, HANTRO_DEFAULT_BIT_DEPTH, HANTRO_AUTO_POSTPROC);
 
 	/* Colorimetry information are always propagated. */

-- 
2.55.0


