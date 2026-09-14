Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B993EC829
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369336; cv=none; b=pY4vz2U1tDKHc/bd8KUehXU1ZgctsMdX2TVOkyoAX4rrvdWqnfd4KzKHjY7eZuNynYDPjwuWeiAd8AtbfsmdILC12c3fD6nBMT6OavmnN1NRGb4ND0o+wJcPcfh+cYxdbLDsfAGhqcB3wWzhs9XOvOCE8YN+CRJ8/xPaC3GzbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369336; c=relaxed/simple;
	bh=G5cXeBcnXSGfOAgl/JoaK0vBM74cUlRJ8lMbVI8w55Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh8zuFm99rLo6XpGckf+PtyDkW025ejB/JbMPvgw4Eho5fX0PNXnRR2jyr+xcrXY/O5nBwvCD4486l2nrDKuPlfEN7YmAi+Y3m1ps9BEKfJPNPtWTsBe8yinT6k7iEZN3GBpdIKkg9kbew+iWxhzwRmVmlift6aaMARkBGp5mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPzBV/9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+bNkC4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPzBV/9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+bNkC4T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jaYT544305
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lncf4QEHE4r5d+dE+8CqrBnMeQeEdhzTUJxWHbfrp7U=; b=WPzBV/9cNI11aVI/
	v7j9vAMe0trTYq9vWQEAdJMz1CtUU6VQcW0jWQ1nC1D1Fq26R9mMUYuwvgXWY+5D
	uy0liYP0nWGpMfC+bxutA4D5CpVHEqHxYuxP7o2I80vSxXAZlnOEB24S5Ox2zWp0
	MNAJ67yXsBaEf3MIqZRwqEEtFKlKxd163F1Guv9LMnQ2NhjM01OPMWIaDF0EEU7m
	h1a668yYXdbMSLcgNVg1vAASGSLUe54AIWSsg37YltUWQLt2ozMS5Svm2e1Yk2R4
	1oAwc+jbHZKc3zNbDyxlzMsVnXNdiDGyUVWH1Pz2HEKTuoC91r6ZmLBLHKUD8aGH
	oJh0qw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k098vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso2656591eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369334; x=1789974134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lncf4QEHE4r5d+dE+8CqrBnMeQeEdhzTUJxWHbfrp7U=;
        b=X+bNkC4TasVJicolH6ssOio7WScMxAsH+Z6zSw4dSHc5Qu7gXtOtpWcHTUuf2DKPZ2
         oRuT4F6sBnuLNyLhWTlxvI0XIa3ycn7y3H14BaCo0Dw3Y9GkiWT9oin3S40LVulWlnO1
         fYZdksan2gmb7SUiHg3SsqyI59Th90548g/JXHG/v+CXAF+2v6MX+30/s64ZEPcEW5uw
         E7Am/RWKK83gT6hzx72q+5PL+i/hJqdw/qU5IQCR0166Z7eWQWU+87bATam1uHMvORVQ
         05mB4gVTSuykT3qMaF71qw9/LpZ1IcGTE+E7ek/bsgtnVyDaLACdUL1PFz4DjvfpciD7
         Si/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369334; x=1789974134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lncf4QEHE4r5d+dE+8CqrBnMeQeEdhzTUJxWHbfrp7U=;
        b=swHMKME9A5Al94g6d2PBOvMf9I0X3tfGWvqOUmm4EqHAR3sG7l5SUwx64AtkHAZGMg
         E1h+jEVULG85sVOXclmFyOQSvfJbINMqHcwgm6L1XEfRcsuBwHrUdaCzM4c2wk/PFLzZ
         A9VY/dDdf6R5m3IIK3SojMOT1n9nXfVNtF51qyZwnUWl3CDmpxwc91vammmCyakqsgaa
         DGIGkKBOQZtezKCOaqgHcQFsI6+JrMF5+V+us58bqsaMPnaVx42E/Gkfl77Z2sLCyai3
         B5gUqL9LHFC4RpIrBsbdw5CizdDMR5kyXvrlwA8R8gWH3QiGJpmVtYQax5fRPqztAAhY
         7Nnw==
