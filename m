Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F038837C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938072; cv=none; b=NEipiRCu0SufvotcaJ572v7pUodJUlF7vtrUEVPN+DlKY+Q3tp4EhWqt/5TD/bruKbQHV3w7DOgn+hJN4jmW9UC9KsBJ9nImMrMMhx2mscxLjrICa9x4KDYyUL32Z+VloXSI2VIylfJISuQpCDwwmWLbdfRsylqUAy/xGvRXpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938072; c=relaxed/simple;
	bh=hO4a+7Zvdj8XTlKgTW46Rri53omEFki2P6BPSZBNnTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXqyBKAQvN5YhxT3kISFnQyViTZJUFdzdnorKx9+nKamjhch4BhCCoTxET6nxGw9PNLB2HjldqXidh581fwzb7vrxWg1w89RNMt+8/MfwEXJtj2R7M6f0v1u0a6VJagkt1og9w9JHcy98bMg2X6+pZVGuwZVNCxucCM8NBF3gLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLcMsogE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xkgoszr0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLcMsogE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xkgoszr0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZTL1190352
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X80dge3YPwdhyr08OpURaEYH+EmouwHvEjY9VNrf9Q4=; b=TLcMsogEsYyr3kF8
	QMxMVQ8woqb/qwbrVMi83HTbo2gHzIEWvBbBfRu1xFv4IyZmMJEzgLbvlSOEhecr
	/ws8BtT/1a8OCR+BQbc9K8PwG9cEc63ERrmTB931Io9MomcN8WpwO4CqwyhdKd31
	V2GShLfmwes4S5DI7I0w1hfcmXP0Hc5GvlYRZHdSCC+McMceelK22OWGC0DOoWt0
	Hrxm0rKWHIbDh/FK1zbUMEEwBzGmcPyEsYBVj4DcXogLgtTK5IvZHI0jtix/8Y3V
	u18nUgrOj7XtrXZLGvg0ei8Cpe8m6ASEJWrQ9v0ZvTuaV4m1A9FnjIJkBhcWXtgY
	mqI8Ow==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjpwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:47:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14fc5852326so436850c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938066; x=1791542866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X80dge3YPwdhyr08OpURaEYH+EmouwHvEjY9VNrf9Q4=;
        b=Xkgoszr0Rd5tEFfeod6jZ+M0P7o5XvOqvejzTrnnumfea4C9x4ZhDyPEdVfdZQnKuH
         lsXjxqKmCPP0N9OPv+3ZJinW2QBakHwUjGiqmUgNhDezn2Q4m1/KL62u6obLCwT1sRJ9
         oQ+OhuXnzLk1NQ6NfNzsIoJ38lh8sPSLZAIBmMIiZR9vg/2HnDdOvlVG18lGj305cCxq
         toUdvFCcJqaNcfXgvMaRKwxETk8ur7ghOejB4L5sylxVwdOd+nAFLELeKdSO4mk94cTo
         BoLI90MQCZPM9XbfcCmgdGphsWP5njECvdE0/SjKtUdWGHNV4DRDbZSXtqRrjIfyVSjI
         NTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938066; x=1791542866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X80dge3YPwdhyr08OpURaEYH+EmouwHvEjY9VNrf9Q4=;
        b=FISSxQh5sDviKz+PxbaeEwCXXYYhajbNEkKdNu5GSs4M9s9aV26LgbE8rxhPOgSkzg
         6rY4JkzaGAZ2qjUcP0bNi3ZmqJI1vimKE5fTNma9FO8eXcRaok+RXRnVP/D4e4TXnvQ2
         MzWNytJjeUyq13bO+R81TNly/K+f75WzlykXKtmtN3vDuHSgevetgr8av/KIkT9AXOoX
         aXNxVxU16zqcsjoHf2CqKftS4xQtIR75gOy/75tWxIqcF4par3MvSWFIYrQxAC7YjSdO
         gElocG18N5IlFyLn0OVOOTlG6Uf9ZnLz0LGrfHNsJWdHMbAKkBlM+agj2DkbgqaMS/F7
         30kw==
