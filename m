Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295078;
	b=PRcNNsHwtlVZDuV6bVjPc/3rC3q1oc/eY9UI3aDAOMDbCKU35/kJQHY8Ggylih2bB/6x
	 JyWqBKXM0lqnAhS5J5Jsf55UuPBydIyOx40+VRtJLpaaSlnJAIVBDOD4tdy3adk5T91av
	 +1sTsDWCrtgurv+gDuKzpsWorEn5FZBLIxb+OkQTA4MfqqBU1l5kDJlSejs4A0CEQNrJh
	 qBnXRoxVbplUUzf4VXDOtOPz9T3NjbH8HEt0NP4ot0x/37kbUbI7Kb03atqmrwQeDORpj
	 Qj/lVH0D1rcA6ipEXgLRR0RJFdOr9IKORN5ZsUdsgCUoG67ab7wF8v4lzWnyzhBWQuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295078;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=;
	b=xjzpEg7wsTtlXGaisLzkn7UWcbB5yXiFWcSM7rsptu5L3czfz3P8rd+Nt95UDA7/dB/V
	 dPGqZH9b9FWBJqzdZgNunBZ2o9/+vMQsYHf5Hle0m2M2/9I5/q+yW/RfK4tLoF29S6TxU
	 h83jo3DKwL1gpl74XXJKCxQnKIQBQ1gpKnlZ2OT5MXQuSxz5S6qnZt6uD7WjLhC91baKb
	 APVg9MPF1QA0ipms+TwFKZq4YrnOwOlL6E3rEjvU6nq6TaicGdNe/hCZY/GbFNsjfjsSs
	 q6EyrDuqTXP7zzTWr0hRQcFaWOdvruPCjyMjn3ONOKlG9KQus0HF/o899AYLEOfQXuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+etW16e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407960A3833;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+etW16e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295077;
	b=IC1ji7fHoUXbVCY4IjbAL2wwW7ENHWWQ0L7IbKRfN4d8mr0Iid0PCij0lFqVSQdVSFZj
	 LrqSSGhtmezOYIBMs+oXN+GwOqEcgk1fS7n0MKto+9WA75IkOjXVE7y06wCKalkQa/DYm
	 oojBPyo5VkbM4ovnwz2LS70yWp2cOCEd3zUUl9rPfr6+o/fvyyMsNJ2kuu9Ar6i+DarQu
	 ZTcIDvD0A2RkfB6Bxiv46KpntPr2ccp/KCjtUBVm46eRX/nYzVOQEHglgi2ckFTo9t5Li
	 z9Yei5AdIy3K989o3Ev6tyPcUnCa/Cwkd8VpUSeu9MC4VcZ8ltJv064ghc0lZl3HAsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295077;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=;
	b=CKjcBWY4w8STpSFmJUwsbZ4uiymQG8ikP430WgqI7SFkcEFqIgF+TVqx+Qxs4Fnh5v/S
	 rvvn1Xn+74pufZbf+Nr3EEDE9wlP0/W6FBoICs5wZP6aoqcf+7ZWEP1C69/mfHf6SMHsv
	 wKGXbaoUw2n4jUPoEgQL2n/vdqf5LLNeoEolw+3HR3+VZ1GYBgC7UBKqNyw645H9w58OE
	 ydNl7684nf7QTLWtTsFJCf7lS/xOpmkJs8J/bSp00Y5eDwOZpGCv1nkyxbW5SqzVKFmjb
	 80r49xnh/5BqzQXsT+iIfHdO9s9TNa4wEABOLGbIguzXu59KvB6djn0mblRStlVqv1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 849A41F00900;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295077;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L+etW16eG4+4VkLtKAey3K9Il+00A7ulPzRiUHYK0zwbWY4qW6Sl7Gyeej4PupoPU
	 Rrzkj9+4z1pCd8k2OvmqHWg9r7yVM0P7l+uK8ZuCznl14Zuuh6dcz55uZcqGnUSZr5
	 UveUqqpmNjrYtj84skD1UYsPk+KXa4Rhp4lcJQ2dSSM+4ZokNM/djEubGYY5HS0OWf
	 zX1dwhAbRBR97VhFTtRMaoa8B7ctvDyU6hxkKdV1kJGkUScc9xJHrZaht1/VYddITS
	 qX4wqN2NQFQ5VdUW4Msu7+pkbwr4Olyw7g8+79PXoBD68Kj8Zb379QG/KdkQnnUiie
	 mtRraqe5AV9fA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17F4C48986;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:56 +0000
Subject: [PATCH 1/6] media: verisilicon: Enforce a minimum CAPTURE
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
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-1-fc4dc7e985d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=2359;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JZp96kO/mnNire/RWZRp8mhzguO6gPrOB+RSbq8LmyE=;
 b=GbglH2henZdZbatiRF3yY1AIw0wsgD91zd+CE6dFqdxAa6CQ9mIlW7YOuHV06xHuLDEKep/PX
 H5R85Dp/SW4AAeNQy0bqYU91qBlwXMq8eUa2JVAEJ57N9wj7NLD/zsz
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
sizeimage up to the worst-case frame size already used as the default,
while still allowing applications to ask for larger buffers. The
decoder behaviour is unchanged.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..c022b978f72b 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,24 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
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
+		 * The encoder must also be able to fit the worst-case
+		 * frame for the current resolution, so never let the
+		 * application go below it. Larger values are kept.
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


