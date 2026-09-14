Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE473A5E6F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369341; cv=none; b=qn6RV5A3iyt/dYgI3DOW6xkBtwBXkvadjPTxgbMctzfmfIpYucSlyz/CBWVTOjDOI78nNQSLe5vsEn6v4AN6LuzLA3kjl4DuNWn6CE/oTjKx6s/i9bV9ydCusEm1NNhIkg5lfTi2I4p4ggK+jswLZd2FBEhwKiP/lA9hUAucwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369341; c=relaxed/simple;
	bh=fffm5qSuRczYxuqSfZlE16/9xIRJmsZUoHmzd+STSEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gbz6UE2OCjalGbmB4bmSWiWmMvt5e3SaSp6SPs0NvltaZqb4osf43g5dljuKvwLlS3nHqen9J6hIB7T3XmVqANQ5QluDwk3RcugJBtt0e8Gmn9WgkRfrC2EziM7ZAUWREmPaCiyLXxmGp59427yNkMkTkAfL8yoN7vJAOBpr35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGq6K1CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZM8xJFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGq6K1CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZM8xJFj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iZgb3127224
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtIeMIODu7b15A49BW7IJpxLAPqWFCTU1jmXDoFvoHg=; b=NGq6K1CVwnOD0mG8
	fLecSdn/OVeY4LH4HG9JLC24QLiRbHa+L0KoJEGKqKrPZSGpHyT2zhMPo3agMGX3
	n5SPO0p0ELTn2NmUeyh1YN09IEySJSy8FlGDoZBu/oEsa6frCStBhy1qm8B79paV
	ywEnyyGv40u4J9jQVaH+FY6U5JmezZa+w8vEq3D5qcCF6bt8ShYvB5kQCQw/zoTt
	ZbDGsoeV0ZixRvYNkZMZiakV7ZBBLsOUTLzJDDTr9r4Ykq+0yEmDmEP1mmdIBdCB
	IQTGsrw+CFdflhJVZJn3RuwWu0VJRbK7uQgtIWiQgVEyD/e8ryokcugMY9udLOCM
	F4JDjQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n9j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:19 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1b7981b4eso1695659eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369339; x=1789974139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtIeMIODu7b15A49BW7IJpxLAPqWFCTU1jmXDoFvoHg=;
        b=OZM8xJFjRKbjzx6/I5cxFBnu4ExKueqTYXMWrizxL5CKWjZIwvQEpa39Cqa2kHWNVu
         SlETWJNZeptsLB/1ISwJ/vmrs7/qkME9c+bTqTEkVWvLWvn1H6PP82RiL5b5FECB2+KN
         BiIDfMreUNI2vNEUU1G3pp7XCtpA3PRAtmHY85UJc706Dz4ROG1vrUm87c/QwPlOufWW
         /vbDBw1MjITbXUppBhqGQjNwy6H0ltHHNueY0c/GCrfkYtAFcyD4bIYjwVlmsPkJNSg9
         nOkwgtBJ1rSGJXUyJmrnjBpFgRE18e/0NG8JwIu3uOFsGKmSxUWAEY6tPgzEHpdBr0Eq
         Ib5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369339; x=1789974139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtIeMIODu7b15A49BW7IJpxLAPqWFCTU1jmXDoFvoHg=;
        b=DT89KZix2Zd0+w7pi3jLwFouTsPNXR5sQ6WFoYGOaOZ4jHWRCeU+p9zWLwpeoyoigT
         hzmAUSw2XpGcuWAUDooKNOPxc9ouWJjgK1CddwhSfvox7V/E1H6NPnGQKY5IovRJepny
         zDbkawDi9dyO19EQ35mG08fE3I2kpSsdIqMkvhavP1y0tAILZZdZtdSGEVAhgt3nY8vt
         I9ZUyOC8HbTnMUN5LW/hbHPwA/JAzfj2LXdj0btt3XrgHxX4lihyk55zSAwCQ3L0DgKM
         ZlpapqUMr7nGtQ455Q+IStcfv5dJkX191309SVpGUGOwe/02Xof8Sescy8KRc+F1MS/B
         zV+A==
X-Forwarded-Encrypted: i=1; AKwUvBzyNOUZWU7JrlJjzzlMOUdbmrBGp7oQGs4RvMW95n9PszWNJAt/oTX8cnkd5XOOnJoUcKvMcMoEDMsVRt8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2t8nUHHrkG7bQv5fv9VnqPrhjub2pELRgPL1JsjKi53sgWz5G
	iP0XtQeWrZFsb1Y4qmuaEGs4rCoP0Cv11hWnzzKH/zZA+aeq5HZ1ub4ODwst1G/dgW9XMw51fkX
	eYDvBANeyVhRhhquAemHNSVWPxbLlHrIDrebAPSZfWD7ytX+5NPai9p+NMNJLOJEgbxQ=
