Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883411;
	b=eWlV/lw75eZPSDtMYs/OqU72dNtZKq6SxAopjlpBmQ7GJLnoxVf/uC/ANGKtzos7kNGC
	 bTOlrDf19VZmf3+mzZdgZfKlEEZ0M7EUhhu+jQ83jGg2hTttKeJgyuChBjUjwOIzn4oCb
	 h02zaj18dKhn5aVdnQMu4qDUyl4XZuo8bFK/Mk2w6ZuUbpASbdXCGGLuacaLJrUnccV9Z
	 ewQaGMQjNqOMOE9VKKkyuPsDHGNzk3Z5mISER6mV3q2KxLBpIDhL504ZO6EY2mqjjKe1b
	 WbQXOlasX6a388LMSZR2grXIB5zwfdGDzxEcpwOF7nEPiKPa5HvdeMTGPTg5r2D+Zfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hDfNQGaMHPF8/lAQyaYMK+yddYZ7WKxafMYxSFuu9ys=;
	b=4kyRdzsLdhIKydQL5iU/o8HYgLG9y5InQK/WL6MqZxo65dtoUQi+ZgtjIiYlS4KJPKMU
	 t+24py11fTH1zP+MUXIv1cPP2W4/jug/YC+ikDh1LeJWOSYSmOgghlFt4kNScUPHSiPqA
	 139b5Ujjva/DLdvw+wCZXLQq3hF3uOa4KQbSYzBRejQkDg9DJj7BMkolzIDelAoUi1pHy
	 ZxwK/pUypJcRVQ2GzSbLNicaWV8lxHCl2t3wu97sBcQscZr4GaC+tkQPudVzFGgktgL7H
	 A24JCUDoZ7Dt45D0eMtAd27em9GQwbnXAXi/Pw4pg4VBWktIOL6AqYVDJNNLzGaw0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oE8fNzN8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039C606A330;
	Tue, 17 Nov 2026 02:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C039C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oE8fNzN8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aPnb844321;
	Tue, 17 Nov 2026 02:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDfNQGaMHPF8/lAQyaYMK+yddYZ7WKxafMYxSFuu9ys=; b=oE8fNzN8TqUsHt19
	e48vr8QNSjF7VLFJ8kBQN7K1oeQ9JWROkttRXHucs95488UoG2I3VzYo4gJfDUbZ
	bcs0sLMQqm77YsetsCOkxJOEvM/UtyBwsuCQYPb6C4nxGf4XQYwRrJckZfe8weUd
	NhE80mevOQlaURZW5s0ym5fjNcOBkH5mv4M3t51awFiIKl3OXobP17j805X0rWI+
	TiYdAgi0C/c+t9pSTcP4cK9yooiKm4iF6W6ZGV2Y07OJgp5+XBYqTVXsUaCACatL
	O4DTxA0jPOw1Uk/aY5tFXBpZXkTFNzGxhtg6ZQb25ERWovbuNzrexZ04v9RLeOFB
	DObkxA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h0e5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 02:43:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2gKNT3843798;
	Tue, 17 Nov 2026 02:42:21 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6AH2gJAL3843768;
	Tue, 17 Nov 2026 02:42:20 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 08:12:11 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: add Monaco Draco EVK board
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-monaco-draco-v1-3-e42d1673148d@oss.qualcomm.com>
References: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
In-Reply-To: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
        Sravani Tella <tella@hu-tella-hyd.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: eeqUX5QAP4OsW5LwF2PUGbOajaKMupgk
