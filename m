Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305076;
	b=ibGWJsDTr1+fCefQuLPa54kqBmG3NlF/XRCuf0+Qm/OH/zFHF88b1lyFABZdj4NzLPFW
	 Yul8iCTv7SLOTLqurouQHPWpUmXZvf/IAZEubhex+Yltx3+xvPqlE5gkNNhyEgzWD5mkd
	 +E8KdvT7cdBw6hTCBmnnIqcV63i+RMjQOvcpOruZCqhGxIHol9528KYW0KU8jcLw6EA8N
	 r1uSieXsocVzg1lUD8K7X8ePqNcn0J0qS2p6SuK5i4yWH5nWqWUwo7CdnajzkIjUDYl+P
	 9np/9xSf1hNmOCzO7AHjzQYb7fUt5YJAz2VSgpEaZ11GQbvvCUdyM9uSH/wlcKEGbUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305076;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
	b=P8UIoFpyGmXAWoSfPgKhQ2HwuwEgWzmblbGwtoDUKra3EiozD0CQwiL7tVn3xy82irxd
	 bCCJhea356WUBf0gxZ9OkLb7zQW22ltgZUn8pDFoCvBYYea7s3XJj1Ua/pKvLb337lU2z
	 WElNUScXaof/ov5XEDN70ilZg551kiAtYYGIFhT6/NQLM9PIIa8+QS00jzL3iPgEgSL3Q
	 UNaPp9d+ruClLAZtRjIdp+9jFeCKLdqTZ/U8ivZ+ULEoiLsZnAGdoPLsDqupHKx7PXw9M
	 8SuNMgxyYmtXEKOfFcKk+Q7rAH9EyxEUfNRmTuF8ALewy6QOkAp8U/z+hgfpcZdknIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RUJb+C1u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/oC/OeK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E360A261F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396E360A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RUJb+C1u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/oC/OeK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk2QW775013
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0EyBq73M3y6
	JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=; b=RUJb+C1uIXul3rvMM8q4C1F/pTw
	EcDYyvLPztQ+MGVPjVr37Pmw0wKk14hbKkIFGQbQZ5YcIApI1KGYS1dWQ0mEDqKC
	LXebNeBDrKFLuyqz/tiYZCS8irilnPkV2BWE9uXJ9unSsTg6ssJ31FTO9nw+pQuW
	sGRluaZm5qcnTMZ/qF8QAEqoZOHaVTwVRWJF9n1vC9EHHaQSv6JYf1VIdj4y2ai0
	QZyToY0lS1uMYiVjufvxf3clqaZUiKlj/Vr3ptEDu5zpSy/JEBqCLPUTBsxZVo0T
	niN5xF50JvKa7YPw2iQW+psHapqANuHmgdtKXl6UTZO2iX5pzqmrDz/NwHQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhr44y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1576991a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305074; x=1793909874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=G/oC/OeKUZwzk6KkRQWsuyDba9sXjQyT5E9IfWn4gwt4Utr171UBDjU3zUbHoLqEd6
         Oz/LSV/A/soEgwJhsycJFoJUjLv3TbIq9o/nDuCMrsiJnWaPvCvWME0PxDqwoz3wB41y
         ChZxBGSGbnXYptA11OS7VcqtONyjGpgc2QutpROvusAfsV7oY6+NuWDO1zvPVZLCMUio
         WdbvLMeMZmu2SKIOZ6gG1iQRylJXanXARKW1JNmzwp/PZKW+c1owxp2VFzbsUBFl8Q/G
         fZWa2yt4mWJ7QAmJPdWmiirS+hT7ZHWC7bNWWUk+fBZSii74huGOUIYII/OLc90noqii
         65pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305074; x=1793909874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=RRkbCDYYPa6jA76/vBYFQEIKphqBCAW2bGTK34t6b4YHJfWdkhpeqvUxWedoTuUEbG
         N0ywNw7XoUVA+AUzhAgQ/OXwlyGYDTbzv6fPBRcoGxx7/RkmlvLMGy01QjPWe5F8tjo+
         NkI+gwvxpsUIdzdy/4RAuwc1tqrATZcbze0lNmwfEUtkWlc04uXVHAkkQ2Iu1RpHLdKW
         BEUade8uQU5DX1fuuH6cAIvFyqLiHOa/0TtRALfZUtUj/ZAFBUgbopqfiVFHuBtmOBAU
         jy/73pQ/QR+PoWaLC+yPUus7winkA8+Vvb1tr7U3NYf+/ZRo0mXeAllevL614AtdBva9
         EMHA==
