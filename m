Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639013;
	b=w0FXZ2FXeGREM5APJPgrnKzr0wm2gPQj1y9uHuqx1IkHN2PhsrW8rHlXSVvo/z/BAdIn
	 n7ePZ4Cpy4sZ/xo3onwOLBVaNRFTv5eO2YMnlkVsHjZF/OIPvZvvsgQ9T3cS6KzkFTwj0
	 yUpMkR7bjaWW3cYqvccVtDY+EFUkjGjAlJaOtw+EgCuDSdJwyJN31N8y4flzg3qYVGOnV
	 tzb5EOWFMEqICevWDp0fL4OZsDHFWYmNNtghgLZPca1ah8+FEqae43CzbstSCvszvXPAg
	 pjYxgWQzXb1qGDJG0f66u7IBvh9iySFrQqae4YxBp4c+2jOsY8vXxNTZNOLz+RIETTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
	b=iJ0n55Mq0dLPx9ttCX7fht47IvECXXn9yeyGfyTwfx3Pnf2EObKBlSRUBh9DGlcPHUT4
	 yIm9uquoCFtnzoW9z4+MF8HT5GJRai/PRXgp5Ypv5pw8Ep0pUOJuBSAOzXQ/fPXc5gmI3
	 G0SyaFvy4ZmdqQ1dtLMhEY9AoVnvuKxio8GEMugeEWs7rM7obE+0lKKsIZ2TXloMVRZhh
	 OrLe0db/br6nsAe5Knso610eh+yJJs3wFWg9PVXC4rvvk8uPKq1MwtrvwSBTMx3/5MLNR
	 qbAsMkrx9tWyX3BU6a+g+RIbAlGy1Db7AAgrm5CC8viLiDCC+CTShrX5ON3hSKwvyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpcRDTV1;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E360AED08
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341E360AED08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpcRDTV1
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2284924f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639012; x=1794243812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=BpcRDTV1/2941/X1lUeaSwkOB2dtOwKU/DvAhZtlwOa+AGP9u4Nm/lu3MwfW11dNDa
         l4lC6cunfJBFW+mC998rQ1WLqR4nEYOOjOs/o7wjkWKPLJZF/g+13sovPjtfIfEfVW3g
         mFR0HFLwPpB3wdY4Nfdo3aas2YB6j5b7lSprh/QnSL8HTF1Fu+RcwhFyYbLrrQ7/YWY1
         ss4LIkaBFE9NOzwKi56k8tr78o2hwH8dHKobkscCHX8pFtSUkfXEBbu+0yw5tmqDZfwt
         DECc/SW1cdh2jizu3Ooz867Cjx+ic6zOZoAqYcxd9X06rlRJRcj+zz9RNbyd4tEQFYUP
         OQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639012; x=1794243812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7l4WHkBsRffNtc4OtCTnEYHsuGJTmWCjGilEK4Yq4Nc=;
        b=QuuZYXRFf2N/IwmrTSut2POUoRnSzXMw/yzZfRCXyZdENfFRvjSBvOManfTJoZ3I2J
         fQzhBd5fxynUMPuOdr+P/YCj4+CtyvMw03imF5A1oMU9QTKgCMvCsH/z0TOF14F2Yt0K
         SLdITBPaSPStC7pziXsxiT17hrYhiLp950F4se6jHiwdbzVukeTIuxpz77/Td+wNG1T7
         HqjsWNFHw1JNYspELWyTQosgam6dbl4zSJo5gq2Cw5zcQuvirRk00faVhrL+dZtplU4V
         gEHeCLB7I2XtSKRhavl6LjNtEhZ+j/FGStL5y0+grmZ0OydhARrNP8lmdcqJq7gq5mB0
         w/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2oj+VQpcBzMToosno6PeBDQ+ZnABGpS1Pu6UjlzAsXz1Lp6ngZp5VXY1CUKDnEM1IgQPf+Awp1qZeLQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XekAmjgyB/E+vVgHA9AFKjgy9IzUsvi3XLymH6Be/QPwpaiCj
	u/j+TfhiH7jOhMtf8QdgCuL9oxute0LZ0tFNOtamEpgbFpAEmuqufARb
X-Gm-Gg: AYBFou36TOOgQE2egcfwBCZzcyugibLZFXab9I7ZWHrpYtqCbE4p+OiyRO2tiNF5FTi
	tsUbVMEbouxzbitpBIMmQPJTBSsKJwv8xy0LYtz+pNS52LrNHSLaiGq6Bw7sirNe1y71wgHNmmq
	md4fRySmZiaKYNNIMPpH2aV/CRRq6fIgfB3Ds6aTAIQfDBFIcAoKYtr9fVRqPEWFNArtbDhhHyt
	Ub1OMtfY0Ar4TMkThJ3M3KTa6JFSEyEfqI+9WbyO2y5M7x+o2LoxQi2uzaixzr8PaJIr3YEz85T
	BX9q0SlazN7ZsvGnUMS0WuWYclmhnz1smRi43Un01P3BkCgWBzYicAv5jQBbM754yAlj0O8+WoS
	svHSBuTFbnIdDEHUwgpwX3RrKx9TNZLK5ozUlD1lau7ZoTwf4qr7s4fhAuW9XI4jv1wsTPgOBcJ
	byzw1nKM1BHLuU3sVDCutKQPCc4YrYfN1KiBNpkh/LvZA/mzx2hT4E6LCg7YOuUEoreYhiz6tid
	AUFrGl2iARX4r60e3QlRXwOXT65VZc2pCLe7NEmshUWHaa7/PRexTYeFxMm0d8rStK4dDIF1qH2
	BaloueufT+4KWiixF8tfpo6PPpWW++CGsg5IiHJJ4cq5ulu3Rk1SwWR83QeVnnVMbDCAC2G+2BP
	lgffKJOecL4+GzPr3JxAGzTOUCcxZflEhwGtRvToqx3UGcElVrP5LJCemVpSQZTy0aJEA/xaGbm
	s74384AGiaySi+3oo9qGOcfpVSlDonRydK7aC8SguLN44CSdZVw/KZTrXiEiJIdM2k8LYQft4NP
	ODCUIDIG8NcyUK0hcnOWQf8TZwUbz7XMmUhdk8aGmB5UhdU+GI=
X-Received: by 2002:a5d:5388:0:b0:48e:666d:c96d with SMTP id ffacd0b85a97d-48e6e50c8d4mr17255148f8f.51.1793639011436;
        Mon, 02 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 09/10] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  2 Nov 2026 18:03:02 +0100
Message-ID: <20261102170303.1973892-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 756243795de8..2bbc79b44f99 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 /*
  * The hardware decodes whatever picture size the bitstream headers describe.
@@ -697,6 +698,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -744,7 +756,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index a523b56a9b8c..d28fe91562d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0

