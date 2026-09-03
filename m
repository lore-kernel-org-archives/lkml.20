Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A84F55AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455306; cv=none; b=XcrEvE9c172IQO7jmeX+kZxmhWNIJgkiQy4xSFNy7ohd1NEdURqY+FFXQNdmcvR6fdGOIEOkCff8wPaZHEnr4wUcpUuS4Lx2DE2ss3o8GL9ADKBxgXbMOAyUpGwDuofELaC/hXbOxDzjb2XIjunpBWBHx5R/Onv5cQfSOwLCC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455306; c=relaxed/simple;
	bh=sdQHH69f077aoixYw2GEaFiPjMO2xKr62tsBGVZ1LIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaMxULU4qz6d14a+WZ5jqL4sZklcnoSfzHPum8mGMXGaoe0kZ3GFvVSzAnT8FHegjLMBj2G/HHgldp1MjHFTkgonx3OM+oWnHqAOD05VHyPCo7qrhIAUyj/f5IQbaTjomGvcN4mW3onnZg0KvQTyhjwNNfojuTDxWtV9loucDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pN6u+dIF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN6u+dIF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso882275e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455302; x=1789060102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=pN6u+dIFCLXsn5cWvp8mBCcSrwUWat76Ft2UE9LJZ/D2pk2ZiFTdKaIbmxG64KhJ4G
         xKr1tR1fbbD1LIyMLS2K8OeqJqbtVQ5QV5X0mN6PPulKCrc8aRkJd/PtJARwhv5fyYiv
         kQ2YwmZLyQ+B1XeKA/wnIwplPaIhNEOAn1Ok4v2nUSXDH+0o6c5+PvQ8qEb4g3+klpTk
         a9+4Fp+UmOf9EVj6TrtnMaqagrQB5eimp4y1UuhFpEOrjIQoA9UiLR2drmCd8gGBna40
         XJoK2s5XfU+2DcjVnH7zjK7h5njdVBBUbe0y6rtlvRr3GfoDHrEiveOfe3EE/TH1x9X+
         fuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455302; x=1789060102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=ho6+6aoIbKlKCzaKuqvPHVfm5rXrr2v2o17vajSdzSUrQCDcBdRHRkLXKvOGA4n253
         Dzm0TDoPqE0Z+aAVAuyDhDxqa30VtrDQQcU8l67qmPtcSyCME44GkWSlwhCL6tEC/h+R
         v4pBzOzXS8RNYxsnbZUZK9HBgs+6jTuycCBZY/0ywgbTs7sqQSmwxY69XA+rRv6QzMWR
         8j2IRbggppB1hHa9/YH7HUgsgO+Uut+xT7aWP0hwin86mOhXfb8hWSR24IYeJn95pjar
         EWUH4Ds1bHQjq94ujTvsAl5EOuEW6u+dq7g3NngjMrl/9QC05llKuu9jhPdSzybzvBjY
         Wo8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3LAnOYBelWc0MVEo1AD530x2fvla/9NVjyLs5jOEigo0iEVkKHJnxIHLCgBmJ09bLr0eFdyYbVAD8OYw=@vger.kernel.org
X-Gm-Message-State: AFuF++mPPJQLhQ59XV9TUpVfP2oCuE4XgqdNdnKWbVGpUcPnA3LQuNA+
	bLljrPZap/Kxd9GTYMQDFSVoaehCGneqGy1aSlSJvmLgm+/v2StV6a7G
X-Gm-Gg: AYBFou3QWJZbVweWoQpWsyvWtAoFAPe3pQDzFyTYVv+iq2cTQmaJqblR6biKAJEzMIP
	oDcOpeKaft5LFJmwHgfnbGECrC8wHj1fEA6aSFM5rb4+Z4x9OM0+PLStxSNuCj0hT0kz9T0BFJx
	1/5AMps2sGK3hVOkGyOX3YzqPHoJCxHQH4ndHm7mxFcSNKYlgNNeDkLZyKbDnBNgTw6OOr2l5VZ
	EJgyT51HN3ZMg+os6KvaxizBivJE86Wv2dok/53DcWjzuwO9oEoGGD83XkZN0+fNi7qpFFNMZ5L
	y7v3Wqjjqn010ExMWVYW1eDHBIV5dYkDXvCmoAKnc6Sl/MtnsAYvfnP8tUp5nlaFD6jvjfz0my4
	jrGmrADOoiJ8LGSV859JCmVvIAJNWBSa2JVa3iUg/AhS5trlnSl7XiOex18o9ggf0+wWoVmVYVL
	X5oFAlPkNf3kjanc0K3y9g9bUUUgdGhn8ErmWTUcHSrTrUE4IL+LB1NvpZkSHWNKV1qOQ6Tzhi/
	V0zENVHO9T7ChVZbXa8+fHrPxIRf3vVWBjJEiUig7lBJ0XXEmj0dYVaAWtCV5elWUxa6hk37cey
	yZTxV4LESfsTihsOhsBL2EyGa2aHVBk/RUoZ3Q==
X-Received: by 2002:a05:600c:c168:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49cf5bc7608mr35422415e9.4.1788455301357;
        Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:20 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:02 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port 2
 in SGMII mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
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
index 3df17700b632f..2ff7bb8d6ac43 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -99,11 +99,29 @@ &dsi2dp_out {
 	remote-endpoint = <&dp_1_connector_in>;
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
 /* Aquila ETH_1 */
 &enetc_port0 {
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

