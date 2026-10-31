Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463136;
	b=ugqYi3G1/1IjEccNfUQlmmyoj/hXc2+1juE75gMGtmiW32VYLjXRM7N5HUxBty+LSh70
	 b0xUuQeUKekN4Vjvy9/IfnPxmpSUUq+HQCfEFiVjtTLemp5WewCwaHJ2c2Bk2OBkp09/G
	 htlBveNZUQ9gmo0h8NRxMR0TEFEG5zJq8JquW/2ZsCopjVILW/gLhY2JXp0NubPV//mFu
	 +0S2PxQ9mczrSSFabrZR/PDLr4Bnej4RaoBGMBwmZU9dTdHvtbUcZIas4MRQ+Dr0vLJ0p
	 MPmEa2EKMGScNHv3Y+ey3kDOD4KtI+FvPJASsPNPRCrhXiqe80Hpz0v+TQInq3ljaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
	b=bSckiWBbQCyM8yvqFCXZ8ZZWE4GKnoUAWApLDIgwNBsIYC1Gt+3RJyb6LIfQW1Y1/c17
	 B0/Qy0H1iLjd7NqA3Ew9iIxvCW7pk++8XTn6ct8feXUSaTo5gKWocwXoHPJGBHYtnIPiD
	 jZuAqj7F7wcRwkw6p8ptLqWG1ST+eNcCHXQWNjqjVtiTv8TBtsJXzOM3yA5BqAJsJNQ5O
	 Z4/tEwUxxdoMmybUkbMXernZZHyMBOCGXVqKQ68LGk6qUj/mA8nQ1SgTADluAsPLmLgvg
	 Mlg/TS1jvLOihO0QJihQ0MIsIX5jHf4dqrU7mynEjgF+tbtbBusjNuD/fDElr7hzlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8OFDJef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YT30ZN+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79153606A329
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79153606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8OFDJef;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YT30ZN+E
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0L9U2766203
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=; b=i8OFDJefNojLBJ5Y
	s4/Xl2d2/qcXvNPe7KwVRWKy9uRvr5fP5ottuYG0cgOenfKIC2rcshedRembaCwL
	A3jcm0djMdiAQqHYq01HOz/3CCHYcUjaPTXwYkY4bKwbEFzFPPH5goZZR8tqaUmg
	B97arNOYD4mWcFHWJc1tnuDndUwLrN3FFcS8ojZOOC8UkCnS9YPSQh0QM2OvelGC
	iHk8TOVl2Wr+BVKEFD1hYF9Yfw357IuA2y/vCYKxGpPCBQJgGgbktO9OIO8DHxpp
	XM/4LIaFACcfvzSor0IDX7aj7HO2se9uj0S9APbaA9uIzsiDoxLPHeODNQAl2QXc
	zQ3FFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hky2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so294702485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463134; x=1794067934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
        b=YT30ZN+EXyUqlQFFAQNklKNMdJfJujavmZ6hbnDuUWTzD1otm8JUt5rGX1bGoLcX/a
         go/gpZdWojUuOsS+vOTE0w6FksKK4QH7xDIuUY8/BaYqxtL3xkvGpTXj4DAh8FO75eWw
         Mn+iQCslGZPU+F/PTLBwIbFBoGq0ZNao0mIKXVQqYRLADzZd6LeQfIiPs++AqcgZk459
         iXxAUwwSVfctk2lkWij0ntHbZ9LWFppOj3Khzj3J0L5gREkPphcHbLPD7zGt4gIwjbrs
         NCe3dDaXt9In6uHJ6RZRgwKrzq5/Zv4ucmFVWucFPnR5PmOFGZ41sBiTYehOBZvOApVD
         YrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463134; x=1794067934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjGzml6CP74rYN0xa4cDI3KFc9rpRn/MizTXsFxSRL4=;
        b=SLxv8C+QwfGcF4Tt/J06XvnEmpv0QrrQ74YYuUhEHouDi074+qNyhYsyCDdaYKz+9q
         dVPHDXynhowrUHamzz1/pWLVA/DXnpMoPchAzKsOtWfhqpxzYNI4fv0BgtLYcTH/Uj4Q
         PTkQNaPnvN0ZyYmjmqRJTvzb5SJEipYeYcu2QSY+uOcpmk1Fr7g3KdpLcg0XbKFv2hr2
         kT5LYEbSPToVc26mYQ7dkAIQCnOL6NTCTB+GwuCMkKJA6eDLUIf4qpE9yfQkrV13D6WU
         3bo7WcAJXGYrBshPIZ8zcGHagvYxdOBFLIU4jXL26OEULpStsT0jsRTnw6ywVZe2eSBl
         LO6Q==
