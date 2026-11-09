Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234092;
	b=0eYMFp7hqzMLlAqFCajEnSTRsIs5ZMTX2aqIqPzoMT1sNrvAnxhoLWyOA0jj0qUHIE4G
	 bzHw/nqqcDNSZIysg4kZx2cembjbCZUjf7+INE3p3pssNxP/VvkP3D3ph17vU5ewnzH8O
	 iEvCdREnW4lm9lZaChOfz9YMfYXAC58FwEbRoRsJpAb2H8P/3q6pMvOscQlkHdzRCQipd
	 y7aQVfcfVCuFxccd7JzQOFD7XqhIiigYZM524ivUpDDowt/kKcT9NLIKwtJOObpZT1cqi
	 pl1hwJrDer41xquOIII5jEYT4yzguLNgE+32vjdyhAM0pfq2wpS3+NZb5j9SJcaoEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
	b=urQQf+2L/6ITgpR0B7KD+ZSMEcuvRAX3WcN9pTzE5PjaoQSIPX8B41xN7BQo6LdBoWuS
	 jbLJRUST61Opqr1cV5kc3s+tiRjxZswuFLpRyVOSGHQ3esWZKor996AokfDV1REez3/xk
	 ffkJAc2KPcUPCNOD/vn8uGq3IJp6f887ple+YRZkhrwmbnaJhKvqXUK7OtgqcC7a2lzg8
	 AyvRuS4/M7FKN8UoaEya8nE6TBYDCBCkIHaPdLCLWKbcI5W3utwgWVM6Ukrr9RpFw1g5w
	 k86PAplwH5M3NR5F5YTAx8ImaAyTtDV68/hc/wOr3vs9QA4uw1EqvMlajAaT9xsShBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HeOeUqWP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W9/pO6SJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C91606EEA4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C91606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HeOeUqWP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W9/pO6SJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFLML971519
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDl6oZ2XOhk
	k26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=; b=HeOeUqWPjLcPxE/KbIHRW6UMsnm
	kV7Sem4Seb0edhQJvNXTkknowLA1bFLiI83fkfr7KjWC6B9ZXEA5MT9SD7bHDWEv
	oFwvrdsIhlVao+MRbCufOxzuEmcW7DlFgcdIWb7CG5RHNSY4Z3ShQGADvBh5ncDm
	qo9KoyjNtOhvTCatuOwwlZn9qv//MpcklHAdw5t6HwLlRa7lRjhA6nYnXfc3O8sZ
	mI9wfemScIChpgsdk8eex6/B5ugZwJcyaiO/9HfDDhwCinZYXJsND8g3GJ20foNY
	LxaOxcF8opP84BYDnz+J3oQhxRItIXr3v5TMtajIZk658CjI1F52oURaRMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3h4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so1148299b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234089; x=1794838889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=W9/pO6SJQYHQzw0u7zh4Sc7v8QxzaYB/MLPnAxj5C9VtenG7SFJEySG+8ZWIQeXxpo
         Zy21dCdwkmgC5Ron1zm1SkWeulBf68XTrCu7Jg5ADYQv+N7VArsp8p66gUWWkC+OGgEU
         r+diFGaGF4EdcjfIf+08rgkMqwHizx5/9EH1hOqg3VArAR2RHt4d3ddlIRR6oha/6xXm
         ry92jd+JnNu0o9dztr5dqxiu9TI3Q0bvuHWYdd/oNe7Yl19M0hoG0gJFkv064UjPlnH2
         Owizxi/eOBE6jrb9i4GG6Wu2/jbRO153K6vX9yn+nT+h6JcG6TfwxaJVe/Pc19rK6LJ6
         tljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234089; x=1794838889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=aupbBqekwdfHICaQusOf1LjdhxLOCqqxIeFShQmzBf7sP63IYSAVbwk/rb4P//sIrB
         BviqZ60yl2zsZCga7Bjnf/A2eWeUNMGQCFZ9wx06cxeLTKe0IDtpTKX7fiQFvjkKdcru
         /OdtcEjPhyZWUaot2PaiGRVH+wJeS7OcUv1nBRm18CMRqjO5LGUP17Z15EgvDB8eF59u
         d/CWx4sNHNqpP2JYe696edh5Zq0AKb0eXcZ+729yDAu1r3wJl6pdMA5Eon/CgrY9onuC
         YIOulx+rBn6Ts891xf4HJl13DhF4RUYwSexU55ddTRr537VhfJlI5C1N2UOsKb9BgTsH
         aAuA==
