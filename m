Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B874F052F;
	Tue, 13 Oct 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892307; cv=none; b=nqYWDXRJPsN9iOq9G8jxVOm9qbaoyM5rzJ2TkiUSwhQbve9g+gJ6B5meXPqmTNyySFBXBptob+9hv2V7ko/sA1HyTU2a5G3NmdEFmrK6kVSg3vFncJjq2g2oWU7GcG5TYNSYq+bD2D3xsIvluT+Xg5yji3gSv9i2Mgb8KJVKrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892307; c=relaxed/simple;
	bh=cIShYeI3uOsgq2p2WGei4CtzmrDQP5XChUf5tYX8QLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxBu8tWsiJ86GhHS5usemy8+1AtnZ91nekSMMwTjFyMcUwrIBZVsEz3u7DkPj1GKG+gznyw5uvNwlqgUeeWQXaxoM8EvJ5WMw3ZnkWTpLI/aP+BpOxAkrF6yKOnD2RRlpz4CHANwHMIhXjVk1L7yCQSJ6jNdFup9XMqNjgm6swE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=z8QIS+EK; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="z8QIS+EK"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KsG4E7aRTBns4kMYtLjpkG5awBdjw9he/iK/yHlji88=;
	b=z8QIS+EKxKo9K94EIaWFfURwted8ao1VqhfKf1QhehonOMXXeKWt+HtbLbgxlNJwA5Lc97
	8GsIEFuG6jm6j3kJkUmgadJbn+RZ9mloT0iWbBVmDYvD/lBz6oSxJbqSKIDSlGQl+6yVUP
	u/2iG8os20G7qh1vx2l2EMAM7ilYVKpHlv6a0h/KzNvFMVQjQJoUkhZZ/42dXCxsvomGN6
	1c54JAs3wFU76iaKXcc6dBKVhcbBlulcZITjhZg80StbuVSQ7iQiH7HTjC2M5xz4ePziBA
	s1iJHdm9MDz9dnEA8dMOf1JxW0S9CXctwHxGGSxpBQnHQrf6agq1m9D3sBI9Jg==
Date: Tue, 13 Oct 2026 13:51:07 +0200
Subject: [PATCH v2 2/9] arm64: dts: imx8mp-kontron: Fix GPIO for DL panel
 standby signal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-2-d464ca652c91@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=zqKe5SSvEE0xziVYkkE5XVoVhrCJnP1Q6qOdqCtplLU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctF+5kl7Ii5CmTwyJcfb3fU1udvwLzvw95Wutz6k/O
 4r+7L3SUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJGTfQz/1A88TI59fOf9ap/b
 248b/amXvse3k81hbqZQhBL3H09bS0aG47P5ODek15z/IbDF/eXGc2xnjbjbKkNeHLy1WXvHym0
 BvAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

On the BL carrier board the panel standby signal of the DL display is
connected to the OSM-S pad GPIO_A_7. On the i.MX8MP OSM-S module this
pad is NAND_CE0_B/GPIO3_IO01. Due to an incorrect pad mapping, the
overlay uses SAI3_RXFS/GPIO4_IO28 instead, which is the I2S_B_DATA_IN
pad.

Use the correct GPIO for the panel standby hog. GPIO_A_7 is already
muxed as GPIO by the SoM devicetree, so drop the extra pinctrl group.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 88b30ca66adf5..13c6d55126f44 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -52,22 +52,21 @@ panel_in_lvds0: endpoint {
 	};
 };
 
-&gpio4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_panel_stby>;
-
-	panel-rst-hog {
+&gpio3 {
+	panel-stby-hog {
 		gpio-hog;
-		gpios = <21 GPIO_ACTIVE_HIGH>;
+		gpios = <1 GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "panel-reset";
+		line-name = "panel-standby";
 	};
+};
 
-	panel-stby-hog {
+&gpio4 {
+	panel-rst-hog {
 		gpio-hog;
-		gpios = <28 GPIO_ACTIVE_HIGH>;
+		gpios = <21 GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "panel-standby";
+		line-name = "panel-reset";
 	};
 };
 
@@ -127,12 +126,6 @@ &pwm1 {
 };
 
 &iomuxc {
-	pinctrl_panel_stby: panelstbygrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x19
-		>;
-	};
-
 	pinctrl_touch: touchgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x19

-- 
2.55.0

