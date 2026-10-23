Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769515;
	b=4RRde3xf48vTYb861umPS2xct5zY5ExmoJb/AQcJww814QhY7lBwnKfHT9TOWuIK/Kv4
	 tZmDZQ1PVXEE0UT0KLRmIYrV4p4A0SK7PBcURnaNJvI9yrhrSwiwKG8G+i0LXdxffWcnn
	 VhM/zvORmPNkzeiuqUyyfDh1frQe95/X/eX99klI2iSWZ78lXCUt+dweuFYNf109VbnT3
	 /ooAFrzrmCjNZm8XHO/WxwnnxXvDcDot54i9ISXqGcAg+wcxg8gRoeR38rb+sT4FRxkGH
	 tkF9klq5OLBTwJIpNMr/AbJ/A7bazakHZxPYGg9hENkyObFli7raqQo8xdbFtW5Tgvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
	b=gOiy+L9mTp0S7Ihtru0q260YmVOt651zM0f2eCXHectlVF/P6WoIFOrRSS2Um4QHVVa9
	 JI045XDFbYmsuBnCRsBMeUZEQ9SEc5vzm4PiP6J6Gn/OH19wgsHRAu5lIxDls0Cgks6kL
	 ZiD88tLVYVzZ92cwrDKBns4zmFRr86qqZM2ZWfJAQcfVYHa4V7JDWk7Vmv9ZOcNo36ETV
	 08paR4TVrI1RPdWDnoTuEZwD5HDtcS9ppCXwEgDa+urjeSwmEcwLZswiJf+6Op0myQM73
	 HNB4CyaHwumxQIWmW7L5+IKRv3nbvb1mbts+0XNzLkhEjuWF2mlVi9Tg+uH104obJAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev+b26Ei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjZiZMlX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D8A606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D8A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev+b26Ei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjZiZMlX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6PgN3000292
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=; b=Ev+b26EisJVddRi7
	hEWpF7gdn6uWqq53CisKKZVna5nbZDDJyHhxiguJQkYdghEis/Njg/2ssnrfverJ
	VCCA1C2WOTMqbN9HbxwHCZL3NUPa9tP7kOCGihTlHp0nmcGTgSgO5jdr5tbrGIEN
	Oa8ip9QjZYC8XxF0saLSPVTiec3eoMBZ+AN2cJIuGTY0HazBssN2rLibcy7UXOVj
	HmGSq8WYdp15BpMilVYY8l6L1E3gHVtWOnvPHsLOmLHnNLJW7ZO7TEci+cNLY22k
	SD43i3HnZbSxYN0I2B/S2uz5M/7OQXb9WRu5GbKd0hILxpTk5GDm9Ldohugr0C1n
	7SyIsg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0q51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so851641137.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769513; x=1793374313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=IjZiZMlXvlP0V4ONIHxJRFhyUpHDEQHJg7tXHdQj0Ot0wLNhI6337sAwaoAitmQwyw
         WmZv0+gc7x2BGa7FxYoJCRiHZFzadU3ACvU7w/6ou1JXrU+JPJ18CobiMKpIcAvD5G4o
         Ge/qfAKV9qHsNraOwBY8v7Y60DLnIXotx97LlPEQ838pBB7hPQgcH0b28Ksmm3pjl4zf
         X80ArnS5Fsyx3a6TP7zBtvGOwRxyY1jFqjDRKV9X8kHahTIyCfa7qeaksDdhK/cheKNB
         i7bmMibIU8t9HEmNljv905Lad8F4/oeKCGNGmrXQhCv0YV3Xn9jCOaN9GkBT9JweXgED
         L33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769513; x=1793374313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=RsJkARJ001c2KSRTH7cuEcqemGTVpnP9BJbVtluQi+1tgaqF1TAwlY/QGxanyDPe1j
         5C8ylvW7WBs/JGd8QH5VBcU7neFJ+FzmSSaTqEQ2Ny+bxoqItLoL+lHBKoRWEXw3uY2T
         yv2omTbW9a50m6FOnUVJY5nVAzzSf9e2zSdRRsSWPxaA0w0Mkjg8KWPu+fMp+t9m0EaI
         ILfvQVM36v4qRFhKqHbxEmrgUQECvLWIbEKKW1i9BhlLk7UCr341cTPDJaDcLr3YjsDa
         k3G9JZrxrm2arJI7LfxY9CCkHMXPXXUHhjdPpdzVj0ASzLbKWGR2d/ambWsfm7YY6R6T
         7BKA==
