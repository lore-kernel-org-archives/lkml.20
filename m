Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316B3C3450
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619903; cv=none; b=N8onJ/2tee+f/+aa24aI8iNCuTfROP6eQ4K/UxQQMjyePSUN/gdM3KM917dMseYI3yBJlzko3Vf8Zmc0M/gEIM7uojrrBv4Zyllf6F4N2DdAEaCEBqdpR+i4qx0nwvJo9j1VH97tezlkL5v9TC/fWuO/tC9ta4EzKHAK9gRrn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619903; c=relaxed/simple;
	bh=Ux+ZFdCoSoy8jb5r5lhL01BLMiDuxGk1DiTcmXbBktM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LY1XspKKHjrKRTsuMYgUBn1QJ8QLqQukMF7yBtU5PGBklrbBWGVJnbncbfNEDZoftbDETiBzsvLMqLtNSXShvR/S/3lBUjfnqBqLnuxzqb0Uz3vxgtLA/qCDL8Mf2jbz7DPQj+AhxO/m4ERsHDWLqOBhPs3eD4812LUGwqqE4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJ09n3ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6wfVXp/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJ09n3ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6wfVXp/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GN4LWV3107233
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70UT+Gxr/HpZnK+rKVvzxxLUrCpev93tYkaseihwzoE=; b=XJ09n3ihvEfEVEXR
	5lGmWeCS7ptDhQeywUHjcft2iCbCjTpxzFrCNBeDj8FkgzjgjHICCIvDzq11A+3d
	hQZGujupC+fuRIFxqUZ89wLDsD+Si653WrhWarQfycWXAisJYP7SouMY01wD3wSB
	FUzVhOMR0DgwlksYLlZ0XU5FGtcmaLfD0UFKBKrv3uWfSbvum9O1lpGf8EtzOjE7
	6eP5U9YJ7BYm34Zu5Umuu2GlWz+5mctXGBocaNz2w0HqTWATXfPEOjswvcJfZHnu
	t2QAibOL6wMOmKJsVK8wFgNctrPK0kAsDe4+G2fqkjy+quitN8uxj+UOtOIE+Mft
	8OMPQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uehw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8696b921ac0so761803b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619897; x=1790224697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70UT+Gxr/HpZnK+rKVvzxxLUrCpev93tYkaseihwzoE=;
        b=e6wfVXp/RUwgd2uOscviUoe1h8KrPm4apKm/t9wQcTV7IODtSB8F4XFGIS2QXzsfyY
         TIPhNF6Xy2iT/d7L6Dk2AtIqVqBxK9TsZvg0o7atOBmRlEpCt5/8twH1VdNgX/e3N1zY
         rTSHDJOxUyFZ5nMAiLj60+rrZIXITLhY9PtocluCp0qsUawQfjpshxIb2ieyOdSvyz7c
         M3wBXbumICEx0oZKjGMhGe1X/tmxMUTeu4/Jedaxj7X36lT/Hej91Y61iuv/MpVX2gq/
         JKDfm44DGFB+ukTKEEGnG3wSQoIoVepK7951VpZGskCGyvekKdo3LUgYpbX5zKbyHDth
         H95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619897; x=1790224697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70UT+Gxr/HpZnK+rKVvzxxLUrCpev93tYkaseihwzoE=;
        b=r+ogK3QmuF77EJkOVbVxPNKVq6+dAikhajq8TIsGzdUhE0InGzUMjuxYijtV/fhjl5
         EBOvM6E7kxkVXqPboTTmhUDbd4C12uipImYDRNhqX6+l6uNKBssoO19qNcX38WLPjJvO
         YaVuA5mUC/B1KLsiz7mkfJLKH2zl0sikYXe5CGX4zOfF3TQHaePujSxjk9E/mjVQjpgE
         1SrUT+hPuNxmMlZMwVJ9qD568B0VzOxoFcqSg74UHKYOaqwzkx7PvfLZfLcXFRGSXAja
         hw96m6fe77t+rOzwuutr8uXJy40pJu1A6Si3z1EeJgiyNBBDuFQ46TP93Zl8y2VyEytN
         2NsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT6fPYefcBGnq4t07rCal5nuzyxA6ic9SVcrc6B/154VQwsGCY4/d25doaSo77a80SuyntSnbW1Nqhm3I=@vger.kernel.org
X-Gm-Message-State: AFuF++kEsQYbloqg4ezqIImzRAt4XXa5J+DT9v8NsGYNa3uRekbfo4ek
	RCZs5WDg4wLtc0bAbsIUFT+4RlRkNQTG4+0zi81ZgLNJ+DP/2224BN7iWPi5emB3SqfieeBoAHn
	nd+we36xKvjkbcNuXjG6DOLGolzoBSy70jKLzaS1uMXCSprzGP9e016B8k9jN2ZvDIRQ=
