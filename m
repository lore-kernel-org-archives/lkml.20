Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873887;
	b=ZFbv5A7Z5+IpTuCqVn8qlTYBe6lamqF53Zcl8/0uZPNdnVfEVXNLQ9YOXrAUQKzA2aVG
	 6i2LVjeyl95WagMhJHTFZYxYVDbILpWloUBBmYM1qG0VxKTr7MrT2/VkWiqzbXMI5WbhX
	 fITEEFmzwMApX2H68F70s7oBAzimHoVKHVQMHoAAaGy1YFoKP89vR15gP517KduMiIqc0
	 1wMskTfq3JeaDbQUZnaJFpF7llPxZpgR9Pn3wAq7UkK6N2PINkMecrIT74xWRBXrqhpGu
	 bskMnifThQonp6kBi8PqaOPM9+qqYMECOUmEp72T23RE/ZgZBOpew7afnEZ7XuWTJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
	b=tGzQE+iiBxFC2Nxhor3dliDB4Vm44W1xFSo30MwNPefZb5p7DTBBnvT/uP/W+yr/5/Zh
	 C5DCBADL1RYal/R+nYJxf0i6T6rsZhHjHVVz24gYatsMN52DTZB6gPkkafXNDMzIqHIk8
	 oAiSBeyQUR9p1H+euKruEmGi1gpJgfVBiwDbiZxuaub+0BEUrrHj+5MU69tx1nCmlXgeM
	 LmfTGdtDDDFdujk0g36cHrbFZJsUITeuBM7mXxIwmv9/KzpAu+WFA9hqxjybqjoYqIDj9
	 c2fNzLWczI7kYy18RQSTQrt2Mtw/xMvb8lfDgxAIw0AupVRBwHB0+wKat1lHus3FzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzhWZum6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF4606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCF4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzhWZum6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so11921995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873885; x=1794478685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=fzhWZum68XDcz1+w7vFXdqqJhjlSHjqQr4vD9a3TuutvGZvrj5aQ0khmicXbbxdVUW
         bgnNYBDBNzWTRKEe0EP+wT+XKNH8l9YhmqNzePbrFDxKzyklQGM9Yz2heyTRFRi6GsFU
         zQQ7KJ1TDJ3C3Ra9YiDnGVvl7pkiU/lnDh06YXB4+yAanQfyo3sxHs4uarIzASHADCV2
         XU3eeCPv6G09231PUgwFi8hvDIdEgJyI9BLjWwHT9IGqhEw/8kgGL7Oa6KKAqlshnopA
         h5AEXol4jjDbRJxko2PPQyZGQWyIGlsWl0AkV8Cy830PsR9EDwAIG9rELYY+ovbBAfLZ
         FHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873885; x=1794478685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=wiO3TpBcHN0JcjYAnSWOc4cEqNt8hZJaBpauIxVO/WheqQVxbV1M0ppGGaSMysuiUR
         CMGpIsh27WG+6zSrPkIUZHALNAzs0FT9A/xg52pfOFicYCYKjQpd1nvHb65STXnFaesb
         M4XuzAo5LEBz4UrikTrCncNn0XCdkgqcqAP0B7hNqVNz2thb6yhvvZx/k+4gAZ1oQUbM
         9NHKut2/HKnIrzrdc7zwDhDdpi364OGSexUCwpszUfK2RKS9QJz3UxgV2rX3joFt4DsA
         GmNKBwt0eYdJ3ZfbG+CziG0P+PZzbP3IbAuHZoJJ/6GyZCX9JwQGZnvFf7X7O+3MCIfh
         EY3A==
X-Forwarded-Encrypted: i=1; AKwUvBy1OsPd8kCwQ2eK0JMs1rVHwDjFivDQ8ViX/tAnr5XTkTVhXEuujN2Ege+Wk/VX5yUUpsH08ZlUkuXJIH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k87+2b1m1wC2sE1dZ8kSrTP5wqG600y6jgG9qbl96i32nFRmP
	JU791Hj6oOGqG20/XapC0Z31dD33eC366f2gVsocaFY3MxihoZbfVgE2
