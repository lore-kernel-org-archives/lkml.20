Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007375;
	b=szCo8GYKD/2ALkFxPrkr+2491Kj+gZkr2qPXpaYMkvJsHr+gofmQJtDMYT9+MVV+9BWK
	 oia1mnykdIodPx5qVEUPLoIvR7JKDagrEHgFbH9oh066H33lRGkFDeGbZ1vKGE1UqzNA2
	 xCg7A70jT+LWu0B5LjfjJp3dBLNSXVsEoFEmCeioNv+WStp8TyBSXVZAddCBa9I26Xow8
	 qaoeb5Ea5RcErvEI0lXGmOo5BZLwJXX7hqvAA5N+jUcu2XzGYkv2pZjJiiCY0rvf8ss4f
	 vAguP3J6eQQOeCZd9C+wD9s+Z/A9wYwNQnrCzge6tgn5rOeKjnggAstmWuxhr2MjOcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
	b=tB2coZLUvK0v98NUHMIhE7ysjQO7tOCuIzTlA1YkqkZ6PRfJGE3yObaZBS53uZrQyfef
	 0UiFttpkRRLanCuqAZL656VeWvE7SWSrnB3WURqAsdQVhsbrsm/zu/zpfKVPVeheIl6T/
	 Zb/Q0uh8BmvaF1TktPiu4IPRMhV9b/fWoE7HrznJTsr2Q5BHoY7HxTpXDQUKS4Y+Whfa5
	 V/AT+tYLiCaGxTblsNUhz6lYEbO0yxYM2kWAezWULY8BxlG8ux+ue+3HSECKTAjEUFDSj
	 uAngr4CDxAj5zcUWpT07PJy+NwqkGJcKTBCF0WTf/XBI0y8U8oimu9ar189ohxa/jVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3E3la66;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ90RksP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1349606D818
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1349606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3E3la66;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ90RksP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoHXp2084921
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDl6oZ2XOhk
	k26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=; b=Z3E3la661HdidD9ghetX+fiWSkH
	gGcSlKk4CFljmb1HyWcc3Kt7foZFrZh/wSdKxPnmw3WUpku1DV7533nhK3ZQtda3
	hnEZ6d1Js0M42Ij9Y4j5s7rVDXFy5YOMtIbekHQ5ktxYr9sNjq/Q+C3hW16lUmoq
	62/GOxKBbXhwdgyJpxNRIcx7UYz7Z3zgn4o5nNqt+Nm/l9wZxv9W/jcshUyzu8OI
	zZ0hsCCjRfUV6N71g2o9Faw6PCVSNLR2Wokqzy8hq1gBEHEsuPEyNOBBCagyWMts
	9Mai1rkp7pzSvjQtEGPpz37uqGamHaf6rRMJA404dq6s9AF5V+fWBES3iZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsm6m8yma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1577693a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007368; x=1794612168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=fZ90RksPOP+tKlJlR1WdC5VVA6/cF1AwDMjM8DNJFjcIWCO6mTzqNsSfvUY2rrKR8E
         H4CGSpHXyqOqIQGrPHLdYAkvn4MtZPI1zc7Q+oIEIz01c+eUAtc9j58nQBhvAgG5V8ip
         YXrIey1NjmShRjpISc4HvI3jsdLdMgrxSAITEaN5S0CgYjN9HfVSFH2EEJMR4QO4L0rp
         ufmKgSzrqL3LcS4J8XS525qShnHBxVZwgdrDS3XhDzbs27/SvIJSbYX2hRSQex1fFKg2
         b9eM/su1l5Yih2jBN+6jyC6lmKCZf0K9FMXByr+ljyp4vd9HN/C8RvMmZFb/FhKK5gIz
         KOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007368; x=1794612168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=r1L4ITxT5YCXSqns8tSu8Prctn13Y4uc2j5guE2LJZzedYmlntPkKjJYAk+E/HzSkZ
         0O6mydVN7fYuIXWz3TwZWpb49ynDype/cvcuvRL9CD125ax6hcd1s218vb9YOOdkj0yG
         dFWf0UHfkiCRSbsPO89+wXsbV/pS/+TnvflTiUvsCJ1r3v8O1olc1GIqOx1427GwnnH6
         9Y9fpeDrOBzpxgonEOuF7/i+xzwH6EeDtH+1iedBsSHhaOgfyVsblYz/CLZ9El3cBkmy
         EUa2hRdEqrmVMDLGT0IVyAOmJniksiY6yOpQ7YKRFc8PV/caHcS3R6+8WI/jFHQVuheX
         U1Zw==