X-Gm-Gg: AYBFou0tzAnZJx/RVfVnzpHhvPB5wHaulN3mi6iLqRo4n8QpJ2U+7DiDlYVeAx5sVBm
	vu7ue2ZRAOLHnno4j4VGnIHg4oCnvi6IOi85g9nTMeGr9kKmzmWg4dGm1Mi38vCP+RYiOKW+nyG
	o7JTT+icbf3MMco5NI1zEQTH1BnSPMazed/6n+JeZ1fmHhIwZixLks3vXCD6tI9E5q5g2UFlm/l
	TYDayaSa+JciQWA7bizh/Mxi5FFAEjyB7Kj3boFMRKwQhtRdO/A0nxhgz6gx+7C6phV2svNEL49
	mU4ke9DPx1yZcB9GaIk80Y0p6VS24uyMyifkYyUUYbzZRileCn/sT/Q7lklplQrXF+547sPPxp6
	mTpjktAV+AJMfZVU4vT9q3NW7h22X
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr530146eaf.62.1789369338854;
        Mon, 14 Sep 2026 00:02:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr530109eaf.62.1789369338470;
        Mon, 14 Sep 2026 00:02:18 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:17 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:30:02 +0530
Subject: [PATCH 30/31] arm64: dts: qcom: sc7180: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2864;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=fffm5qSuRczYxuqSfZlE16/9xIRJmsZUoHmzd+STSEs=;
 b=3tXM9BCMFP+hET5aAOTeYzRzYnJP0SkfdRlmSgjXialNTVc6NXilZGTsnhSXG7ezCTstPd8Wp
 iut4RSEuenZAZ5I6SFtu9JT4nFeoRdUaL8B9ZtsP/iE4DefvF1K2EMb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa79bfb cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0yPQNT4KnqSH
 sdptdGUOCX0uzknYc8A5/qaqL0PwNOdi1rku+InxA/3U1WnewjKlBCX0txGpWKBi7DtEx4pwzzi
 J86UgqvhbUc8R/td+KwFB5o33/+8wdk=
X-Proofpoint-GUID: hSKZROyGtmaRRppTAMfP1cPtOb3azXoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9Q4iGe4SXjUS
 KbEUAombTADrjtc/i+Nrw2IIBJmE7foJUW+s3/OjhIw0tO1qLd3JVEZdobU1eqktYuH3PwCvJJz
 ricThqk8iX1pm/SZkvQ1Kp1gABR7WCw2w4MSVI1FjmmVkVO+ERnhf2l7uiPySCbVs+BN4ISAu6w
 3rne2Iwd9l18hUUq0d1/h/O3SxbDNkVTBpLrBFkkYQNk4WWMTu0RRLs1Sq6m2FCl7kgh/+j7yG9
 oim9xzg2alKU//KBPpnPjttsl2pPjyZHl+Ie2sfdoXOYju2mEdhZPtPunCkBF0UgWFhyK4ObyRw
 p1YYbgjH+z9h5s92GG9oUDg6jk58FYHsJxsAfOSFiN6yQ1tOCkNLX0hYqT9SciF+uZXzssUL066
 VI+wjJGa6rbq7qP8Y+L7aY2tI2yIjmkYoXsYkmDYI8annyj81wF4X7JB6s4x6Z0RE2n1oFCzHC7
 ohYEVZQg6qfnRsxw6kQ==
X-Proofpoint-ORIG-GUID: hSKZROyGtmaRRppTAMfP1cPtOb3azXoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 70fbfb31d4a4..51bab1711e4e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -316,7 +316,7 @@ idle_states: idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-power-down";
+				idle-state-name = "silver-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <549>;
 				exit-latency-us = <901>;
@@ -326,7 +326,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-down";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -336,7 +336,7 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-power-down";
+				idle-state-name = "gold-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <523>;
 				exit-latency-us = <1244>;
@@ -346,7 +346,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-down";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <526>;
 				exit-latency-us = <1854>;
@@ -358,6 +358,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 		domain_idle_states: domain-idle-states {
 			cluster_sleep_pc: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -366,6 +367,7 @@ cluster_sleep_pc: cluster-sleep-0 {
 
 			cluster_sleep_cx_ret: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001244>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <4562>;
@@ -374,6 +376,7 @@ cluster_sleep_cx_ret: cluster-sleep-1 {
 
 			cluster_aoss_sleep: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

