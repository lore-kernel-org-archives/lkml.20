Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569697;
	b=asWXjld7rAps2B91rmoLNp5dOHusth54ngam/fpqaJF3OUdcH0zDDvrjTULJq2gLlEuE
	 QbcLXneCfQfhYAxR9mT1uYRgDqtnrA4pjt/mJ1mfyOkHQtSUTrIrMz4vzdjZ3w4xMkV/3
	 fSorVaZtVDII4G16Xr8oHRBrzmxXvRdxiFV7xLiKweRgbnIthJe+Ru58x08JJKhsPAc/V
	 g4tsTlXtS9B29/eP6ph/26onYLMytAt3eNRirQGsgunp7Rkxa0xkikrkc7O1OLnyp3Io2
	 9wgGV6Bu5TyQv2GJv8x0Z06tzEKzb8gmDQV/p9SDt9lpaC8u02VjDkMI9FzVc0N4bjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lXcHruhjRKAPEqFA6sg93KcL2jbWl+CKTptsYtYT2HQ=;
	b=fgVpYir0ryLLTbtQDTq9VREkzKSdORgxo9nEnYv4WDmyps7LjrwvkGKb/LwbWE0NTEtm
	 v4jZ37vBRcrOyREdf4VHixlaCiFOSfP51siCk80GaZmRXh9416OzpDGma4zhP1xcjJ2ku
	 u3OCFM12FD/+un/bIvnj9U1IOAjc92uU2q7W0DVUnYC8a6JiDnBob3q6wCWSlmV0IJ4U/
	 St5GIHfgj9lrXupCP+jaInQMSRrTFO2xCeKI7mMSwLYfANpvx5ACeG2PoXYN7qx4e71ky
	 QTQH97KvqHJNkZmkyPLCsQf4fHfvVSyN1DyMUBPygoeh3nH2VyKFWbRAogUP1GMogFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnQEJhmH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5898606A323;
	Fri, 13 Nov 2026 11:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5898606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnQEJhmH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA50XJ1161799;
	Fri, 13 Nov 2026 11:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXcHruhjRKAPEqFA6sg93KcL2jbWl+CKTptsYtYT2HQ=; b=dnQEJhmHSAB8sliL
	QkUiozPI7g33yoRsSzyJugUSvLfApSE07Xi6nydwc0h+PTaV/AMw3r0DJ2cHEP5k
	NXE4adVSCy90lclUjEqiyPg+ii3/cSWx0yDRE+8t7iNK+tbP+OWfLPJ4yJW89PlL
	FYyM5zrBtDJiFJMHE6BRLLWmn96tzsBXjJhZv5WJHAvchUhsJ8r+o7HNIplgS/fx
	x7bc3DewWThxyziePCDxVBP/KjLUNJOgofoFE+qmIcQPs1hUiOGgqWdzvCCYkWZO
	sV91fHx7TZjCBktlvz5tzVJm78jXRulVA2tAhTdobT6Q7tfyiUuBoPK3yfK79dKQ
	fOjYDA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g208d2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 11:34:50 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNaY2811647;
	Fri, 13 Nov 2026 10:55:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6ADAtNJm2811660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D473EA75; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 13 Nov 2026 16:25:19 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: lemans-draco-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261113-draco-evk-display-v1-7-28a19c6aea87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=3981;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=JaOcqqVyw72kcQqad1xHiT/Aa9JC9TQrhpCYKdkfS+E=;
 b=HUnYYnQyxPXq9AtrRzsHuZ65Ew7TwgqhpeZYvf35XEBMTuP7BqduYHOca++GKAYhbnWReWqFe
 x420VMZSLFVCwvvFOeKZRgKPQcxk1qs7RRMEgD3esCoSpFVSO+5PJuH
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX1KEVa1l+4JfQ
 0wTcYVEdctG+3nx3qW35O/cGhtU/CwNOQq9ga0RKvYBFfqRZzNXYHeMK0yeIINri+G+tCxYYcUH
 5QAXRPwgxsnOB/3/vbvMxe1Jh9P/byd+9zKcRIoWKQco5U4pg6EDjqlp4dDEIUFC02RxmwpSKP5
 N7sEKdo1V7LChmdf0s7VnP4m4YKapj+i4M2ibYv7gv/+xX0atwEYe/5zKKq4z6l1Hlitko2dm6o
 bKH+IjnRVQTnli3i+qNMtErhGneJ9SdUJCjt5BUrV5+n6mHF7AuAr7dasT0R5yc0bWTU0j3T94r
 Bpd7IIucDWAjZFrPoYwxcL2TLJUOZVMv47aMNoCCh044gfkvwpAxoj1nBrMslLNNQR7v44x9TQi
 ZgWSS7HaCRPeyk67VWUYJPwkqyT1BpXTb5Fj0BY+AOKn051W8xkPtyuPkWydh7vY0F8bAIBmW9N
 OKZaM0JBDiqwxk5vw3Q==
X-Proofpoint-ORIG-GUID: 6YbI1vBd6xGV1H73Cd1eaobbSPfw8LVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX/DSFV/GCEAGH
 9Sp96ks01OWgARHqqRlQdDRPA9VkniJGcRRx6vgEQUtCDDw6v3JM/iUkilL+ampPngKFPBj76DJ
 rfLW07vS9y8JtAZfvp576p/0irJmdxs=
X-Proofpoint-GUID: 6YbI1vBd6xGV1H73Cd1eaobbSPfw8LVA
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6f5db cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LHCJLpAu2B1udcNI4aUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130046

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
JDISP1 22pin connector on the carrier card.

DSI0 from SoC is routed through MUX which can be selected by DIP
switch for enabling this 22pin connector. Add the JD9365DA-H3 panel,
GPIO expander at I2C1 mux channel 0 address 0x45 for panel power,
reset and backlight, and the Goodix GT9271 touch controller. DIP Switch
SW2.4 need to be OFF for this to work.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +
 .../qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso | 94 ++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b100340e61d1..063b2aa4bca2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
 lemans-draco-evk-raspberrypi-dsi-7inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-raspberrypi-dsi-7inch.dtbo
+
+lemans-draco-evk-waveshare-dsi-8inch-dtbs := lemans-draco-evk.dtb lemans-draco-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-waveshare-dsi-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..31cd1a46c32b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,94 @@
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
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-avdd";
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-iovcc";
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		regulator-name = "panel-vcc";
+		enable-active-high;
+		regulator-always-on;
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
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wsgpio: gpio@45 {
+				compatible = "waveshare,dsi-touch-gpio";
+				reg = <0x45>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			touch: goodix@5d {
+				compatible = "goodix,gt9271";
+				reg = <0x5d>;
+				reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
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
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
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
+	data-lanes = <0 1 2 3>;
+};

-- 
2.34.1

