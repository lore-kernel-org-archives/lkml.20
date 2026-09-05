Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BE630E82D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571844; cv=none; b=TJ9MxGm+4XN9UvZhBx/CWc/BYuP16d7ZQYVu9Gg1swmJ1oYrFRmv7DySF0EOmGUe9vNrXGF7XJpB8CAN6GAvpWqKKp1kRSQqqZWNwJQvK+Z3VYyTXisH36mNyhLCiq5IVgdS2t9ah8hBt7Nkv+AOpHcyK0TWb/7ur/EZow6KSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571844; c=relaxed/simple;
	bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm9Tb7ZHOdaTWUPZKZbgApKQBUYt6E/w1COLkmYXQze3yM4UAKwEvUFwFCSGkpgAb8JI4vXZKk6NAcqG+5Py1qfJg+dcMky2UXTV9xV5ZR2tPp+9i0/4BMJGpxjIF93PkgNwckD72DkPKDBeHUdETWaINozSMNmwLtXpfgLJ/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1ZZTPcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arBgqUfP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ZZTPcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arBgqUfP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850v7DP877774
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 01:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=; b=H1ZZTPcM48Vv0rPp
	FcauIBrMBMWfpDprsa/jK7mNpskLk+MBbl4aDHvhxJI6WYVSAIVummKbrddi0Miu
	eIR3cVEeKUw4VRMYqplSaXzBaV57OkwjmL2DWkMtB+NTCPsULHSgBjBdMEUCd2Yd
	f5rOkT9ElJUWzTNNqCyjLaGBNetRhaad1e3GgkXMnfy9HMdeN3gLolfwvgWVfLFe
	NL263kaUxnnBikAq9b5y2hmLTnnOgzWtLIa7t+s/OGeEXkcskwlkI9T39ifLKpPj
	pdxxFCs28a+SpMXoCkb91llLdkw+FGSZk4IREheEWHRc5yYPab170EVehQE9q/gg
	RztwtQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01233dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:30:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3989c51d5daso350552a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571839; x=1789176639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=arBgqUfP99ZofWApPEgZJpnB6G3D1uJrUvQca42CduWuTyHdDnAwI+2iXlqg3OpNDw
         xBQi+SPcvw4k6fVKwHvLsnZjz4dF00K7P6LuDY3sqn3Ux39BqcYumJf9+ysIEtxaY+8j
         x9qP7m2/N9Su3M7eBEfCknuT5qh8FO/pUnhRXtWsQ7JUKC0KzUbYm3RdVaICd7OUGqnL
         Ic7WG+WeckL01F32d14KoJfS3UtD2k9eSykVwQ0NmzqHOzR8LVxf9XG4Qg3WLbhXTL1V
         3sKfC0FqWpzB6u9mWfjNBDZuvGdwYkSAD4enKE4bbK5ZwAnQO/i3AVFNVZ96xHjs+zrL
         lZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571839; x=1789176639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=FRdb1uLNf4m2GhBAbpnPHv/GYyNGKjAS/AsK4otja+otlGEnkbatSSqDlcI/hyrdRf
         gjFh0OWFi8cFxZnH/59DeYd12lRtH3RDubBBuzKkZwX+9VaOSJPiMu4g8NlAggD6T305
         kcPCISiTQ8vw4aFXuW888q2OZFwvSt82peJVUo0+mGXdzj9dTFYQmAs7nVTuIuRTVZcN
         e/NB5en2K3fy1AljlYjv+itrQ0csWfxd5Mh4R1t98E9TywzkG5C6HOGWjdnjwDM3VtWT
         4aH6wM9PJ8WSn1xmRFSz5lkG/MVO711d7L39aA59R7RMR8GVmshNziCbcCCG06YWzUtI
         hiww==
X-Forwarded-Encrypted: i=1; AKwUvBzKGslEHn8T0mHorxKBAss8iKl/O6QcD6nPlO2m3cVmZMQOl/n9fZuwc9lqI6qG02Yqd3cG7O4+I+LUfbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nOppV9MolP7J4f3ZcwVw0drg2G5z56G/LRkmpO/ufPoGv+t6DQ
	w8Kh8KI+/2IMgaJVhrZ5kPqjtMzK2I2AKeAk2G3Q4oV/YOIUQYU21jh/0GV/vF9wUh4tocccIdY
	6ZriNt6m6SAPIuGb/P10yf8MFCVHluP7Jp2Icujs3XRYZWIxz9FXFQ3qlW3ThO5y/f1E=
