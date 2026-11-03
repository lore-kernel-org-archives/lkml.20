Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747946;
	b=bCRf0YST0mi1O8TDDnt/10irYwsgUShN5H0xgVK8c/6gHuXGGgaaBUC8PUKhFMFYlZ5+
	 DkA8Q0yYJ69wgHiZkSgKTsr4o0zl9Abs079ALD/wMd8UZKcrLq7LWNg86LSxTadhAOOfb
	 +9DEgFpLJu8yWzVxOrl2XwZvFgwawuKothay7zOZN9+NFCMjGXoeQ7QtVfBztd9+UxVoe
	 nosdnsZvrYEYbmoXYNutHFsvMwYkxVux7L4BNQu3uTI2/KfSFafiwXV/vmE4N5b684EiH
	 tiVgp2d/NTMZjHkD++522sZWZ8fCJE9dw1IDjDLm5uxGAO9/9Grg7PcI5vI7Zdg0D9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
	b=1KRRtn1/EUvQkyCvj8G2V37Gl2DCXseIoDZUhwoA8uKknFNszCB/TUa3KKh5HvPgaGAB
	 PR+hYU+B5B/HeKqyDeXYlOpcd8xeyHPS9rPsy9E+BjL0wW1ET4amRoWfXFXAXC/qDZ4cO
	 uzaxE8gwmXXdf7fIjCEppomxRBQR30fCnZhPFsFKJO4gXMqCMqOD2PMQXQMm+61+KDcAL
	 KA7npvTsg8mJr7R9+NGnjoaKxiBj9tsLnNKgeiFATcYzb+RH3JmLfed9R0qP5Fi6NUSqB
	 62Mf1QAUk1PkHT5ncqcgK+Ek0t/kbb9XzCCq+V3m7ljNnETuD+LZ6Bt49gAObDSbxUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TE48tcIA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLYcH8xX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB7606D826
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FB7606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TE48tcIA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLYcH8xX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKsPk2395614
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4Yu+UuFD/Wj
	iOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=; b=TE48tcIAvHvRqRR9E2KJ4z8RqGQ
	SgqFO3i1MlTELD4gNTbHzsYKIFI1mP2BW7xfhwkNLndSpEkaGR5CfmITdE0xPk71
	e4DBeQgFCfXuJJwCdV6t/z5qP760WNSMxJRIUyByDd33HDFpk0LIw5n0VxCUI+m+
	BIs0a1+gsi4IkMuoT2w7lk6CbnuakYNwrDFjbqIG0Rw8IBBH+/wcn/5P68QVawKp
	7AUutbsxFMSOlZ0SWmPKsuHfqMjWkmFXqw4yDNCKxNqcBxMx6cPYIk2tQixKV1FX
	h6U7bdem9vyt77rHhIXrXTwKftlCEPO7qwjYN1i9k1TBkmUDJV2cjU6ToYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1vmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:18:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8aa185840bdso131575b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747939; x=1794352739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
        b=MLYcH8xXfFr6/CNtNBHISqLOO63CTZAXXV4fcz3jNmHN180rbaS2Vrfmhpswx+bjfR
         i4Wq6X4NdzTpouVdYL5hjtEcm5UqSbCWIFPwZCzaoAxY67b83BWZO3qP1zUQmLFcnm7m
         VKb17qh6g/myTSLfu1RD4F1NLTP4NzVa8wdi8RqxTpuik8Cv028juyVp3HvBbIHCmcRS
         Jix0cBOWTm90oXSR++ruDts4ddRWA8qqw7bhAlUNfoBcH600ynBl7CV0RGAGSz5WOxfu
         CV27R61PnjLbvGSdym1jlZfsiAJHit+TvR+lE43gN02WOnHRDZJMJrovw9PbJ9hC34Cu
         Ilhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747939; x=1794352739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
        b=eeVbu5sUIu4jaLIzp62Hvt9hhVULcEm5rnTsHK2TC/Dgp1vnf6FUeL0BM/mM57szZR
         +3ZFWjnpaZkePbqyJhJ4rzDHKjDka5y4xCgt6tUy/GmtR1T4B/L8ew6uFTbZRZco4DXY
         e4MnSlyt3juIjJfPdD/Ylu06PVY5DhM0BHwX0hQFoVEyKHRXrW0coghCrbKMJHxvV1oi
         2rKwYX6w9TO9IFWV7xzRooCVS0+S8pW4Ni7vwWi9daAZGheuiVAquNZwOg5l3YDS44j+
         C6Nq99AcAAAM09pjx83+q/D8lPHH+9oO6Dm1/d+ccTP97350CSqydkdQQjVpSMjNFQW7
         hm2w==
