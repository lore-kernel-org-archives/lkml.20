Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436B3E16A1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164394; cv=none; b=rPCseDVSaEX49XNeopp344nY9fiJvSqbT6Xo1qqsGoeSTqs40aVhwRwkj1yhi/G49zgvcsTK8xpPlhCG8OOfZspxZoJuWXter5Si695xBC5NjKZ9+AK7+B31z+r/RkMYQJPNZRxHFsRz33QMdhHCCgYxT8/kxK7pKlC74w5vFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164394; c=relaxed/simple;
	bh=wMC2YihO4QtFdymka/2UJ8jIACbnk36l94X1rDU6A9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enemJ5divDA+Lt9dl/oxsJOdGdB1yOfK2HKY+dSI9xoK6KyALAtbz00UvjOnLW4AizyMaEg5h3uZuuB/Lz6qzSdOCumKmfTt+GpRCSA6TIH10UywlJjM3X+FJs0ez7CtNPVx6cpJtgcLsvTxloxyLlNrs/h9MOQs+K/+BTXd7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrnB54V9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUTKatf/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrnB54V9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUTKatf/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xk1Q2924525
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6fG6edY2B80yevoZeN3MhpTgETb0AMUhGfbVvl1yPtY=; b=hrnB54V9AY/EhE1a
	9XqOguZrtqVatrWgxs2i5TZ4VeVTY5yTs2zd/ujJ2RG1PktUbFGFxnlvXRyoHSsf
	nN+XSmkW5rc8S48GcoS8mxYZM0PiuLE2ZnOrWz+NuM/GBRfAjLpI3mHrnFxQW0oH
	t63p8VjsxG0C+y3yj8fa6R7H7P1AUzv4BtjaBHYJWma3bGC9Z3UtEnHy2zoSY9jB
	C2YBCgktlcGA7YPz1cv69x9w/8N34IXzp0T2lqQ+CoPYFonpklTDsTxgoSs5ZT0+
	UjbyiAz/R/qtSvKli/4VH53v56aOte2EKn9fZSBQnMDz9QHaUKzPxDpjsKmz7e8p
	EIzqoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w9ntv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so772763885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164391; x=1788769191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fG6edY2B80yevoZeN3MhpTgETb0AMUhGfbVvl1yPtY=;
        b=IUTKatf/0VP1vru2+NMD+LAISVGLb0o/1UvorV+G5u1dfuXO0ljoF3F1zhGlmSkqS6
         gSMjbQyHpysqpT8tWQwgw+5rQcbp/yezW1ktcO1HWi+wXprCML1rJZPdBVf+vCuXpV6n
         yeC+9M6AtV+J6XYNJ7h2iNIuNNEPSjXzUwfutKBH9k0QPBzqqjI54+RiaFI8mx6skkT4
         lJUGBvYCW8CnYuSQANcyKm2C/5k2lIuKqNhekPUMzCLU23qZea1JAOcx73xtu42trSRF
         q5LthNaOnyiYuIfV3U52v6F+tcT9v7HEfYIgb9SaNj3PsqQB28qGu6jWKVO7zuqbGqg3
         y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164391; x=1788769191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fG6edY2B80yevoZeN3MhpTgETb0AMUhGfbVvl1yPtY=;
        b=JAfaqqBBQ9lSHMK+Nutw9+FEVoEqOT6J9pmMlKllbayVEEE7rEDk6hlcJyNq2XE4TQ
         akupA4Oo+meLzE+98RpEY7WJ5e5Jx+C+tUdsSlj1iudFV4Rh/70TAxzzAlLjoigBgzVW
         b0SrnMB/yJ3Y0hXA/fFbyI04dNAe9PQ/49ebJ8MN6/f6Yb4lnSLgLSUs8aIV4BoveCTR
         2CiNOGmdUYmkMKKQBq4Rn/fUU0zaG0L8WthunnzBn2/fcaNswcOVDTRxrX6ktxrRpenz
         VIjHYBcDZ4nMumvjK+OE32+8AvgdeVNiB8pbDyGVVtFrt7+R016xdKYY2nuA7V/KzkYz
         xjgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq05wXPglFuOIiLpZcZOC1HATS6u+GL0YA+TIT4OMOsqkb96UBNA2EXKcdEhqs8A2BRVsWNiomZHE7o1+4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/8NG5ejFiNLrRbcArg9IAM/nFwcNcmZadlHKvuF6WbGAmdwP2
	+mQcyMx1FC7ybqPJbs2bmbNEMJWnopyDYBvvQiJg3l4SV6zhbjta7BAVqQl3QIuRSdUfKTATGFU
	WOnBhutEUL32HROdu6fNU2Pgf4zbn77y9M6UhiE3BK8RXmt+o26+weMgX7y/CR+2+wkk=
