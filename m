Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99735C1A6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082238; cv=none; b=HVHh4WysIOj6ahv6UDyAS0JL9L55SErbIFS5Y5l7l3nQFDzFbRr3tOKxI1CFgmwZAnRjOIKz2u7lbx1K+O3e+oqwK+pSeVz03mlfXx+12DFqNNzx1oGO7ZE/IbO65gd3yLeWCfzaMmT/D00F61ctxk+LL/Hvcv8czhDjm2ma5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082238; c=relaxed/simple;
	bh=CmzqBssAilXo0aBr9oRV7enL1XOrOpGJY5LW7vcwCD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FcidoTH8ooy+N+RBhWoHbCaLiH0pjNBrzy5FjCmFB5Lrq7gRNKE++L9iC1UxyykKgNqulg2mn1y4EWAQbtFFLBCMfmSqsB8Q+FQrpeNAy5JXp5GmLAPn3DRBYZ2bYoGH95L75kU+gi+OnLZz89SJGysapwFF1PLmqe11opD+Clk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmF2dukf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Koy7kLpk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmF2dukf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Koy7kLpk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AMowQQ2676754
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZZwHhSgWrVJ
	DIedqKwWKIosrNesyaOVgUcNfxDps5cQ=; b=CmF2dukfVd9tbUf2kK8BBzb7rsd
	rh4c8gO4ASvwk6zxdwtHZJ25Gf77qqXcqsto3TE9xx0JOSMkxeneo+v3tVBNimd1
	1UPZ0w55AsQf1aoQod/i9rKqNizX8JeMUQGvEduMuZ2GSdOxt7RNARkx1zlwPiQg
	IhGxuIGnMxbbFUgwv7OjbfJ/ikPxpJwcI9Wz0ex5e9BWN/0VoiJXE2hKvHoQed8+
	IJJbylee5N65wEpSg12coMCjImR8kVLbCkIpLTtv4V//hqQA5enYpsdUWvinfWbZ
	kJ7EfVLmXdKb9UQ7Gi8mIq0ewqTyH2Cr1fgjUllvlV50XhK/1ZM/Gr3EbzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q402k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so2935955ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082235; x=1789687035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZwHhSgWrVJDIedqKwWKIosrNesyaOVgUcNfxDps5cQ=;
        b=Koy7kLpka68ZGS29cB2Rb0e7Sjwkdf8yaVFKtuPsRCOyZj5eEVE0Xi8ocvYuARcpxA
         DTsXUzS3j6t/OjJK0K/Cdd8q0dVYtdHvcNhoTHnqD/VixKM/yZGUbc7jGmiqzf2NC5vD
         TEtE2xiZUZkl5Xyi1uDLekiANWdYw4LOQF6UoQxTNeTR2Ul18AtDbQDG61qP0xMzrT3O
         GJvSvIKz2Z6KukpiyoKztdTSPl47RKxH2aEGAq7coElmQ9dZATFHIkpwfiCpYIG2pV7c
         Y+ThcCzcBVrtoQawjVBv2z+4laOWuE5DCrA6pzrELjZpR+ByyVUUVoaFLhsffkiPjUif
         MDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082235; x=1789687035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZwHhSgWrVJDIedqKwWKIosrNesyaOVgUcNfxDps5cQ=;
        b=e6AMeK4dRRawQIqvgzsxnYLC3dwhYUJ7V2rFGmtlMo7quIxnC2rzKsS6a4qdGTDVgi
         nmm/r6Lt3lUJfxyKnbWVuhyANbpTxnIf1T7OYLgEG39iq6873zN9gfQghqLGNb4OisUp
         trKq7J8ctAaL0M3BMd9wev40N2N5CBf4KYTb3XgJTKurk7ucctmK7JSKejkqCIhWOJth
         ZTjVidXhh5Eb4oA8JXGjA4srEFll5cCMhd/HDnn8WyEp1mENHtf1E17PWX9jQ+sGFuRi
         IEd7hiPM/hRrL/wh9v9tLUSljPlEbDrQ6+LOkBPxUu4y1xm6IY8joOGyXJEWNyURTGxB
         YM5w==
