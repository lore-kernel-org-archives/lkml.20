Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443F4A3D4F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144904; cv=none; b=J1STyI960sTM1GP6DP2dYigdO0yLMvzCyU0kpzz9mnYYaPtE8BjNECw2kdvYDi/KuxvVlTYtOOa2cKlJ0599cfjHzG89k97pFTxBI/99oW55yz6fSWvylwD3Fig08sV/3lLEEvYMHOUUaY+DQasUKYSWsAik1rWzHeW01w60u+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144904; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G31l2yWqSvHoqUKKrbNxH7H1fSGN/PCoJ1r7iXyYa1n4lwCPuUgLEobHYr1hCdaNOKJisfq6XiHwT2WVX7FiySl0pPyd7A1ChY9B7d7HwfEAemOoNBX1z+0qWQk9frMnhwdD6yibqCgHBYp4V/QcZs6QQXSdZMYDNr35IRBjt08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmyRy6OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c453K/IV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmyRy6OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c453K/IV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8jG1090832
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=kmyRy6ODbeGGJDql
	tLlqQb/qoL9ptc9pa1T+HjHK+Jq+PIv/Oven08MJRUnf3fRpLZiI0WqCnb7ikEIA
	T3jVLqfjXhLIfP9+NePDbTfY8TtZLsvnD8trSLaV99/FRCxsGp1S1ysHza5Xg1Vp
	9clFdaO8Oy8YUnh4tlAlPrbf08FQPcbi8PxexyopGQuqBwhSb8DXNgaUdQ7jpu2J
	d4xn9LQCahehcNSbnhqlwSliq3Iki0yq/H95sKGLy4mMgC1gpGztaBd+lF5nUp6c
	z6WpZ/3Wdx3T+DdU3aIqSgTYpi0xhhHdOUgzoIj45h6qHIbkROIbfvZGe8Sdsgpw
	6h9xrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3ath9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1446925a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144890; x=1789749690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=c453K/IVau8U6PY0cc9HwQmxD5x7UQx91ak8x6QX88jJYy/q/w+RWPds3ZQVOrhMeb
         djQbJDtlKq2C07/LPNFLsh0uhqraalR5jQnhMUzOwLh36UBS1acZenpHugGh4lBo2uqk
         UYi/4jDBanLLjAPEB3jMcGdElLHDZoOWjudX7aLmY5rUq6TJG8ZH1AsvbKnOS4FzvwEG
         ivlaatQ9FCzE1dDk29lKZgRY73j5K8tut2yjVoN1cSEXWLyXKcE+gZhBhJJc0Qrd9WGJ
         X811hH9HxWZcPjwHMeA0lN1nx/lDrj+HJudoWe8ZiQHlWLlib8iKCk7RLUUJMJvwddWi
         d7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144890; x=1789749690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=Vjv5HbCy5NcFjBknxzPQPpDMxswjPDHbaULVm4OHP1Yis+y2VJavH2olaJQ90OC5xC
         n8W1+awihGhEl2fYvMWF/lp8SfdSF7Wnoruf38gvOUvIY/448dyvJBDckfsObP0YELwS
         W+jAGKJKnW1n74XQITjGCu6PjY/NWLjp1SSR4jzm3Mgh0UgSHO7i4+GdHjGSoxxkk6Ht
         LKrBRtF5SPAwj9j2u1VgdLcsq8gnlduCxgFm0tNIZu/pqrzCv/9trlomW41bh8CLKPEq
         T/Ve51e2w0dIV9RG6nVAxqDDRK8giuxuxvZIlVYDPr8AVeSZpNyXju5pvLq2DyLVcOZL
         pdMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6X2VWqHvKJxC2qWigQ79tfWkm011w1rtbnHiMVOYJBVZ0pMlP8cfUNjdZXzdXxl8e46XlrcPpOPN2EV0=@vger.kernel.org
X-Gm-Message-State: AFuF++kolCYiU8IouCOt5kXRrgBh8KxLk+QsnHAU1KpNX2TqvNmYVRb6
	/XmEnxUaxqrAREFJsyeMjyrEGlQqbt6+vF1VNpyJ1uIOm/1DHKfU8t40SFLWmfH6NHyujfwgYT3
	hp2Q68eWZPtKL4jVZuV110gv9FyYwsAvDk6QeJmeQcN+cclhlQtboSL7Ooh1wx6uOatc=
X-Gm-Gg: AYBFou2clWaFUQZXWO2rScI78zs1rNdMvoTqBIPBr85rGAr0s2mta225FAgdwnZv0/+
	rbWkYLOQ5Pxfy5wFRA5u8U/FrBoZRl1Zj3op6v2eJ6fvbl/qLK/E1qJUMbAepL5u1BwxzZi7zln
	Och5kPbt2Dr878l+TokvtI9hBLX1mW6DJNSX8HTywKqQlzyhySNuAIvnuPVl6HWKDXdbzAD3w8l
	NrmJ7XEQu62vxx4nEqcjy6mJNY5u1BgNyN90x6nV2XmCK3BfOOSO60uUjKHRKBWm2fIoiFBK8uI
	StELTLMbyGP2nK/qIpm8LmgHmHNeTEjKfRaYYRmIMJSKLluFZzme9JjNTIApEfxknPmB/6N/lAv
	fofL/gemOqI5Cy/t9pFs=
X-Received: by 2002:a17:90a:d64c:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39d9c1b6992mr8112097a91.14.1789144889874;
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
X-Received: by 2002:a17:90a:d64c:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39d9c1b6992mr8112043a91.14.1789144889329;
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:29 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:39 +0530
Subject: [PATCH v6 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=N+lYwej1D65qnYclSX33pShkkVzsQQLo8j1GC8wZPEjr8j9DR3YjeZPGZOWRzB4ku9YCv5jFQ
 EHB9/liJasCCGlRHxlGk7N/8TO5kpIU0BLeUiP6TamfMx5j44U5nAjp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa42f3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: flswlK3BasHnM2OzYbpSKguj6w7A2zdW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX7SQ3aoGyoiPh
 MMrIvP5PpQktfTCnkur++Vayr8yVCzwTJp3hM7NrODP0W+Xz5NoXcKX5HF646jgSrEUs6B3zxI9
 FebNdKWiPck0v7IQu2LVRukRdvEdVvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX54Ett/ulQuOe
 oV1cRTyR5O1D1M3ZmCmPMZbEdqRMkvbAf+z0Lbig/Onxte2aYdWPCb8KszadsC4LGtLN3SBfkGl
 P/Xi3pc472H0tGSc/zRztkix8J8xPs11U5xs8Y636fctrMi6sLxqufRs6AhiUbFcIEjUbLwjxvP
 NNlH/+vaytOtcJWAfO9yRfXEF9+Eo1xkcbhZyFIE0+BU2WLJ7m9ktUVrx2qJzlH6NiEmBncRwES
 n7w8DlNClJF9UEPmIQa+FR2AiL7/HGEXao2nc62vLKFB0Mvrajb3ncKymrQtGKXgDn9ttDv7CVE
 GpcZJ8Ex/gHDnmyijMfoNa7rBUMX1xbDb4o76ZnC+j+I5SKwHy7eFRwc0OFpoew149dwxT3p5Nf
 sbm0qtFaqDt+6So8BSmQFzWyZlvKgMmAEVDRDCwq3T86tGTq2BDge/vWWI0gt9WWYqJvVhWen1g
 0EkL7tpQdEeo4DmmA0w==
X-Proofpoint-ORIG-GUID: flswlK3BasHnM2OzYbpSKguj6w7A2zdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..77de9db8c119 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

