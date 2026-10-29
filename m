Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305114;
	b=MC9kzuh+czD2eIuCGCc/tOW4Kv7LTYnGwOJpMK7fYMMluz/M3drl1Y9tIFfw2y//JNZP
	 HGYys3nlC7s0pvBi80bgV3diagv9bFIN6KB9WTX7/MijfUlzSuNeTQD+NTBCdkHxjvTfJ
	 ASzn4JXSpVY/quCh08ngnXL6fF/1drXwE9paMUgre8dv1/OQHukS4cUgzMCSbhbIwlBml
	 JBq3fLQKfBkX9fJdGdEe4Z3CqmqtLDBHLlriNwIOwPHkv/hDxM9+b3j3V5vJbYmwuXFd7
	 o40UJEQdjmYDaYQ9yN1rNHEvPouysE85XgUXjNYibzHKu5NGNJFTr+/doPOs+NNc8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
	b=DV/VjqZAVUnw2aCqg/iMENvJCklXtZ772QOCa6dCaCxud/D76JpG7KlptQf4oq7kG/Y4
	 LqmO1x+f1k7xhRewq5VFXXrE3IyevO6sT7Zo/Z7g1lUKWt6Qc43YzG4+M34mVCzxfP5Y2
	 qBv4jjEZ+k2aIrg/FZyS4hKIAfCNf/e/OIz/tQt3ZkpUUMU62/zs9aIyrJFOaceDcnK2k
	 cam5bB5q11HMP4fwrEzs1yfXpn9vakBrc8xXo/PnqOXwaqgn56f2zTIF/r5bBQMjvGkA+
	 1rFXBIgNEnlTnV3wOA4vU3SrYwrQRPsGk9s1dreMIB4nj7sDtabHETLh+2sJkQM/Uew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iav0W22k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GENc44fV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACF2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACF2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iav0W22k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GENc44fV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjY8B1658241
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VvwcNnV3NLW
	Xl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=; b=Iav0W22k3BZYbZfSR3ckPGo/1gE
	FWkT2HilzUAgEr/H0w4QURvpmodaiDEjh4BwveztJpGEnn1pR3vt3qh+8ol80Eno
	TvL4F8le+SUWKH2wp24+hmbPNVxY94iZB2yddXJb4jU37JbeiMj4K2ErWAjEx48x
	qf/5FbgEw/nIZ0a84JryiBMmUIZ1Z0YwpVKIBIW9HzjDKEOfRwV7H3A4Z3WKS2jk
	dD6vCEpVrKlqz9lWdjFZ6KrsU4VEmCnj5LyBDa0BltQtKGUWj6yuGenlbuf1RNJO
	ymQ4Hxx+Sf51/seXZqiuMN480uTnMTEXqSec/EjgqfJGhCZt/HZoQWS8msQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmaunhhcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso4851a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305111; x=1793909911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
        b=GENc44fVs/704QnsnpQLJBpZ1/+jEUVdLeSVdr/tx0Q0mo4Y7Ip2UNFf2X45kqo0+K
         l4Qo93kSYYAu88gpyIRow+EpvOlpFbHIe1tjYNCaswqiG/nkRIVE0uEL7Yyl7b3Ki5Db
         1JsgD3RF5gvowT69ns0ywb/07ZgO6k+0gtoGE950BBk9h2AJIsyzWxgOZoGd/oNF+H92
         f3YeysyrEmfcE4a2po4/us6Q0Psf4F0iWcQQUl7GsttWe29UdClwjpnBgLp1FrWGW27c
         0S5Uvyg0drSeNlsjqPwicioXisfuip5Kh9uqc1QgigjnaEs7mMYTDUJ5oImcn/3ItPNK
         2i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305111; x=1793909911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
        b=Ukt7qMWmirpLME/glsJd9ysqupcaLZOXjI90rNLZVJpZmMmaRiG+PGEfY8YCXNeY4M
         ebEDv5YMg1IRWdvHOyyjP0Fn8S+tQ4rYZhevY21+CTrj/zyHWTM2JwczpMJE5LZb22NL
         epSf9DN4AMecCIAyUazMb/nRYF1U/01wyZGLcudQoRNoybBrO0Eqq06Hyvxuo1sIL1HF
         o+Eu5f8tscy5OTZe/N6f1YXTd7afgtpE39BrGs/ztop8sodTSK+5/yHpDMYYy7ydLjop
         ZHNOU3OWoN2KKxrpNVCDwWbS4ZM7tPTyh4kqGt76HxoI4qDQzjoK8zys/XRygfQyn7uA
         HowA==
