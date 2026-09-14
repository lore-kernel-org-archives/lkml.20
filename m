Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847D4266A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380761; cv=none; b=L73fhlOr+PgR1Ggam5TQ8PESisc8tv/DqL+SrGQsUbHn6i3kxmmQ8du+WrCIU1wlnr4442nYA3BQ57t0t/5jELfG7MEyEVHm6ZYmDaF2XtB+TNM3IpRoKMek6CNRpUFp8crezM3FJmkjvEVInw9t2eTPS/dQOYWzsf+BD0AA/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380761; c=relaxed/simple;
	bh=c+bDrUjR7XrNZ3W/kXnSRtL90dVSEWiEQOH1Fd0Ys6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+rGFVT3QcLYmLIlZJ/dT3/ATs8DQJ7UoXACkMBBpIoM9wsoZWwv8TRXzJ4V7JN0dsAoZEfvjgP6wDvY+PxQHDvEFsc3Pd35pF5ZM58KaFV2gV2/1ErT9+1DENxfel637mK/bCMgjz8LM6i9eV6x3nNbV6UkuWLWLQzOl8wlWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLnBEhwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awrl48FG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLnBEhwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awrl48FG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQV9773129
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LHey87IrhGZ
	jBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=; b=WLnBEhwSof77oAM5WpmV5o5ixJR
	zQpYcVwFHQs0P/wGYRXo7cUHmee9vJ73d2t022G4qEL00QT4H77ZLhsM/tiDN8Cb
	jQaUX2f4OR4Ck40Nb5HjE5cHCcCFvA1uaaAqzdH6MVYxt0DpMs3i/XRCp0rnRybY
	nx9pWHV7F7Qu7hWBIeEp4yxaW8/HIr6xZqqOQcTuR9AK/LAFCACIh61khvqFS4GB
	wOY9Yw4pUA418ciopp5zEd+UrgPuvYeHfXca9IO9LSRrngNj7yB+TazRPQ+4XcKN
	qou5zgEPOPQZOZzlrcZXYThf4Nn/dQ7lbS1ow2UbagERbigqkMarN218Eug==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrb4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:38 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b59d85dcso5710059a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380758; x=1789985558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=awrl48FGnckMgBL5FCQ0s7yNJ2r1O7Cz5MDnOQPxMJf4QU0MC5MmwAVydfQ83prw1z
         BkdFn5zIRnPFl6oOF6BCmxLlVzgvULgU31L3hjSwJ09I7tbSwBJ5uKxRuSWYQVXzDTLl
         AZNBnNpxFiZqsuFUrGvFBihtX/b2zB04lB8o2lP4cWEm7crd5wZmaxWsBFIel985C9+g
         s9js1el3fESqVRKACYRVdaYYehm0AtLWx3XVXb+EdbSm3mbRcb0jON1LhjctrWbzh2vi
         nUIGTBNZbJOq0wVwmluumFy9XeGhjeyPJ+ZGQ5ppkiYEMYpaYfDb0LYUrr0fdFRn6oaE
         ht4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380758; x=1789985558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=bAw65mM89nUra30SuIDaRHuzuifC2lDXc8akPQeCHMu3kNknHUSSLTRSmiIJfKeeNn
         cHWg2YVdKMxfMzJBzMUtd7IBplYkdaW5CDldnEwzCHAGL/PoD4F8kd92JQQK0qQ4qTMI
         2QMBhCBw3hEo60s0wA4DjWxvVk4cV+IEHq8QYnoreX+oAvyENKmnmUsgudAFJGlY6Szb
         OSd31yA7bLkyOO8CHH+8O++ygQFnITLvggi9cfHqEtyXGTGxxjEwoBIn9DT3+r6jddGE
         GmXGOfL3uWm4wMR75urh4UM2f5nSnmq67fYtS3y+i8FbWzlLYbV88ZRT7ntkSxZZRIzW
         XscA==
