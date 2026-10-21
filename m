Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588237;
	b=beo2VH7D58Pzy62Smy1hpzSHswZHlZNrAEFCyPT5/V3EZNXqbsS2kgaolz2sFXnN9qGC
	 uzUyKrwaIoVpmQgmQJK8GJQ3QQtm5/5dQdLtrNxR4J6+1yQwKhj8RB4uSq2wpRwXQkGqZ
	 3RmsVHSJfwSvYoihW97pzjUkeGC7hDd1DbSUZbzlXo/Fj20uWNztad55/u/qFXP4SHQyI
	 1Zywry0dZ6YPdcYbYsk4kJYcPb8AqsOcaWs/rNaAYVxvX/x3XxgRllgkJaEuGBhFGNpio
	 1Up/OZzMiuE+jVQlhsCOfVWVeSSSwkkIE1ZKREt/KrC36MJvQTBwQ2YFfSjlHNLnu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588237;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=mgG6TBxDwbeRtYdiTnG6B6y0Z6rj+qf4kbhWt/XsMyE=;
	b=oTx8CsXUVd8JGYoc8lerJP9OzZZy0tnpHoDWj07AJyHwO8s9TnTld58xuJrW7oH3zF6W
	 2VNVcVunEKmc8RfS76muZt9hD3uvfQ+otCe2GXup8UshlIeWInd4NorI79v2YD86eUE8o
	 BHFDKtLN08XG/lom1+PIAbpuyNrn3ZUWPyNuXRLDJ+JEi30kx9ywgkwoykse5qEOlTvLl
	 MT9lDa3Zf4bLieWhQtN5Znj0Y/57F9Wr8i4dLNqWxEMk6Nm9XA8N3jh/iOME87GudI7fS
	 vhMbaLmUIe3Z+kEXlmmG4+vWjCRwsuFUZb6EuPl/hmtziXlTITmqzyyoJTn2uVFdP3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DpvqKVGj;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDD60A263A;
	Wed, 21 Oct 2026 13:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BDD60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DpvqKVGj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87F2C4E41296;
	Wed, 21 Oct 2026 13:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D389606E3;
	Wed, 21 Oct 2026 13:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1B1810328A96;
	Wed, 21 Oct 2026 15:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mgG6TBxDwbeRtYdiTnG6B6y0Z6rj+qf4kbhWt/XsMyE=;
	b=DpvqKVGjzwtgRuC8fwanDNB6XemXqJaYptXaxsfEcXsQGsUMyu6JQPrrV5zGKj79/fFp4q
	126kpNHLh492AsfZeGxSIKuEF+fa0Fu6FGyYmMdcz9CbI1CSg9m47R7GBl8Y3Nik+749dD
	iskX48x5RMCqYpchjOm/eWZCANTMvQlM7rG/lNVV2JCjiRwjvczv7GYh8WDjzEiW+Lk7Xa
	jAVlE0spxz2x8Do+Z4VOFovTe+AVD1w8s4u+P8ti3PlXO5QOOcI/VlJNDNdwURv8K80Yxr
	HNYpbmdxJxn/gJtn4qkz8kp/7/Rh/uZ/RvkKcuxPZsWa2NWE+R2YZZp9N/if5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:09:59 +0200
Subject: [PATCH 3/5] clk: imx8mp: Allow adjusting the video PLL rates for
 the LDB clock
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-3-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There must be a x7 or x14 relationship between the LDB clock and the
pixel clocks feeding the LCDIF blocks. There must be some negociation
happening between the two and that may only happen by using the upper
video PLLs. Allow this by setting the CLK_SET_RATE_PARENT flag to the
LDB clock.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index fe6dac70f1a1..3540992b8940 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -753,7 +753,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
 	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);

-- 
2.56.0