X-Forwarded-Encrypted: i=1; AKwUvByD5uoH45NWBMUs8kxgcIQoCAFH+vRgjcBT0zhKrRH6GWUT0Klb9198LevVg1cpxe6WBujjvBfZPXAzsYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg1GlYW7IoH5tFXFTvp3Ci4upMey77Qr+3rMK6vxiWvmiBtXIR
	lGhgEURCgj3Dp9fUfQJJoTgDzm4HDQA5rjxXwjIV1t2Ab7/3uIiHA9HLiPeGbRfIQCFZxPdyHFp
	ZPICnCy0MfVi9KtqXCNU1RUS95l/HnDuv5XnrOW1XsHm+izfZnh8J//Okc6LF1R12j74=
X-Gm-Gg: AYBFou3h9LJFFDioJ+Zin6Jl3QH7Fc8rXQGyxrsKEo7ff3bTM5uDRYECQapetj7jsmG
	X/Rdcey1/mmg4hRd4nx9RBiNvZ1+apFgRjEB4OcLk9Nw6jxWTJwd1jGg+kb3ogUhkh2Aif5JMaV
	x8ITsLDUTGCqdrmF6mgDlj0l66IwceB+7u4VXjm9PFe+W+mdVzr1xRmBplH/jjdDFkGoIZMhTjR
	cEUsNe1KtdZFNXKikbkvu0Si4IZUDZnb7PXe/NWmdFIC4nNFiDhs76X+Qa5Xov19+VtSRa85GP8
	jboDe501eU68NVypRrKtN8FmoOaB3BfNOxYJBsXAohiV3h4Uk7GcvziF9iAB/XVqqaEIVkpEBe8
	i+yKnxNllJN60AR3cW9W0ZzvOpC7VtsSDFAFoVn62GDjddTFdGxXkubsUiJ0Om4qSHToGATLJLn
	vmPUWdm8wFTm8YnRP1Ui9/lr/hOzoMprwYdY4XbqTpjkQixjEY6bcw1Xqwv8TdNg==
X-Received: by 2002:a05:620a:460f:b0:93f:22af:cce7 with SMTP id af79cd13be357-94421585456mr894490985a.12.1793463133612;
        Sat, 31 Oct 2026 09:12:13 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93f:22af:cce7 with SMTP id af79cd13be357-94421585456mr894485185a.12.1793463132921;
        Sat, 31 Oct 2026 09:12:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:52 +0200
