Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295079;
	b=jiw4VFuZTn+wendkU3/x5mkULTv32viZhinrXZJ+jUCxxFRpitTKETZDnf7hc/XKd7j5
	 d4NOyJsebt385klHcSzgC6qkJmKi4oxk8iGsxh6FzaRdi/LiCBptwJN3teSpiOVN2BbtY
	 Q8uiLSGuWwbOET48dpuiRnkCOaarY9wFhm5eP14gSHYEXorozl/BeDAiFyBUdpSk+u4cX
	 lJ1veFKtdjVfJQHxVlfiQ9QU+KS8VLcggQdE5hQri4UMcoCRajrdHPnj89oIOeSXRGBjO
	 HRUv6l9jA6OrwLEWXlM+n6YdSyo6CBbKfk/PJWQPbdNKomTnmFZGKgRQm32F9e3ubEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295079;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tmHyG/dUxvOvFp8lO7nqG0nGDVsV7Z5Irxf5ljp7SEw=;
	b=XBfQG2QQ4+Yf6jKNytqcxLdrlUZutWNT56u86noVSTGZsZ3vgI43sdoVTn99uKz3vgmh
	 nu6tDTqUXq0wmQE6Aii1aYalQZ9lSrzT2gsdQ2FgAbURI+STSiBAgQNzK05YZY0or7ju/
	 HXuDnLYyEEaoPH5xiW3SxVHzuB+kQ+apPdw41ndLUiQ8qG4UbOOedPd/XDVdbCoocNxm+
	 c/RA/SGQTQGyTfGulmODQU1P2mEJ7GVRHtpJduyyiqz78Z1Ipu39E0d0bRJ77zpDHnTwv
	 9at/GtstelnsZ7DRxfuxgmqn/iX0OJVD00sr7OF17jxtY6o8hYKHgpswIEhfITm53ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SDqAmK/z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530960A5BCE;
	Tue, 10 Nov 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDqAmK/z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295079;
	b=puIouzSzyy8+jrR1aKJ+s+e5lJ9wFBWLF7WtiHNLgRc8TqU0qLMzL4Pls7OKARIqKTad
	 MYY6Dg6uPIPnm86vf7ua6fFYCs6nNCPL+iaih3yQSWU4tezlpaB19DsNckwoBs9KG9kYt
	 KePrzNoSI8iApxczZlElTQ0jpBN+1vdUzcATMBj8AjDLDe7nc6bP1g+Pjmp5OLbtd/yyh
	 Y+fDC7axt/UFAzsCD0vPYFu+ZgaUGxtmt1BnFqJ/ZvCZ2N4lxY77O/63vgL7KHFfAbljb
	 JyeBYTs0IsUbC88oaJ1pmEBHkujkaGIos5zM7an9l3Wqt3T29hjXrOzSEbECpMXtWug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295079;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tmHyG/dUxvOvFp8lO7nqG0nGDVsV7Z5Irxf5ljp7SEw=;
	b=eVOoUBunbsPiKBIcAlobMZIZARafxPN77wdkBl0KzYSRvftMXU8wcPTDVWBO/D1dDD92
	 p7waJBVdyLHqYARrtxS+mnbB7f0EEXRMlz5z/0Hf/V+sfj4l+bHMFf7NbNVplinneXCr8
	 +TMM9xt3xhxvMTB0P2UURKp1sfhKOteIFm5s3/+sJkZAIYrQIVclRODn9mk9uYqoJ1wui
	 tjviAkorpiV+/pI7qiWjDYDl0tTVoPv4o2fD0XAnlAstf2D3qF2RXMO9aeMN1EQ0MxQL8
	 t4kOWvFsBfjArjzqhIGuWSzpDFOhpz+oIao+vBOAwuTnKuGb/ALDHs1P7QgbrU/Ic8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95A631F00901;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295079;
	bh=tmHyG/dUxvOvFp8lO7nqG0nGDVsV7Z5Irxf5ljp7SEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SDqAmK/ztH2svN5R8xoJrG7CeQPxz4K0xPX9YTgNEbVwV50AerY+dKnvwfewBCtJJ
	 EJkDOehyfEIab/C3SEg4ydgEF9FdfskJn3kCUjm9lxOj+tRtAv9Snscj4Fo8LueyZP
	 LJk+tmomxTEa3S1TGrZRpEWN8SCrIsC82XWrDr/KOl050iensGki/eZDw6LFgBuIdf
	 wQoGO/Jfy/ewcw3rVcnT9LqYoKXCRaFTHr4dJDmAJncMBZ6EKodkiFVKca6n3nQPdE
	 IDnN7hsCwt2Tdcw8tIyZ/OLrkvriBI+pR+0pgSs31wJhDcjIzlk0c7dLwJUVxiP+QG
	 YPdRQtPy4qDfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 29EAA48982;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:57 +0000
