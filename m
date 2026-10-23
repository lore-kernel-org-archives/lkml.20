Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769520;
	b=UPQLA1PBvLsLT3Q014nXQkIuxadjpDFgYYEs33OtnwwNlx9q96UJhAS1BkW0QPc7ED2p
	 gBGzATs9kXKzzVHLo/FEcj94di7HiK9+fDgVQmuCsd1DK1xek07sx8t0AQQ0pbkCfpWp+
	 yWUp58U/hRbmgEnWQBY6PF8vvCq1SFy/q/tgrEr0tD33nGuBGOL/QZgCCPQP7jyeRHp9p
	 Ezc1mfoeeodhbwvNs6IcW4g+p/+rdU/Em4QpzKqwFUDGuIUzZTZ7M0t3DDMqmzXz5hlVz
	 HjHC2e6STaFio3sQOQnCwW/M3Rpp28W4Csz16nBL6pmhw7OU0tABAeyQL0cpfmz59sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
	b=3Ng2apHxvkNN4K+LjA5QdIeLY7WUI3pmWmHHRzWTGPJdboKlDf+3FodpR8ZrTSfg6HI4
	 Yp6yBmnRZn26jwR6H06Q/efgOiVeRt6Z+ds//wI6IwV7Ib+qe+/guH+XLVY3q54FXLSS2
	 cOaLf+AKyLnm4rvBnIFxUhVSVylxNaZ2OR8dt75+apJhI8sj3T2kX6iQEkf0CBFkD/7xw
	 ZJdzV9DlABGXbYEDUXBm7XkTFBKpz8+VozTxcveNYsiMf+wTeUgriybMCgM1wdjgr5xPd
	 9ti1cOrvWTu90tGh4Pdh8K7OFPm02KdcZanw6AdcC37zsQ1hB6i6KTJz2mWct8VM31w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWiNU7XQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SeE/37ev";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F460A2608
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7F460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWiNU7XQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeE/37ev
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6B0e2974558
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=; b=XWiNU7XQDnB7y/wO
	KLSMw33O9DccCqhyTp1l1enBJDx6Pdj1ty9cFhX2Pklo76XCPN2TIT/WxPydz5bN
	bIXa9HkzDy+uob9QMVv1yZdYhLNS5eyt2Kc0gS5WDyFneqPLQsiQAyGO9ZTKV4nS
	Z6jFmGGWXveI6JRwX9WGjByA9jbzo19ljsxysztw1E9zHh5h0dvgDgAbmGpNF1oH
	93sWA8uvO/NvqDXlyXfUYkbP/yF8BOdXGeoDzJiCiIpIpGh2h17IvlhWLB62onA1
	Dz1TCnVnrUTnvPmaUPi3oHW92ILcIHMc3uR2KStzV/jG9TIh7esjF+vdt5D2HPn3
	M0C/Tg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4t9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc694cb4adso197413137.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769518; x=1793374318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=SeE/37evhoOkTfn1QwT/ffREp0nY0nFgurjYI35Cr+aTo56QLFoXpfiZb5IR6FV3Ch
         t/c/l9Su5ojPXcIoBsQ0nH0/wkO9bzil3vD63nJAiAVUM0QaaPCNivZ39LJKnSfIlMxC
         D/PLvWjlQgqa8n97G0U7d90LatKRo0UAhkEeLbVRt+Lay2f6wlwioqILmqQTFy1/4Wbz
         Fxh96z4egujb2Da339h1x/YozuBB5qivYkh6WEQRJ/GIebx2xLQakmNcogJTk/1DT/ZR
         X3ZuzvJKghVQdZS7u1ecJVb6AEP9Db2vhkZ3NJUry8v6/2QSzFNXvcIeyBaMlZNvDYDo
         pxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769518; x=1793374318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=0aILOCLryDl3veXuxCgfpDFXGuclEaaL9v0rOUdQNmbNIpFBnk/JGzHOSIYOr5Gzt7
         X0z7uaRSTG/FcpF21ePkAJ6DuURyiP2Wsao0WabFmWP5w1q7G020WD7R/Zfu1KNq/5R3
         4P8m9IBdY9KksnKrgrMf4cpOerXoxFc+UKM3UelNTw54GShJGO48anyDdUrd9no/q6Vl
         HeKUVxvYbyTZ/AWMAEnxm1LJdxbnl6bRHSCBfrOsG7FjVsl77iVDGgRAcVyw28oTAjko
         UK8AzH74Cf1Waz93dTX90K4t7HlEZaEusQvBsEh4Td5Ud0q4NDnFAKN8AXDZRPJb2RKf
         VJFw==
