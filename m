Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11454734DD;
	Mon, 14 Sep 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393624; cv=none; b=fvG0NUP++SgmmHD5/Bx6BSJtN9N/gz+q4i2+DqEhK0s/gLXsOiWsRDmojoxd0Q1yWGL5EdmtR78y4CiANcFwzRSNeZNkEshaFn7CePUfTvDQLzz/oleqFzn5Rm7/Hhjt7eui3gkfLkw26g/dIAQSL1C/YNh9/caMCj26c0KiN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393624; c=relaxed/simple;
	bh=haZGqfPsPibRFI7mhBQvoPvNcgaDoYSIhFRiG5Bhkfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQvo7YrXsYxIVvF9x/9jzR06EkYL2mg1PvHNcQxe08m6NoHDRZiMLaW+Ge1tsDDNTsv9F7cV5l2St6MfcjS7V5fCuyDRYDoZF5NeJZZ50MuKZ0eXRE3bN2OXOR0TVIvQxyax05M4lZMZCbp5WhguSdx8O1Ds4N4VeFpzvWz2X6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=k//tJoys; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="k//tJoys"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDP+n1DrBhXSmwl3LfMLDPrgn4MyPtgCkSq49JaXtn0=;
	b=k//tJoys8i9mNH/GAMR3bEPggby0VcMx7FUo7a8bH6fdZGSLiwPNOml+omBgRjr7PYuvRF
	MOlYCwBTzNrqCc7aLQJEnQ558KpSRGg3dr45j6xaaArnDedmSQkMz48xaQewoKnyImEvgd
	HOtl713QwXJ2bQNrMhI1saUL3oTleVcekBgIqJRV18IgkavQhM3781I1dwoqW3h37+iWpx
	tlR1Sk3MJVw75rSZtvrHaK0yuMA7gS7xKY1fmuSUJjuTm3IqkMsyVivyWSOkEzBthVbCkp
	KN0Vgaa0sk+aEGLhQo9d47pPa7pqKL2thde2/tlqA+YlO7yy5RmwZv7DAdh23A==
Date: Mon, 14 Sep 2026 15:46:09 +0200
Subject: [PATCH v2 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3
 with DIP switch GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-1-8e12bc5f1f10@kontron.de>
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
 Eberhard Stoll <eberhard.stoll@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=mlndJedvsyb+xB3UzJ8voSjogHmDtD759A3WpybtzyE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r5NHFvHnaZqYK6rt1g2StuZ+cfVHi9LqNq4HPR9n/
 Oh3LpXsKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmIjvV4b/cWyb5md/j/wwN+Tk
 Fe/Y6tn/7B1cFgTybK3q2M/jxtfswMiwx/bay6SkC67l0Sssyw4s67+e2Ja+Ra7y9cvq3dGpZyR
 4AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The latest board revision has DIP switches and lacks UART3 instead.
As the old revision has long been deprecated and not maintained
anymore, drop the support and reflect the current state of the
hardware. As the old revision hasn't been widely used and UART3 was
only available through an obscure extension connector, no users are
expected to be affected by this change.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi  | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index f4c45e964daf..a71669bef7d4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -172,13 +172,6 @@ &uart2 {
 	status = "okay";
 };
 
-&uart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart3>;
-	uart-has-rtscts;
-	status = "okay";
-};
-
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
@@ -283,6 +276,11 @@ MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0	/* DOUT1 */
 			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* DIN1 */
 			MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x1b0b0	/* DOUT2 */
 			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0	/* DIN2 */
+
+			MX6UL_PAD_UART3_TX_DATA__GPIO1_IO24	0x1b0b0	/* CAN_ADR0 (DIP sw 1) */
+			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* CAN_ADR1 (DIP sw 2) */
+			MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0	/* CAN_ADR2 (DIP sw 3) */
+			MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x1b0b0	/* CAN_ADR3 (DIP sw 4) */
 		>;
 	};
 
@@ -334,15 +332,6 @@ MX6UL_PAD_NAND_DATA07__UART2_DCE_RTS	0x1b0b1
 		>;
 	};
 
-	pinctrl_uart3: uart3grp {
-		fsl,pins = <
-			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
-			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
-			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
-			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
-		>;
-	};
-
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1

-- 
2.55.0

