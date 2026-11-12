Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472286;
	b=buN5hi06kslXQr8yHRcrK36qP3IfakG3ciMVnW9lR3LPG4F8N2op+jo9MFCHI2U9PmRT
	 bDiAFJkY34dWMMkBd0pvq0MIa1YXmJa0fH1UfnCu74lbjNmZUM8O+J9KirsYaU5rD+6Iu
	 S38IZpzUUSZC7ghc/yJ+nTdAjTV1TCG1PQjYU7lROcw7oa0Iuv+gI4Y4GUR6rEcNC+OMH
	 KJmIVRC1CS7m3kEe4y1Q31zsAwFSnHRA0H1I/t5rxHVHksiPJjbbDGJTmsVsl21zoivEJ
	 a95xe5LaI4fm28Dgaqy8jC5ChcC6KdBe/+JbhQZcTTgOKQXHODOZF5rZKAep4Gzqp6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472286;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ivo6GnxvqcFQsSb7RQ/t+gYL/Oay5ELWVtPEYnpBqSc=;
	b=l/XODwOkL4QtlsdScp7oFyhGA6l6l1gybKV37i8F4r/rS4Oj7PVBFrpwx40QdLV7SzI8
	 KQb+ASf0SsTFCOopMqTzOUDGGQ5oxXYHc2zdY8tTzzmLWsosgYfElLAp3Oajy3yFpJYZv
	 GCJNupKIvk8jENpRs4CIkSWwWjlUTBQvzg4IA0NmkQXzu9RjN1rlaxAM6OWGlByZvDrob
	 cTbavFEJi3iEoPQThkPcegOuNRdXAP47yfywMcYnvf5WhpdbtJp5hnyP/enkYP+YEdDJr
	 QwEm8H/RFLmJm2/aecM9ELvLv1tT3kVwzkM6XzrKvekUDmercR5g9LJGZuoXaCVm1TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiPXbOf3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47B460A2614;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiPXbOf3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472285;
	b=mozy9MFUKBeXv7rtd1RN9HRo4eImCcvT0wHiOOQZlt7F1WRprLA6F6wy5CtXC0VS1rcm
	 e4zlBOS7uPVcFWdAME4Fc4I2tlzuRGzr8fOy7f4Y4z6OGcQP3OKDnG2KrX1gdUlZP1kMH
	 FITd8Jbj342eNIvV8kDUISx0vtuGZSVzpRo6hSmxkahxJR6RtfyMHpSuJWP4pf37Ulomn
	 nSV2eiZuoy4icRVr0sA2DcY0R+DagG/PpJUYXO+kfqXXfrOM0xyQbmThV4mW95KQgGH8I
	 Vk1eO3coj1GZ2XS6ML/uXCl1hKm71g4/XBesH6T8EASZgzvBL2Uyshlq6QkTIwhy93Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ivo6GnxvqcFQsSb7RQ/t+gYL/Oay5ELWVtPEYnpBqSc=;
	b=N5OYLUYsCbAFghc2ygR+Dn8pHid6XPClKkQ7QA2/y6orAeCYbmBaelugjxlCz9rL0tOn
	 1X9DX4A7y6C9D180gOiDg3EZ8+bfgZPRRi7LmbgmXLJcaQ2Z39QCovWEFYVTj+HJ70Hzm
	 gitvSpeRqJXa+8tKoFZf1Vm1DNEF+07lkE04emgqdG2rPnCQrKmj70KFnnn6GOUBikmAO
	 bhnqZIvSTagTCCyqC53INBtDI3LATNPgpaR+GC2KIvSl9CQoLR7zZcX7TjURDSzFDO8rc
	 njHX2+EtGlptuUafT32RGxqVRJQrslANei2jGF3LtyKC+A52jwopHqUYUGcV2ilZCBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2587B1F00A08;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472285;
	bh=Ivo6GnxvqcFQsSb7RQ/t+gYL/Oay5ELWVtPEYnpBqSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GiPXbOf3Y2VptxLyD6JqYp6/0z+0n/zZTknmFA9uN7fYxnbRH9m6VhkQbAwVPmTqQ
	 DV5HxbonsqJIufrXV1BdvAHY7A42bxn7DjnHPCTfiiU3nBqljE6So/gq+CI5z7oFcM
	 gCqO+yMYT0pdqk+6UIrfJ+vduNRqmd/WKH8cRQwIcN8hJEzMk4jmNRgWfoRIzkveh7
	 RcOoepNZvfKnbg3PGi6jtG5f3K1d7fhcpfJXuWTxy7c05HEISsI1FAFfgXIP1Ctsbi
	 7FxjVO2ejAqfpkV1KgQbtSG2zMEQHSaDl9Kl3DjPQSTdG1y7mf0OSAnorZ1161EhLd
	 rChCGv9t9j+Pw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A53C049396;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:25 +0000
Subject: [PATCH v2 3/7] media: verisilicon: Keep the encoder coded size in
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
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-3-de03e643c75d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472282; l=3589;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=OJEFqjdZC2EJLo/FyCqrvkQ+A2FOxXjkcSLl5BADKq4=;
 b=3mR9MSso6c0lCPdo4Pm1XntRNu/w47veV1nzKGxRCeSVTaIrZCaTkXVGh8v0BXujR3b5NTRWK
 SwD7iMBGyhmAuiQj7iJIe2l8Id92B6LUIy1q25J9Iy5KtB5q9XQtXIA
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

Fixes: 953aaa1492c5 ("media: rockchip/vpu: Prepare things to support decoders")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index c4e36a79eecc..e9d91504fab2 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -542,6 +542,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp,
 			      bool need_postproc)
 {
+	struct v4l2_pix_format_mplane coded_fmt;
 	struct vb2_queue *vq;
 	int ret;
 
@@ -561,16 +562,41 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
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


