Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B335C1A6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082252; cv=none; b=feJXRGXVmgzu/HVW63RMNPWhzqjWLfB6fx/rRczH4eWnEIezCw8dUyuHMtfmT9Pf6OGL3DJxQlligtxNwcCFdELaaFBtMZAdc8xZZ20RSR1eQq915OWuNrnyAbtRU8xjRvK5An/YTa+h2A9c1akMgVacRLJfh1D8Y48GG369ik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082252; c=relaxed/simple;
	bh=maX1wuAeEzu6lMKKtp5HeXvgFL48hMNq5oNSPnaj5fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEY4jJONGMlg8SQfAr0xknapSuJ3yGN31AMbRY5tyX6qIEaZ+clSR8EIDTcnWMw4BpebOIigteXJzXPDF139lS90G+F9w3JmATcfojQWkEqTVtRon1mq9oZI13SiSETkIndt1C2UAz68g3kBIxjWbvBp/bgC7dYHN5s+neVJ64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POHmB7+K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq7UO7Bk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POHmB7+K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq7UO7Bk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTddu3279976
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+qNJNdEWnku
	Y5tbROrTh3u88yzp9GtoqPr8X0z9zwNY=; b=POHmB7+KU4fqPUnzsQdVcg3Vbn7
	SsWNMXHDH2PK62SygEG60nZs2tl+de5jDsdEL7SubfXyY9GAYVGVIJf8p5RoMPVH
	sJzoILhFP8+T1IOd2xHrVh4TwaLR0yMmWvJTBPCzaz4GigSTyhte8lU4+NlmfNH4
	MR4Dw+HLjOYPp2m3sLaQHB2Pz7afD89dCyarJ6rUIbn70gDMp6rWL3zTHL0pGC/c
	mznpBsnrujsR84WTaUhxv42BVS7cmXpFbrGkpvqxE7hPPSYnvWQQC3VewRPDW7Gs
	FLSvyM1vBZ27Cd5FD3k+/9kKZpnnc8iQvl8ysMxWmexj+ejIZBGqrpCBI5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnva1dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so277013a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082250; x=1789687050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qNJNdEWnkuY5tbROrTh3u88yzp9GtoqPr8X0z9zwNY=;
        b=Oq7UO7Bk5XVmKqlLazTVeIqCIz5+sNqNVtpQMjfedeJ9T1f3XJB6Er99ByMXMNBnbO
         o8gha+GmBjAg+rx/7DvZZThDILjRuFUPIjrz2XmNwRTIVQ3GuegLwUwA7t9JTh4OXUxC
         dzU5RHHqlGeG16fge2ggNi/dDhCT5Naz2Yrx2WXY9A32sivbeNFBkteDbqUPMOcc22ZT
         sCw7OqVbhM483eI9Grx3KZiTXXZ9YcEOHQgzgkF19DcW8rcgyNYISMFOkJHzf8ft7zru
         CcJ1lU9XmFqVV6k0VhiIB2986Whzm3pvVxhqy18fjpkZuueuR9RTY9FV8TD/XMD0CBz/
         8rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082250; x=1789687050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qNJNdEWnkuY5tbROrTh3u88yzp9GtoqPr8X0z9zwNY=;
        b=QHwIyPSbUetGFKySBkFrb0UBT7DZ6IS7hOAvDFrS/g/gANyf+rXZmIGS8HWbugK9R6
         WHypvEdqQ/QCUxpx7RoS7DK6QRJr/923G9mAO2ATYOAO6OUDK2ZWK0T/n2QE3xkmaN4y
         g0VyhLXgBgEGq7WWI5jquwNFa5WLYbgqbVLxlj+KmGg7HJTKMSuag0pWXahgtLTXobYz
         em5R5xuo9wCSFRdnqHtMYFZ2mJ+qkTC4k1aSReuRLYoOkuiIjtXYEblF/R+SS7V+gOVL
         ecTUBrP/PO1YNl7Q7BCoPEbfQYIa9mIAxgA+5bJeoetA+1Nkg4jrroRKLin8Kt/CtX+y
         7v4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9cDWiAmmPQ33eLaTaBgrvHKxRD1VrQiR7kk5cUl9OlyukdSsVY2zD0kdsjKCekYN6+BzfLNmy5CRNVtg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvS7bJeRWruJQe703G7f4ePSplqY29u/D0Czw0aF64UnMwiE2O
	DGEtQ/FoEiwh1jISjA0YrFXLxeyAGPgHYP4qSmEx7V9BdDrKabJQ2M5rq+yRYDxaQpfTK9eQO//
	Hoh8CTvm+zgLcGzDmBVlrLcsPV3o7G4jRPiE2EH7dFZs6NeCvdML24ea/0YTQWjw4PGo=
