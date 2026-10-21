Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615971;
	b=YGA/F9Ixgl10b52V2/65Ra4HT5QiUigeQ7wfN1AuLerMHnyLXK65RB5LVIozJ7XbsB0k
	 kLCFdya3fnGOKI2rhzDe9HnhouKxo3M+SsetPz4J6UACGMmOEE42ii3rQkhgMH1XW08Dh
	 e2zbpbfkcfv2vK5i/Ux5j6WZljEu1PBC8UIsOutOdm+4UxmC4Zv0FgBgJW0PxAgSQrHIL
	 LObQoitPhOVBciwjuiyTSp4XQySAN1NsA58zkX0pxIP+VrHYdVJsRf7HIcdsRaZVbn78q
	 OjJVHKEX4o6RK0EwI1sCL5ndMqfM7zUv51SujrBPB7BfImAdPWWnYPqC3kbZ/bo6lDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
	b=heZLJzypxOLCEBMbN9fKceFiaKI0+cWJAsD5o75tvlPmm/W+Ihu4p+aeNQapXoyOmYho
	 eAknJL9xqh/kNvQYoFRXTXcwQs0beQSfU8aqhj7EVdAgrCtiQks9WsTTebf7AcKw241TZ
	 ZjXpYhGfvI7xcQeVXZo4SSCioiQLj3EYL/Xs1XcmYzpWrt1r8cqJJd2g1wVyISiUjqUcI
	 J3O+egzoZMHi1/eIppKL6nEAPF33CSbMVUjKGPeYg5Ce1t6yb4pDadeSCalQ1wGky/w16
	 HChB7oBWZLVjZMUnAFglvDQcOilhGFbH9hYdsEFpafUi06bcEdlf1Z68my3RMnAPlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EAzfE6D3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EBUKS6BO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446D0606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446D0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EAzfE6D3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EBUKS6BO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeXBo1502598
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+oVnjuYPbq3
	UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=; b=EAzfE6D3TvUrYnj9Y2k7DekNbzb
	5jW1oBwFZJ9sQDZMeAn45dNYvU2YqR03YoNbP/xMyvS905N8CsXx/0je/A32Ee/G
	KRsaKPbkSvoM4+5BJpmqyKxuChIayIGhTtAB8IbimFovRguom62Q/bsWfStNnIdZ
	KyZmJutjzq0vCWw28c8x3LwDmBhZY0ZAKhpFjGS61T8VWSm6/cxgyJ3vzHTbnm5Z
	IX7xhs03xfIecnmIbmXjTHNTtC39Halrbg1e5VAMWOFp55ruw81jieSqlvJDLWuG
	sEnXu6Peydzjy0bvBHxrlrx3YAzy/THjRYKVT0lfL26AyNnBkFk9KBFJDJg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2h3px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so139055a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615968; x=1793220768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=EBUKS6BOC9re6QaHlB4lIBlczsUthqzR75lnghvanrUu0JfKdVc9dH9M3kzxPE4RrZ
         579DlLPYiOGG/d9jXf/T0A5jdtPeeMolQGOHcmxWLtfCpwQf8DXkO362mMhW5h8CRPxs
         3iM6lgX4Azwsaa06UEJd8fSHZ91j7UdbyzbeP7d7QUKXBfrkPo8iNfnd30/P/Xn/DoRf
         SwKqtyGRcPQhlo9W2gJWbsxeJX65/WAdHNhDKAgKfmywJo/Wfn8TBYUVpoZyypsiDijk
         Vr43O6vzWx8sCakuVo8NEwP2vkh+ACj96hgNtY1NjQrkeYxr+Wct7EPay+Xe6sQDOeEU
         aIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615968; x=1793220768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=C+Ka2eecK+AuQuO+b8/JQkBirzecSswhY2W+S5PtvVwmTf4CgSPok5G0oNaifxtRBS
         FzWbFIh1pu7OxS/ObXkvfZBSJM1YbsOx3nqKOR+WdJ1N2aUm5rVd4FLMWHtUtAfTLP9K
         LbY8OJOVIPWVzxVQKTQr2M7bxhgu1CD/Xkc5j78ZO7P1JX0czschGGZeNs+csQcn8RUG
         eMaboeAR2g4Gbn0GjtDfP6m39RpE8Qzta/uTIXD960KmkW0DF1pbjPp1h5n6CsLE86DM
         2G/hNdxFD7dymR7alHBQ9S1xbeIi7J/yyP2Pj6PRkOX968B9Mrft5XUyYUnewHONfVcq
         BS8g==
