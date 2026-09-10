Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F851499F1D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045329; cv=none; b=XbWyFWIElvh27jiDnbB/RTD6zCLoI7lja3pNvS4790bzC1poltsMLMOplvhE3+7YdK341LzZ0dJeqSeUhLu8ETe1IhtuxmakVujJwem/5CgwRmlt/s5Whu6udsdimQafW/5sxAaNi6+Xr0a7k+ihH+8uRSus2bW/LFV1gmCBA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045329; c=relaxed/simple;
	bh=pLuYTK+v9TIipu6ssPymi4hw6CAH2vc971YdKVn+N3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE4uAJS96EhwCNxLQNIOa/9FcNc6IDhaspDfcuaXLh4+KSuvDAQs/uaOVi0JZq620KT0Rxg4KJ7JAsSLdpGPdAHnudlyFHntIsOmYtiZa3CqqTqQDPqUZ8ydHAP8jZCQLQweY0qhQArfFlDgLELT5OMsOqCxpOwHV4BpkcSEepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwPDvhSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eInU5jHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwPDvhSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eInU5jHy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jub1241998
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYH8lVh4dAKWqLbqknghnDZNnedz+edxJGyF0OFsIqU=; b=OwPDvhScpsjzwSB1
	leEM3uuTcs/RL8xo2IEcKsh9pempGpNNli/rPWaFix3qOdNbbnGfmiNl2fFzFHt4
	U7docxBTnmC2ZML/UBEX20u61+Qr4iBTEmNfppwApYB9MVYrJpBLyA6RGo1QhaQE
	3QWIeMyDFNxXZKz0GKju/QNl2hW8KrMBC5UecvxFi3c5z/qSO9eyWjUaVqV9ghde
	UQA5m68kZGpPLxXp+DPHIRapJouxeEcsSUidI/gKL2QD7KzdBrw5r+DkM0P/4/Aq
	nmPElRBI5/8JHQQWM6oFq0YrPQNbWuuvr2WGw4XJ/UqD+bz8tNnTnfjxXzWRyUSq
	GiaFUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso72797575ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045319; x=1789650119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYH8lVh4dAKWqLbqknghnDZNnedz+edxJGyF0OFsIqU=;
        b=eInU5jHyKsfPvfWWJR1xT9sUTEVuuCkrG8dDetEqxu/4vPfuDaT+w3HOMLX50TY6VR
         i6nAmrfXmCPNWv3hiZ2OWYWKX5MM8qwjjIqeITN1qAFisQpnfiRD/VgRGTicXLB1emIl
         Msl6rSfVBBCpmk9imFY49cNumdp61h/Rr+PCWQDzB5q641p1TILGRu+jqixD8U6WqZzf
         J9MsguDrxjQ0idZkPf04lPrSv2TscQpbF53vDMWXDPsIVGu5c8FFsZOGMQgnviC5XV/J
         T2jWM57hL6chHRMU/DCEmBUS5fnDt5TAdtf2t4LwI5qpoK4mWrdhiZvHE/TaZJurhOrG
         ky7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045319; x=1789650119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYH8lVh4dAKWqLbqknghnDZNnedz+edxJGyF0OFsIqU=;
        b=cAENv0zVblIx1hwDuNjkfJR2jmnaLdeo2C2mvawR/pGavFq8Y64tftCrKmCgzaJ8JW
         XzVG0ZCeXw/DJhqHAsF/5aa0o1rENIhPUiIzNUPYnww4fn7PhrBspZPFS7emzTQa8NX/
         EMn8Ju8hekQxaKMXhbAckEgdJ1+UF+DdMWkq+1qLg2qLrtF5zSKCtUxrFIsCW21AFnRl
         Bg4T30jzHT84IiN7NP4IvLVx0fTd5Q809NFMACaCU4F9cnA2moP1HVlEouxybqjStFdH
         K+z11CNBd7ToGqVGwpEKHZPPuEywI6z4mfG1B8g4tdy1FX+n5rhVZEhOI82OJag0mULv
         IQpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBwYbX8FD6XqFkHiIaVb/63twz+LFUUGRkt8/hBFKCPH9mJDFpmXVfWu218mpgP1VI9bycYLkr9BC97dk=@vger.kernel.org
X-Gm-Message-State: AFuF++k0aHk6xG968GMMM2nklDsH/WpQH8jTbEILy+sSmyApTvSTOOpk
	CQ+9x5LsZwmFGJ8bMwE6WbsV7P9yUSHVerwL9WXIlPjksl8mSRsIXFdz956bPteZde++vnf4Jws
	XAv/ro2i18AuwcElvdF9poX9b8jexwM6hXpzeRosDIdOmi+Kx+eG9R+0pC4L8qGtTqeo=
X-Gm-Gg: AYBFou2+wZq0uDEP7ytJbAXUn9FLQlV56JDoiL4XUP/atrzcAxqTkH0b77c8jgwoWXf
	wQBGTZvwAA9RTFyo2Hy1BIrEWfAfgQkzCEAfQu9vzAtRpPjlfexkLet9EPZ45Z+VG9BxbkqTVFs
	h3iaqDHgYRduhOTtwV1K6Q6wmPMr/1JHXtmfOEBBz4bK0wReVPTUYXfNexRceJkzuzwnPaPeOsG
	1Ill4UM2qWXfnAzkthGtlwE4Anma6Sa9Z4oF8jRiZpwSbJ89ueHzaI/bNrTx6AM8ECsx5SXgXcP
	RxtiZpguqyGfv8tuqetIejsjtXsNTBoikIVMnT+ELz+1CXnEC8DV6R33HCMr3FV/ZNqHtR9KmP5
	d5mAQfx48obvAYZPrfN+JAQKUCr2iW5oS/wEp
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr338986755ad.5.1789045307485;
        Thu, 10 Sep 2026 06:01:47 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr338952815ad.5.1789045277098;
        Thu, 10 Sep 2026 06:01:17 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:16 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:30:44 +0530
