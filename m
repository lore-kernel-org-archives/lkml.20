Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F12FC00D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872396; cv=none; b=CgmysGv5Mrn2r0FX5/24SX6X2h9zDZFCTf+H0V66O01ltFHWj7D7fl9nUz/JIZKAJVVuOfb7222G09RETBQUnGRWS/rbq6uZnl/LFe7OZiZt+oGa2VpJ5AYHuiE8yCy/SiCzrE2tsFYMlP8WW39nDbgQNtK7x8B61967KEZuUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872396; c=relaxed/simple;
	bh=h4R+ZpPIgW1F2JqTClcK8P+aNB8FKkfZNhNfzSGejNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BN1W3fXrgWnlhIqi64+JNz7udgRfAS3Ic57C4OfZvzZLQ4kKojrgdhjnZgBf0yqecANHOiUhfX6WkzmWmQwHm3b2l712/s1h/qBXNpNeRCQWjcxyKFqwsMRDivykMHT6v82MDUjgHIKY6CcGcR9EvhNU4HwZLXXSrqrnMSGFC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcYWa6a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sa896AZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcYWa6a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sa896AZ9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RMdetX633992
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=33E8rQb2qz9pdouy7xP1qO
	TUfmQulAHsDkpXs6kmzjI=; b=ZcYWa6a0IF4i2QVR2NiAImmaJ+BpzQA+V5ewBc
	QaZkgxqMK4woDmHmkrajT99bXyIztuWKhgyvTPZvPNodlbi6p+SjBWsQMSbUE4FQ
	IfTEyuy4Ul2iXhXkhb3R0WDzl80yzVzXe+gx/l+oMv5gCpkkp5z1DeXzs6ssI6R9
	APFpgQ0+HFzEjSCvVGszXvBWjvu2wFZebHfZYbl1yJhCpmBGAnoF4bdFhSwdO5L7
	q/3PeCej/mqxq8G1tBzObX0wKRVlshrhVa/yhbhmcJbGQWlZJJEFb7qFo4VvLKN4
	GKiBL8nsRikliYJO3kyciIoaIXu4A3KVB/fdU3X68oOVYUVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw2897-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:13:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f9f6b85cbso4609401cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787872393; x=1788477193; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=33E8rQb2qz9pdouy7xP1qOTUfmQulAHsDkpXs6kmzjI=;
        b=Sa896AZ90FBAsK1tXVk4Fu8XId9WcUqgM1E8R+Y3FrZ5WVKSEcmnxLMtbGqA1K7Qwn
         SkX0cY/RMN6GdV6jj24mTkPDYIMnuMbBW6onqm9G+oNOUSW7it3rkSMF3N35b/XPbvu9
         33iYTuZGkb1AUrrNX3IMCCoPOxbXwsUUaqajorkZH5GFJt8MGGEkc/R1b2tjUGa5vhN8
         8EsgdJKxmrKViLN5b5HBIjh/IArSexa7dt6MDemSs4lcLWoWwuZhZKDLTWs/+Ao5pqi1
         69VsJRF8Tb6+GXbrE2P/Q0GaWuxe4PoW56K20HTd300cRpwK/CntYbJfA8BJElnSXiZI
         fdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872393; x=1788477193;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=33E8rQb2qz9pdouy7xP1qOTUfmQulAHsDkpXs6kmzjI=;
        b=ZaO2JgiFgKqzg3MrmvuapvM0kvUEmcHoEsEYFmuynfSSqVCW+KhXTg/GC3hFpIfPyF
         rvA4ckYIYFCYmJgUKFh5tXdNfvWKuRJYgle0ShgLnhWkXH441sfpDTOVMSsfRbImJTz4
         PSmCkgS5b80iEip2xTmuqgIfQ4AnTLx0G1ILpDgE4D2g0El4P4qRZUj8iPDdJtRCIqZv
         8y2pBXFKGxDr0r0inE+q8ul2/g09atm7ZRAzU+EwI4cSZE2Z+0EYzckiVOJDmywn/tiM
         e0tTjL097vq2cqL19yABVBaRiEcit2kxCgPjM9pY7xOtdj5J9L7UwyH9+aQz546PPNCl
         IreQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV90vkUgYnYwGzSd3eyV3DwowxBrb9bPO7W3LsaLKnSIwnmfc6K7z8jlnQkoC+5KtoMsf/5PlylzC417Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lzGFkAL2efuvxKPsArJvTTampYvdJZ6rMQZjtY2Mu1IMdHP24x
	d6GgoAsLEk4zjqiXJkLDeBQDZxVPpqwEgbju34SBLPSQRfbg581btunPhmpY3U007cxTSCRzhOz
	gQp4j05X5IDbW7VT4OAnQO10dYbQ0alLUNHFrca9s/PjAe07CQwkpKB+Ey6rksCJzCME=