X-Forwarded-Encrypted: i=1; AKwUvBynMonQje4YZjlXRe4hoyTksL9UVIl0zizLZ4xpp1SppsLuXG4IoeyRcCIEIv5RDwnueq9rJuxp0pC0Uf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYInzYHQh9QZqZ1g6YY3PlEzC9KGEmMXcWKmTuJzhqsBVHyeHQ7M
	mIHX1cTdx1akSTJG+DGyX5akrLUHl3tSrnEv8V00FQx/vTtrlNMoqoOdciJNSq4PrzcTe/v+kFD
	Uwtmt+UjNLoon+mCBEmhFxw4kUgH4J1gvdeqCInN/ulHlr7qnnr7I76FdLePh2Abgftw=
X-Gm-Gg: AYBFou23o34WBz+BVkxE0fkYGuzeEUDHPQ/+5HZdArp+eV9hU00Eozo83wYvTFy/HPb
	BqvJvrNt6jvmACG3cVbFIJ+AeUIiBjJhRLQBLD1w9CnTClCTCEQ3dfS/Az2/3jMZoruwXE45ddu
	hcngRnYpm9pmWp67QHYQFCrpEqSmDZyCAkbJ1d1ZjP7ynku9of/80cclprjOeViedNLwa4d53G0
	CL3RFZr8a1lJS/7fYSvrDYDMWQdK1F9GquFeYKWDkts3mROQQbtKki+/v2iPWcpzQzqliudxXoR
	badpc7Cf2lJEhOTLGs77ylX7mRoinoSkhiQh17McfdDgpCnxPm7MCwvD79wRDnDjsBMnyl5qqk7
	QkCRqpJizPA7fJI/GROqhuRrW7UVKDekhIozDYU+QzMzFwUpvWvIQAWgWkoXqHC3iPeaUUdZ+qn
	bwEtsVkYi1FdTB
X-Received: by 2002:a05:6102:2b9c:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7ccc334af2amr900585137.23.1792769517885;
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7ccc334af2amr900547137.23.1792769517232;
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:22 +0300
Subject: [PATCH v2 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-7-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=opQ+Hay17WlVMklcY1kZq3cMOOsRo3ASKSUfJonVxsQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233VQDsPdiHby8Y8BcS3wc3WMLWc/zB4nE4D7
 TG3L/oCIUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91QAKCRCLPIo+Aiko
 1RsUB/kBw944ZdwyYPTkROO0CRtxWx+DAfMoWeRVvb+lZUAovbL3gKVO7f9Fe86GgFlC0UXLTyj
 MvZ5uUAYQb4zk0JLcAfrHDTOpSajg/WBaE2bYiuS0c7fRp/B7d41n0VQ80ygNB6ZLcHvgQToXdB
 kFTwZXvkRJn5z7JUzetbLpTZqE1GymwVj/HbBrcz+6cE1zncMOHNm2+EB+fviHBWWCu+nImD5k3
 ObSXK7iiAiXJM11OIONbf5eRaWMgPnW0uYNdqMT3H71AFXQPfkTDcOy8iiPd3Kx0DVJzs6b4wCJ
 Ec9jRKMVQBXYU7k1NUk+cfYZacl6cP59CrqitvNDeHLh2/N2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Q4-zMbqNOURysGvwPHqWNb6A3bDUcsEc
X-Proofpoint-ORIG-GUID: Q4-zMbqNOURysGvwPHqWNb6A3bDUcsEc
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb7dee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX3jWN7ZA7g4Nt
 R9ZLV8Jw9UobVQTFRLZE1dfiflRVQP38GO/DBvS7ZW2+9PQ7Ffzo6/FTN1Cf+Dkli5TPe3R6YSK
 C3oNBaizFs9bXwOUNPVA9c1iHt2aBfE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX205e5Z9awF4Z
 Sd0kYdBx61NGtKq7uJi1M9YewRuL2g8mSUD6FqfHBgIoKUkm0rP8q/36uJh2Nqxg0OJTaSvWq+s
 03kRyYZwczVqi4SssNnj47rmJxl+fEipQ0q560mX4cGlEE0ayyinVdvVpuW1TfDJJC4Vr0u135U
 48tT6aRehYjfwjrm1XH7oIZPFiKIhchD2s+zsDO0mjPMpCmWQZwbB+EVo+Zq8RaBWijf9zxwmOr
 byQlg841/Pa0pKAeAjz5LQ8h3Q2aLbiP5Qn9kQvj0e7KiB12isB2LinQMMdQhDtWLw8MuC8rdLW
 0TRT9tEO6uU3RQVPPoOBw2yi+8S3ke0hiipDB5/iqYq0sPj8OK6DH+pppDN/ExS3Vh68s9XMhli
 VsLDp8aTDlIZ3cz5dFPnRJi55DCPfabv6lrzC0bp+Dq9pS1e0uVKejwocj/V3eKK8K8FV6ZMVqZ
 1Ys1XKs65RJlI10U+9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 45 ++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 085c23820f46..30af8ef51e4c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,26 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +505,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +518,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +539,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +561,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3

