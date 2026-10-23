Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769508;
	b=s7l6PX47iacGRYWsZ5ssHJPAdPKH2mqihaSWzCDHmwBUxfdEcz6S4LViCKBQ34QcE/F2
	 OjEVoh6FY0txXoihowYog7c5BHhWeG8MHFZV4lzRRCS+7yhypozmomGE7b0mgF8ZrQYMh
	 NLl87MByTMm794BlvABNntv0m2+GKFjrJFCC36qrKpnfEefAUm9ni+s340wTi+yOm+qHq
	 UC7iPk+8Y6qG1/a9Fk0mi0YSu2nXTQBlsgT5ObA+Pel+JpRYT1elV+cDbvNV7CCMGQxDV
	 tJSvaALl6RVTFuGV6QEwt0Brq2u9J475Xjmhym9YlSI9ogvX9p8zR+1tit2/mr7G5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
	b=REJm1AIxSwTQH7+C5ygGMK5XqnXgqYG5mJgXkGjhnBCXK7JuzpWjvt+xj4JVCdLEYaAd
	 droTIMSrVP2+J2X5T5d4EA6wxXTYmgpkSVNGNZj1B1G9L3tE8cfV30nvR3jqzk13MmCNR
	 QIdPyLgreKxMaHXlLM70kQNyKaVgIFhpN6RwZMpyut09BvZIm2ZT/MBCyLIEBNDb0Hk9T
	 T1g8BsqX4VNdQCA44cdPmC2Wtccv/bb4udACEBiV+suIK9r5nZyTuKiE3Qbyt5tkrUM1b
	 66w++lBkoVE4hmyls0YhMXWXc82vY5TGD04N0AQxv5Icuq3L6ldPRvOJqH9g/2Riq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJmdDXGU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwQtMtHO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94FA606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94FA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJmdDXGU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwQtMtHO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5tiZ4072840
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=; b=NJmdDXGU1uF7+X7w
	p5s7n4a7iG1Hyzi2ScuTHJ+cV+5G4GeL2MwD8OXZBy9U/oH6ojG875a6BaBcZHWQ
	bVOtoYvRssu18j7K5wTJHueY7UFaq1oqG6tE4h2sO5qC5voyUK1wrpMyBqcQfPCB
	lSqXpVleNBGoFoj4YzHGhv7qdEyameXjinxDaC+jEdQoUQ4j1Sg/k98wh3Vg1asF
	IvOjeUx/P28jtnSDOuCIfCT6VWfrGLLdlOkWScsXytrY7i6XrpPG4otity7/bgyp
	RXU/cVqZ8928d+V06KLFSN/A/NTQ85ZhiYAmftbNfi1H9JDpB8kMnE2HC1l+rMVA
	Z6Ptxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0r2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc1bb97ff8so208146137.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769506; x=1793374306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=OwQtMtHO0rh1v5lhv9Dec7Vrv1LphN2Y0lKpuDKo+knf3UWQjEvfG1zzoD/kc9ji8P
         ilQiskux2KZIWGlpNhNrqamDxjAP4NklcXLhMcR4uEAupA6xPT5tdp3kM9tVGOsPxaMa
         yCE5xkAWFyRtcXV6n2l7a/oqpQSiTBe1n2BWo+UJicWiUJhUlVpSHKT5vCe9scd/hFST
         LiSpNCwD8UwjUk+PbPycw0mtvIXUXnUnyThoh9fjc2rV762UjJnQnuMVh7tB/sH1g61r
         lb78zrp7IuxBNE4ZRqrCD9mon7LygDznA0ntmJ4xVr9uUlu7xDwd5fFeOjDalyeae7pG
         /9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769506; x=1793374306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=lZoqq4+QdE/COdy0o/xF598Sm5PtlvFYeTEN5lUvaLrmMxyu9+iaUSqIEwlc6MRi6k
         lPEDGWkwoViKF+c+/UYSEj6hiLAi4lwa70d6S+xxrW7S1mjDrIBTnzJfTlrl6C02Yb0t
         MmTq6I7xC5/6dtEi3z2PaDFRHyLF1LS7loywPP4Qpog2gyqSU6ceasjkEwNZhyhaaLtv
         lgOXBKY8HgBWVuUZlSh6orNCPpL7wY9rkhUmFLF6JEGXGljXiubDo+Xp8qTRZBM9KAUr
         tZG/NxYqHK/0d1gyUl+zpK2mo67hbzGNbjXfCBa3em/9FqJp1i0EbGslElJ37BxYPbb2
         zxjg==
