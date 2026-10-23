Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797619;
	b=Rd3KhfCfwqZQYmggAKtXPeLHH7VWtWThuJxG6Cwh964Nle/nVA6/nL8XkVEg/C2rC8Fl
	 8ZC+XRWqm8NJUcmKn3eo7MsLQbydEEw3DwQr3i30zg48ksfxUNc/5NjKp+lTb+NEUJGVB
	 nXEXiMToUCNZPAXbd02b/k4zCkQXKJEqnOSbVXGedDsrX9iDe8PARKbKaGtxNe+brtJ4C
	 F1uGUVvWI/Mvw6CRaUjAx1PJDNf8VUn0XnXHWjYAltV43A6d0d9ZR4jyNeW1aI+pGohxC
	 LeeQAreHujnaE7AgVjg/wtt495s3TQ74UIkOUmO/IPFpIRlCAIF/hFqJa84x7/AGryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
	b=rRYzSgaCrw88CYpYFZRmGQ8hZ5gBAVNNvq7PJ6QlyKgT3v2JJh+Yajl1gOSAz6xnw1nF
	 bUlUITDIqhZduaaNxDoXlF4pjVf4PD5c8zv9yHPM43RKxggnOfJtrQAaf/TdMCSs5R1F1
	 w6NclwHtz2c8GzI8oHIknLMf343Ax+A4ATr9m8XvOBrtXDfT9L/0GjVEcc3uA/031QeEy
	 KWtCAJbokTkH1Mn4c3ITRKyhbuRKtn33GI36j9Sks+NuDEn1nhJ3Sty5mbm34zJr1zH5Z
	 YR3ldbhN/UovT4yk515ENVP9COujIxr0D4fvRf1pvYBxpEHFylX/qWhh0oBAXZRR9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ao/ptJg5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RguOKAyR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ED8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ao/ptJg5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RguOKAyR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvDir3983449
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=; b=Ao/ptJg59NS90RVm
	IGmrpKzIwqaXNdqe+TSdzd7jaqz0A0fCndBOYYCyoedLyy4Bb+Hn8etARNyCVZje
	gKXLLTKipqKSqDFQfA3dNMXvgXZBQtuHvcXDXm48J49Olv0QMYdoss9vZmrEXvUh
	KgfBqJK4AzojPMdH+zN0VBiZY9CszrYqlOattt4DLIvcjkJeoHOjHevYpnlXrQv7
	FixPtNTIH+OEHSmFNCXDpK9MMHx5bV8PKtwUQA872tl2xRi6yYniKqHiWNhse6w3
	Bu6yHpj7ffVRhhhG64aDbs+wbwuQFOpPY78tpScAbDLAbkoiG2v3f+G6XjA8soOh
	KJJOvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1cxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so143574485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797617; x=1793402417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=RguOKAyRBfkLmzK6fcrvouPECrxRIrgNY9gVywZ0KiL9py/c/pl8N3kcvccwDSyLJs
         eQovJb/8ZlMnpkhMxKuyrHJqKpmikoGT5/OHRcfmN86rYHKwbOI47P9F6XzUIPsz+DIL
         Go9aWcPJRerOomZHCTwcTbu8/lipyhkEREcPmmMhaQ8g6+HJuYqQaXU+iDJyoP2A5fUn
         PXJJhUsnvhNYmZvIWrOfhysvQFqVfPZ7mIf0S+yFCtRHu6yqAV4Bf1WWHSSSWIaRyhgR
         59dcpNKN5YcnL1olRrHieWi7bhEhjgvos90pypLVuH28U4qqpVikRSYN8fG9s2K/JaRa
         oG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797617; x=1793402417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=wDcqvC8pH2tdxLgNTdpEDK6SSMpyr8lcRP1slIO9+/Z9rzcASq3HKcvYgDSUYV24LU
         Jo6MSMvPjGtxE39IoRAso/iPSXWruyZVvATftAeuvc4z+YO14LkQ+2NjEl2RjvZsBPnZ
         EsWmv0tEeulM/EXOzezF0PqWTitznaT7R0WJTQhxJKkP70rtZHqfEAIwbNz4+cD9MsOI
         LuNZEkrUCV4ID1cOgHOordU/c9WoVQDkRNgFr0mMSCEiKoqcdd5++ULhPWnvtKqBI+si
         ge5VfrM9DTQgj5UPPAZSTwqMo/i7/ntTuB7/EfSLcfHhGJFtlnwKKZzBvtgi7Kl+oxs5
         7HUA==
