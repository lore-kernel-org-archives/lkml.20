Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA73E51DE;
	Wed, 23 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153218; cv=none; b=BtxZinipgoOik88ayKh5QDkSLMh4aaOEgAHCleajOaKb/lsBAeE8+UJDz2d7XDocqxAuaRM4zrJYg/N5edwEPbrBXYqYLhDjQYwt6JpFLGLkqVqFiB2Du1vvPUtdcnVB7XMxBqACyGrol5mwe//QKbtLzF7fqLEkCCpjhiHLXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153218; c=relaxed/simple;
	bh=y1j3rJYLN8GE6nMzHu63hVfSLaIoSVbACcPEYGqvCaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FKRtB+zV0QlYwSAdBPCfDRrqJQKpQuWXeTpXJiyThRjA9Z5UIATl5YPchlRbMhnRwqSgRiXGcA0NJ/Aeh8C5UUglG1NsR2l3wkanwe1vpXvDWiWUbI6MFfzX2jV+A9FYm+T37R7FaBqg/xMQvXDpxWRyPWZuJha0B0x8VI9YImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwSGiKdc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwSGiKdc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JeVY2197886;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LSARjW11W2
	s9eKrMoUYg8dB3eTEmF2ZrozriMQ/v3Q=; b=YwSGiKdcIaWFv+dAGBczhYj5rrx
	s4SdndIz+G90MAUDAMIOcIiTHI4A/FS7HfffgwaYWPGxSxag2nlfQ4oHhpVlRvOq
	BsaZdmnAgHsgT7uXyjWHJDUmbYiRsqeu69txzYS2RaGwTdQ4Q+22qUo8BW3aDj4v
	Ie7mdbuUNIjVcomMCVnWuhZF7Md5e2Ww4GYH0XBS+DuN26zt/TirCibvEveC/saR
	aK+Uz33qZ4Hf/1uO5B6yAtfxD6ubh5o2ViBl6k5wpRU5Veu3er6gcxJ0Pfj8HTmh
	BuDP03WUEApGEIcMqjxJigF5x73wKaSWZtIeMKDDI8Pk81WD+3nIoxJgvUw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqgm7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8iYgm1726206;
	Wed, 23 Sep 2026 08:46:37 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kbWg1728468
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:37 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3EC7264F; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 7/8] arm64: dts: qcom: maili-mtp: enable audio playback and capture
Date: Wed, 23 Sep 2026 14:16:26 +0530
Message-Id: <20260923084627.748920-8-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: FgA5fqVks3eVZhcRIWyDSXRP4VB3Am5k
X-Proofpoint-ORIG-GUID: FgA5fqVks3eVZhcRIWyDSXRP4VB3Am5k
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=UYOu4SKb2H_GWy770KQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4tX9plI6tnBp
 dmFyN4NsM5a+9FTeCBKVLEt9NqrzkGAMRE8DmVbJFj423uYXKMp9EyOXazFepcm2pCPJXSehcRN
 kTw6+kXUhY98L8iYoqr1TL2HE3dGFEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX/JC/0qsL+yru
 cGsN5CXQVPU8fUAb3njrm15bTa5YkLwJLFyES0DGcTKUZbVCvCqj9XFRYcRYATCTgiyKAYH6rZT
 nIJZS0BLxtfk9AnDehULZGcdCQRtBxTJ/l9w/meAVAbI965VNgLQZ8/rA5POWCH5bEu3FI8biFQ
 o0EPwrAx6Ixdodk8KxUF1w2yWUSt09GZJJ7uy7bahaUTo7HYcAwlYgbQL/Uzi6O3N8r0AuLwXe8
 ay9kPQXu4MEusxLsIrhw+rsojZfaT5MAkB4aTE6d4IS7Ha2+fIpp6B0ahrE/tqzDDTdN2vsoAnh
 ymVHB1wmHB+0V3wqnkGnad2rgZhqIc3rd0tRsPALh8wkMLhDCkyF9Qt4RMQ91RRpXtWdZ5KROEB
 7r9fadcgmTmeQzivsYMDX4EaKxuFVUXheOf4dqHwjxcdY0fB5fDLhcDKIgy4ydXpZSEG3LYcan5
 yTPO8n3B4ksWD+r2c3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Wire up the audio use cases on the Maili MTP board on top of the LPASS
nodes added to the SoC dtsi, mirroring the Maili QRD board.

Add the sound card with the TDM playback, WCD playback/capture and VA
DMIC capture DAI links and the associated audio routing. Describe the
WCD9395 codec, enable the RX and TX SoundWire controllers with their
WCD RX/TX satellite ports, and add the WSA8855 speaker amplifier on
i2c3. Configure the VA macro DMIC supply and the required TLMM pin
states (WCD reset, WSA IRQ, WSA shutdown).

The MTP and QRD boards share the same SoC and PMIC rails, so the same
regulators (vreg_l2d_1p8, vreg_l4g_1p2, vreg_l15b_1p8, vreg_bob1,
vreg_l1g_1p2, vreg_l10b_1p8) and the pmh0110_f_e0_gpios speaker
shutdown GPIO from the shared pmh0110-kaanapali.dtsi apply unchanged.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 206 +++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 1fdc91e03271..31192a01e70e 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -7,9 +7,11 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "maili.dtsi"
 #include "pm8010-kaanapali.dtsi"	/* SPMI1: SID-C/D */
 #include "pmd8028-kaanapali.dtsi"	/* SPMI1: SID-4 */
@@ -126,6 +128,122 @@ pmic_glink_dp_out: endpoint {
 		};
 	};
 
+	maili_sound: sound {
+		compatible = "qcom,maili-sndcard", "qcom,sm8450-sndcard";
+		model = "MAILI-MTP";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS1",
+				"VA DMIC1", "MIC BIAS1",
+				"VA DMIC2", "MIC BIAS3",
+				"VA DMIC3", "MIC BIAS3",
+				"TX SWR_INPUT", "ADC2_OUTPUT";
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&lpi_i2s1_active>;
+		pinctrl-1 = <&lpi_i2s1_sleep>;
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-playback-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa885x>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_TDM_RX_1>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+							 500000 500000 500000 500000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-px-supply = <&vreg_l3f_1p2>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	sdcard_vdd_3p0: sdcard-vdd-3p0 {
 		compatible = "regulator-fixed";
 
@@ -743,6 +861,70 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&i2c3 {
+
+	status = "okay";
+
+	wsa885x: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&wsa885x_spkr_sd_n &wsa885x_irq_gpio>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&pmh0110_f_e0_gpios 11 GPIO_ACTIVE_LOW>;
+
+		vdd-1p8-supply = <&vreg_l2d_1p8>;
+		vdd-io-supply = <&vreg_l4g_1p2>;
+
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+
+		status = "okay";
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&q6apmbedai {
+	dai@40 {
+		reg = <AIF_TDM_RX_1>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF1_IBIT
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
+&swr1 {
+	status = "okay";
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <3 3 3 4>;
+	};
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -820,6 +1002,16 @@ volume_up_n: volume-up-n-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	wsa885x_spkr_sd_n: wsa885x-spkr-sd-n-state {
+		pins = "gpio11";
+		function = "normal";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8V */
+	};
+};
+
 &pmh0101_pwm {
 	status = "okay";
 
@@ -906,6 +1098,20 @@ &tlmm {
 			       <119 2>,	/* SoCCP */
 			       <144 2>,	/* CXM UART */
 			       <211 1>; /* NFC Secure IO */
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wsa885x_irq_gpio: wsa885x-irq-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &uart7 {
-- 
2.34.1

