Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90503AC0EE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369257; cv=none; b=DxcGiHEAps++wnrHXG1x7Y4xcvFr4zjgOqNJYic6A7cuMJVQ89nECBaxCXtB4+rJnLD74UUVY2T1Kxgzfm0SIym6Xyxa4LhSDIvH+4sEhDY9TFUdD3b3LdnmUWwQOxgv1Gr8zMY8PTle+Wzb3plgVm/4O4XpoLXF+t+Ww47Kxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369257; c=relaxed/simple;
	bh=Uhg7QBSQbvD44+p0S3NRVbFG/tRqsU/CB7ENIh6EpJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdLKFzjak3PSSG7EzIIaqC04H1qq6VsDGXNWluo71hOUyE93XbTIJibrqSuibpPindnLviihmonJnSqYKUpVWa8ywiVqQVhBvZQ8x4pBJ4jbD8ommj6r4nW+aWbcIbs1mTlmwbW0fTJxhcl0hQ60SDjZOWuDeP0L6DC09JrZA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJeGPS1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IdmakyEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJeGPS1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IdmakyEz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifhM3368748
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CT8OTJUQ/M+5ELmkBi9dedZ262FQb5QlVFZgG8WZTzA=; b=AJeGPS1cIP2T7G6A
	xvvhwAJoIEiVUVxymHUT9Weg7uZQartj+K7hAkmcl2YKWdZ+6rrVrYzcJKES1IQE
	ppN3ipvxUahTQg+RXSgyMsEqgDZ90Fz30xiNDoEpBYRpyLcDp4K6SKUxbWuJniSP
	SodMwf6s0IKTopNJnDeWk42elmUwSSnYEvYbhwkJztSUB45ruSDL5IAnuzKXcQSw
	UXrK1U4Ac1cnjbaYor3LuDiws86bph75jCeYqFIS7m0y8jKc8XyzmHSdbzjuFvfW
	wJTXRQC56Euz46ZqzoCj4mOG6p+TX3P/jLQ2dG8+r7Pkgdi1MHgVlV/5vEEKTy4d
	1yqWOQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5ebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6961289a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369252; x=1789974052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CT8OTJUQ/M+5ELmkBi9dedZ262FQb5QlVFZgG8WZTzA=;
        b=IdmakyEzCQYwwqGtnEay1Yn6GlLKCzpc+RqYECV14j2E4LydG9XOxdoGVqwgGkVmuM
         Z7Nj2B6kFGn5p3GqHvodeB7ju3f+VihRtuEPlBu6Ym9V8129njG0RzXOLj6qYv8lQqfZ
         14A/TvRxVycX2o3tQBIsopcpUVwryu7Q3rbKqZ5LygWUu4ZinHCZI5eTeS1c6eLoCWZr
         GpqLWwHgOm74MhVkUwElpDb8HTNI/hB+TLRlys/7WD71EloLzR5bRvM5ER44D3HNpT0R
         lOkWON+fHwOVuUYn0CcS2AuTsaLQ7OAech0rQXOoRw01p+2GOyo6wsALBTsZUg+wsR9h
         WfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369252; x=1789974052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT8OTJUQ/M+5ELmkBi9dedZ262FQb5QlVFZgG8WZTzA=;
        b=Y/YqIfOoI3C3aIw4r50BNx0eqL1K9FFtkfUq9iXUcHb6ZTsDiCk4R9lQc0xneAZeTV
         LUuMt8fvR1IDaGxkkYWyBIJF42f5flBfm5Te3mtPheA4JaIUwou2NAjOQbM1cqRbih/m
         WqTl4jvLkormZVLR34orVlIUqf9eD+lVALGgWqdKkIGTJM/cjSpdGnGMum3/hR9PvUcy
         sGP4S9lg2FSXfgUDEYKtlHd+Y37EnFhyxeNw6m2vm+ZUDvzT2KhB77QetxYSBDe929lJ
         CFlCu6xinmRMiaYp7NzPLquCdvmmNUJYAUeJA1pmh2qMUxFgzlTT4kV5zHANBVo2ZmME
         7JCA==
X-Forwarded-Encrypted: i=1; AKwUvBwLKlL8S1g5mPVRWs9nPnK39av4K171YvBKSKJ1snnGKRaxoierXKzjIXZKfoAAQx4EMR9imwGAAsEyVY0=@vger.kernel.org
X-Gm-Message-State: AFuF++lsxXJKBkd5EWDIRko7bkL7bOwVv0lCbr5Z+YG7/dz0UYaAVfYe
	82S4qAgJ+tlTzMW1FRH6WMeMXN5tHjTBPLgEttkcxsNsIYGZ6XBPPOQF9ckGAzqylS6VNW3qbHg
	SvB8kuAB5Y7LN2fC3INVf27ajTsJhSFklJ4PDUeqvNUJtK9XZTz5ZxvdPwVsJbO56TxY=
X-Gm-Gg: AYBFou1ZU3PwqBiDIWv8DiivIksvGHb0GNMM7J9NsWpv7CadGCOEFLT5ejHYoWsEe9k
	MjbtN4UR62XDXnEFDV75TZ59yBN+mc+9ak3f+PBDU650bu59tqNokWjIldKUlgusKVWhjjcdD+j
	Gx/oYUuJTwiIwxdwActSfGUtVvd6TVmXZAZLrLaYVj2ivcgAj4WbfFZidCii+gf4yvomWSJ8Sdu
	Pm7g4vc5xQzAZLRht1XBTy2IJqzW7mzxkhLXJMELnYsCmhN1KcRWrqWSxz1bqIBNIQpD/8keLCs
	+GFVYu71aD27TCcV3l6U6D2/O/6Zz9noAqLF+8r9xva7m5bCZC6YnQV3gSC47QYb2NtrloDxxot
	zaWJ+6D4G0QaT/KKoSzOBVrLE273r
