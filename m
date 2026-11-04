Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815180;
	b=OCTzhT3rI4Y4res6VNoUjBDtwIrfQneIDKvBRP8v+7ELg8BtnRD0htUR5Hn7hqys8/dm
	 o9yz9lm5Fbj0HSJwvr0X3KHZWURtqPMSYxoAOrSj2bCBd9XuOaRZWi5Jd0POnlyjaJ1XR
	 GEyohBwSQ5GzmTYiHW0k1WmED5v0RiWLEnhzxShLopwv/Cx1ULiAM22v85kJr5eB1wbXE
	 t1GtmlFv0Hpw7ixTzTP06zK5rX/WqpI3L1f/JvdfR757PyGlnsEaFZGhiVj4SbCbmdHZB
	 +xQddN+C/oIqgcYXm2nrVIvCkfhbQfnzaH0AAk1LP7b27pbqUWAXjQby0HOmy6bFRWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
	b=r7e7+BFTQ5DmzT4/3ZraiG4L6I6soyJnxwKldNI44BNoD3oOwTvP7OdMZ3zhXOqXb/Ep
	 zyjlSeXdrzsZZS02Skeqc4as4No/jpte8dKH03cnyFm5XBGxCQM7BFMyzkbBzw5vO8q92
	 Hy+DImTwa2eqVXQGIjYvEvqmj5e34sXFzuVupSOBNA13AZ9sR1BlUcHNJ0E74N1E2Gtpt
	 GL5h6MfWAZGf2mE+ynyCeuaNL5uCcFHH/WM41/veZri+N2Iq2w7YIF9U5yzvrLdWm57u2
	 V3OEUfjXJPTNzTJeDMbPtYm+8ZFKoK/S1c+kjVWI0rzqaBM78ARPRlh2Pnjn92wWdjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bH/Dfs8d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="elt/aqAY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07AF606EEBF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07AF606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH/Dfs8d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elt/aqAY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FirAf3272841
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gzjrY8YLclt
	+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=; b=bH/Dfs8dg9auMVKpYtfJGa7/9Qk
	TbzTsxOfygrtvPZoeOj81PD/MAPgSe5o1bMfOCb0it3ifjfKDjdYPlDckirzd1Qy
	3lUcszvK3Z4Hyntuz69QXvjHGa9uLgBvon4frPuYk5UchP1f5L5YFC1gnxSPfwVs
	cYF5HjMam7UYJynwbYk0/ERqzB4PSdo28RpeVmslrAh4S+7DRo7l6WiXasUu7ucR
	Joks2Y9bJF8OHYAGe3sOv0WqrbgoRf+RzKGkRXkExWkyNV2hKtkKs1PJJeH3mC03
	yPk/emucw5jO67CXryCSgx7HBMqVBpwH2QA8POMuB7oGujdsnEoQgfGdMpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bngxmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:59:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso753885a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815178; x=1794419978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
        b=elt/aqAY5HUGDZPKjZHkRTpxb9lXNNhj732TAfd6Ekmak2RTuc4V6H/WVvgWGrdcA5
         R5aZR247Qz9q9YshVrHqAyCy8IQ1qfavLeuZjUItY+MpDOoa7S3AivIDgyZUKxUtZ43w
         AMNpieWaiALuH4Q/9+SrmhL3SE/ZGw5S/AqjDHttxFdcXx4Kc0rY0MJ4nSyWP9lJYWql
         uNk6MFnx/1lLbJ/N+vpotjHNuMDai5glReFMoH1S5BT5RZoPS5l+PgsyW1jJZi02eNEc
         4hmIvEwO5jKIujxz4JNe144dTewsFxcmJ8+yKp7rkjINvBzboYm049Yr7JfeWt5DdbAY
         AcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815178; x=1794419978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
        b=aTrjUCA+O0ywFpeykNlxHy5r6XVUmtc23q24cuyCKM/1sSvrKmSP1Dwvml16YgPK/7
         orVdQFg26+tA1d+bCYIoIvRL84EkknInSL0Aa7Ek90AE24xUVb3zMG9Y/xLz/UWl0ryG
         lZ6m9uJFP+3WuufK02DjfnVc1KvcZLkgueKa7uVkS2I73jhLUdnIXmUDPUwZ+ZwD+RdE
         IHVZEGw4WHzGM05DX8m41Uu+tapVPCa0gvNCVHC2Fyp2wsmjOUKohdccBe7dDLVXUSjl
         kokTV+5oyht9+pcw48nQzYbCuOx8OA+VqvHQI04MizxSb9oSgKT5GS4KHeiN8CdDgZ/s
         4fBw==
X-Forwarded-Encrypted: i=1; AKwUvBxPjhKpeiB/JGd7KtF5xDxM3jJQeiiWVaPzwKhYRSI7ktWTlG6yR9XGVbhyM9tpw6L9wEGFdnDT838WZPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bzIoQ/QTnDFM8NhnDyE0TtXfkaJl/sXCIEVpG2J3B3oAwhR76
	l25qM4w6kDB9D4tOoeSRbDlJaOUhxD5HugbS0a6a7wd+cYqH64ciWCPyS0+VwJ1v6CwmCg0/zPh
	oefOI7T4gLCbdCVFTRQVWMBhMdKweqKViepwRqXSWDQd8L5XVuRzkvX1HcLQMqu9B1/8=