X-Gm-Gg: AR+sD1321pQxpe18ad3kJq/V8k8qU0kJWS/bfDKtfEeq++VD9FV/8U8Be8wN/hZqx56
	CHQIdgB+81pJ6bdp+5gUkl+KdCM0HyjvTIyxuQDn+v5Xw+JFMTR+xq0TaBWocF6oguzT1y8r/7u
	2vSVq45RRY74Fa42ZWYvSCdMuKhwUwih6K/EU851BAoBEyBzbsIXgHR5WLt8ku3JqlkSNPYpkzG
	CzjEoXpP/e5SkYxDhB01jXghP1oieiDrKJZyw6WzwmeThFQvZgS8s8QCn8CmkwYyo1b4aZTDoaT
	dZZZyhyGEnZM8X8HisgEZdkwvD2M+KImXUYL5XY5xgM0eGuFzoSuzdWCj6RYzAyzES3tPPHzabj
	PvP+FlByflohjRVDhwrIKLYZPXwYXtNNn+3fVB8kI+61N1rF9QyJolA5b8J0qxitIdzVKAv0ZwU
	d5QxFp8T0+q1/z
X-Received: by 2002:a05:622a:1789:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-52fb9459c8dmr35895891cf.2.1787872392835;
        Thu, 27 Aug 2026 16:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1789:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-52fb9459c8dmr35895411cf.2.1787872392413;
        Thu, 27 Aug 2026 16:13:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce6fsm12281e87.61.2026.08.27.16.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 02:13:08 +0300
Subject: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIPEkGoC/yXMQQqDMBBA0avIrB3QGDT2KtJFEkedglEyqRTEu
 zety7f4/wShyCTwKE6IdLDwFjLqsgC/2DAT8pgNqlJtZZRBp9GOkcKGiVeSZNcdJ+2Nbpu+dn0
 HudwjTfz5X4fnbXm7F/n0W8F1fQHmDVh0dwAAAA==
