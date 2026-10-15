Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC204EFFC0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055744; cv=none; b=Pbbr82GM65zFHLv3tuSXGM+sfZO87orTJI1LHwusfxP5jU8y7hLCepAKqPSq1JEOQfn5LGC3a7ef1CpqvkWY+Ow5tHzPPwMGsOzRn/hZNdSlAx/nD+Dq4Ebl46wp+dY2wDMGlu438C5PBPuyLQQzXkplyNvlDhV16+6/VhXKmP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055744; c=relaxed/simple;
	bh=yikeYPp7xGRz6kX8ppNzHdYYDPdTK+F+8JMGmBs2Wm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rk1N4VHzobEr0yqDxX6fyjB1CcHawsPs16LphjkO/3X2j2m2Q0aEM6ZJmFIYUf3fVLxzPBWx3gqXygYSWcCWOBvmya5PH3c0lkbysK6eG8yTUjWjpckrSV8jSq6wsoy7GWIexu5XEDmg+AG/IfsBJJywRmM7Y5RmaJDqGDRSiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcxYoqQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua9RB0ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcxYoqQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua9RB0ef"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6EhUX644607
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=; b=RcxYoqQhwpkUezVM
	JbS5m0rS7NVHsRSx1cNm/bTXs4RW80IqbJflFe3VSOtycJi+bWaOcnnktbCPohw7
	uOEWM0Up8ahNnvHUS+vytOMDlncUANIthszfCm+hJLk7P6316auHExT/XO2xWtfC
	ulNOJes0lU/YRF8FBqWNfngAAijgAH/GZ11TljkezAGW88ucdm66JrILRnRZkSlG
	NbOfVpz5bFPzXi/rL0kx6X3gFDKl1JziLRnuX9ZGZJfGKhNOYBho4s/3eb5MewFD
	G7pW0kZI0eDsxCwUIEv5PEZF6qZDVG/FD1LxtmA++5YLBlLHi4AZJ2vKJhT0GbiA
	cBxbpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya78r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso465609eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055742; x=1792660542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=;
        b=Ua9RB0efW3skacqSgBmFFk5h9saK+TnFsP5uhbbeaIH7DBEjGgNxGFSUjGfyPdngKn
         LYgydiafkgsYcuOXZY+DzQKVOkeJdmKz8Ec1OiN5bf0CDZ0AvlPAks8SGLV/O2kX3a9l
         CtnboIh4rvzE0oubYmLnev5TwJ8AdKRD2h87xDgb6dxCvUNYFx1ui1BCagY4wXY7idJ/
         PzKEVBQQGizAP2aHwtI3ztYdZfy9nYtxa0TNPv6ZpGaXAmiAsrR5DmL7RCJ1i/07rXCw
         rgryxq+Cf5uiyawZglM1EiBRBr1S+LiJ/86REerrSgABGHaiZuKI/Oor8dyaKGIpIxNv
         tEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055742; x=1792660542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=;
        b=2bN4uRnuw6kVFusaB9WqKy7c3cYO8ddeg3uMfTYxdb4jmkfewonQnECNpguDZPx1hx
         BKB1ikQYU4o38NL5dKSTt2sBD+TzOe80A/RjLJJ7HxWAZmCPDZ3EqtTPabA8RH8r03yv
         gGK8XQB6EjdIrGHIDIWP3yNj0IXM8g67UTrqaDTKZLJkR2JJSUAz8bMr6gitNtKieQcr
         dVXuwlmKD3tlyDupUdQf9xchp717pIbB/wLs34/5xKJEXJz1TafEyOtRz616JuM/ZrMa
         uQnBb5h0Symtg6c3oVpKaELs3FPNL3JqleQC9UHh0UaIq7zMxYY/corfX1AC3JdYvHxf
         gyGA==
