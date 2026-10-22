Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681375;
	b=HJKC0fhgN1bAa3nvjsjPfoAw3wMZi3ryLQqbv/3i7/XIOtRrfie/KWVVRq8VnyrhqfrW
	 6BuRyxYUYyAqcTj53gASxayGUAyXlDm2Q7SEqHFUAJlQGE17hsAtJIn+5g3daHD5KlMX3
	 5Wg+KH/jXOBHBJX8OJE4Mp5EwQizXCHYBQU0yPaVFzopaxaCGPSIFxn0tTRXmYda86yTD
	 ORnWYlmSR9Ib9EQE0hZDKAmBxBpPUWOtClbp6XFXhBhuxhajI92aSejQPSHfOTEOQQtQa
	 JJDXKSNMTi6QT50ZpUTQyWlTUnQTJMOkUWAddqhma7nK+YIXqQMnesJFQZBtRyMQMug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JTjoGO24pW2rGChMVPDLJyZmsSGTEsDRxsZhB1wrbkc=;
	b=vQMpZJUsdJpmDBvqvMAf0Fb5dVNF+hsfCELK/e6vf8PsahF7eOSP7unqlNSkcppAYk46
	 oE7Ycwp0aozzhaUB8Q3N3hIbcRJqW/bQY9QjdNszfbh9NM7mIH2QC7lCpsWIq89gEVJQK
	 bLqVfYmA8Vv8JIWs0vcDE4bxOmIGHsrxtSeP1jNG3JDQNw3OWZ7rYcJOajroSc/IJWAru
	 Ob6xm/sQY2btZdI4Yj6tJ6U8mVY5ghS2SsxQ0iu1n2iMI9BBSd6EHANLkW/PoumTKv102
	 m8fGKl4UUy02G6prcK06y1aUl+RZuEUmxsGe9UXnofxZYH2SbJu4R+YkfVUCJACX2vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ic+zs8tl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A8606A31D;
	Thu, 22 Oct 2026 15:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ic+zs8tl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFVBf4098326;
	Thu, 22 Oct 2026 15:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JTjoGO24pW2rGChMVPDLJyZmsSGTEsDRxsZ
	hB1wrbkc=; b=ic+zs8tlss1Il1wHWRnw3O5ohNiGjmIe4DSv4v1ftRoSqOU9M0u
	hVORR4mmWXfT7sKkIAYAP6VJfHKfxcUAbBGlEOiDbMe4xbcw8Fsxv461IsfpwA3O
	jiqxN0rauP9TnvDQe+WV2T2ORqN1XdYkIRKsfPfoD5Ry2p5VV/0Is7s2RmdF2hlV
	e7whoesbgJ7CBC+gxyKinnuNhKc6PDQBpnLi9EXm2fjF/8ggbpOWXQymAZqHpKYW
	Ah/xPNsMNwvEFD4CK8jzaihBVFAUIWtEC/zBqyQlxm/JMHqKKSaSc0L6TBwpu6lN
	havJKK3i5IWFw/2soBRc/fDOHBlO/uQLi2g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq363f-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 15:02:52 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCt9qo2331078;
	Thu, 22 Oct 2026 12:55:09 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69MCt9Pf2331070
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 12:55:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 1533F675; Thu, 22 Oct 2026 18:25:08 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset playback and record for qcs6490-rb3gen2 industrial mezzanine
Date: Thu, 22 Oct 2026 18:25:03 +0530
Message-Id: <20261022125503.1231758-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: a0zTaGxDWet6G_wF0GVxkk_haokAokVd
X-Proofpoint-ORIG-GUID: a0zTaGxDWet6G_wF0GVxkk_haokAokVd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX1aGe1+/IF+in
 uajkG4x9AWNM8MWM7CWIF3vBi8VozVSeCYZv0tkW5ce3+DGGc1sm7FVMkIlGuGtMcYjSqvD+PEV
 +3bSbb8N8lbm8jPMBMHe/+KxNedtVC4=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada259c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R-2MCYZGcSsRN6MK2dAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX6M1bwYpRZX7y
 kodrPxEM4JJU2VjDsegCmmpHhYKBYjPx78MsVmZ2WlGKcxHI5cYultZGs5iZ0LbG+A4eGdlU92a
 K8uLugJNo4bKldAjMq2DlGHFxqEJ0md+DR0BvRzkX3fIoC37dVQ5SsbAGUmyEboKpeTAHbtytgh
 vOrqIxnHWv91NgUpbn7rfp2tD7MHUOCqlW1MshZCfO+aIzYuvFlmAyyDTrdat/8Vca1i9RNbsCO
 bVtEO64htu219kDNGAwA5Ioe1Z+SKH4zmEEOtwbJOPHPs5C66Xa66Dlnx5XvbZ19IElwDRSgfqE
 MqiE5rzZb0RsPz0q5vWJaefSnldA6KCRj3TlRtHdkxSksoM+1syhiSI3RHVL9U9PGSM7K0TGcWv
 sRCAZx4o0mSd+dO9rxoDH1WBPuroJWFLe/KP6ytCmQICq+wOawZ2yIJaaPbqHkf4JjRuga7DzOk
 5hnk2TAO3NqGp8LcLLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

