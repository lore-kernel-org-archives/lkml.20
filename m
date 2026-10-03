Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC22F8EBC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987251; cv=none; b=PUZb/0jzQSU7N6tYWf0gujPo99hI+ZUpfFLOlr8rYBOnVifqIggRhlEipaISO5eaPtX4xB0eQ6/n0BGBGbDR+R+Ktw0hN4Cmma1pUXMWFzHJUnV8TMxIsdUUyB8C8FDHQRVy8vMc3CbYbrn/EH2+/Olky5jZcREUduXSPoJ7iwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987251; c=relaxed/simple;
	bh=Vauz8vkoz2mqA4n2iwhmXElN040z5cKhm1GWiLk+akI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF99X1jGlw7w9+x5+ODiIZIrHOI6bS2oB1wtD2uxNHf/mqLTD03GEdPNUPFKiMqVfcMU6BqgWdn0O7hU7I8cqOS8gaT7/d10oGLNIjI5Jt2Ihy0ckYl0jFyoOOkCFMkVix4Vw/fZOEkFEdGXpcNFBjlmAyBaM+xCcH9K8SgByaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrD7CoDn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhyOoYhb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrD7CoDn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhyOoYhb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne5FH3812192
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ws4bwEHkjoP9xPsOYI2At0LKBMoZt5p7ee7rfVN66Q=; b=nrD7CoDnv/D4k0HU
	WC78aZoL9dY1U7C6+/Xt7o7n8gKR5bsXU4obBUzNpTjXzJVuVAhjjGxE7SqkGpw7
	Ryd7DojPWFUQ/EEAniCxJpmQwI+gHXFgACuVUQCy+f07zgtqKJxTUtZbDEYLDBxH
	v/dHItfIQOoUNE3ODmVskBbbyU+gOaDRTozZZlVn26fa+Ak+c8cniKk+aa3HqX6z
	0iUaeUawx2FLE+dPCG/+DQ1AP8plg4n7inxtZsGkU550cSkxo7NUSNadura3XB8e
	0Jau6wdiq9VJYVr+5r4ThZnMSBClSTWR0sflRM3U3QsXWTKQFeSED2zu137m8y3k
	Xyd1lQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mv4b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so28719185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987248; x=1791592048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ws4bwEHkjoP9xPsOYI2At0LKBMoZt5p7ee7rfVN66Q=;
        b=VhyOoYhbSGYmpBffTfNcqEtdmZn5/pJgVk5vlTWN5Y6vMTfppbwj2WvPapRGRDTzK1
         zUr/J/h0550ynTy38RVgGF/k7v1Nh9ZW/GNxaDVCtQagGR8cJprFC35XdzBHkOZoKmE6
         lCaOWnTBrWK6/zJMIYxWrM2mPKAmy/MazHQ7YyyoWUHsdTrzMDeIhZ4FJL5qRkwMUDgp
         jxto7DvtIHZtI45Mv+sRpLQYtlCY4CygVvbFNEXCF3jMwgfMqtmIXeeu8RtyiLW87S5p
         5okUzaPSl1ZorxxaHFsG4OEFoBkUmoyVkBP9X2P5Ac7K5mOqacadOkEBu/r7whmwLI70
         GCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987248; x=1791592048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ws4bwEHkjoP9xPsOYI2At0LKBMoZt5p7ee7rfVN66Q=;
        b=ZAzJIHOjJZYjCMTZSW/wqSoMBoA99idGYpcG6WoR3SNg3o4822Xfa1WjIOlSTPBu1r
         BL9RsyMn230YqmLDObFHywI2ydD9ss0GKe+yP4T65i26ciAGSigqJfGKIO26YOvQQFer
         1j3cjLWg19JB+/kEW1wTtC7X5OvfGqUAZpJO626U8iAUn7d3imrGqeZs/einKMXK7Yxc
         3AMUP1vaw3XlmUbtimzxAUVsAGp9F8bEXM4zHWHpiIC30fpgfS7KVD9KuaWmBXo4tdVY
         cO60nG5CP3Tei0GTvqUBgtA9RxHpPWT32tvKbCwLAcSj/AlwLZB76L16EuX+Xh24hO26
         6XwA==
