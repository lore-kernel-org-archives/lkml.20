Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827255;
	b=wINhQozEiTjazHCfyPnA0ffOh9aPZAOf4oHtWXz94f4XGy4/MURJdE+BIm6eQOqYovKz
	 rOjpY0smF4ZkSxkmhLYroSo/H85bEzW7qLQ3Rg40H44eRKQ2i2Iu5cA0kusrr4P2Pw6AJ
	 EA6/X8OUhypknoZf9CcpHBlxo7Nk0wJgh5jCOKA4JyYdhsYxPQo8jrZCxBajI28MPfjf1
	 avl+Iif14EnNEq2MKQlTvglldtUmF3ngq6eP1NXg0SfQXs0e2MjvXThWryVgKzQ+oHm4h
	 bobJ1kJRiGsyp/qLxG6IxjR7oH4lmSJN9f1HY3oSUc81I9abLrRsRUAZp6TpK/DxPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
	b=hPPBgymgb2vjpZukJcqYLszHjJblPELeVNOazTzfJ5eKvJWDgHkqFi4qmCvDLqaIxFLE
	 7FhupT1/Gy//02SPG2UXBSW88cUcVm5oMh7+VZ/v2EXFileBd4ky/6E4kUBvV8kPLdQ7S
	 bR8VWPDV4vIlQFoSFWxGA1+4enD0bx8++zH+z6+r850aVPZsmEF+hqwGBroXbW64VA3MQ
	 2WBb5YH+E1RCCpu9/VL5b//QHW/kljBOvkTVWHiV3tK+CGVKf7BulhKPVBufuPy0Hmwna
	 +jjtOVwk82slgFfAjjKTR69u30etABnEHVR2J5aWZjqirTTM7+hdcAH0mDW5W1EGl8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZcViku7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+CKUxcF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E783606A855
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E783606A855
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZcViku7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+CKUxcF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjLoF3209000
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 21:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+
	TwwXTsBA=; b=pZcViku7H4Fjlh21+DQI8d+N0Hb31e4A+kmcH+KR/ajU+Kxr70y
	6ube28YhNeyGFQMQ+rJtJMPogBDoTl6Pkj+Q7oA0EzDDuO5/x6lfiwpG5cqMCKs8
	oXwyOHcmVhwQ+CBw41KaYLfek8u9OAeIa9elERR32E64KRRFAtELj9pekYfC7Ofg
	uXnwSwW41FxzWPIWY/jlmw4PegSwmUKWeQh9RDdXoX94ABLvieiA5XTEEbWkeeDB
	FV5Dm6BI+LtYf0F/NiIdTUQYpG8MctSsTjIas7wMPItBYzaAqrs1OQkSQwrJOqEt
	rYJCiMUoAAiOgk5Kn8XxFOPHacrCaTE15pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj1q2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:20:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1505915a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793827254; x=1794432054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
        b=d+CKUxcFbSpfNBPOOt3G52D4WwgZkesEx1FDbm3DjwgwD6ssa1Hb30FzfMozVJtppp
         6aFE53TmO85mHF8uKSXWXDs6zc1G+cGVwgjXGYVAJX9W2dTuBjaD04yQjEQ4U6E5HUl5
         BEFkrbbHUhYR/6uKUAxA5EiA413Gsr1P3KHckc+rZG1ci4+BmlT3oQVgNGZ/BByD9Yby
         m//Cl7riNeTnh6K+qy5bsYWAYq1V+ZSzuEuA9c1M0KfJuHU2ln4yDgHi9LReS3OvJac/
         n/iY5gIRK8Fsn3nCqsm+XHqFL7hbYFgdsk059gFcUGYQXEJ4LdztoViyO21FLAXo67un
         JW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827254; x=1794432054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
        b=LrxVXchZlXLmw6n6uJawRKdWmiunYufcwi5xvdDd9+hcDIHUZ8jj8b3AWhIhe1RRBa
         PRh+gT6CQr134swEroln+cTb/yylsWKbSXRYOBwUc3Jt4JkoDs7Rexxr+Ya8NW+3P4MH
         VY+iiUsDo32wjWP8lC39H1lMceODjQR6ch/hqPvirF0kmLSc45WfV8O2LmDGHIp3+JJ8
         axWwFh1J43AUQWEC5Bj7jHMZ2SoiWZOlUrJUbT7oCIMZDDehRWaeDgkUws6Z6pL31y7G
         AgHxkc2S6KToD5O9iAcuy+8ZlSjY77UmX3V93MQJAL9Xppm/G0zznjptCa71atigrD+5
         wLFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpHtqo7xpRyRaXauVmXwXfn7CcY86mtpFX6ydxRuDjMpy/EmrtbfPjx1PGaHSPG5+a/Y0QkREPwWQytBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6/to1VZftGgqJtCofrNGMChAhCYuCMHD/xGSmA2fmtpFAlvmu
	n4uz/Xe93ENkMAmGp8NvD/yDT2OOUl9F42Vhwv9nzUJ8oxwV+S+syqpS6vETNU7xGe55jFbdWVQ
	NLQD5mfryhgbgSxkJOHiXJ8iToAmK0iWgBet/T3epCvushWlaYoYiy2aqMxoUkjvLAvg=
