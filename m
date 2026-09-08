Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B553CA93;
	Tue,  8 Sep 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876002; cv=none; b=t8Zp0LPqK9dUqpk0WeIlH2p/inCorx2YnIbkA5mYRBk+YAqUhGLmgX6HMMBwaB+ycYqob2JBD3hNosA3ZrC9zuZuIatE/vhH2paQ9JpB6GAM/RKgaJ+BFKUxK5oQploIvVBENxfpW1MdXp1vpykiYdQGFZFZ9F/xJ1orNJZmJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876002; c=relaxed/simple;
	bh=pCYoXBjmqmleM+Y0I4Hj40PjbWDiRSIxAHea931Zsl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bus6wHqCD2VP4h13eUrzu5Y9Mzz3Iz0GhKMwlSE3rpeK97T4dKoLUQ7FatHX6Uh8W4f+PWzXzi0/wsRVGjeddaOy7bxfL8vbUJvZ3HjV8ZF7JP+/131KSsHZgxMTZQf9M8cdFfVoa9IjUZb4POLAvP30qRV9ABLdymI0ptOsSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=sYrdQZB9; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="sYrdQZB9"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ApdltZkRhsVxOKrNUqqL3XcAJ2zFJ2RCffIpIs58H/g=;
	b=sYrdQZB9HA8jXyruuTDBKFVyfdSFZ8mdvmILkAF57uRcHsvbmYV1I3LHfKltg21rNtnUGZ
	8mbUV9TmQGZrbrwfx2n4jVheQX6FUp+XcpP9KKug7u5wUgvMWSiPW5ZKHvn3OxJJ9Klm27
	TgE1BB6Sg/n/dbBDQ8ClR0qa1s4YJA6wcZbeVR6Orbbzmc6McWqd3gN+URBysVO2gXiHbz
	P+4GlzRN3OpfjbyaTj9VgFdsObjEIZnjvQmi+UHqr6shM/QGfOP0SJwaLxKZJy+Oe9pJNy
	fWEVAd2kkEwktmAm2Hm+f1v8eY0nd7N9uMTxJNbMhQv1JfpOoLajINYYDALDyg==
Date: Tue, 08 Sep 2026 15:51:48 +0200
Subject: [PATCH 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with
 DIP switch GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Eberhard Stoll <eberhard.stoll@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=AE7Nzyaxb6x1i6gLi1eAISRF4DYohgutdzU1pqO/mwQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsJOJ992Mvc+f7s8PP8R3S0Z/urGOmXIut43UBNcrS
 v4TSws7SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJqJXz/DPtv9ODGOyZ7ZtgUJF
 lkDvRu1fr6rkHnrt2ncpT3/6jcrPjAyTS0vc5z+Oc3aXZp+m8+yw07NQ/bPmXlIfFiQ9iK+5K8Y
 HAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The latest board revision has DIP switches and lacks UART3 instead.
As the old revision has long been deprecated and not maintained
anymore, drop the support and reflect the current state of the
hardware. As the old revision hasn't been widely used, UART3 was
only available through an obscure extension connector and we have
carried this patch downstream for years, no users are expected to
be affected by this change.

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

