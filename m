Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981974EFFAB;
	Tue, 13 Oct 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892311; cv=none; b=XviS2sPn5KXgmIsIDHt2xBBOg5uvNovAh5727qZsjJSGljEEBG2+FsBhBBSwatbyPI7ViQC/TaTdVxDqmwKh8S+YcgMWwuhCzeWo7lw7+QPfDFHdjwtvWO/JWWUloz6xjv2I58zWAfkg35W7nmdbHlvWocNMPLY70WpR/0sEtw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892311; c=relaxed/simple;
	bh=BF7n2FGU4B0do9nLHQ29jMiLZJa3VCUAns7HbJstgG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4ZrnE8izu2k1TxLN5x+Trxp6Iwgz3hCoP1nYisnNS5maKcUe9dvg8q8bb5fUoDeocsydM8LMGteNBQI9TEClk07Zre4jEbLJ4vpUSsMwhmB1QAnKjJuQuLroGYNEpEjNhA53WYISespRjv3hc1YKRbH6+5EDtg33+r0Bhu5tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Ib9l6c8U; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Ib9l6c8U"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=;
	b=Ib9l6c8Uepb0LhqKr7Gyhb2VrQ9RROTcoQeDtySWb0Q+gq2lf+g+nxnDlFZ1UCtOk3VX17
	2n2exJwK25eBoJdfRMEv4oEMA8sD0gtLDYaVkyJwFOi2rYlkjK0SvSpUrKq+4odMfb4enb
	WrXRkmsKyCvPu1EigfpgK+IagQ8mC7b7VBFf09wQVPzLihdXL3X3T1IrctdNtyVs9+DqkX
	UuQbRxSRe3xHwO7ninbnY151zsPj+F8WP1FK1FPiqY3q61I8nQzBjhmsN4Dg9gmWDJGAKH
	oqTr/hFv6vQgkJcW+uSPr449dZqJdlGzk4kKAEfogB2mSkaY4rGeO1VMCKbXXw==
Date: Tue, 13 Oct 2026 13:51:12 +0200
Subject: [PATCH v2 7/9] arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO
 labels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-7-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=NaDCXQ5UyNlXLm2/p0aKHGTYTGZWj500zS6hbQ5zc2Y=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctB+Ln9bd57VRO96r36p8tbd/x5mLv05v3N6QyJJ/r
 u/1xdVSHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABNx02X4zcLNpTvLQEVt+5Nf
 mxTN2ALc+Fee2ne3KTj5zAKVOUf69zD8D5W7JbTT+KFE57nlNo4SlcbT7T0PPPOcbRT0oFLpzIk
 DLAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The labels for the ETH_B transmit data pads are off by one.
ENET1_TD3..TD0 map to GPIO4_IO02..05, which are the OSM-S pads
ETH_B_TXD3..TXD0. There is no ETH_B_TXD4 pad. Fix the labels.

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 36548d9181695..a6b6128f22ddf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -83,8 +83,8 @@ &gpio3 {
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
-	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD4", "ETH_B_TXD3",
-			  "ETH_B_TXD2", "ETH_B_TXD1", "ETH_B_TX_EN", "ETH_B_TX_CLK",
+	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
+			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
 			  "ETH_B_RX_CTL", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
 			  "ETH_B_RXD2", "ETH_B_RXD3", "ETH_MDC", "ETH_MDIO",
 			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",

-- 
2.55.0

