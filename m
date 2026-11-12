Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472285;
	b=c9ouhTgPooM4xUKCorhUf9FykpcoYIW0KmAA4e3vULHph9LhcxLMQQwTy/cSDtIL4zxh
	 7EBt1A+7Vm+Bz679VcFcWb/Jwb3xRrDAYKRL+1PYIXOzQeFwaRZXyu7BPlYhtWUvb7BJk
	 3WWDtMDsl+Y2xBphHTKIRNYIXuUrnVtZRn0d+RRN2AVJjkphQbRV6LByXquDGCX3ZG12l
	 g/XBqBssD00EFK1Og45dt6ibewCMBiu2eTdYo6HB1XVUrLP5r9VP7kjje5qzec4pXjljm
	 0WBDOK2pKGIAMRedMe7pyY3h5ZLKtR9N8+pMJc0zPS3d1GcVFOqMgxZ640eqhH1U8fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472285;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=;
	b=DTPQ6vyUrmyV9DQP3t5t4Hlnk+vTgZq1hlJXaENuQMR+nYzVrScDnHvCj75pJo2oHNVY
	 6S43tbeUGrUS5mk+d1zTtrYsMZ7Je6PHA4nbKwJnTKhxNXCaLwcfWYz3I+dl97gpq+dyv
	 esVsm14c0WOesHdKwXsEL+PKMXq71fXGCECVw6ac3vAPKLVqi0x7/TPbeceM05PqhxfiC
	 8N3raU9cFx7Qhid37rkfW1RYLvbb1BRJdRddKdG+67Qb32ooyISfexg+v0aKBOxLBd4oM
	 KsOEuWXmmgYgEeW6tKEgV7zeFRWIe4BRpZFEnW9tI5pZ2IPaWcdofHqnYenjSs+LNhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYCVeqap;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44383606A8B9;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYCVeqap
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472284;
	b=K2XqMwKdRb1cDFWMNnKsXIK5kWOSbY9fQKeZw8HU//fOeuvxcuJel/e6CuXPt1jK9fUY
	 hTdCSVQc2nS34uUQFqtPSvVXF6OHWVLbeekIVu8N+JUv7sBow0rarc40IhmI61+shX45p
	 gZVJ3kNDYhFLhxGjUNiDes8/vU+dGSHLpy9Xi2FRYb2vvlwv0BkKYNXaJqrjplD7JMqV/
	 cvJqlH8YJs2N73fwi/aULZTHfiHY3Sh1cCTQ5eqa+lXQKnduu0rjMUnbvJ07+T+lOGTUP
	 BlT5Jn5LqWA6daGv1PfM7B5Tfy9ZVi1vzuhIwYKhLsU/plgWBdFxA/NeIGMLmpR2ABg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472284;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=;
	b=20r3iKn0C9qpG5zhyl50RdWF17DF7aGm9rwME2oEv6dwoosWe25iQuTleZPoOIauklLO
	 /W8EgTWyayTrsXBeR9YTFN+eUT9Bq7+LwhVTtaXIvdNqtQcXm0UvZwJl5nGg/g7jK+SU5
	 rRARlZeN6gNxAvfyuxtVIJCqQaFnNeOLIvGxIca1mXHNOP6QliHErfpOPibfjLA2/7G2+
	 3hVsWL/bg9LD3kE2efyMwKCRcBKwT6Lw9/8cVe9DrXF83ZKLWSgvJe1s/FhABhl1bMrIQ
	 DKjg+HAkUySz9dlW7T2hA54nSDelIIKiO2lIeuRwJCjGU322wZ9AHOdyzTEUu3oS2OQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E7101F00A07;
	Thu, 12 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472284;
	bh=fOPM3hh4LBz83e4Z7YTPZTeWTsOtBzW6zMBgimSztBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hYCVeqaputOPHq1bAedt4CpHmKQlWY2iN0yj1cqPMNQinvkGeYPmzuG2rzRhiVACu
	 DdT6J6PioBzvyBeqJZtwZ8ecGXWV0vsgP4vSMEtk+ILiEm4eD7ETr2ar4mXZ8tpRWf
	 3ARFw2J1k7OxP7BtQMLSNIGMt0lMmV7tQBsfJCg4sdfnK7LNpxWCrSrAEPGljQJm9J
	 s7zWJcapt/kBZnYmLTQxa9+JsJcjRhiuop5ugoMCzW1i34STx3VlIhmvp5agnhyU1j
	 z8BXoSxO2s9Wr28VIAoRZHdikSgDniPMJEewPRew5TJ5E87dPMDwv4bXAXFl9XJwae
	 H4ikhmnB5KA+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 90CE549385;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:24 +0000
Subject: [PATCH v2 2/7] media: verisilicon: Enforce a minimum CAPTURE
 sizeimage for the encoder
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
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-2-de03e643c75d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472282; l=2439;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YQ5ecCRUVeVgOkI6N/CRbGwzdtVVxR9e29iInCuRPn8=;
 b=DkBGBOuCHyV4Q9kcGGxhfFctCWJWujliWLY1tlsvqCTAWl/NgbBA4xFiJNhh42o61ZSQZb2IM
 ddR4yNNre0BDrCvUPL2CmBJzW3PAQcLJ96AuYR7L/kpWKTsfwggoCTm
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For coded formats hantro_try_fmt() only computes sizeimage when the
application passes 0, and otherwise accepts any value. On the encoder
that lets the CAPTURE buffers be far too small for the selected
resolution.

This is easy to hit: "v4l2-ctl --set-fmt-video=width=1920,height=1080,
pixelformat=JPEG" does G_FMT, modifies the size and calls S_FMT, so it
passes back the 6768 byte sizeimage of the 96x32 default format. The
driver accepts it for 1920x1088, the hardware runs out of stream buffer
on every frame and the encoder only produces empty buffers.

The stateful encoder specification lets the encoder adjust sizeimage to
match hardware requirements. For the encoder, clamp the requested
sizeimage up to the size already used as the default, while still
allowing applications to ask for larger buffers. The decoder behaviour
is unchanged.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index d033fe0ecef6..c4e36a79eecc 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,25 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_av1_mv_size(pix_mp->width,
 						   pix_mp->height);
-	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+	} else {
+		u32 max_size = fmt->header_size +
+			pix_mp->width * pix_mp->height * fmt->max_depth;
+		u32 *sizeimage = &pix_mp->plane_fmt[0].sizeimage;
+
 		/*
 		 * For coded formats the application can specify
 		 * sizeimage. If the application passes a zero sizeimage,
 		 * let's default to the maximum frame size.
+		 *
+		 * On the encoder, a buffer that is too small for the
+		 * current resolution only gives failed frames, so never
+		 * let the application go below that default. Larger
+		 * values are kept.
 		 */
-		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
-			pix_mp->width * pix_mp->height * fmt->max_depth;
+		if (ctx->is_encoder)
+			*sizeimage = max(*sizeimage, max_size);
+		else if (!*sizeimage)
+			*sizeimage = max_size;
 	}
 
 	return 0;

-- 
2.55.0