X-Gm-Gg: AYBFou1qiFCZQYAvzFNXt2h+HlUHTWh3yRAMG5S5xN6RG605vW8O/YdrzpvA3FUMKtn
	ERIeVKn5qoeUuOnQE013bkjvSuTnD+AQNYIwmGTsst/sAAuTi9EJwzFjeusZTZ8uIVq6fnEf0YX
	bCZkjL9mGvi3ErhNYb2OcnY7WL+19cbCSiKPRVZDmbWKDRKapIkytSueAyvMeXfQAbeyaHwEQRy
	o1ybIHUzytOXP32RB3ty2x3XY+xTArvNcjGxwkj6vl5Ga281fXNU794GFqFXbHmevCWvYSUmntx
	/VZCTX3Auke2MpYx5CgHXBB4dVfYxHqA0Aql9t+ifFFia7tTGoukJ7FgEaCMfVFOvK6LufeTDQz
	H0Y5PoxYN3aJqaSVUyMMVwt054SQsU1ZBnIYjDVwEaaPurJriTKqOlyyZDopUh67s2GnVgQ6bqB
	pp4ilfJQpooL+D1TN50t8K
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854607a91.6.1788571839122;
        Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854565a91.6.1788571838653;
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:17 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-3-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
In-Reply-To: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4364;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
 b=LQB/IRje+CR1Ov0URj40aSCPy3t7eP3fgqM2OR83fm3VezT9Oq7JuV4Dz13/wtL01PnYiTd0D
 MTPVGJxOCo8B2k7Kvq7gBX9uUP66nLwduk3CI/7s0JX7wvBfLVyzEtE
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9b70c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=So681qseQLv-PdXLquQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX+PX2qT6heC+7
 /XoZyb2wCpiR81kzCseN86SoMrJ08DspnmnzdZIShKwKsk4KN9EITRsp0deOD4qTxtwdQttjPOf
 iRC9LvoCCmOVcLA8+osQY06Z1000nsUQs3wf7ZepWxeH0QV+o22Ugp0G5IzECIUT41RgrFAn6uW
 1arnaj6bG7aAXJkm/vtuWbCxHBPKzMTY6S0bpfF9ZXt8pEV4ezfb2Ps1g0qs4/lhW8doo5dJ7GD
 K96Kb+ErlpJpFcuo5YIyCpZfHrLN1NB2YQn5QJKmfcsbvmJm/axqQ0c9sIwVcCL2PW05zsM/l/L
 iI+4EpPr7LiWh4jozn+RDKeiOjT/W+ViSFsUtfFHS3iqFs9Src+eoW4/yQG5eNJU6rZIkk9m8LB
 9ggPMKd6d4tNhLqOKcuYWh6aUTnj8h6InbtzXyePhWSNm8/fQsBs5IYp1urm/b803il48YSfW0A
 SXbdWcCALelUaoAFpkw==
X-Proofpoint-GUID: ReoF0QNs2FYc0Ffx5REKzjAC2qwFH6mW
X-Proofpoint-ORIG-GUID: ReoF0QNs2FYc0Ffx5REKzjAC2qwFH6mW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfXxb4FNi3JQ3+9
 UNou3vkdz8g64dLE15SzLHkAz/Szpb8UXU9T+kWqOsJjpvcpPcdv9VxcXai5sGlN48q/yZ0XMAx
 ICiykKzNz3qlo2IgAn1JqvWpe6Qwulc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050011

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for the boe,dv215fhm-r01 panel, matched
against the panel-simple-lvds-dual-ports binding which supplies the
panel's size and timing internally.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   6 ++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8cf82e7067e2..d3c09bb4d1a9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,12 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := \
+	qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo \
+	qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..5501ea09f43b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,106 @@
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
+	model = "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&vreg_l18b_1p8>;
+        };
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l18b_1p8>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+

-- 
2.34.1

