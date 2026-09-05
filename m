Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4AA288C2D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571839; cv=none; b=DZx9XxK21Fm7dK+wB49kpFsBTdl06B0PTKa/yOEUGLwrYI5Zx7WQDFO8h0tGGJFl2G/px/Rw9bEdc490MgpTbGJ/B63J28actGNjq8RNy1K+Rl7KPqwV+dEw/OZoxNLaVf9KXs4iu/+ITvBJyklZ/ib6ELJYLMUS2GzxhLuR7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571839; c=relaxed/simple;
	bh=TjkylalUGxIke/ZZSHmCZIbPIqjC2JgfNl/TIVr8fK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ju0mGWU7//PWQhB7uYefuDiH/JUhs5hcvs+QRO903wGmvJ9HR8Qlt6YmiEydT3PbyH5cK2JWdwJ4bKAJgkCvN6+J+rUVqTsVUkfyBPUTDx3L6sAtK+zkSBUmcDaLMdpVEW6Dow0DpWlD0QlxzL1OgNYqfAPz1G2r/X7qctBbrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8udeMRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xqy2A4Zb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8udeMRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqy2A4Zb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vI66334248
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 01:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=; b=b8udeMRgOUx0GQwC
	YBReZ50G1bTEEnaVnRgyoXtgwegDF2JXewyAjMgoawbVSaNZaSAj8gG7IsmQ0ezT
	eC9OFcaak9HGKamx1ficNbm6Cl/w9IZDsbazzFrptPCxephcKPe5kfRneuTZIHwL
	4LmPnut7ukYsh9qaC3anNGh7sMJzbbSWQxdH3fmN0s5ns7q5BpAPyjUlpw6kuF2d
	U4kaBnV12yQEUlapz7bmYpxpx1hwSh7tUuMV+v5aA+1J8MW3ijVnIrODcLwfgczo
	/v8qvlUqNEttgq0AroGiSdfJM0NshX8bFjfq9tTi/Jw9Nj1hwGnePhqNpfIlo47c
	rcZJxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fn2fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:30:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d3a12589so323706a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571835; x=1789176635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=;
        b=Xqy2A4ZbBU0ltGUaQsxvhwcaVzS69kBzAriV3wSV754sQNUF0jyBtjXe59ZOdg74Tf
         yBguiQs5xzR1/CcQFB0TRRsTlT7JDrB1RkBl0vyAG3g6+On+3Lmf9aSBrwa+TIEM3Mxq
         qwpwdV8/cr2LoW4qhk28AsOk0F4W30VEFY7n4owpT6IdipSheLNJWFKzyBYNzxx32LPO
         +tqdqsuTugafBvuG9mXLSgmES2xC3JqyjAx03325072E6k2tY385iQrPJdHwgGx46cpm
         gIpFqrDt1ZELXjCQN72/W6y/MF+WdlH4U3QA1LvZNkCgt+jjmXeBqvCezxg2EovNZU3N
         Ntvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571835; x=1789176635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=;
        b=Mzi3mVjSeQEOgTWds2yMelrXFTEvKc7pFFl9+y34MlLNgXaKz5NDSe6DsBWmEqAKM2
         1PBHyDLkDyHLGDyeTP19tdRQmRwTwoStZw31JTM9xgsIkTEldD5PrWr18M+4tmSyF2W9
         e/4LHZP9zDLXiG5HKyPI48rheVFB6WOEbjrBL3VRdDWcCAROJEOTsZ0d0fjytAS9X0+O
         IPin1uUmljNBufHQa6AOlV4wbR+4yY79FrO4KH79EubEMU/bF2rWaqFdr77LnT0/Kld4
         kPnrTbg3sGKpZ0V0U3wjacEFoM5RqRg0WmwFBT6B6M/cbxg3q/g0l85gJ9HH9aBfGzgE
         rSag==
X-Forwarded-Encrypted: i=1; AKwUvBz3rQvoXmmsD/ZcxWpg1FhXDiOs8uVgmMWUVvu9c+BALzMl6uIxUn706MgOK8JUZtRD+Am+/qDsZ1X2Ry0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhzgr5omnCsRifBNwyf9EsHGubJjzh1E2UrVoyMTJ1wqiUgO4x
	MaUUGzKBI2n21yrYGwB89+ibcItTFPkLL85ngqveSlukl0fXlgA89xUZv+Z55YPaW27C+7atxb6
	zOvXAqcYbQA48njRyLYpakeDpjsKd2wzbp6WDOKRbZt2uFPC7hu3zlzfz4OBQMWzEDS8=