X-Forwarded-Encrypted: i=1; AKwUvBxdppCOi275UJjUGddxvwpmbEGA7qTCuPRISTEh3NJL5RzoAQGOUcAOoug9zjBdwvaoL8QAbowK5vvgP+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMPPz1gucFiR4hUVF89xTC/UrkvMpNnBqRooz9oCMN/usLhOj4
	EUmujcJvOWBMOPHfyh3lMAKMuXybg9GJTFeCRa+eA/EI/80JEUsPpzV3/J+cTo7vo+QoIDbPcRj
	YCdWDSkDY+1mtfZaLqvMKpEnKAgj1nJuRRTgpiEBoKwF+Q5jDeaDOTodz4NybdpOt1j4=
X-Gm-Gg: AYBFou3RJRLkeOXVDKFkbcVpync5sf4UAgJ/Dh8GU89Ya/q0a5sQzqcR5shCv3VzKUo
	tFlu+iAGXrSC0dVRBKvrGVUlzg8vqgEcFKPpJHR9IiyvyAnSuJSrAehb5PpjoqQiCHIeR0KBvEm
	iK5PTZg9ZZH5zAcp7F1BM0yX9/jnpPJ2r/8WvFF1n3NnOJfbsbfTPQBl1VqHbuQlcC66JwZ9IFK
	HXezHbZ4f1M8J6hhd+h/07U5Q7CLMsOHoJ0hHpGUbHNY80E5KRXJRJA0xRFZxW8BaMFtVk/bwge
	SJrwCIuoskV3bHeiffTrBYEJxfOAYrk6+PG6BByb2M8WkftI4fqB6wEUKXZy5rSJFY9RQ+de+pK
	hHNnbQX898MVbDpoe9hI5FcGNvg==
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr27217432c88.14.1792055741564;
        Thu, 15 Oct 2026 02:15:41 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr27217315c88.14.1792055739302;
        Thu, 15 Oct 2026 02:15:39 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:39 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:45:28 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=3629;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=yikeYPp7xGRz6kX8ppNzHdYYDPdTK+F+8JMGmBs2Wm0=;
 b=OAsOfCqUiHaJp6H5mVJca/rgpCTRg4+FriWGZm+B2LKe+vQxfgIt+keQVGLrcjSYiZvUimF8h
 Mffi1nN8+doCwi7jOskL3gFC9erRYhf6mB8X/O8swEeLrpfiFKYQRnM
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: j1lVQfTg02cT0OvqcQUW8E_QiMXa4k2Y
X-Proofpoint-ORIG-GUID: j1lVQfTg02cT0OvqcQUW8E_QiMXa4k2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX5o0S395HCMYt
 LSkmOm3DxV2lB1LiHIURtopeWH7glu7oA83g83TzFTS4H6vkDMqAR7tpZFxNS+5WXpmvcxEqDmf
 eva86i7j/nEskrBqyc4Nucm3EqMgjvA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad099be cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX0QJ2af1eOB3g
 WW4dP1UBYf+QYFgmBPwyLcIeXBeUdFTnoYyvjrS6eDbQZJLXMhjGn+FiXzsOPJgiShMkbxgAPEe
 xBZ60/3t3gBlpyZlLnSIWYuIgX4U8GlsIXNvK7seB2XVXaoCqIPaUcpH9go9T5x8vEPC+Uj5gDT
 qJLA68dk72SgErdXnEtwd6ZQC91fJdYc0e+GX4leEjKy7uRPByRN3SWhyYAdqNjaOAX498yBAUA
 JrHPY6fJppY8/CskdEPmC48Q6j+TfY0Zmz2d2YAdDGZzn25PD0LpLZKJa7T7rybRXre+rTErutG
 YleKgxA9wjsk3gPjkfQf5eYSm/XdL+xyM4ZBEmuFOBflZwGkBH3yr3Jh3VZzC0/FEZ8NhOIfjmC
 jHB+oW+kE0ejcQh1fXhg0c9z5oxZ1mlpRFViQ498CXTiJECSsMk1fpxtOtD1BzIwhJiqOlVcFkj
 UOl5dvESl6KcKssMPsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Regulator and pinctrl labels use generic board-level names
(vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
from the bridge chip.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..996f645a3628 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -8,6 +8,7 @@
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -23,6 +24,98 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&pm8150_s4>;
+
+		pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_dsi_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&bridge_dsi_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -67,6 +160,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;

-- 
2.34.1

