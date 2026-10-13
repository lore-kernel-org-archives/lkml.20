Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8CE4B1D16;
	Tue, 13 Oct 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884755; cv=none; b=OHPrLrVk3MxGz6nPGM8SqpxA9sPT0bi1ZhkWj9J/zO0lYsg2QmTWYEC2jh8QI2OkXPzF3cXEeYywM7PL5ptVaJfnZjGtph5WdR/fgSCVifpaUZ6Mz/nBevEtg/EDSxMtJWJAJ+BgunGN0S0UmmvZhEQ4CfiNKBWLoRTnLtX5AGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884755; c=relaxed/simple;
	bh=bbak2Pa+Xa6pT0U72nKivkLCl/5t2TslhXBlYh342Ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXIT0l5QS1TdMFNjS7VlDBQYb8Ow77EaiWJiI9F8FyIcjsr7ofWacA+jo+Xjm7GGYTsBm1q9VgUu7gywTC3EoeJchwat7uMlxQM01rqjeikEXNdaQCNmkIKSsfr4Z/o65Vt/QFkGloRyWyk0GJ4X4I2Zkxsp1Up6hqECxObNa44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=DQF5f9Qf; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="DQF5f9Qf"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4aN/1amNQxJNk4c7N2lTGAkvvrYpTHFVDkBhjGRCG4=;
	b=DQF5f9Qf02loEdyarV+8QiKydpwwICnIRQBoax1929zpGNgFXFnDuuQE271Ww63A7jpAaR
	i9ubdjBd7PrDA5FOA1k9MyudWEy0KUXrnkn7bT6iVpOfPQm6nDMgDpnlkWBiCoKpc4WM4h
	6PdgGBtYTVQGdHKSJ8vpNQtMbAu33xbjf0xMmO0nMolvDyKevWEPqoUis1v9BeKBRJUGwY
	cQPeazv79j0kFPm2q6YmAx80VCOiNmT1DGI8SqI6w1ikdY59yUXqoIwD0DYOfl+H8dW4sh
	mSk4vH7Yc7UEdxW6Tka7KyzqnjlPrrmpqjBL5UeJmy004jQnErtUaUM73R+5yg==
Date: Tue, 13 Oct 2026 11:44:49 +0200
Subject: [PATCH 4/8] arm64: dts: imx8mm-kontron: Fix wrong label for
 SPI_A_SDI_(IO0) pad
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-4-94f09ec520ef@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=jzjRSZBC4S/DaUSvV4n8aM/sXC+EPXR9oQqPjvOEE/c=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36MBzhnyemqeagx9Lj8if4l4dOzdnbWac9O+Xd8Eb
 zl4T67pKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmEifHCPD/Ycboh5ELdn/ckuV
 9963s/SjmFdveybj7yu6Z9U3D63ISwz/Y3sVy2Y/Xl6Z3PMwXK02/tuXKyJ1+3bNfjd5r0fsHV0
 JPgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM-S pad SPI_A_SDI_(IO0) is incorrectly named as SPI_A_SCK.
Therefore SPI_A_SDI(IO0) is missing and the label SPI_A_SCK is
duplicated. Fix this.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 4fb13d8ecfd45..35b76cd02b1df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -230,7 +230,7 @@ &gpio5 {
 	gpio-line-names = "UART_B_TX", "SDIO_B_PWR_EN", "SDIO_B_WP", "PWM_2",
 			  "PWM_1", "PWM_0", "", "",
 			  "", "", "SPI_A_SCK", "SPI_A_SDO_(IO1)",
-			  "SPI_A_SCK", "SPI_A_CS0#", "", "",
+			  "SPI_A_SDI_(IO0)", "SPI_A_CS0#", "", "",
 			  "I2C_A_SCL", "I2C_A_SDA", "I2C_B_SCL", "I2C_B_SDA",
 			  "PCIe_SMCLK", "PCIe_SMDAT", "SPI_B_SCK", "SPI_B_SDO",
 			  "SPI_B_SDI", "SPI_B_CS0#", "UART_CON_RX", "UART_CON_TX",

-- 
2.55.0