X-Forwarded-Encrypted: i=1; AKwUvBwYYCdFcjgwj4ssTeQXiAULHuVPW12s7Nm44aNgP6FGCmtrd8Z7OIQW8XWri1nYGf2wK6lTlvTXZHrN9Cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYILMldzbEerzbpuraYlBywcshJN/+d0NRt4ZLPp6/SEVlPo1cBL
	AUI0BtyUW9hNewkwL3YEykX0+3Ft/3GR0oNPcWxPEo0+OeKxMYWHWWajFEGJ5w//1b/XPdQmTNr
	l0QDXCeuobTWwdjo04a4/D1VuvowPOYzD6OopIT0TzqfdndId3bBk1MgNR+Ncqbr5lvY=
X-Gm-Gg: AYBFou0SsQN7Yd5t+JT5fX9cPqv4xEIlHSdZuzyQdou0PoxgyzRLU31S9dgbxxdX2j6
	9lQPVMrpjAEbBqp5QIyjmdMu2bLzCeQXNokIpIgArd8/XnE/i1Aduke50Q85vh0sMngxIDMQIVK
	svyBaSY+EWHGxpVOUkbZQf1xt3mxOX9ZGGuP5G0gxGQhqzzvX9n+GA2n70h0eA2BBZ9GIMPm0Ck
	op5vWkIIlxlw78CQwY2brtW6KB9NzSk5MWa5/1/twifMQUtFWifO3ubDacPkKq0sS5HrmG1HiWB
	U0TRHvrRqu9qWcd8WfTquzDypCitwsNfDOC3gOLNTen2eiOioKPwGTIgkrlutfhm2dgUw6kLWql
	h/jqI4HyuoYNifXXAXfPqq8w7Pv7+Gr9b6fGKsrgS4oVPOCGO/9u9RaRP9lWlx3ndknRX2z/3kc
	dqqISh8O/y1Lvfcyeb/JzJlPU=
X-Received: by 2002:a17:90b:4b0c:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ae89799b08mr69738a91.49.1793305111249;
        Thu, 29 Oct 2026 13:18:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0c:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ae89799b08mr69702a91.49.1793305110672;
        Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm5336631a91.15.2026.10.29.13.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
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
Subject: [PATCH v3 15/16] drm/msm/a8xx: Switch to generated protect regs
Date: Thu, 29 Oct 2026 13:16:25 -0700
Message-ID: <20261029201730.151754-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AZb2687Vw7n91tVz0l1HctJip8T5rKj7
X-Proofpoint-GUID: AZb2687Vw7n91tVz0l1HctJip8T5rKj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX0NiEel+mGblt
 t+5nIxwI8JmveeFbtvX5URZuUG0GYPdhMAqy2RWwM0mQTRI6HaBg2eUCdlqGd6DW6q7PEKbsMKc
 qvJZlUTzfCq+Dnc4GeAspYDHSnYzOsa0w409zO1P77lqRFzYKk92O4xfNkwXOcs9al9pywvE3Pz
 7N8JXhss9wsN2Moiv/65MM9jodg8PuKvHblmHIFVFQYi1UoDGpUI6vOaSg+sU7X4fIqPnhW3HVs
 fFKtvr+iU4X6kO5nqQjrOmJyScMwY/zdyvQH9q4dv9GN5Oq5ryv9LnWtwZq/ON9NnLjLou7xLQn
 JWZjHRoaDLORoZsZXyEbwx/9eP0ioYrQRFZfmy+uqu5RFig6hYTFvJafD3vW3OJyHW0ZNsliQW8
 rwEpFdq3F8Rb9iAYOwyTKKWgUCr9q3bQFuA0PpYUeUnwNhkSMqi6DBZ+hbSrF+LgL3re9MQEmO+
 YIgvMFxVPjkGWbxweag==
