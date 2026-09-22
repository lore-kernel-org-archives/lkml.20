Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811551993C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073788; cv=none; b=LxfGwJmPOzKdpfD2W1kvyWcVRBrsEtqgFenDDqJggdioXwgspMeupt4RMKdMT8iow9PNZf0YPqjU9JJV7dhlGkYaQC4b/eu6srXHArxrIv8PK/qwyYkZJhKMrrUMbhuPJ51vyLP8veATEZzSR3knvzcwNRCobWf4QJRhEX1DF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073788; c=relaxed/simple;
	bh=XlMOkvFspDOad/vxb3Z+zzLts/SWdkdevXlpNyhTjhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ri98EK/wOIUdkoJi57wt5Byo0bhDp93oPg07055Uu+UXFWu/aINwEtIAkwSpg0HuK+sXotCQjm1kPI4J1uGhtbOQQHdOSsdVKTsH+zsj2Lk9Ul1A/V/+8jkxstpC4tg8pqO7vWr+AKqclEx4qQBzlH2Kc6dP+J7mv89HfSVOn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9duIHcg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SF9eOGto; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9duIHcg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SF9eOGto"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M99UVD1842547
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tf1EXltxngZMuh8s3vW464JA/VvjO+8YnExHMTFvkd0=; b=O9duIHcgArOxyz3L
	tNw86i2e5vpJgOvSe2d7d7O7tisxwUD1DHpzvRTT/WDOHZodO8q/fjJw82Ui+aTH
	NlKsPZOOd3amAMeT/iGYL0qjGwX9G/0uCmuT0vHqFBy7YbZ+QaOaSEm07U+SdwEe
	7bWdPeYaTm2L9coLMh6k6zu3xOdKMyEhe7woQQMmL7/3u4/X9RX17Uvd/U7nkK1u
	UGVLmpiq5S1M5fdByleuROzbE2eZi6eP+djCGopFi/Ro8bASgshye0U3z3rDxrQ0
	99EgpSa6dM+Yn++LWpA1Oa0f9YCfUxU4/8+FHQ+EfIwvDL7XeFDzXY8mPA222xaV
	ys5UzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111hq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so4736383a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073785; x=1790678585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf1EXltxngZMuh8s3vW464JA/VvjO+8YnExHMTFvkd0=;
        b=SF9eOGto4UpKHJT3xh8kN3jKb0+yu5YBv85RpOkGxGmos70bPipydCpDOpciHtdR3D
         jvsQWI5OSowF10/J0UijTZPuh0mrdYfGgEXvv40a8Oezac2hWwFnXjKto+1J27Hcq3kc
         BVhJQINvCFIpeSjmK+PD6Eknrl+NGW5Kzro/UFOA02upnrM3Bpz2umo5Wz1XamrYxm9V
         ZJAla+QmwJQc7kYkqQOtATK3CnLGa+dn0XwXltcz2A/y6FbAZeqkVFULLQQMXfB/Ez3+
         Qy65TV0V5jT71wsdFWWwxmu5tfomjKP3DoqUBmNjvAr59kwE26M8AzEG4Q/mnM37pe1G
         2I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073785; x=1790678585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf1EXltxngZMuh8s3vW464JA/VvjO+8YnExHMTFvkd0=;
        b=2T0H7dF6XTRyqkCGUvXC8bmOhdt8ut4l1yk+iVtezVKjcX+scX34ANHtCVTaE241f5
         CTJpkZz2bdwBFVtCDmuHYDU553vkRnTCwhBxdFIp0rjBP9T0fDhkJwgfCiktKQY8rOrB
         7hiJzphcS0iX9/aDO5ha/CqDIdKg4v3IwtBBvwdaKOSgAPqFDUikWYJCK24W0yMgje4/
         r8RiDsQ/fXiCuI9OS+IvjTQymsNGtJ+XQA3AcThS5dDpdByUn5kqY6VJ2QjpdA7dvH8n
         jrrcz3NqikYFLyWX8pk2YQ0GLCVo3H7jQ7S0qxdrUF3p+XPeWcTRm2lIGwf/iueQiL0L
         SWpA==
X-Forwarded-Encrypted: i=1; AKwUvBxPNqixlkKieYbUx7kpEO09FzI6B7gwMkiTxh7L6rXWi8NbfCJk7ZO2+DuzjI3P/jx3MVRCcznnKWIMYbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kWOq8ngAxb2Jwj0mOkye0BNUrozA2DctL8QGoEsCjAycg18hB1
	IcCS+J7lIKMCaU1TjGae1VwFVvLcxKN6U+C3ShOWex70+lO2Y5wXwLHjnbPp2ZfypVgG3ZMYIDy
	jE9LfWI3Yv/OFphX+p7snS7ceC94VlCn8DbmjM18bUlzWpEhNEvcnQP2RNScMiNYBy0c=
