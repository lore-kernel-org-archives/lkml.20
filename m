Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395190;
	b=kVCSDvECslqg9TCreG928B58bbNDsJSErf9K8XqN0MtswMUhz4WXWL5Jz67NcOzG3eBv
	 mwtwCitjMQQPd53rY9gW9wNv3eNEurYG6m3stx7KqDIelNGS3S3HMeBMlKmf7Qp7rGm5o
	 /UdP+2Qn870+z7Jf2LhWFTWy+Zr3zxFzd4P9eQs5HbVcFKGHuDBrpy9jZ6fHI0la6G4/X
	 xayMEUQtp567diQ8tD8TXP3RLB23QIPe/Ri3+2bk8YV3qz9oGaO3IurO9mrrUgNyFubW3
	 SM4NUj89a6tRbjUFXecqYeGS1QwQ/ZV1NzNFOJgUoDCG9RURRwcJPQygAXjccXDUTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
	b=rA/MbqM3DPyJBWI/QGqW++X86o4aB+wojhrCF+9Y2HvvIDohBM3/4qfFj4YUT+Ho35mp
	 U1plNmOfZ8A5rX8ZOoU42BabRorWnFsrNcQKAsPu6SSBDQwqsSZLhdwNzkmI4JXIeObPm
	 E4dTYfQMO//OsvS5hJnwqpINWlSNihwMF8nKXNeSnOhgXLvNZcS/4ldpqa+mb9O1MBV9V
	 +qm5/4M6+gkYQ5ji0xsVLVTNtE0ujo+9wDk6C3C4VELxEkefMuIBemHTVIWsbL7vizqq2
	 wLxcHgEd6Z4loAdiJh6MgTprEWwRUXmTyRxZa61oeDEQ8iwFKBUnXzBqaqzSSQU1NRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjncsJ39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gC6/RTsa";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B44260A3826
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B44260A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjncsJ39;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gC6/RTsa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULFl481265253
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T3VgMTtOjkM
	73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=; b=OjncsJ39PtpcGTzi1O2wN2U+Wzf
	VwK4gPih/EqDr9in+01uB30PWfLaD6lYn34cw6li+/D5K0bz1jkhr+uNC4z7PykO
	h/0ZZ6pEQ/q0T1GvtSTopdF/3ZuxdEiit4r+rvfroR/K/TK46ylfDb+QwjkoMELj
	4rx3XQx30Olyzml3DWdAcfhEMwIe4hGns+zSfbd0olaB7rFuWC3QwUYnceur3AkO
	yzadQ3JJNTCTy5XtB79FEVG9bT6Rd1JtNAcZdRyEuNF3uznSX3tjnegSjjNpQsgi
	mAWiE7VYTUyIHb0v33rxoual1eKL+1ZlgENChNsiSc20Z8Gc9QYTZUPGk5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0016k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1106675b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395188; x=1793999988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
        b=gC6/RTsaD0zb1OdimuHVv8K+zzYxb3rqWzkV+VPhXHL+rGvQTpvGHu57TPVGH7W8Az
         cau83w8+y89tf/h30EdT8e1j0iRhyLt+qiIsva47w34C73jmqeLXgy+P0DB8FFQDz9Ks
         xa7xW6+xJMui1YPluBTvTGhjA7m8f/1y0GEJOug0bT/9zapHchyyz8GK+5gmfMsr+Tgy
         j4uKGhfnpnm3gClts/E8QPS9FlskgCozlmBJFgeKzgLPU7aXN+ISDCfOM1nyxBHfDIRC
         29mJvfDQZVcyjkAAuKkqMM0NjTSfIwkj7lbywUmyMuYvMlkwwuJ2H0ARJLhkMzO3dVvs
         zk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395188; x=1793999988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
        b=tRHDYtsv62z3Te/amM/wAQe5kA4hYf3cRRznoK4vqL34NoRg9Jyt7fX2C4QsRvhkDD
         7xSjdM+h8YUOagHt2mCfUo5Uaz4qhZZovJSY+pgdFMe6mXQpKfqYmz7nM5wUKXMfKZ/U
         ZjonJrU0DquUF9R1S7+U8biRdQGARXquYuR4IHGvWYRZOrhk8UxLSUMhpZVIxZ9gA99N
         D0D20KrNQ0sD0Q0gwW7OLaTmUx69HoBzcM3xcafxMobWNHMtEhVcrJAFTvTWGCc0XHTQ
         eIDBbx72KOI56D/eGbZ0ldkd9RvrseO7eYiHM+yIbe6JaqrT86IBi3aJ/H8FNcqT2v+e
         pq5g==
