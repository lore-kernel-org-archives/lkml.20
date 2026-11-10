Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343661;
	b=YKtVEnFfNQjTOV1tBhWng1YJMSBpBYkm3Vu5GOjmdPFr65a1qLDAzWuVd4ztLNZgDMep
	 1HtZSrCUBg3ae2FdtBGL935rekrDiJG6NxQA5CuiHdzQe8TkVq9fsCyXb9MmeRDDXVH6h
	 MDHkt2qfHBkFSBEf2/pqSwgu6YbBxIs/MR5xe7wIYqwmBr1dgMtSys9aomcpAXDKiEl2R
	 VzpzCHNZr4oA7DRGGul3q2ajIJNeXu77ttCA96FgQk2koGH2KeHVgOG2LqtivvYGEIWTL
	 2Dd1n+hBNmLtFOgtN7x9b1EfC2WYbK+TKrh/BqRY2njrzU2KT2BLQrS55soP83gCS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
	b=WXvzgUsrqIhGnKEd1Z0JdxzUUcD2n1swEa1KO9StTqy2rNzOgh90ZOJ/fHx1ifMrv/iW
	 whSdyu27Y+OvmlFuu/5eJm3bkisCyIU2SfYhQargwhm0W2oaJ2AB3FDtDSa5tNp/EOaM0
	 FamRimb/MLSzy+GrjDTTN71d8R8iVQsAV4heRPP+/rGaf/2rF55pnqV5cO2u1dxLDsejb
	 D5aLMRVkXM3L66CBgu9cOgsY5eGUvITFmEjuAvgJ+3d0h9PbeErywNDhYpEgVF9q4YuY4
	 kPc/Dq7U0sD79H6Mv51m0ZjmXkgRfcWqqS2anbj6MdN1pPvpxKTiaplwaqob3AAunCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cM+MsNCq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzsOpfZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2A606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F2A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cM+MsNCq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzsOpfZk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIopIP015165
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24Be
	yhdVmt3o=; b=cM+MsNCq59akQglTLxUZMR+ZNAXqoOuWeiS0DxJsrOW4utoRxP/
	WJDwu/hr6BykVKNtSywPkl/sAsOFKnOukWcv/E5w88c6P0422nKL37NGZ+aAji6J
	xwsJNNAJ09youM9HNFPDz7GArFwsv8vaZ54joAyUGBhIuGzShpsdNPKu+oxr97rg
	MGF1vQJNCZzI2QI684/piK3d9iyNz8DB910K3NVAPN0Xj2skzIRQA39p4br1rlWU
	33fxh9QABXPbR+/vtSMP7ptEENVd/zUepugxCBt8VEr6B74/MGokP7HuguikZwiU
	Io0sL8M2dWpMUGisBkQtCDMCiFTf0eFZF1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03ctt95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:47:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05900df7so22611615ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794343658; x=1794948458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
        b=MzsOpfZkiXUsMKl/NNFgEZJqsumV9j4OF7GI7/fL59R+F0ZM+Lk9IOgbyNN+5J4+Lx
         EDMRZjntDqGDD+k/WgZ3jYKFQvLK7UTH5ZWIauOIrfrBcrynsftD/He5bbAucRQxc2jm
         Np0XbqaN6dptvMfc7w4qhXBBPdJwh9D+9Rs1geuUqHZt6zjvMPDiF4BVBP5dB90dTS7z
         vmEvzu8/NdC8x3uFRarqewANoJMhBZEjToz29/LQEIe8Y+iiI1gxiZ38DXD0LEl56h7z
         UdEAc9QvR4SlxWE/JIcl66Lo0IS7+9X2TbaiENdD3spPMlTQeV9UxA0+lhXNY7gYcir/
         wkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343658; x=1794948458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
        b=OgFVmbzV8lZXVE97PemhPtB94heYrc+/pmneJcoeH3PK5R3PQKeHasuoIgUBGsnV/0
         /lmUOPLPKTPJqpTqAXYkF/bbhWOCYR2BLaGFAiqcgfhOhhrdOTBzjZSVIa9rMlNi14YA
         hiz9GBdjAAT32tLkZyH2Qc1/X43/wZ/AFGJAEKAsAgsPZKA9qYH6qm1+YkSWGKaHMxon
         tMpxbPsKgJeNZvLFvDXbv3HsJZITCkSpGujwsQsmqLgukDUspv/+26xIWSUmJyxEOkmO
         /bDe9LzSha8b9IbryFJIyByb1wfGX3QabNDBczetM0GTrNP+I/8FLRL91eXkRQXuVlZ1
         dgNA==
