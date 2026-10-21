Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568250;
	b=C/0vjPVN/610aMPeJ+Zxc1HYJ0voShEYmYm4K6Q1dCpTPR1nhonkNB4eTIbR6l8f2AB1
	 7dzuwSrgob7EllNDb6N31CKw8j6zgu9qg4h1kpaSvncQJhuaZNgyQn3GECSxgNv6PUW6r
	 QMvdRj5jMp3jeYxDnA5bTLiyHmiec23gOcwzYepHqrW8rHS3gEbbhAvJlCtnT02w9HSkV
	 uuoqgBhDzOUB405jddAlpwndgFntveaNB3azGOfqZVGZBvhGmMAWEpRyk9Mgz4bhpsDD5
	 pUNTzO2mZHerKMXyrlmC3QTyXzAcsw5crit8cWI/sklT6sajewHS6vSacOdvnYRI7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
	b=ZG2/VBvoHhF6+qRc0PnLzbKvvWFCqsDXo7CXR17xWGYcAHsoMzodFjkO3Idg22YI8zu1
	 XSvHX4X0lM6b1s0zEvIGs7/lTl0iPSKykOkz0jd4yBRaMoow+dFxwYzRK5ThVRoE9cOYn
	 EZCqZa6UFQR+q2WItP9pqMtAIe7MRcE38bh3cMJEY9nKoiRj2V9pgg+bzdFlWhuz1kn1I
	 zq9nSrcXpC9nIvXqWj/s6cSXs6nJZoyNNql+WHvC7VKGm/7j8JxxXaIBw5Dk2uKLbLXqf
	 sX5E0Luzh/cbkXnaAYxq7UdIyrjxFcI+1NDsjn5XhdTXE7vtsjfCv9AyW41vZUhC6tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D7606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jADY3711619
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IMy6Ev1Iqy7
	o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=; b=QPeATwSDRWOgzsrvE8gFroN1/n0
	rG9FgOouFSxiEjpVN+sx+9TrOHcYnIlOsNCC873KdHCxxYF2ccut/24bfQ10WeZ6
	o9dePkOYOqm9ZkFnXioLF2/uUOF+3uGcg3oapT0bt7h0VdSIa3fcit8as27avs6n
	f3lMFXKpLVfu4SOWl9wTmCXmENshkk61boe1kLSWb4X9Fb/VyXCX3IGmCN6XiEAP
	j7STghWpPmltExaRa8QBHQIhWSWL+ph8NCGPto6eARzsi2Qrjce792uimqgZsyBf
	g92oWx0cwLHkM0FDoEzpXdpj42+FftUaaoXBACrslnnT8u0y+EbBFKK12aQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2mh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso677856eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568248; x=1793173048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=KZywAMDH5EmL34wKPMV0Up60h8wTjz2R7ORey/P3APyhDFXV86qbKZFoEtGFL+DaEq
         BZAbDicHgUlP9AcyvHBQeTxHA6I+umUYDlOikGiShmmOFNqFSa6+TMBkCza80yF3+kU0
         QGCNBUrCfFnlSXmr+ixND2qonP3cIsJjkfVbA4zmbqj69GrV1MUY45INbRUSyECDKXF3
         TsbjtIs4leIhqNJzUtetoTb2FDGVe1N+zhxbdmbVAWNmHwLeUTibWtV6JR7GhhnjZEAs
         LQTkVrCN3BL5raF9rzqSw9qCRHjsh72MzvCZ7p6HdScjKgbpIAn5xB0+h3LBO0exQ5Ee
         br/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568248; x=1793173048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=L6LfKiY/+DnxwPFtJGbovfw38TmzupZqfbD1Ychv0OTIYfopRsq4oxDbqe820JiJ2w
         qDTVCR+iZM3TDPqGyowzjcOYV9Yi+hiDGClB/ukeNgJVFqVHldxgS0V4YvK33IOiLud4
         XWOC+0AN3XAkYKzNbzyGIpoSlrBWdbYEMFW1FBysEZ9rnob5PHo7069E/lLtF/KrOxU5
         ILIP3yWe/cnpGq5Bf29QLUTBfMaxtgEOBCJjR2OIG0j9AIoWuHhAY4Nu8Hz+cbBl+43k
         evyx7P8JjE9/x/aAD9yk3oOZ1OX0FgPGqRzfjRnCtvA5sjn0zNKm3U2DI2wLOCIDQmgK
         s5Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzHxtG2q25phFEWRRuYxMDlpGhXFY0f7bMAqo0YNzzE5ITfWBHuw5b4hU0QqtIBegTBfPfyyI9asSVnOjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6QXBOxBLnrJiEXhOPoUtpLID5auOPWss7DTE9CEu4RqcTcM0W
	KwhxFS6UMAEyBt0qobU7DOcVogSdH63ysZV8PLwrd7WyrEtzj28t7t9cQol1iqVjtPtyH/xyLPg
	39/V8FUAnaTjHHQC8LSxKyshW4G+xO0ZbTsT/Aww2xV7B4HJZajryjixRUca9vGmpJcQ=
