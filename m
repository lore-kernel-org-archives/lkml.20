Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305291;
	b=GF6XwJcXlGXH+wGKv2Z8fWARKr4WavsEXlxAt59X2KnpuqeAvx4LDzY1E9gcHW8EQWeX
	 w4gSZoGjevy5mcpdBLi6S+tefllRHZbUjOPIsND1q+dfDaxb3bWKhHEebP3wTY9w59r7g
	 0cIh0cjUUi8cO91UPhJ9d1YqNlzorIG6GtgpeK0C1WmDuA81m0BLA0O+gPTaHBPb99ZHt
	 GhuNQ/oZ/hnwbHw2zSPZEdvGVhqfke/rLSe8znmHAdmFUgCDGh7sjXl28c9EzwLlQhOHj
	 4PXqtenWlhARQYjob+Crj0sAXR/xaZVb7Z4R9Cu4B6yPX0zbR5diCfJAfRgy2OoqxHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305291;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=;
	b=3M4ycL6ZiEJHpqEMcMYGbftSVuc4fhuKkOfCvbGleXKODGmctgeSYI9SQHu6NJefhQXn
	 svyOqS+n+E9pPAFvZym6FRF0/Zt31LWM0+2GIjvf0It6/pqZbh7kfRQ8hyMajykpnrUh1
	 sGCWVfmcOIDCrPSdM1TAkQ42XmOQZj+nukkACgxHCv+kagMjlME37hZ9oXUpSzIht0eio
	 A0LiL7SRaWmUaBL3X4V+2+RHUaAMeKLXGHaku/8tGbRqwPAHuoXcMevrOhw31G+iOe3rm
	 G9PzkRQuyr956ySQLS57JneVPyso4FvpnnWb9xGb9MPtrxADtexPQ9ZNKVxdKxLi4tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1OuxHm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBEF60A3806;
	Tue, 10 Nov 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1OuxHm8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305290;
	b=Cltzq1OiQ31vKNj5q6tBgtuytmY9nYMOpBSdy+DN3Jn7E+h8eLT6JKzjBR/tsfRX+dTw
	 DbOlene3s43d+QJP7AEheG8+ElUVfw35hPAYVOfAh2WIAk1JD5P+KLANM2d3Tf0Yh9zH3
	 5MxmprU/LvvpfxhxHbQ4C9E/tFqUo2y/2EM05hRUsh+nbX7Zueqe0y7p+pEtLWLGB6pQU
	 TCsFqLXd7utCy1w6Wg1iyysqV35Zuue+YdGLNR4iuPJrRlo7YW8EORuRU0azJNG8PSQaO
	 3XwYnNlmDXUWDYY3ydTYpJ/wS2+4ozV/Hih8zIgg0yqZyu+zVoiVY/PHcTyVULtFNbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305290;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=;
	b=VOESPx/PowVOrbNLHDviFqtghUG5b3yfkKSwRoxCVIFpVTUhxvTxLd6UPxHdEdVQlTAt
	 HxdJeWi9+YP69NNbc/c/1uBHemavzn7Ij8wCADOwDHl6uqb4K8q2rDOp9ri8IuS6uuw1z
	 dfAk87Uk3E9GHnFE54UZxXPbLDyjR3w5dxVlkdLGBF0w1mFpmL3YHgsN5lG399/sPzBu6
	 /dt7DeBemUAPzwEcFjiK8wwu+H/yZpr8MNFSfd1lFluNbR/ik+AOQ6URpGPBdbqjgvjBO
	 ecuIV7SG8tdSgJA/LjvMHrUnQgyJ9zZ7xJ+bpeo0HN0ouLVk7H41mfiiD2SROrRKjdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56E451F008A1;
	Tue, 10 Nov 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305290;
	bh=Lh32Z30mmHI0PILnepXbAQ166lUKFxf5yfIlmnK4noU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L1OuxHm8VNg5iOdYT/q6ga+2kzYllAvYF8N2zzkji7Ao5EA4UotDnC4cOk1tk886T
	 6ULXZ/mnFYye9czrgyiPtr++Z8T8XNictF1m3rrdF72xRl+iBXCn1wN6xY+ovXkHFK
	 dXefexQzZMtL721dGnWeePbTsRxjvoed2MwF/uKX5Ew31JwYRKwO1viStOgGZMSuBH
	 AjvbJ/SVUpv88meRabC60CeGo5QUm12DiYg2UH2dBf1DD9d9EgBHk+uZV0dwUsRFMu
	 tl9/fByuP3VGvo7Iq6kO8iLH/cajzwtPBDxmyY+TJdBKR5ZRaC1YZHD2/hsweyo8+6
	 NMjDsLCKMN1qA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0EEC848AEB;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:13 +0000
Subject: [PATCH RFC 11/12] media: rockchip: rkvenc: Offer VBR for H.264
 encoding
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
Message-Id: <20261110-rkvenc-v1-11-ea8b47122d8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=2309;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JF9FEhr+Fnv76x4udoa/NyLN+ajs26dykYgNbWUENQo=;
 b=RzAbjJ74L7b+RRhiG7UT37yP7BGoU6GeGywkhjOgqEOVXxXNrH0bqsfUP8SikAg1F4XkcPxx5
 x5LRkXw7TtiA4hD1pDWP1uz5bWPWEnEWOQvoUHWA2WuafXj4OG9P3wg
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The H.264 encode core has a variable bitrate mode now. Offer it in
V4L2_CID_MPEG_VIDEO_BITRATE_MODE and add V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
which the core reads for it (default 20 Mbit/s, twice the default
bitrate), and hand the size target of the variable bitrate pictures to the
hardware row rate control as for constant bitrate.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
index fcb8c070ab30..313c33038670 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
@@ -381,11 +381,13 @@ static int rkvenc_h264_run(struct rkvenc_ctx *ctx, struct rkvenc_core *core,
 	vepu580_setup_h264_tuning(ctx->dev, core, intra);
 
 	/*
-	 * In CBR mode the frame size target of the rate control is handed to
-	 * the hardware row rate control, which adapts the QP of each
+	 * In CBR and VBR mode the frame size target of the rate control is
+	 * handed to the hardware row rate control, which adapts the QP of each
 	 * macroblock row by up to the row_rc_qp_range parameter.
 	 */
-	h264->hw_rc = rc->mode && rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR &&
+	h264->hw_rc = rc->mode &&
+		      (rc->mode->type == V4L2_H264_ENC_RC_TYPE_CBR ||
+		       rc->mode->type == V4L2_H264_ENC_RC_TYPE_VBR) &&
 		      READ_ONCE(rkvenc_row_rc_qp_range);
 	if (h264->hw_rc)
 		vepu580_setup_row_rc(core, &vepu580_h264_row_rc, rc->qp,
@@ -466,12 +468,15 @@ static const struct v4l2_ctrl_config rkvenc_h264_ctrl_cfgs[] = {
 		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
 		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
 		.def = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR),
 	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
 		.min = 10000, .max = 200000000, .step = 1, .def = 10000000,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+		.min = 10000, .max = 200000000, .step = 1, .def = 20000000,
+	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY,
 		.min = 1, .max = 100, .step = 1, .def = 50,

-- 
2.55.0


