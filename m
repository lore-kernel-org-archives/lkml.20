Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39B322A1F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=uzocu0fxtCEtYz4yd/pbLSLCU8YXYOo+sk8qO3SEdl2rQMLVsGQDuOUBpvjkqRZ9WSkdVJMFz2lhksH3BYm2Gs+mgEpQovnbbiDdsJnQEMzWN35sdmJhXdBPTjznLDOi/QWLbKyAIGaqy20+6WZYstAKmnxmEaRR52G12xCGWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joVdmmp/gmCPmGFivi4Efg/7kdN/ziD6Ff2svirmA7VGT3b/532d7y/Hssu02wZ5fDifZMP2oZLN7cxSgyxeuXUYPKEH62hjn85RMA8vKA64IXZf49DcNGwDBNk/m4jRXQ+/CHHOLjMVnt5egdCABPpO/fMsc9SK0uUQUyjPHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFHIAhn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7dlHA5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFHIAhn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7dlHA5M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJMjP1416169
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=; b=BFHIAhn+mISfN1t9
	LckRa9r7KYHV+dr540xxO6F3mqGTYQASmmS7jT8rsTz+38yZKhip9zzpwa1qD6RD
	NXJlBFdeLjt50sUReZARr3OGBI7zShw4vYp/zH1mc3VqsuLo7hfIxlTV6f9IN3Tr
	owXNdtu3bOsnp62dn5a/MPNPYSKKHwOtybYSnUMSbcRgF9UNvk1WikxUn4OocwRe
	yhZuyAjVlLLmyBWSiZ4FTabsZormIsSx/ufTswwf+dcrZF/KyPOCiehkMqFW+i4g
	J+LpDUKvMo96bkwH8bI4ooDHQTYBHDYIcHIp7Hi4gb6n6Jxdy/IRA7tYtsnsOLxY
	mW3big==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2knyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4528976a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123743; x=1788728543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=e7dlHA5MkQu77oR10liKceMrHONntO1t4ggg8f7n+y+abPjYhI8QLY1bh/RpzvXsuI
         2wrKsOnOqT26E5WL6JCLD5nnqCsc5UWyHxCtRU2WN9rMnKysT6AyPzdN8++1VVY2juAH
         zMGH85sJYK8k6THI05L/HXUCuL1zGCxxol9WaTjaoGXz3ungub17UmyZ+kuf2aZ+st7I
         LPZbltQhNryqPu/TtNWfxhB8ksx3frCGfVKEp7lWoE3lpkn5CDRdGwSaCJw8/NWsu2bZ
         yydllA5Tu2vODpbfhuUPEsjMyDwssfW3/OKdFsrxPXzQb4kkWvStCtMn3EDieeF6c/68
         oPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123743; x=1788728543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=O52ADSr7OS2uPrXijMPPVLA6aRXWy9IOsnfpIgQn+B282PMzeUZqGBibIWFhaI6Ifa
         p1Vb/IesGKXVrEfcz7LDzzrbAfLY335/FNtVqyXMTHD4ZrHUw+c0YJ5w1uoANYFR0a/L
         nIFl3VmqpVfDev3mSz9FvKZDSRk2pt9Xk0kH7FhRWfJNsoSOofzqWSWgmrth84CnL8s7
         BdkYJC5rwi51p4sN7jMyuahneXU2al3nLOC4IJhhrthAiOva+pvYv/YVy4tJkFcG8M4n
         VafKGFJqyZCX9+fqwX2trvI6J/Xag0/aDnUkCbyj+IwtF2LG64W+f6Mt6ajMIWSqdu5i
         RvUA==
X-Forwarded-Encrypted: i=1; AHgh+RrQ2cIUAebf7WV2B2JC2zYELS6eUM9xkWA3AmYht8ixA6xZmhEAC22TmLOmXV6YcJKe/9FoYKhKwt+Da38=@vger.kernel.org
X-Gm-Message-State: AFuF++ksSN4FvkSJInnJ2Zxf0E8WV9wimRFzFPpQInVax1E5Kue9fdZr
	xVEO1igFTTRkAukaueU0VAI19EQI9kh+M5tRP3OIevFYGOp9nqetKpB0wOqrmOp4k0z1hY62IMd
	hZWAsyoStsmzILZkTzKlxe83792v9r+YrzW41UJUFbbDa5Xo9kOlv0X/Df1Y7a4iIdj0=
