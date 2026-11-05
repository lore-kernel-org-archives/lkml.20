Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911280;
	b=AfMMnpQF5TOdQYb0MyvwlajjV5lhN9+4ncvMjM/zxZ1a3r66/VGyzd1ezWSgEcE/loJT
	 u5jGKzoVxTAXhOUKbtV1o6PMKd+Tn8Rjx+65seLJ4XybPfQ/JUlPnRGyi1xI5COiW+TeA
	 SowEV4CHGefv0DHobHKXB6kZvWJuG1CC+G8o0/Hs4lLVjCcjnONdG1FQU1F85iJz/eOoz
	 NYQO2r88mgwDJGoZQ79sIdFEawvdi5XrFkk+pS4/iLgo4h6ZzjiZx5kIIdzyDaa7jm1Jg
	 9QTT2cclsVK4WbTqvQKdnOktMgHL5/0f0RqrNCwMYVLDs7MiyLO0LRJ9UJ9FWs1T/QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
	b=hzsthxRlh1au1G8t+Jlj2hw1ct/X8X4o4+hXnJBqdAK5UJ3b6hCrwtBlOjf3/3yor+Jb
	 g3mQeHKpOQ4JqF2Sqgfeu05/GWKNiTRmG315q8eDynAUe78MnB9YZpnh9mSGfnPQ9tueS
	 YAdDS3srSQZhjfPdPLZBxY9zgamChUMUc7Atz9NwYdb0P00GlU36KZO/EFZAwGzi+MLDC
	 3p7Yn8TiMzTbKAtizlObWbLgx6Je7K2cHSWJgcg+QcUnvt53GVHJbmlPI/n6c61LdgE4R
	 pQ+RUJ1qpbRb/AwactZUy80gf9Ulf6ZcddFNoOjuUuMfOIddi08RHV/tmTgkaliNf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo+OakZ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TgWs6v80;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081F7606D82D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081F7606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo+OakZ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TgWs6v80
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeB6Q2513434
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MNMuYGUV+AB
	AHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=; b=eo+OakZ088HY+7m5Y8yjp/AZzfe
	x4iIfc17Ot7Ls/r71o9ouMsY1KfNoCYaaHyiq7duQMKMpDaTXoz2rWUUV4Jjg1xk
	C/rRzjilhpxi/QsFlpQWaY9ZUAgMOI82qPXvWIGEO03VDBZYHE3fzFu3BISokTcX
	kNjtgfH/1ctjAIsES1d1F9BEAtQ5Dx9hCYzqn+FWtaeYLdm5s6b+qMDz18F5Qee8
	4jq7BkWtsBp1KUlttwHxIhOZ7XYW7vPRX1gSdk4AVt7zmCnML3Y9/6hxad5GEew+
	qBsO6a3dqwkT8Vnpx1sYXn4kL+iIXLAgZwPA88cvLFsLicgK5Rt0Yb/4TIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatkrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:41:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so610292a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911279; x=1794516079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
        b=TgWs6v80UuhS4VfrZFMFVFG6yZLxsEOkf7DVTMu9h69JWmV63KKbLbomlp0SOqF1k7
         9JpT21we//IPxZg1ga4u7NnGjxcBVE3U8tiDGez8DiduASbb2bvQrtcgNACMVHlfPhIi
         7qgiHVvl/TnCn9HgI4DDX3RL2H3Jtf4U0dRVotR/eiAD65U/ekwu/ha8Z3QFkY+99cDl
         rCNMq/70pmOgkIjGXqFszwpj0+ZYO8t1rZyxArrtZtbpSit75MZ+ea7k8s6dibMYS06g
         m/IhDn3xoa376A/1mmMgE//V3l3BPPZlhpmQMl8WAPbLRdZwKjD2zdjXFX6D0e+aYZ12
         dQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911279; x=1794516079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
        b=DlkAnBc7kAIom1LucFEW1EI0DedF+x9YM9e4w739q/WZFvyWHpHTemv9wDHkOXdnsg
         506On17dZR8YYSwO6SltKtUHN8kqhenyWpw0p1Kx3tu0NDeL9oZJOyAbhuTr7wgPXTU3
         frJiowwjw9+xJgR7oLRPb0EYmHSscOEVs87XxAYQ4V616XdpKemrbhsdOGVAntRIE65X
         w6N2HcEQJKyXPNU+VECw5m5/gzemZxcxn9LY6CMc2/YTm60UkI1zOqlGBoL8H1Ye7jZH
         iIkIzrnSvBM44MhrlzDVGWFFz2IzarGuKWgoFRsbuFKtAhnSsf0RXddGq7EVPpd5Koag
         KflA==
