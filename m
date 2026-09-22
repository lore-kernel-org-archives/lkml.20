Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4855D89C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115129; cv=none; b=PkUYa57f8xeao+jXjHLZda4xrh3fF6w8kUQt6yHa16w0t+9FywHNgcm5YRv9LG/jZIxIyvaFaHGh45q5LRDyBal0H277IWbVE5aS4+PDR1xZwO9PyGfndz5L4ef/55UG6OoHrj67y2aoVDm6feHzp5oCIK1ZlQceNRErXhq2hZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115129; c=relaxed/simple;
	bh=eFf0B42YxvV7gwMQRGDQ1zDLlgTzs+N0FysZpFeIGl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNIw5z18k6xeAPl4eOyDfCt0FJfmRNypzcp5b3kAHEsxhxZjxfbvxZRoUhdLYrrHc/qiJn4g/EbixFVpBaOIlcBCQ3ERwFaHlkuhn49T+Brk3ueY1aw2xRyvyry/A94I5eIQgobJailGamDOuPnOFo80Ubspdm3cRmuU0qW3xog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mr1sxPtD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADa+yJPX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mr1sxPtD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADa+yJPX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72Cn1348884
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZOnCj5K3G8
	cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=; b=mr1sxPtDfmxRXcgU6Pl8h7BPi0W
	tqV4UqRESiUdp/vcEDMJ5SQiYEpBErXL1xDC+bVYBcSN/jMhDYeik2p4fej7P1Ro
	krRYU60aCPOspOVmytBGXW9NsJnf1fhh/GCSeEFIjuq3Q9acaPOza8U1I86ouRkX
	ZpjjU8vb3mjYxUispzGGP0bXZzHxAnw1sje4/UvStCmoslsbOk9XhbMBQKq0k1yf
	GwL6AwMb8ExdhDj7jDQmxcoVdLBBleiHb+t2DadWoQkFUIRs6W9T5qOWYm9F/q8P
	SUSv69rLQRgtilnUw58TCBXeJrptJ3zg+iAn8j2S7Yi6hSSN1Qg1/yTJeXA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861ab2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9a93f5f3aso467384e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115111; x=1790719911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZOnCj5K3G8cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=;
        b=ADa+yJPXWukWkRLx84exQ/Dm2JgEugoAxC82rvEXyvmZpPGBOQ7whktq5biWmJJkc3
         fHbewPnXe4oT7YzNXMPSRzTSqUgqU5YS+pOLSs5fKIQuaEQ+/wQaDw0MFrj33LcVLGyd
         /6sClzQi51dDCwh5nfp6/6Gko5C7w5XGD7wjfzI1rQK5eQ9SmMckpOzdpDvGaA19FlL2
         TZnikXSEvAv7CYPVM7x+Llj8e5/JNo0Hb4Syog2CJEDmvl44p1Rem2ww6XSseLZs/55H
         z9GC7bF/OqdCEOJLy+cWmyfq+KTDaNGB/GyCfl8brUlivOoeExdE0TKAMbaEaJ1X3wLv
         3rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115111; x=1790719911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZOnCj5K3G8cEVBNMsfUljTX+GYt6YzMcKsUYnLBFe8=;
        b=yOCRgVkO9F343XtejbiWw3kL/kXqh2EDQfrgVi6Irkn6vduoKlOXqKo9Yu83QmrwmI
         oXOc79vSz5MLpIcaKiO98z7mzw1ApRhqLuN/fZDgeJuunGAhQpohWDmo1l75t1P0/fh7
         9DRtwUReOkphU0T0Aw+XPo3avMmY1raLRtytxV8x6RFLqC0yoK0e8gVtdoSgEaGpF/ir
         28WeWCbMzuu48q9WNhtKIwX2wKI3eye0PFNzD5AB1/qUNTlXAKDi7MkWjeS5sLH4VFEq
         qSY3khCS1K7vv7dZgngDES9BkqB2UlERsydmm2Od4SP+NjcM2HHp5MsyR/v5U3RAQnxr
         dtFg==