X-Forwarded-Encrypted: i=1; AKwUvBxyjmMwGpFBHtQ62sMIbq/+ZetcRRwOz8sHXtIU2xJhgqVRqeVB7m1wO3qDn87DNlnxRleG832fzWSzCgk=@vger.kernel.org
X-Gm-Message-State: AFuF++ncGC84hvoezkLOHo+r2Etp06cOyTFu6f9IQeugkmfMWcZUyCcF
	SSVeCDdcz0+FVBI+Ec4gmXC1fbZeTucCjMBAh9Bc7cVncvM3iGdemKN02MMxks/LdDyWdexAUIc
	IUtfqWlzsiVmtA91lfWNoEl9MQOFZUe3AJsXUI07PWcnswzrCLv30lw1UCRn/vpLXYOApSIiWra
	w=
X-Gm-Gg: AYBFou347Zs9jQwr2mPdIzxSfbUfZ9z93rDhzZt8oBdV8sxdL1xpdn3dSsHwRTNpEJt
	ZX0oPlSHmkam9bpOG4r/L24TUjotbRvh4pGCf5XD1TzlDp7cjZlpwIY1D8Szfn32ZCcv+PFemV2
	IBgvqUQdY4zf8y/CXOBCQSPR379uQwClo3dsbKPb70ZjX97UVd8DCD2UrUUKIMzjboM4TsmWdWg
	s8QZM2T+mvumQCGU9bBRgF74LcSahNH/WEDuE7VZEzNeyGEzPDBBBYVx2GnxXqSsybQDMiFLVKn
	Zz21ecJqx8wWfE0TVjoKxoryZdPoda0fI3+/g7Y+cRXE04HMNeUV+4/4h32EGHiiDhjEqEfcosV
	v84OOZb87J/MucQHxFRUdgfDFlBO4rJp4vUWl6Lk2tRhHPmde/OadWfUV0O43N3ciWykoFfW5ff
	t9Yl82tWSJ54C2
X-Received: by 2002:a05:620a:4488:b0:93b:f083:b269 with SMTP id af79cd13be357-93cf19d6f39mr814294185a.64.1790987247726;
        Fri, 02 Oct 2026 17:27:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:93b:f083:b269 with SMTP id af79cd13be357-93cf19d6f39mr814290085a.64.1790987247086;
        Fri, 02 Oct 2026 17:27:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:16 +0300
Subject: [PATCH 08/11] drm/msm: tear down only a successfully initialised
 KMS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-8-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5225;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vauz8vkoz2mqA4n2iwhmXElN040z5cKhm1GWiLk+akI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvg7Jra5ZUNO7T1iP0mu9vv2DzY2wvqC3sV/
 LNw+DHh+LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1XroB/9cBd+eXwwkil10qywroEAmfY4DpG+DvPz8cdqsVskPo28syWlmRPOeQCVB6B3PPs+qLSB
 u/OEW8wE9K7ITCbGG/Of8JB/o5tc8pItBJSpcQiX37neinNtj5luLpNvojzs3S79fQ9RderNAD+
 dYC7+IIsY/MV2VtkleBnaPLZ5CHL2zSPvSu5gl8p3kHsjmXwyEHAUefrYI6ar20nPHRN4pUL8Lf
 V29sqqS0/Te7VesWtS2F5kI0VYPMbGsZMZ+faZbqCUNQzJCXUApG0cLIMfcArKukD9qYtnCQj2I
 MXTElPQN9UVL1fFRrR7vlHxgT2kxkZsGRBZAPWMTHtDpikJU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX2hQkM6BGY8SB
 KAnKT4zKs9twUSz+27WR9QngPzVUZhNbITjqtjJGXlLBR2AkmRl2bXGurwv25Nsl9fruwcrOSdM
 KtHN91oW5+FzxlmXZtFYwULWRjyFApk=
