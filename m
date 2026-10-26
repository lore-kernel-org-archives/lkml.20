Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039456;
	b=k+5bTr9Pqwqm6JDIzN6f7fUfrn7y8sq8X7z/5rLTA4XLufdlc1O3hJoaTSqfpWI6apVc
	 Yb7gcFQ3n4QxJsMxclRO6Y7urs1okpn3Vyq9oTqCQaYdOA5k2817fYpe4fpeRt59xMACM
	 /druoyuRLhLnhS4Gdu3J8aSoJuLhm2VQvtJ4EkzExvsvX0H84x5l7AFXAqKcEltYKEnZS
	 Ue8/8J8qWBZshe7A9hmdXg0+sLIUTSoS+j1wHDocsm854+V5GSPWOkK+snRYPrsjYn+3i
	 NDcHH73DkpwPMxb0zz4Pxb/EGQLWIKoflVKkxqSRySug91+S11c/3PDPUvcqTRg0m5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
	b=MQe+wGEvaiIGQvvLm9Q10HQNiKD+LdBtQD+yA/zmFOeHmVTBKavV4gKfGueHh8ZxVrym
	 Pyquxcg12Ar4mp6rfvhIWu70z08LPzJrpUz6hx45m/1gv0J1NinUX1O/I01ej/X9h8VPc
	 n5NnPFcJaW+L7/Nn/up61I7BgdtzbjgdanCYyO2lldbcr6YWK3godyELHxQKmGvVlW7ML
	 raVil27pZoUjHS8NmmcmjP46UIrfUQ3XsrVTgp5X4qRezrPWAO9YYFLIbub1WToOwMqu6
	 ssGooEMMjTatiBpkKxIt3tb/u410yWHnWpLVcMgoHZ4FbBVkP1Mz926Zbxh47Jbf5sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hTCoOzv6;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9586C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hTCoOzv6
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so28600425e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039454; x=1793644254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=hTCoOzv6rALa3SI75UoIcQNJiDrzj4LU5g1ioOom36WJpb3rXXX30L/+d9k5YUVEvS
         f6UzIIeJoOFxbUKGn7CHBi0QAnYGCu85JJdzxSSGWVhAhrKaGoODydeHG+VE6H31y0ED
         AX9/RPNCGDGW8woOzVjVFtfu85NyNfirf19YNhwciQnIAa7lxnkEbxVrd7JXUkaH1PsW
         L4xS+4lhH1eHu5GUeFSGlR+VxwlxP3xH5y+xu50GMS0sQPUyqMucvN9z7m8vjVaylT0t
         dTQgwioRIveCUytbOt371zDYV0d326BC3e8nMSqgWJ7VgwHpUZ3NyStTYJlwt27+owjh
         V31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039454; x=1793644254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=rP4qlvY+UUshk9Ej0Uxv+wQq7nTRN54Fd4Sc14WO5AAj99hcAsmKuXThJPz0wEnZuy
         rknL1y8SDEyFyBiGtSDYqBU8IBlrVUgyXImehF6dn1+zat6Pa2CFNnPr3rRkjje/ida/
         dRipIHMkew+sgesDRXtHXYJjDZTOSlKAowyPa9JMgGuf+10ddAYwKI/nRP2B7l6RSBqO
         IkbiScs3lyK5h1nSXEDln4uSxLXhV82+1jNgMIxNyiVm5nUw4hLH91cXqK08SHNQx4OJ
         SD5U99aS5olkN2q0GkC9QV4agvVDiN1xEMAirJwWl3AeWEWu7E1f7IBSoPJOxVwB+5sR
         Ro0g==
X-Forwarded-Encrypted: i=1; AKwUvBzkues0s7Xde3EuhBywg7IPVCX6xswxx3/IepME5el8MGaIAq/Lo3V+hu7eLXDDiG6YolSIsG2uLmUq5G0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJbJ7CuLIr0rrO3kfz+g1fctG+Mu0LFCZVFTlLe8/zbEhvzzw4
	mQ+0X909jyspZwn5H+K1de2aAQ9ZgLn0MsBt0W9LFCFDBuYfN88aFExS
X-Gm-Gg: AYBFou3ub8RNmOFvX4RFgBRFnL5YMsZkMNJnVWEGFlGHdiQaz45T1N8ht+mHjre898M
	01Tuew52QlxhMPRvGbrpokTcXIpPjAlZR0ykH0+TFea8j7yGPYLpHIyzLnagrktHGVAnH/NriBf
	l1yvKlJxMxzefHWbiUKdXbhDciSTj+vRYCdJ7druiXTVxJHn1h0kjK7cXONdMSnOik/n6Lo3WGX
	EJk6dtKJo90T0CJ8wzGpObsHOvp42rz0L0ZUlrOFg0pkBWAKnTKnUABlLUwo8dqkEm0LpDlBp/D
	8Fsbrz9crLSQsClEBwSs5XCDn5PoTcnL7AZRvpTbn2TtIdMs8PPKDiqlldT8BoF260XhDuxiBcz
	OzJsjJnOaIS8gY+4HFdxY6/QH5LgfCPduv+CWYHGEIqHRBiXO10Y0m0pPCvCZTk4zcuE428kIkG
	fjlDB0X7VRoyvoEcww7tM+G9DmSM08+Qk07CEdEHyWpSdqHds+yLIUC0KjoR5YypBvOmZSIVxp+
	MG0zKyRNq7iXjInooigJhSPrzN6MonFCvPjWevFRO3tQ410EUXJoqA6Yk6XDFa2c5LMEmWfAi2o
	iTy/KA==
X-Received: by 2002:a05:600c:3486:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a35ac95955mr122964795e9.15.1793039453713;
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.15.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm250727985e9.1.2026.10.26.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Mon, 26 Oct 2026 20:21:50 +0200
Message-ID: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add and enable the DT nodes for USB1 and USB2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..5fe245b62306 100644
--- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+
 #include "imx95.dtsi"
 
 / {
@@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
 		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
 		pinctrl-names = "default";
 	};
+
+	ptn5110_usb3: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		/* USB_PTN5110_ALERT_B - shared IRQ line with tcpc@51 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP32) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB1 3.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec1_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_usb2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP30) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB2 2.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			port {
+				typec2_con_hs: endpoint {
+					remote-endpoint = <&usb2_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -145,6 +213,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD1__GPIO4_IO_BIT25				0x31e>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		bootph-pre-ram;
 		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
@@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
 	};
 };
 
+&usb2 {
+	disable-over-current;
+	dr_mode = "host";
+	usb-role-switch;
+
+	status = "okay";
+
+	port {
+		usb2_data_hs: endpoint {
+			remote-endpoint = <&typec2_con_hs>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec1_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec1_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	bootph-pre-ram;
 	bus-width = <8>;
-- 
2.53.0