X-Forwarded-Encrypted: i=1; AKwUvByC6z67MeyZ3ymcNjMFP4FzFUyoHFVy54btCqfp7F7pYxQQshGgDmK4z/I0Zjs9sa250vtwjoZvEeQtKNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kyrCuv1TQ0aUUnf76A/AKsCWFdKp2hr/sjIzDLAHnO4Y1t0r6m
	6rYAASOH4opJi2SbvJsCKDj+Bn7UCLz5S6XGO+pcoUHq4BrLohKeHBUebQWavO7IFMdIGOr4oiX
	5RQAuOgF/189DRffc5im72Ub1l4AASOVigXEhHemM4aUnTvVk8ML2MnB/KUEROvYBMQk=
X-Gm-Gg: AYBFou391N5e8kZq9HHnxiufFW2rPyFpmsle44j3RyAMy+thMFmhITI50C2+ku4iNlZ
	DiOTAItGB80iIDGDsygTUWdz1GY74zmtuc0dHUnt7b24wcN/ILEM1e5BjnGc5oPG+oqHYYsNoYV
	rxE06yFBrTfhUqk50v9D+6wgPm55A7Av1iTWNhfkp+RVaZ0cXp2DyS4JUEbhrg4wcz12tw8xbVN
	8koYTcyTh8cb0MZyEy0tDbIb9sGIe5WWwWuq+MmrcN23TfEgxT4io6yQcUr8hU2Yc3Vb7CpomIG
	hNok6GkO3oqdY1ToDp4+0ig4JLZTHwMd5EYRA12j38D3sXCI8OsaA3ZO7xo4DRCsFEqTlkj0OPr
	HNoQ5Srs7zCX9ygIl5ik+Im3D6wwGMXv+Z/vU
X-Received: by 2002:a17:902:dac9:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2dd2a35cf96mr29815985ad.18.1789082235262;
        Thu, 10 Sep 2026 16:17:15 -0700 (PDT)
X-Received: by 2002:a17:902:dac9:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2dd2a35cf96mr29815365ad.18.1789082234814;
        Thu, 10 Sep 2026 16:17:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] arm64: dts: qcom: shikra: Add soundwire and macro nodes
Date: Fri, 11 Sep 2026 04:46:38 +0530
Message-Id: <20260910231642.1794948-6-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-GUID: bYhY_MIDkiCc7vR-B_HogKnGd24XQsAm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXzAbwXhru1iLk
 B8UmwvZBZNkVEmRBfCp+U8Wi4A2EMzTXWuaszEVEB8cDyF9tzvFgDqt4yH/QA/EJxt2wit5wZE7
 cZx9fEypHUGlAPe1YAodwmz8UEZe19k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX/Vxm/yyeUCGf
 HlQjQE5JA4ehGA/1qQU8Ed0cgoLYWon5vF1LOIfH/i9FSeWUqPrzOEQNgQF+JmrcgOVVEwj5Tt5
 i26qiaKW/2RQhs0aK7HrokzQiCdzhHeP1uDG+bo1dbroKzUu6la2zZ9/yP8J5L17CUya1944P7N
 6HFBiF2C1L8E3K4/1yc1m5UUcJBsVGGa9qkiYsdgoJ9QpUlDJEsW9wn17dSrRP1SiP8Y65IBxG/
 9Cvxlhd/2hSLlsVDHlX7orm5Srj+lsxm/jMNJWwKo/3cIDde3nWrPiKMa7ZIrm8ZF7o6dgMCxTT
 RMa1BVR9JFHvm0lWo4Um8CsxFYD/1olh9a+AzwEx8y29QlOd3H7uAA8rFYkZpRggzxAWPPfAVJh
 a3zjJkRodMBxFvimvZul8MFr+YBBx1tvnPfK0X4I1kPa//RpypwSzM3wNyQnAARIjgoR8Z2jOHV
 kmBUKlfr09S2aQvgLvA==
X-Proofpoint-ORIG-GUID: bYhY_MIDkiCc7vR-B_HogKnGd24XQsAm
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa33a7c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SBFx_aHcOOkmsUdThYYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100293

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Keep these nodes disabled in shikra.dtsi so board dts files can selectively
enable and configure them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 5ebc40b428af..bdd831ec628c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -952,6 +952,70 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio96";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio97";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio98";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio99";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio105";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio106";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio107";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio108", "gpio109";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		pmu@c91000 {
@@ -3568,6 +3632,114 @@ qaif_cpu: audio@a000000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_RX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+			label = "VA_TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;
-- 
2.34.1

