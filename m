Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A64DE720
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772388; cv=none; b=GCWtpn3k1NHVEfJaOcKMQd+NPEmq2+tUSsUDj5FpkMUw+LrvXORoZDnTojQc1m0y0o+UgJG30xHwpeYFM2NCRqY1F4jUJwKUqpi9Mm1+zTq68ERU1MxLTS7yS0qf0Xm/UyAWAbnSpCzDb9facR/YSKOXLZ1ablkG3AT0+DgGcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772388; c=relaxed/simple;
	bh=yMrVgy5Kni3LSHIQ24kPZYlxQLVU8MMQNOYYa93+1go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3B5VQIRMo4trbniFJoSR+ja8IFNBAV8EncLwNNmvZSp7zgFO20w0OotXhgkA5r+zS4VjsQy18JBn7FUAe1L5WjhEhdCKdAEPnEeGuUJyVt4qXOGStXpzTBo9SXQBxIghchvwWxLZTI491ulVzy3WcsFoEeA7mAntQjg44B3ARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ5uAfJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KS+Ffmuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ5uAfJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KS+Ffmuc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7aZa319174
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uRpRcYJsQN/
	2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=; b=nQ5uAfJf8tdJCeahrNkrPABbI+f
	DJPpKzgqJxkr31yjkYVfUmvwg8HUJqaO8jRRkoikdZqa2UOlLsNmP+n9TMXfbvsT
	rHHw//foFiX+suUrMLJgW1eKXthdetqu2bMd9BkzzcUCgRz0IHxtPqdpn9gjX0z6
	hWEveXmywJV40k+HU0suqaweljCfEYSlbXSfoWfqa8gX8wrjPcKdN63v5GlINvYv
	aArowZ2grOVo1Kji1ueXErYkSpUR5ZIokqfTbrH5+ESQzWLv+7jjbO6W5kNNIQlP
	wxKX3eHjeNQkkcwhoV5ym9FfU8qrDQFqHgvvH1CYebCQ3FAwqf67Lhok8Lg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabqph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a77961b860so998402137.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772383; x=1791377183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRpRcYJsQN/2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=;
        b=KS+FfmucNd3giB/aEavRiLP291xFqqBpjSP+iGNhoMsxfWLVQtSyq+JNnHnD0d9c5B
         zCqA1Pd1H4SPNPNzOBpwy7z+f4Cjq32FlOABl6otLUTd//nNzmNXV7MGb3lpOgLhRVoY
         1YoH9ZKVjO6MzBNQBps6g33YI427iTIyolP4+X5EhyLJHf08MJTtym5+uBUFbK0r0zeV
         F6c0+Xw1H9JSwGJrDz8u/5aY0PiN/nRZAWQhnrMFxyKV90E0/EHNqHZp/4dGNw/rpU4f
         aC7LlGC4XEFEEFWNTQSaLmMafVnPLlt8WKdP4kqGuF+5PXW1fqvj0X1Clv2m0H9CL3cz
         XXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772383; x=1791377183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRpRcYJsQN/2DNtx4CpKGWOUgD+4vaWgWemNm1Au4DQ=;
        b=wqaKoc885zJyFU6IqMEgIW1IpIB7NZInUSMd7lalxxZ1vf25n4biDIQRSAFIhs1Oc4
         O1Yrd4s3dMO9SbIgPnsYW5M/gQoRAF2nRqygMoacGjo62fAlawvg8qEZ+xUNrC2XPBB7
         Bdr11O4KzE0Sz+b+Ik/t9xlpIAEE1bepzoYASlPGuWCFbM1fqZcURjxJyjtMjmnfym6T
         YMgZZsrpacL6/RrnVDNa8KJ7NOon3EbiST+cFdvlbtojDK+xL9WzKLLAwVTNYVnxs/iX
         zbKc4mtIhKumHx/AE8Jz1oiIMxKwExfdkAPYu1SpeOgPC/tBL69S+MRqL4VnSiqxRbjZ
         wjUg==