X-Forwarded-Encrypted: i=1; AKwUvBxspQmxzWMHwYN4Ya/3YvFfmNEUo/bhIi3gdvlxcziFlHRZSuST89ZrbeoMqygzallFLN4St4BDyjhFj3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWVkZfO5ckdmVVULgbBJzoghPKFKpeSMptfiACK8CJHOsvDs8z
	Ux+9s+YBsBkGW9733PG8N09pubj1PTLht6LMta/bKbHrJCY/ALlPAvDIMl5V3DMO5WQBPMfoo7W
	uTpfoAA+d+YeK6rnBLyb9IG/Mf3vpqObFj8hg5KBOg7E13EswfnJcXE9xTgrRIdPr5xk=
X-Gm-Gg: AYBFou3XxPpYCK98UvljqSL5VmTBKNhngDggqdeSh0jI/cSLWenCiGpdvEd/FFZS3SR
	EZMVS1/dhCN5nHQZ7pYz4qm2A0ShJm53bTk78lvitnWF2my8tEAAJvswCFh0f76TfSxiWMN6LI7
	wVK1cQcY8lPKHAIBqEbB2XjgKL6cYq4voI1jAybwwUWvqhsU9C7bxVOyjehfesvmaiC3wylBdwH
	rvD5ItmAn1q0FWhz8KpKhK+DtfnmMPU/8BYmMOol6rq2RO8kMqTN4t6lVGz8AvJmmZqumrbdBGb
	+eIS86KeDS1ElxZ6ISrSxo0Nx0nRX+tsIzuSxvszRqJTUXjtWHXkmdgW1dhjXOTvpxt1vMAYR5L
	lArpEWqT0ZxT8uQ/V5QOjyqtED1EfWg+msB0OEgOHim1p1LaZ
X-Received: by 2002:a17:90a:dfcb:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ad86d1bc63mr2195145a91.31.1792615968204;
        Wed, 21 Oct 2026 13:52:48 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcb:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ad86d1bc63mr2195105a91.31.1792615967513;
        Wed, 21 Oct 2026 13:52:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83466e46sm3157774a91.1.2026.10.21.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
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
Subject: [PATCH v2 07/14] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Wed, 21 Oct 2026 13:41:32 -0700
Message-ID: <20261021204244.67160-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXwFU2zVRrUldx
 RdwZzGRQlDT2s/YPcU1G1gH2w16TPfvlSPd9j9L9Eyb6uFxTTxhuQ5OcCz2uMXz9oE65OfsjEjI
 5dzCl6a5r46zrhOCFWwy0XBQtZdDNqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX9M76yYJPrrH6
 /iJTeEItbgZ3QE7kI7erZPAvbTY8h5UAOMTKs6oPuJIG8mbbx14YqNJd2NE9E/iPYSy4t56St1w
 P+ZSzZEjD+dV4/8Ul2APE73FoMUX16havvhAQeummaqsKE7+SkYknOpDlw7rkHnNk/CqAnZmsJV
 St9ktVtMn5VZ1bjhUWs+CsnKzb0p4AtEqwqLT70SyYPJ6+m/dvrSQqGl7n/d6yo/dSVSbTHnYXu
 MAjVL7Nfn4J2Q+59S9TSvJ9XlbcHiKvI7o45EiPk5hdc2Kfi5x1MQbSaKriTr0+WAsBXgya3uVA
 BhE0T7364a+dlsdZv2T6H3zgiDjcdBR03P5Yn1JubLj4VlETVK2XSrjFhAnUGCe5faENXrhNrjv
 c5ZljMiJbaBC+MeCUbbZ3NMumZk6GIahLYkFYElSTWm5gzx9dY4wC3rxitvUGrkZz2qoKhxqmZd
 HxSnuAQ7jT62gbFvAzw==
X-Proofpoint-ORIG-GUID: WxGDUavUMe2Tvmkvkwa-2sXfjXNQQ1UY
X-Proofpoint-GUID: WxGDUavUMe2Tvmkvkwa-2sXfjXNQQ1UY
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad92621 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

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