X-Proofpoint-ORIG-GUID: eeqUX5QAP4OsW5LwF2PUGbOajaKMupgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfXwhWCtU9TfQEi
 CtAkBahIv3/aknrhHUjkNRrVXAdncLcilQk+LxGTpsM4In3hegunXohb6zzkewGt/Rnk2684o8Q
 036jKZNN09bJIJ9A2NX4Gq7sy0AV8e43gV9ej1/HSe8qeGEQL0cjWPQR4CoahAZci3qK/iWEsn+
 inlgRseZtV3Em450r2MaMAV1NHZDex7rGw96suqz48M5DHpFRIaJvlmFgSsmHYcHNsb92AnYm7S
 Ek7MBDacHrWUsoQCu9Hh6bTibByyMPCV5ZiM6q1/G0ueRJSD+/7f+0S3gDOIwmm69kLof0zP0AN
 udeJYvU1/tRm8+uuW7kXTG9unvx6iysC3jRxlKTYD8kkGUg1b9fSav53eInP95z7NHrB/R4GdbK
 6R0VGYSVhmr/LH8EGplWy1Aqaagf1Fdioq0q/5KN4ikO0IDFeL9mlDsdCF26YFXjNvaA7Be28oR
 hdan1pj3kPiG9B3Le+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfX2RyIBLm78FPZ
 dG8QMdL2uvXOVNHnswdw2cepbl8swc4Rbu9tPzp6x1g5Kd5UIMtB+rns5FonG1SGT89b1XrvjFB
 88r1ebSJO3tIM/YgnqvfpesFcISBUaQ=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afbbf4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zhs_MnsxJraOr76gmroA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170010

The Monaco Draco EVK pairs the Monaco Draco AC SoM with the Draco
carrier board. Add its device tree, describing the board-specific
peripherals layered on top of the SoM:

 - I2C GPIO expanders: 4x KTS1622 on i2c14 and 2x TCA9538 on i2c15
 - EEPROM with a MAC-address nvmem layout on i2c15
 - Native DisplayPort output (DP0)
 - Gigabit Ethernet (ethernet0, 2500base-x) over an HSGMII PHY, with
   the MAC address sourced from the EEPROM
 - Dual PCIe (pcie0/pcie1) behind an on-board TC9563 PCIe switch
 - ST33HTPM TPM over spi10
 - AMC6821 fan controller on i2c13
 - M.2 E-key slot connector and carrier debug UART (uart2)

Also hook the board dtb into the Makefile, together with an EL2
overlay variant that boots the kernel at EL2 for KVM.

Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
Co-developed-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
Signed-off-by: Sravani Tella <tella@hu-tella-hyd.qualcomm.com>
Co-developed-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts | 546 ++++++++++++++++++++++++++
 2 files changed, 551 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..7212bd1d2358 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
+
+monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
new file mode 100644
index 000000000000..ad416f586514
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+
+#include "monaco-draco-ac-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Monaco Draco EVK";
+	compatible = "qcom,monaco-draco-evk", "qcom,monaco-draco-ac-som",
+		     "qcom,qcs8300";
+	chassis-type = "embedded";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial1 = &uart2;
+	};
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_keye_3p3: regulator-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_keye_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_dp0_pwr: regulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP0_PWR_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+		dp-pwr-supply = <&vreg_dp0_pwr>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_keye_3p3>;
+
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&tc9563_pcie1_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	fan_controller: fan@1a {
+		compatible = "ti,amc6821";
+		reg = <0x1a>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+};
+
+&i2c14 {
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@22 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x22>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@23 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		pwr-en0-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "pwr_en0";
+		};
+
+		pwr-en1-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "pwr_en1";
+		};
+
+		pwr-en4-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "pwr_en4";
+		};
+
+		pwr-en6-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "pwr_en6";
+		};
+
+		pwr-en8-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "pwr_en8";
+		};
+
+		keye-pwr-en1-hog {
+			gpio-hog;
+			gpios = <9 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "keye_pwr_en1";
+		};
+
+		keye-pwr-en2-hog {
+			gpio-hog;
+			gpios = <10 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "keye_pwr_en2";
+		};
+	};
+};
+
+&i2c15 {
+	status = "okay";
+
+	expander4: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander5: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	iommu-map = <0x0 &pcie_smmu 0x0 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
+		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
+		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
+		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
+		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
+		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
+		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
+		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+		i2c-parent = <&i2c15 0x77>;
+		resx-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+
+			port {
+				tc9563_pcie1_ep: endpoint {
+					remote-endpoint = <&m2_e_pcie_ep>;
+				};
+			};
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pcie@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
+&qup_i2c13_data_clk {
+	drive-strength = <6>;
+	bias-pull-up;
+};
+
+&spi10 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	bt_en: bt-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio96";
+		function = "gpio";
+		bias-disable;
+		output-high;
+	};
+};
+
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};

-- 
2.34.1

