Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463141;
	b=Z5VT/77ZGsDYk2OM2cUjSSqiuZuZi8V6i0vSyjX/EPw5cPHry/GcJX0TE+u9gNJsIfWm
	 tEYdvEJqOUH0tBZQPmDWB/NCg87CNjMuBXB3zd1vp+S6+J5KfwPmnphPsuXeXOdDoTb1Q
	 PX0Wie5YWhVnyp7cKyCfLnA8W+e5t2N+xRXhvaAEhqJZPGUkLNO3VNkKu9YfToLECh2PC
	 f2pS3MC3uASfOQ09I/n1lYnF3IJyNxK6kTNB5vqEZXFIMh+Xe7vCpER9kWM35I39VhOwh
	 OHh0jF+UM9GELUaCuVKfrOAddUfylhzbdU9eWwQ/9lq6FbkKhZ++KtYSAjD15z1wCSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SwaZZ5qP/5Os7PUYA8dShd++x67vFNONHodttqsuw7M=;
	b=vuEdglNztkHDF3MCxNnlYWMR7asc7FyYVj2fVN7BWQ2kFM591p0RXd3iswuqR6vTkkO1
	 Eh3URRUCzJ8v4Geyn3/oA2SyoqkgO5hSxQxWyypcaFQdOlH8eQzw868LRfE2UVzb59fVC
	 5aHrOzf3zTw7RQpTl8e2NmhNTVVMqhl6ALDaGFQehsuC2dCjDqXlSFDb8x9KH9I51XgPv
	 jOwc8SDM8oIH76WkdrXTucxWjtCEI2qlDjyqx52YXgTBY8oH6+Vb+WZT2prhJPo4u3/hA
	 HtJOZjUvC5z3pcw3EPz2yjc5xI9C5qji+aKY2PRZb3EajMEEjd0LOjYa/9DcdmgComQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5R8AdHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZZ88SB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6F606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C6F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5R8AdHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZZ88SB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02pL1125561
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwaZZ5qP/5Os7PUYA8dShd++x67vFNONHodttqsuw7M=; b=Q5R8AdHGzCNqDgdj
	BsZL8sDDAEd2BOHK6QqYqyaXHwO4vp7cwXq9VSjosRQpivDUDf5YR9YDwpwOuTvZ
	OtfgXuyKF44q5L5xYRE+sGPS5I/Hc87b/qBcuI/S/TzFhbfHdRvJDzN0xv4matAc
	sf+mHePfCw7iEtC0buA2IOqhtUKeeIBhf2oQ5SVR4rTAB5OSUDxwAGG65EaeUzky
	e9/Tvhzial8ghYk9EdIh2ZYJJImp/J8bFm27k46/iBuTTJFVgrU2Ahr62dV+XkUE
	orTtpf3AY4+G0snMHM1N+X9MCcFcJhfzujDN4ssUJWbSXH4cKlcu4rqegT1UpjKY
	s6i5rA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7sek6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso274647085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463139; x=1794067939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwaZZ5qP/5Os7PUYA8dShd++x67vFNONHodttqsuw7M=;
        b=FPZZ88SBaKabwvSV/u7uDD5axQb7ykVE/hrk6bFqSczZ+0BnBnjBsusQghv3s9q+Vm
         cHdm9zb/Uii4P4cTHJy9idVmzsKvioiq9mn/OiDJ0C9A+H3S2ULnCbNAihdViqw8wCV0
         R2JIRBwEXXTXvw37SvEWI15JX5L3TzNhAq6DUMffY4EyUmSFd4BQLVhDCG3wpTKTCV63
         ZzlgR+E7E77/L9FY0/f4Y5JkDuaGDgLcxklaVHXj2aTqO8Fkl+8Ok0JmSrNsEgyrT9oc
         4NG6G8k7qvDM2sqD5/afU3l0VO7LMfJq7ISBMcBkSvDtAg458rmpB5B9I8phImrJEEG5
         87sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463139; x=1794067939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwaZZ5qP/5Os7PUYA8dShd++x67vFNONHodttqsuw7M=;
        b=tEzfyks1na2mHqz417CboQGfPcen0wsF/OlJIlX4pckBcIG6pnum2QLhUEjBjqrvFM
         pILPuz7wz8L3EFVEaiS3K/ZJKa21d6PJQ/0Rwmcg5xofpOonh0J6WH1zNUz89xkXpJBa
         UUWkmuszUfSVcH2Fk4/83Lwo0KuOfaXIYoG8LmBsw03ClHk4wP/dXwbC9DcTIySz5cRM
         1k9bz1bPuU3r9Y6GQn/lNKmGI4HCcIEU/jpS6FQWacVIvMNZlcoEf4S3GN7WiM5iyWCq
         1d3T+GywUo64hewYQrPY/eqoVrLh0l4R45LSrrq0SjnHIZPynuRvA1awfkpZVYh2LdHu
         oMvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMjp/q36xe2eKUcJRgiOj06nZN5jXt6k3XvctodR3GEPHMu/MXvyAKu7sG/U/6bUhDG3V/tVL6S8JfHbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKreQfCW1m5QiAKyvpK9pZ06fgR7oA+fxrntGPSdQwy1hl9ZwnY
	HO31JDTFLEe9rn/et6diHOpVydbZMByDdG9iMqeD8Jg9vFmoraIOWdaLDnAlxF2TLjZP7z8nmEP
	YsUAQKGHBxF5aVWCevs5/3STfpRgpl4d5XW4qZT0O71FmTz2qAxYlaBPKsYVCkVyLA6I=
