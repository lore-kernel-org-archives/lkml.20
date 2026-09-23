Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6E3D5229;
	Wed, 23 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153219; cv=none; b=l0ui0yeS6RpIA2aIIhxW7MKGfP/JUHHKqfgK3iO0qByMEFIENElanflDntNse/x3JCilFZ07qQmyRmMsM3+2CdthSm7GcguQJ/HdbFmlwCHf4qrpxZTxMzjIM1XSffWpx0+AdQGoarN+mdE7qFOEeX8qHjJNzt8gq82T2/qa4kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153219; c=relaxed/simple;
	bh=yff7ZbbTSJZPvn7xTGp9nUM3ZzWc42Vupue0cjZfBJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YwY9mkT82ie7DpnD2grs3wJpqPMjt3e+JeAlCc8zdhE7BlY3paDPSn03ej4V8tb3aNxHKlddrENzCXwrw0F6re1EMtmH9INR72aRm3XWj0Z/o54O3IEl5Hq4l8t6vowQMmgwiv9Ue3WFaPrt0wtibi3pVi2nnuekRt+mfnV+cPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l96uCJn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l96uCJn8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jdix1387507;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mfcPRKZZase
	KQgM/6ga2OcqT1EBvO3JZ5M5kR9pGcTI=; b=l96uCJn8pjEZcNpGTRumEjLwhsH
	vI3Kxr1G4CbmRhZDBw597uv+sE7AjJW0OMizbTio1gSQ9f3n+4bVR3yFVANi5MOM
	DwHEId/iJ8lxc7o/VSa8h6Vp9i8BjR3hF3OMyKeXJi+TIlorVeLbaVU8aresneLo
	cTBIenRE/qOd3xSntCSHLihDk+/ySy9yu4lfnnb8GQFUmTA3R4udYZa4+bzNmfur
	aJKdxyaGsy0QkEvEj1Dd62GSGApiq6I4EK4Op33R+Om8YK8Qhf84kRAdAW3mE2ml
	J+apkVVWFJ7ntR8yGxPVMmnY8Y4H9ttwYeYcrTESWligu/lVqAWT1bfQp5w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2xtq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8jqGY1727731;
	Wed, 23 Sep 2026 08:46:37 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kbpn1728466
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:37 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 350B964C; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
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
Subject: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback and capture
Date: Wed, 23 Sep 2026 14:16:24 +0530
Message-Id: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wFl5cvwbTH7GjsGRSOTb8kQIzz3OHsir
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXyQ1VaCXncHkc
 mG0rvtSaoBUunpp4hBjYQLO5xpSUJGiV/bY97eayQsTLx2BSXXF1ERX14vUeMQGyBZKYFwXgwJY
 +QmNcpyKuLn/77j2Z/WZQnVLIuWQrPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX82vVgPemyvwy
 l+WEvPqGNW/ndvBc1R41ABskNnJiebr1/fSAHNYCz1JNXFz9wDFoHXJCch1Em2pdYced/CN6Aha
 Dm7dAPc9hFlpdkeJoCQeKBDJi75Qf7phxG/mLzDKoFYbF26ZbQuIX/cp2JptnwiqoRb5v3nOEd1
 rJaFIxWSRyZ4rtENz1P/0ytL1c+pPJD1/p39mtTreqb/H4pqbmLiHrYEJW9Mi6DE0t1MzmSAKvh
 nCRhoqt/e2WMm87eZ8+nBvHs/+BmKdKnxVLmM2AB3s9vkHwpGJmworGZpdZ7xwXn6NQyx6LXx3e
 TlGQNQnFC+PeZWJzhnEtFUFV48+1Sm+0t/gyOQ5EEMHVEyl1xKVJKesNSktafs3IeT6+7dlv91K
 dsCGl3fHE2t05MEizrzXpXxB6eUfvPWWDvPa+uA/8qrWYLQHqLlNrexWNRjwpML1Qfk+C238/yH
 3f2IeJlEVa8BdAFeVKg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=RDsKtW1i0DRqHMGHZ8wA:9
X-Proofpoint-GUID: wFl5cvwbTH7GjsGRSOTb8kQIzz3OHsir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Wire up the audio use cases on the Hawi MTP board on top of the LPASS
nodes added to the SoC dtsi.

Add the sound card (qcom,hawi-sndcard) with the TDM playback, WCD
playback/capture and VA DMIC capture DAI links and the associated audio
routing. Describe the WCD9395 codec, enable the RX and TX SoundWire
controllers with their WCD RX/TX satellite ports, and add the WSA8855
speaker amplifier on i2c3. Configure the VA macro DMIC supply and the
required TLMM pin states (WCD reset, WSA IRQ, WSA shutdown).

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 206 ++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index b7346e20bf02..6da4c242dae4 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -5,10 +5,12 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "hawi.dtsi"
 
@@ -127,6 +129,122 @@ pmic_glink_dp_out: endpoint {
 		};
 	};
 
+	hawi_sound: sound {
+		compatible = "qcom,hawi-sndcard", "qcom,sm8450-sndcard";
+		model = "HAWI-MTP";
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
+		vdd-px-supply = <&vreg_l3i_1p2>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	sdcard_vdd_3p0: sdcard-vdd-3p0 {
 		compatible = "regulator-fixed";
 
@@ -145,6 +263,70 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
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
+&i2c3 {
+	status = "okay";
+
+	wsa885x: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&wsa885x_spkr_sd_n &wsa885x_irq_gpio>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&pmh0110_f_e0_gpios 11 GPIO_ACTIVE_LOW>;
+
+		vdd-1p8-supply = <&vreg_l2g_1p8>;
+		vdd-io-supply = <&vreg_l1g_1p2>;
+
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+
+		status = "okay";
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
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pmh0101-rpmh-regulators";
@@ -813,6 +995,16 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 220 GPIO_ACTIVE_LOW>;
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
 &pmh0101_flash {
 	status = "okay";
 
@@ -937,6 +1129,20 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 2>; /* CXM UART */
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wsa885x_irq_gpio: wsa885x-irq-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";
-- 
2.34.1

