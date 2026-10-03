Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DE29B781
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987244; cv=none; b=tZ2PQ6AN/JVSreujai4kD15lkKjFCM+GpJCTTKEhWBxYc70oO9n0bmB9ilMan1VbCnZVc4cyBgQbEHXlAc/hs9lea/FyfodfuMcEpseMhew2tOYKiC6VSVU7gruSeyLVHvo7ldcrBSPiQBmvqhtdhve92RMNtID8GH+Fmb3gSpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987244; c=relaxed/simple;
	bh=AzyBqQgyuR3fL1mDrTwzGfxEu1JDwGk4Yz8+Ubw/F28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dauoZLHplo85ahII3J/uSnsbIroHfeQ/Hg7I/ULslHmdu7oKM15VCsNfafDv3SCIDzj/0LxStIfR+dtkCLTnME+24sItttVYHfKUlvMYY2bzXYjuy8t1PI4xKDj104xDnGsMGUUAIIW09XOQqMc1qpshCYbn77tkXePGa1yokDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibvi7BYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzmAiPsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibvi7BYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzmAiPsG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6930JuUh2790959
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=; b=ibvi7BYHEst74VdS
	xaIFT6PTCnXGdTDdRtWJZp0vgb2LpSeCOgdFHdrJZRmiL5UD1ajCTP3A7ASxFJdQ
	nQtE0bTEpj8fb9NjsakOxB3eqIks9YO7GyL8iaUni5mru7g0c+2IyQBkOpmL8/CC
	CGKz0RLcbsYWvj1vUXfYhNYXYEFxX2QD177E3U3h/7MFB9fB0kn3jyw2BFv4xIpK
	R7xzuFcw++BtjDuJe5UPI1q9bOErD0l6LrZFyVZyPo/fpyE+2OvnOj2ZvoLiBqrR
	adTIUDjvmo01MOiQX5pXWGOzGeCes4sRbdTicUDIC1ORTyvk6X5pcRXuZTzaMoWK
	a95Ytg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2q2nr0k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106fce784dso8267476d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987240; x=1791592040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=LzmAiPsGh60Cr3AiXEomdFl1EnaQF3CwOH6DM3tTaOVItjDUb/y+XXw3n2LPPoUVHD
         xC1Ttg78sKaJ73TSRqXen1ffAIniQRO/maernAyMvTVzKe0XSOt49bnWaTkOCZ3J9joQ
         mLUdAJWNskdCBmVBbCZ49SQ+aKjtMxy9jULD5KnUlJS4GNjwyt0lryzK1wG7iGjn6DFD
         GBafxtP/e5256klScteMeM8kne5UUkrcv+4+OaFeC2jRerXzNDENubiHpoRdtw991JYl
         JQ3MjZRE8JtMgrK9nZ0Mxw4YDfNEP0VYhdji6alVeXz+iNrUZRjG5mn9Ho0vLkxmq2A/
         fa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987240; x=1791592040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=L2iTOie1MWmCULUYnlfwwVppPYOuAFWjB4PXNRFXTPOiUyJfuY1XKTxRgYKCDRqU1f
         oaOKRA3GKDVPshhh06ZW0jNrztT5YEDFkLHpCTa4rFjE1EOXd8R1KhaTj/iQZV+zHkJw
         Oi/fRRCd9VrlcYM6APbRimyCqltTx1V1TszpY01Yocwv1l2aTqfQPeEkmD6QRm21SnLW
         F+EtGZrl7Kn6jZy9n3vrNAMTXSmoU1YWt7X0F5cF+J1u72cBTac+yTAOG6j0YRrjPcwT
         E0gqzyiZRkPjUaNlZ04TgWXVsJVY7qjvYUIn/uZLB+olUleVrMjn5O2fxy8NGPkm2ERF
         aVFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/SswoQi/68kx+/EfX5PFKyJCSHb/wGqtjBNQqH2HR+uE785m9kBnAA8SZP5fezHaChvBVZ4GGpP3WPcs=@vger.kernel.org
X-Gm-Message-State: AFuF++mLuRFHDGv3SfNKqp4ZrzGmTZI+GVIBQI9HppA4kdA5OApQia9X
	ItBCAysz1N086ltRuiaV3VAtVdwq/VKHKhS17yIpdXirXRHhnoReKrTF5/pNdF4OeBtapqTJS0/
	aO5ZQgOHLZxDJ9W+q3mEUmul8/bXPpZhQMqBQdVTpHqebKpz9D0A/pU0SD7KAcc9n7aI=