X-Gm-Gg: AYBFou1hXWebUOvWyuMBwMmGRP4MMpcvQFDGtqmWLJ/VNPbKa5VmWMYzgeWKlk2+W+q
	nZnQqM3WOo+oOo82pmV8QLBbTIoDNKLgNV53vzjutk2cyRtyMWPAQGAlO4BeomtfdQfvdy+J+Ev
	bXZAwmk1Wo+hzlfgvuY6BByj6xnN86AzUfWFBLH17x/muS/U1eaCgnlVMx+LrkaM0qbBWrv2ABN
	dUC1JKcpMWtpgbmox4BkZQqpahKHuXLHZ/aPz6pQs5gUoX9O3FfzD9MMKzk3oC8iFjCWcoe1dep
	BmFzRrM7U91Kp0V5ipxUFNI8puMZKC1zb3XehIWuZgfBB4/uxZp4YTqoIEU3KntA8glaqIU8So2
	hFi3BgaiwkGpo3E/3FpTpuL5VgFkxg8vqlQ2tfBFfLHt28xMjhUli0qzcLuTEEtZV3YwjGUfqCE
	wn9OgMdGH+RlXjoZjmfGgE+EUonawTbbfBMWZ6oonh2H1QMaQNaaJzE3tLhDE=
X-Received: by 2002:a17:90a:c241:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b096b4d4e3mr1971700a91.8.1793815178199;
        Wed, 04 Nov 2026 09:59:38 -0800 (PST)
X-Received: by 2002:a17:90a:c241:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b096b4d4e3mr1971678a91.8.1793815177708;
        Wed, 04 Nov 2026 09:59:37 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm50146a91.6.2026.11.04.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:37 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Wed,  4 Nov 2026 09:59:22 -0800
Message-ID: <20261104175931.28475-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX9/ux3DraRJVR
 LDSs/4xFNfNzuTPwbGd+CeV/u7i2IrvnoHu+av4tyJYwBxUOHtwnGrCSmMH9LwtEQ+3X+q8AB+K
 MxODINFXM5vjchoYOY+JwrCpNnxPBh8KfLcbmYB+GKyFqvZLIM1VN7RVVP6NqTrTzVo/xulxuFT
 mzPSA771f2sjCo9sASQ+13X+BC5Ue9GoJbkgjkldyNGCsI42GJVzwhG74lLnpvJgSyPXlzoX35n
 FQ97dHJBIbiiTdCc8FH6Htv7JgzM9kRsTicSn13DLH3Cz35W87QV403iKFiOjkHIpCf6p4vtaY9
 iT/In2OkPJtM048WVVc5/yrE7zxrMPFbTL7AYl6Ed6W8vGtBsGgXKpH59HtwVLTcRr02rrkhkPF
 lE6nkKnA1SB+U2goM0XbS6Y0JbvRv4oCVVf3FCTxXU9kxOmth8DXqaH9o/vfVF5J76Guh0ZVf1h
 x3EZCmVdKKOe9y3pcWw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb728a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QD1EvTAd08FZB_lsx5gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: J2QKDMMcsafy8VFr7ep1MUcf63H-TB0B
X-Proofpoint-GUID: J2QKDMMcsafy8VFr7ep1MUcf63H-TB0B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX/ycX1PgM3Xc4
 1rRFkvEIq0b/D707eiEnqfe4JpaAmrbkf5O543JQdYi+at1ioFePtWrWt74BHD4g+IPv3QeJVDb
 sJTux/kIIbhAmL71VXHq75GvH0uuQdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 1 -
 drivers/gpu/drm/msm/msm_gpu.c              | 4 +++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 9 ++++++++-
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..749269843e42 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -309,10 +309,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
-	int ret = gpu->funcs->pm_resume(gpu);
-	if (!ret)
-		ret = msm_perfcntr_resume(gpu);
-	return ret;
+	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6db6cb7eb287..d074f4df78f6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -720,7 +720,6 @@ void adreno_recover(struct msm_gpu *gpu)
 	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
-	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fb07803f5aba..ca21b3bf20df 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -168,8 +168,10 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 
 	disable_irq(gpu->irq);
 	ret = gpu->funcs->hw_init(gpu);
-	if (!ret)
+	if (!ret) {
+		msm_perfcntr_resume(gpu);
 		gpu->needs_hw_init = false;
+	}
 	enable_irq(gpu->irq);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index ce65b1160955..36ce9a102c5e 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -199,10 +199,17 @@ sel_worker(struct work_struct *w)
 		return;
 
 	scoped_guard (mutex, &gpu->lock) {
+		/*
+		 * If gpu still needs hw_init, bail.  We'll be rescheduled
+		 * after hw_init, and there is no point to collect counters
+		 * beforehand
+		 */
+		if (gpu->needs_hw_init)
+			return;
+
 		guard(mutex)(&gpu->perfcntr_lock);
 
 		if (stream == gpu->perfcntrs->stream) {
-			msm_gpu_hw_init(gpu);
 			gpu->funcs->perfcntr_configure(gpu, ring, stream);
 		}
 	}
-- 
2.56.0