X-Gm-Gg: AYBFou0UVBnj8v85Flm49E3j5EP7sEgsGEwW3i7PYOSjVseXnI0Fya0mywHjI1jYSu3
	e0iU96ia/bB4n/nUgQeZd51l70w04KqhZp7vFPnNtYV0DctARtKQ4WtuEG8+5Ayiq88PMByTGJS
	UDn0Wbi1rRjGlqyNjeSIjIWqSk8DVasOqj1NvRgqKrMen9u93uJunfQQX3zNVWBAJy4F22kmbWy
	KZYKGYPXAa3rEdT+ZQ3aR5fIjDQ6tDg0KraXx7Em85FX1BeivOLWHgiP5FdE3EHvTy83bEPIVuD
	TpcdXLpzihFM1YfcB4vSmbErTIggTDalPT7CPcfRJNSeuDG/mWCu9UV3NGEVbakYkTVxM6NKsrF
	GLkJp5JauGQXxTYPTWeOhBGF5NabwA9mEF5RWE+uUWvNU+WNZxLvot83nujqmOwIoekkk9QXsYL
	AyGpsfiNqisNwy4bK6qhf5PuUX+BniyPpfIOTtMw2WfQC5tbX8/WupyPOELBKP
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr13706654a91.8.1793827253809;
        Wed, 04 Nov 2026 13:20:53 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr13706633a91.8.1793827253328;
        Wed, 04 Nov 2026 13:20:53 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm554517a91.5.2026.11.04.13.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:20:52 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: Fix 1/2b alpha filtering precision
Date: Wed,  4 Nov 2026 13:20:47 -0800
Message-ID: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4NSBTYWx0ZWRfX5/N8PuWP7xjY
 KLrM1rbvn9HOCiPUp9MtMUj610g+kgyneDL9aA3JbMCwHgIp3KOPuTxE9C4DOhlYsoRP7uvc/FI
 wKBcIZHCcHr6ISEGOyCZ7w0rTbNCyJZLgMpllK16s9DPFDuQFX7YdDpRly1jfXOyhD4xuVj/LjM
 XLL4cMLYGwwgi6KD/4/aWzkBBiUKfM1kFOqtLnEaDDK3KawVt/CTMgbnLVao63tDTphS0F1QvC9
 f7OcUYDgmDz6UvkPB15kLnCt3z0rZmUIK+6WBA56MKmGngnNulrmbzIHkz6VZM/XN8DRDMJaiLU
 q0ycnA+Z3z7MuILM6NDtjTRr7iHvyJCYGMRRp91igo+NWHeav6TbT0yQ4jeIs5hXcqGMhyIzCeO
 AGIay6K/V3vNGRtwU2Y2I0VRX+VhOSw75EZXeUo4kqlCOYfkZMdqDqSo1OHEPrlHEMRBaaudvlt
 nZhMOU0bfkreZOERqGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4NSBTYWx0ZWRfX9L31XXuGPDaE
 HKemL8kLn1YKZpmcJswJSmXI7yxEEjNVSRTKiLQSXBcbE7JpsChehNr/Lfx22csvLBMjAthS39T
 okUcg8uZdYGE2hl8vNZzpVCc9WckR8E=
X-Proofpoint-ORIG-GUID: 4Tm7Rr40LFOvYR6kNnellsZ867n3bwso
X-Proofpoint-GUID: 4Tm7Rr40LFOvYR6kNnellsZ867n3bwso
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeba1b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=V2sgnzSHAAAA:8
 a=EUspDBNiAAAA:8 a=4RKTuTdSK_1GKjLeyWkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040085

Need to set b25 in TPL1_DBG_ECO_CNTL1 on all gen8.

Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a7d9ccf26493..510c2f6017db 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -61,7 +61,7 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* Enable cubemap small miplevel optimization settings */
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
 	/* Disable tag bank id hashing */
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
@@ -297,7 +297,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -397,7 +397,7 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
 	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -630,7 +630,7 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -972,7 +972,7 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
@@ -1030,7 +1030,7 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
-- 
2.56.0

