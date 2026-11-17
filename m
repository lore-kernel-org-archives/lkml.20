Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912199;
	b=vJvYu425VnrDkPkTDLxKJx7Myg+b6JP3YUHOWHAgjEdDErnc2qYvgnw+qvqHjALNWmI+
	 NIf920sUK1hRWjBiL9fPbA+c6lw0zptBLshKYKQ4YU6+YGC0JpXviei35TF9aLSNgEWgZ
	 8Aw2SLWkgeYsYh3GL1wdzAtzCxkNYS1XUMvO99G07XBj9Fa5pR/hQPAierfdD9GxSMUdw
	 M3fpmf64pCipeF3T9ktcc36DUZAJW5Ejr4waW+JnpSP/yJdzngKo6UDsUSlx4I5NwTpj/
	 BhVxmI81dAxvfHRPGNt7UB7POaJkFf8pEQIYUOCVWoqXT2eXYgY0k1fu8SmPCWBGw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AmFyTq8+uqkJH4tj9t4qc/NvmUt0N/WlpNwjoyv8T6g=;
	b=gp6XyxTCxmwdAgSn7hi9su6HlHIqo7E5PJi0C//dsZbTB7orP2+eLI5CRXNKOJ5M8hN/
	 3QBAzb/Jpe8OKTfSrwPwKJX7LNKivOhs5bDhpCxC7fxHBErBWriaS41512DQ41bpesHiP
	 7GNIc7wh1PJx3ol5ZBm++Rsx/Ml09kgjDowK5xMhJD9PCs3xpasNuDQD4kYoATuzi6KNe
	 oJdrLos7gyUqoVcAsd832bTLNypc5qjxvKyKOs6bJCnouXuLtS+PpHeCrOgUsUCLyU+wn
	 SrvlocQIlnVOcbz3yqQDi70+UABEsFblQgoTjmFTfh3urH9YjtTUSbrd11vAsISS+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAvKtIU5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0169E606A893;
	Tue, 17 Nov 2026 10:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0169E606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAvKtIU5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8nLnQ844338;
	Tue, 17 Nov 2026 10:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AmFyTq8+uqk
	JH4tj9t4qc/NvmUt0N/WlpNwjoyv8T6g=; b=dAvKtIU5kBqsExE0BQjGjokpcKN
	5am41B7e4b7ol9ZdSCkXWAEv14d23AxbuPZJgAKdl6pyiEOHcyYhtCf6XrICjvxd
	EgBfNwkc2iEUGyDyzyUF88kU3G2xkwB/hBLzrVylYU1TM4ES69zDmBcT6nMttEd5
	PWuuBn/TaCzcYbo8DmAl3KV1yyb+0TTCfNF9GsGHVtZ3ywyBPBQXX1n51UnnYQWp
	gexTQKu+oIT26CzYsVd9uF6oKRWj5zXW9JiN5GaZBieSRHJ7AzsO3H3oObzM6xMi
	tLb4JoZkt2zkdZr8YB/zkjeNiZzNzKvoZy96mAhSBFhBIXBXR1WgF5iDXYg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h24d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAh6bN2583092;
	Tue, 17 Nov 2026 10:43:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHAh6sp2583084
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:06 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 52CE5681; Tue, 17 Nov 2026 16:13:05 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio support
Date: Tue, 17 Nov 2026 16:13:01 +0530
Message-Id: <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: OMU7TwQo-aVB6ipzYerByQ2IB6GhKtEn
X-Proofpoint-ORIG-GUID: OMU7TwQo-aVB6ipzYerByQ2IB6GhKtEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX9qpgDKby5ZF6
 0G/9xglQKUe4T7XDVmBWudVIkKvKNNPzu0LByNkSEboM1J+l7ADGLV2A5et/jK3KdjsTO5OBigf
 2Xsk0WyVdtHqIoCe8nsbsMLa/Qwa4MttDHIPuIsxdYoqbmo5GC+SmVIE37zyVWLKoulJbtq2FWw
 QsiXa+nXqa7vRnx2HsTj8ZxaAGbfy6g5QG0bFwFHvfalLRMZ86xOLwEf59+pf31vPAl1xktV3nK
 SkmtfKWj6BRYobQJONotCUElTTjj+5WYShBMivHIaPlJOBruOzbbWgPpeER9untvBL/LhFjALTu
 0d2IYB1aW2Eyn9MB+UmniRRj3ZbheAzu/qB07JHPQTB4yGpubYx0QKXXmRtH25EsdZBWlRn7KGO
 KL1pVrQx7DMgbxND7dsBTy/55qrrgoDMpe3JZZeKYTMOpUZhd+424x9yFhyo1qo07aXo7nUvSjM
 +qwSdSYmSN0SnJlZwHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX0nfm8emtFsNt
 Vyx+W8EgfMeBNkJa8x6wRXhhcG2bN5NmySndd/LgvBQFLNQxft/orRbsHEoTW0prpBs0C8+1Hca
 14AWlVOzbpy7aPTbVc9Ub68i2zfhBHs=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc2fbd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=P0P8N6AqG3O3ojdu1EwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

