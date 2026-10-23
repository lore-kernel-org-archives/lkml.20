Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769510;
	b=pi5HH/exV9TxxHu55jixDGotuJxUfWeEKri83ulJfcwtTWdtAMcptHl/1l7D8wSAkHZ3
	 MBTwef+RhEuRnnKPA871Eq1johS7vA9iueWTN0XZfU1oNGckdYORAKAPGSvRDsEBceddF
	 hKumL3t3kG27nQ3pqOWFeXAHamMJe3rlzUvcIj48ZblEuGEoS7V57bGzq+M+MnTTaF0R9
	 sKImbWZ1vw2s9glT1bzd7eVCgK3gnbj4gK5UMCcHuJk5lUO9XmPvGrRTaIIx7uURrQaOY
	 FkzTwhSUvQKqUuaIkUs31f5e2qtNP12dPqw3hL6N4ejf+Iqdir1EIUOG/Rj8NvWEmkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5NpktZAYKvmRIXCSHEgS8BrkSWuOnrvqUCUENaXQblg=;
	b=D6a8X8j9nBtYiqDxpiI3sasoKHb/snbWeOG4zCdh5mrDqqx6s0SnAHdEow6r4WdMi1w/
	 ndPt4s8Mq6to+66x59qgtlLTK0ChS3CxAT1f5Wk0a1JyTDHjh6kGTE94NXGytAtI7/HeJ
	 LRdOd8QW8GMlxUi24rHUtMobC7TYihAWaGksyafYjCRL1nkGVcTlr1PYZLRz0Oynwm3Ae
	 0OHeL3i+qDGFEp5mt8yPyJaEFugerlalArqKQ/OJ7ZphfR3C/C1lIKtSkTOad8iL/aagX
	 gzHrH4djzkl38MwxFts98f3Ge+F8jjxzVMhvHNN2SOZBKmDLZc4hFOFtd43PBBH0IYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8XKVsEb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RwS54Zys;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8XKVsEb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RwS54Zys
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE69lB2999826
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NpktZAYKvmRIXCSHEgS8BrkSWuOnrvqUCUENaXQblg=; b=m8XKVsEb+9dh4fnG
	RXcrquT259+z+ocon0xm7VF+/ElVxo8HCrdy0EQNQ0hK2ZzEAqMHspPGx5IY50Mb
	DSHpOUoOUGHqKKULI4duG/amlDj/AEBI9tuQLRrUXzn+uEk5l1jGE0pBmkN+f5yR
	7R/fZwQNEHhVL9PM9p7kxs7RDfePtaXQiH6nnznSAQugp7v6hMIbzjWHSq3a2aFy
	CItjNO4Fxq3wWmqHvMUQre85iHoGYLsv14bC/XcNYQvCORwe6VmL2Qpdf93NEt0r
	6hrbdNkRYsdGWOSTr3gquFMtI8vQuiV6TDW7zXZ7f6bJAL8LD+07Riha5NU75VAg
	1fo/sQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0q4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf45382794so918450137.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769509; x=1793374309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NpktZAYKvmRIXCSHEgS8BrkSWuOnrvqUCUENaXQblg=;
        b=RwS54ZysocTMsGJfx0nEKfUWDVOv6GaGgCklwSeRferiR/rS3lfimsYfAZakI0UHob
         owHb0i9F1ksxnYDoFV+fsSRozCY7I0EpHReNzct82X8NB/xquX3G7kYu5gPQ1gC7Adow
         TrDrKZOXTpfA1fHPyHbVH+SaEX9CdXoVdQqVkDOsKYyNNw3WX/j1aAhGMaIcqmcGD+x+
         O9iBZxhQt884XS9JSd7bCZVoV2dEp8zEXkD/AEPpK4nM62xgjL2GfNnXdGuVJLur7fLj
         QhrSGr+Ov6LoeKBiQ0+I9aSbO93New2tcqxaFBzdwYSHafN/xHsKLQHOPJoDHpr0JDnc
         E0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769509; x=1793374309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NpktZAYKvmRIXCSHEgS8BrkSWuOnrvqUCUENaXQblg=;
        b=sz2Q6nYPCZ9DJvmB7bpMEAFdm6Ne3laiia5Spb2iu9pr4CG19BQ3ODtFm/FBfRmp7t
         kIAo0naiqB/rv+q83lpLVPo0SUubr/6fUFNoWMZZErk3vr81zh6a57cbjrK1EPA/A2xE
         oIRzo94DqeuVk9CGwUZ15RYvnLcV7qqrWZbqSpsg1ankEIgcysan09Wp3GnQjAbm87md
         C01c2txQiCzqCYNK9AGR6rrndDTvq/lnpNaSpcIU6MFu/tvsZI0WKdZkQOCypyYWkIEL
         zQA/yxuwUT2caUl6r0OeQNWhhHnnO0FHH9qnC31Essxl9/QNjWp7UzeKf1cFjLVjSaeJ
         NH6Q==