X-Gm-Gg: AYBFou3XTvj6P1Ze1r8YS5tjuF/+97FRe9Na9xJWYfCgPGR9xeA0y4gQvQew7pBgDPg
	KsBn2iZzt3pbSKhs1mClmbmhj1VUQ9/lIlIA/J6cFQ8AwZxrtpoKpaLOjThOpdYbmkhJDa0oYw6
	cmVs4Oo2znURu9QbVtPFEAiAKwkXZ+xIwMzI8eG6Uctlbmgs2h6a+iseMoYDJ9Ak3m0m8lgS0A2
	reN1S7KFoO2/07AfjdrOF/ZzrYwsyHGnnnEJBIqF/NR54fJzaDbcLeRzD53/huCUOLm1qIy/4qB
	8E0jvcSZum5Qgq6GQgc6LrC67EaqgLeDVZIXo4bItHvXa1YkdzC52yj2Kjzn1UZZMOiB/lMr3bE
	gdAyWawj8knBjYKhDjaoaiLFshrig8Bgg3rDY
X-Received: by 2002:a05:6a20:e290:b0:3d3:ae40:51e7 with SMTP id adf61e73a8af0-3dd5f7add8fmr11856759637.27.1789619897016;
        Wed, 16 Sep 2026 21:38:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:e290:b0:3d3:ae40:51e7 with SMTP id adf61e73a8af0-3dd5f7add8fmr11856706637.27.1789619896582;
        Wed, 16 Sep 2026 21:38:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:16 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:34 +0530
Subject: [PATCH v3 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound card
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-5-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=6043;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Ux+ZFdCoSoy8jb5r5lhL01BLMiDuxGk1DiTcmXbBktM=;
 b=QQyXPZvONpKDc2oncX84cXKGHDcMdeLzWKHVe6ZwmMEh70USJSbxrI9QzgJ13GlefDf8yfiif
 jVYXr+1u4cCBJvjSKcXZuGHB3Sf5o8lrSTH53uDHdvE+Maomhj9r0uu
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX3hoyvdCJ6/Q7
 2k2PcoPq8qj+MhRP+rSJ0ImQ9dX9VbtvUz6EkBRpsqqA3TTOSXuqlEurs3nOGwSrS2u3gPBctww
 Ln2uKDWL5NJ8+vEClLMhUzs9Eh0KMjE=
X-Proofpoint-GUID: W7XmjGBFY793cJrqp5aZ7NKQKK9rcCMf
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab6eba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PV3UO2ft7tq4HPyVVFAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: W7XmjGBFY793cJrqp5aZ7NKQKK9rcCMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX1oD4haerucGV
 hfVU3YLjfHSW+TtAFSwtuaszdZPBu8lV7UKtwCll7cl77B1qj9zdjueylBlmUu+IIkCKusS+bjI
 syGIWZ+F99VKVPKi+qn1hM7V2eNhsDHY+1QkcliN7fzR6tbpaoBJUy3Tc64hIX7SqOJb0itx8i/
 699R7GF5LeFkthkaNbcluNRK0fT0ZVRPwDrblMffKgVEQRP2x3zoePsla0pWM7XlIJ01nF0jKIV
 7hNa2BstlzF2xILq5JlhNaSjpe4mFXtk9V1Eo977VFmJtQZJu22VeGdOBiGx/msfOxTqejehE1D
 fljn7MA+SHASel0pcRrSp9WJ+eQJXPkhG6i1Wp8VWB8h0xseHlI8MyLyCj3T7hF/NJFyYrQ2N60
 HYA3/5YpmF/hrTw4EfDdyKeiDmkCYMMW4kSgXbd3FQ8iA1GuZ9Uoolrub25/zzOb8RNfb2tws59
 aor2B4yqRyhRk2Qnk1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 199 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 204 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 079a1636cb6a..9da58ab4e7a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -21,12 +21,116 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"VA SWR_ADC0", "ADC1_OUTPUT",
+				"VA SWR_ADC1", "ADC2_OUTPUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_1>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu RX_CODEC_DMA_RX_1>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu AIF_TDM_RX_2>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+				dai-tdm-slot-tx-mask = <1 1>;
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
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_0>;
+			};
+		};
+	};
 };
 
 &audiocorecc {
 	status = "okay";
 };
 
+&gpr {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "okay";
+
+	wsa8855: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		pinctrl-0 = <&wsa8855_spkr_sd_n>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -35,6 +139,20 @@ &pm4125_ss_in {
 	remote-endpoint = <&usb_qmpphy_out>;
 };
 
+&qaif_cpu {
+	status = "okay";
+
+	aif@b5 {
+		reg = <AIF_TDM_RX_2>;
+		dai-format = "dsp_a";
+		dai-tdm-slot-width = <32>;
+		dai-tdm-slot-num = <2>;
+		dai-tdm-slot-rx-mask = <1 1>;
+		dai-tdm-slot-tx-mask = <1 1>;
+		qcom,qaif-aif-lane-map = <1 0>;
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -54,6 +172,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -104,3 +226,80 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3>;
+	};
+};
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
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		output-high;
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 541ba278bb2e..1b8cc52f88a5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -134,6 +134,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;

-- 
2.34.1

