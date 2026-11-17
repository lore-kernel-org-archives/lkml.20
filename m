Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913746;
	b=XX/+3EtDLC1z5ZBKGFs/o56fm9/mux0jOXgF6ckANamSFFxRFlwA2kIYmiROEAmWAQQf
	 RA8xKN41V3PMPXkeDQUgWile1Hy+U55zyyHWz+R61cYq8KCPIMcxUB7mMoYcto5jBaOOz
	 RvK7FSuYWpoME8oO62CcWImINs5VCrQScbugVCUAzBuDL0vTCMLPtPQ0Xp7QsYIzFC9Lr
	 Rauz6MPKEtGQEqsZ8crfkmxnyEqnXUYuI7F9PMhvhEtjum4nje+GPQ0cP0yN3SdAd96QS
	 k4iZgRJgiNen7pB3+iL8fVMRcVoKQM80vEdnqU/cPXFBV5G7XH7zcNfV7e0D+i1u7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fqaFODdKk9jxrxpCP4ql5Gq2TdvVzdxe48M6mH1lLwU=;
	b=za11VtyAUtvn/eDt7xn9zHBoR/WW2kp/BVn/7W6sMUCkcwOlJvRSZS0x3W1bJcvbNg44
	 e/i5F7OUUa+IAGN1wmPKDBj4k/y3EFb3SWw8ySlHh5KtGXhKj7SiSZR+ijUuqk374a2uo
	 HJBhQ7c9KoBsSG2Br7n3pVRG+sQLJQwN+BmXpaMNHHSRMrZGamsMZlPzoDJi4pRmGEjca
	 OJa9/ShLZbEf0HfrPJF+d+v6ycnmfdY00CReNyx42sFBBWiPWs6VXEkIDN6o3rjqJRCrT
	 8vtbz0hqG+sqxCOd3WaIoWPPmA/0SZkCqRKKNimSTZR3n7WtsGV+omCjhTJPuNUGOzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYaeePX5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBBD606A329;
	Tue, 17 Nov 2026 11:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBBD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYaeePX5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8dJ4N3624121;
	Tue, 17 Nov 2026 11:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fqaFODdKk9j
	xrxpCP4ql5Gq2TdvVzdxe48M6mH1lLwU=; b=NYaeePX5jjrtNbnmIe1ZUMbN/xO
	IfXtZ9/1eTAk2WLc+4FHNBOeocsvN4wOrgS3tYrXAVcrLDvRWPFf17s2MBPDdP2C
	5JT3HN3lFkCxsxt5bJMdUwJrljtZ6XHbQGoC15WaljWx6MXFoRPE43bvVSXKuS0m
	GhkKdS39mROUd8D1L27MAMXBQFJAQEiLlCZ243RvvC/TI8F+QP40vXONg1enaQl4
	fKEcqkJjvFjZ8kU5vzHh1JTUrfkDiiKuaS6uR2X42NiwkysLlTV5HnSFoQctuCSU
	gFi7oVyF8Ui6Y2NrpVqMeynxay2J+LjR4mand3P/a3ogEix3QlM8/DHDnmA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek93b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:55 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHB8qQW423678;
	Tue, 17 Nov 2026 11:08:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AHB8qvM423671
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 61471681; Tue, 17 Nov 2026 16:38:51 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio support
Date: Tue, 17 Nov 2026 16:38:46 +0530
Message-Id: <20261117110848.465407-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
References: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX41+luyTnM2MK
 xdZzl69AYX/L4hfR9Dc+MKU0YMYDLCV8EZ8hfnn9k5vmF7cywp3wnOxG+Yj3E8AOfsZXbEgldbT
 Z51bwGh0BBHMiNuZnLigGOINF+0uoLQ=