Subject: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX1DXghkOrvQeR
 7bsz9EUMII4PaCjcKzd76mxxSkJ28SXJIxGQVzKERnhTA9DDuowUK49EBQuby3p28wJ6dpcAP8r
 HAABECteeLUTFpivzar0s9MmXfasZlk=
X-Proofpoint-GUID: h8IRdFtqcz4MjPRpayn8S2y4gX_ooKDw
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa4c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=22uKg8MptKaIaSBHXdMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX+v2pE9WokXDQ
 T+YZfaF+5lFLm2prc0ETMpMBu4xYOMNL9fphI8GVnc4F1szaJlEYFB+CApTRX9bg+ssVRvOkfzx
 tyr3LLXl2Q/YzKq/he86WSApy3bArTRNuadBvFj2lSCy52anyNIjSo3kVSGkZB7eL+2YWF2RYeI
 n38Tr4vUhXvMVVZXR9k4hsR45RMygK4f9Y9VlZha8/7Ffjl4ZVcK8rxThO9VSgEoMewZqQBMt2D
 DAtkYByNEHla9uNmstkw8LyPeKvmNB8xr0jWf+EDOAxDOkhW3eQ6AZOvJLcilUaAZO4nfhZ5pyR
 b6OEVrumeJgzvFg0HJfDTiCghTZzyB20pkO/qDi11ak1789ALGNCiUdsktxMfT28c7vuLxAirtg
 htVmTQOIrzX2vHbspP5WcpjZl5IbGedDU59SHZPmexSUtGK46slaihPiM9eINOidO0PMoT6HNTk
 FnLqKIxNJ9zjnfSmkOQ==
X-Proofpoint-ORIG-GUID: h8IRdFtqcz4MjPRpayn8S2y4gX_ooKDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
SCT table and limited to the POR use cases that have a unique SCID and a
usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
ALGO_ALLOC0..3 set, so it uses the v6 register offsets.

num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
is four bits wide and cannot report sixteen banks; a wrong count makes
the driver map a bank aperture in place of the broadcast region and abort
on the first broadcast read. no_edac is set because the bootloader
leaves the LLCC EDAC registers locked, as on Glymur.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 139 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |   2 +
 2 files changed, 141 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 5e45a10663c4..d7a42a8040a1 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -1054,6 +1054,128 @@ static const struct llcc_slice_config kaanapali_data[] = {
 	   },
 };
 
+static const struct llcc_slice_config nord_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 3072,
+		.priority = 0,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 34,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 12,
+		.max_cap = 2048,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CAMFW,
+		.slice_id = 20,
+		.max_cap = 512,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_ECC,
+		.slice_id = 26,
+		.max_cap = 1536,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 2048,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_COMPUTE1,
+		.slice_id = 22,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_PCIE_TCU,
+		.slice_id = 15,
+		.max_cap = 0,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.activate_on_init = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPU_LITTLE,
+		.slice_id = 9,
+		.max_cap = 2048,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW_LITTLE,
+		.slice_id = 14,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xff,
+		.vict_prio = true,
+	},
+};
+
 static const struct llcc_slice_config sa8775p_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4484,6 +4606,17 @@ static const struct qcom_llcc_config glymur_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config nord_cfg[] = {
+	{
+		.sct_data	= nord_data,
+		.size		= ARRAY_SIZE(nord_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+		.num_banks	= 16,
+		.no_edac	= true,
+	},
+};
+
 static const struct qcom_llcc_config qcs615_cfg[] = {
 	{
 		.sct_data	= qcs615_data,
@@ -4751,6 +4884,11 @@ static const struct qcom_sct_config glymur_cfgs = {
 	.num_config	= ARRAY_SIZE(glymur_cfg),
 };
 
+static const struct qcom_sct_config nord_cfgs = {
+	.llcc_config	= nord_cfg,
+	.num_config	= ARRAY_SIZE(nord_cfg),
+};
+
 static const struct qcom_sct_config qcs615_cfgs = {
 	.llcc_config	= qcs615_cfg,
 	.num_config	= ARRAY_SIZE(qcs615_cfg),
@@ -5693,6 +5831,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
+	{ .compatible = "qcom,nord-llcc", .data = &nord_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
 	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 1ccc429401e8..713cb0221b14 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -74,6 +74,7 @@
 #define LLCC_CAMSRTIP	 73
 #define LLCC_CAMRTRF	 74
 #define LLCC_CAMSRTRF	 75
+#define LLCC_GPU_LITTLE  80
 #define LLCC_OOBM_NS	 81
 #define LLCC_OOBM_S	 82
 #define LLCC_VIDEO_APV	 83
@@ -85,6 +86,7 @@
 #define LLCC_CAM_OFE_STROV	 93
 #define LLCC_CPUSS_HEU	 94
 #define LLCC_PCIE_TCU	 97
+#define LLCC_GPUHTW_LITTLE	 98
 #define LLCC_MDM_PNG_FIXED	 100
 #define LLCC_PPE_RXDESC		 101
 #define LLCC_PPE_RXFILL		 102

-- 
2.43.0

