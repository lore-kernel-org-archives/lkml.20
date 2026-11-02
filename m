Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604719;
	b=jCAdeIcU0XkZJzg7xLgj8CgzcPxUTgICZthLQzoKIsCoHfX+zt6z3KGYDnF/C2/yY13Q
	 0CeV2PlImO0Kgg86oCCIBoLnIlD26/2cNnem6Qjt3aEDeeDvcvPfBZk2Es358ojlJ08s2
	 bIrM3XPO3sNKC9+q7mlNo4dEh/43df3CMlGktxQ3IdiL4kpJgC9JH7J18w3dGorpXXYtp
	 F7UviRQwJc/vBmx+XpzOEuXZNYoVKWrhiOaSzw3pUNvtyVyBjsVb31f+ay+gq3as5qfVU
	 z0v8suH+R8SYDi9+BiMOtOdEPGNfwYb9VV1fxv2uEKdjBbKHaGBEhiPgWJMpQEqv0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=;
	b=d89wWJgSUQpsq9PXN4CkQvHoeOGn4b2cDag2TZliLkp6z/4mD5q4/dTdRBwROp1x28hv
	 f4TvX8S+mjaCP/VFtDuZKoGWUE+sgOU5AJ7yUmAirZ36KSXRZgfSac7kZiTmU/OxO2l56
	 qknCRoDIE/5r00hUusOy0+aqM8lnr/CRY62cPrEzDgnkfawe37vD1vrsc0sI61RdaURtd
	 McIGBxAm3iB4EzH7yEYsVe569NiQMXrUOEyS7uONLmpZU/wHc20ZaEJCUDwGuFyk/Wzti
	 N8lg0lxQzDoTtK5nnoSR13UY+UNAgqB/UD1aKVXFsBmL7LL1zpe3hi6xgVg8aMhuP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxvH3xC7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsZKG8NO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F080606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F080606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxvH3xC7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsZKG8NO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pqE33121225
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=; b=mxvH3xC7D5Mew46+
	j4x3MNjMuy5cj00HffYxb7RN0JMKomOaCVUJgTOGVI4+bW+Wx0S4FKy3g0xhM9AK
	kZdN3GO0rIbo+KSnKmKV9JiCLA40CdCaK9v+AUSfAKfG5UKjzaisju3OGqK03DJm
	63rKYZBs8T9S3faBKPDUAbH5Gk+I1O/9ZqlT6ldTXRKEkpfB9BKn4coGlVScNcvs
	93zjqJP4+I9CMxkcsyQ/7nw7vI4c8Tz0/QZKb+9FKOK7HE3ohsfmzER20jRDWT6w
	24JYsLYODje1vxW8mEh6vAlL7quflK9OjWY2IlqczbLaud37fRyFvxP9P/fC7CY7
	tsLcog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmer4qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:31:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso1628709a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604716; x=1794209516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=;
        b=TsZKG8NOz/d8vLEh8IPZMrKvrqFRYSaQi8jKWllQvekmi2cC92KYNtcilwb4HNagYr
         D2chA0WyhfJb/OWW7JtyfFeVO/A4I89JAaCJRiuLDOBcFP3CXhdjT4nJOmW+iTnOW0vb
         H0Ln9HcLW0vMyCLi8ikpY9Bz/YBqXJ6B2CRWjNIGEYE+hCapyEHu7HAgoy20b4JKFTV8
         UoTt78GU2wjTvCRHWRPFGJnTHCbn4m0fLouxSDoPjeNJ6K3I3uzj6RCtZRBinqjCLjb7
         CouGlTHAlDhLRfclLfB02qZzaRKHcIU7bWNGs+aM4y+m5H9OB7zCXlBw4tzUpI/7sEvw
         sI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604716; x=1794209516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=;
        b=vicSxM17iTYcYSOo9dUUVCK4BNPjM9FZXtnxnRAqka+sqnn279w6mXtxSLegF4PO0F
         oBftnhLpLdSlAidSg4GeMc+eDBrXz6G0QSWq1PGoeQPSmgwVHJ+znZtZ+ttzoF2fCwyH
         EWU/EAF/ry9qR+craJC9FObSoeIpN/RD9tm4cV2KGJsIjazaJ4zIXIZAkSiRJbREUpgS
         tH0VBanKm42bBntp5V2ojIH8xha4FNeZt+kQhKQxWz2C1tY0O6N+FgsIaFUoxmrqFBJd
         eNvXn3VIMpMJ2XmICNAmtMuvPa4wr8mwYXxFKGKXCeER0tbKp1PjWwjbqUjcHZqfqafh
         SY5g==
