Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0347484248
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159189; cv=none; b=hK76ZHPhHVH5GxNUBH81tFv6+DUx5k6QFbNMfHPEeDXowMO6PZzpESFarlebcS5PVWMxMz6JQyzSfoi+LqeBZVutSjq6/bIS75x8FQOkuhXMXnaaPgN0OaYZIBon9EnJw+sMrcWzkzw4ZppwgSOAszCLVMoGRC5RCGTSp3RQ9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159189; c=relaxed/simple;
	bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWbknCY9qZQXG3PmE+38+SAv2I6H8e1csnyzRxXNe+5j/sKTiN4izeBDh+YX3P8dp1AwBYlYCTSoVPFjFt/WFYPEJyffjk6wHt7AzHQg3JpaWmIXwTRPs3Un7rRTdzKTeVUPz7NJIj9+9nuNJlZmvvJN9ELj7Fxe+jqFGnyiXyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG42YElg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0cHz3HF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG42YElg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0cHz3HF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2fsK2429418
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=; b=WG42YElgMQfoDgp1
	JMkrjIz/tw2k/5eaVT4LKhK5oL6BCgcsvgZ1nXqJ/X7y8LflcASiFMc5slM6F+WT
	PXiN36RcTDEKlPxs5EhwvBb93NyUy/PmI0gYNsi5STY3NdqgYVB4PgCwWj2VGB1G
	T2lwCsN8PzyzfGlxft+B9c+Ccyg4nTPFO+0t66MLq22dDMmxe8MWl2NtwQ/MEhbG
	W4jbnvtKUBz8SeM7jtdgnjYac5DYJLViYLM6kkwo9Sf6npk0eVz1DsD9ANcZceEe
	mhnKtssgPtyXKtH57/e+ULy1bSmPq4NskqynPOe4jx/8XM1SE5mBfKiXqdOKF4HS
	L6d4ZA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1450107c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159179; x=1790763979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=I0cHz3HFHDgONf9MxsaoKAvm01Fg5l03QbzJwsviUu5TjgCMjDXqJnbyA2ZL/AdV2p
         uxnUIBrnAzEztXRUF0Jv0Pu+0SLukV/7BvHZPtrnMCcwKPrQFz4DUpT7ymyiai9xxMV/
         1IyNNLRfZRpbe3gtVw97lVUQp6GXK90W1srusk4O1Pb25HW7TsPLQU+nF/LWLAHn2iOQ
         k+2iZdnv8SiyxHe9nhtdZxUEbiWiMXnJoDhco3rS5d8RWuCZT5Fgt2aFPKnBAc/taJJZ
         oI+aHP9CYRLbRwMUZnQO3dF1QE1sl+/mVpKAk7OAoKvr/wO8Mt8CeCE6s60J2AgZe4zr
         m/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159179; x=1790763979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=RRwC3S3gXIhyXlmHEJeUEI3C19E95ktDTcRXqHtlrssrv8+gwudzACzBRpARxj3AvQ
         r+zQJOVEzs1MWbQto2q3/sfRpo1WumIaTqFnQuW0FwG8XnsNb3l2/PxfLV12xlBXzFTF
         fzhsOCLxcq8rLUx39k4m+ytYfKa0lVr+R57U99hZETG/ut+aaJNCyrEzRMi41mLJeVUU
         EJNvAEhndSeaVqfDfMK0f01HZVSRbzHZnVv1D8Bti31YI00T3HZMMdGgtOejyILBWxtC
         fnsVKpJys0dEE3Q/HdJbmb3IXJQcXe2qPvz0g5rXwNuT1stylqOJw+9lNb5hSjHHEMl9
         tjvw==
X-Forwarded-Encrypted: i=1; AKwUvBxzsSFcuMIcBwvIwmmMMqVB9YYkhfwUg8HK9wqEmKvgJ5aKdr6eii0/dampPXC4eEG7+aGxw02bTT/xSKM=@vger.kernel.org
X-Gm-Message-State: AFuF++mF+Fhe1A3t2DCfvjSz5G58aARiRcV+P9U5WbjEdXdLeyh/hKU3
	pY8b7yNxZdd5U4zPkS0TU3pZ9K2VdR30ZIwD8cLX1Or7ZPOaf0RKILhseYMjo5IIkDiK7PzpAqg
	GVpi5a7R2t8CkInLeF4BJp7eAFvAmxNYAHn/WwKUKPnC69pVY3Rjn+a/nW3AEaSxRudIVYDSa5r
	E=
