Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7324BE439;
	Tue, 13 Oct 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884760; cv=none; b=vGfCdwD8bioq+OMax4obm3wzSVWl4cKSDa41teYtYULov77wYlb4azLSCLTg0LN+Qwg/q/wRND3HHaZZ6cVt1IOQPfu91frfuiZnVd6eBYsmMUa9dKyWPTsrwbp7mjaEEFQay7A8HF7eabhIrNSI9BwSGbG8zpVOzW2LDUSqiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884760; c=relaxed/simple;
	bh=BF7n2FGU4B0do9nLHQ29jMiLZJa3VCUAns7HbJstgG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2cQUi+tIsT56l0eQyeezzL7G9KuurdUE6lnHHg9Kavq5pasKdIM/yT8qTONtoINHItav3mPrBnTQDOGWoAtAy1VAMNx9ltyE4zO0PEahx4v8dE+sCIV2BUQ49ooffJH2zzaDEqSw6Z4DXEoG0KrEAmwHXlVQjZ0UcEyawArXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Ei0SRqI6; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Ei0SRqI6"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=;
	b=Ei0SRqI6rLxwSlVG8ELYbnxrSIKOdVbjKL5XKHQM/bQLNHTZwgLq6XvTfoQhKzobeRDN9c
	9P6DAKDKZbNz2DPLzT3z4qGTcGaRMWNm0ATa067I36vRerf3bd+qkib248Le7MX2uKvtfF
	0DN82/O038xEvFG/rBBVP1GC8SPvV4efhp2ghc5adc5JTlqOUDCWFttVq2IooA6FJsJOzn
	Fk2jN8UFPZ9WAu9MlUwp4YAzDkiOkLMKin221rAqcpJEDxT4iV2hZy9vq2rbdgMqULGCQn
	IuPz/jiT851yAzQTmc1zUavVrnX4DWcTnDQAzIOCWd6yEuiCuPwtqAFbsEDKUA==
Date: Tue, 13 Oct 2026 11:44:51 +0200
Subject: [PATCH 6/8] arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-6-94f09ec520ef@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=NaDCXQ5UyNlXLm2/p0aKHGTYTGZWj500zS6hbQ5zc2Y=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36NLItZc+dv2/v21eU03Z57dHNx15pWWXfZ7rYYdl
 v7raxZFd5SyMIhxMciKKbJI8Vu8tjWL9ZE/Vh0FM4eVCWQIAxenAEzEdyEjw9xPq372a+bkSCnq
 T9hdvjFaS1SJ3+vrLC+LDy/Z9N6qfWD4n7xy8bTCOwdk2Sp333hXxXmeXzUm3yLjEOuPizea33K
 zMAMA
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