Subject: [PATCH v2 2/4] drm/msm/adreno: add a timestamp offset for counters
 that restart
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
Message-Id: <20261031-b4-adreno-timestamp-v2-2-0836856b228f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pgt0edGfcerXO7fdC4IZjk994ujodfRoNGPFKDlJzNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNQfNyiirMtKyxGYRZr4lea+TqW6fLQuZdHU
 3ae5kqCsq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTUAAKCRCLPIo+Aiko
 1Va/B/0RYec27l6YHQswUMqvdClNOpO3EVfW6L3XHWtMBkYb6kTm2R7/ykZXPtKKb4247BwJggU
 zasUkwGqdGzmZ68r2xD2VOEFoeIbXU7bNwzte+X9bzwrsfPU+0ZU88nTRxwRwIbI+gSpeK0JgyR
 7fQIiJ8rIVC5xmDxGmtRgDCuiKTRLwirEaz+RqxUmpRQVokg7kJS24VZvKKO04XrsxIgS9hHsUV
 wGXiX+SRLK998PDFpy1hKl7HggKhaM72TymUt6H/JrCKbrvWj1kfpjwR1Uer5UN0enKOmvpcyZJ
 MUDUlr8GFz5zE5XTAXmOHSBVTYdf7exH7TGMBkKdewGODs9D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4QBLL4eVR7cWYaDnD9RjuTN2N3HS7Kvr
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae6135e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0rTI16qmik2F_lPQQP8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4QBLL4eVR7cWYaDnD9RjuTN2N3HS7Kvr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX9hOMK3YLLV+2
 1ZcK+LvcmZtjs3wMWNVEBZZORvbCOus9zlKel6SvPZzzpng+2Lxzwg5u/asf2GcMa5k/65Xlm9Y
 5zN6BGirG3qZOVX5inRmOpS8+MYlEME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX9HaZHS9dCm8K
 m+fCVsWUazsbXQk1LMfbC8SR7UauXIbOVi8KJPQjxQhZtrFUeFp8IdMBs/RKyhfEHgpTa5caI5D
 lYtSvZnK20GC/YzyPhszD9ZNCOR1LGGcsmokK5wCVlp0nSUA5O2Wv7n5DM8Q4mQcNuUhf9vOd0+
 Y5F09Jw/g8Lf7EfNYXuDa0tnVcEWMWgttTcHQS1tdMXC0xJHwHkoOeJzkVBI8MpC6cp+avA+B2M
 h6Dq1Posou6tQfiy3vJ8vqNypz4+pd0Hcy0U3sNnycJ8iWi/w6XTg+u1qFPmj0f3c/nS+WOGfGp
 RkAIQTQ1LLPPUaBjewGO9KEduHs5kn6hwR/rJYDGB12U6a5RJ9/+1AC8L9TYMkOXfc0pzpvKdWq
 /5ZMN6NRApMGMihUmOAL3R7q1iEjzYCBdLlcLn3348YjBY5E+N3l56v9WGXhgNyk+Cgt8mBEywa
 tV02GjTnJ/4bI5Vb4Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Before a750, the always-on counter behind MSM_PARAM_TIMESTAMP, which the
GPU also writes for its own timestamps, restarts whenever the GPU powers
up, so timestamps go backwards across a runtime suspend. The counter
can't be written back, and adding an offset to MSM_PARAM_TIMESTAMP alone
breaks its match with the timestamps the GPU writes.

Keep an offset that makes the counter continuous, advancing it by the
CLOCK_MONOTONIC time the counter was stopped, and publish it in the
vdso page so that shaders can add it to the timestamps the GPU writes.
Report the counter with the offset added as the new
MSM_PARAM_TIMESTAMP_MONOTONIC, read under gpu->lock so that recovery
can't move the offset in between. MSM_PARAM_TIMESTAMP stays raw for the
existing userspace. On GPUs where the counter doesn't restart the offset
stays zero, so userspace can take the same path everywhere.

Nothing calls the save and restore yet, so the offset stays zero.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 63 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++++
 include/uapi/drm/msm_drm.h              | 16 +++++++++
 3 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0adf56fb9563..f13e54e75dc1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,6 +226,50 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	return vm;
 }
 