X-Forwarded-Encrypted: i=1; AL+hErGanMdjghQ2awaaEJEGAvOJ87fISRmZjwxnQ2w30/x1yjVgpz9VgIRycsLk0bly1r+b8jM2vvWiyTCKIaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t/AJHrSNbiU/67NEltUlSI9tV6wLwqMmKZBaKQBPTWHoqoHhu
	ivAQCuoa4O8tmGFcvb8ZMuT6/aZ9XtjE+4mWXhLfbpg3CJ+bTZKaWVk+o4TA6vJbKFTCbzIdt1C
	imSXvDfsiE7NGXQwjB/AlhatJSvkEjQKELahswkc32giU2Fa2ms0s5IsZzlkHtwv3pOs=
X-Gm-Gg: AYBFou0QDCg622VfaSu4MwMa95tK94TvoEIHpYiyrncv46c2zBk9s0pDMLMN1xN6mP+
	y/TNTtlGKJcEQoVYsXOsSe+MzGmvBVvbTWi+b0UUSUQKIgfoMcbZ9uzTj2WH2hdJLXTZhpOea7v
	WgyG6xwXwErutBdAL1RSgPve7nihP/J7VJTODsaUL9D6jYX5VRRtv9XKm5iMOuqa0k+dUNibSve
	gpi3BtTZi5BkCkVvPBpWiXw1JueJzPjGFcM2l3R8AtM94nYEKxI0qBD0/jLjTOhdo+rkmASjih8
	AKc9iRxz01WLzLEvigdVwc6FMh0wFqcsOEP+xrwBF6NW/kSdY63HF44ECTiQtAcU9cUuqLNa0Gq
	r4KBLQ7cM963Iehv2tGgRp1jELkYJzZurf5g/W28BKxRrHp7t6M7f7i0/BtVBGnhQi/e325T6SS
	Dp7XjEAbdojXS+hoqiaM70kpkAxXto4EKqQsohvUlZa/CCnAaOEY78mhwzN/Vl7Q==
X-Received: by 2002:a17:902:fd87:b0:2e9:5ed2:c39d with SMTP id d9443c01a7336-2edd79bf74cmr3474915ad.36.1794343658459;
        Tue, 10 Nov 2026 12:47:38 -0800 (PST)
X-Received: by 2002:a17:902:fd87:b0:2e9:5ed2:c39d with SMTP id d9443c01a7336-2edd79bf74cmr3474695ad.36.1794343658008;
        Tue, 10 Nov 2026 12:47:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm12824535ad.71.2026.11.10.12.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:47:37 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: More nonctx list updates
Date: Tue, 10 Nov 2026 12:47:32 -0800
Message-ID: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4YrmjQuCxPmNl7Ds7xYkx8WJzikKo56z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfX1ut7ofNe205C
 UxMa4BkmwhYMviU9UU1WSvCU7Ln0oVafW9xfydbQ8DC7OoaWt7MF9xjkfJAkyyIeIxlE+Igm1FX
 JezgRO6oE67GkCBgnGa+1F8rw+MetTk=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af382eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dKKpEi-vj6lmmWfvBBYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 4YrmjQuCxPmNl7Ds7xYkx8WJzikKo56z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfXzgrKp6mimz9I
 DRAsnqLK9h8c2NHGdK0/HlU+NarGwtfCm15Yen2wR59PfXPk20wwWd74U8FA2KT+ks6S8CU6kpg
 RiunZUTKSleUDj7huejaKDwQTUY9hNUuPZRWDpYG6LZOMB/8Hz/QzKhi2xnG+A9rN9WgSMV/Q5O
 Z9T/3TzX8xcXuQISHUDsasEEcMGwhnx/QcLg3wLlG3HoGcK1peNbNAYv4yCtbanZtr9SZbIMyve
 If0jFH6cZ00pohovcsktTr9JJChJcm5MUZ3ePKaMdB7pXwgTfL3hIi62x+6IcQEQuzl6LfCUVtM
 6GEbojmDl8xm94UwK3IHbk2gtQ6mqMLm3NJiZ2O+jzkJ58OkE37klbG//bZQ+HmfYXu6XHh/rPB
 HPayT4H0SQyD0Bkzii1oBgBp+3SIRHj2TIsYXhzEDLTo53fANFHsCbqRhw3ffU9+J4r22CMHZLm
 5W+rJqJrQoEcPxMKBaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100082

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 510c2f6017db..0c6dde3cbea9 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -282,6 +282,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
@@ -595,13 +596,15 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	/* Disable Dead Draw Merge scheme on RB-HLSQ */
-	{ REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
@@ -611,11 +614,11 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
 	/* Disable mode_switch optimization in UMAS */
-	{ REG_A6XX_SP_CHICKEN_BITS, BIT(24) | BIT(26), BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(26), BIT(PIPE_NONE) },
 	/* Disable LPAC large-LM mode */
 	{ REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
 	/* Disable PS out of order retire */
-	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c20800, BIT(PIPE_NONE) },
 	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
 	/* Disable SP2TP info attribute */
 	{ REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
-- 
2.56.0

