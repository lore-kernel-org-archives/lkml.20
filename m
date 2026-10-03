Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829027F728
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987245; cv=none; b=dHIRu8J3H7ENqiQsCVVW2l47Dt44D3yCb3UshcyU95eUm3Vt0bQUgc6ASih6/NhzsVkFJ3tV57JGa81ztF5iatA40UZpfZlInyWDSs9/YU2+Cmq+0ozL9yb9K++Ewu50VKRQk0MThS2I4am26yNlXuo9xfS+EddC3idOVcLC55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987245; c=relaxed/simple;
	bh=pQ3ltdI40X3ctLCX1uAMzBt67JzA+i9lmpW9lieI8iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQNzrBWiB0jfT8YT0xnlts8L4ExRGH4v1y7+xs3TieZISXOJ5pbfnrifsHbmfo6Ntk7+HscLgU7FJJH5DEfXA+rYYjgWbGPII+eusmUkAhTHBXie23ZhFnfxWd0uLl8JpnKeoNUD9rKjnHZpF7j9MItjqXGs09bhkesIdE0sJpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d85+5KkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awWvmeup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d85+5KkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awWvmeup"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJuh2309717
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=; b=d85+5KkYjfieP8GZ
	s+ach/NR2zwBy6DieUnrFCuwDiIpB2Hbxzy494AEcJQ6nWcEhZao2WP0ISF/5vtv
	KO3BRDg5pz8LrG6UHWyKW7uNK2LX7zDuNHI0kRR8bOtm7O8XhQ8R5c5+s2BlycIa
	3+5isix14eU0I8h86qH+MzrHLquiIQIl6p9raZbIsiajfqgdl8r4AqOG8NYHf2S8
	UdFpUUhZOStXsYRAurObE+7USbj2lEtWtHbo1G34MExmCdpkkp6vm+ufR0F/ZgQb
	FCdUbBPU81Bh62WmfcF+5WBdaf8EWDikgvrkJAW3C08BZwvkN+dYrJpkJu+OAGr4
	O7bECg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so17824285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987242; x=1791592042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=;
        b=awWvmeup6YTanoesrdVqsA7XPDF+7y66UPzJ2atpRoHZSo26y0BCMCDeRHyUpcMZM8
         YLamJqMRF1JXneiNlOLxYdO03VIb5CfuaHNlAAQUvNA1ycJ65dvwoFrAl3OEN+9RKS0f
         cbrNMtNYyEIp09jdWLr+e6JF7RCUPphsWlSQyuHGVBv0dl0MJ+ok8XgCXF8lsul9SLvU
         GNDhFkwfgRDmvrLqZJFo/cduU8aqTRXjKBl4nPhBQKPbnQJGkOfnP2fOAFo+WYtnjakC
         6LsNkzrXy/gxszpNQt+M7aXho7NpTJ2BhUieDoNpMkkRTGwycX+S6gwxN0wZhRzuU33U
         TRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987242; x=1791592042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=;
        b=zdvl1xP+pgqXAd+3uD9/KKBybR4MeC48rDEFAYwZ4fcM4UYp7Y2gXBXYgtK8PT2IRB
         Q57WDOAn7OXu8Hgjm/k51rGkNHGF3d/zcX1md2sgeRmSWMDK/dpbDyqWLRkz5EiNy3Cr
         X9hPaLloeF5b4L+4V6naQTz/3ypHXL2hAe1Cg09aO48wySycJAYQfjwmnnMO42CqSOXy
         po+jUaVqVQdJ1EZpV6VJcx3nV5BuZDery5SrPZ1ejsS4ZmO1+vP7+31PHHYQDRyhIfj6
         InJJWvXPLJlDztpitqnVSv22aBWAJY8Eq0riThL0MpAFumsAW8ueXeDicirwjPVtJlvf
         AtpA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Z174K/VACe7UeRiEizWO/zIHbstjV+xS/hbdfq9kjUqpvlNMYDxKjk5nelcXAp0vIefkzVnr80XZVJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kkhu9wCUrm4JU2Spalqk2RIh+JJUjHOTvGKSnX2fBx6AekxIA7
	5/BkED9raTucx95d5n3hwqs5U2DyiBIpTg9310TTdi3Ik03oGrIM5rQ7whhKD9sc1Hv7QHSIwY2
	1JIPbZRt8hcjXMbyxHbdSPqjaAFeHMbpOFmS6lSBr9pkFUEKI64ZPUXvd56PMdvyWZS8=
