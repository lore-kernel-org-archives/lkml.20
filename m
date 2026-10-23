Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797615;
	b=C+FMaDbTqQXQm1C+rKgT9EdqMKl0AaOjdgcXNLrj/4qzRFENCP7c7TuYLNI22Ni77yq9
	 DmRQOWBv5EZxrbylhuKwvtdZTqxpnC+ahMloRvQk3qjG1eWlV3TonvFQLjkyh/YM/DZve
	 KGDkql84giTuc0GEHadwSwi3ZO3iQsGRceGBXSx3gEYZoqnmMyn2g0AQwqH0MEAZs0/2N
	 eQB3MaE4NHjOZKEMkgzc1GdcePfYq2OlmZkSq3Z94aHdSj9b6pgOfKWuQz+TXHxd4fhiv
	 hrsBGHsdOCyo5BwprPlbDKOMYPo38IMoe1E+vTx8HNzPCBVVWUT7xlGFwspZ9KtW5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
	b=DEm1V7cl1XmW1lT+z8Eq7hE4X3M92PqNPCQ8ppFEgr5TAWoDRFI5yLJ0Wc31ULYiNb3Y
	 48sgX/Cqbw2QwNG5f++GmtKuRx4W63GOOaMrM0Ae2fatHVZbDA7y2NHaG9KRWm4wQwNpl
	 o6W9Gk1B+fz6QZADpMlnDmQKC13TdIY88iKe5CCqmX7q56c6hYB06Fl2FlncZGyRoNy57
	 9PBPOBec17saiD/U38nLhsMLFt1n392jX9iUGgrlFw3lq1Hos0mZquBH7/ZB0MPaaC4LU
	 whLomPLdP0NQqGaPkxSCu6MKVp2fytU184JY9QXFA4Ukh5BM6TJOswmikSbDizHJ1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FamBoo+Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idWd7IGM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA3606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFA3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FamBoo+Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idWd7IGM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLunNG3115210
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=; b=FamBoo+QM+jouzaf
	QwgZSjQ2o5IuyE/1WgfvZUAaVQEG4q6CaGv915YJiG6Uj4fKosiQKuwXdgvlFKhZ
	1um4dp2HPn05C95mOz4ShaiTAEHGlD0cfB8gXoeTxvKSt0Y2fPuAOoePiYbcZogz
	HWwBAvXfYZEk8Ws9+keFaSFqkpExANIJeNJQz0JIEMCIumjVOoJN2HlOf8NTirAH
	hrGsWU15Vsnv6mMJ6CcpYfniYUu7rw5mrkuNOpBYTs3UYMvnUWN0qi+ipE+gxLxg
	RkGyGSKN6kQIewBWcxiTskjSH6XIvOpZp1TjaqsxNv5RUM03M0LkAH7PLcNt58HJ
	XOrXBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt8uvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so89189685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797613; x=1793402413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=idWd7IGMPZ8yTO3emuMch24ShgfudO2Sp/UDeybvJPP1QUnjPwddAeIk4xxNejGKrS
         4uhkkCRbcJ5A8+Ic1Wwo3oFIJRAb+kOPofnRI1uwheUbyUBPnSb0ed83cb8U8Q4vH9F8
         BlJDdBb8DwfJXUYlBjTG9OBjDndL2RhpcLTwjKEW+U3Vgkqh9+yxB9tujWQ2ZBSdaEtQ
         KjulI172aJdFvURF7wIrtbskvfY/bgSPy1g0QEzLocqizBroOO6cFE8w1VJTwAkAHH4Y
         ApOGwJfheElQ4TwbKCOagk3/bFdDLo/Kvb+dxncDtxpaWsywStgFB7c1UH+FmZi9zN9M
         LI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797613; x=1793402413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=zAeuE7wJDHirxIJmZ2wisaqgI4kwCBuI/vQ/ZM1QUXFccLoH50FoVFhmOmeR+DnACq
         2sNDZntUNKArbL7365zxqQ9t55NhozhQzpzGHEkKU99ZGm79boU4hpLLofHcKpQZ3AB8
         uABYDdAMrzoncaWGBI5MwEl4xPylbyGEYQ/uwwQqSA5OyHlwU9Iu93/WrOGE27oV0eCa
         KiUGCuRoRcFAXkk1iuYYMYnqtj5WT2wxH6XJgnMDjO7OfvloZv7CHwndLYzzgqcjOmir
         jGZH0ExBND2QiXlVu6KK8gjxmqim7dVe3Wcz9lpW9oHd9zqHSqLyu5K2tv6b7hvX5Iqy
         dhGA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ws48GBpFc0WDdsGkOClV/WRckk2wXpsy4LlBdfoG5dEd6bnsx13ErjpjiZ6mLbGoq5lLmQs5qV8UaKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVLYx2ecsLsF4lIyhRVix5ozZags0iw13BVUexB+DqTEniAA6+
	wubQi1vXG6KQnN2Fq512ggXHYRHBpu3N6Y0TEexXKOdKHuSbNraOtj1h4yzGvry81oH3Kz341YX
	XcVnZ58n0zyF1bOfM3NZpSdd/4388AefIn+J/iXtM8XhfZJfqzW2ye1ekg23DrCOQlJw=