X-Forwarded-Encrypted: i=1; AL+hErHGE0j4smRF6opA/CHIIkD3ai64FR+b8K1hVSxo+mfLBxKrxbP3Wqk7ZVcz8HCOP0oFOVeYkp1/q3WxZpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wtUG3PuNcwM75vTGk1DsPvB79OYNrypw1pQz4no6XmVKquxFD
	i3hpT7UoFb4bGT9VoLMULQjCd02lW/QAOoJYNozqvnQnym2yldwAkowvOKHgDylv97MErlP62/i
	3Az8IQkXMcbvjjmI3x820c6xX3/ZGPPi+4lL1i8dY7P27GRoVRlHpv7hSQ9jBAty4/NU=
X-Gm-Gg: AYBFou3shiZUtGlcwzPiFy9Ivv2/vX0+z1o6bUYU+PPqLYRFSitM+J5R16Mt0nvok5d
	M5Q1x+KBvDq4dzf/frh8uw8SYH6n3BJuz1512zIHd9Sbz/rJ0x46X3GBGZRShbbn/Ymc5WYqZxO
	wz61NwsdeYmVr/deIF7+uMykyk43n1T4Pr+e+HAAUDoYS2sCEYpP9YJ3UIH08Zj6Tr18utP6RQd
	Gbxbgbk7RT/JbtwKiwU22bWyyQxbWgC46DcGc+DocCiKC3p/d5DN53/JYYvC+yUzejllWb+2eNR
	Qzmh7tuepIOLP8UHxZ9HGwIo1rPKB+b4RW4+qhQoFLSQwxpc0rBLYzZh8MFSbRBmxyoUClYPw9p
	eAhmbA/rcUU++xKooLs9VmlzN1ZyenuC0r/Fol6+S5oaVJQpDtZN1Y2IcB8S3XoAFI0Zx1VbX13
	dy1NBBY5jbjeiVQzl6bOmwEsrmLqBxXBbplJ4JSUxfo7qMqiAlQEgU/KtQbM+H
X-Received: by 2002:a17:90b:530c:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b0db6bb8a9mr4151470a91.13.1794007368224;
        Fri, 06 Nov 2026 15:22:48 -0800 (PST)
X-Received: by 2002:a17:90b:530c:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b0db6bb8a9mr4151446a91.13.1794007367781;
        Fri, 06 Nov 2026 15:22:47 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10585eac3sm659064a91.17.2026.11.06.15.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Fri,  6 Nov 2026 15:20:59 -0800
Message-ID: <20261106232220.47602-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXwFZXXPw+kBox
 hBFphqPHXQHTJVxXz5b+aPsYMrT46QAolblqUSfGfhN0Y6NB1OGlZ6sQsatY+l4yoowuVzTuvOx
 SxNBKBrCHfsyXsH8yk2/NGLhsKqkjrk=
X-Proofpoint-GUID: TATnmMP6pH_vPD9mzth393_fbxrJfAmf
X-Authority-Analysis: v=2.4 cv=S7NMU4sP c=1 sm=1 tr=0 ts=6aee6148 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX+pzFvm2+vya9
 cQLYAO69Ru1wRMyr9h5ogkzRgDts+tYupit2wKgjIL2pWcfXHZqErx8Mrg66dyUjIXTKVUCM7Wm
 GroiiWGpcF+MfvBLQmrkl1p0mkF5W57e0TjqG9os/ObHIeh1d4f7RgFLUpfKqJLWxa+YFmwnIZ1
 C9oeC3pgxB9QT7lwDmJiBZvtn8t9eElMVYSDPifexkrh+QOSVZq9vFZLA1e85K3I+Pkmu4yqaSA
 TjTjF+EbmrO598LRx8XSFCnIaNCGGDs4GEERFUQi4o0XzD3jeEjgOQBYnOazD5NOhfc3EFMyg7O
 5PQmg9phj6wxPEWjgvSUP7OvDGr1m5PpLzCE/a28oftXep90AkmnN8AlleEcLjQ+CEOfilgm9NV
 0chiiovRyhYXbKgf6sW6cKAEUD3BLQhPLTfkPvW5yGjJZw1MfInxxMCiC2HJPbUIxqRY9a08XBG
 aDv70tGz4sQ8Fulzlaw==
X-Proofpoint-ORIG-GUID: TATnmMP6pH_vPD9mzth393_fbxrJfAmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index dd1a5ca91812..6c5ee227243a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
 	/* Configure number of outstanding transactions to 32 */
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
@@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
 	{ },
 };
 
@@ -709,7 +706,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1102,7 +1098,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1161,7 +1156,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 59898b49a201..f65bf82e5c21 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,7 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -390,9 +390,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -638,7 +635,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -719,7 +715,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -838,8 +834,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