X-Gm-Gg: AYBFou0tKJZX/mcJlqFc2t87UKl58HKJcBbu+IIZ5VmJhN2HVKyq3nLuqkqjKQz8BfR
	MGQngtifDOt3mQoEUyB97CnO9NRb9n7AfnLoCxo0mGN7D4qT5THKpNz1VNjKzFOQ23xqiQ7kdG9
	n5b3UBb26O65Rk76cSZuSHZQ4RuMiJvftaKfV363TrEmf4JHWCJc1hL0wd8dhdxl7i0463K70kt
	16ISnpXraoiSiPQ+srEB356NMK8Hxr4cDqAvQs505wrhtup1VF1JxCkEhEaj6OcKeMmff7tXiJr
	MS/Bls95rnvnEfMPjbBNa5tjIY1+4+yCJSkyh+vZhnwavGTlksD4FpAaWm+KDoVvAEkc6Fw7SCz
	t/133pIZztpD6BuIG7Tu3qwpjwKhyljRuzWn407IxNq/4hAoKGxOcPDFMy/vTvoYWlkm6rgZd8p
	QnjI+4IpVlVviL4HF2PJCab2eZ5W9iE8QXzjuRA3xiJIbGjXy/cOexanrhrQPQ6QhCFOIVZfn1O
	dl9pMPzBO4VTWz0JwAogNdSOGBAPwhe9Pfvxl9ycAgb+woGACwonMciZ8qkevE2cJuMhQqzFn0e
	LWl+8fg4mG9Jz4I0q7wiU7JbTFzNFQtGR6CsiHo/AB5p+6OB6hkYbqkbEIOrdVJYkOoaSOjdP5P
	g5G0gIDFzXHks49EXXmI444pxVlry8DBV1JJIZyiXdgGqObR1G1LM
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr374298825e9.29.1793873884933;
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm59305215e9.10.2026.11.05.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
Date: Thu,  5 Nov 2026 11:17:39 +0100
Message-ID: <20261105101739.10614-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet LEDs are physically on the carrier boards, but the
VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
include their LED nodes. Other carriers therefore inherit LED definitions
that may not match their wiring.

Move the LED nodes to the Symphony and Sonata board descriptions through
ethphy0 references, along with the LED binding includes where needed.
Keep the existing LED properties unchanged.

Fixes: c277a3d535bb ("arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY")
Fixes: d3ad2ce2116f ("arm64: dts: freescale: Add support for Variscite DART-MX91")
Fixes: 947771d00bdc ("arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY")
Fixes: bec2988b470e ("arm64: dts: freescale: Add support for Variscite DART-MX95")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 20 -----------------
 .../dts/freescale/imx91-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 20 -----------------
 .../dts/freescale/imx93-var-som-symphony.dts  | 21 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     | 19 ----------------
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 20 -----------------
 8 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e928a3d44b1d..49d20db7de5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -3,6 +3,7 @@
  * Copyright 2024 Variscite Ltd.
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mp-var-som.dtsi"
 
 / {
@@ -129,6 +130,27 @@ ethphy1: ethernet-phy@5 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 61786eee0e82..cbf58aed180a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -8,7 +8,6 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
@@ -155,25 +154,6 @@ ethphy0: ethernet-phy@4 {
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
 			vddio-supply = <&reg_phy_vddio>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index f7e32f9375f5..0f2be56ff7ca 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx91-var-dart.dtsi"
 
 / {
@@ -173,6 +174,27 @@ led@1 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
index a9e44efad13f..ec65cd42c195 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
 
@@ -81,25 +80,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..477f31a4cf88 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -189,6 +189,27 @@ vddio1: vddio-regulator {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..d9ecbc3e9a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -75,25 +75,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 9344a0d99418..ed3e2e1b995c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -8,6 +8,7 @@
  *
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx95-var-dart.dtsi"
 
 / {
@@ -163,6 +164,27 @@ &enetc_port2 {
 	status = "okay";
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index b4c55bd33858..92ff09fe64a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
@@ -193,25 +192,6 @@ ethphy0: ethernet-phy@0 {
 		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10000>;
 		reset-deassert-us = <100000>;
-
-		leds {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_YELLOW>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_GREEN>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-		};
 	};
 };
 
-- 
2.47.3