X-Gm-Gg: AYBFou1Oj6W7QqO1hCQz48ptcJH5KxiQt7LgUdcO110XEJUIu98YR7gNckLr0+8ZuIB
	lD89fVVOBqBbZ7Cr75RG6paqXSPnPplTaPso2JQMZXVYPfeZXt19BifHJ91x33ePLBfT2RfLgIi
	OF/5tcktnZVDgirSeMI4Iftx9ODQNLVAXBE+N02u1BpTL3EjI4E+Y5rg/GSD2BAqljCrXxA6ZA8
	+gNjpZ4tZ9QLRK6ZO3IgLsGg0LGb7JXMyMosBWmV56RHvvM1uZYYdCcE4OabOQ74rzkAMZtbIRH
	Vh+ARP52rJr2bKnqVVZV4ESon6cnemPrr7UxAph6kc/IfYCUOmLjjbV/+T1XpZuGGEERUbF1bhe
	95a6EBuQitnL6Gij8ycZ+YNGIa8wDECTgAv/LdhQCc00W8ABdrQE2Jn1fYljRF3WcK5PAllfiHK
	x4f+02xIVmExUA
X-Received: by 2002:a05:620a:3726:b0:93c:c96c:a592 with SMTP id af79cd13be357-940ef8dab65mr88814685a.36.1792797613257;
        Fri, 23 Oct 2026 16:20:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:93c:c96c:a592 with SMTP id af79cd13be357-940ef8dab65mr88810585a.36.1792797612759;
        Fri, 23 Oct 2026 16:20:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:38 +0300
Subject: [PATCH v3 05/14] drm/msm: clean up after a failed msm_kms_init()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-msm-kms-destroy-fixes-v3-5-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AzyBqQgyuR3fL1mDrTwzGfxEu1JDwGk4Yz8+Ubw/F28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uR8rE8nzwcjZUwaBr5DwKR7NVyeqjeMLsVv
 Vqq0nv5XhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrkQAKCRCLPIo+Aiko
 1Wu2B/4j2CjyFmT70LGToRdiCNpx/ClnA9Igr/DVSD0jfugSNU065df4A0XXYoY6xXdor441vHh
 YywVurXkdyJud37x1YLSEFwkBSbZyW/IGm46osx6lJmIS15t9RAC0647u4+VaX7GOjsmZR36Job
 Cb91a+mIqjwx0VBeuOEzDukqX30kMcqP79CZIMdCFbSTF0je4cIsXIRIrtJ2fKwSheBmhoZLQqo
 Myaqlq+BqizUmy3L2L/6s4lWIOuEP+2fVKltnWTPRPgre7zyk9k67UYhmz6RSe6pm3iitOfaDTT
 S1XhZZ9uyzUCAI8PP3K3lGZI7Bmgy0vo6K8RrO53EvaiyOCb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX2vK+/TDuyj8p
 8/VjQTNiWWct4VY5hLYJmbqI8LMTHaWj/KMNfL6Q9aXh6FjZz0nCKrQsoS1GgKX/oz0tRy270tH
 kNN6AmcGgtWT7D2D58NSH1Y/009UOdE=
X-Proofpoint-ORIG-GUID: WDYcP7Ah4Y4Ki1nUaDEwK-bICtHnkJzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9YIOh5GsLo1j
 3DNJL/ZLm4UjotPVxTT0VrnouxX5mv36o5Y74uVStTh6pei/NJLPjkZ19+iYjKxew2QQUfEx+l6
 siFdWytN/HP1gpjAQNUB6HyHE+xPoTUSZBmBQZCNAVhFFe/H1GGUTCUOSVqnNGTSm48FNA82i21
 cw7RmpkqGF1nkwTi5zDc21MuqoP0Rfey9sH+LgG+OnnRcCPszK0ieftWK+58BlXJrCMAan59K63
 pM4u0g+9/GUdfKrlHa+Gd30TCSmUBfPUS3989wCIo8lRKDrL24hwgvCLiBJ/u9HlBzRLuw2zQ7Q
 DeU3i1WxCWVt2nY0J0u6aTFeNPW4idM866joaj89P1MzeCLZUPrRjUW9vL+3U+S9wZwoJNzkdFx
 77C6t64hvP6SpEsETDSZOWdBzrwKQJ5YSX1jD7Ij77Bj02zVN5oOu5G3X5hAwd87R6pAKDOC861
 T3XdYFX8+wnp8AOWv/Q==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbebae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MHPtEXvVaziToaNGM0QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WDYcP7Ah4Y4Ki1nUaDEwK-bICtHnkJzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

msm_kms_init() returns early when it fails to allocate its workqueue or
to create one of the pending timer workers, leaving behind whatever it
has already set up. The kms drivers' ->destroy() callbacks still run in
that case and reach msm_kms_destroy(), which passes a workqueue that was
never allocated straight to destroy_workqueue().

Tear down the timers and the workqueue created so far when
msm_kms_init() fails. Until every kms driver has stopped relying on
->destroy() to clean up a failed init, let msm_kms_destroy() skip what
has already been destroyed.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c |  1 +
 drivers/gpu/drm/msm/msm_kms.h    | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..c26b0c7acdfa 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -134,6 +134,7 @@ void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer)
 {
 	if (timer->worker)
 		kthread_destroy_worker(timer->worker);
+	timer->worker = NULL;
 }
 
 static bool can_do_async(struct drm_atomic_commit *state,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f25b31e502d2..ee98393b9855 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -175,7 +175,8 @@ struct msm_kms {
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
-	unsigned i, ret;
+	unsigned int i;
+	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
 		mutex_init(&kms->commit_lock[i]);
@@ -188,12 +189,19 @@ static inline int msm_kms_init(struct msm_kms *kms,
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
 		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
-		if (ret) {
-			return ret;
-		}
+		if (ret)
+			goto err_destroy_timers;
 	}
 
 	return 0;
+
+err_destroy_timers:
+	while (i--)
+		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
+
+	return ret;
 }
 
 static inline void msm_kms_destroy(struct msm_kms *kms)
@@ -203,7 +211,9 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	destroy_workqueue(kms->wq);
+	/* the kms drivers' ->destroy() also runs after a failed init */
+	if (kms->wq)
+		destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