enable playback and capture over max98091 codec interfaces
for talos-lyra-evk platform.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 271 +++++++++++++-----
 2 files changed, 202 insertions(+), 70 deletions(-)

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
index dffe64475ded..f3db271517b5 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -7,109 +7,240 @@
 #include "talos-lyra-evk-som.dtsi"
 
 / {
-    model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
-    compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
-    chassis-type = "embedded";
-
-    dp0-connector {
-        compatible = "dp-connector";
-        label = "DP0";
-        type = "full-size";
-
-        port {
-            dp0_connector_in: endpoint {
-                remote-endpoint = <&mdss_dp0_out>;
-            };
-        };
-    };
+	model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,talos-lyra-sndcard";
+		model = "qcs615-snd-card";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lpi_spkr_i2s_mclk_a>, <&lpi_i2s1_clk>,
+			    <&lpi_i2s1_data>, <&lpi_i2s1_ws>;
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
+	};
 };
 
 &i2c5 {
-    clock-frequency = <100000>;
-
-    status = "okay";
-
-    expander0: gpio@20 {
-        compatible = "kinetic,kts1622", "ti,tcal6416";
-        reg = <0x20>;
-        #gpio-cells = <2>;
-        gpio-controller;
-    };
-
-    expander1: gpio@21 {
-        compatible = "kinetic,kts1622", "ti,tcal6416";
-        reg = <0x21>;
-        #gpio-cells = <2>;
-        gpio-controller;
-    };
-
-    expander2: gpio@38 {
-        compatible = "ti,tca9538";
-        reg = <0x38>;
-        #gpio-cells = <2>;
-        gpio-controller;
-    };
-
-    expander3: gpio@3c {
-        compatible = "ti,tca9538";
-        reg = <0x3c>;
-        #gpio-cells = <2>;
-        gpio-controller;
-    };
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
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
-    status = "okay";
+	status = "okay";
 };
 
 &mdss_dp0 {
-    pinctrl-0 = <&dp_hot_plug_det>;
-    pinctrl-names = "default";
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
 
-    status = "okay";
+	status = "okay";
 };
 
 &mdss_dp0_out {
-    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
-    remote-endpoint = <&dp0_connector_in>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
 };
 
 &pon_pwrkey {
-    status = "okay";
+	status = "okay";
 };
 
 &pon_resin {
-    linux,code = <KEY_VOLUMEDOWN>;
+	linux,code = <KEY_VOLUMEDOWN>;
 
-    status = "okay";
+	status = "okay";
+};
+
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
 };
 
 &spi6 {
-    status = "okay";
+	status = "okay";
 
-    tpm@0 {
-        compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
-        reg = <0>;
-        spi-max-frequency = <20000000>;
-    };
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &tlmm {
-    dp_hot_plug_det: dp-hot-plug-det-state {
-        pins = "gpio104";
-        function = "dp_hot";
-        bias-disable;
-    };
+	int_codec: gpio-irq-state {
+		pins = "gpio119";
+		function = "gpio";
+	};
+
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
 };
 
 &usb_1 {
-    dr_mode = "peripheral";
+	dr_mode = "peripheral";
 
-    status = "okay";
+	status = "okay";
 };
 
 &usb_2 {
-    dr_mode = "host";
+	dr_mode = "host";
 
-    status = "okay";
+	status = "okay";
 };
-- 
2.34.1