X-Forwarded-Encrypted: i=1; AKwUvByBo/RB9jSDmPNxzokzCX+tK93n2iYZgdxHu3z9fOpcbVeTaEvTxvKysxtNcRBIQK0eXZzKWVSUT5gqcPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nmpRe4w2xWLxi3SAphZ3Rp1gGXhviJ7Q2xqikrAIxCBKwZfaMr
	2GwBHiDSkDMH5xZSZh3MMkN+afo4otse11t+9U1KrWwNMFuWz5hGBjKiA1eBEReBPezZ/66wAxv
	EJixjwt2WInSOLfIlWRBSVaxfdeArVHb2W1YPN+JTrR3vZIQfDdFfmI1SM/Iooibzboc=
X-Gm-Gg: AYBFou3/Ve7HfWKrUFiRLi6di6XIy+5Ec6QfrES6WCIa2HUGp9+JmptbjzpocySv0ul
	5WLzthQ5lsJPC0LNAzVt9hF9ZdCGqt/FWjftzDmwnjbkgTs4U23GbHEJ2T8WZcMnOr/VYYPjaVx
	bVG8p1iMMy3U1PoNLDWEx+nygWIJbjZbHKObg4aqB6dSNowLfOs3wISjX2u3LP9BiK5IBxZyPa+
	hPYzC2BDd5Cx1gmqb5BIlpzhWtkYsG5aOSPUK3YTl6h0J5pFjx1C0qVabKtt717yp0i9aAhjte7
	xupx/NZrG51kCOPToYvoMKWJJcvlm4Y03z1LMxXFtNVanykWtTs7FoIgKN4jc8c5OIFuTbR4PcU
	qCXUk3zOzgGBIHJmeVGqvhA/5d7w7
X-Received: by 2002:a05:7022:f90a:b0:143:33de:978f with SMTP id a92af1059eb24-14f5d5b569emr2136080c88.43.1790938066268;
        Fri, 02 Oct 2026 03:47:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f90a:b0:143:33de:978f with SMTP id a92af1059eb24-14f5d5b569emr2136041c88.43.1790938065480;
        Fri, 02 Oct 2026 03:47:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 16:17:00 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=6011;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=a6O1KIPOWA4+uJZpjWzOTBPzZdII1cPV5WSWpRYZeGA=;
 b=Xg9Vec9RxuFvMmQmDajHyuKWJVuqSXQ+8kNYhVM9X+xDYAvo3PoK3tiKi7zzMyUEULw8nNOZG
 o4T2BQxRXCzCNpN3zQwcyHERf+6ziW6GXRSswQ4lgyiy7B96IRtn5J6
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: szwQjnFaA1yRXj06hjqhFNc7P7SEOTrU
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf8bd3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX1PzQRqWjXBQw
 9f0DV9/knQJJQHpgHenpa5IxjEGNWzsNg2vwCyZ7wgSnWn7FmAST3+imzGzEcwxzgAa5ej1bQ9c
 ZqM569OtI936dXCgJDul9hZJ9be0Qy2i//xzCb3YRGa7Nn0jxM3dOjAquKdNRGSC7pQSFGIhts9
 vwQMn67J1V0tyLB8pd3BFgqsaMjGGAj1wl2twB8q9R73AOMs4Bp7qJcoepZK10yjUzdPJXYpyEJ
 EVTfhW9lnmPcQime2tidrxgfQet2LAuh23LLS7peaerM5KwJ0GETea58JVxPwzmy4NPcs8uLORD
 Fkg96AMWn4RKQRFaRgvCWO1C/VI+/0c4J38tqw0VCZSjDN2miKbYLNvHQjurrF5R8xot58+RWhd
 j5nvLoiPdNdhrMxsh2DU0x+qRE8T/wm5NnKmfbzg+1IPhmjFRpWffowBGPKjI+v5WCueuth4MIP
 AfusKLVfSwG5u8yt5bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX5ln54RkAf/TV
 Cv5L5sWJ8f2s6C7JsnSLoWGI4XXHhnHN0tWK0w6Fqun9Z6tbM5kPQf3+Pg06Xpes3fRBss4urCg
 j3XCdeGlkB1NQ2VdWVvAENpHUt6SIIs=
X-Proofpoint-ORIG-GUID: szwQjnFaA1yRXj06hjqhFNc7P7SEOTrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..f3bb9cd8f393 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5782,6 +5792,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5793,6 +5805,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7136,7 +7150,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7179,7 +7194,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7222,7 +7238,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7265,7 +7282,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7308,7 +7326,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7351,7 +7370,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7394,7 +7414,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7437,7 +7458,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7480,7 +7502,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7523,7 +7546,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7566,7 +7590,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7609,7 +7634,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7724,7 +7750,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7751,7 +7778,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