X-Gm-Gg: AR+sD12kUmNk+EY2kVP/CkyvJhRLJ59iKbwGLIPdYpk5ccgjFcMGX5kiQWwS/SIzqrS
	+oquqOsjSKJnbMUPwouFeULbxKkjSXTUxLH7GreVyidR/H5V68iYnVeIQwTTjl8KoKMQLznlKJT
	SGvZLgskVQitCvSZW5xoH1JLdCaX1cLaUfAUqzGyQeVB718v744FE63fLd1ju7Ac/omlJQZAVC9
	xV5V7dLozKO6Ad4Mxl8AQCj5NH/cR4CR9WkxQpwa3e3IPLU9w/rxMVnaJXhg8v2Z4m29/QEBAxa
	fFs+3Qhc2QE9qHucWWPN1B0FHtI/D/3wcNn6gNxzTT+V17l9GOyfqzJ4pAz+LiDcyciXaRucuZZ
	I8/p8/E9FjdKdGJprm/9FLKqPfKU9XtMkPYTg8VIjwA==
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156598637.4.1788123742970;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156542637.4.1788123742580;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:03 +0000
Subject: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=4383;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
 b=I7ACeisDbTUKW+hx2+sYwC8SpI6bKi0sxAYp5rtPFlFB+PhBr9KWkjE/zj8zaYcjuz1ZOASgI
 QPnilAX/JrQDWAF7skXpUzN/buK4nWgNL9ekXHXS8M3cvFVfTWEAi3G
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: wv2HjQRIUc8DZ5oR4WvTpw8VD0j8pnqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX1fUfz9R12eY+
 omsgIx89Wjkk55x4jRurnEOTCGLR2EKlNb5eB/7oKMeqVtXKogpT8mSDVippsPEC/+0v7VoxGzP
 hKf8kbi7Vf0gdSoBRg5G7dTqpX7OmgaHsIUAIKuNpUwy5OdLs1A7tBUJk5BqOrk1EEkvCL2OZJV
 kURDD1huQ4lAVStlemC3trlKx7cIbLlP3XumXKKS6oL3NgHG/XGfOgkBRz4inPsnKP797v/bv/x
 3eCVENCDmiZdQgH6lMa9YDOQZBcXp7epp5UpuEXe1uim62fHCEYTMSg/D3aupsgel6j0cFsp5Xm
 XWjDXZZ0JTLqlieZcUAkbGVG3XSMRPFC2xP92r08+J8GLI/EnkmYUU1MUc+dFg5f0Axug+QfIWC
 CI9qZh6+2gyM2WyOFrehrjdDiVROPWff1QO6K6GFET4KDITbyFIU4ZSqQiPhIuzXbHkbp0io0N1
 4Gx+Gd8DFj62BvI2RIg==
X-Proofpoint-GUID: wv2HjQRIUc8DZ5oR4WvTpw8VD0j8pnqx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfXywbh8fbemTe+
 W2TiNRPPD5VmBhzDlhJRQeq7kLznXF9/sG905nvqlhk6DMh2+2Mvdxd9a+t1fV8ylrafoqYU01A
 1TyL86s1dRCjs/V4F6q5Q9YAeooMoQw=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a949a5f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SrWXOAHHq75Mue0GltgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300184

The "limits" hardware performs rapid thermal management of the CPU
cores, but during prolonged CPU usage the system's overall temperature
need to be further managed by software.

The reference design provides seven "system thermistors", connected to
the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
thermistor", which is wired up to sys_therm1.

Use this to throttle the CPUs, in the same way that we're throttling
previous generation laptops based on "skin-temp". The trips are chosen
from those existing examples, but are comparable with the ACPI thermal
policy.

While not used for cooling/throttling, also add the other thermal zones
for temperature reporting purposes.

Enable thermal-monitor mode for all 7 channels in the ADC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 429deffcf3e9..065af18357d7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -11,6 +11,92 @@
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
 	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
+
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				skin_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		backcover-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &gpu_zap_shader {
@@ -20,3 +106,33 @@ &gpu_zap_shader {
 &iris {
 	status = "okay";
 };
+
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};

-- 
2.55.0