X-Proofpoint-ORIG-GUID: YecnKDCuwhUH845lOsFZpyDAFUMFAiD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX6Hc/2gEZUn4Q
 jZs7SPC5lWNvSyYhi+ztgm5R2QjpuPop2SJx5TA06unuh0VPFmqp03N57PLmDbyfu3eZ4ONxRFZ
 /YjUqrEr8KFmWOUnLaNChX0sXSJ6fhkC6e03ZsvedpXRpR2WQlEE5wY5YZku9fa5WODgbYRuGAT
 yCAJxCY5YlOrIa7dD4VEe2inQOTFrvWJu2giIbpn6+fLaW4QcL8rNZGH9UQK1LHZXJCIXlyV3by
 XsCmX8U/ihVmQeMAquN4yORXAvqoVpDhff9hBSn3wc3BP8jXZ/6fSat2lqeCaNsstCbj9iqi7Ci
 rrC8NMeLbLPBNv5824OnYzGAfGaoqUfUydj0a2jlx7o8+lP+Be2zS0v/2Bw8/6GiQ6u0h+YzLIq
 wN0hOIk8QoOyhl4LCnTlZiBdkLaxsjfzR8bI3NljjSBE6JgqRE6Fgh21nM5WNw9fLS3Sukf2VA3
 sKbzjfrDCGv/sxU7Vow==
X-Proofpoint-GUID: YecnKDCuwhUH845lOsFZpyDAFUMFAiD_
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc35c7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=_OXMhcQi_EIdUksENdIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170044

enable playback and capture over max98091 codec interfaces
for talos-lyra-evk platform.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index d254a32760df..7cc1ebec9903 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include "talos.dtsi"
 #include "pm8150.dtsi"
 / {
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index dffe64475ded..a0781c70a956 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -22,6 +22,47 @@ dp0_connector_in: endpoint {
             };
         };
     };
+
+	sound {
+		compatible = "qcom,talos-lyra-sndcard";
+		model = "qcs615-snd-card";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lpi_spkr_i2s_mclk_a>, <&lpi_i2s1_clk>,
+			<&lpi_i2s1_data>, <&lpi_i2s1_ws>;
+
+		sec-mi2s-capture-dai-link {
+			link-name = "Secondary MI2S Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		sec-mi2s-playback-dai-link {
+			link-name = "Secondary MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -56,6 +97,18 @@ expander3: gpio@3c {
         #gpio-cells = <2>;
         gpio-controller;
     };
+
+	max98091: max98091@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+		#sound-dai-cells = <0>;
+		clock-names = "mclk";
+		clocks = <&q6prmcc LPASS_CLK_ID_SPEAKER_I2S_OSR LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <119 IRQ_TYPE_NONE>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&int_codec>;
+	};
 };
 
 &mdss {
@@ -84,6 +137,79 @@ &pon_resin {
     status = "okay";
 };
 
+&soc {
+	lpass_tlmm: pinctrl@62B40000 {
+		compatible = "qcom,qcs615-lpass-lpi-pinctrl";
+		reg = <0x0 0x62B40000 0x0 0x20000>,
+		      <0x0 0x62B00000 0x0 0x10000>;
+
+		clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "core";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&lpass_tlmm 0 0 32>;
+	};
+};
+
+&lpass_tlmm {
+	lpi_spkr_i2s_mclk_a: lpi-spkr-i2s-mclk-a-state {
+		pins = "gpio19";
+		function = "spkr_i2s_mclk_a";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	lpi_i2s1_clk: lpi-i2s1-clk-state {
+		pins = "gpio8";
+		function = "i2s1_clk";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	lpi_i2s1_clk_sleep: lpi-i2s1-clk-sleep-state {
+		pins = "gpio8";
+		function = "i2s1_clk";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
+
+	lpi_i2s1_data: lpi-i2s1-data-state {
+		pins = "gpio10", "gpio11";
+		function = "i2s1_data";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	lpi_i2s1_data_sleep: lpi-i2s1-data-sleep-state {
+		pins = "gpio10", "gpio11";
+		function = "i2s1_data";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
+
+	lpi_i2s1_ws: lpi-i2s1-ws-state {
+		pins = "gpio9";
+		function = "i2s1_ws";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	lpi_i2s1_ws_sleep: lpi-i2s1-ws-sleep-state {
+		pins = "gpio9";
+		function = "i2s1_ws";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
+};
+
 &spi6 {
     status = "okay";
 
@@ -95,6 +221,11 @@ tpm@0 {
 };
 
 &tlmm {
+	int_codec: gpio-irq-state {
+		pins = "gpio119";
+		function = "gpio";
+	};
+
     dp_hot_plug_det: dp-hot-plug-det-state {
         pins = "gpio104";
         function = "dp_hot";
-- 
2.34.1