X-Forwarded-Encrypted: i=1; AKwUvBzXJs+WFEtAeHBvHd3SErU7sXpccN2QW3mC0p0MytK8TUsTvhkAkuX4jSzEm6cGJ2pT8CU7JZ9u+5bOhVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KFn2vrJvoSCmdNwNzJ+9l7TU+mgU4LrB8i43STM3Wj/KIdj58
	zL523JtBcOasyOr5lajxRRdpHvIN7xG1FBThUszQqUAGwu+Pxm3LWjkNoyVXC8w31issOpYRpd0
	UQxz9urxFnHSRm32NBgemyPiFEqLlE+cX9lMUorYIVPbfWHWheAe6CmQmC0yFISufQEw=
X-Gm-Gg: AYBFou2sbTxDGAa2vJqHFulbm6n8PGoRMYxhf5e+qn+UnQ8iHCrhNX9iFMgJmE9iTqh
	TtFouFNH3ALPikFUNR2o08gvkoCqhcjoWA4CMVJ17I59Qze+DJiluBb+EjgW9oR0zFdcMoaEII5
	VBg5c77atjMRJw9frcJuStn+utvuC8vBkkNGF1NeuTJ1EYbcfFMuqzv3p1Rs9MWeFyurwl1nZ6K
	0QqB9NS3dzChM29Y0CmbvkSLtyrC3C22Wirp7f6dbFh+ErDH4wpfU6xvl0i6pqR2GA/eM3Nqzmr
	rX2cL7IbLsP60R1ClmALcGPFNdxWcGDnE6A1ZY89zN1sofqGYuWnm4rRGfSM8x2aTr/0bfICL6l
	BS/m3Kv68+wDSRtbGuDgSq2F3eQYoN32oAovaYG3KnGZDnRbqqznpzYcmT0fsQvgsx7GuRbuya1
	sf6tD24vTgjpc1+malU6C2cTU8Lg6s9F8JHCZ8LTE6jFjGIXex5nrP/LjH+dB34g==
X-Received: by 2002:a17:90b:3889:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b0db7232edmr151524a91.62.1793911278614;
        Thu, 05 Nov 2026 12:41:18 -0800 (PST)
X-Received: by 2002:a17:90b:3889:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b0db7232edmr151491a91.62.1793911278094;
        Thu, 05 Nov 2026 12:41:18 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm4090015a91.3.2026.11.05.12.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:41:13 -0800 (PST)
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
Subject: [PATCH v6 12/15] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
Date: Thu,  5 Nov 2026 12:29:38 -0800
Message-ID: <20261105203057.66520-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX6idupRbhZBPT
 K8tLHj4lEb02lywypTTQmlQZR8ReJDjTY7J5639kr4m1KMdByD7Mih4e0OxNRx7tF3ICVIB4/PR
 heLWHkdPEkkPQyXaxTtYvF699eLpyPE=
X-Proofpoint-ORIG-GUID: h4z86SleGpL8QRcsCT-knlzJl2NTdAcC
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece9ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=GwKEIKth3DexCsueK50A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXxw4KdzGNRvXT
 7K1NN1eXCkbum0k37nyizPv1alsvv9pCLNJ8XKYLbdnqQDAzEoaBfdnJaF81B/W84yODrq1MBbO
 IqiKk9FPpry7IHa4r7bqV7Xmz+2nFXYQ0gD4gNSSl9j/LZmkCrXzVBcr6YOBX+l1WeYjFYgC4+W
 wmr+aNg3vPLvjusGB3jz9BhrPG8F4Q8c3knG4Qd/O2hIoHF9wLC7JVpfQQ/s1YOt1P0foRiEFxy
 W1SShHJ8eT/UynJFPwmD9MnCkRp2z8tOr2mhFPQXIOFXsdbIF1t0CgeilsONVLq4uOxixvdURZ9
 xmaYQIqUFgmbbJiZgPeGYXzl/xKkoMtPOWUD2jAVdVWrw8O7vnGNy3xYMKHtNmO1MG+OTkATDb2
 5vIwanCcjjd4g7soIjYjodn613/LnCjk6s8rHWTGNUfKwnPoTSGWagdxkbvYRs7ZUt3PMae+BOs
 6qjlwNsTTPyrJia7n1g==
X-Proofpoint-GUID: h4z86SleGpL8QRcsCT-knlzJl2NTdAcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
than missing to restore one somewhere, just add them all to the pwrup
reglist.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index f20198125daf..113a31158f8f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -276,6 +276,21 @@ static const struct adreno_reglist_pipe a830_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -437,6 +452,21 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -670,6 +700,21 @@ DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
 
 static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -999,6 +1044,21 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -1448,6 +1508,21 @@ static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
-- 
2.56.0