X-Gm-Gg: AYBFou2O+YvCNj1+Y37dO2w75azfaRcVe835TWn18EpeKKJyPSal+QOhAHnOStJdMgO
	rE7l7J+Kmpjs3OpemsM4EZ0MFvg5Q2am1nNAIq3X3s/Y2P6t4dZDWjzVbHg6MjWnbYX3hTAy6ah
	ooX39Xwvv638SduJmD/+tpKa+daWc+2SU6FVvA7jeXSTPRGYJgzsPcyfRA1WZ1vbZ4Gkv+SOhwb
	ptXt11holVfXza+t0KGPe30F5xFMl63UyLqZMOQRxmWR2G9yNEJ9HynPm0wJljV8rts3X9Z+XT0
	STTxv8mQY1JAh4pw4md/0X8S2RqUB+XgbPECMGiArUtn0ndPvNoThTaAaVevfJyQFaNTVy/IjS0
	VnTe3foVZmkKX5w/PQxEl2U+/iTwvH/AqEF4P+kdfIMAl1TmbzCzqkPBLZnUI0/+tkA4KYnAvnm
	vPnDrrvV8U+j/Y
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr852487785a.59.1790987241766;
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr852483685a.59.1790987241260;
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:12 +0300
Subject: [PATCH 04/11] drm/msm: let the kms drivers clean up a failed
 kms_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-4-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQ3ltdI40X3ctLCX1uAMzBt67JzA+i9lmpW9lieI8iE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YB7wd+ahkl05/lf1h9Li5OmEHH4Eju5rc7uRq/iF376
 3m/L6Cqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATUWjnYOjIMZEvMl7zaEN/
 4LyTd262XzcVLLuxqXr3ps2/9Rnr4lybXOtZZFglpKPk3p6XitwaMEH3WttXf7PtR9ZofczkqSv
 eZ9Odkt9hnXds5/HWglnPPRj/nw2uaTub9CLirKMB35qcin/qHes0naTsJ50qmf5ZWkJX7L0+Q3
 ZCLTtft03eVwXr92oB5Yr8/3Z6bTl77Y/DJuHvL0xUHjfr7JBaErxJKXmauUGZ4apli7rETVxY/
 +0prt/Ccowtd1uacH7VYqa6f96rHa9M9rEx5mI1kE55LrHw+l/36bVHv0sV14SXe82YcEN3x7N9
 /Tl5Ll2nTW09vnpvDbz882bfqs28YUKxN/w9lAI2SuYAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: phasaPwCIhGgxl74_pMl2ug-bDFX52WS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX00sE7gfumTVa
 zPCQ0ipXxf+TpKKem1ya39QtfRou99oU2Zw/9BcxzI096fo+rD13s7zJG702t17ikhj4q8DJ4qp
 S7+RSxnL5McS4h6Rp8lCoG6EKM+mI+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX2vHbNcAJ7Qn2
 eT9LGMyK77SbS9AaEjAtBweVk1Fs3gItXfz8n/uWelqnOUTcgthNIDqguBTs5E1TccW9sYJZlzb
 VdoOMl0ZmDlcbDjgfTAY/5VJHoZp1Zn6U9DAot+OL+aG99ZX0xv4X8GUjJRj6JjddeYk7KyAYCq
 xVD7qjG4hLeyQpXxfoMHDtCy+OQFSYzYAMUyljtAfSj2BuKJ6BIXCyHUotaWfrppqVWgHBUwyFK
 hlactnBC77ENZvSGOuAm2bVCl+BKyUsN6beZzyQJrqBr1NPD/UB5KLegPMxtmNwtWmgf/393yAE
 URcLoda2Eej+S9hTduCMaTW9jblrkd8o9aWDlYzQ/N0APXuya3FeTT/F3cQI4Ma6QNgNdxi+S5d
 P033HA04juFb5AIOwiakGdomr5auJ9v19An/AeKl4HsCe9oi4NlSNUCKtBEewdPN5DPp6Wsm5w+
 hSDbLzeSEXaR7ouawhA==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04bea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Z_Y2H-rH4idggrPOQXcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: phasaPwCIhGgxl74_pMl2ug-bDFX52WS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

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

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 23 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..f65774b04c6f 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -285,12 +285,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
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
 
@@ -298,12 +292,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
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

