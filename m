Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837853;
	b=VXrfIECUi6L7diLKVtFd8hkxpkJbKRooeo4pRHnNcg19ovFqRxHGi1HcVurysdGw09/s
	 sb+E0Z5ap2L/rmfgyE8rDM8zHFzhdj+0PBvQ+t7z1oX9Gr829hQA9u6tUU6FEwmTxoum0
	 dZGm96He+Z3tGg2/TjrmmUvesYZVXvr6fQppKQyaNlF8C7wPuC07scEbqSfTggmNI3O/T
	 +7zC58dJEeIyH2znbG4b8v5CCpJcTR4ljZT2zFfeBLlxKuTalPUZbsqkYMdXYCTihQpNW
	 63K/yanaZ3C2iGcyoORy78IBgEnhZbMuj2pa9rO+CBO9LwqkBBqEPo3/1R+ruTPc8tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
	b=kM5CXd1KpVOfLVxRt3fCXPqbnqyifSBHnc78QJlZWMq7Q8elB+DkJyQG0hSTsDBZNTxq
	 k8JDdoQIN3ZpkLqPEtkzA3t0+2CHRijHVrftKJxW5DHtEllFKTBhgVhPTblDD+yvwufzQ
	 sv+iwSHo4BMN9nLfkleGzmbaeoyqMTv7UksqW5tGVH3Q2LgGckBlRQ53Oe+nnQkyNGuTH
	 Q0M1lVCp9VqOcKh3JgOv7eq8TxKbSv7A0Ab9Z97vVjz8edboUWyR9yaC0FDOlqXOLwFUH
	 PBzIiVg9EFprJD/q3V4ws/Hx86r3FxU3IikMs6nnoc/Xm4m8LzoYSDwTHIS9WgTzsZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbFw69Za;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKIexss9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400F606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2400F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbFw69Za;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKIexss9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8pGbQ612963
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=; b=hbFw69Za6+9aZVUA
	HqU6MRuyyTjYdXcuuPU8rrD8BRNE77vyWRfOoZcFb4RCcAPUd062hYBXO/QqDobO
	eYoR1KxBuc7pv32sv7QWw2jkpBsjnxF4BLvOkY0slRguf7UdN2kIWihywZ9AYOD0
	kHT/EGg8ATp50XwlJU+YX4FAtp6RLA/eioveQaC799vQn0EWFRd+Mrgxn8wqtdwH
	nBrMnHZde3C/QYDkfV5O11mf2M4oVY6Fn8KbeTbTVY7IaVM2j/tjKcfX6TTEAppL
	LOiCWUUr+23O2o441ldrvC/Ek68wNMdtAdX95yS0yPipsPM2L0Rr457a5DE/5L68
	1mR4jA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehgmsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18b5ee75447so6377459c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837851; x=1793442651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
        b=SKIexss9vUcxOC/xT12s2bHjtSm1Admf0MOP8XoUqDVSGsOJoFvvI8pUkx2XxJD12R
         rmDEnrqKt9M/8UNUI6BgRoRGTDeegX0mmO9jQyEeYxICwG81XLEcbhC4x7stXdO6QQWQ
         N1vB9iNF8H8xJu3qQmn4NeIvPU+bxnJDVdVWlZCA4Jrfn0S93hkP4kcJMg2c2mXLMkt8
         A+dpQ8zWx53oCExcdPb+FKdlBoJaIsvcbK2vBOGAVx1cfDBfXk4qtu+dhzX1jjTnqTzr
         spP2Z7YddgMg238W6wek/DXiIoCSx70cRLXUPinLludxP9fQZJx+51jg/HOawltyH6j6
         aJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837851; x=1793442651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
        b=bQx42AJzPV+lg8rnlnF8DzosATpwU8r+0g4TALUOtX5pRcScqIWSTF5CqdhzRW22oG
         OmGT0NoYcEx4ONfUyWZ5EFXKCu8+yzT743CTXqSz0D6HYs5xZVXRLsSKtBy+iySEne3u
         Tbc6ARTzHosV9d7U7JDRJfJAA4ICkcj2SplVgjzrWEVGz4GC2ZPV4u5ZlQa0xibKShpK
         DGegZItEc/4IxDeD7/SgWHhDa8phwZUFY4Yqky8HdMQ/RBXMA/GDzYNsNT21jpptI91m
         1QHcmJabmCui0Ine18BrF6i+Jn7svfgFSGOi0xCDMp4QOEPgBtyXgHUMwoMPSId//n7I
         HUJg==
