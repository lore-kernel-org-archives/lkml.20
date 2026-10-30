Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397928;
	b=cA/r+AS7y25tjWBhRlluSXq++8rhb2nJiabKCI0OENkI3zNsn0kWmgUvAzf8TBV7Tuih
	 UN/86Eb2jpEMEiWePCJgGWseprBGy0GyRHcG+Fdtq79Crh4a6nyspowb9WRx46NAIjths
	 ka+hju75x6C58juFNGNqNL/xt2AcHXn9hwbB+w4/i324Gem6YgQ8GJoPinNUgjEHVlQvS
	 oPYSvBdqpuMpBSwwuN6GzkGIdq1udq3yNbMAHrN0h0DrhzYBcfGgHIWBjauqfWIo/Y/bL
	 TWCIjYycFoiCnk+uTOEGycPbrfTOan0MsoA3qQPNprA/fRlySCnmg0za9/Df7NF6dSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
	b=vWGtNDs0PhPjn1XN4i1WcbIhIkCi59BYtx9nKQXAbT8RmRtj+xVa4+5QVb7gk1UKFb2q
	 Ms13zsF7V3FrFtcAGeiTiCfedCaoZ5WaMfWQwsFsPj9RrhrlPJMB/Zez6eSrX93koO/pb
	 kuy52f3lvgRp6QO0QVgheGrWlktiIkzupzesuHnhzE5nSAASI4Vs05lhnccwBzDQhVXZo
	 KJf6VPpJMvvGBwrGmU3/PdWOHjfzuanyVrz5DHx5yMBLc57wPz4xBgmXz3wYeW01u8dxb
	 a4F6uSuw7gW6p9HHTkhugkSaA1NvdxOgmppHwwVDSYDM77O7IQzp2GS8stJfZU0B5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnQz40G3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7RHpIX6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8360A260D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA8360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnQz40G3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7RHpIX6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtZVB336812
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=; b=HnQz40G3QjylPR5R
	yig72MUD6M490+bCaOkbfMQyo2euaiC6V9IBBLWMSQjVqN00Jk9LFZneG2rtog9U
	QKSLhqoJ+6f3nVhKorUsrVWT7npCkjxmnP/l+wiYxOTu95C0Rxb0RdF0/QxdN3au
	xRXLJpm8hWEJtZ6hRy6Xfn6wZkDQH/kcXuruMnsDDTmMnDVJt7k65vmISDCpkvnI
	5aniU08RbgmWIwA2kDu2uAxANg1M+Nx25OgBko7hsOkggb5cQqkwx5Zl0nydM7Fx
	GOoZoXI6Gj10IFxKHEuVLUbV3n4Hmap2Zh0YTqYriUyRCj0yYQzpfZdlEhFYYtgg
	hlDW3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x007af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so146613585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397926; x=1794002726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=X7RHpIX6YnSXHtXrGojuHdlrDkbWT3VxLGuXe+NpzMHw7BIqt7cwHuwZIMG6DcaRqk
         jFzJNmxXRt9dTcbxxfEKtSdB2Q0Xr+JBCI28c5OBUhZ5tVZm9YKdAayGKeQ8fcAxI+Ey
         KiWskYmAV28+2KTUfVP59saVNkUirOpOZlbK6AWVRq98b1LKyuWxssLy9/gEP443e/Mo
         NQxGB6lOwHozZ+kJzt3WXsUhRHZS36maexbHvI5kFchStRHzutWV1i/+f0WJeJZDPUV+
         F3LBvCGNHFZwSUH1i72XzwccNP6S6KAN8S/A4HktwWc4mEv/SlOX96q/6ohXsTVS0Gz6
         bxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397926; x=1794002726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=ZGj5+cUdCqo+po6QOGCAYIn0R//8AeZwE4tlLPMguRM5wCVJPjjDChg4bPP028jkD4
         zq7SX1FigELjDbBKCN6O1OAynteWc7XuhnSaZjVpmPBv8Hf7NwK9hCegC2R3RulFO2sx
         3sgSTG7OM4paAVGQx+hfia02LB1A5Mzy2y10DHwC1FTQzYz1EM7qKGMwuVLWZOobTpdb
         CJQBWLSCyo8s0yI3Y7H9lFsgryGyWiUSmwBXf0mHif56GqcKJ3uI5jye9OtbjC16omFu
         gEWMQWkwWPOsUIQA+y6BcrJkLe+evYyylUIBJFnmtAfn1JGWhxqpZkr6hPxRMIt5eb10
         pvbw==
X-Forwarded-Encrypted: i=1; AKwUvBwz3RAptQ2I++VCoFos8y6w+GmGLndaIxYz5Xr1gDp9xLox97EddzUgOt9ZXzSYBKYBEUaZXZ8VZz59bWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5lXiotGTSAxH6Rs7Blw8Pdc8zn92I3qlDzrcupMO3Y4lpCMlc
	68WeUUAbApk1+qiXziHjFnWuFmg7bpBxyFXSHpzZT0/BBJoMQkUoImsWtBNnFvGnPVje2yNwXln
	pJIKmfLPaTy+zHAdTYiQiO3WEqY9E3nT71I+N/hrfmUQoUlMEuXE05Pfktivlc1gW63g=