X-Forwarded-Encrypted: i=1; AKwUvBzoHfZxohLtNWUDAqCkILaYl25kIE011RKg5ktHVGewBdxAQKienGgAS5kSuJo5Jj8JwAE6ZNCYUgD6+AE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPkmk7BfBlJo4SKfRDzuXxP1IWZQCg3Ei3ZkNwYkw9nGC3dZM8
	2u2flSbHQR0sBq49ivVbLQ9XqKTKK2Xu3GqhqSPFAqoqmIqM/OBY6GRqoilUqLOgfreEjWG/fPr
	lWnZJAgkxytY0SiqHIrH87ammB4WJSj4/+kVlCPAOmX3X/xXLOC40LuwyZiU5Sb/L768=
X-Gm-Gg: AYBFou3C08lV5qnfTfkqStBSBx16zPfo+vZvq0yqOPnNYAAxTBS3NgN3uEwe3++QjkI
	UzLibFae4ffC7yDKL/PEPlVZGkn6YvmVh4k4wq39JySQR1MEj3psjGPMECpDxjP8d+HrWXJBxLa
	vX6SLIfug60Ds4deiJ4CK5URd7k5bLzsgjryyXqoyG6qJ/ZufneTfAUrdFufDQUcCRexlCzeORb
	tBv8lwGBi1/U0ruQ/OF95APzw2ZuYcLewAVu1kYNUkyBgwLHvLKrTqkhtcHE/Zxz29q7zMmfyfS
	KbNja12Vc4V27p7v1eBpXn04k/1E9xk9RF/1TOrdNDwCn8J+NFwRy9ahrqZAPDwYUgzhwrUlfrM
	KE2WANtPS7ledEN5g3Hgvp1pzYkP0XJkXuyYkar6L5loSUw==
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908379eaf.29.1789380757938;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908359eaf.29.1789380757533;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:36 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 retimers
Date: Mon, 14 Sep 2026 03:12:28 -0700
Message-ID: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oPpkVSLpGN05Dyji8Jkc1bZCRR4iE7ah
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXzaYL9SrLazjl
 QIKN9RM9aijMa8KidqCm7W3mkpUOCEUDOd4iARQ37WwVkJPTFGo+3x3gxXnXl2uECv7uqj3PCtC
 RsMFV1bOkniGSfweM4/Aa2RjPEqcQLU=
X-Proofpoint-GUID: oPpkVSLpGN05Dyji8Jkc1bZCRR4iE7ah
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7c896 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dZtJYaTC1RL3iSm7oLcA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXwKBgZco8r+h7
 Q5ci7BH1DlkxBnQSXo+enEQSiYa2OzcThQf4O7lF0Tz/2Wf5foEyuQXODo4uVmPagJijIuX0xd2
 UumQNPqm3v8pUOYobzXIJ+KPK4st3GUngpnC8gQKi4OuG5oG+LNNBH01E7xw8Y1GB5wXswhSmdC
 iRhWTHMRmsZNLIxFr7eiUN2szelfs8HApsGNZP04CZOwgn8EXp7F2oKR4ZaPUqQbUywaRmHHWnY
 nz4rGQtdpFDSUz1p37uchnD8s4NT5gROfGwwj6O57AskRnOrxuRr5ieZe1PwlrQR0rglpxwiv+v
 NLHXummGi/+TrjNw2oN0Fx8GJtv1ihZniglxg+AzIyD/GKiyLDac0YHcWtxpHEJAhHXm4/n3TZQ
 R2jvH/SPrBbYiolC7b73ffmGoUKcCYXswkxxk8Z9lKVwehgscRchv+ovO3+dSAgomSuLG9+nghY
 miMX49FMv1CFnralWIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140145

On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
wired to the retimer's XI/XO pins. The reference clock does not come
from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
are wrong: they keep those RF clocks enabled for nothing and describe a
connection that does not exist on the board.

Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
as the retimer is actively used.

Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
v3: New patch.
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..4380a46b33b2 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -60,6 +60,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_rtmr0_xo: clock-rtmr0-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr1_xo: clock-rtmr1-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr2_xo: clock-rtmr2-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	connector3 {
 		compatible = "usb-a-connector";
 		label = "USB-3-Type-A";
@@ -295,7 +315,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -639,7 +658,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x08>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clocks = <&clk_rtmr2_xo>;
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -696,7 +715,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr0_xo>;
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -801,7 +820,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr1_xo>;
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
-- 
2.43.0