+/* The always-on counters tick at 19.2 MHz */
+static u64 adreno_ns_to_ticks(u64 ns)
+{
+	return mul_u64_u32_div(ns, 12, 625);
+}
+
+/* For a GPU whose always-on counter restarts when it powers up */
+void adreno_timestamp_init(struct msm_gpu *gpu)
+{
+	to_adreno_gpu(gpu)->timestamp_restarts = true;
+}
+
+/* Call with the GPU powered, before anything that may restart the counter */
+void adreno_timestamp_save(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	if (!adreno_gpu->timestamp_restarts || adreno_gpu->timestamp_stopped)
+		return;
+
+	adreno_gpu->timestamp_saved = adreno_gpu->funcs->get_timestamp(gpu);
+	adreno_gpu->timestamp_saved_ns = ktime_get_ns();
+	adreno_gpu->timestamp_stopped = true;
+}
+
+/* Call with the GPU powered, before it runs anything */
+void adreno_timestamp_restore(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u64 now, gap;
+
+	if (!adreno_gpu->timestamp_stopped)
+		return;
+
+	now = adreno_gpu->funcs->get_timestamp(gpu);
+	gap = adreno_ns_to_ticks(ktime_get_ns() - adreno_gpu->timestamp_saved_ns);
+	adreno_gpu->timestamp_offset += adreno_gpu->timestamp_saved + gap - now;
+
+	gpu->vdso->timestamp_offset = adreno_gpu->timestamp_offset;
+	wmb();
+
+	adreno_gpu->timestamp_stopped = false;
+}
+
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -404,6 +448,25 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 			return 0;
 		}
 		return -EINVAL;
+	case MSM_PARAM_TIMESTAMP_MONOTONIC:
+		if (adreno_gpu->funcs->get_timestamp) {
+			int ret;
+
+			/* recovery moves the offset under gpu->lock */
+			ret = mutex_lock_interruptible(&gpu->lock);
+			if (ret)
+				return ret;
+
+			pm_runtime_get_sync(&gpu->pdev->dev);
+			*value = adreno_gpu->timestamp_offset +
+				 adreno_gpu->funcs->get_timestamp(gpu);
+			pm_runtime_put_autosuspend(&gpu->pdev->dev);
+
+			mutex_unlock(&gpu->lock);
+
+			return 0;
+		}
+		return -EINVAL;
 	case MSM_PARAM_VDSO_IOVA:
 		*value = gpu->vdso_iova;
 		return 0;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..51ef57b536ed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -209,6 +209,13 @@ struct adreno_gpu {
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
+	/* offset that keeps a restarting always-on counter continuous: */
+	bool timestamp_restarts;
+	u64 timestamp_offset;
+	u64 timestamp_saved;
+	u64 timestamp_saved_ns;
+	bool timestamp_stopped;
+
 	struct completion fault_coredump_done;
 
 	/* interesting register offsets to dump: */
@@ -641,6 +648,9 @@ static inline int adreno_is_a850_family(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
+void adreno_timestamp_init(struct msm_gpu *gpu);
+void adreno_timestamp_save(struct msm_gpu *gpu);
+void adreno_timestamp_restore(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f8bf48fdc339..2fd185f0ffcc 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -120,6 +120,16 @@ struct drm_msm_timespec {
 #define MSM_PARAM_AQE	     0x17  /* RO */
 #define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_vdso */
 
+/* On GPUs before A750 the always-on counter behind MSM_PARAM_TIMESTAMP
+ * restarts whenever the GPU powers down. The GPU writes the same value as a
+ * timestamp.  MSM_PARAM_TIMESTAMP_MONOTONIC returns the counter with
+ * drm_msm_vdso::timestamp_offset added, resulting in a monotonic timestamp
+ * that most uAPIs require. Shaders can add the same to the timestamps
+ * the GPU writes when required, ending up with the stable counter values.
+ */
+
+#define MSM_PARAM_TIMESTAMP_MONOTONIC 0x19  /* RO */
+
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
  * of rings.  With drm/scheduler providing additional levels of priority,
@@ -134,6 +144,12 @@ struct drm_msm_timespec {
  */
 struct drm_msm_vdso {
 	__u64 flags;
+	/*
+	 * Value added to produce MSM_PARAM_TIMESTAMP_MONOTONIC.
+	 * The offset doesn't change while the GPU executes a submit, and stays
+	 * zero where the counter doesn't restart.
+	 */
+	__u64 timestamp_offset;
 };
 
 struct drm_msm_param {

-- 
2.47.3