X-Forwarded-Encrypted: i=1; AKwUvBw/4zb3Ja4L+TrT+FgKFEAwuT/Ul72MZjLm9v8RjLUFVYQxj5ss2rBoYlPUCVTYz/o+dBsQfNBPqi+3KrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwnEgS0mMLGuN1mo0rD6APUla1Ic6Ho/cwd2FU0+J1UXCSgEbB
	HsQukroKeaL1TKO7FdRx4NqORt2JrBvEo2953Exeu5nb3SAiFF/5h4UKXtozjzTRfe8ztZexrgV
	vMeB9+Y7NIfvIawQVzRxPEkVw3CRv1K13Xy3wraVBQ7mzDcnF3K4YeNEcwWlSTD/r7Zg=
X-Gm-Gg: AYBFou2LyvhgZSyvZnKfudzag0/FT4c/K2OQQULs+3gfQDc/L4Wj6NwtYiQ99XBq44b
	ef2/l3ORtjkX5Om3OUUIVaBS7W9vE1IQ8qLf7T05crr3CF6HnMRWdP86/+QeFlTRWJ5H3W5WD4V
	WXfE+rP7znRwIsKQnft++7APR3+HJENYXNECBB2L5h3szCWmtgM5Vks1HnashWv0yDybi5zjT9D
	1wUT2C5MzQGkV/iG3UkhLiH0OlyF4yeNziBGH7zew/QSGFnaUSDdY9IJMNkApCHaYdiOcf6WUv9
	g15iyotCsdwsbIaV9/VdZI+AlQXydAkxx4iF2Is4bROxUQ26rzwLoEUwpti07S6e6sLg5ma5JTI
	kFTkyz43Nyl6v
X-Received: by 2002:a05:6102:3f49:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7be73c97fabmr221687137.35.1790772382611;
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7be73c97fabmr221672137.35.1790772382015;
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
Date: Wed, 30 Sep 2026 13:46:05 +0100
Message-ID: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXw3C9nPcOfQLC
 5NEyURZUmnVf8QM3fqXza8vJM4FJ5aAehlj1FjdEE9ypS0sEdR6Up5Lmfi0+AMiJ3TWCQ69Rrvg
 xibG1lbwzicV/MD7xkQ1VSmaQ941XTC2aGBAUmW2Di/2xGU5Lgs6cKWkvcZ/AtjBOKfOWMAXQv8
 NPFeuQgiAwLxEUwK6HHLYpysmAXlgY2uFoPy4HTqMrK5NszueuKcTM95I09+EgCPf2Zdph40t9x
 t99fdARm81YiV5A697aKv+whrUmsFcbELAsxI6Ea76zSzBANZhdrLtCglMF7FzdhlkPPVNrWILv
 Vm6RJRGUsdvgyLySfeZf/+ltxfboW2DdFE2I/BKtnE9X/Reo1jxMtZbqP2lOuy26Or9azhHTdie
 6w5gKpvrlU0T3oLfrSZ505lfS5VAMsLgRWpqPAMC0EJqPvnIY25slcH4U8VpbqBWf9mlzFzfoTu
 4A2ReEsgbaDHHTcz5sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX47fLPRqEnDyA
 Qz+ajPBIjIVbrd0KMZP+LiJ/8rNMOInvsIgsga1fTxvboPSv0/nb+TJSlnPUK7y0J2ahfcnzgXm
 T+gsGblEuXMeT01HiKUdxFccH63PtBo=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd049f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=mtT030_wRxJr2dZJK4YA:9 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IbWxVxcDqKUnsmCBPZUeefsasnESnDUb
X-Proofpoint-ORIG-GUID: IbWxVxcDqKUnsmCBPZUeefsasnESnDUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout
- Ear Out

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..85da78aec578 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -81,6 +81,13 @@ pm4125_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmic@1 {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..e99d2a56dc28 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -110,6 +110,102 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		ear-playback-dai-link {
+			link-name = "Ear Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "Line Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -421,6 +517,44 @@ mcu@0 {
 	};
 };
 
+&pmic4125_codec {
+	vdd-io-supply = <&pm4125_l15>;
+	vdd-cp-supply = <&pm4125_s4>;
+	vdd-pa-vpos-supply = <&pm4125_s4>;
+	vdd-mic-bias-supply = <&pm4125_l22>;
+
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	qcom,rx-device = <&pm4125_rx>;
+	qcom,tx-device = <&pm4125_tx>;
+
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
-- 
2.53.0

