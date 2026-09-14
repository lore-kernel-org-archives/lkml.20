Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F6313E2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353633; cv=none; b=o2SN98JSdhD/nzPZDZ4slbopsko+2I4n3KgZRZ/9t19Gzsz3LkdIfeMTRNcHMGfEwMm3QlC8Pf/2PTWuQHaII8zBdWOK1zTXmO6wp+oNtUYAERmFZFhMFg6Yw+lYT/33zSG9oDgkqikBmrOLagGKCzCrHqt37oBlT/l+HHtKOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353633; c=relaxed/simple;
	bh=Hw6/IsHQpJhcpG1DHyObOULd+jT4pqPurN7coSKQuXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+5joDsRMwfA2Bo2IW1Cg3BSTMp3lm9wJb2JmXpRUTEMFIxa6WSDO+4GM4NzHd5eRA+GtLSPkz22PDTLxsEWNkk33xtZL8piD2UBiDAsye7ZOmi+FmXf6+6CKm2zElyM8fVWZGLT0nPndmn9eK4Hm35q/uoACu0xOM8TmkTohNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtE8Vy4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/UGRdWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtE8Vy4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/UGRdWC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eUF82808781
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X/cX0OG3G9T
	B9jy6BavgALGBPyz/BfnY6xv1S2eplbw=; b=GtE8Vy4RbNGzIZy+JGbGxN1zTz/
	+VOJ0k8WPtnIx1ljcdhUHTodBSzs8ZvS6XFb9Pr1Pk+ljxTq3eqrLeEORBPvGBep
	aIZojZeAH1qcSvYJNo8S9uYVZslhT2kz8yPgFTGsRkk9Zu1a6C5hgt6F6H4v2CRm
	gG9uVfUQWjU5AoP2LE8S58igz8HhAlSkPwZF//lPy/kN1306VD9GUbdeFH7A5Tn3
	+FS4NCit7ngl2hm7g2jjTmgVexS4yQqYUn6W/yPb+K0ylYv2+UKm07x8fcUarxqT
	K9NfkUuN4oC6u+2xIUQ9f69HufxZ4Rm1wHoCV7W9TVXe5vp5K6vR/8xL4yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ccpqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2179031a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353628; x=1789958428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/cX0OG3G9TB9jy6BavgALGBPyz/BfnY6xv1S2eplbw=;
        b=W/UGRdWC74LvkLVfkxnxuPiVUQ7ErJgxA80i9WNaXyqErq2GjdcQ0rnE94f02x0TXs
         T9TwZBKsjMXUcCxnHPWaEGx/0XakaXbcKOhn4iSil8RnzDTN9aoeDuCFCoIYE/ktyi5d
         MMk4Zw9B3WYh3AfidTOtQZalEP1LM2Ew+FjwgypN9I0+9e5YYu4UFPIy271+WXfs8Ce0
         LWnK+IutdJ3DZHoi4ssxb2iB5JSBo2bJPinnQUKNA5zg5Fc3D9nMpqUo+fFATRmvyyEC
         k/eOt8RPJYU94J0xHenY7B7VFTcM4Z1hAvWMSGpyGLo/2p5mvZ6JXKQuxRFTKor4KG62
         847g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353628; x=1789958428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/cX0OG3G9TB9jy6BavgALGBPyz/BfnY6xv1S2eplbw=;
        b=S0+wyJKRG6TBSj57Ya3Tq2rf+zDm44YoABKDtGElDmTw8cv+hMqUyjO0xobYx9Ooft
         mg2ZAnItTR8ZAZ3KNxmcHCUhvzzCIvv6vjaq5+VDSxB18fc+iB7fY3Suo24fdc0kTQRo
         Rxwebdo1Wkyc170kyneZF/0g9Y9/fO74Mf1ukiuHKn9L6Y1gLPfoZH0aCU0NE9SRNOr7
         Z/vGTb0NyyYif3LDf6AmbUa0WEpKe9+ySyiCnhlCPnMrfnBoXtR7phTAcxamMNJonDSX
         rmuOKnsffHvKxqOfxMEYTxYPpwo3uexkgufixI1DRb1CivWZ9bRiXkyToXRSJw8c4sIl
         huFw==
X-Forwarded-Encrypted: i=1; AKwUvBxR6yIQwmTSbYpXEst4BSlSEPHxMM5nRCTm5azxGT+/mdvvsX8PJgCgVmGl1KnxmDwLZ1tHW0eeYaGCPrc=@vger.kernel.org
X-Gm-Message-State: AFuF++mHwwNYh3ZIxT4yQLzYg+HxeS7gkptMggVPvyjb3YdukTdwgHsg
	IKbFkZjSjue1XoB5SeXw/UppXTC9a7Zph/9q2AQHyF2X3H0xDQ7DHlLrh8dUuIHuZBG2bkrWaCF
	sidYV9yVK/xadWsoeXe9KA4wtM7k5U810xKBM79lkGbj8j9Oebpx/Ba0qRaHTV6crGBS62hHEaK
	Q=