X-Gm-Gg: AYBFou2UgRA7SSP1s518InXjzOxQ/umiXYKiRxJ3xDaW5OCe3R9VjkFbXPD56f3Ff5W
	YL6G0fnO0AFL0g7z1itLaadi/LgzfsmYY/mab5ZgMJH7iWtB83afLa+curR0GX5oOYqleJ+b4/4
	4nUJaQuaRh8vLGzqvf9jHrY4eWYnj8KDB98PwHtmKu0X1iIwD/CaqVeSD7dy21bYlFNpT5PobUl
	joYWZhfrR0yohVjC6NsXloSrjedCkbDz09eGoWjaJcqK/y5gXg8yB/x/SNp9HZp9qUjxdOD3PhL
	a/RfDF4o/KGHKwA8HWqVXBQDi53VD7Ixk/enBqGS7dSeh/qb+wTSchIgq79Zk4L1I/J/I4Ipfxm
	St26nJRaDnJpncE5v9KtQLk7k3VUbRJnDjqvgVUrdaqKjEi+CNXhcfJJBiTN8S9Assd+qVwgZcu
	kLLae+mMNC0B66DZJeDNLV
X-Received: by 2002:a17:90b:2786:b0:395:4df3:8800 with SMTP id 98e67ed59e1d1-39b3d3eb82fmr2723956a91.0.1788571834978;
        Fri, 04 Sep 2026 18:30:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2786:b0:395:4df3:8800 with SMTP id 98e67ed59e1d1-39b3d3eb82fmr2723923a91.0.1788571834502;
        Fri, 04 Sep 2026 18:30:34 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:33 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:16 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-2-b40a1b03f63c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4303;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TjkylalUGxIke/ZZSHmCZIbPIqjC2JgfNl/TIVr8fK0=;
 b=2q6At6IM1kq4xBAh7nKHa3+MwBoESkuzCZdfTxa4njG0pclU4EHNXnMVlvVCQSaPciTr9pKgW
 xAd3MtW38SZDy0qB45Y4oF/shKXfAE3lmV+RtxFL2BlKET1trATUmjf
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b70bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Jm0fHEQTX3kIzYgV1EAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VqG_kQnlV7mkG02V7-QIxtGxfh-xcrzz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX2RYOb2b+Cgit
 0FVVh36BcTrv0g18QbuyxV7S+vLbzT1wcB6nqzTF63+rJJCxjrYPpNr82Kn2WC4VPTZQirqmWbK
 G7hHTrGhwialdwhOY0UnhkC5UABTFKk=
X-Proofpoint-GUID: VqG_kQnlV7mkG02V7-QIxtGxfh-xcrzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX5c+HbnFNDOYV
 ZwECY7yM6sUgtyB1sca2/dFctY2iOnSykiO4QxT+YjkEkfhvwFQwRWy0Mo89GQuKpPVCasvka4d
 4YomAGgqensmsnkSGDFufmb6AnDwrhNij3x3/eHHlOewswZorwCyCo3fYZBjm8dlj8cHkoEzUPS
 h3MkBeYvRq42aG0S0jmYpwX9Th7NWIqiwdlaLKmd3BcxIhmP4RNITjx/x1XMiRncpNpJgUx+owd
 zIOhjbB13Mg3uLXhdrGFNh9qnNhwHS80WBpOzBFuzza2ne8FO3GccNTqNVCPXDcGVFHqHHrgR8N
 F1wh3OiZD1U6GL/7drZAFwQvNuwTMy/+vda4IHBWNoOAt4uj7tzy37RDqANqWiaCjlZ+5PicoQU
 ttS7+2PxXYklBntf3Imd8dI3Aea3ZoFOxsAM0d+aKiy/9+Jfp7tW0D3EhJVzjSGFlwgAY4jFNul
 uAd0S2hMeqht7nfnZEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050011

The Monaco-EVK mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
panel-simple-lvds-dual-ports binding, which supplies the panel's size
and timing internally), and an LCD display bias regulator supplied
through the GPIO expander. DSI power is provided by vreg_l5a.

The overlay is built as a composite DTB combining the base
monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c119fd77774..8cf82e7067e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -80,6 +80,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-lvds-boe,dv215fhm-r01-dtbs := monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo monaco-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..b796df28037b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,114 @@
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
+	model = "Qualcomm Technologies, Inc. Monaco EVK LVDS";
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
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c8_data_clk>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l5a>;
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
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+

-- 
2.34.1