X-Authority-Analysis: v=2.4 cv=It2L47/g c=1 sm=1 tr=0 ts=6ae3aa18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JcQOObtfp6PrThPhMQoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6rdHdvU1UxbZ
 ZPO4Mr4pTA625iLs0PNLHZBZJFyEnvqAHFOVZ3WHJ1IsWCxrjAx9z61zxtilp0ZQqjcW8NjtG9n
 pqCVizpYZwimZ+B1zl7dR6jr3RpdNQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

These also fix some perfcntr SEL regs which were mistakenly blocked
since we previously just copied the protect tables from downstream kgsl
(and only sometimes remembered to fix these).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 301 +---------------------
 1 file changed, 13 insertions(+), 288 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 3c9025a93445..50c121d3001c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -83,58 +83,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a830_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0381),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0001),
-	A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a830_protect, 64);
-
 static const u32 a830_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
@@ -366,63 +314,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 x285_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-
-DECLARE_ADRENO_PROTECT(x285_protect, 15);
-
 static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -525,57 +416,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a810_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0381),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0001),
-	A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a810_protect, 64);
-
 static const uint32_t a810_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
@@ -893,64 +733,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a840_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
-	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0009),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a840_protect, 15);
-
 static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
@@ -1356,67 +1138,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a850_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
-	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df5, 0x0003),
-	A6XX_PROTECT_RDONLY(0x00df9, 0x0007),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1ac00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1cc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0035),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a850_protect, 15);
-
 static const u32 a850_pwrup_reglist_regs[] = {
 	REG_A8XX_RB_CMP_NC_MODE_CNTL,
 	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
@@ -1637,7 +1358,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a830_protect,
+			.protect = &pakala_protect,
 			.nonctxt_reglist = a830_nonctxt_regs,
 			.pwrup_reglist = &a830_pwrup_reglist,
 			.dyn_pwrup_reglist = &a830_dyn_pwrup_reglist,
@@ -1682,7 +1403,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &x285_protect,
+			.protect = &glymur_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
@@ -1727,7 +1448,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a840_protect,
+			.protect = &kaanapali_protect,
 			.nonctxt_reglist = a840_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &a840_dyn_pwrup_reglist,
@@ -1773,7 +1494,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.funcs = &a8xx_gpu_funcs,
 		.zapfw = "gen80300_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a810_protect,
+			.protect = &milos_protect,
 			.nonctxt_reglist = a810_nonctxt_regs,
 			.pwrup_reglist = &a810_pwrup_reglist,
 			.dyn_pwrup_reglist = &a810_dyn_pwrup_reglist,
@@ -1816,7 +1537,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &x285_protect,
+			.protect = &glymur_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
@@ -1859,7 +1580,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a850_protect,
+			.protect = &maili_protect,
 			.nonctxt_reglist = a845_nonctxt_regs,
 			.pwrup_reglist = &a850_pwrup_reglist,
 			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
@@ -1903,7 +1624,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a850_protect,
+			.protect = &hawi_protect,
 			.nonctxt_reglist = a850_nonctxt_regs,
 			.pwrup_reglist = &a850_pwrup_reglist,
 			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
@@ -1938,6 +1659,10 @@ DECLARE_ADRENO_GPULIST(a8xx);
 
 static inline __always_unused void __build_asserts(void)
 {
-	BUILD_BUG_ON(a810_protect.count > a810_protect.count_max);
-	BUILD_BUG_ON(a830_protect.count > a830_protect.count_max);
+	BUILD_BUG_ON(glymur_protect.count > glymur_protect.count_max);
+	BUILD_BUG_ON(hawi_protect.count > hawi_protect.count_max);
+	BUILD_BUG_ON(kaanapali_protect.count > kaanapali_protect.count_max);
+	BUILD_BUG_ON(maili_protect.count > maili_protect.count_max);
+	BUILD_BUG_ON(milos_protect.count > milos_protect.count_max);
+	BUILD_BUG_ON(pakala_protect.count > pakala_protect.count_max);
 }
-- 
2.56.0

