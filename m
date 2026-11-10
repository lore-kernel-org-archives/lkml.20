Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295079;
	b=eFkBnDFTEtY6Fq0tb6r2Atnok7yA2gpcS3M4hrthKU3ZqVMGdDxTcXvqD2kXrwAzJ4Jz
	 AmNOFv7I1RgHM3qljl2xftvC3e173kFfPyn/hYBaep47x825mGjPWNP7Gq5ihUsz+Te7A
	 WciRarKizIrSna4h6Eh81tqHu04JMAmmwE/502r8pbOnCUHa2UAy5fiszVx5wclu+QCpA
	 AT312v2Zsyw9wMKcT3WowhhwxSfd5Hihx8y7A4IY1F0LU9xpWsTakRFxu7E7yh7T7zbLD
	 EQecqzQjx+aUYQoG25cP9OFPyXPymAhnAJkKfoq63oEUsPI3rpA5v6uzJZEbGC2nOAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295079;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	b=lL2nmCZ4IsQfwV39+9vNceq/YR7jVmBmY9qpYFCDtUoqV892dF0YO1T4EQ5XVfOa7/uz
	 UFmektL5Or+iTW3grOTSn4/ABcMC+1t3rEmWjsHHEOE5umUQ3WD+yFthBMejtJu5W6ix+
	 fisuI+4SnRd+lUdH6xu3fPyxAS3eKQ8NJFo9ItVPa8hWZFGaG8G801uGDTZxSPYu4IlF+
	 FvLvenzrI4HCZQ1pAbOcblvD/aJKeKrWtxynk4ALAo1Tvl6F1fuigDGYKeCfxY/5yw4+d
	 Ru1xBtrJHih6jwdh/uYVsYCCaSjdQ+TBNfuAaJuhZbOq3WV9XULxb7wxBVG0rdUwMRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjxjOceq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9960A383B;
	Tue, 10 Nov 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjxjOceq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295078;
	b=2S7GFvhX7dFYIgYA0PMhDCpG98TmBRm33nHhAuqyhsMnzuSPOnLW6mhdulWSejYBa/Zn
	 XgPNg+7KLVkPqlKobKRvzoT+g6JPSsepXUEialxB/OyhyfiJPtas6RPe+8UAMyuzy+j9u
	 tX6D6j6l+O21jVbP101dx70BVYRTEVGGxZEGZf9LeiVUeFuP5au0xJ5+xOA7O10ZXWchi
	 AAkPOJGdEs/HHIwAPYV1MglmDCI/CRGNX1j6I5E989FVzSvCMxwg86CpkCHSgbc7yqIec
	 Meqih73LTMUzSjPD06XMzFL36cqUsUwmh6bSQYWdKO5sf9tux55SooVA8xMzz3wJZdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295078;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	b=SNtQh/AqOkbef1sLFya+S66mJq6Cc6vzjm/5gCiP0jcsq1f645Sl95BTfREiAx+JoDic
	 MwMR+BgSNhJ/ukXa+IlzQ9lWTESGWMMzmEvcB8D5pH8edFtt7hJpAVb8BDJ1xX7YpkZhU
	 JD3norsbE+IXq7v8kZ0M1Cw2PLUzjvCBVSg3Gfg4fAzFjVBF4TJjAcz69dEwnoa/4XxUZ
	 JDsenFwVTL77ZCUts95wcnRswfzhoq9oT4nDodM2N0zG3LM0h0S0znhkVMyAlOfSj6w9A
	 ntqqAI5JeU0XyAuCgIDQklT7UD+7T3IrUjThzu913EEFD314sNG/1RgtZuetEEsbydQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC8741F00902;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295078;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TjxjOceqMKBehH/WOEZMWDJ9zPtXRUgz1CdekNOekeThwasgGoprXaQtK7HJry5rg
	 sifEDi4LVIwPeLK63b2SODEzWLqycaNIuWbrm6h0I7lxWbles2mcqPbxc0hHQmUcZY
	 JnaBSZiO/cgfnSSdv0gpKiDGWAC9Bp6pKW9MBqe1+ilOgBhDJDcD/AfrkdMyejQnVp
	 9h8tSDisdDmnLatVr/UrMopK2coobtLsuX0B+wyq80C3E6sLomk9VTDk8E2/FLEJZV
	 +9k73xz9tK5iNxly1hyocPZnG0RD31L1oo3mLth8mIvKwvl70MOvxbtnvjmtjrn9A3
	 SqRgILrqceF5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 71BF74899C;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:01 +0000
Subject: [PATCH 6/6] media: verisilicon: rockchip: Limit the JPEG encoder
 to 8176x8176
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
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-6-fc4dc7e985d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=2124;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YcQepcs/kiqGO0VYJKSScKTM3/q57290AfxfFBFuGJE=;
 b=1+8p98vHStkEBOrBQLzikJyt9X7HUs6F5Qbcu93cIySUhBBC0ChChkoaPM+/PzBYUA0rxE/4r
 Yd2zb2U/jfdB1XlESEAqh0u4gswbvk48/dwzF8nON+0hXuT2otryzgS
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Rockchip JPEG encoders advertise frame sizes up to 8192x8192, but
both register layouts take the picture size in 9-bit macroblock counts:

 - VEPU2 (RK3399, RK3568, PX30, RK3588 VEPU121): enc_width is bits 16:8
   and enc_height bits 28:20 of the encoder start register.
   rockchip_vpu2_jpeg_enc_run() masks the counts with 0x1ff, so an 8192
   pixel (512 macroblock) dimension is programmed as 0 macroblocks.
   Setting the bit above each field on an RK3588 VEPU121 did not give a
   512 macroblock picture either, so the fields really are 9 bits wide.
 - H1 (RK3066, RK3288): the height count starts at bit 10 and the width
   count at bit 19, so a 512 macroblock height runs into the width field.

Limit the shared format table to 511 macroblocks, 8176 pixels, so
userspace gets the largest size the hardware can encode instead of a
corrupt or timed out frame.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..f8079f96c398 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,13 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/*
+ * The H1 and VEPU2 JPEG encoders take the picture size in macroblocks in
+ * 9-bit register fields, so 511 macroblocks (8176 pixels) is the largest
+ * width and height they can encode.
+ */
+#define ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE (511 * MB_DIM)
+
 /*
  * Supported formats.
  */
@@ -52,10 +59,10 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
 			.min_width = 96,
-			.max_width = 8192,
+			.max_width = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_width = MB_DIM,
 			.min_height = 32,
-			.max_height = 8192,
+			.max_height = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0