X-Gm-Gg: AYBFou3yVOdW4oee3hSpwfWwcylIWt9whG5AqMOZIDbKxDfQTlVFmQlLjZBrqTxjhoe
	Y0U+q0pd5qjtMso79yaSGw3zeF0dw0zw824mu+l+ZIDgWtwEwTIbM7o1GT86OAldnTwWreEwCWQ
	HsBWHLz0XL2X4c3KIoLOEJsGTbcOcBUs5F7adIjWdz4BA1uCXJsSqqrD0fAMfdZtBDJkErHvtNy
	YIh+OU1fMwiGIUjayPXChRhZ5wTJd84GzLed+q4+fP25JrQDb03c+71WbpWzPf0hpu3Q4UcDcB7
	X63NcsXqotZppcYRXo429efSLbSurUjKgi8XhsoVFUTs0cjIqGoDP10x+Yipg7FGMIm/ZWwCx2R
	oYEU7V/Bn7RUE1DeUtKOjzbiuqoAgvxBJCGMLoQNgpaMNpaQ9DczcnB2jx64Lxt+8VAHvqR0teR
	ui05DxLi4Q0jjn
X-Received: by 2002:a05:620a:4890:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93cf1889e4bmr829883985a.53.1790987240386;
        Fri, 02 Oct 2026 17:27:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:93b:d79b:9a54 with SMTP id af79cd13be357-93cf1889e4bmr829879685a.53.1790987239891;
        Fri, 02 Oct 2026 17:27:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:11 +0300
Subject: [PATCH 03/11] drm/msm: clean up after a failed msm_kms_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-3-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AzyBqQgyuR3fL1mDrTwzGfxEu1JDwGk4Yz8+Ubw/F28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvf7927W4xjaDmisgjEqzonGTHC9UgMkK4qI
 /sNqpqNLUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL3wAKCRCLPIo+Aiko
 1bo4B/9iunFOP3P2Uyrjz2EkO+PNZ9yYY8L/gD20KZ/zDa7+wWzVLHfF7PM2fLSD//Cou6TGFPc
 7V9KVQ0CxnLv0OSTEZCuqMLaCsT4APASgZJBs0ZsPFcsnRNDc+jniK/A2VrazbIVRFkgoxgmytg
 8IZj+9r0TTBAeX5JD1IT2qif6asy4eF5ERYHFplvqjvZmVahGQFh3S8DPNqGvPQ2EWYu4kY7Ghg
 I4Ba6MuZqT7nW8JRA1HVCLmerQ3niinR6PZSVSlgVLy0sl4WJgxpRZsCkEl0EcAeiSfc0JWnsH6
 LY95lctGW/UUjTROa0bmJ8YpkkEc+25LQONyibbkQjCw4ShN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX3NVYZfPZATmB
 4OXD6otM997D8mktuZNjMAnyImVJMGyWtWrxdEupG81x1jSWnxgTLJ3cd8gm1N35tHUL4TFnPGd
 Raund3x+TVZhf5J/mbu4A8tjPsnbDRY=
X-Proofpoint-ORIG-GUID: 12CB_oTBbv_AtLRsz2thypU260kHojQV
X-Proofpoint-GUID: 12CB_oTBbv_AtLRsz2thypU260kHojQV
X-Authority-Analysis: v=2.4 cv=SKHXx+vH c=1 sm=1 tr=0 ts=6ac04be9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MHPtEXvVaziToaNGM0QA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX+hn57oXTiGie
 pctbGLYl9Y3KeZhAsYQ7zj2vqkdJE09naThOYhOU+id8XFmfuWlqVyRORkgO3xdhlNmk80pdSTv
 2NN5EHQNSGYqR0RO7dWjjxGWntAQVxhARer314Imt4NNF3vGS/tqyOCTDXrex90mt0TSwSIHQSc
 FIuM6fqYp29RWyYg0ZiAXdYotMTbHe/F9S6W7+S4SetD18nS+QOTtBChw+xhPg9WDhx62QY6Ui/
 Fr8LNcOKvHgKAGoJJclmZTb7ynxySiZ51K6ZFoMKWa4aNqFbdNx9xexhPrrzw8uV/FFqlwu97xk
 2+bTNti1MyElJeV62dB2NzsmQn6AE542c8xIXFBDIuf55D5e/1iF0Oym1aY4h5WSVytfhtB/yTc
 FXhxb+sgFx3AlUx/+3VmAvlvoQcG9dn6fOhsRCF2tx90loz70CS3YsjqxNqSHOMZ/5t4j5bXy28
 bqf8S/FQVKv+IF69Ajw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

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

