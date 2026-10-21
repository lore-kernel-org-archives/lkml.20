Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615965;
	b=LjakPQhNyHfinS2OoZVX7Ae4pENY4cul/wdxmB7zTGFm2eraJKtljEt6Dz9hsAYHPLzX
	 +atXgVxW50e966kr5+rJBCxw+zUgeMj6jtdOFW/1zZTo8B3DD/FBcfoP4NSx5sMyWGxlN
	 qGwH5oEB+wxTfPqAAL4YeF3/3hCJcEGlgnB1CFuBhFNwFQqPsFpvnFtqM825e38NGx/TS
	 nISeySuCU28eaSvohhf3bUj7RlA3JDfZCTpWRTFBKYLQ0SK28AD4D3vV0e6fo0e4Fi708
	 gyyG0Z7r/7q3AEm8tDnJd2xaufMDy6+gQn0MOZ7GEQ81jO1AIQW2RVN1HftwSNt0xjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
	b=tj25QJ0SFC5AUjo7Nnr2g0RLEHHHVByFKd+qo+ay8tOzPCt51lml8JpJ6o6x81TV07Yv
	 QERYhq1W+sh4dqdf8gyYYEMn+VhdcFh4HlEjdsWE/eawBYgK1Fc7F7eu7DlFiJE6NcWch
	 7hJeOu7j632uYIv7wsSl9yaD2HCbJxAq2iFSpOc85eUKUNRAOyGBAyfTP8O3ZnoVSJAlX
	 l/LPXXbqnOmiUThPGn3PuKseTebLYK8VEvfnQ4PRNOxpHe9pz0npAQe5FSHAsM2sz545P
	 ySJe8taCMyZkgx+n6/z7k1kil/W9X8REEc0hL6dlzkGcaeoUCNdtPu/JtvjB2LjazTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8RRdlVR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chLpZRgS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C85606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8RRdlVR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chLpZRgS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeOAu1360654
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0EyBq73M3y6
	JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=; b=j8RRdlVRjDiQF3pXkDomo3bZ/5m
	boEKOmUqNRzkpPAz2iq0gvRAF1+yng7ThA92inWWQgmJDhKLuetjY6bDNnYzDgoU
	g/ANetPkEQ2GLk6GL74a+rQHeRdPTbdjlBxrk2jtZ9xugkCTae4cC1GM1onxOBmW
	zuv8DvvU//6z5jT32AWP2M6EVTUTy0EsHDkWfsBqsNOtiKS3z4TzfK2VvzsTUlBZ
	VgSKPYQUJl/bvDOzrZBJnR3QXqkMtiNeTUZKLR1PMM05Hyuf3c9R392fRlXlzzVb
	RXxDikuuqk0oDQc3ZIKeHAvlCRRqYdWFnZXTgKGE7DxzcnX7lArtCiS3UOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vstw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so769854a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615963; x=1793220763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=chLpZRgSCCWD8vefpenoq2xLy81iTxTz5Ah6GE2b8hjWJNW5WVmgV953Lum28R2cbK
         TBcyp5vXTWEVsPyxgk1B4Elp0UI4iqgN2ibNAtSgXB2e7+hSvGppScMsxoSmLv//ya9e
         8ZFriF2c14/iMSz0/RYJ2SO26x0hrJdmx1XRL5iTcqe1L8NhZQTAvwzfSGixEi8le3Wp
         2+phEJ6IJYu5IaD/4OFM5eJfbs2tdzoQWMJ2ylP+SbIrIMOMg9t03VjTfn0COMiNcVfC
         LyWCpoQGTTZ+TeHU0iGQ1bIRKX4v+3jXqh7m7+so8y7Y7oV5WkssVFvLm82JYv8V08mE
         iHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615963; x=1793220763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=GfNezpcEuVx2O7tCXmsHkMOKBdXoKwxv55r+2xfdV9tWBCc/LN6ngmKUDHLLh2lDpU
         dFNNc4wg81o0mAwOx4ysen+HO5Y7/cPoWHyz1Y4qHtfLADO6ZrNXDX3KLBe6v3tFJx5i
         fZdyROw6DwnpPWHRqx2y0HgLqGKAjUXEEYNWxtNa1AJyUr6PSQNnJKXRXDzAm+OcXfG+
         1v3BZQ4HA4bvlOAiiCU0S3zbbx7ELTn/DgmD3QEXjenLHakCP3CDZapTm5p+InDf9yrY
         H5in8F9qYsbtt/wWgp7GvqM31CUj20VNLUHEQzaL8heviCctZdIBAxIFQxer2lsoiI33
         6Q1A==