X-Gm-Gg: AYBFou04f1L9qIxx2ugvJyBhqfjV2sE65HXDswD6JBwF4FfO9b+Sdubs3T2GQUR+jZf
	7jPoqQL/1Ov3nrm6kZnj6P6nQ7eCILrnvmcat0CN2FHOE3wS7yrgbm0gcnAb+t7zPIM+lKx0iRM
	aMhiwDNBzcomd1nrsRVPHEtd5FAodPSK6KZjI+iT11vrMF6EWveUtCq36KVWBtZhZZhOXyt0Rt+
	WUdvyy9CFSImVPceGp4ZAZLhBWzoPdD3EpYFhUkANtkZ8lkGIOjgE12IktgFvWnlFESosbmuyku
	7ucakdl4Z75RIW+rVno/OEEth3ze45Bud6plwH82uTs5gtICA23QNEgBmqj1gxUtnGodgw2wsif
	BvJfc7ppFou05PaaB+SAUaoI=
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194616c88.23.1790159179105;
        Wed, 23 Sep 2026 03:26:19 -0700 (PDT)
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194590c88.23.1790159178553;
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:41 +0530
Subject: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1864;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
 b=gz27hGiIuj7IwDt3Zs0yojZ6ao33Idt442AqRxr7xS8f590tFgvvo0/KU6rsToa1fVC+5Pwr/
 GbXZl65xVv9CMvyQhgUFyagbyOlCz6K2SCKJdOQMo8EHar1jR6v6++h
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: IUcNtbkGLsUZ07qs7wk8RB3710lXNoJx
X-Proofpoint-ORIG-GUID: IUcNtbkGLsUZ07qs7wk8RB3710lXNoJx
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a94b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RtdH9gem4_UyrOKn0ZQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX1WtFjVvlXayu
 MTb2OkVFf9dV9sRyqQAqyPWRpARcn0Zq0DqjRW0mAx6j/nsXOBAgmCDmuz9RPzOyYJxTas+bwHo
 zaTDwqaOTMIB8ObgeMtCzAg4yJR1qvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX+aK63LFX/wrB
 9+XtUEEdBULLQwBGfvkOOualVFF0hDyWnhtIyzBkplJvJL6CGOsIGXirdIZ2+ktafzOwLMUInN0
 aLjl5x+8NtZnlH0FVjWhfKHqnFROrfnVAWTF9WjZIWkeSDsN12piVgC9jRlzb04HuOFCyqsungs
 VB6wnPKuMYDySJ8hYNBhRdN9SuMffvdAUqzOfpM2kXLev0BwaGUfGQiBFwqAFYuzRWpL0Qtg0xM
 LuubVK+4aEQMvB7YGuBUJSP4PI13RC4izyzgu1Ez5JXCy8wTFmdhFAzFJRkRUDNgupVV7lsnFE6
 18GOTAjKb/n8ZPoB736JB7qvbcej76wRcoZCohQByE4y20JooeWtoTvNwqTEAucC4o8kVAdIlX3
 DjYXx0UeObVH/6W3jGspPCZplLK998KMzXQutIEs/YoLmzLHzHWSRP2h/7umopl06QeTvovi2vl
 HKC/HeixAsFslISQPnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
votes above the perfmode_bw threshold, similar to the A7x GPUs.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6d49c51df1a2..baf77a620572 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1656,8 +1656,12 @@ static int a6xx_gmu_rpmh_bw_votes_init(struct adreno_gpu *adreno_gpu,
 			if (bcm->fixed) {
 				u32 perfmode = 0;
 
-				/* GMU on A6xx votes perfmode on all valid bandwidth */
-				if (!adreno_is_a7xx(adreno_gpu) ||
+				/*
+				 * GMU on A6xx votes perfmode on all valid
+				 * bandwidth. A7xx and A8xx only vote perfmode
+				 * above the perfmode_bw threshold.
+				 */
+				if (adreno_is_a6xx(adreno_gpu) ||
 				    (bcm->perfmode_bw && bw >= bcm->perfmode_bw))
 					perfmode = bcm->perfmode;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..bd5c440f1753 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -580,6 +580,11 @@ static inline int adreno_is_a750_family(struct adreno_gpu *gpu)
 	return gpu->info->family == ADRENO_7XX_GEN3;
 }
 
+static inline int adreno_is_a6xx(struct adreno_gpu *gpu)
+{
+	return (gpu->info->family >= ADRENO_6XX_GEN1) && (gpu->info->family < ADRENO_7XX_GEN1);
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */

-- 
2.55.0

