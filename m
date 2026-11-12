Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495772;
	b=3IdbjmkwS3CKe/9e+hCC1maToNcPF11/FXl5fWr2LYqsFUcPYiJ2NN0qjRAKr4jA7udH
	 WRm+pusaKkINSfTkjzP6w1/IuBmqXzVgG1Hl3F1WbRu9eJ6A10i/b69s2UXWaKaAT3anP
	 gDjIvGK9w3Inj0TzIbtL9OxpACqvPktqD+4DeHx8bYQAcMcKfyRraFiveThqKy5C6fGA0
	 OlFGoirJDMxIegN8zMfQJfARiIbo6J3veZo9NfFIlHq9Lw4bQKYZL0rr117F2dsDZBXoC
	 d5sPuQRPe0BuM7kNKlrGOpb22htq2wDBxSe/FAdG4E5V5KaX8hVX4+eigP491uvsr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495772;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZfgLCA7ZrK/D1WTMEULX43MHGDrUY5pCM1cItjDeW0=;
	b=bhfcAslfr/CAp/dA3nu5m9OrVCM2V2VsVCbjIAHBfWLJUuoowgwtsUJEvaW2BkvOwvDo
	 a6ycrlZ0E3d6b4WPt9suqAUmUJp9KsePcMwUH8h699mVSI152qHdJpefP/cSrkAxxoA7+
	 8tZMVOmD7sbG7XoXKvz972o0DIPCjIHddNjHLFDRFs5yy8jdAuTxbJBYVGa9CX0++noAO
	 URe1CA4WM+9+v4/hwHtau72asYVEDx+5LH1AsLz8w2TGtzbMzHmg4w6XbfIzkST0ZoQRo
	 dMpmCTYwd7Kbo5OSW31srvI+NuAmemcdkuOWHGH8K4oVKLvmL9EDKm5A6f50b9R1f5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=eYdsEyum;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB960A382E;
	Thu, 12 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDB960A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=eYdsEyum
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0665C231B8;
	Thu, 12 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495770;
	bh=CZfgLCA7ZrK/D1WTMEULX43MHGDrUY5pCM1cItjDeW0=; h=From:To:Subject;
	b=eYdsEyumSKICw76OqGTQkGIk/92MV4LN5Q9pbT2bd7I51qdx85qVJjVBp/Qr7lwbo
	 pB2tBEtt4I2BRByAI6rjbmpX0BhR3uB/gsBGMSHNwpsk6cE9J+VsgHGtdbLSElhhCA
	 HvSQB5JpFbfb1oiM+m3zPnoHSsQkHgBJ56VGCA4Y8HnJkuCO24hxie0ZY1EA5Pl1jL
	 wHcR+AhUUglNSQNAdnC1OM2f+GYhrHLzht8EzHmcW6keOeK2kxiV7ZQJI+PwfwQN3M
	 HNjnlo+9HVLOvUaq7+BxDTYmMW/SFE/V8jLzUosiI7AHwjEJW60k7JtlBJ74UU1WAr
	 ScH0m7Tqyirkg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/11] arm64: dts: freescale: imx93-imx91-toradex-osm-common: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:32 +0100
Message-ID: <20261112150236.164850-11-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The OSM specification defines the module interfaces and their naming,
SPI_A and SPI_B being the SPI buses available to the carrier board,
implemented by lpspi8 and lpspi1 on Toradex OSM iMX93 and iMX91.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
OSM interface order, SPI_A being spi0 and SPI_B spi1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
index 8b0131d4e6e2..f6fd64176893 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -30,6 +30,8 @@ aliases {
 		serial1 = &lpuart6;
 		serial2 = &lpuart7;
 		serial3 = &lpuart2;
+		spi0 = &lpspi8;
+		spi1 = &lpspi1;
 		usb0 = &usbotg1;
 		usb1 = &usbotg2;
 	};
-- 
2.47.3

