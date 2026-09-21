Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C433033EC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004697; cv=none; b=qiRMrg3pzTmQRpGvEZbHiQfqr9GFKvrwLX9IXiU0FGR8qZZnhFBQn32sT7Ey6XW+KmBi27mkf24Zp6tqmL1cO83rr3pDchi3rJBlQRaxhrm8d5m/0o6ooMUNzXvIfpKNRslrKaaKJosX4yQdjqT1oGbHP+PQUqcfi9shaA/DsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004697; c=relaxed/simple;
	bh=hmtR3W1Y5TWVJ1bZwbC6Y+hbDXaRcvii2VTH1g9vhD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0t8KLUoEKDdTUliT9d8PPAMB3i+nwhciMaJwUH6Wn8ntrzA4IrtYGiGWglZXDn6lR4i1KgeLo8/en4GIPFkb0PlqGlHw8i3ajj4px4SYGRXWPM2UTYOurSKtcRBEWFUmWAfq4m+D/a+lXHrkAABzcgbrn7Kx28U58UbjKC3IHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VH42h8mb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VH42h8mb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so2469096f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004694; x=1790609494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=VH42h8mbjunlLvUfhU2MPv3RDsyKFrpag8zJoNlvy9M7+6rpzAE/9WXMBCQrneYpzu
         ikZSAGHbAsNDZGPFK/PVkVG5nbK4uXB1Fo2t/DOa6DYsdhpzM2vIqdbRhDwRWvWwWeO/
         6YyHlWrE3Wcfel9hS7knbE/oH5ILoXC/xpNfcKiUvU8wZ0e/nQiqGB2gz9zG5+/YjNax
         OCYghsovaLMu08OhIhrvfZR+dLpqAe9ZM7ihiJJrcKtAzjKTmqGy5FNZVsbmNSniGOpl
         ps6DZAJ91yCHRmVh+Vo1XhPmZHiB1fcWifDSUvTT3PnWbxESP0ags7zrbJbuWTkzfLRa
         AJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004694; x=1790609494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=f2XT2fwT7KHJYngABQgDBF8tYO09cD4Oe1JoAX8Vx2Tpxf4CK1QFkp+4bJNonW7dQj
         b7AcUM18MLXVaxaR0w+aEKuQ+NjTcI21kPZjX9C/nOAA20ruYlOraWU53suaMd1o1t67
         sIChpno+PrId6cdHaB3joH0OIi57KwYhnnnMrMxJVsvOgTM4IalItWnx8inK8UqgR9uq
         5n3zLZND6tSAo0aozo3/klqyUqVWbDeWpsl8UjT9cKwRR8baP8QiELe6xr8VdfFseJOU
         fe4JsV/npPMSsYIP51gjPXGmVpZzE9J6pjp/jCx0XrY5gD6rnWXgkzUzlsvnFIAzJqSa
         52Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzFVPL8dn/DwYEPS+MCjsUC+QQ2/uvpXgONL0AOGC30UoOFF/sMUkkUQRQgdVHA0bGFoRclkFIe/qUPqGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mtTiPbB9kW8ZAqPXu6jcsyqCqtXZe47u5CVDHzI2k0bipWJfFY
	xDRv/l+fDbt8wCu39p1d75MALj66mLIn7TP4fDBXF8t44xtDFL+ZvG0Y
X-Gm-Gg: AYBFou1OwCugt4T5bdUQOQv2ysrxxWp+MOqPsxzLtlfq7uU5qCdoMfG7Q1kg2259pJE
	R1fUCOvfQiOdF6p1tY2dg3wZvBIAiEi+DoKC7qIzMnDIlbfZXLYw1ads0RxtJkqwxnImydsnOd/
	moo5RRNLwpQ04mXN2el5g9KyshrTKWcNFjj0W7bcQ1j5i/nVUh7BG4jrjZ+dj4x5N8+NKZndJ4s
	lgUOd3uFHU/IsQMFvE9ER50uyYktF7xU+3+i4ZDig4kEx+G0KYnJ6RnPb74q+ERwQ+J1pbYlvH4
	5/oecD+Ndh2J85aIEoCylvsKzyubnvBxoZ4IM60ndqhVqoAlapJDIpOUgwxA+ncM3KcaSA2Rcgq
	XHgsIgMxluFLBDCp6k8qwErnHZprm46sUgoZ4n5ADSmIss7KZM4ykr7ChZmskaRv3QS5O93LTtQ
	L+tQ4R4yMSYRaqFJMsApH9cszfkqUkxpla0HGaid7dfFl2tI60C5vgbXROGi70tcM1GTVMIzPUu
	EBzu7q2rCylNSz4uXQx8k3XMSnbqm2lYHGTIEZJciq01uCY5VU2hr4gUbpQXSAjQcuF
X-Received: by 2002:a05:6000:2407:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-4871e235dedmr14131319f8f.25.1790004693661;
        Mon, 21 Sep 2026 08:31:33 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:32 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:58 +0200
Subject: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=4689;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hmtR3W1Y5TWVJ1bZwbC6Y+hbDXaRcvii2VTH1g9vhD0=;
 b=7eXfGmHs6sqc5ovi2LozeLD8P+//cq3BdzTNILe+jLO+3z6tcXIFTrq2r7PjL5gIQ0U+4GFP/
 bs+JT9H4zhyDhyWgtywsCyvaCrvhVdn3FYixJeafybxnIvdR7YATVT9
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3568 and RK3588 variants configure the MIPI capture size in the
ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
instead.

Add a register index for the capture size and write it through that
index, in preparation for the RK3576 support. The RK3568 and RK3588
mark the index as unsupported, so the write is a no operation for them
and their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 ++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h         |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db50..e0acb9049ca1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -438,6 +438,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
 			[RKCIF_MIPI_CROP_START] = 0xbc,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -451,6 +452,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
 			[RKCIF_MIPI_CROP_START] = 0xc0,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -464,6 +466,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
 			[RKCIF_MIPI_CROP_START] = 0xc4,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -477,6 +480,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
 			[RKCIF_MIPI_CROP_START] = 0xc8,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -549,6 +553,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x8c,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -562,6 +567,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x90,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -575,6 +581,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x94,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -588,6 +595,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x98,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -759,6 +767,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_SET_SIZE,
+				RKCIF_XY_COORD(width, height));
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 3cf7ee19de30..0460e963b154 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -147,6 +147,7 @@ enum rkcif_mipi_id_register_index {
 	RKCIF_MIPI_FRAME1_VLW_Y,
 	RKCIF_MIPI_FRAME1_VLW_UV,
 	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_SET_SIZE,
 	RKCIF_MIPI_ID_REGISTER_MAX
 };
 

-- 
2.43.0