X-Forwarded-Encrypted: i=1; AL+hErEdDT05r8X1CDN+cewW5JBm+4fQRKPry6+K3C7r+tIV6OtApizUHXcSxNa6WO+R/oLnSWuY7E1PIYhWI54=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KANE8SiaBPHmFryeiAei0Lr7Y2REKtWJOGtEL810x6pFcmVUy
	6Uj/Ck/R770RSPSDbK7w2KgJWtkG7Agfa0j9ObHRk+GZ9xX2FfGf+KljIWwUORps6dm9LsPah2r
	uh2SfNAtBf7rf5qMrzfAka2Yz4tF+EEJdJf4pTfbk0oES62PJ+8PwUTWeNyZ30Nv6qsA=
X-Gm-Gg: AYBFou0vLmLjmBJA6dKoLLEAPk+ciEX7ehIWEvQlbJPYlYKxrugsbBQ6FyFVrtjsrUT
	+7FUwN/keCD2cBPuaCmTwPTz5PuifVuW4hL0XQGzCvKSZYyZXVEaOntDiB+PRlSc69simNS5BZI
	bTspCQ56JsGO4SXN6YRL1GSbomJAxu4+fWbLTh4CXO4zfuEr4W086WNiifrSl7sHhtVUTxlJSs5
	cLJxyCbFKsD0Jk0AIrefNFcs2o6jKoRoEYaWgGJUuwGjjpxLZDHu3xrqh6sB2A0fUg8MhgCdDDj
	tRSgKxK+zBckozp1hfsY+hJPWbHW4x7MAn5OM8NCy+ddODnAdhHl/AI2lXeRTNBW/v66lk+liV2
	WQlFYPxGXesj/ideTXqfiNO2awp7HWFmdTyD/UZ6dr4a2gIlc4A1lg9V05juiOy2FUcr5foiYg1
	0m7ZzIynek1aquUdqb1fbtcqmrkR5/+6CB7E9dMNIcfakGPn+jYekeeG8zgoVX/A==
X-Received: by 2002:a05:6a00:2e9a:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8b670d06b6bmr3720676b3a.60.1794234089451;
        Mon, 09 Nov 2026 06:21:29 -0800 (PST)
X-Received: by 2002:a05:6a00:2e9a:b0:892:e080:4edb with SMTP id d2e1a72fcca58-8b670d06b6bmr3720643b3a.60.1794234088997;
        Mon, 09 Nov 2026 06:21:28 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a1e6240sm1391192b3a.53.2026.11.09.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:28 -0800 (PST)
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
Subject: [PATCH v8 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Mon,  9 Nov 2026 06:19:53 -0800
Message-ID: <20261109142111.256630-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX0KkRKYjpeMGk
 8zyOiXRD14OeH7kEFAgpMkFhYFUBFeFxXjh7tvK1pdKVZOkTFuAjTjQcr01355IYjh4lPwDfY2C
 0dNIdiZ41pJFEIQQWsVUN3HXgubBDtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX6FN1xON36Ox7
 k3mnI4G9xrXtfK/ArXUITTIRbOGB4mApqeUamRkPsiTtHoubaEIz4Rlt8QMqptNo7PnVGExYKR+
 FEpBI4VP8MhCwiCEejjyJmRBusDs/yKAe//Za9hyCPY7Zw0kqnOfCZ7WEvi5jF9c6SSEQJkiE74
 zTEF07Ww5MGxcvohrTxUF7Q9NN1DYM22hJJadTh1EAK2TUWpu80UUui8+6S9fyuiJxAFffO42+u
 PenEaIsTSydv6LHsYg2ub07NcFk/HiTjnwGtJyqZKiZv3s+yjtv23Rye2r2NSomUIvn6Vlga7P6
 /NTIs67vm1cca8jysIF26OcxvVriOBYRgO1kidlT85YrQh8hKukvHTffegHVY3ycRitACLGD25B
 XMYK3hnkg5vP+j9G+sVdAJzYE9G4C9kvn3EhPQH0oniJUrCSTIQ0tLkXd8KqRKsM6PlkPosb5pb
 eIZbuPkpJgs7NDXYhuQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d6ea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mUYODWr3ktU2KMGla8GBnwdGCF2r1ej0
X-Proofpoint-ORIG-GUID: mUYODWr3ktU2KMGla8GBnwdGCF2r1ej0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

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

