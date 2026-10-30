Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395185;
	b=lOXiYg1sMDehxdv58cfcvFDmISXgho5LXYqyydAtuZ+heylxEW6qi6j47qqCyRr3brO4
	 FrbokWEvMCwZNyO1we7uBIL8TSMlSX2YpXndjPaRzZMSGxotP7gC6nXlQEZnDPI+G5jvV
	 0p0OW9OpbbvzHF837n5YAYjpk6CYwUz2+b2wH2hYT1vpE8jFiyERJ7M0u2iqnD04om9uh
	 ytV1NpI+HXFuYIsXwzmMB1kQc8b50Abg8QXbJ5R+hgXRAgWSmX/zszUMzqgZSxONXLoay
	 bLRU39HZlzgNta7Es/kISFJIWMc1/CCpi6C3fu1VhGNFiPGHP/DN6xFDKDvx7Yz3xjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
	b=mQXxx9YwETdO3MfTJIHNzIKHnSzRsKBxxHPLNTGgZf8du/0e57eicKIw1bCBg6Ogo4z/
	 wX29NmYqa80dYCx5FLkyYwvIyOlHJ9Sj2ClRltvzYyk8UqWeZbRp2F26nGSKX6Pe+1BiD
	 5GOXwxbuxGDg3bbf3g5ER9ojXJujp1R92GKLX1qVlIyaTYGtgIa1xRFw+YYTaVtgkUBmk
	 oCEXOGlCVZef5daRDkWXKGBwmZO0+a+Yde+Wrzd0VLKSaghUhiWODMkHf55KaABUKzCnm
	 ayGekVUOaSUco8KSYP+kqmhQ/jBac7lblXHLnIxDmnVwbUTR3/DCK4rc9p0gLUUy9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOnhlUmr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXsb2rJ0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDBC606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDBC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOnhlUmr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXsb2rJ0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAj1O246904
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cTppngQprFq
	mmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=; b=FOnhlUmr5+rfYj9MW7X8kj2n+jn
	UjGE67EHLNY3SPwAZbUqRy2+PonXYmP56OnSnn7zdYYVBHdqYwmQcmso/r2WGE2k
	Q/z7bJEW+3MBcEEoQpO3RYZ6ip3BGkBNdgGttFddWnMY0lP6c3sAiw5tLPsdH4by
	lgSvqBdzYRg7HGX5zVnBS22tqLOIv+Uy24yIr8TR4EkciiON41LT/3D4K3y9Vsdq
	GM3wR4aqAIRXeDWD0A2TDsJNt+h5L7+OFDaiw6WKB1jDlRHEJXB694plZSes8OXE
	La+o52APgWgPpqVowzHIRFhbXNV+va+7Ug0v3HfaEuiRrd5l8OmH3B+6YQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so795842a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395183; x=1793999983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
        b=WXsb2rJ0yBwBgob282VVmaPyAkYuM/3FWJd9EsSEtqwxCMJmKTV5kKxAKGETVrLm3d
         oUYUXlBktJg7ErrdbEzq3YGTKS4n+9FxKDKOxfOowfPk8kpla4CHXOSV9u0qKBhqG5If
         HfBWgsZFsgHbF51itQ4+zuqprQSiN6e5aHy/VYWZ6r8o0C5mOswpc1fAFCfY16+vZ+Cr
         hJvh9LfbUkhnfeoY+nHMfmtgIkTRRwrdnjnl6Xqtt4/yWKVAdmC3JtbNvpTGuFWCGy7o
         tIH+iRNEU5ooeNuMoaBauSaRTzNxO+fVz/6m8A+Iouf0vbopt308eeclD9S42IKkpkeR
         4zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395183; x=1793999983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
        b=zMax8wvApzPrlNxrU1eGwKfojYaqzYRwGCm5mvVgIzVGSym1U86hllTcZvaWwzd/nJ
         lljlNxlYl+vAPEseKKa6dYFyPuJIHEk2Yyctfqv5grgO8MwnnvjemR47tXOck94gCEgy
         cL2xqIJBORQ0gDx8lc8nbA59sZnayvLepBDGGGNF7LWBiqq1YgdiYu+vs+wGLiDf/HnU
         Kf7e682dPa45sX0Qg5w00HnMMVLqGCHIuH0L85/cGM3EsEpI+YMAXKb+zHCeWvlwyRwu
         xCWQx5j2dcGnOtSB5wvtNN781fww5Tls0EBCc270loAHxqIjxlYacfFlC1Ha7UPn/I8U
         xvrA==