X-Forwarded-Encrypted: i=1; AKwUvBwRL4VWhM+4JIVckg8FHIzQ1vn6vZxgvaGiMJiMqjWLxmHs8w94ezCEo0PEYdUwaeuMASimktpONUou/Zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLOCVfGy40utJRh4ER9MTw5MaXJ/M3RlgyBSWU9iEWI6PM7D3b
	JcW8ktukbcvBKvMzNfu7mK5/7I/pp2BzrDEsegT77xEcelm0vOYVTdObH/IPR4eoodtV3tJQib3
	Zn6hj6yVGnYJCP88QG/XDjTG6J/4Hxyz84maGRbwf63pAlcoW0A2YuIggLM8903vPnmg=
X-Gm-Gg: AYBFou3e8rWngI230HshzZmBc3JchjIK3clvgxRS8J+9lrvYoQNlbsG4TEhfmIZQrEv
	RvHzo/1W+PU3NDh9ivHD8aW/elUP3nUj4rkgiNdeQZxTfIqpd5hrx8JVTQ7SmnunvCtsfOL5hq+
	e05Dwf3vvPPOC2TS0BHI5sqeULjv+zweyuM4wEIRaXxeGJ17C3la7WeupYI13PHk6xhOIXFJ39a
	QTdxH+QPAS4LrbTjXrxqaNE+TWnnUgEhq9IuKypS/sFXq5zv3dxwSGoyl/23HGhO2YY6faVwTvz
	yorq60xRvNQoFimTYMjfPEg7j9JYvDnCD81tRp9ghT7WJFgAcJ7B8hl25vF8iksyjCVKExzegFN
	0SBbpMQlj3iaNce40Fe3zv10ChxEU4+WYVU7YQvjvRIXV0H+wYHZ1fRbXU+DACWYt9UFiiBf14b
	YB16+KCS3ib3n8
X-Received: by 2002:a05:620a:468c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-940ef938c5dmr85204185a.34.1792797617011;
        Fri, 23 Oct 2026 16:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-940ef938c5dmr85200485a.34.1792797616467;
        Fri, 23 Oct 2026 16:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:39 +0300