X-Forwarded-Encrypted: i=1; AKwUvByvvF+sUFEiOnBiZ8DR3QEAUOpVIGpx7n52eqO7YKjw/SHLRut8wIFlFLkdMlXLuX1ikxMZF28mjyqzYlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdyY8N0b+yWq7JiVYJZDZQ2Ks26sMyL9isjODOPX5bCN7/FgII
	YUe6f6JHeXDvSTjDE8Ws1ilQweCTcDTlnAZIxIs6exlbFZNybXwDhT07UggXtR8hnxGQWkhbrEn
	SsDuvntl5S/5bdridH86Cto21GMSE7yKIMmTVz9ZYJxB/yGH8T+SSS9PDU/+T8+XSGck=
X-Gm-Gg: AYBFou3UKoDyiJVImIfN32Z6tH6jcQZCV/qVZYStiDsMZC/LonIUghk8p/qWxOHWNzQ
	TjK4gHqlQJzTSZFMbKj+k/0QE+xBD+lYiKutLvr9aSN0mxUs1DmeHifCBqsuXIF+ovJG3/Q/ELY
	MdRoOypXXwTsaGvFCcP9RKShhgj+fq6LaT5z4WsDptPNQMqwPEsjIOUTUw/+eWRNBVcOf5cEfZA
	GkuizCcy46OafTQQ3WmsD1fS1PdqJCICUaj4gPfzh1vbdFU0F1LwxYjeGrTYrW+G260DcdfophP
	7yCH7XWMzXCOdmbED114Iy7orvnqfYanYtpa+UbAXKif1L/ujVV7XS4nfpO7Jm0646bm7tFBNl5
	U0JjZp9l8zeCvPQ1nXhivFMKmFUhSTB6G9ayh9Fzg97lNxBuQTxu4nkaxHz13DqEH10UexD2qBp
	eI51RIsRSKy0l5
X-Received: by 2002:a05:6102:689a:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7ccc34d7213mr1222461137.36.1792769508561;
        Fri, 23 Oct 2026 08:31:48 -0700 (PDT)
X-Received: by 2002:a05:6102:689a:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7ccc34d7213mr1222444137.36.1792769508026;
        Fri, 23 Oct 2026 08:31:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:18 +0300