X-Forwarded-Encrypted: i=1; AKwUvByRSDHtAg3msoPKBUwd4wD+WAJ29sF+/lUu+iQSMARQpvh35qxd8dMTxIxog42PR7r6elt8Y+a9NAP74hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FPL5zvR3cTCbturKh336pmDtO/TEUeLPF8ddVwf4aFYT9RSrl
	6upApbJlMOPHQQ32/A+CYjLEn0PZ9IvTLQyYzQEahP7gA4sJIt2Y5xH/nzxW+q8kQ+uUjbtmFcF
	N5gvL24svwZPxFFpMbvCMpsCBe7nLuFQ+GlMyJB8rJAYg8Gn5l1Wl1WsXEcO6Tw1qHxw=
X-Gm-Gg: AYBFou2uBj3yVF0O8g1+/YV0nnPMV3Cp4GKMnzm4By+xRdUUFEnh1v+MF7JNa4dpTcs
	1MsE0PMxBhwz0O2BsgIgOkWDWFAWlYAMqh4qbAu7VfTUiuvNVMu8Rdql2hZM2NGs12iK0qUyZL5
	EwrAstr1SEDARDZAOuWhKz2QKCa2CX3yz+tO8LPdI1YYBKS0K1fuPYAb6p2H/8CSDnYbGcSSsxC
	ZvGiUGEMkPIwfX7yHN4HlPMf19p5Ct0MJ4JCnYoD+7k9nBwgzKnR9xJbVks1zyPvuai0vrpEmWc
	i5uA7qCYzI9+1711xYupDXnaS76x96edH7Zj6QkbB3zt8znIugjMCJfCSrP+/2eRBzeB8Zv7wkI
	v5idHGVnf01mg9UdJzh7vNcvsM7h2zsijPrb72n5SA+9KWCw8cDG4iv8drmE5hgq80K76dvIGSJ
	niR1HG
X-Received: by 2002:a17:902:fc4e:b0:2ea:1b5d:9efc with SMTP id d9443c01a7336-2eb1ac94a4cmr85989945ad.34.1793604716053;
        Sun, 01 Nov 2026 23:31:56 -0800 (PST)
X-Received: by 2002:a17:902:fc4e:b0:2ea:1b5d:9efc with SMTP id d9443c01a7336-2eb1ac94a4cmr85989805ad.34.1793604715487;
        Sun, 01 Nov 2026 23:31:55 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:31:54 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:31 +0530
Subject: [PATCH v3 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
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
Message-Id: <20261102-lyra-display-upstream-post-v3-1-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3495;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=c/btaoFjC+NBLbevmkWGLPKcoYIxbxomlzBuPs/Q3lg=;
 b=0XlJkb24TOgG9iCVnuBbICGT3W5HTCvI2ti3ifJncKWA/Vu2671oZW4n/Hbh/DRusvJPsN9kO
 yWoHGl+/Pw2AACO1pwhCfh5dzLcOdSWwdCwTCtSG5OzaPQZUN0HRwaI
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae83c6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UC1zgfPQo_wEPMHxqsYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXzoEgCKslQtdO
 8WJzITV5UGTy8it5wLf+xrarbXSEQnQXMw9pQaZv5mp0VxncuXh/vrx/QLqRDAmDU4vGehBfmnx
 hHCcl7Hsv6rkNGwP1KDl87zVl/nS4YPQPGmcwYNqKz9eGbp+NHV3ULBWcLOMS8kS4HImin81BXj
 yEMQEpSb/R+JqE7yJDto1ElnKmpl3IFb+vvRjyxOboQJHwgY2X7uCFpzMN3ub1Abt+QFG5U0vY+
 g11eoSpbbw2fJrEB4yPHNOvvQnuvdeZAAs0Nk2TF0GTYbnYLOJZq3N/68F4W8U04deIUzfAtEBZ
 wU8dlMhobyzeAGbA6gQj8D++ndP6YQKjt+JXSCqOsVd+1PBiZdeyt6V4PCn5HzBLzRb/uRsPxDF
 xJa0QQu1RJjmTtKn0VPwf2c+v6qedybzmBqgeO3Y3RIWbVdXdRA5KgAzSR0y1gdHC2yS6HblA/6
 MzEXCgA2AFRIB7c6UCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX4A9WLRbT0GYp
 ZhvSaPNDpB8YGYgyApRTvXG+bOG6Tq3Myn4iVFvHMYPSo4PyD0dRwQyo3Uv1A7NqnJQ4XEdykeT
 6w/lxpuKpMxGmcZl972To8h5fNcAnRY=
X-Proofpoint-ORIG-GUID: NTfiWybSw1uXSU5op2nVt8GCiHJw1gRW
X-Proofpoint-GUID: NTfiWybSw1uXSU5op2nVt8GCiHJw1gRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020029

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 100 ++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..6a13f04a9055 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +12,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -22,6 +27,65 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +138,21 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -95,6 +174,27 @@ tpm@0 {
 };
 
 &tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	dp_hot_plug_det: dp-hot-plug-det-state {
 		pins = "gpio104";
 		function = "dp_hot";

-- 
2.55.0