X-Received: by 2002:a05:6a20:1455:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3db4004d8b5mr3028827637.0.1789369252127;
        Mon, 14 Sep 2026 00:00:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1455:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3db4004d8b5mr3028757637.0.1789369251712;
        Mon, 14 Sep 2026 00:00:51 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:50 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:45 +0530
Subject: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2782;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Uhg7QBSQbvD44+p0S3NRVbFG/tRqsU/CB7ENIh6EpJw=;
 b=aIeUTmlgyVAt25J1gL2yj2P+IheqoXbYrmCOg84f6QnCZhXoKYeWKNndvhrZaz2RLOwA/PLdn
 ahIY2QcMtUQANK7mGpPEUDP8W0O05LyrmU1zA3636X6OSjJKbPgZd2X
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79ba4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX19XLeprrL3Nw
 6iLg2t+3UAZ0GlqNfWGm5c/gB68LFcIWPb2urVz9j+FrvU8HYSnMimStmeC1Qe9yLCpOSSI068x
 2e/DSxnhsKMGH/ozPras34KjYExYhCv9YRn5dgCrWDgCROZSOjEMZkzVSVqb0CHAIz5J1jVSIl1
 4LJkZCIHBzrw485VxbmzuJF9X07iEaXShMs5fmmd6kYlzEgf5evoNhP4X1SVb5vaGFeXHGO4cUn
 VwobgcbIqctYD+8+xJqiL49LqLx7iz3kxCqe5FU+spwiTd+4DjPfmQVWMHgQIn/CYZVNEm2U+I5
 dHVheULYgAjBDs6BWeUhs3wLQnpX+ER0mN6zyTnljpF5OUcYTWzWQp8OQJzM8WeMZoMHGHFvhwG
 Fyfzqj1IunBsQ2u/QG1OMqXwjtrmv24QGy6toG6Ty97o118y2tHApyuDNk6J5lHwrbdXwVkWK+9
 ZIq43SbL9mXzT7DWrvA==
X-Proofpoint-ORIG-GUID: rtZwgd9XMtDfL-1LH_M-RpNVglfH73pv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX90S3R+RLMLyB
 cqCK7ttcnUH+bBD+R5OVscymoLvIsttzl5pinfB+2gCKhrN+V3rDOnUaBWWxNJnrDpaxWAhL8Ii
 d4fQGs7F6B7Dc8LSHjFTLWACJRU1Hog=
X-Proofpoint-GUID: rtZwgd9XMtDfL-1LH_M-RpNVglfH73pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..a3c514fd2c81 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -398,7 +398,7 @@ idle-states {
 
 		little_cpu_sleep_0: cpu-sleep-0-0 {
 			compatible = "arm,idle-state";
-			idle-state-name = "silver-power-collapse";
+			idle-state-name = "silver-pc";
 			arm,psci-suspend-param = <0x40000003>;
 			entry-latency-us = <549>;
 			exit-latency-us = <901>;
@@ -408,7 +408,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 		little_cpu_sleep_1: cpu-sleep-0-1 {
 			compatible = "arm,idle-state";
-			idle-state-name = "silver-rail-power-collapse";
+			idle-state-name = "silver-pll-pc";
 			arm,psci-suspend-param = <0x40000004>;
 			entry-latency-us = <702>;
 			exit-latency-us = <915>;
@@ -418,7 +418,7 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 
 		big_cpu_sleep_0: cpu-sleep-1-0 {
 			compatible = "arm,idle-state";
-			idle-state-name = "gold-power-collapse";
+			idle-state-name = "gold-pc";
 			arm,psci-suspend-param = <0x40000003>;
 			entry-latency-us = <523>;
 			exit-latency-us = <1244>;
@@ -428,7 +428,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 		big_cpu_sleep_1: cpu-sleep-1-1 {
 			compatible = "arm,idle-state";
-			idle-state-name = "gold-rail-power-collapse";
+			idle-state-name = "gold-pll-rail-pc";
 			arm,psci-suspend-param = <0x40000004>;
 			entry-latency-us = <526>;
 			exit-latency-us = <1854>;
@@ -440,6 +440,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 	domain-idle-states {
 		cluster_sleep_0: cluster-sleep-0 {
 			compatible = "domain-idle-state";
+			idle-state-name = "l3-pc";
 			arm,psci-suspend-param = <0x41000044>;
 			entry-latency-us = <2752>;
 			exit-latency-us = <3048>;
@@ -448,6 +449,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 		cluster_sleep_1: cluster-sleep-1 {
 			compatible = "domain-idle-state";
+			idle-state-name = "cx-ret";
 			arm,psci-suspend-param = <0x41001344>;
 			entry-latency-us = <3263>;
 			exit-latency-us = <4562>;
@@ -456,6 +458,7 @@ cluster_sleep_1: cluster-sleep-1 {
 
 		cluster_sleep_2: cluster-sleep-2 {
 			compatible = "domain-idle-state";
+			idle-state-name = "llcc-off";
 			arm,psci-suspend-param = <0x4100b344>;
 			entry-latency-us = <3638>;
 			exit-latency-us = <6562>;

-- 
2.43.0

