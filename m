Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911233;
	b=wuEnhhE7Eyl+op+cR5Dve940guFkM6sUjE2RlNafx5KIKHM/MWAlxkYUnJsEdzcIe4Oo
	 fybI3VTiuNMdhPuqLIl8aBvpCuE5H0Trj1ib+heMmfUnDCBxgzpmO6GiF+CTNrbFpGQHp
	 KAxxGEf1ljt0p8W+GQyy12GFEtn6ROfkw1Oa5lS0o0MRUwEqJayleELQR4g5HECRYDLSf
	 qBX0jmUIo2ZJawGMvpER6ZE08pHgumstvw162gGrVVILNH6M3Kfx/Apvs2jDKI41RBEmP
	 nj/luC/l8+j9rwGXRaDZYbWhc2z7KhFc6i5TIFnxfAfGHzz0eGyz9boRZaSRe1/lcCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
	b=SRNjRO6OmSp4nswAo0+huuLdy/zlMRGlepG/cI3rNr8JKrwCXmR3MP+PPr+kmTYNSCi8
	 cR67fLwlXN3u+0dVbU3dgz7PVUpiDQY0t2CWpYj7LrWBRuQtXlK32KDkUVoAiNUu+oOr5
	 2VKtJjDBH884Hd1zeGDLdyEIc21QSKMlgjp6rAi1+ohoFgo1oksfh5lYiMikAsOAmXSZK
	 7d7pEXPtIYtPXeejjwbjys/w5pLzE/xOg4DKVxsneuE3K4m9c3l1CeBgEImlJlGbWUkKR
	 fC4anWKkI7xl3gUCg497FqGTnL6toSybYcHePj01DGLjNaoYvz8R+MhA7YhLeMyrC1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Al1zAIWD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/BMwuGL";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC4606EE85
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEC4606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Al1zAIWD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/BMwuGL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeOnc1440074
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/5KWrOEwbVH
	X8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=; b=Al1zAIWD+6wlTpykJoNw8YHTXIO
	yf7ZobYTscQsX/LDSc/+Lzv/zx91o9rCg2sFYHl0BMWAGydpDYcLrEwwnZ7tkEjs
	45PSbo4MXs4wGPXZIDPnEN87QqpxuLYEnBVbcDLWhqvn99vS601wH0rX1kZLPry/
	3vNL2NPAcDNbhUSVe6XCVSMMEVfgdH3ssC40S29Eu/y6/l1uSvDIXCQogjuqO0dg
	+828aoeWyy/vscCTzX8J1iOVkLZ8hAFqk/4zaUkuOcVq0cTGTiZ5h06d5YoZWjsX
	H4H9WbtOrIlKiNnGbbME16cA8l9Kb/z4FK3a4GaXAlvd1/R/DLc7Y/RXHLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3qe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso20584995ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911231; x=1794516031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
        b=g/BMwuGLTD0+9Ay/PdWhcDqwUBoy69TV8DuFqb4n/Y3QXVT8aPRckfMoMmbY+/f0Zq
         19BZv05ubRICSjPtwR8jUxu8weNW0nyKJo6dhydgh3ICyr/+0Px3aWW23cAaPdCR1knd
         wqhZeM7toqjaVDcBQeBFSOu70cBidvYubiGG1r4fgZxvgHMGJVKZUJ3MpaOfyOQ7uDtW
         T9B2Fkh8bzbYbaqibM8wEXPLvgNpabxi0K1fSUrOubUOX/HdtSKErPuo8Z2cda1nIJVv
         QulzITCVvTQs+ba3yvOoUXWvh2yh6IaUvgjKrIhBsYiXICvJliAwcmwCo2F3PYl4BYcq
         zk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911231; x=1794516031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
        b=wO3KI+KDM+NtbeQMRFbk2tuZTTCoFXgbOhYpu08fwIFWzy04LDxuziL4DCCmvJTMdz
         EHInnAZM6IuYbqx1IeWUNF7/hw4e5zH3TXCnwRtopW6PVU01l6F60m0IB4WiMpepLCjT
         BKDrvn/RQXU6n+6CYOP1+PZ0IbE1LcFsafWL8+glHBU6dAJWJY4Q77zyw4wYKFNE5ALH
         nvEl81a7bIRKScOpZ+wrPq7I/OHwCNi7kOg3dddhqYC+vqU/O4efw5Fv6XJuSseJP73O
         5W1SZDAVVHicZI+1D8pbNmiw/qtPqlZYl8NBgAxlGAKjB2yBCSKZkRWK/eTNIwWRcLsh
         q7rg==
