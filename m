Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCA3E49DA;
	Wed, 23 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153219; cv=none; b=VcMBYeQTbFfifpAUfCU7zi/+Jf7EAteSJKF+9NbJ2B0j2sbY3rCmXkCrA1NIqer8pY7zzPJsW+DHKDNLk54E4lKfkH7VYWCMIYNv1U5pNjWwL6mmlWYpd8Q2QITnXSIN6ERbYHIDajwG4rHHiaX3tQg7GUJgAlBhDOLdzkbMutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153219; c=relaxed/simple;
	bh=f8RH3IvKprirEDs1l58PQBvaE296Ugdy1ZRiV07VDTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9TX7kVB/enjlWEurv01mQlWd7dTmQiExn8QjJzcFweNbRLkhN+E10Nf+dRlLhn5CNRdZilJ84amt4ntqwV517h7Avu0b9dJLc29nZp6GYYqxwS8Ufrx08jxqyVoX2gNtN3U4+Aoy4/TEHcTcHz230/n7SAe+9xy5ThuVhrQdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7jSuPF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7jSuPF2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JfFe2975584;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hD2T7L1G04t
	NtQqk5uS3fSuWFRZwLtwDCuLNV9p/gso=; b=H7jSuPF2MtN1IAqaQ1psRYyz331
	a9jig2XMeG7BwE1YcdtH3VKqNbJSuA4EMr6PAbldZxXZHdbk9PQshu85hNNJIioy
	IP++tj544mqJ87sn7Tq3PdAnwoJ/2qlgXuVMWAmJgKzEMwwLyTa5BQt7iu5sEdlq
	dvXOyLEhGL88pSE/5lHUJ5L9VmxmNwbeTz/D7rCVqt2H+pR0fDOCbNlt1GMJ6pU0
	DIzxyAS3aKE1OoeTgEz2aTD5QAFo7G9k9RqcWFt6A4DijZw5Xd8SY+UibvdEnHVr
	RslXr86G9qdnxyy8Dr/E7Axv0PflrMBddSE6em/MeFJH+1n5Iq6IZ8seXdA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n122h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8kbv21728490;
	Wed, 23 Sep 2026 08:46:37 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kbNW1728469
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:37 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3A4D764D; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
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
Subject: [PATCH v1 6/8] arm64: dts: qcom: maili: add LPASS audio subsystem nodes
Date: Wed, 23 Sep 2026 14:16:25 +0530
Message-Id: <20260923084627.748920-7-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX0fpE1GJMJlDe
 ONeb5FULkrTojSXd8wh9ZTCBvQbWlWsLAncu055lnyLwpCyWApV2BX2OLvdKspsyUoVCM6+m8jI
 pwO2XYmwUK3VxRmJ4td27tJw6C2IJxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXwADsK0N7p0aG
 MvqDT1PrfUKMMg/h26+x+bH1f02wQlM3Tcrhr9L9iAlhWCmmMybofzJy3v3VH+JQXZXcqTgygJ9
 8tKwDO6ZS2lffBYqXGg7lu8zelF8Nl+jY/mdvzysMlWseiG2TOSZ0XI8J85afQXVcCjJCAr2jD8
 +SOD1TcVLJDCPnQUZslCuw0s7BBt5Qlw8scMdDEg40vd1N692JpGOYZaY0sZY7Xs87fp5P0akbo
 sLUofEXE7K4o+eacZ70c06eL6KZsnXvCRxArIsr+QxesAfAm4SY+sz0fQ7s/Fdiw4SyGBJWnL7S
 AoCPtNYRA/sJKjuGjKqdWhtORK5oWP86j+bPMgr/JGpfhfJNVlUVSjm0/FytSlMTU4dx0OLeOkI
 v0sN6Sjf1o1F7iRHTGrgtFRvpr/SiSxmYKoSH2vuZ2v2+rO0c7Se5RGfegldve2yzkqYUEJig5O
 povJ828d+pmO6hCdQ6A==
X-Proofpoint-ORIG-GUID: _Eu1oGQ5j0KdDjflAQ0SyLkG55Dv30lX
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=xH1pX27c9His-OQcG9wA:9
X-Proofpoint-GUID: _Eu1oGQ5j0KdDjflAQ0SyLkG55Dv30lX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Add the Low Power Audio SubSystem (LPASS) device tree infrastructure
for Maili, mirroring the Hawi SoC, so the ADSP-based audio pipeline can
be described by boards.

This adds under the ADSP GLINK edge the GPR (Generic Packet Router)
node with the q6apm and q6prm services, and on the SoC bus the RX, TX
and VA Bolero macro codecs, their RX/TX SoundWire controllers, the VA
CSR heartbeat clock provider, and the LPASS LPI TLMM pinctrl node with
the DMIC, I2S and SoundWire pin states used by the audio blocks.

The SoundWire controllers are left status = "disabled" here; boards
enable them once the attached codecs are described.
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 291 ++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 6053b61cab6f..d4267c22157b 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -20,6 +20,8 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 #include "maili-ipcc.h"
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4008,6 +4010,295 @@ compute-cb@8 {
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
+			compatible = "qcom,maili-lpass-rx-macro", "qcom,hawi-lpass-rx-macro";
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
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
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
+			compatible = "qcom,maili-lpass-tx-macro", "qcom,hawi-lpass-tx-macro";
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
+			qcom,ports-sinterval-low = /bits/ 8 <0x01 0x01 0x01 0x03>;
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
+			compatible = "qcom,maili-lpass-va-macro", "qcom,hawi-lpass-va-macro";
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