Subject: [PATCH 2/6] media: verisilicon: Keep the encoder coded size in
 sync with OUTPUT
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
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-2-fc4dc7e985d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=3508;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=8CL78lP1zbfblnuwBB1CozKPfWypLHdbDLFXHop9x3E=;
 b=QaHOck0+KthvnjtsENcwU65wIMds6gwzLy02ycZ1p9iUovawZh5shgaxv3k3MGxal52dV8U85
 9KSWIbGQUcZDjVa0thDyvpViWcdd/Z3F8TahoFYexu9Qu0kruP/pT7P
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On the encoder, setting the CAPTURE (coded) format resets the OUTPUT
(raw) format to the same size, but setting the OUTPUT format never
updates the CAPTURE format. Following the order mandated by the
stateful encoder specification (CAPTURE first, then OUTPUT) therefore
leaves the coded size at whatever it was before, e.g. the 96x32
default:

  v4l2-ctl --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
           --set-fmt-video=pixelformat=JPEG --stream-out-mmap ...

ends up with a 1920x1088 OUTPUT format and a 96x32 CAPTURE format with
a 96x32 sized buffer. The JPEG encoders treat the difference between
the two as the crop inside the last macroblock, which is expected to be
below 16 pixels, and program the hardware with the full OUTPUT frame
size. On RK3588 this results in IOMMU page faults, a frame processing
timeout and a wedged encoder.

The specification says that the CAPTURE width and height are set by the
encoder from the OUTPUT format and selection rectangles, and that
setting the OUTPUT format resets the crop rectangle to the full frame.
Do that in hantro_set_fmt_out(): derive the coded format from the new
OUTPUT size, re-applying the CAPTURE constraints, including the minimum
sizeimage. As the coded format can now change from an OUTPUT S_FMT,
return -EBUSY if this would require bigger CAPTURE buffers than the
ones already allocated.

With this, the coded size can only differ from the OUTPUT size by the
crop set through VIDIOC_S_SELECTION, which is restricted to the last
macroblock.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index c022b978f72b..731182cde643 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -541,6 +541,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp,
 			      bool need_postproc)
 {
+	struct v4l2_pix_format_mplane coded_fmt;
 	struct vb2_queue *vq;
 	int ret;
 
@@ -560,16 +561,41 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 			return -EBUSY;
 		}
 	} else {
+		struct vb2_queue *peer_vq;
+
 		/*
 		 * The encoder doesn't admit a format change if
 		 * there are OUTPUT buffers allocated.
 		 */
 		if (vb2_is_busy(vq))
 			return -EBUSY;
+
+		/*
+		 * Setting the OUTPUT format resets the crop rectangle to
+		 * the full frame, so the coded size becomes the OUTPUT
+		 * size. Refuse the change if it would need bigger
+		 * CAPTURE buffers than the ones already allocated.
+		 */
+		coded_fmt = ctx->dst_fmt;
+		coded_fmt.width = pix_mp->width;
+		coded_fmt.height = pix_mp->height;
+		ret = hantro_try_fmt(ctx, &coded_fmt,
+				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (ret)
+			return ret;
+
+		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (vb2_is_busy(peer_vq) &&
+		    coded_fmt.plane_fmt[0].sizeimage >
+		    ctx->dst_fmt.plane_fmt[0].sizeimage)
+			return -EBUSY;
 	}
 
 	ctx->vpu_src_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	ctx->src_fmt = *pix_mp;
+	if (ctx->is_encoder)
+		ctx->dst_fmt = coded_fmt;
 
 	/*
 	 * Current raw format might have become invalid with newly

-- 
2.55.0