X-Gm-Gg: AYBFou1Jjph4PGQe+1SioZTufivQdkeeuKIF/uihqPhtu4gV/pFMd5PAhcVNXBzv5rM
	V5kZtrSb0GxgrBU8aoHsxltHM77NZD1sBUy7akiKKPGg9mZzod4Uj9MzQ1DhYFd9moo4/ii5a+e
	FfGt6G5oqIex5PDII1rFnv8zq18pHD8V5lBzNUPDI6sMM0jFyW7SkdsPf4ZEoYTsE0FJMKfXPaZ
	iV4DVnoe20h3Sd9p9e8hwEvAZrwsecyoLcbkeO06seviAZnf8p2iBBEEIpWru44BFwccHsVIiBW
	sDQAZkj2gpZBsW1Q1ld3zCk+DN9T2k8AHPV6n7RkXqVJs/CSYRbw7Qe4IYBJT9j8sZffTcMAsBJ
	oH62Lg/foUFxYCbD3X+usAhBZZ+VDURdLzIQose8S0lY/27EP3ldrWUuPKLXSVFidER5woOsTaZ
	qNUnQZGlU+tDZ6OdTA6EMXq38IZfiCh30+yytMLeASjaVAVF/+0NdsIYqZpsa2pQ==
X-Received: by 2002:a05:620a:460b:b0:937:6de8:b40 with SMTP id af79cd13be357-944217194b4mr956941285a.15.1793463139058;
        Sat, 31 Oct 2026 09:12:19 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:937:6de8:b40 with SMTP id af79cd13be357-944217194b4mr956935185a.15.1793463138546;
        Sat, 31 Oct 2026 09:12:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:54 +0200
