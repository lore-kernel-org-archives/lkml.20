Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D63AAF5C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369296; cv=none; b=gDagPM1Yrz9SywC1VcizFcmcZ7sJ2t/yoBKIFJe5tONbwPr8gOJXSwnUneSlnhFAJh+VrSgZMoFV7iav1lK4qkUdEtqh25YE6oLmC/4IGi56XQptfhfyge6/3/w7sHiJI85ekRnaSZoJ+Nx+UlTD51jNks527luCgmAgKQhwXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369296; c=relaxed/simple;
	bh=pCNTZHsA2UbHJDN64tqrrT0kQDxntC2PXYK1qd+joNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UoNoJFXdewhelFZ50cs4dylh3KGt5pPjFyN8a00a7WQ2n6ac1NdOAqalkc+QBDW7q1YsTXDARiPeecF0utDXHAXK0GnTURpl3/+HbDYvxVy47hjWkE4ltBTdc4dpEqR4IueIb9usHSRx/n6VkLtEn/B6xHS8PondfHbCIOYF/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDmFmYM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIXHKaYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDmFmYM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIXHKaYl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5igSM3901030
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=; b=pDmFmYM3/fep1BmO
	0jCvuxHZ5DcRp0oHG6iOdcfV97Ni1Y7/pRFgp/CosrrpX0CoHUZWSBBvrh6GSyxG
	OaOAkK0yPZqGBmIUxz2iutHfw6iNlXy/hzBBzAB39Vsbg8fkxp3dqeA3QrNQjw30
	jLXeWd5XzmesPWXEwWRLOSgYYiwy2/glYTlmDM+JqYIy3q5gVB03BCqc6bW3v0B8
	O0QgxNdaPWuD6DYl7ComSRWDjx3uZ7vm/OzhUWDqbOkVkW00Tx1el9aeBEqbWeg3
	/jINi71aWynk35u1Cnyw+UddDgiVP6M/Rxy46HWJjzYsqAxDzCjiy/iy5HbG69cj
	1pLkLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so2479973a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369293; x=1789974093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=;
        b=CIXHKaYlmeC5dvgvBUwJkaYPig8gADXeMr1E9IMWs/LftJlm6iqTycPWKjGj+FbLQe
         QIEgsOfK0WEq8dyis1L/IjrGqIQBxSsT7bZeOapEuAeXkCay4lrzbqWxUeKO5/dxLAgP
         AwBcAmZn150G0T75+lGEe7YB/0M5IeurRwxFAhxL5Z7vp2bblgrvyQtGRnBt+76RlOta
         WMJ9rG6xPW/dDdnZPRPnXwQ205ub/U96AOlbHb3y24+aKwfVTmAUk2gzU7O818c0kMU8
         jEkCTcRGmRRW9JQSLjcLTNbejSJc/vG1gdW9EPmS69CPV7N1TNNmUdLX5YJ7ej3SXK4Z
         TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369293; x=1789974093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=;
        b=XMnBzAgw2TXCFvgxWFiSv3xN3w3szLVmg4TejE5KkyaaP8Iseux8h49yhTG3vFSS07
         2KpWx9yTBsmhraL1HcoKPsLp1iHnlAzCi6j2dCOQZcwBo4Pu9iz5acMiroojDoUvN0/S
         nnSBGqb3WFZ4evW2AX2bqggRgi3RNxVkcNiVYI43iR4HQy75KAp9leeOJk8dMw75muue
         DAp6lPpf+Yv71F9Q24eW3CaHGmEsNysKX9l2H+nkLAKYtZnZqcpmFG6rAlBwmO6tsdkM
         eznJ3smjjXAuOJJ+6LyDoWktJ4ZGGKu7v/67oGY7iNh4DjXPqVZutCZxxuLTQYMnMi+u
         vw1A==
X-Forwarded-Encrypted: i=1; AKwUvBwm8QYxMXApnlWp0CI7GHzvbQCF1tMaECm3MpurRClVll94zeh1VqcSFYzEpCCj6szMsQoB1aASoY8JMHM=@vger.kernel.org
X-Gm-Message-State: AFuF++kEQhf58rr2N09FifPVsIhu5y3ZF9d73rFdMTb7WgVSiWbzpnwM
	H+/gwEQakGWzaHR1tLtm+JMRTHO4OF4l1HI6RBr6v5fCUGMVS0MccYtgZkEWJtvRV7nsFESRSbF
	U2/W/fZkc1Xgxp3JC2wAEhsW33qgTMlWLCilVygglqh6gBfWAU4hnv8bNhLMFKuyD410=