X-Gm-Gg: AYBFou0Mv/Hzl7tfiXy6X2R/eQJikA17hG7374vKwDbB5MGTVOSzjTyIT7S2AJUI5Bx
	xYbSw83LHptRh24Bo/UwAU2c0bEHaALnrg7D94i1ETMx+kiY1briD5HVMEfS9EPyPuES/FxP3/K
	0WaqqRwYpaq0H3/n69ckHTI+TKrsFIlBXDCpc9pH5r1aeLmX5zibo9W8xjY2H4IYvx1wuI3DdtW
	2aN7YQUHRZmiX4qY3A5moDcfejnreX2CvdfKJf3JtsuRj1Q2kdcPDTyBXe6xQtGs/7jfhnO/23T
	kawG9oNbRmH8AStxb4+ijqYjLBLG3fKDHeYh3AOYKnSMHr0x59tzejlJ2RCgSW7lHMtX8E1zk0a
	5QR9/gtlzvkIN/PeiGt2EgzuH3mlpcExnqjZBLmbjeCkQqnkKg+SlbAlmAws=
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853739c88.39.1792568248035;
        Wed, 21 Oct 2026 00:37:28 -0700 (PDT)
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853702c88.39.1792568247415;
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
Date: Wed, 21 Oct 2026 15:36:33 +0800
Message-ID: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXyW94yXSmtic5
 OhTwv8vCoKBM/8rw1IDjs9xxS8A5IT76Dz+VXxpDxaofHmaiHZnPW4ofqzuWN58IT0F/VC8RG07
 vcNcNeDkuzKeWuG/NjlffDbwUKFqEaw=
X-Proofpoint-ORIG-GUID: lBZPP9wXIeLLJHbZy52QZhznS3EJAbUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX+RwS93s0Awtu
 C+zpz6Th9L8HJ784uLmElgd/FgGnb42DlQu+J/77waeJ3XRqNb2pnOphMw/iTBVedNpb+mH+wga
 TFMub2ZimCAQGePq2O+c4+zfqY8QyZZ16YVTjz6ZGTVbRhQHDnWtNjFKnWHebl+M3tJImxgO10q
 4Vs1fNVTWLpUAXEk+yZFN3ftk3uwIsSHz7yWqN+j5bZbiYWz7H1XUli8rHL4mqNoUbwgSkxCyfO
 hdc5L0Ty7dRtOZ3kwbQtQZmOTXt2L7TLZWNme+sc+qn1DWlZysW2DraILvkpM2xqOBNv5BJbplf
 81iYtonAUzdlrjEWChGkf2ZQ+3Uw/nq18KdqVMmkTELV1gju9nhTzHk3FMWd2cA4z5wUWVG0SBJ
 1x5N7JVvRJZNfywjqA7mHuuCoU7C8u/cOMNrLciNZ8lA5BV7qSg/beVXJ+JQiyeRpzQX3NfOWY0
 UwwgfysCsXWEkIaBHCg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad86bb9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZlzAYip4OQkxlMcad5cA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: lBZPP9wXIeLLJHbZy52QZhznS3EJAbUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

Enable audio on the nord-rrd board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..b0abee05a8ba 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,106 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. Both
+	 * parts are muted by a single CLICK_POP_MUTE_N line, so describe them
+	 * as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RRD";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-tdm-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_RX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-tdm-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_TX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	/*
+	 * DAC_ENABLE gates two load switches feeding the PCM1681, one for the
+	 * analog and one for the digital supply.
+	 */
+	vreg_3p3_dac: regulator-3p3-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3_dac";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +478,58 @@ rtc@32 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		pinctrl-0 = <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		VCC1-supply = <&vreg_5p0_dac>;
+		VCC2-supply = <&vreg_5p0_dac>;
+		VDD-supply = <&vreg_3p3_dac>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@195 {
+		reg = <AIF_TDM_RX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@196 {
+		reg = <AIF_TDM_TX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