X-Forwarded-Encrypted: i=1; AKwUvBxrPq3xjjS5Lxwp1cODp3eoTwKnJ8/A9OqpYCGouZJYa4SwEjc565/oH9HfhxtRX4L8N+BHEsJwa12g0tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtrv2oioCNymUlCxUzQJu5W685U9lB4Rc8zs0CnF0ZFIaSosWo
	7EtVLK25XZJAq7NsfbbUgTf0whHQnxDJzVZI7km5x6Ph5VShdAGUZHyovPj+23GdXC8aB0RyIMo
	lxiasa69KkLiLZfOsq5M8wWSOyStDE478/c3eWzGFyL9CCqZob0VBNvWVH/MHtE4sPpA=
X-Gm-Gg: AYBFou0mj+EZ+1IuI800EYUb7QwmOV250wmTvMJziRvMA59X1cYzvVG88KG1etWE0Rk
	LyV2zdeyiJObAHmFA/+XuY3VdpwQlYCiMiv7eeQs6/fX2VBIZbq5573plkTPpElmX4R0GHA55nJ
	pMsKRcRt7JwM9LC1yOnZwbiozRN8pVsHYPVqlXA3TbENNQ1A3hQkBFBdvmOXkWMl8WekYlxjKAc
	RE0gpOQNkFFoP55I60yzV8am34We5/hH6KK5vyI5TQXeHTE2+dChXoPU46t+spew7V3BFQ8tjbj
	SLO0hrt1NKcA/crE22gdq7E9ej0tV1VspYKM9I4FwX16KxOawXAw/96kOXWmTYspna1RKFFAB2/
	4Pf4dDdJ/50gnuZun3x+2FznIkqT3KVb/1F7xREtpsZH5U223kg==
X-Received: by 2002:a17:90b:3148:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ad86cef016mr2623554a91.21.1792615962638;
        Wed, 21 Oct 2026 13:52:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3148:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ad86cef016mr2623528a91.21.1792615962211;
        Wed, 21 Oct 2026 13:52:42 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm996115a91.2.2026.10.21.13.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:41 -0700 (PDT)
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
Subject: [PATCH v2 04/14] drm/msm/a8xx: Export slice helper
Date: Wed, 21 Oct 2026 13:41:29 -0700
Message-ID: <20261021204244.67160-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ocbBR9KcRfdRuey0qZ97sOz8jkkbU81z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX6j+7jFvOKsMs
 V2NyY+vHoQBm9T6BisWm7jFE/tAaCDxIB5uE66oz8htjJPWZQvQGFmO3ifiIKk8HP2UiHhfNXSa
 /hTDd5k8XG8M2ei7UI4S3jCrTrR50u8=
X-Proofpoint-GUID: ocbBR9KcRfdRuey0qZ97sOz8jkkbU81z
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad9261b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HwyinNJ2ww52bJxqQkAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX5s/ZiUr7vnrq
 q5SaTIMklCOJpVYNsXJWZW2Peh0hERs8rvqvcoYNpKnZJ0RCDl28DFADEPkiNKFrzu3K4XFxMx/
 uLIHf/qmRl+AsUwgpjuoIfgJPJV+pYHrPGP0mSG12mr1tRDqdsLgC5AWfHfvBzjZCDdzR9DjyRE
 +Gi5KOQyRDZWc6hJozcxG3DGsbgwSdBisZH58eTTmlrFL6QY0KgBZOikxlSyDoASCpdA5XL2pIz
 LVXxDTSJB4AWdIxXhHsvuIWfbE0msCF3xRJTtLaKYXiOkL7k0W72CSTs18Hpiew2U0sv+uVaHlN
 nWnb/SMc1Tn7mrOHDhCjR3OZFvGyf1BrCC6298FbwxlhTm9veTrL4cmulykzsp3AeLp74Uh2yyw
 qOP3IiwyINriNf3/TvU6dhhunnKjoF0ukOv1iLaVM8vfqhT8zOleKkhGsqRvs9dUTxZq/gBz0nI
 jEx/BCLHxsF+CUTMUkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

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