X-Gm-Gg: AYBFou1i8LDrPNYWgHQL1MKb8n01VKYdc8X3gkTb9KUpmsDv9bU6RGmFwNhbB2qleZN
	1Bx2LkAYjXkkJvy5OaKxGobR7tlFEFj/g3Q3K/wF5To+2TNYYLjNYkp5vF7xRnKSZfnSb9ukNtX
	oYDZ+aO54cu0JOJoBVV72/+H1IgkLhBlxjSFubgl5boD04UvQ2ks8IDf6PMd/Q+KlrkjqZs1/Sb
	Tg3Y6t7Vltjl7wAqSzkoM2hjdZTthx0J1a73ri2i5Zm6kofEHrgUHNkbFTL9DJ/04BpUV/yoTxl
	ljAvca3BrVgW79MwTdilthmCQCMqaM/MzS8CreMp0SU9rT8T5zNhP/+xQDIEy9aDqu6OtziHU3o
	fUD1NbilRpaD4FILBT2a9ME/AJmKyqRgiatGwhIp1gvJhMUPPtCX9ifvbSjRb
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr1092721637.8.1789353627716;
        Sun, 13 Sep 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr1092654637.8.1789353627269;
        Sun, 13 Sep 2026 19:40:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
Date: Mon, 14 Sep 2026 10:40:02 +0800
Message-ID: <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WwC2sswkw4p9qKcWh6qll_5Ytje-ze0y
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa75e9e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-7QXgc7oF19ObtyNz1sA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXy5+RqVwaTD6x
 NUkduvqaWn7REog3T3FJ/ToP3DBCsSbxa3jHUah/bb+fYp4x70IBkt932qIqSIYkasfMtSLk1/p
 ADc0OUa3kSqJt995eOS/0D7kp5a1XGs=
X-Proofpoint-ORIG-GUID: WwC2sswkw4p9qKcWh6qll_5Ytje-ze0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfXzph968g32bAU
 Ltii/XTJvr1tDgEzJOFPxN6gBN6HdfUu50RsHMujYyFnnp5zu5cUBs+Q5RtiNiPQm8QErZYjbFL
 O+Qw67bxAjjyM+ldX/JBieyeYeFxO+XIt4V9CIMQwd1yexTHTO0uLm2tKexT7fPorGNJuHaWH8f
 kCetHl6Z+tfk5xhet8zhBGqeFwAtIgjejmGQNvRq0daWGWDRbDlBNngoKGtsCnaMaCjJm5Yi1PD
 kOItRTExxvgqK7zngwLD4+LRliteL8vTN0IBQU3m8K00jYYvBsdaA3VV5WD/PoM5O00Ag/cnpD9
 dHNyI4tWZrI8BKc2v5zu6XEfhfyqqM8vcYtkzD9/jkVoonYiUjOFMCFfRf7dm+bjnw9d1rsWgcf
 nC/wcW3Mu2fHHImNCVbITq5diE6odRuh9zOx/EhhI+WWwmD9TeBhGkftGj5t0rpwME+abmG04Xn
 jBx/kYKZiR9/x8K8PPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord RRD board. Add a soundcard node using the
qcom,nord-ride-sndcard compatible with two DAI links:

  - PCM1681 playback over Tertiary MI2S RX
  - ADAU1979 capture over Tertiary MI2S TX

Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
other nord board variants.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus, so add that too and hog its dac_enable and
click-pop-mute-n outputs, both of which have to be asserted before the
DAC produces sound.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  30 ++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts       | 112 ++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 84ce57a07361..1cd6e0e17345 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1155,6 +1155,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	aud_intfc8_mi2s_active: aud-intfc8-mi2s-active-state {
+		data-pins {
+			pins = "gpio75", "gpio76";
+			function = "aud_intfc8_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		sclk-pins {
+			pins = "gpio73";
+			function = "aud_intfc8_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio74";
+			function = "aud_intfc8_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	aud_mclk0_mira_active: aud-mclk0-mira-active-state {
+		pins = "gpio99";
+		function = "aud_mclk0_mira";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c2f870ac4234..8798f69d3967 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -70,6 +71,46 @@ vreg_hub_1p2: regulator-hub-1p2 {
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "qcom,nord-ride-sndcard";
+		model = "NORD-RRD";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>, <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-mi2s-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-mi2s-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -464,6 +505,60 @@ usb_0_con_ss: endpoint {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
+
+		click-pop-mute-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "click-pop-mute-n";
+		};
+
+		dac-enable-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "dac_enable";
+		};
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		DVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pmau0102_i_gpios {
 	usb_pd_int_default: usb-pd-int-state {
 		pins = "gpio8";
@@ -474,6 +569,23 @@ usb_pd_int_default: usb-pd-int-state {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@20 {
+		reg = <TERTIARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@21 {
+		reg = <TERTIARY_MI2S_TX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

