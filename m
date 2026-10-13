Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB924BF949;
	Tue, 13 Oct 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884765; cv=none; b=MFYkGfZ063Rxzz6YJojJdMWRhkZz2WBZrUcgD5+odV8++5VLHyNKtyxtnwolPUBrpT0c+CdbzLgv2QkJi1xgl+d7NvZJSUi/KFrHnq2bZhqGoS/FZSeYhtYexg6lEi31/U/HNE3etyiE7OI/qoAhkuBQe6mpFzBrCEezy7Yi68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884765; c=relaxed/simple;
	bh=Lsp+B4zq+KC5F++1D5ITKbM9yy6acVg/sgSLU5b7H6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChrUSoGnHLFYKVfASDKUb2tzr2IuFRloXvJb9YU6lzTNc6i7MCVwNzUug9Er8fMmb+PLHDK3pFXWt9YRulnEwp/YOMVMRebaApvwUTnDOrkGkUc/W0ODDQ69dpR2ErMDcwH2l2HRoepgAEhrnIt0/Bakr1ycn0UEHX3a3BqMrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=uRbGCUku; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="uRbGCUku"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zyab/DTAR9jhfJIBsm1z8Es4blkN8hawSJWx0kJHmZ8=;
	b=uRbGCUkut1zkeoYCvV0G00cnbKOqMOqTAiDwkNLbnPU6U+gFmHLqxcGm/yPsXn9Vuyy0Hl
	YLVG5/h1wpUCZkadrUPAZ9+lvlnq5QvQTPUK57B8XskRjFY4SOG8lxIZf1we2+ibr+cV3K
	9ylFv9O2VzK9CjsA0ij/ZUHLypoSOaBWt2/gBiX2BW3mNl1TWF56ijHiO3wNGuwtHgnRgR
	jK5/MbNM4c4nusYA8viK4vJsd+diAbIifEz64qbPRSKQTh3dcrrxPw8mYbBTIPGOZ8rLLu
	RYwGKdQwXEcaufYRSNEvwRfhC9NDzo7SyIkqhAm64I6HX4MZjPoC+R7ntEQ86Q==
Date: Tue, 13 Oct 2026 11:44:52 +0200
Subject: [PATCH 7/8] arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-7-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=4bKC16o5GKSU948TfhevL5l/gtf8VzrNd538OkRdtV8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36N2sozP1oQxWT5nUz5bq76ouP3oJ+GrwRun+Bwun
 LTLuDS0o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKzeBn+2QQ5V+9yW1T08XXC
 rY05DKF9nWlmClaFDYtm9R25Ov/UVUaG2b7GHIHTrzXwfgt5v2CFWnmu9eOyL55sc7Z+3sKzzCq
 DCwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

On i.MX93 the LPUART RTS_B signal is an output and CTS_B is an input,
so they connect directly to the OSM-S UART_x_RTS and UART_x_CTS pads.
The naming used for the Gpio labels and pinmux comments was carried
over from i.MX8M, where the UART RTS/CTS signals have the opposite
direction.

Fix the naming to match the hardware:

  GPIO_IO06 (LPUART6_CTS_B) -> UART_B_CTS
  GPIO_IO07 (LPUART6_RTS_B) -> UART_B_RTS
  GPIO_IO10 (LPUART7_CTS_B) -> UART_A_CTS
  GPIO_IO11 (LPUART7_RTS_B) -> UART_A_RTS

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index a6b6128f22ddf..850a92dd9b9ba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -59,8 +59,8 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio2>;
 	gpio-line-names = "I2C_B_SDA", "I2C_B_SCL", "GPIO_B_1", "GPIO_A_2",
-			  "UART_B_TX", "UART_B_RX", "UART_B_RTS", "UART_B_CTS",
-			  "UART_A_TX", "UART_A_RX", "UART_A_RTS", "UART_A_CTS",
+			  "UART_B_TX", "UART_B_RX", "UART_B_CTS", "UART_B_RTS",
+			  "UART_A_TX", "UART_A_RX", "UART_A_CTS", "UART_A_RTS",
 			  "SPI_B_CS0", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
 			  "I2S_BITCLK", "I2S_MCLK", "GPIO_A_1", "I2S_A_DATA_OUT",
 			  "I2S_A_DATA_IN", "PWM_2", "GPIO_A_3", "PWM_1",
@@ -423,8 +423,8 @@ pinctrl_lpuart6: lpuart6grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO05__LPUART6_RX			0x31e /* UART_B_RX */
 			MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e /* UART_B_TX */
-			MX93_PAD_GPIO_IO07__LPUART6_RTS_B		0x31e /* UART_B_CTS */
-			MX93_PAD_GPIO_IO06__LPUART6_CTS_B		0x31e /* UART_B_RTS */
+			MX93_PAD_GPIO_IO07__LPUART6_RTS_B		0x31e /* UART_B_RTS */
+			MX93_PAD_GPIO_IO06__LPUART6_CTS_B		0x31e /* UART_B_CTS */
 		>;
 	};
 
@@ -432,8 +432,8 @@ pinctrl_lpuart7: lpuart7grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e /* UART_A_RX */
 			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e /* UART_A_TX */
-			MX93_PAD_GPIO_IO11__LPUART7_RTS_B		0x31e /* UART_A_CTS */
-			MX93_PAD_GPIO_IO10__LPUART7_CTS_B		0x31e /* UART_A_RTS */
+			MX93_PAD_GPIO_IO11__LPUART7_RTS_B		0x31e /* UART_A_RTS */
+			MX93_PAD_GPIO_IO10__LPUART7_CTS_B		0x31e /* UART_A_CTS */
 		>;
 	};
 

-- 
2.55.0