X-Gm-Gg: AYBFou3AS1OBqzi4/Nz4AEUbOHAHkz0/skkFVsfzeNxlXXjG8tAkjSGgAy8W4MFJ0gq
	hQoTNT7WFLdVL2Zr7IN0uk+z31AgE8HBK1XpVdrP+IA4GF4lD3RrAMG2nRGw0ndYSTaxZyHskI5
	jAwbY0hQEvsMDi+kp3yPqU+Ruxwv1rrv9OJ2pdsIV5s/Z59jCwOXrGOAUCVCs0OWdGgFWnLRDJx
	vHalGvL6xHBuQHUMyMPMtfFU0NLzqxV/YdIkk1kUacPiDKtRWxN2ft++Mvbbw4uedl4UiWSGhS6
	2+MUSwHSDWfqJ6rxGbUe27929WeOKZLbVf5A9HzwL2wcFkuDo14Go0B/2HTpuDs54ZLSQbO35WI
	/n9Z07CGrZ1+EdONBOkwLu1gnN5kh
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr2763037637.24.1789369293275;
        Mon, 14 Sep 2026 00:01:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr2762933637.24.1789369292660;
        Mon, 14 Sep 2026 00:01:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:32 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:53 +0530
Subject: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=3522;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=pCNTZHsA2UbHJDN64tqrrT0kQDxntC2PXYK1qd+joNs=;
 b=IYwPhp3cBF/fdX9DNYCx1xRWazsb0ihTOjXuohFU3knj++i4eV1W7387n1At8h739H2Pautn+
 eOLe+lc+l2FC+F8r95tCtvpGWsfBfnkUg806mN82pfex7q4UXxlGogq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX208uMY5kpJyy
 Aeo22V9zzZdwpY0y8vqZtR3GtRrY/zwAD9UTNSgCZdtl2d9q/yAb4ycofqY2e4rKKjcGE+++1/2
 22s+/JXCKFt1Ivi/3qHn65unPJgfFd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX7YfFGwlQYXxz
 X5OiKg/HEcoohSxIkcePGYnsFsvB8ce8xsn5DQUH6OLbMjayLfOBZbV/VSFxOTpuw3/ONNl0IC2
 RPzp/tGCrvjKxQVVyGdIJ5LaAYt9ZTRMz0lyjbEYfp/nH3/GIaCyKsXlQizH4gX1AXHRTj2nvK5
 dRnxTRLVeIUBzOHsgwKXnLhY1WjW3cBlsJpWxo33GfU4th/L1CiLV974jyK+4StMT3DiQ2gfigk
 X58j/CCeS9warDIMAf7mGJN1Nx9KQlZNGWLCkhsiv1Wd0u/BRFMDMIqbReuJdJ27kFJUy8xSctr
 zKF0GtZyZKNJR07TswCgriVk0FfpTerNUGLo4ZK3i3w7i2PyRflspGh4w3ZzWDzY4hT35Vr9YFU
 0oUBznbBWEUB3HA+8RTD+9yYGpUZGW6zUo3CWrgwnSF+SJYRVemGWwzV1mrPsReJOBxF8jFH6Hk
 BneWV2Y11CwaIYtZNwA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79bce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UcAHh5uPUnfCHGfL1k4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Rouw6bnWPWrQfQp3qpSqkKO1sM5x7OKt
X-Proofpoint-GUID: Rouw6bnWPWrQfQp3qpSqkKO1sM5x7OKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle states so low power
modes are described consistently and their names are printed in pmdomain
debugfs.

While at it, update the CPU idle state name to match the low power mode
it describes.

Use a big CPU idle state label for the shared CPU idle state, since all
eight CPUs use it.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..09e6138d2990 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -297,9 +297,9 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			gold_rail_cpu_sleep_0: cpu-sleep-0 {
+			big_cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -311,6 +311,7 @@ gold_rail_cpu_sleep_0: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_sleep_gold: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -319,6 +320,7 @@ cluster_sleep_gold: cluster-sleep-0 {
 
 			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "rsc-pc";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
@@ -557,49 +559,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cluster_0_pd: power-domain-cluster0 {

-- 
2.43.0