X-Forwarded-Encrypted: i=1; AKwUvBz+OHGyjD7gZq0oyeEVAj30GSIrNXYp0SNp3vdYriC+9R2kM4YU8JSGkUZu/v8eOC7gD40wmIUzVQipL+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HEcX1HOt4njL2w5RxhDj8vBQLf9q0l98Pg4otN6FBryTH6hlO
	Oer7NO5gvWEsh8PnG1k9brNlp4nFMV7VEkXeF3x9NusvNHnFFBE2Cyl+dFAj79+NHPAAypzXlzQ
	8v6ov5v2WYRY2IBw0yXgdiHh9lVc4um3IvLhVu1nQV1vFyRGNxDe8ism8ccjWLWLiuCw=
X-Gm-Gg: AYBFou1oR6sCShEHpBNZXyYUqFK/SJ+JR6i5iCV9FLOlqKRL7eLW5lFVGe+I0dxY/Dh
	OpfmCl2jRye2cmkGcBKUth+LLKzyM/aGWSFaXhwqFRGP87Ahys3z7RmdwRzfuI6bQkv6/laMpDW
	OtdQ46VRdO5M5+uBdPQ+Dza8KJmzcgTAdglrBomnfa2m5PsQ25btLiU9EICl6E8hNEa43u0sivg
	DCnaBLw/rb4dg/otzGvWPZrs4SPUmuMvKU8nuewROmcOMXKRme4Gwk7a5PlehSPuFQrEbaYD873
	ySbpk3Df4WfA7e0lEqI3Tqbs0ElG7xPalPWaJyo4MP3yj5BvvaWbbdcptDucOx15q2xPUZi8iAm
	6WtpAWIRD4E3NkvbOtH4IdayK6BCzOy9G9Jnf268cdEl++6TY5mIn2yrs71MActgilvTkBno0ak
	DMX07hDqW95L+lh2Tmopy3/EUfzvRsyI9C71ITG3YLot9g0GMdngJFPuwrzxY=
X-Received: by 2002:a05:6a00:10c3:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-8a9bffd0f9emr12878362b3a.43.1793747939044;
        Tue, 03 Nov 2026 15:18:59 -0800 (PST)
X-Received: by 2002:a05:6a00:10c3:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-8a9bffd0f9emr12878328b3a.43.1793747938577;
        Tue, 03 Nov 2026 15:18:58 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918f2sm144319b3a.23.2026.11.03.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:57 -0800 (PST)
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
Subject: [PATCH v4 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Tue,  3 Nov 2026 15:18:41 -0800
Message-ID: <20261103231850.17493-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea6be3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZcLbcdItcj5UGiXMI0wA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QV9Btoj4dD3_MrUez7J8fOhp8bM9_neV
X-Proofpoint-ORIG-GUID: QV9Btoj4dD3_MrUez7J8fOhp8bM9_neV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfXwFWvka2vbnfP
 SNRyUEUAES6KR60GP0uj91Qj+yDixKLJ4NNcZvxL4ryvwYigX4sH/UqYgZQ11v/StqloTlDFv+8
 Suh+2M2MHqY3VYsl84wE2Ycxtc5z2NQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX3MSSYNAR60oh
 71X9fMN3DgIZH4IoTYTTm2gvdr7jKjGt20w4X5hN9ZYpoAvIIHD+yjCVP/Ta5yFm7Dua6tBDrfU
 933n4zOiThkI9F6lgYQ8rIVg2YswolUAY7NzmNlaYzfNJc2D+/o8r7mKq5b53ZD0CyWV4MfNlHa
 WcIFq+t45j9SZqq+pTjwwxHv5wLqDYMLvvAsKLLDRq0yR81IGdWgHo2N0dgEIqm49VH5BlrGOkw
 QBrq0hNwgZwhgTzUu4tncae32+0yF/M/IDfqGZ3KJMwaNCpBdKsLFZcqpRru+uMHAdyPer9uCY7
 hmMLv7WhJ10lYo2yOaivUiTWqJiaNfwq8NdD/SaBMwyNTyFdqSEcBu8doDpoo2b0VyN/pvRUOrR
 XKb7D1NCNhxjvT2ZvgeSnnVhXyJOTbiVoNbZsXN4Dk7wS0TlJAWES+ylDWadgHInqyQwUn9FxBM
 5lKsJi9f4Mi6Tj0TBFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030092

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 1 -
 drivers/gpu/drm/msm/msm_gpu.c              | 4 +++-
 3 files changed, 4 insertions(+), 6 deletions(-)

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
-- 
2.56.0