Subject: [PATCH v2 4/4] drm/msm/a6xx: keep the timestamp offset before a750
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
Message-Id: <20261031-b4-adreno-timestamp-v2-4-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5NRQ6jOCKhck+miqkwc99g4du2TkN6u82C541AjyHzo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNU4Au8tDJx937/aiTxBx0ICIWfYE/1W12+R
 dI3QwcvZh+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTVAAKCRCLPIo+Aiko
 1R+tB/9GaEodWm7sZNHcGP1kB8G45SuCqsEUtL1TkSjHdRmV6YMdW8iYO3/AfnX5OVu9Mulsx+A
 Fv2GyYdA9GdVQj+RrlPwYvdc0I+M7pZ9BJ4CTpgslaJabUHVnfUfmey7efixhjBYFEt1N5++eZI
 AnJ88eOrdK2HTmQXw5CaE9mgeAX+x/vZ4BrkpW9chb2PxmHCZA65Zn8sIay149xKEuUYPwGnkBO
 UgPEZeqoP0otv2vMraZHKed08d6aX658t3EpFs9wZeF19NQ2Cc72QoNBzlUzWwIzN1rsSFtLs81
 sBWFbISlDof5d8sFF80nej8Gkg2mn+hk/sdP6bOk8RTC58Qj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: L_qCzkejP319MJXGh_NqS0n8V9oe7P66
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX0XR3Aw3gTGWG
 bgHTLApirc47/DmwuHjpc8pTDbLW9kH7+04qbxwWK/eNEILOEyJD/zNuyqoTXFtRWTVa4vS4Dac
 j9Pjyk0gzWptBZQt9ronD7/ddOttm5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX6I6AuFqODxqO
 AivMwuP+JFxaWUm5iDVkl1DkGxLrZBjJAO9lojN1VGKn1Op123UblsyG0x26bs0+Vj439ZfSbGT
 +jc9LiLY+C0tuUxxKzheB284uKFgk3ZBOBPVQ0j8Hu3lyiFSxBJESpMCAoR+8lUvuPBscDFuOdc
 F00Qw+blaGNjC528TKPU35VD2jYSgD2ze/c+vz4oxrjX5DAeecDOStm1Q8EO0izs4SU3kjpJ+Qg
 U12/Wl0JdIavuacs3cN/V3CgED68sRVByODyE1R07IzPFepH7EkbqP3zEFTqNiLQ1Y+TXGlM2At
 P4WXfm4TNbH+Z4qcH2Q0mrfwfOc1DmW9W/9gEXQFW3Qi3LfL9QkpoJvLC6Lvb0Ii0463sbW98sU
 vaQlvKd/oKvR+P+aMVCm/H9mE3Ix1+q5rR01h1bo7T6xgpCkVw3/WyDteD1kfGJDAQCEAyBUsRN
 klQsr/GGhx+pJFSq/fw==
X-Proofpoint-GUID: L_qCzkejP319MJXGh_NqS0n8V9oe7P66
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae61363 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pMFaczZYBad8gVHhDZ0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Before a750 the always-on counter does not survive a power collapse
either: on the GMU-less parts it is in the GPU power domain, and on a650
the GMU counter behind MSM_PARAM_TIMESTAMP restarts with every runtime
suspend, reading 65229 and 68216 ticks two seconds apart. From a750 on
the counter is loaded from one in the CX domain that keeps running, and
userspace already relies on that.

Save and restore the counter around power collapse and recovery on the
earlier parts, as on a5xx.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb86d..7cbeeccca000 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1575,6 +1575,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
+	adreno_timestamp_save(gpu);
+
 	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
@@ -1638,6 +1640,9 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	gpu->active_submits = active_submits;
 	mutex_unlock(&gpu->active_lock);
 
+	/* the GPU may not have suspended, so resume did not restore */
+	adreno_timestamp_restore(gpu);
+
 	msm_gpu_hw_init(gpu);
 	a6xx_gpu->hung = false;
 }
@@ -2151,6 +2156,8 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	adreno_timestamp_restore(gpu);
+
 	msm_devfreq_resume(gpu);
 
 	if (adreno_is_a8xx(adreno_gpu))
@@ -2212,6 +2219,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	msm_devfreq_resume(gpu);
 	a6xx_llc_activate(a6xx_gpu);
 
+	adreno_timestamp_restore(gpu);
+
 	return 0;
 
 	/* If anything goes south, tear the GPU down piece by piece.. */
@@ -2234,6 +2243,8 @@ static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	adreno_timestamp_save(gpu);
+
 	a6xx_llc_deactivate(a6xx_gpu);
 
 	msm_devfreq_suspend(gpu);
@@ -2241,8 +2252,10 @@ static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_stop(a6xx_gpu);
 	mutex_unlock(&a6xx_gpu->gmu.lock);
-	if (ret)
+	if (ret) {
+		adreno_timestamp_restore(gpu);
 		return ret;
+	}
 
 	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
@@ -2262,6 +2275,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	adreno_timestamp_save(gpu);
+
 	a6xx_llc_deactivate(a6xx_gpu);
 
 	msm_devfreq_suspend(gpu);
@@ -2757,6 +2772,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	/* From a750 on, the always-on counter survives a power collapse */
+	if (!adreno_is_a750_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
+		adreno_timestamp_init(gpu);
+
 	/* Set the speedbin value that is passed to userspace */
 	if (a6xx_read_speedbin(&pdev->dev, a6xx_gpu, info, &speedbin) || !speedbin)
 		speedbin = 0xffff;

-- 
2.47.3