X-Gm-Gg: AR+sD11SNkeViFDvaWonGr8RSe0oBUH2p3RfOCBh5+dtwgUb4MBGVcze821nux2JLTf
	JYaevYRAPHm9xd8xer2lkTL2xpH8UK2ZLx7tJwb+82DlL1q93IH/t02k6OiiaIB7blCwe9hP5/8
	bygAErX7ZNOnTZnN9ZA3Gni8SRsEcdlwrqfAe8bkJFDGQLyKwkAn3c9wLY1Wqma2r+DEtQLJ3nq
	V2peTWEoxvs/KIQRHZR0bEK6+oozQUij9Vgh26aNbL9YDw1DaK8P8h2oN/XPQ4FP0pQZO6fQxQy
	eJ1uFIpfRoyUVZaTSMZ7vzQiSoPv3PScyQtw053URCZOceQMCp3+AOP04udeBqWC6LA2vb9rdOJ
	hCfCqXBiRuqWhH1tEFgx1xgKrEEj708z7NfTeuAiBzf649FdQ9Ks5wEv+ewYh48w=
X-Received: by 2002:a05:620a:2b8f:b0:930:f35d:41ba with SMTP id af79cd13be357-939139565fbmr2873411485a.36.1788164391216;
        Mon, 31 Aug 2026 01:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:930:f35d:41ba with SMTP id af79cd13be357-939139565fbmr2873408885a.36.1788164390771;
        Mon, 31 Aug 2026 01:19:50 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:50 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:42 +0800
Subject: [PATCH v6 25/29] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-25-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=3337;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=wMC2YihO4QtFdymka/2UJ8jIACbnk36l94X1rDU6A9s=;
 b=Oivxgd6UPuqqiiOJ5YCme7iDXl+Yq1ae+wyNRNEeQeAkfWKGqSox8YyOSvZ8b1mKENdqI0t3x
 1Y4jFquGX60CqrGrf+aYe0r0PFKFBqlwuFNtki/GczqoMvTZ9WzsdIq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a953927 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX53mkicFeSrLL
 VFQdBRc+nv6FDNHl8EBo9e62xeVciWyGq+EfWd0FacyMGzssfA+8EyZa2JSfpSAwoy2l7D4Ag1b
 ffx9BhsNHqmhmm6iVyFCL4rZNj6XMr8=
X-Proofpoint-ORIG-GUID: JRId9vnsxHKvktmfc4-7W7BBqaJcQo7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX144Ms4NFPMIS
 xoOzrw5mBHRz3fKyNIdYZh8VL+LdFPoSceVCAu5pgqlRMLPoq7DZjYC2dkgSYLGCr1HGIXTQ+lj
 qbEWQVfi+qKxI9Muj30l5cwrSf0S2vYTEwqKIVY1fRNhQqhb+KJoDhQE7fFkN1bfITZJWqsb4ur
 04cP7s6S5H+/U1f6aVF18k3PLlhfeKf/fFN2oebkRJcMW1bos8miGBkhy23obrxO5PMM4Bo56qv
 tMViNkF2JiwDZsT5JHF58Fa1KD2sMMkMv03u8ZlmDEoh+AIDl9ADOjc8HKmgnmiuCn5uCshrR2A
 JG/yx3s/SXPu7g+B/aOmZmSWVMXmE6sVJgPCsbvbK4ziGwohj4ReMu0J1QWqno6/6tHbBaUeT++
 En+IdROdsmeuFn7XUEZNc3GqhySh9MJoCtEsbmFILOYrfNmNGL/+53HGdlPxSor+0pD6U/jLLbV
 zzxnScSOwXUNt2HEbzg==
X-Proofpoint-GUID: JRId9vnsxHKvktmfc4-7W7BBqaJcQo7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..e70e5088cfe5 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e9a7c9332707..fd0675797fd1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -211,6 +211,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..33ab30300e16 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0