X-Gm-Gg: AYBFou0EOj+fNlt5J87PSe7i5foPOik+F8DoW9hllkvIx17YPCz8w3p+akgt0aSeSzC
	qbhN8Cpammd08LhhKtxLey4lE2dNjNQoAiC6LlH1e/QI/hJFSR8IbZxvIGK9KxVkY/EcgI9EOix
	LTQJ4kI8fc55i9pRtT6Cbyn25ta7Sy72+uaW8BnaHvJAJYq2qJe+buHLakOdfy17Y6QC00obh3o
	Ltw7hbz0wFgzxI09LrCyTU3239iHXiIaKEeuldW45ZzwO/B4tR7drJPngS8PI2V0ivKcTbIzRgQ
	K6JNY+fxI53z9XjetVvj4ngkPKj0THNgHj8+J1bsaiN0emZ90fhhrWIoVWZGNfMl5Vu/Sl01Oxi
	7XBKXPuuduzAAu0m+QM3clwaErHfjAq48X2gU
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr1931477637.2.1789082249592;
        Thu, 10 Sep 2026 16:17:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr1931430637.2.1789082249140;
        Thu, 10 Sep 2026 16:17:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:28 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 8/9] arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
Date: Fri, 11 Sep 2026 04:46:41 +0530
Message-Id: <20260910231642.1794948-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX1PSckauVhBV9
 HVpQR0t7bmQbzUI/YsJppPxcyduAs9RdhgzNOl8jt4o/EGhZtjQGVSJSxAKl+ZGZuTiSZp29g3P
 lvkLISafXkbfzBmXgqi9y7mkBVEYKcdSJGoofPiD7bGU9TXbxe6sLEPduIvrjNocx6uDrpBXUM8
 mVqyRiDLLUr3Eb8lOzjUCE+ulHIezDcD4hf7zdmJw7JPrpdh+OdlCeZlljfH5WyrlINoJDcQv5E
 oh75S0B2Ch9fjHZlVon+RcfR7iPS9ihXuaG5zOxxhYLKC1WmIa2N2Ap0QCu9eC6XlCMM94DIdte
 BR5k/ww7N/GOAVirD54HhRjhgJX4qe34GPACRQHKM151SANuyTTDemqEnHr26Ujuy9a9MZ40Xa3
 A9CnGaNU0KtwIrhqEgnZwICFZpHyjFn4qGxKG9fWj9lm+Was+SL+Jr7CgrToYktsMbloylgTv/E
 Omk4P4O7CbBXutVUDgg==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa33a8a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wLb_nwxRshEjtDnoXkMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: d_Cr423XeRdnM0W6pRgc7Kb9mM93jD6g
X-Proofpoint-ORIG-GUID: d_Cr423XeRdnM0W6pRgc7Kb9mM93jD6g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX3kWfi7E3QwZN
 uRKVNhUA+4Gv4VgxnuMK2g/Bhn+qBsOz1JZeUOsh2grthItoDEWB01ZUnXISMmvnNkO4iNzLQbU
 AWOJV7i9k+S2GDRxJ2oCdnuXgKl+FIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 144 ++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..69b0c34ec9c4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -21,6 +21,105 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
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
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +156,48 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
-- 
2.34.1