X-Forwarded-Encrypted: i=1; AKwUvBz/Z0HqPCGSjkLQLb3z4zJlQNahWwezMrJv69qpGsYw1epROf/wcWvO56Mip34d9AbJJ4HYf4ghTiMu+xw=@vger.kernel.org
X-Gm-Message-State: AFuF++lShF0/L2YqzlfVDoD7f2uzBKqPUZnphFU6FIVcQZkdMi4Zn2JC
	GQ90XAyMOIcf2TOWOavI988ojL7Vs+adhPeQcNdEqGsHqdNhqcsxQ5EkJ33Tfg1Lt3XxIs+VZLe
	o4/h6KIC816L3eFLSyKcjuNqkLltlPcJv2PK9OtiJmu99qE0BZao3dZVgR/kFGtYP4Gg=
X-Gm-Gg: AYBFou1PdQHSYx0Hto34VCq0BV6Pfy3E2MU2e10a6KkJYmfQaxhqoDlQQETPlr4cYxH
	w0M4XRvNi2Rz7FoqJtfHGxxwtQ0O0pZncKcSaUp+7m310mvnU3ooeGwHryqg61ix5ljC7C9zihp
	Ja81bcqn3BGicV02YNXHuyFIPgu6dlfE/U/Kzx0nBsRfXk8oAMl2nEktcl9ECf6nlXXIIQN0WcC
	GS3Vch43vKAHlfXOu4beGsvUImq2LnX+7R6iTScdB2IdoqQ3Od449C6KkypocWwzOZyekSEJoNH
	oYsWXc6cjpd8z/hjzoI1w4Mp2/bTs+wl/xxQZbdzeMSrSH3P8QR33p0Ml0/pkPT6eNtDqdJA3JR
	6f8HuhYwAbdOKDCHoPkuWuwOd3gKQ
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr529497eaf.24.1789369333849;
        Mon, 14 Sep 2026 00:02:13 -0700 (PDT)
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr529449eaf.24.1789369333395;
        Mon, 14 Sep 2026 00:02:13 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:12 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:30:01 +0530
Subject: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1670;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=G5cXeBcnXSGfOAgl/JoaK0vBM74cUlRJ8lMbVI8w55Q=;
 b=eDV/j1+rBIpMzWBF3RVk8fOfHQ3tc/ReeWP/+syKXhaB9vbwZk2G7GXpyZzaIqX8Yc2+n5mYM
 aIoiNBXQJ43DKAMH3iDnlUNDDIFDSemHEltCtxRb8tLxp4I7NssVQGe
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyIp5rOWO+Eeg
 wl1O2SKb/nlFC6kzFPkiA/RZGEESgk2o5rrF/vRy7sAaEgdDZPI5P4lPLEZOiQCWo31RiEjRcO4
 sE6p0sEuJSmAIRGHOqoRwDpgtA0P+SM=
X-Proofpoint-GUID: uiZlbku3FURoWkXHUsLaYUdz0BxnQO5x
X-Proofpoint-ORIG-GUID: uiZlbku3FURoWkXHUsLaYUdz0BxnQO5x
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa79bf6 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzQaB+UZWeCBT
 PXDROLZxS9QDZfvScQqRW+T+weUYdEhRvdHDWgfxACLJfLy6w2nrv/ktvyt/S2I0jw/x1yRG1Zx
 bVQgjtaopofIEZFsafbbGHu/sprqVfr/MK4TpazWpX7zDvCL6rtbWlBIUTjMH2lGrUnK6Ud5Dy6
 w+DWakDMn8NOXsdlZ0GegembiCIFDQ3hXDPJLUswQP9aCRu0jVClbaOMbGTve8Y1Ng8NApKL1SQ
 qEfF9M+02SrCtUtYhS6eO+M9OCqPEygCImyWEwlT2erI96yqHy5QNBY/rVfzOV7wTBDcttilCPG
 K41hZHjzcv8RrCnsxeEUMOPSNdcF4/9lkoqD6JmVECTsO0xEG5rwjD6kPKbC/5FKhxHTag/4ZYe
 7ARl/YZ75Cu4dMIZ7xLJ4AT2FZ+PP/26Eq4qtVAI5b5SCoBYEoSdXYLOPkar1J4gj8ZsQKTXAVi
 nOZb5AwGb/Au3XJVHJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index bc9c788b92b1..98f603961f8b 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -254,6 +254,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
@@ -263,6 +264,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1550>;
@@ -274,6 +276,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
@@ -282,6 +285,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41003344>;
 				entry-latency-us = <1561>;
 				exit-latency-us = <2801>;

-- 
2.43.0