Add WCD playback and capture DAI link to sound node. Add WCD
codec node and corresponding soundwire nodes to perform
headset playback and record.

---
Changes since v2:
    - Updated sound card model name to "QCS6490-RB3Gen2-Industrial-Mezz".
    - Fixed changelog placement (moved to below ---).

Changes since v1:
    - "audio-codec" node moved before "regulator".
    - renaming node from "audio-codec-0" to "audio-codec".
    - dt-nodes sorted alphabetically.
    - patchwise run on the patch and indentation errors fixed.

Link: https://lore.kernel.org/all/eab2d0b8-a949-47d8-b953-fe34bd2fd869@kernel.org/ [v2]
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4..e9713ec71dbf 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -6,11 +6,35 @@
 /dts-v1/;
 /plugin/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 &{/} {
 
+	wcd9370: audio-codec {
+		compatible = "qcom,wcd9370-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vph_pwr>;
+		vdd-rxtx-supply = <&vph_pwr>;
+		vdd-px-supply = <&vph_pwr>;
+		vdd-mic-bias-supply = <&vph_pwr>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,hphl-jack-type-normally-closed = <1>;
+		qcom,ground-jack-type-normally-closed = <1>;
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -48,6 +72,14 @@ st33htpm0: tpm@0 {
 	};
 };
 
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
@@ -244,6 +276,101 @@ pcie@0,1 {
 	};
 };
 
+&sound {
+	model = "QCS6490-RB3Gen2-Industrial-Mezz";
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+		"SpkrRight IN", "WSA_SPK2 OUT",
+		"IN1_HPHL", "HPHL_OUT",
+		"IN2_HPHR", "HPHR_OUT",
+		"AMIC2", "MIC BIAS2",
+		"TX SWR_ADC1", "ADC2_OUTPUT",
+		"VA DMIC0", "vdd-micb",
+		"VA DMIC1", "vdd-micb",
+		"VA DMIC2", "vdd-micb",
+		"VA DMIC3", "vdd-micb";
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+
+		codec {
+			sound-dai = <&wcd9370 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+
+		codec {
+			sound-dai = <&wcd9370 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+		 * WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+		 * WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+		 * WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+		 * WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+
+		/*
+		 * Static channels mapping between slave and master rx port channels.
+		 * In the order of slave port channels, which is
+		 * hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+		 */
+		qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+		 * WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+		 * WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+		 * WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+		 */
+		qcom,tx-port-mapping = <1 1 2 3>;
+
+		/*
+		 * Static channel mapping between slave and master tx port channels.
+		 * In the order of slave port channels which is adc1, adc2, adc3,
+		 * mic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+		 */
+		qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
+	};
+};
+
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
@@ -283,6 +410,12 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 		output-enable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &wifi {
-- 
2.34.1