X-Change-ID: 20260828-b4-adreno-timestamp-f4c846391b97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h4R+ZpPIgW1F2JqTClcK8P+aNB8FKkfZNhNfzSGejNg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqkMSEl+lL1R/y/qyJedG8OzQi7/ysAH4qNRQzL
 Ua4JrIBrmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapDEhAAKCRCLPIo+Aiko
 1QxDB/wNtEpO694f+0xH1+PcmXn88IC/VmZJzwln0Lb2qlJyrRNnKKddBdM9tkNWnH6/BXZ5JMf
 FHm/yIdZx8A6CnGAjDPEPbOHjAW3oogTpWFWIuDuoGgnw4tJ3KHVOParuIPUKHRT3ppwqGLFAIM
 SFf3ZmWZTeEC7EhJPnmnRYcEPq+maG4cW3MAjVRnZDJQrdACCAZZzO0xztd1UDiofvKd6zqb3dQ
 F2RIIspdDaigjOLAiJvv+RF1JbrIWUZLAIlEVC7lVtJMyR6YOchf1DCRD2SH3sKoeKmmDDAaMxz
 iNk4beZIHPNunEYXGOBXmVjv9vuGALa3trmrtB3m4kqE27QI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6I5sNUu_pPehwZl8JbDTrr127YEGd984
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5NyBTYWx0ZWRfX4g4FuVkELOtX
 tkA6A/1finODk/aK9jgbR0MJmOV6yIYwtylkt+X2MlqXLfSJ2jkymsCw2bPKPLMRE/O+n0bj5Qs
 cfm+s1jB7YGvDxvLpKLTLhE78bZypcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5NyBTYWx0ZWRfXwZsRsmU4gFDG
 AArrSlmVWDmZkveF0mlZZez4Q9avPHptpBHn53X7p+ARmTaTJ/s4MxQJGKR4x8KqvOiU8MW1nl6
 gvy4JylcFIxqAQTMLY+t7fY4N01W5kzHVgU4fvRnmbfubMRPiwe8pDFGhMdLvV3nNQZhZ9V11Tr
 lPOvZQv9SDAdwh2FNPIh/IIl2f2/JIIdWCKlrN5VkK5BsnsXMn6DbnIcJZ7fd/++Kk9n+euZ4fh
 M+d2kq2+1UcbQsfkgjR8eEPVK1X24hywY8LOjiEL09Ur7Mdg05Sy55pdG35NpjNgWWe8nZ+eUMb
 kfPz7L96EBmZg3FpVCwXZ+Xy3P5pvkWhPsvA+6zd+P5RPJoaYx/npg0P4cQSutf07vWqnU3fl8/
 3p4TCJezUMxrr5/o1IytZH3zLU1i1kBt+kE1RobAyJkwLbbNjaRSxJzAEcTaTPGJaryDe/Htc5D
 rkMadSHQzd+G0P4iJBg==
X-Proofpoint-ORIG-GUID: 6I5sNUu_pPehwZl8JbDTrr127YEGd984
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90c489 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ShAjJNOzEIEqusN_WzUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_09,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270197

The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
zero whenever the GPU is powered up again and the timestamp reported to
userspace jumps backwards. On an a702 six reads three seconds apart all
land in the 500..1200 tick range, stepping backwards twice, and on an
a530 the OpenCL device timer conformance test fails because
clGetDeviceAndHostTimer() returns an end time below the start time.

Save the counter in the suspend path of the affected generations, while
the GPU is still powered, and add the accumulated ticks to the value
reported to userspace.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
whenever the GPU is powered up again and the timestamp userspace reads
jumps backwards.  Accumulate what the counter reached before each suspend
and add it to what is reported afterwards.

Measured on an a530 and an a702; the GMU parts keep their own counter alive
and are left alone.
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 6392126f48f2..7d9dd9460f5b 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	adreno_save_timestamp(gpu);
+
 	ret = msm_gpu_pm_suspend(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index f1df2514c613..c5552f1085e0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
 	}
 
+	adreno_save_timestamp(gpu);
+
 	ret = msm_gpu_pm_suspend(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f9de9329dee3..106cc2ac55ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	/* only the GMU-less parts come here, and their counter is in the GPU */
+	adreno_save_timestamp(gpu);
+
 	a6xx_llc_deactivate(a6xx_gpu);
 
 	msm_devfreq_suspend(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3370cd44382f..f83960b31901 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	return vm;
 }
 
+void adreno_save_timestamp(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	adreno_gpu->timestamp_offset += adreno_gpu->funcs->get_timestamp(gpu);
+}
+
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
 			pm_runtime_get_sync(&gpu->pdev->dev);
-			*value = adreno_gpu->funcs->get_timestamp(gpu);
+			*value = adreno_gpu->timestamp_offset +
+				 adreno_gpu->funcs->get_timestamp(gpu);
 			pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
 			return 0;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..db080a6d515c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -207,6 +207,8 @@ struct adreno_gpu {
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
+	u64 timestamp_offset;
+
 	struct completion fault_coredump_done;
 
 	/* interesting register offsets to dump: */
@@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
+void adreno_save_timestamp(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,

---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260828-b4-adreno-timestamp-f4c846391b97

Best regards,
--  
With best wishes
Dmitry