X-Forwarded-Encrypted: i=1; AKwUvBxUL+i01MbNfh0JNzmeV5qtFs4PVj/GcxC6CAte2PaHKnUpoxiIw36dfT3wAs/Hdivw33a0oYRM6crVz5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiegpmziPSKM0iz0npFX5eY8BuQs9PNL96wXg9lcQVDGlne/Jz
	hyOdnqvaXDMFNYpbXNAahu2LJC53hfzHnukR2cd1aYw82dqX6CCDragBDArp4HN/mu/hNBZN3t9
	uIwGkYj1+tBxZfxSPMDQ0pJgBbBlJltQgZm4OrqS7syABqPNybKoAOcMd8iLCjYySPc8=
X-Gm-Gg: AYBFou3NaoWwhWsi9943+afRKeYWIXvAb+IX4McwbmXhVjSE3UnVmukhZoMcWt51Hbu
	fWkq3NbFTn0HK2LQ8z8JZAIb5lvnAHUDstepEhYx96U8eatJXBo03xyByP3DInZk0eU3+UFJzcQ
	Wy4XDg9ctasluwlCizaVecr7YHk3G+e+7S2iW8wcbjSjOLzdsUL+byRRP2/dz+7oIM7waTvI1vb
	2eDyP7PjYq9HrXxnMYR+huhBchCqmJk/e/hPVHX8i6UZwYUR7hWiPg+R9pNE+RpfbXQDWPftPI/
	klvK+PTdyEPl+rTbi0t5ml3BpXGkV3c8TawK4nsNWVk2JKr7PIDThSsxo4XhyS5XmKlxwMTwiir
	SRgNMRbJyVTicFDIQ6nGoi9LqYZwZGBYFmWOUl7ezAAnc7TApqp90avgc/SLPQ+d/mMTYfJhO6F
	haDPWYB4QPqecj
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938146137.31.1792769505527;
        Fri, 23 Oct 2026 08:31:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938102137.31.1792769504814;
        Fri, 23 Oct 2026 08:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:16 +0300
Subject: [PATCH v2 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-1-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233POcq5+xBs5sKYiuZGBaLseVkHxghGTjRWs
 EJpo01elkGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt9zwAKCRCLPIo+Aiko
 1bdqB/9+l6xgnzDWlFKLsrNBYSCr40rrF1HkzMr0fqS+ZB7qwxvu5mOAAVCB3RyJNGX6tcG8gqr
 99LFNtxZYSPUSdZDAhIj75zherArAa/KLO2QnbFdGZLa4XkCtFA8ZCmLEjgqQgcfT53TFK5oiFz
 P/xSvcDV/Ty6kTRPE17EbNi7Yobftdny9pl8h1Q1IoIuFekMFg0d0ipnlK6e70neOzxVqUVVjz4
 pXDWcPTm/zh0IPBzXt0Dmb3R8gd7dF0azl/JkKiKo/rG/lWf9wZbr1XuZvbpVj5a/tIXbtvPSnQ
 oA9n3ISr4MzKprzDAhy0JkZSsNpaB4oZ/uShBNC2V/CTdu4S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Mv6ql7Jf98r44gGB6_5fUT7cXJv8E3ZS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX6yGGw0SN2VQz
 cP6wNzaZiLuhuL7rFgKF4TYSqvlG3SknF7+J8gM7HvimEIvFybg3E1FWl0NtZVFCg9upeRkH6Yy
 WF00hL6rZ3vd81vcjRJeFa0PSxG0b8A=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb7de2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=D-zmcGmn4BrKCB6hg70A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Mv6ql7Jf98r44gGB6_5fUT7cXJv8E3ZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9rFG5hnCFae+
 RI6LrDja4Zzsy4NVvfHVI758HuGhJKwa1J/cBstJJlEP6OsSyf0ODBotDVtwWjLKhh9sd7Uf/Vo
 +0kdBuo+bTWS82fN7jKnx6QXclKb3uqCoxX3/5dLYRMcZOKEPm1SZA8qeHEjY/qDC8dzoH983tI
 YxOn9h2OZNucuOPkORtSxDlieMPBLIwWTK2JPSw9qz5/GWXXCu0eIb96J2R2emtsXCrIHoYs/DF
 +SJlixXYJYSKLBYg7vltSzfh2ear2P3QanjxXSjlM9+gChIIYB9Ct2x+0br62OrvJq2xFCdDl0/
 kpoNVRl1xlNeMQtq/0Hh5rWz6dNjSuGilQ/CrYSATEa9tzE5GwUNBX8Fw6GJduwL44hxd/cRpwQ
 KcGgJdU38x0CdcGqgcOudDrrdQ21zN+1DWYweW0BPhjzWwxEGuDpMN0MXvNx/Uc5GeRaVPDDVYm
 Qo+3VKfkswhFrEaB/Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..d1b10656e41a 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
 		DRM_ERROR("failed to create disp state task\n");
+		goto err_destroy_mutex;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
+
+err_destroy_mutex:
+	kms->dump_worker = NULL;
+	mutex_destroy(&kms->dump_mutex);
+
+	return ret;
 }
 
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev)

-- 
2.47.3