X-Forwarded-Encrypted: i=1; AKwUvByQOqaAy0/pmJTkth+YQhhH2ZrxN/V9Pd1V7/pHq+0mYEA40zyrjEbmKgGqmQqOjr1D7A0+hUnOS2TQpNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlGcRLSAmyxVGiTRRFkIMxLTni9OVT+gXwAyXBDHdRI22VjGg4
	Lb8rgiyofIcVxdMxyKTBUx4+cz5tRcEn8Is02KCG74D6ANy6qPxDg6qfspYJDyjqIKdv7o8X3Av
	lXi/QK0+7sD91EEHgbwkn2+rm1PDTdU8iyXhkTV+6z9mtjFA7lgjCGiHr9DNn6WwXpy8=
X-Gm-Gg: AYBFou2sp5pZsE+K2cRTsSQqp6eKPNgXYubTC3HWZWHw+mOPpYnJTeAu9PTJxoBb7PJ
	nAfwtPuDfb7OYCy0zR7yxiXzl5QzpUSfBMdEqhNrW4U9LiEjwFuVLMU+MEsa4Z9b7EvCxZ+lSyD
	IYMoyfkB9hzBceyMQYNHkOE2w16giNhpIuK4lVP+N8+MHK+T/LX+tcrDMZ6J70QlBHusCS4sOyq
	TmcPyqunRMCcBmDhgCPk9QQzn9uefoSQmY0Z61Z/owJ2PJpiJhPJ/F+gYLn14rvdBixOmOkR8qS
	gtC+oENBeP4h/XTCxRsoESGQytlqM4JVXTUOUk4RX2UGlZ3KtH0kAkQ0hF954+SDt1YDxtGh+di
	GMMFTJtdUNUBVzpOtPUPPSSc=
X-Received: by 2002:a05:7022:4198:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-199363a06f2mr3358608c88.21.1792837850573;
        Sat, 24 Oct 2026 03:30:50 -0700 (PDT)
X-Received: by 2002:a05:7022:4198:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-199363a06f2mr3358566c88.21.1792837850081;
        Sat, 24 Oct 2026 03:30:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:10 +0530
Subject: [PATCH 4/8] drm/msm/devfreq: Record idle_time at GPU idle onset
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
Message-Id: <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1385;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B/7JK0auHlH1E5rs71vnCUiEOGLiVg3K7pfC0lEPdGQ=;
 b=OHcBZxDZNTeCg15sZVgW9W325yRHdMZt7Y5EKtm8SHncpfDafjAKZCIaSdMq/XWwJEHRJ3iWF
 s8jSVSyR42UDmFDV0cQIE4lrEBBUQUKAG7jkIMW2a0xZrPPBZ0xCjcb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXwwPDN+ZTUsZe
 KjAiss8olrt1qZSO5GNlDhzXKjm5hF26Jc2Vfxl52WRSPORJu8c4nG+U8sJ8Dolarg20LC9GFKS
 BRML1OFwtenQLiMpt8qGVOr2BK68HxQ=
X-Proofpoint-ORIG-GUID: Ic-l6ksdIymmJ3X3ExGd3yRzYsdOJ52K
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6adc88db cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=8Gjds2nr7p1U5lpkA6QA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXz0QeqCv9jpMb
 ZkVgsE/6Gnw7XKE/Iq8K8hM6r86hn6Rc5OSiURUHFGvvXpRMzF/F5kXf9/LLDjXwF306ytqg/N6
 RLW1n8yEahPIs7ubuHQShe6T23jq/yErqN2xBX+eFD5uZvaL1l0nc18qDrlUO2d+GKjxI9OWlXj
 jBSyHXvGTTzYEbQszBGMBDMcPNqUxH+szP5GnQpxWqZ4YL0dmC10Do23D8hvAeN0OIo6gsOs9ut
 tkOOYmT5AEfdkTaBBPjhayjmarSGCWxpcPfbWh+WvuybOsfw83tPSnwMcRaTWDkyjpcsxTY6XJK
 Mfai/4J6zCTz8JUOAycJX+XsLqBiu2uI07vPmdBssk6IW7x6mxL6OeT5hkGCj9vjHU+FFGHkMXh
 Uz7eyz8JiGBpfkK8VL2sMcp4MgLIuemLB0Vj/W3/j2Yrmt++1zwxD+NigYG13pG9zpVsHEKagtV
 F9A2yrY2mNLoXMXYgXw==
X-Proofpoint-GUID: Ic-l6ksdIymmJ3X3ExGd3yRzYsdOJ52K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Setting df->idle_time in msm_devfreq_idle_work() means a cancelled
idle_work leaves a stale timestamp, causing idle_time to accumulate
across idle cycles and potentially trigger a spurious devfreq boost.

Move the assignment to msm_devfreq_idle() so the timestamp always
reflects the actual GPU idle onset.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c343272..f3c664b20a1b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -357,7 +357,6 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	if (priv->gpu_clamp_to_idle)
 		msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
 
-	df->idle_time = ktime_get();
 	df->idle_freq = idle_freq;
 
 	mutex_unlock(&df->devfreq->lock);
@@ -370,6 +369,8 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	df->idle_time = ktime_get();
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }

-- 
2.55.0

