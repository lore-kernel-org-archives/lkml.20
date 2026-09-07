Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2137F321
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763652; cv=none; b=oeWMcGQumAQbnvrY32IRBPeFF5gT3dbEDjqQDtE/3XxCRU/O3SQ3aSnOPe94ZS+E1+NU/pacwEjw6ANE0O7ibY2ZlodanYUHjRaVykbG5zQMP366zC6Bp0AqC0OEQND8juXyyFykvO1Kpn/vd7vkeaEBFs+a6b7VxIrswDaBIk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763652; c=relaxed/simple;
	bh=CBpkefT6kA0aU/ombsftRXwKkJ0HPgG1+oGWWpNYeDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+K5njQ9qAYFhHwHWxdVJX5ItUUlYzIk/npJ1qXSoHg/GtJ7haVWjFq5wUu63mUz3eSYxPwmb5f67ixsItJCEX+GT63gXl4eSUexVfCLDhpOeK+eZ/9DI+zI6A5GAuCsMGP6Gw4S9CzUshplS0pFxNx1feqvOvC5uQHTs1EP6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTn9rgIx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTn9rgIx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so8934385e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=hTn9rgIxUAWErO+b789SRDcZ3jZKO344L7f3U1btQIqHhqlv/Hj+QeAc1kRDnxHufh
         wpvsJ9Lq0Owy/m+VONPaeOex/F+GyWYczKGXp3txRrF1JIIOkYg0gAaXsWlr+1RVQKuA
         F8tr6SROcefq6OZlfBMwC8gAtSAkhR0d25rYP/stzioqwrtNkevBmE1Q+wqUwP4sZoFw
         jAYzrZzarZfkPK4+ol/sW8Xrv//AGFu5SOV5PxrJXG+1Btk4V5xWDf9aPfW9s6yo+1Xj
         YaH+ROLgnS1GpxpiTEtJI9rnb9vMUNYoLK7gaYP6PTMWuWwcEYoDPX1+gBN8SPzec6lx
         07Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=PQueVZ9q/nF5f95vXLA+G6VYLPKEg3AXDILz0CelwmqSHWGRNzA3kI3upWUcM3Haxi
         Q/0y/gfT5nIpAj9p6LeO/4Sj0Zl6ry8FZuF4TAr7i0nwbHggI8QZCa+EQrxVaLd3624p
         ZC9RLLFLxzN28Gs3k6CA2u/P85JH0+fcWATX2KuBl+lLth8mUbgjrP4a8wnBU0PBcpgz
         g4KZkzPwrF1WXSUaL/bbo8HyhxGbl5AJ6vAd7UtFj4V8eqAuUmxXF+AiVm+UUSsY3gph
         IbvsKIdsASYNp32Xkcpl3ADvtpnO8v3Yw2v4kWC/8Ru0kl0MvRa5TrQ6Jfpe9aY2xEyU
         XZQA==
X-Forwarded-Encrypted: i=1; AKwUvBzCpXO6pKdMA8xvOnDzI+4b54HP4NGuwAJI16WHSCfBJvePzHhzZM/Yu0a+0RBXywINdtcY8p5cR+wf52c=@vger.kernel.org
X-Gm-Message-State: AFuF++nwORgnVMqXzSkk4fxhuUpENsc31Wv17XxY9S+aZAgeS/NiX/Ql
	yIlUTfscMJfI/Qo37fbC++3Lv0MM5B2bG+d8PtcV/NB5bN8xxkhgZsws
X-Gm-Gg: AYBFou3+gbQWW/83NVl1KwAYoknX4jM37QM1dbjSKfbjH/0Iojm46c0kb9NbblyPSWp
	IvJzjblzyLW1tQRgE4BNDFj8vtzD2B5+7nu1DSkiebtWXzt4TIBIg2FRXrBTZMK5BtIgSIEaDHs
	taDvwGYTdw+uRnxZjiY6kEuFyQz/6dKd7TEgjetx9leMDhP7nuJrodv5SvZln3FzzwWJhCRwjFP
	kSi+70stKt8ZslN389QFOKN876fEnI+EpPrxByBFUQp3bW2qlEbkR5enfTOCMGOlYSNAPe6apK3
	4bvV9RdSp+jFhCPdpVn4vBVT5POJG6GNmznbqnsM3PO7i9J/IfKzpjd8Aik+FnOP5bzmhUVb+81
	kWupSvhOfgiPC/UPNRHB07dDSRtDe7QgC+eex51LqTugxGa/2J/E+wT4xprP/lzdqPIfszJ1Xi4
	4pavg3LOPOQfTL+UEn79+kkSPDP/KIawNNB2Rrsjf/jJUoCjFFamXnREkdfOTHIVyJxQFo2ETuC
	HxEaJt5fWXxiyqYx/vyvoA09k1IUSN+vHX60nWzDRMf5T8dr1N/qLzvP45wPNU2xqS5REpWCdQb
	o8THx4pD5M5+/6R09xjP394UanQf+D/5i6aBxQ==
X-Received: by 2002:a05:600c:34d5:b0:49c:fc6c:bdfe with SMTP id 5b1f17b1804b1-49cfc6cc085mr168152725e9.21.1788763649151;
        Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:21 +0200
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port
 2 in SGMII mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-2-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: fix node order
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..7698ef44095cf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -104,6 +104,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -326,6 +335,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