X-Gm-Gg: AYBFou3pBdFekwUMAhxXPzPJNK/1ktACBEEzrYjJVSv860Xosj9q3uIiuflCyLUuyKX
	/jdsKE1vTKK5n6e2ouXpaV/jsCa8ezWNjj3exP3FdhqmQyrxya1QqLPMhxHLVYDOOrLwCZuH4U3
	QQYAiMUNe3mFTTV0BNDcXDOIersY6er/ZRzhRap2J3GunwVAMqjapxjRQZpjPEgzc4+XO1FZSKx
	WnH+I9owHkLn0HIo6ToW92fjsopU+pJqpIpJTK79214mTid0W57Xq8dKcDao6016kyi7z5YYabU
	z37xCFGwkVN9/9q7E99wJsuwdqRlhYUZ1mC+OgWDXvW8dtOaygxd88UM9bT4TybJx33bdL6D4CF
	3qAyhEnFu1286kCTSqrJnOkdNSusT6nSdSy/CnFZKI7nOFsWoY+5LlXTR5sTb7uKawtBTyXiow3
	YeM+NvDT8B82YrcjLHc3zfsjQS4dEs8UwkXmPkKlpdEswy/tHomH2fE5xnSPjn7A==
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652257185a.50.1793397926053;
        Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652253385a.50.1793397925571;
        Fri, 30 Oct 2026 15:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:59 +0200
Subject: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lLouI/bTmjXpgte/SazsuwobLVMNh7dfXWGAG7Gi6io=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSazf2fJ+5mBp4xuH6MvlX8NsIWizZkVogDf
 HSlZFoW9geJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmgAKCRCLPIo+Aiko
 1SSoB/wIW+hEwcrwG5R4YcMUL1kBGVFaXiqV5T01kWY39CxgAlb17URcSVuExa5xChycU9gLYNZ
 bc5wDh9hG0nd5BOnfNuyflAbWRpYX77ysC5FN7YmLxrLir1sb4tnk1bESZBJHeSdU5pKV6NcnnV
 IixfdDOsfEhc424rQeuMmHrNaTINCAvuz6P68LFcU1IvyLWZpnuOsqvA5xW/hBJ+tqYcMl5Hd4G
 2nT1aWAVW2bn9PBrz0z/n/UU92wibmG1jUvCFRNXE+rsI7Gg9tYInEYd8OMKhWYHDyaiuY6lEVu
 6H6TNxngELa9cIj3bCS8y/R8ZIZLZaDlU0c/2u9RZMZ4fi/Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXz3gGdyHVch9X
 ELtLaj7YzKWrnA0+NwhC3OsoDONIUsFdmTU943nOCOF9shDDnSL5nL/V5EjyKwOmI0KdJBSS+Mp
 i+RI6DgPjjQsZigWXG5T5cPkx5/ULkGbTvwU+NQBuasDnhJ4fWrSs2tlogq5vdWw+s5Ar3xuuOA
 wEoWGpLtkvL+MxxfCe1CrvYIhRhV9LaRTD0dEvjlLAdD8HV5Hzbc/JIH1XJuFWkqVYLor455P/b
 L3twFy170otPIbD/b1WgNZc5JpTa9EjelCCaHUJAYK5XqEFrfIcYSjWGjKiohsV88r8u094nd7o
 HmDU/XHAygdAERuDHfSpop2ZYbLEDf+5HClX2aUaS1dkiPyBMa59wDVCQzTcaY7JMljD1Dg/0tq
 +73+jJdWtw9WSlK0Yhgt1Az3EWYsm37a+/b1HruJjSX+URe9bBUGMhpgpBY1Rr7tFmBC3CtpYpT
 fXqsjrhNl6CPUlwvYrg==
X-Proofpoint-GUID: Ej5FKxMOkrsmIWe4ADcr0I2698tZG1O9
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae514a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rLj9A8cDlUUE0Zp7hZ8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ej5FKxMOkrsmIWe4ADcr0I2698tZG1O9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX4ypHw7SzTEOY
 bj8z3ui3nV+t8cwOjolio74n1T6dacJXett/C+1qY758+eBRzw7+t945DPW2vlIIyzeFDV314SY
 1OVl7hV7CU1LImyLOIYYEDPAnQaNdTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

drm/msm writes the addresses dma_map_sgtable() returns for the DRM
device into its own page tables, so they have to be physical addresses,
i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
device is the "qcom,mdp5" node, which is missing from the client list,
and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
iommu-dma. On db820c the SoC then resets as soon as the GPU starts.

Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
msm8996 an impl with just def_domain_type, keeping the bypass emulation
out of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..addba9074217 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
@@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 #endif
 };
 
+static const struct arm_smmu_impl msm8996_smmu_impl = {
+	.def_domain_type = qcom_smmu_def_domain_type,
+};
+
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
@@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
  * there are not enough context banks.
  */
 static const struct qcom_smmu_match_data msm8996_smmu_data = {
-	.impl = NULL,
+	.impl = &msm8996_smmu_impl,
 	.adreno_impl = &qcom_adreno_smmu_v2_impl,
 };
 

-- 
2.47.3

