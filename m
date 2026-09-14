Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F524734D0;
	Mon, 14 Sep 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393623; cv=none; b=HqoTxTjJB6nk2DxLeHNF+ssWlrvFLctTbRH6ol8FYKB1nXVbP5gVk7OGD6xJSCI3rKAprp4SmUh0ZXa2Wyn2PaIhgrYhIWCMcLCD3BptuM0+alY3oEIB7Yz+/z0bAGjUsja9QkQbe/X+dtsntQCXKdLroGBUzlCXUvkJPQv37YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393623; c=relaxed/simple;
	bh=jD0cM7p+54y67H5BoqsAB8Z8ZP1xOOXL1QBUpmp5eqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MabgsPV/q9ZZEY3p29RBbXkhgbl+83sYT0mgsPboRYaBPSqzCzkxK+WPiSiV56rUuN2/b+ZJzEMiERarhqjo2IXfrnk/Td/m/cFZsXgaSaP2QHrCe1B478beUTSZAl6Qsm5FP2zeyigQUL0lD6kx/Et13/gxZAqNDnu0CSwNbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=MBcdRlbY; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="MBcdRlbY"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=;
	b=MBcdRlbYG94TxOJvM03IV9Rx1AzOLQtvx+o4ZzORZe0cMXTKNYqBHc5QsQZHP40q7k+4z0
	tJmADmcPamyLoa4xtWv0nAIDSkaLOvpwB1w7WYn7JzxB4kfcFEb4MRIW1bvKO2Ky7Spt2C
	NAT/H3AsA/BLXBsVyiJIiBTG5+fBqfLWe0xkT0Va9nX+yw/Zrnbv37DNZlhrn+dvyyH8L7
	GTowi+ytAdZF3VgNX+LBJ9eGFHIN0NIK9Z+NH125Nw9l6bgN0U8rvTzoj4OFtiMmdISBk7
	sfelGb1H2OSDH1RVxDnT258vPxo7+8p7t7Ds5/VVwbbDbubKJgoelNjU18eClw==
Date: Mon, 14 Sep 2026 15:46:11 +0200
Subject: [PATCH v2 3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID
 pin configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-3-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=iCuZlno55Yjn0MkpffeLuEkr+4wHGhog/vQ/6EFeyBM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1OnpKPPyzKmXI8oLHS73lnIPdfooPFJ5o/7s1dZ/
 r61RLOzo4SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJXuxh+3NLXru56vOLGRCXF
 nFmrLoaWqX75VGv6SuXehQlLPyz5wsjw0Exmp9y8jqIch4yr+dZaJ41yxJdrHW59YOBw5VXE0T5
 GAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Add the missing MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID pinmux entry so
the USB OTG ID pin is correctly routed and OTG can be used.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 65c5f4450c36..0658584c9f11 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -357,6 +357,7 @@ MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 
 	pinctrl_usbotg1: usbotg1grp {
 		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
 			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x1b0b0
 		>;
 	};

-- 
2.55.0

