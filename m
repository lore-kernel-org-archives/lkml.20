Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567334;
	b=PyTwSzhUw9BIiON3AbkZSxlbmXdyaKc27ejHDkTv8sU/2qTZsd8JtiAs10sDxzFzVNrB
	 oKhRvWf+h4OkfnjvZ1ZYseE9CKZlAQPTtpqmEd60GKqVLIuD2U1YuqkimVHD8UwKFv6Vm
	 ly0NAd7ucsTVcU1j/IcC0EoARnvX5+UTz2SXjpriVx2FcoXzEJN6QkV2fX4JKHs0kVku1
	 fNO9p3jmlRVoN9pkvQPZM26eyu7mKnp1D8fq/hD/9nBAOkRLHU0n8Ny5+vA1eYI/elVjp
	 H7EBK2t7gebniMT1tRVDGOBAduaghVfbU0vp/XExJlLnZt4G9PkrJdHEUOs33uauWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kPojTCRIq4pkS+/IV9EP8AtwFGPdxcba4trQ7K7P0Ow=;
	b=jfkCZJqY4Y4Qm4NLIww9pW+6ZLbxlC90IOJxOdMib5a6ENPSzwkGAFoIce7DjPSGP84R
	 bXC+SfUTHFzAsVhfxHMBo7U9Un/ZmX+LGov/tyM6NbpnX45dNDikmuq6YQEE8SrECmYwc
	 UPC7X80F6sfg6wNerc5XjNBACEXmzURtsgbxlWc1+ReC2jmxSVdbG97nvYZzwOVh24Y7g
	 eSaaX88ZkMM0yTp6tE4xDyaqinkYykyKmDlE/9pjuKaaqimpqvexk+0Qpz8avO4apxKnl
	 I6be6lZYL/SrivqFd4dRHnSDqcjZDUdZRmP1ZiITFRHZm3f2qjGnUWnQx5lvZtLjb2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jkdoA/39";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD760A261E;
	Fri, 13 Nov 2026 10:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CD760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkdoA/39
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VSqq1527725;
	Fri, 13 Nov 2026 10:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPojTCRIq4pkS+/IV9EP8AtwFGPdxcba4trQ7K7P0Ow=; b=jkdoA/39vJGL41Tv
	1nlCmMJxzdj4kbLdFbbeLuu+V2aqmdsZdKJpykDW0QhaKlRUFQ/ZNoyvITJwhvgC
	uZc/Kd7VKFrRvnFC+AGPmQABAPxQRUqCOywMKt1IRRqrePkZ6Tlcvc5djUqIc8+a
	Y2pKrvCufl8Tl/lsMqwAJFINzZ6lhJVhRiI2qAWWF0vMt8H3Z/ETuGqKO/Gk0oL0
	ufE5hPIv0oWiF09PhXvfu42hxhCSbT4aXKmHdzbE2GSWM5spyqdfPKdb+qGaVYZl
	tcnGvpiOC18ul5XrSH0GRuQIN02eoUpjkadPdQNY17VqxYiDfU8sc8Sg803Td2aQ
	OXN8FA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8vw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtOTa2811674;
	Fri, 13 Nov 2026 10:55:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6ADAtNnh2811661
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D1E6FA74; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 13 Nov 2026 16:25:18 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: lemans-draco-evk: Add RPi 7-inch DSI
 panel overlay
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
Message-Id: <20261113-draco-evk-display-v1-6-28a19c6aea87@oss.qualcomm.com>
References: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
In-Reply-To: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=4074;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=8XmqO2IqMTC2SV1CYu2wxezokIczKT7Ixco2MMmHJxE=;
 b=vO75ALrUPSkGGFtQBts6ZxCfZczrn7jvK2dqPd0HX4LlQwUKdvdIiFrS23UVtaXYkC37+ghlA
 ycwyIZFAiTqDWd2gH7UbAeVt4pv0dhbMWgJkoe6Hl9QytJkjIBbG9X5
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfX+q+Cc1PoXqgn
 QSoiAEz7V4yRh3Q2CVms7Jldr/UIQXycr6vSuZrovy3xg4991542L3PcUuZE99y216lyIrkylpi
 7gvoijNcl0oeyf2k6Oym0VbqUhiBJ1KZRcMZPlT8ku3EudRXUw329foKeZ59muqt/F4Q1uvEgMR
 b5pXCHrrPp/Dw5VI01yU0BgYYuAC1ZZgIBJXYsnhCMD+ib3B+zGE4m0a/uLfTo7rih6NtG4g51L
 2fBkqTWxDWHoslotFF91ZLlo55y1lN5pw/GZT4lug5rdhhUpmETOWuIl8jW2ZCO7BCoNSv8WvsM
 hnFjKTIEHiqdbeJ3BXp1o0raVGxFzY1bs87XzG3xNG0izq9nSuvh0RKnPlUNInmeQ+jastcUI0J
 0pOHIsCuAEoy8Qpxmf7UhosqyK1OrYI/ucr6pEzyMhXkJQBZdFCoZXuLMddmu8I31z04QfZALpx
 lyRFivMTt5rQrE01dDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfXwPrT1a1qLdAg
 nLck6qgUzlLl5jv1cLESwQ9KztRn07Psx9G77C3nTX8AK07R5Jv5SJrz1Z4lnbasUWCyxPSvKif
 OZLdpqX3OeyFtht1yLD7ctzw4CF7dLg=
X-Proofpoint-ORIG-GUID: JHKe5dP50mm6n31iVuXhpw4BgbeB-8SN
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6ec9e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=j3tafkAdywyu2wedFDsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JHKe5dP50mm6n31iVuXhpw4BgbeB-8SN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130043

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to JDSIP1 22pin connector on the carrier card.

DSI0 from SoC is routed through MUX which can be selected by DIP
switch for enabling this 22pin connector. Add the regulator and
backlight controller at I2C1 mux channel 0 address 0x45, panel power
and reset control, and a 2-lane DSI connection. DIP Switch SW2.4 need
to be OFF for this to work.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +
 .../lemans-draco-evk-raspberrypi-dsi-7inch.dtso    | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b50b38c15c6b..b100340e61d1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
 lemans-draco-evk-lvds-auo,g133han01-dtbs := lemans-draco-evk.dtb lemans-draco-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
+
+lemans-draco-evk-raspberrypi-dsi-7inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..ec172be7ce5f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mcu: gpio@45 {
+				compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+				reg = <0x45>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				#pwm-cells = <3>;
+			};
+
+			touchscreen@5d {
+				compatible = "goodix,gt911";
+				reg = <0x5d>;
+				AVDD28-supply = <&reg_dsi_touch>;
+				touchscreen-size-x = <720>;
+				touchscreen-size-y = <1280>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};

-- 
2.34.1