X-Forwarded-Encrypted: i=1; AKwUvBz+WGkSrJl98Rbeu0GhXtILdAhW+W+rHQcrTWvXfGqnDM6J+er9dTY66PtnLSSgSsK1qs354Sh7ag+HG/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw10EFNv0/3tt3JrXGVXfQgHVq3ZbVbxGyiZYphmB9Kyi0QVAV
	5oMpM1JYWR+wXzhcO3pwv6ytq3TnUROM3aRHGjffZ0EJcFPnIlS8CjOeALS+VLMCtK05DAszJHA
	b8uClMuFFw0PD4ZfvNGbkm2pkF6iyD6t7eogef1IMT9MawW/VBngQ1mjy9BH9NIs/EW0=
X-Gm-Gg: AYBFou21evCWqxLw3A0NE/1vootzXlZLu9zC4Hv+wAPp7Ax5sYe5YsJAr/VQJ3qAdb5
	4gcUJKFqsQ4GZEU6NCdGzFffTAyCHRL9XB+DwkqJ92aHeyJa57/57nX+hx6pXEm7qb3p/TXoD4f
	rrpdY89T7XYCl858tZkOn8+fSTtXkTDz1TCX1xAXsIc2fNyhwJtf89KnJxm7caCcmj0Ucx5GLLn
	bDOiFEMODJffJKJCMuA+5QmDDbuayFHDxXSwkCUUPX24Ynsb9nI0AqRsBBqtw++Tb6d+gBLBobX
	cP39gPrhsKfTXiE0LJf+3yZV1PY2cURLTlhU38A2R4PvUbv4RVB6SqU+QnUXjwEzO/61oU5kcmI
	KKokxerfIH+MPsd9CGLTxrlf+0bRMfH+kd84Ylmp+brJA4rjHl7RlpQ0MQd80urNRSPk/Gc5pE/
	HEjnDoBI+MVl7xBCXUblWsITc=
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr2641569a91.30.1793395183485;
        Fri, 30 Oct 2026 14:19:43 -0700 (PDT)
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr2641552a91.30.1793395183026;
        Fri, 30 Oct 2026 14:19:43 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d4eb25sm2244216a91.0.2026.10.30.14.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
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
Subject: [PATCH v4 04/19] drm/msm/a8xx: Export slice helper
Date: Fri, 30 Oct 2026 14:18:06 -0700
Message-ID: <20261030211928.45761-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: rZsRqUJAMGJ9hEj9d0omFHt7OTowYrir
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae509f0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX0pqN0chJa+eO
 SM3VNzEz439lx4LcdudPiv9ZYl6D/6/K/kN13jEVEfDgAcASGse48HeL0wcN2b797oWMRsKZbiN
 S5RKVHv0h9/r2cHGvceeYIpjw8t+lfwnudExLPBG8JcZKSft7adK+9zkzlgTiXTsdXxpXDhM5Xr
 OlUNX+5RhbyovHdd6J76qpBo2rL/RunLnL7rIXRKog7Kqo7aZ1OmoUJtQXTURaErQ7YA/tQS5Qe
 +tN1+/YQKqYEMTUriT9uR+nPMG+00SfLr3Ij3YrOdiGheoy8AQNWfWy8gLGWXFGa1oQN7He60sL
 OFkfZNpx5sHmBB6cscucapJH2kewW45QG+n4MTef7jl3Bn2DaqtotIw7o/zeH/WBLC3Gx3GHqSd
 o0Q7/UcRYMLvTwNonex4XzkuSITbLg==
X-Proofpoint-ORIG-GUID: rZsRqUJAMGJ9hEj9d0omFHt7OTowYrir
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX777CVVWokt9a
 og7VnnMXUNZ1oaDq5t5g1B/SaQPXu/Ihnno2Xx0w9tEXc5hS4u+qSZDOGxB8YYHjQnkYSCGeZDU
 P/CweL78gy1hFqkVrX1MWcKsUbraU7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

