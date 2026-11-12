Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472287;
	b=AVzZUONghZLYro1LcvC7O1J1LBWeuGYqFgyG3N+EdhqwXkRobgJ/rO6UG8IqLySQ+/s9
	 OhV3CnTT0QFwDXcW9U+je9D55VSBiRkHvv6zscaRTNPvrkRwkQYSSOzzOB7UTzTfER0Hb
	 xebGGGDXkvBAvTzkymTp+FO7lgFwepraJFrJamnRajANEs5craOIenpmzJg0lqr0hpkGb
	 I1odIAIUcaZ9sN3+7oE4rqK1KnMHiQX+vyXIwDYpmoncu0UXsMx2hBxSMPi0/tlWc9r93
	 JHErSW1E4Kp7A9mbew3xlDlsKHF/Q1TZHVkQF/oLPyQa0auHh+NllmwtW7xWzSbd0uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472287;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=;
	b=tbKRaZjpq5yyT6udpg8+JjN7e3wFj8fUNwIYP3xo266DMF4V933NK6FUmVYdX47xt3PL
	 m8DL8YPVYT2HdUKebOIL6YXMiYsN4w+oehBDF7ZVBQs2cK2DeyDdDOK851jSkWge+q1MA
	 5rqf0yCy+oA2IF0SU+ZlWBOaPlMFtmVZ+YrGl/d0ZzYEDS4rKJrT/URBg6kLJM0gghEe7
	 48GVhDffmmVxLWXlZpJ0om+xukzjTMSI/hYpF+C3CIb4K+e6Q1fTrg/JJwnrqjc1LQkzf
	 Og8nZgdfAN0HsfgWV0KQ4OecoyQAbmul+sJZOm4ZmYzgBXVIZys32rmUxqJ/9p+W6wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAHfxLIm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBE60A5BC8;
	Thu, 12 Nov 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAHfxLIm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472287;
	b=VZ0utsh1rSurgth5PxlSRAfZYzEiiaZ1n9WfXMMiDDBpdrVtwohoTFXhypSkRZ3h19XO
	 jl6C2wbAkZwqsiNwKzDLT32DeLUTEYVVJKnJJ+t4vF6eYCMVLwk3qnQSH/RqwCkdKfUJr
	 OEB/el6R7N9tdoLdTeZudT1T/RFa26geLgvwkrq4Xoy2ToWk9oTzH9NH21fKHqb6v/k9i
	 cuQZyBeH38Hj4rg+gzjEghfAknp69emgzKc+FytVfMKTzc5v/TddWc21LXdKGXpzCr0El
	 CKZY3r2YMJjZE2DJYHrSIwletFg1JldnltQI/oPYz5XNZnOf8HP7VhNHCpZ5airx78g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472287;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=;
	b=hhEvkaH0S8FA8QTz15XVbjN6vgCKP6i8N/J5Qf6cm2/dSHgymdWEYKVqQvxFrtZ5n6wY
	 Qfa1LFGzbp1XS3mVp56186r+5awWRz0dOJkGcrXAIh5rN0HrIpJus6adZbXCve9N/FgZk
	 WgUDcydmeVzGlLFnZostb0rzjQ24xsaoVHeXmRxoyqtFVGTr4eivuKEftL/pTIc5EW7OR
	 B9GGeOLU95SiksnnlQbAa2Y2NQzBavz0IDnSw+bV+104sUD3qiCZqcGQq6oV7R8zelhTX
	 9IW9MsjxE56cIgG8QBMbQ+pF67y+EOCEYNwP5elv+9+GIZyEIONa6AHoSpYLaI6+2GQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F97F1F00A05;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472287;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CAHfxLImwm/w6LMZEOQs0vfa++W8YLZM2O84WeRSSfuufSdsq7zFemnOe73A/2Cbn
	 PDVjCl+ZcFggufKtZ02glaXKTmslPZkC3t1/BD2lFThqAoNzshkYh+1wRgSyZ0VLgU
	 c/momqbT5R0j+nvQ5JwbJc/jlN41YeVDC/KPTfOqjBSso0PnqsYjqJ7EprjbH9zxKV
	 RscixNgN0JxFeVDe4ULvXeKrlM+SxprGO5C6XlkWMZExtVd5zx5VhOqmtMt5bV5saj
	 PhD9PiVa+uFRrWtzyYPY25LQ23IzLIDeov2vj2PLsaLGSemfIpD2Gn/zAfmfwzYg8l
	 1njgBydm/FyRA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD950493A2;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:28 +0000
Subject: [PATCH v2 6/7] media: verisilicon: Don't reset the encoder raw
 format while OUTPUT buffers exist
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
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-6-de03e643c75d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472283; l=5213;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=NvWLsoYjF8H/jW8URNFkSbK/PgqFx88YkKipI7WobH4=;
 b=opKVutUysf8SZuTFjmHZMaBipKT2oJM6M2rbma++cqwWub8gooXWEXSmEj9J4EE6hBgRjLjls
 Xo21081UJWCCzmTqp8pNkXxQziJu+aYdWCvUcAHzyK2+ev4PQvkaPu1
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
raw format before hantro_set_fmt_out() refuses the change with -EBUSY
(the OUTPUT queue is busy). hantro_set_fmt_cap() ignores that error, so
the ioctl succeeds but leaves the context inconsistent: ctx->src_fmt
still describes the negotiated raw format (e.g. NM12, two planes) while
ctx->vpu_src_fmt describes the default one (YM12, three planes).

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

The raw format has been reset under allocated OUTPUT buffers since the
encoder was added. Since commit 14b4bd01f8e5 ("media: verisilicon:
Additional fix for the crash when opening the driver") only the
descriptor is reset, which gives the mismatch described above.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Fixes: 14b4bd01f8e5 ("media: verisilicon: Additional fix for the crash when opening the driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 11bce0cdf4b3..a40abe2c459f 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -471,7 +471,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 int
 hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 {
-	const struct hantro_fmt *raw_vpu_fmt;
+	const struct hantro_fmt *raw_vpu_fmt, *old_vpu_src_fmt = NULL;
 	struct v4l2_pix_format_mplane raw_fmt, *encoded_fmt;
 	int ret;
 
@@ -481,6 +481,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 
 	if (ctx->is_encoder) {
 		encoded_fmt = &ctx->dst_fmt;
+		old_vpu_src_fmt = ctx->vpu_src_fmt;
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 	} else {
 		encoded_fmt = &ctx->src_fmt;
@@ -497,6 +498,12 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
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
@@ -643,6 +650,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp)
 {
+	bool reset_raw_fmt = ctx->is_encoder;
 	int ret;
 
 	if (ctx->is_encoder) {
@@ -661,11 +669,22 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
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
@@ -687,7 +706,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (ctx->is_encoder)
+	if (reset_raw_fmt)
 		hantro_reset_raw_fmt(ctx, HANTRO_DEFAULT_BIT_DEPTH, HANTRO_AUTO_POSTPROC);
 
 	/* Colorimetry information are always propagated. */

-- 
2.55.0