X-Forwarded-Encrypted: i=1; AKwUvBxjgQfZAcNvIwyXEzwPSMHtVFkBc1I0jFBP9uOyA+h7SnmgTcMgB9exxIVUT04vGWqZcYeZs0+8fvvouwk=@vger.kernel.org
X-Gm-Message-State: AFuF++liVUcYMcgwYl4WluNAOo9ZWAoxM56c0hi1iSMXkmSYqsrk7JoP
	zgJsiECpTT/QtN9+8GZQmvSXOVkzRAfofrOI28OM3Oga4SuEeXIchiddm+FmOH7D1XV5kzWYwO3
	c5yuI0oUUL4i8Y3bCUUhn3rGQt5Xb4HLdTfe5xyMhA+ijmKqhxSONRVO8qBn2DmC6E3M=
X-Gm-Gg: AYBFou0p6Feh7rPF7GwZBNAexjJ/kt/9bFgvVup1SXTO/19ldWvkXMZ7fWKUf4RE+7f
	g8lV5ianoDj0kgqlJONGChfYdT5DPzVpHgKUjqcruTpcmnobqAiQVwvBTX4DGFZgkeC3lpbXPGN
	Fii9aA/HnXEdia3bjNPahfqOeF/FIzV2HDQf6yqbto+tXudREQJ+43FowFVuUQe1LF9LD7tOjUK
	liE9wQnoaaCBkQgBfY6hxR/5aEP7cM2de71RFPD0mjc2aFQRj/VjCuuv+URJs12Zh0HFMs+TB/a
	56r+Jo7JoWAMnFZWuB8NUL/s1CA+LNyJx7Axxw3YoOtSEXe30XUHT60QlCvq4kbzVEWNIzSdyu9
	WI1QWF37Sop/3K2Qz7FOMUlZsidgOTPY9FPwbkcs9s0Uksu+poZo1V64w6ThYVsym
X-Received: by 2002:a05:6102:91c:b0:79d:cfe4:7202 with SMTP id ada2fe7eead31-7ac1ba35a39mr935731137.11.1790115110483;
        Tue, 22 Sep 2026 15:11:50 -0700 (PDT)
X-Received: by 2002:a05:6102:91c:b0:79d:cfe4:7202 with SMTP id ada2fe7eead31-7ac1ba35a39mr935704137.11.1790115109838;
        Tue, 22 Sep 2026 15:11:49 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
Date: Tue, 22 Sep 2026 23:11:25 +0100
Message-ID: <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BHiJl5iRuBDO5zop1NykygjmCDPnZq_u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX98pd8gFQfr1o
 /DxPglBUo0o0JkubYH+76onQSWGYqReT9AiBige4MdwwMXdkV9Tx9htjC14ORH9sDU46uA5wNJM
 CLrT/xgMchMgqtU4PF5Jv/9wTay7qGQ=
X-Proofpoint-ORIG-GUID: BHiJl5iRuBDO5zop1NykygjmCDPnZq_u
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2fd27 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OKQivFIISjCID7q7bPgA:9 a=XD7yVLdPMpWraOa8Un9W:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX048XzIhkx4m/
 cTdp/Xjj0vQ4hnENmP3Fiicajy/bGIsi0tzgG0qK8mc5XSC7PleM48Oi4xoYHYHR51Irc/jlYwe
 Xzaks8uO3IKAHG9szDcqlfO5e6mWXRNcrjIebHc7HBWCZxXH/bXAM4qktcK5TodsovU2nzOKv3d
 +5cf50Bw14sjZ5QBEGRreIHSd/uzCkqqpsGEp92ExzwM1Hrz/46rAviLtBZB6Dr15u1mKU4+xSV
 dTs+cd+1Mi9601m8wAhl3SfZufUWTisGk9WXFCM+gANfgpwVaLoGxN0q+gtTOCzxq9iH3B3tY68
 7ZDqiDyvwL5z9jMB2AfrRH+YoVfMbbu1gdSCy7Z4zY1pq46ERULcI/tNOPVsMrETtXGPYWIBBx3
 ujMMDbg7qxjM5RMdjoWp7O00xKvgGt4mY+y4y4D9O//Vx9E4272Idj1GrT4qfdrG5HKLhgCpLpa
 pzkWwVvA46Tsz3JmMvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..6d99e24e3dc2 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -770,6 +770,42 @@ data-pins {
 					drive-strength = <8>;
 				};
 			};
+
+			lpass_tx_swr_active: lpass-tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
+
+			lpass_rx_swr_active: lpass-rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -2238,6 +2274,127 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x10000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7e0000 0x0 0x12000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.53.0