Subject: [PATCH v2 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-3-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5574;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsciqjUQUAepO/wMlEzWnFIrkDITaW1wbhoSQkjRRgA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233RR98+M8x1GCyQXFt1bY+cjezemfhNe5buV
 hg28ZWILQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt90QAKCRCLPIo+Aiko
 1UJVB/0fojKOQ/dWFfXoDvkkdQPsTaXYpUQFiQXB/xhv4A8EXn1AwvVIos2gWqi/LWe2kMOD8QV
 PAZDG3CbbIMpWQhDoSI1MYOxHsr3iJ6EylI75M+869lD2hoOGhcHXF1VYvbDA4A7ehiD3qx/OZS
 ab88k0vA8m/pX77AVUA7Uml6AVwx85xMlnKXDAn/uSI+hFSTru4/cBy3jxB9R+hgBMUUm+ShIQ4
 6RmUHfHQrAis1gajSvGFml/3s7FIsyxFPk7hCX7xK1g4aqVytBU3EM6I9N4E2zoQT3/B/7kb5Wq
 MgU6oLdy5kUk+LgvN/PXru+xLh5SvDuacvymECXSrAEL1xNY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9p7E4MT7kP5b
 5YZEsKtL7YUCC7ZCuz/lJ2HBVFtPAavi/f4qTvHaHFUFADPS+dq7zbi6WqxFRWbAT2NS6zAicyY
 i03cFhX7sWCgDA4NkIdpFBnYVp1dPxkiT8dlTnuw0vJWid3yfmaC2a3B+8t5F0RMrliYHnXFma8
 7knrVmM+pHegAuMwe0xpdE29+HMo4p3JxMF4uami36310+WPI6aOkfv9FXVyxwCs3CVtiswNIVb
 ysXWVgRMH3aGVJmMxzYjL1ctepFmTaS5/i0/RVtxgXz2zsXnORSXwzP9bjidsMwGTeroGOCPKjO
 jAJgRQg5zlrlmjjvEE8Z+5qe4cl57B2EyqU/DEz5SwhK0DCsGS0txQpjykeQTM9zLxPnSLs4zE+
 gVM3QRtdtV5OLPdaJjPZBjWuejZu0dufPbEUHjjyaMqq/A3swwbob6i5G1vuORDh3fImBGyASya
 UwJ0xJa2zWUn39T4F7g==
X-Proofpoint-GUID: 52fDPzvkjml2UPzYn2zhoVFJlTqQ2BAo
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7de5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 52fDPzvkjml2UPzYn2zhoVFJlTqQ2BAo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX1sUfT6ctexr3
 CtFLCbPzKfGkiq6GN7vfdN/MVYvuYn6Mml3HQNoiEhoVQAvncT+ShoJd/2QLeNcfXIeLsNLAyjv
 tc6FtWidFcUiOmSGGcNudprgtXs01VI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

msm_drm_kms_init() leaves behind whatever it has already set up when it
fails and lets the caller sort it out: msm_drm_init() jumps to
msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
has a kms.  That is the teardown of a fully initialised KMS -- it flushes
kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
yet when the failure happened early.

The kms driver's own init is the first step which can fail, and since
commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
failure there leaves a NULL kms->wq for flush_workqueue().

Undo the steps which have completed instead, and let msm_drm_init() unwind
its own error paths rather than calling the full teardown.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index d157d227566a..6b24f353de7c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -181,35 +181,46 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unbind;
 
 	msm_gem_thp_init(ddev);
 
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-			goto err_msm_uninit;
+			goto err_shrinker_cleanup;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_kms_uninit;
 
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unregister;
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
 	return 0;
 
-err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
-
-	return ret;
-
+err_unregister:
+	drm_dev_unregister(ddev);
+	if (priv->kms_init)
+		msm_drm_kms_unregister(dev);
+	msm_rd_debugfs_cleanup(priv);
+err_kms_uninit:
+	if (priv->kms_init)
+		msm_drm_kms_uninit(dev);
+err_shrinker_cleanup:
+	msm_gem_shrinker_cleanup(ddev);
+err_unbind:
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 err_put_dev:
+	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..f3e39c3907a9 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -225,13 +225,23 @@ void msm_drm_kms_unregister(struct device *dev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void msm_drm_kms_destroy_event_threads(struct msm_kms *kms)
+{
+	int i;
+
+	for (i = 0; i < MAX_CRTCS; i++) {
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
+		kms->event_thread[i].worker = NULL;
+	}
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	int i;
 
 	BUG_ON(!kms);
 
@@ -242,11 +252,7 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	flush_workqueue(kms->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < MAX_CRTCS; i++) {
-		if (kms->event_thread[i].worker)
-			kthread_destroy_worker(kms->event_thread[i].worker);
-	}
+	msm_drm_kms_destroy_event_threads(kms);
 
 	drm_kms_helper_poll_fini(ddev);
 
@@ -282,7 +288,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -295,7 +301,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = kms->funcs->hw_init(kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -311,7 +317,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			ev_thread->worker = NULL;
-			goto err_msm_uninit;
+			goto err_destroy_event_threads;
 		}
 
 		sched_set_fifo(ev_thread->worker->task);
@@ -320,7 +326,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	pm_runtime_get_sync(dev);
@@ -328,14 +334,20 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	pm_runtime_put_sync(dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	drm_mode_config_reset(ddev);
 
 	return 0;
 
-err_msm_uninit:
+err_destroy_event_threads:
+	msm_drm_kms_destroy_event_threads(kms);
+err_destroy_kms:
+	msm_disp_snapshot_destroy(ddev);
+	if (kms->funcs)
+		kms->funcs->destroy(kms);
+
 	return ret;
 }
 

-- 
2.47.3

