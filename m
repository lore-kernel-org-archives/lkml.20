Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376809;
	b=Cx3/oyzpCrxMdyuZy5Zhj4v++AFhsYi5CKA7Mz2Gq+W4DHtuIYtphfOCAOVK3DIltjVL
	 0bQmHeL7bLu2p6/2E4SWYI6pl7LL5cXXmynq2/YXCqppXn7aq1cXDux7OcjqZA/sVjyhY
	 /tzhJEm+WMzTW/AuTsOuUVWEyJK1KCdgPWRbac9FZa/UiUgTDWXqg6+cfGv+kEcqgcF/n
	 05dCUkKgOkGz6itgqN3omb6xfeXMgpxuZJyfD3c9va1H3NTp/YIZtbZGx96bjd2lk9K4w
	 2Hn5ASzGe6Z+vfLRGSiQNBYzU3PwrIlF7A/yZridXY6g2ypVCCWP+iBxa/IVxdGcKZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376809;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=nV/T61LJ6v0sO6bwAdioyl0aDLzD9jmUqQ46x7V0lPRzVjLkEfU/O9gXfR7Fx8bAxtuf
	 i2CFQGnM/jVy1EAyAnsLsRxhiz/6T7dlZ1Fo2IG1mmQm87T+Wt525lhuKx1RN+7IHkYRe
	 zgfRdZCcwdHC2Ohg7itEP1bbRvKKu3t1D9wp8dFvWGp9ZangPLoV24/eWIJtl344Rnkv4
	 wF9fs3C9AuuWW3zwGYo8176UzbVisjnZ11VaGrdWpj7fsOV5I6tZiRO2XumPsLHRorl5w
	 /0GgsNYljC8Phin7Mij9cvVTqIyMiDKijw/YK4wjTb9edbYAvL7RztEuD0CJ56oFVZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTTujsHJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB435606A339;
	Wed, 11 Nov 2026 06:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTTujsHJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376808;
	b=RSBs5xilHiZe/i0r0XLG/G5mgiRUJ5HlxvgWXvAqVOvKYO2ceAdcwHIA2q2VXOWC/DvG
	 NI/ct1vO2vdXcZmeTkr2N21T+Uo+3H6g+WvsQfNDC/V95czagrH+A+yta30bE8GoVOoyd
	 vQcUNsxkahGqFCSfeJfSY2q1nPAmlr54n7uuAJ3mMhQemoEUpQnjnDzW+kqFsP5C4bE2z
	 2XEDPIvq76H8bhVIsOru3+tnInXsAlSVqY5m8LyHBnwUBIKvWXAxZrU0PRwaOVTJnrTjg
	 NCMt3xsKWTi6BLAxbFtFoTcLr2XY876KPJAUh00H1EkP6Mzy1mkGRidcbgtKC22s8cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376808;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	b=Mp2h4iSvMPDO/RMOy+0/50PFgHifPu4qpizzPC46X0NTqXkWL50sTwfcmOpjGl4m+CJF
	 XGjR8wpqI6UUNWbwGqGtMkEwNi0kpO0pemnhciOXbAJqRV5yxdZja4BADN+tl/siNcRmY
	 YZ539Kg+g4VT70FDq4htxQaETeHLRm1ptxMuxBuL0lUJ7ex7P3hwEEctij9+TO1AQeVok
	 TSpitr/3H6VeVjWLLLHc7m3fcqLoShp13IatENqUNfvcmTyP33tOVLsPFHLMgPALrwWrl
	 cH8Ep7wobpGGYOZHmvszGXQ7xnS/L6LDMHqvicm/SYuhmVjBwCh67YhSuh4zZHaDJFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F8DF1F00A05;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376808;
	bh=1qmmBTGs9JqDhg2KV5f+IlYN+JpILY0qcFVik6CVIpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mTTujsHJtf4wo/9qI+97XbkrWJr4XIleYmHbkKnbIri6upwxPa5ElQ1+hBIVpOxAB
	 ebMlW2QC7kJtfNJ6zXedHfwFgLVEv9sxd9UfVFEnkdLG/T9rIfufh3kDQTysocIsnV
	 YP+ad6szAAWKjJNSMIeOKJQLpJRHc/Wp0OTySuCf1x3XOrGad+JTtSEnIlVRJ58eoT
	 ttQ50hFGnKfnyb8QzF+HVXHHe/9ruH9Seu0+396mquNzarnvQTl7XBJlV3bRUJ3fzE
	 HyYIFvIZZnWMQw8QBp7Noro2+cUGkPA+BxJGKRU4O/Cq0I1BaYIshD4MPfDkYQiLNE
	 xaXcTheF2U8lQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4D0848DDB;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:07 +0000
Subject: [PATCH v2 1/8] arm64: dts: allwinner: h616: Cover the codec RAMP
 register
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
Message-Id: <20261111-h616-zero2-dt-v2-1-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1252;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BSR+K6Y2s3B1U4tlKARegXXjsMuZ0Bl9ncjh06Y7t+g=;
 b=NDlrnKc/h1AS5iFoQAkz7jUnVgC/2x7mhMyCCIwtF8u/92Q5tpWsWp9vt0qa3fjW2MQrC6fgN
 IekD6SeMC4TAyQX1cmo5Ued7idQR5sfk1v0cHbALV6wmfUD0dAVH8I5
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The codec node maps 0x31c bytes, but the H616 codec has its DAC
RAMP control register at offset 0x31c (H616 user manual v1.0,
section 8.4.6.56), and the sun4i-codec driver uses it: the H616
regmap has max_register = SUN50I_H616_DAC_AC_RAMP_REG (0x31c). The
access only works because ioremap() rounds the mapping up to a page.

Grow the region to 0x320 bytes so that it covers the register.

Fixes: 3eef85034c96 ("arm64: dts: allwinner: h616: Add audio codec node")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index e4e0b999473e..68bd6137c316 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -806,7 +806,7 @@ spdif: spdif@5093000 {
 		codec: codec@5096000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h616-codec";
-			reg = <0x05096000 0x31c>;
+			reg = <0x05096000 0x320>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
 				 <&ccu CLK_AUDIO_CODEC_1X>;

-- 
2.55.0