X-Forwarded-Encrypted: i=1; AKwUvByZiySD+GJKMCqWj9+ysPIxFrC0moXqlxSC6lptRB3nlDw3y1xvC9LTSXXkoQ/fVNj1tRBEcloUygNTSVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z90LqL10Nukj76va9J8BU9JZXJsOOxkyvoh4K29j9+r71AhrCHU
	oEZtsfq3qtbxSRBvGu5glcS5ew9WwsXkm47zQm5PTEN1pmIEdObPNucMWXCzuA6Ohv2dNiWayWj
	PPpPRyipzwUOhkQqrwDp1Ff1fJMOeukrkd1hVWIpN21hTMftY8yTf/2T7e/GCcvU2U98=
X-Gm-Gg: AYBFou1LXtpmfKI1JjGrb+DKsOJbe2h+qczHr/aMrn+nlhc9cq+3VMCIzy5jKeYbZss
	Fga6Yzua7njsylrYSZtToGYj5D/Z0+m8f3EwHJvMfSK2YdZyTE2UfkysGds9uAZDx7QuufjgdtJ
	Pwy0js8oji1PwgtSIKwYxN+huqA4GzDAca+P9Zk0O9RimGj2uFsR2P6BluJ5UCEB2AvUg982vHA
	k/IJLs+uVtWrpAuaD65cylWqNZNspcyIjp0jx8BopFgZo0/F/vzRlZ6H/cT2YnKQgF1IyNWEU6T
	myL13gyYKC7SlMl4T1BWZMy6TnQ1O7Rm4dryq8khvnsF3XyiPSYcr4YDbVJ+kvUVxvF8IFy/y1F
	6DLM9OxjB6d/vghRibn9NUGjmZ35xitqZC1f4xa0us8SH4b+vjimmfo7V5dIG1c40wyNdvRSy74
	0OPLae9oTeC8kjKcFU/kMfEPs4KowM8reOjjHZSSr7mueIk5FqGI4bLDSrA9DIcQ==
X-Received: by 2002:a17:90b:3143:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b0db70569bmr142746a91.34.1793911231182;
        Thu, 05 Nov 2026 12:40:31 -0800 (PST)
X-Received: by 2002:a17:90b:3143:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b0db70569bmr142726a91.34.1793911230710;
        Thu, 05 Nov 2026 12:40:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm4953165a91.4.2026.11.05.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:29 -0800 (PST)
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
Subject: [PATCH v6 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Thu,  5 Nov 2026 12:29:31 -0800
Message-ID: <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXzWa7XXyJapXo
 xFf0r8ckzw6JajKjvVbpTLtrX/MjPsM2XakKX2bsk40/Sg0YOFNkW2ssi/qmTQlaIgbOecTKCEs
 1GLy00ETuDCiRg1UNyCzCGjp/LrgALM=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aece9bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX/TCfrzPBNQgj
 DJUAEnC59SMriUMe4I6n6H3PDTpq0M1k/vXQnx4GjmfB8FZu+0sdim9zRNa78suQkGwc04c9vNx
 n2XAVJ+gu8UOaHdQW9CmN1J+f/NuK/mOMGd7sfehAbxW+saO/wcbWxEgUFl3Hebji54gRTCM40d
 /ccB7leQJgrSmAenmTQ2HGnMgry05ZpKbML+zwVHdUqZ9EJAuboKXZX2UaPMxX9voYt+5RysfkP
 H8sBi13bXi8owkxF8nPAozqM1JMGfNE3RKmY8gTWdiy7htqByzGEOEi+LRzfmOWOZ2d6FvBB4sv
 mup5mr1//6aMjgqoI+9YmWT67E1hC7I7DivYcxM4R14w+fu0AyQdiqCuWcq6lJdh3yuqCUk2dRQ
 a+j0GliS4L2irUe15CMYbL0/+B3wD8HWLHXOwpMHvTf8mLNG2aydW5qHaI5Cd1Jh5jMZA3vHoIh
 sjfTIgkU4rukTNEjS8g==
X-Proofpoint-GUID: Y2sAYZvKfMHUoexKc5nsqTRQ6wrR_HHe
X-Proofpoint-ORIG-GUID: Y2sAYZvKfMHUoexKc5nsqTRQ6wrR_HHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a3eab0307529..dd1a5ca91812 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