X-Proofpoint-ORIG-GUID: xmWcARrCU1hDV0XuupDZPGSMtTR-Z-zJ
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6ac04bf0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wv7jyotIdD6QLGJRq4UA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xmWcARrCU1hDV0XuupDZPGSMtTR-Z-zJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXyJvuwfy5gBiO
 p1qJSr1rso1qXg8MCsb6nrCInEzyTLo9vug8KQOjJeBrFiRlLnucUQ3/KcvypmH8jZZNJngeoXI
 IIT9d7slZ6HVkc9zfcZA3QUeJKncrw/BM5H8cflc5qOJ6/DJe+KJk9WXqwhIaLXBqSD7ZxsvkKQ
 XTHLAnHFQEj5n0luNs+J3DK5ieVOBevQzw9RqqdFc0Ulf5otgyKn1JE45qmly7lmEkCuJQL2biR
 ipcOWH/MvFkFeg41HRKRF/l5Jxk/UnMQEr+iMJC1Iav8Pt5uSboqDy6odKcwLQiN3XEBoOoU08K
 bT6LLlyxylT32wZdNk4EhNQXzQHX54klOlX6e81JKc9BccD5Podx85jIWIPxUPq684OPn1cxTtK
 WvlXfFAAK0fxSPp5TGvcZfnQFh9dtzdgLyQwBK7/5pPDl4+n+J4zovIuBrj1x21GWXps8DIzRoe
 DEtUzlT7uLE7DOVX7gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

All the kms drivers now undo their own failures in kms_init() and have
folded their hardware setup into it.

Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
successfully, and remove the flag which let the drivers opt in to that
one at a time, as well as the handling of a half torn down KMS in
msm_kms_destroy().

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 drivers/gpu/drm/msm/msm_atomic.c         |  1 -
 drivers/gpu/drm/msm/msm_kms.c            | 16 ++--------------
 drivers/gpu/drm/msm/msm_kms.h            | 10 +---------
 6 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 255beb83fc94..65ba8fa697e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1290,8 +1290,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms->base.init_unwinds = true;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 8e51305f8dde..62a79bdfca19 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -394,7 +394,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	priv->kms->init_unwinds = true;
 	mdp4_kms->dev = dev;
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8fc8cdcf7d8c..80bb6ac56618 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -504,8 +504,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
-	kms->init_unwinds = true;
-
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index c26b0c7acdfa..a8babf1dbe0d 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -134,7 +134,6 @@ void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer)
 {
 	if (timer->worker)
 		kthread_destroy_worker(timer->worker);
-	timer->worker = NULL;
 }
 
 static bool can_do_async(struct drm_atomic_commit *state,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f65774b04c6f..7e1df472592d 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -295,17 +295,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		if (kms->init_unwinds)
-			goto err_destroy_snapshot;
-		goto err_destroy_kms;
-	}
-
-	if (kms->funcs->hw_init) {
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_destroy_kms;
-		}
+		goto err_destroy_snapshot;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -347,9 +337,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
-err_destroy_kms:
-	if (kms->funcs)
-		kms->funcs->destroy(kms);
+	kms->funcs->destroy(kms);
 err_destroy_snapshot:
 	msm_disp_snapshot_destroy(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2f097e23e2e9..517622367cc0 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -23,8 +23,6 @@
  * for constructing the appropriate planes/crtcs/encoders/connectors.
  */
 struct msm_kms_funcs {
-	/* hw initialization: */
-	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
@@ -149,9 +147,6 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
-	/* set by the kms drivers whose kms_init() undoes its own failures */
-	bool init_unwinds;
-
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 
@@ -202,7 +197,6 @@ static inline int msm_kms_init(struct msm_kms *kms,
 	while (i--)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 	destroy_workqueue(kms->wq);
-	kms->wq = NULL;
 
 	return ret;
 }
@@ -214,9 +208,7 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	/* the kms drivers' ->destroy() also runs after a failed init */
-	if (kms->wq)
-		destroy_workqueue(kms->wq);
+	destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

