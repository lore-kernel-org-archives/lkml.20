Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD473EC82B;
	Wed, 23 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153217; cv=none; b=saCVRHbGXVJwEnct0fxTIks8PSlEjwASlJ3vcgjl3MBcYrKKE4f9844o0C1YArY1i5qYmLo2PDfUxbjLng1Mfph5QF8p4mSZikSy4W3JAHf61U0fQpMpFQ8qAiYQx2B6QMZ9BCFf0So6qm8GWbAACfP8VZVRULb+GS9HvNMsNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153217; c=relaxed/simple;
	bh=kJvZrNC5DpufiNGbtJWmfwMqkhZYONV2WG9IUhPZReE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SzY64LQ/FGY33V98DoWPzfmUnpmpUxTld+FEj3RQzfIhRNkKsaGQSNMYcae+8TJFnpM7FqHc/ayFfxU8zLi0n9dJR8TzydynSIOBPQbtvrP3cDOmV+ekv/rveiF9YoypsdEV4C8ycQ5v5oWA39A7lG7Rt9PIPPIdwm5K2pZWJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrsdUB6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrsdUB6W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jvhu2589892;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UkspQIiESK+
	OmyI2Y0EvkrUnb58XjaD6/3A9kVIlRTA=; b=lrsdUB6Wa87VPQytiRJibDjWlWe
	2dTPHpzAQqMep3MWOd84Xo6SfOKKIMcJffmQFQBIMNvtmR6ElAm+LOai/4ydqWo/
	YtGiNDA3YeIGZ3GwchUSHBJjilcOHhd7MbzMg6CmMSKgG+5mBt5HFaFnizD30nRv
	tNjkcGTxZXFfw1+hzOcEHotmtkkqxTp2Py4APP8rpRfDK8+QmnD2TLpGv+poGiiS
	wwOa9MxRqtcJpahN4NdhlK416I7btoiXr/Sw52WHPUjoyujcD90yUs+klhy66Aqp
	U+s1aa7jhb8Co8iNSKu1omZukRc+e31pfvtQEkGulGybs2SK5ixgptrWzGw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319xa9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8kahC1728444;
	Wed, 23 Sep 2026 08:46:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kZqT1728416
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 30450644; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
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
Subject: [PATCH v1 4/8] arm64: dts: qcom: hawi: add LPASS audio subsystem nodes
Date: Wed, 23 Sep 2026 14:16:23 +0530
Message-Id: <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: pLtNYDiQXsr6Nnm5YMegNEaqwU1p3Dlk
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=dSOzv7KB5QVHTYzXY8gA:9
X-Proofpoint-ORIG-GUID: pLtNYDiQXsr6Nnm5YMegNEaqwU1p3Dlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX2vL2x85boKDs
 VWiQJU7KV+poC/VdSp4KP7kZZyroB0xUI1F/rzEMtXn9HkSObQCnBvKCnDkX/Z4rzZQ9y5+pSaz
 y9lEva+fgQ+36vYDN7fD45GjzT5QZnCI1ABwrrmx+beVv/PkLSY4jKqnJP1G2o4t6f+m98gYfdg
 khc5mgdMIZrADfV0KnvP85iVFfEATSLx0PVRKmh+0lDnIW0Rngq7tCBGDnEh2gARYbhzeW+MkcV
 XPyaPZ33xsOf6sjJlrhPYPmly9r/OSHkiH8Ttkb8rEIZ38RYK9wW7d7pCFyu50zfIjOKJDMNHEy
 zVB70lLPVgAaVdRuvK0q4Nr+FaonZQSBe37FKP9m0BZrS+bCr//Ufmtr8Vb+D2IJpSgzvLd8BCG
 y5oaqNTR5Gldu38GTVQ0LaHWlLBsipRelPlGmqgcOQUE1xn9NlTFT3NXwiLAjgceTwlVureOu9v
 iUDR1QikLCbe9xRWHOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX/02qCOweMsRt
 JnvUAoqWxeF2GFSjzJFU5mwDuO9tkbZCz4y1UZOXg0bv/gP1+TjOQIS2zvXljwfpWn+/+Mt2WOz
 F8HQl+ws8/nTK7Ok7uqZQ7nY47Kuft4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Add the Low Power Audio SubSystem (LPASS) device tree infrastructure
for Hawi to describe the ADSP-based audio pipeline.

Add the GPR (Generic Packet Router) node with q6apm and q6prm audio
services, LPASS RX, TX and VA macro codecs, SoundWire controllers,
VA CSR clock provider, and LPI TLMM pinctrl node required by the audio
subsystem.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 291 +++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..a0807cd66a00 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -22,6 +22,8 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 #include "hawi-ipcc.h"
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3841,6 +3843,295 @@ compute-cb@8 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x0c01 0x80>,
+								 <&apps_smmu 0x0c41 0x20>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
+			};
+		};
+
+		lpass_rxmacro: codec@72c0000 {
+			compatible = "qcom,hawi-lpass-rx-macro";
+			reg = <0x0 0x072c0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk", "lpr", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@72d0000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x072d0000 0x0 0x10000>;
+			interrupts = <GIC_ESPI 219 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+			qcom,ports-sinterval = /bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 = /bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart = /bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop = /bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length = /bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control = /bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_txmacro: codec@72e0000 {
+			compatible = "qcom,hawi-lpass-tx-macro";
+			reg = <0x0 0x72e0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk", "lpr", "dcodec", "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr2: soundwire@7e90000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x7e90000 0x0 0x10000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+			qcom,ports-sinterval-low = /bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 = /bits/ 8 <0x00 0x00 0x00 0x01>;
+			qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart = /bits/ 8 <0xff 0xff 0x00 0xff>;
+			qcom,ports-hstop = /bits/ 8 <0xff 0xff 0x0f 0xff>;
+			qcom,ports-word-length = /bits/ 8 <0xff 0x00 0x00 0xff>;
+			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x00 0xff>;
+			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0x00 0xff>;
+			qcom,ports-lane-control = /bits/ 8 <0x01 0x00 0x01 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_vamacro: codec@7ec0000 {
+			compatible = "qcom,hawi-lpass-va-macro";
+			reg = <0x0 0x07ec0000 0x0 0x2000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_va_csr>;
+			clock-names = "mclk", "lpr", "dcodec", "heartbeatpulse";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_va_csr: va-csr@7ee0000 {
+			compatible = "qcom,hawi-lpass-va-csr";
+			reg = <0x0 0x07ee0000 0x0 0xe000>;
+			clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "lpr", "audio";
+			#clock-cells = <0>;
+		};
+
+		lpass_tlmm: pinctrl@7f60000 {
+			compatible = "qcom,hawi-lpass-lpi-pinctrl";
+			reg = <0x0 0x07f60000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_LPR_VOTE
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "lpr", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			lpi_i2s1_active: lpi-i2s1-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio15", "gpio16";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpi_i2s1_sleep: lpi-i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio15", "gpio16";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2", "gpio14";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
 			};
 		};
 
-- 
2.34.1