Subject: [PATCH v3 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-6-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3336;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HoBk7ONYzI5BFZMtAgm7hFiVZaXXxP5N1D12n+PHNRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uSLsuuUeBLROB8GPizxh79t6pB0V13gYz3j
 y7Imxa6t16JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrkgAKCRCLPIo+Aiko
 1ZS9B/9nFMwfcym2Tmvvdg3HlSJfRlePWnMrdzeap8J9fhto+rlTogLlnWUK6mvz50PPrYOa8PK
 IFgsGCPkTf9DEBYPtnWx+cQ9yPj7pCqGE3S/8yrmnqH+EhuiOe5v/2/E3gUs8/01xfoi3gUqeNR
 mamI0zzk7PuXvrp2M4BHHo44KknDOMBaHwa+LcqnauENGZHeWcIEMqwFaUwxROLK954gnWEVDQ8
 2QKXPbWYbIyl2slK2NofcrteCJrxJX0yfwErqPAQ7+vx03z1/3ECR2QI2UUoigrBMMyBs1CpU6W
 DTQtEFMG+wMrWmvtiCtf466BlqAVVRXy4LpP2DftoE44WMjh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXyMYegsNScVtc
 wHgnudNZ0CnpAePGmLDEabU2y4RM+5HRWPvB48NXhnUlEw1dM1v11/XJtFGMFEVoOe82tzKA7h7
 T9v3jlE6QwoSilVAnBEEgcYkvbrIhK9R6zGnNHUi6EmM2QN39U5eXRZJ+xS5OllbGph2Dp2vO3n
 kz9YSq6DDr4631BsLSGwNmRntKV7CBVX3LEDhUnaVfLuJt9jgclS93dQQAbo7DWFKe+aL1UzYTV
 XPLiDXdZmvEn0O8mdisGtbTeep74qcv4kEQgxi8z0RFAaBYRNiJhfcSM/wuR5v6hY8wIgARqf13
 6g5SiQoA+QL63EewTG4/YIrsm7wXSyEDT5m2X5PpuhxR7+BvUEYGBoy6zqTvPYabTvcv4AfosNT
 2YUROhBHzNqgPsg2ywiQBZsI81Yrz9NaopVKDNOWVFDuilZbaDIIWQNFD+nKjNPOJzhbHzhsJOf
 Al++/ydI9YQSdSqQdog==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbebb1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DqDluaqBKgvBNGcJzpYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/GjKDqwVeCDS
 JvMwrsRs5DJcdniJSRMfRipEtyqES+igf2f1dyudaQ8cdVfypPVRYTYwy7b1/9PYpEXYVBJyxEI
 6W6VVsitXeVriJFWJzMUn0bc0fDQ+DQ=
X-Proofpoint-ORIG-GUID: LKwRAbGf_aiXhwB8u0kXQVAKWPUvZXpv
X-Proofpoint-GUID: LKwRAbGf_aiXhwB8u0kXQVAKWPUvZXpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
callback, which makes ->destroy() responsible for tearing down a KMS in
any state between "not initialised at all" and "fully initialised". The
kernel convention is the opposite: a function which fails undoes its own
steps, and the teardown only ever sees a fully set up object.

Let the kms drivers switch to that convention one at a time: skip
->destroy() after a failed kms_init() of a driver which sets
init_unwinds, and let the drivers fold their hardware setup into
kms_init() and drop ->hw_init(). Set up the mode config before calling
kms_init(), so that it is already in place for the hardware setup.

While at it, tear the snapshot worker down after the KMS, in the reverse
order of its setup. Nothing queues a snapshot until msm_drm_kms_init()
has succeeded, so no dump can be pending when the KMS goes away.

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 23 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a94d2888a21e..e4d61935a6df 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -283,12 +283,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		return ret;
 	}
 
-	ret = priv->kms_init(ddev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_destroy_kms;
-	}
-
 	/* Enable normalization of plane zpos */
 	ddev->mode_config.normalize_zpos = true;
 
@@ -296,12 +290,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
 	kms->dev = ddev;
-	ret = kms->funcs->hw_init(kms);
+	ret = priv->kms_init(ddev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+		DRM_DEV_ERROR(dev, "failed to load kms\n");
+		if (kms->init_unwinds)
+			goto err_destroy_snapshot;
 		goto err_destroy_kms;
 	}
 
+	if (kms->funcs->hw_init) {
+		ret = kms->funcs->hw_init(kms);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+			goto err_destroy_kms;
+		}
+	}
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
@@ -344,9 +348,10 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
 err_destroy_kms:
-	msm_disp_snapshot_destroy(ddev);
 	if (kms->funcs)
 		kms->funcs->destroy(kms);
+err_destroy_snapshot:
+	msm_disp_snapshot_destroy(ddev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ee98393b9855..2f097e23e2e9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -149,6 +149,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* set by the kms drivers whose kms_init() undoes its own failures */
+	bool init_unwinds;
+
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 

-- 
2.47.3