X-Forwarded-Encrypted: i=1; AKwUvBxuxph7qfuOzoo/Ch6I5IrC7mPUuVXQJyZ+GY6o6Ox95WB3cYtP8SuCwtRAOk6birWp4SBqgdCK3UO5rq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHcdOaf9Y2vdEllzauKLfK9dSbTNfU8kMRbu/dK0GV69oAHzjm
	WUMhKhjzkM8e00HzfwmhOHTETnqJSUAE70WtKUuoLpGBrItlBL/TDxU43y1YpRLPMUZZJM0TTH4
	zeHDsS9SLXkhFNJW+wbpflbBuMwgPxAHFFX5Gd+ZJaiZmr07y8y1nTigJ/5KqxdZwwzE=
X-Gm-Gg: AYBFou3kvcMDk9hm7nL4ZOV7p1UIzKmYvl7X4m9KFA2FKbj/PnHRS+hvkE/gm5Wc6Mj
	VaGUSDvVgzZdp6iXgbjd6bLxYPOQ77h1TD9j5YSZOLhm37N/PWncSCFizOHc7NcktRMOAM0jdU0
	LvHyFugqX7PBW3M3OonuVsj/3gJYi4ux9AUsUVy75EaV/OAsqb/rKhx0n7lPvtbBBGb72LfGHRA
	/VE2bF6ovwhBFqq1MldJS5SBDPyjuPc1AgUz+25eAC2aJdVtgo5aUwAFNhqoRfhMVFNeqsubGh9
	qc8SF/i11Js4nxnWN4aXAg8PZ2XmwQv6nGf5jIeFQzb4BxvoMr5MLj6CVZbM0T+5JeQe3LtWwHL
	P8aSjbyCqduNjtIMx25cOhwrNnF+OjpyNOyb/cQWBg2Sm4ds6yi+B5yPn+OvLge7iL9MlqjrPJK
	DqTbSVtOI+zpeOrxyGVa2XEA==
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr58255a91.55.1793305074212;
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr58235a91.55.1793305073770;
        Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm102052a91.2.2026.10.29.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
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
Subject: [PATCH v3 04/16] drm/msm/a8xx: Export slice helper
Date: Thu, 29 Oct 2026 13:16:14 -0700
Message-ID: <20261029201730.151754-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+ykZEdErUyZR
 4gnsymJvY6in05sSrBYcx/dMEkFn53otV1Spypo+5EufqQ0gFg3Z3ccbdJp0u5yzP5PXxu9TFdC
 vVxsxhOdQx7LF2eztghSM2udZgx6wWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6KJnK6wWFi5H
 LlEq6KpH+LoZdM6XvPLVP7Ymgwzgp6A1k+UbN2IHqjaiwZDb5J7GIdYPS6htEscX7cB7LZ/1gVk
 pN0AlXLyYHr0awm3TJvtyY4h2ds0Wl7GeeVeqf2sqVHt77q/q7JoFlpr1LVj9z4JH4gTLJa+RG7
 5oSD0vN8qUuU1ByQVYCQfZPzQ5iYKT4PPgv3ZsH7N9FUZHNoxRlxnEZw8k1FSONLz6IZeF8M1Nw
 sQQ6InQwM7+3h4WDmEbo0lbluqAehLlJsIxCSYYrXWQDHcq+xQpC/5FwO7ad9jbE69Y+eP7GTIX
 CSoxxRqLJRTb4S1NfwPFf+K7i6wZcsND+KjnjPNrDJBfXNfYF7k5l5um40Rg66UnQalpR0l//6y
 PbYaXvdctWEdiTP0VGL6gWB7hQMYGP6GMRzfoRURAHDlQw4TOaj9LQ/kMmUZQvijOukhDosNctr
 wJcVKelgJDXANmv/A7w==
X-Proofpoint-ORIG-GUID: h7ejrrAWExOy5P58jx2_3DD2_3YY1kVF
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3a9f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HwyinNJ2ww52bJxqQkAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: h7ejrrAWExOy5P58jx2_3DD2_3YY1kVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Something we'll need from the gpu snapshot code.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 2a2ddba6761f..6b23d301c144 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -359,6 +359,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a0983e2ee641..8e91edf16ec2 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -127,7 +127,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