X-Forwarded-Encrypted: i=1; AKwUvBxEcoe86MBWFqlN/ckj1dPo38979QH/8Z1q+2GafdKPI3czTLA3a6GTF8+PXcAezJ5r1p/lesPzF9v8TXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbbQwQLVICP+b8aIuWfhlaTXSVK4FVUSc1zZ3In6FmI0g5+jIL
	1GNpab98IC9HOzCHqPyLHLcM9E7oHL5D9qCEBcFJF0Gl4ao7Boxl+rMkbhiX4W3+PPA5ZPaW/mI
	7KifHUBjJEei3b8NMVEq9zKjKAsSCOecHKrJAZA1zvuzA2ANDVSM4A+ZjyW8g7LNV/Is=
X-Gm-Gg: AYBFou2bNuwuJjD4YQzgYtdGZtzwxpHc5ES62SMZCeemDnKi5JsGt0c/RuUw7MVini2
	5C4Z7QqKx865/xa7n244pABMFXwYoFxiJP5q0nmwjEQJvSmbGZgBrlxYL3EOPH+jDDO58tybkL4
	MCo81IdTsaMCU3bmXnH21RI+HWFTIqL88mMCXxvOYHtRQc3UcLC3xCpBtGmxzHNFLhNw4mKSNL9
	LsI4hL17rqfJAug/z30IJgX+WNK1F/Ch/KbdZRpQ3x2lDdBdo469BM6Dms74aEySh61RHaJpgwV
	28z/hINpxXgV+Fupk4FN6Z2pMKkVtlLvBMhBkxPB1Y54HiFViMnzZWmQ3/w3QLtqDZcoXhyC8Dm
	gYeuYtFi1o8Qq308j422oll5vC7l0VIQ5s0B69L47Wm6sKqqD7o7WRD9tYS51AuOXcn7+PHJXky
	/A3tF5F88YEAJNnH6rNQxi8w==
X-Received: by 2002:a05:6a00:1f0b:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8a9beb69d8fmr3153614b3a.37.1793395188149;
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0b:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8a9beb69d8fmr3153586b3a.37.1793395187707;
        Fri, 30 Oct 2026 14:19:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2de00dsm395890b3a.35.2026.10.30.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 07/19] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Fri, 30 Oct 2026 14:18:09 -0700
Message-ID: <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: s9JPxAc31ipdaep_-NsVUJRr4fgrDHEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXxhYT74yHYGRe
 9mHVXvFE2kijquUyUDDzz2tdlCTy6dt4cAjlXXT3Ww/dspQTHI6KpechFfmcuxDET0fs2OKsXfG
 rKipvGlHoTik0SwM67Yd83q/gFeHKfxtJ8JDPkGB6HU5fB7fwaJG5Jv05Sui/Uw9tqgkJZXJQXE
 DZXPW+1/4hX30bGk+VbIA6Xrxfvki3LKGPBhckf0TQThf15/Srrj/p/x0l03H456aOLStpEXZxp
 9aSmyhlT1a6nkXplWRwfkcJqV1phNcDBr5ozCGDMC+1KZF+SC0HOg/Bh97fxrQUpdbGopqk+6Zb
 6Vs4hZxpl1WQP7oaXbX1biu2Y23H/Uu9zxJRsUcZctlRiYHlxLCoNbS3Igr5YIE539Ld6g4RkLf
 ag0l0tmjyJDPD3wkgEh94sKdTdc7QtW0hOygaGvG0z1kORkETKQPDNaVjJulTrpiLX3hS1gxqpA
 iFVqBMdssqkoUPEcMKA==
X-Proofpoint-GUID: s9JPxAc31ipdaep_-NsVUJRr4fgrDHEF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXz/huNaKuYEhZ
 DAcK1wFGfHAD7xBppxoumOHGSbDHjidK+ucZlvUo35nLUOg/ZZ9LIjHfHhIZepAHobXA5DFikeK
 Chp85tlkRCuHgCFKA1cVgH5Xi+lg6Ho=
X-Authority-Analysis: v=2.4 cv=FvOQbGrq c=1 sm=1 tr=0 ts=6ae509f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 45cd986ad4b5..8d85f6cad960 100644
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
 
@@ -793,7 +790,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1186,7 +1182,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1245,7 +1240,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 795c16d88f45..a6146372cf7e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -367,7 +367,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -387,9 +387,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -635,7 +632,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -716,7 +712,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -835,8 +831,8 @@ static int hw_init(struct msm_gpu *gpu)
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