X-Gm-Gg: AYBFou2W065QWSFrK6DTGXaneC7MQUk66uXyvcUP36pccCmpT9gzBRjukAoHMkWUM4C
	d/b7ak0xy+3lL5BL8Kn4/gtNrsVnS7udKBsWz5DM45aQOqcrvW0PH+M1vjLplC6SV/9ndBz+sYR
	M+hjaiPAnZfQq252Igxq2mkrA8tth3J+OwdIegVa6i/keQSWbTRaICl7H15JTbDIHknSrk+G4Pc
	ttm+L9sx2ZyV/LZDQxeu2Mx2kxyCDcpZQqrYltDUR8VYmDbljLvCPZjSob92/Qh8AZyw3jy1+M6
	JW5NfdH/+tVA0Nj9b1hSv1+KQPZ3sCFWy0B6TcDCaqDAbLfUi3aV0VSIHL2A96F51W8JVYh4Hbb
	9O/GyFBgjMcjgf9PuyNBxg3QuEfrNpAA=
X-Received: by 2002:a17:90b:268a:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a07327d183mr859219a91.61.1790073785065;
        Tue, 22 Sep 2026 03:43:05 -0700 (PDT)
X-Received: by 2002:a17:90b:268a:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a07327d183mr859177a91.61.1790073784350;
        Tue, 22 Sep 2026 03:43:04 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:43:04 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:12:51 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=7792;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=XlMOkvFspDOad/vxb3Z+zzLts/SWdkdevXlpNyhTjhk=;
 b=RTvLrHAO4IWx2/N+mshFuyWLPpCDwfZB/UVHkcDvIcg2Hle5sCtY2JnqFFScLUvptK6tCimrb
 Gv89EIB3AvdDTI9MBhz8vM8+Knk8MKYxASMLHhwKiOfgiTkdCkM9jej
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: Pi5lZ9dkePECwq9aeA4YLJYgWrMsuV6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX1dP/tcSrdwuD
 0DV9q9ERLR8lpKN6adtRnZlybsSB1l5MiB7959YxKZ/CLFOivDBlTOYVTvYOroNcAd4MI/VleO9
 XyjCwb0kGB8SBlJbzEM4C/uQdJDPdmo=
X-Proofpoint-ORIG-GUID: Pi5lZ9dkePECwq9aeA4YLJYgWrMsuV6s
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab25bb9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX0UMH/4ATo9qQ
 yefaIQmRMhwTrPtOBYmQzdIF/wkKDPzctyF8FlGHyf0Ddqm4zGvPX//Onv7wd20rpIuojeNTsb/
 8QuwenykTH2BIqmzDHQMpaxvv8YDqjDDeP7ylXcPiWPlFvd2PuJWORROZdLaqo36J2wvYaIHvMQ
 j/uvmzhnXV26mTXNSEDTuKnopcQrUmZj9RJcf/oUc2AtdimY/dBrUwG0Yt/cs0bfk9tzMTSS66r
 s6j0EjZaNtwxRzizcyJ7tN28xc9kwrgVR+AvuL8i58f0Tpti2yut49cuddDj6NMpPpMG8tv7mBS
 w6vRMdtSiJBkzzgDMBn+lWMBvpSnkSrH3ilt7drgIJAfnEOJ/JDlcshclX8maQ8AVw2vtuFH3VW
 RcVkNs8qs89v6nVTK+yY+O3E4zNbd2MC5iSEcvX6OohA0ivLz9tKdKpetgkeuGJ7T0ww2qJDoqn
 pGmwW+GY+E53wWoaANA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Hamoa IoT EVK variants are available with and without an eDP panel.
When the panel is not connected, DP3 is unused, but the base
DTS still describes the eDP panel and display path.

This causes the eDP-panel driver to probe an unavailable panel, resulting
in AUX probe timeouts and missing display modes. Userspace then attempts
display commits through the eDP connector, causing repeated DPU vblank,
frame-done, and IRQ timeout errors.

Move the DP3 and eDP panel specific nodes into an overlay so the base
DTB describes the configuration without the panel, while the overlay
enables eDP panel for boards with the panel connected.

DT overlays cannot remove properties from a node defined in the base
DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
where it takes effect.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index efd7bc724ee1..78518156bc28 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -23,6 +23,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
+hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
+
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
@@ -0,0 +1,124 @@
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..95a5ccae9ebd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	clocks {
 		mcp2518fd_osc: clock-40000000 {
 			compatible = "fixed-clock";
@@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -930,40 +888,6 @@ &mdss_dp2_out {
 
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
 };
 
 &pcie3_port0 {
@@ -1083,19 +1007,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1124,17 +1035,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 
@@ -1300,13 +1200,6 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.55.0