X-Forwarded-Encrypted: i=1; AKwUvBxfTUgs+w86BZMQOAQ+ISpRApxQg+fKqB0ztEH9jbCKCCJD1EVvloEUdw11o2G4LG06kCi7I6xqJpCdmew=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPOAiJcKmnoQnvQrj5q1bqGPxuiBLgzOjC7CIiSU09VPG6HJwy
	rsRkwAuUeE7B6uEKsgDkzV/QCS4xjRBIGwCiYxl+z7OSir2LK5QFEuqqbbMcHOdLMUE/ej5SVbQ
	bpxL0Qe8S5DXcRoQ2a3joSjIOW0+HkUjWy541YdGMgYhIBHa+1uK/DTq7GX1n6DdhOdo=
X-Gm-Gg: AYBFou04zYosIxI/dN2Pp2FNH79HdlwGi20DST+ONnekTveUZqrdysU+k/sCOWBmMbu
	70LWAmk9OKy5q/U00SN+1GyzXSFi9+u9+nVZGdxyBGc7oETpWyt0/EhVP7HhP4+t/jXkSgCOhrF
	D/atiDMh1ZIGLgqvoRkRjMrnZoaszmDbTFMUu4OABu9AEZrHiDmxf2EgmGHxCVaZ9wePGO33gOg
	ZlcG7h+Bvcbr6if3DGaCV78a/ntJJ6291EFR6932NLwAOdZg2Kms3ZQDFPXW8f2IkVot2jTgIiw
	9jO9VWgbRyEvGB4uEIkMZ7zwhoDm01KLg/Va5/V0d89HNzj3slGyq8fkUSagMqp89tlGDtE8kul
	HVjPd0uW8U+kDFyqT4eic/NpOG7Yh7fe7NSEdMVOfrdpmoiq+FZ2R0Z9ighzHoqe3q9o3AE9j2N
	HegBL2RPgLX246
X-Received: by 2002:a05:6102:160c:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7ccc31ef7e2mr1097925137.11.1792769513440;
        Fri, 23 Oct 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7ccc31ef7e2mr1097893137.11.1792769512912;
        Fri, 23 Oct 2026 08:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:20 +0300
Subject: [PATCH v2 05/14] drm/msm: clean up after a failed msm_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-5-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AzyBqQgyuR3fL1mDrTwzGfxEu1JDwGk4Yz8+Ubw/F28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233T94rZy6mVQWxm3EZ+NtsUq6L0GgOszA6bo
 tTTiXV5Gh6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt90wAKCRCLPIo+Aiko
 1RU2CACYjmuPKFiNw4WivWJ1BYX+JPAv8JUi3fHmWkhOmoz9Zqmws6HtzGkKbS1Bnh1ET9i5csn
 SDrS567mfGvbF+m0np74+1CRUbhBDWfaAr9IOmvMgrNhnMdm0huZet+En2ZHrkYho9tLea1U3Mg
 emYAqEXV3+dsPNqtPbq5K59QBqjHuq7DTyIZbvE0gxBAjN/KYDIBKuUeaPE4q4v8NeRAjSZDRqp
 22Bh22MvoX6dPK/F6A7h8phVWKkOWGFBJq2XHEko6ARovPi+PyvogSPApH7hl1O/imSlNXgUbBj
 h/DGiKJ1Sh5K0D8hqakzDG8sQjz35ZOkJ+zqNe01gMeDps4s
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXx/UrmGil4KiB
 pbuI/GVT/llxqHrFgEyR4NrZ9LY6cl3jrQRWoDGS7VqHz4i7lKI9VGXAp2NYtWQ639WUbC2b3Z3
 ISGbip02bL/D2W2X5D+8PZBiw1ctt7j1YrGhlSAZVLc4DYHelT/cVj7gLC4sS4wa8r1ZBVBlj3j
 mMCawFSACluTnVOHo4srgKLBNM7cd4o61UFmog0aVJIEjZjoRK3K9lx38XKTh1zS8C37dPMgAHP
 8wej7Ogq3dy06nK46wsaAgYcRleA24Kt7bCqwavMtGFIbx0UpA7wXxilHc6CEKJ6ymVmd35+/3w
 GIIIi0EyHYAEO90P2I1ZLN6gtf0+t9K2F6aJOMMetRIER0+WQ3FtkzNty3sgSpcvvnp+mG5oQLI
 kyN4dQW6KFC8obNYLRvHwqFzXY+6GhjPfPfVMaxj9q0HTQws2ZwQuq7xxm61edwfRwgdf+erK8S
 TAlIS00dwPXil0lEcLg==
X-Proofpoint-GUID: QdhE7MSRbcRt48zpJLQpoMS7_Mk2Uzgs
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7dea cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MHPtEXvVaziToaNGM0QA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: QdhE7MSRbcRt48zpJLQpoMS7_Mk2Uzgs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7WIbnXbH8UW/
 gnl4/X1mYrghgh3Q+ENqrNtQvJh/GOHRR06xYK4/TPow48BYhfdAV9zG3Q+IpAVqOzyMcAomSds
 G7duFBlYfzvGevSQIcZBTF8R8iqZAJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

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

