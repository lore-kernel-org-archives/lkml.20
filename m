Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFEB3905FD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790464822; cv=none; b=i3PjbdM60G3JC0LMFLdcAVyZQSCw6CKo7qSA+t2h1c5uEghLgWrnp9yjALsB82/r9ibng70Be3dTZRxVHgOuMhw3SzyKOP1bPmPZbU2ihvYFlF9FBRy/kV0NygCg4/iC6gAeuZBNTDprfuR0GAtLj78UpVU6SnetUo4FE8dCUU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790464822; c=relaxed/simple;
	bh=5j7e0HkNKk1PCIDPhYgV70i6SghClNSTMPq1qNiKRnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGv4GgTtIoKEG3slgxoQ4ChWL4WUero1nfQaHLpG6zh/+JrILEwUecaxBovurZVb3p54lX1bTqgPiyh1wtLPWTfbiXHX3HYcFA+35EJjY3xgyqC/8Dcd+0/OgkqYcW5ymKZyykgFIUnKiatd0t6im7YM7ySciV2kMLOTZclKGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLfwSxz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh/+Qepn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLfwSxz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fh/+Qepn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMEXDW1511013
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=; b=dLfwSxz7ICtXvSMz
	NFA/ODbMW9WL2BKDvJe3w7jOwWNJiiGYEEI3xgcadwxNcqOnlf6ciukuz2MpmwgH
	t9eO5n9cLXDqGYghC3jeEW0/X525VB4yTLo0P+o6wo8lBBqvzuYk6lECe+gDUNxi
	HLpraP76CJnlLRJz8Ie2wwr7VtKB2z4xx9AwXU1ZUw2QCsFnxMs8LDef1tMrm7IZ
	mLItYM9nR2EjkRcN47acUT6Q3H9CveyRiEeXXY0odlew9/lQfFX+n+chegwLY8wR
	px+dIkVqDtJtvhUlFdPmChMEzRJB8JJOpolhQUNS+xxaJL75ywg2w0TxBTux7Z1p
	XWfT2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw9xp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530e0cb072eso37455681cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790464819; x=1791069619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=fh/+QepnozxxGmVXsDuM8lHm76rplZm8CU9kbqGCfzDf129LZlOZxCd0KhAa9DS7F6
         o5iVte2p6HTo3V+lvkjHqg7ymbqAZvlP6g6/j1ny/gyk8q/ymBn7UINzaB6GZkSHMZ3D
         whwvlHWqP0IC5+U1QWWCEbYbAAj2GEudr9JMVh1ZVST97usdcbwk7Kzy/8uXpFBBadJ0
         1sgOPkAxlJNLNwzJFZg8/CKjDIINukrTj6hqPLJ2EyVoLeTD5fgiT6/szhk7W9Sg0eI8
         5y0xfiJm1sBxORpBv/VwYK8ToKJc7mUf9M42WsGf5HH7rnaEMf12ke9+IGGPzZXLiN3A
         dPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790464819; x=1791069619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=IgMKC7nBUXp6xsXZ2mVtZLv5TVRxN65zj0J3IxKw4FWKp4ddXdAjUxBd9uFFSC8sV1
         eXF2uOGS9WgA6X4aYGJrsGyFQGNPujSQos4qpOerUDcLVNK4mffJwUQ1mzoKmbPkSPYz
         Yu2EhSQw0B8WobYZICxhCjii2N/dSjW8KcFRfvdyBBLz7vuXvESbfrdLf+70tjbOplt0
         YqtkhSVUyFX5nCTuGZ03igdsfL1xBTiHi6SioyDX4soULbTFudLbbm3TOQBC6OJhu5sn
         9mi+YhrxPJ8jmF0PcCNyxLA6akmoGb8QiWO1cE3TB6u8BWoUtT62GsruJmStwbxInvaN
         sDJA==
X-Forwarded-Encrypted: i=1; AKwUvBz21SUKX7s4O9tP/JA+evsGGR3hiy/+wGtimENja1yn8R+IsYcALuOrZ2cgkg7vafCQ4o8Q2nayeAufefc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Z5IqzEXi2Uh0V6nsgKlvW1iU3GCyTUkgcKl9VWxiq5/3JScc
	dAJ/QOFB3iTFH6zE2f3gf3lguDT6Wz4KmWK9CEoSyF2RmT8gjvA2KBL29iXpenKRxSnhGy+5NJv
	xQZgAVuMy+xacMOcOsP+9qdtveTP4RJ33luuDqjPE9TrGtYpGYTYC5wk5/0FXih+Ut9E=
X-Gm-Gg: AYBFou1id4Jb/LqECgQW2vi0nrZEAnT81UBmxOGl5FP3j9iW2iC46EoFOOGkX1mPicS
	nbcdq76oGm0FggX5K5pBSaFlr5ppiRwg5qOaa896wMH4Uqr9/SjZrCGDgoUHt7HP2WuMEOW2Z4/
	xcdo9m2434KQPV179S1SGSvFMKdupoGunqnmqAkWKI9z4cI0o0cH/bsi60izZkyUK2EQzWcNuN/
	zspWGTt6kudtU5SBuNglOMRs2JGvDN8iDKd0k+3/ambPWkld4vOXHKykDW02ZLjlYIV1tNCTFWH
	C1CgbinnIfCYWSX3a5nC6eBoO1fVeioMyTKu2gGPjMk3m1RpxyQErmLy3DP6XYfZlSeAF0YtDlO
	shd3A3H3X+ZoSn90JxvNScRmuZwF4w/CZPhG/FoGL+OQxTUKTyD8BkFvLqrGWyS0wi4rr59yPDe
	p1PwKy6UKHw5zv
X-Received: by 2002:a05:622a:352:b0:533:2fd7:f08d with SMTP id d75a77b69052e-5332fd8038bmr37214641cf.0.1790464818888;
        Sat, 26 Sep 2026 16:20:18 -0700 (PDT)
X-Received: by 2002:a05:622a:352:b0:533:2fd7:f08d with SMTP id d75a77b69052e-5332fd8038bmr37214131cf.0.1790464818446;
        Sat, 26 Sep 2026 16:20:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c3274fdsm17676311fa.38.2026.09.26.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:20:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 02:20:08 +0300
Subject: [PATCH 2/2] drm/msm/a5xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-adreno-progress-v1-2-f0bbbd6a4ac7@oss.qualcomm.com>
References: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
In-Reply-To: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5j7e0HkNKk1PCIDPhYgV70i6SghClNSTMPq1qNiKRnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBquFMq6zURkg8gkftwA3fh/O9DpzaJNwAu7ctDQ
 KfsBOGwbTqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCarhTKgAKCRCLPIo+Aiko
 1ctBB/9SAoqcHxYByDESAHVT1UiBYxzjcx3uQ74nj3TTpFbnfxaXnyihzq1bPsDWUVJUjm7A9BP
 heco26xZAdtJ5yHL+Lk0zahDA3sN+LJBpvlq7Qkx1q+EaqTHhHBmOWTt68+nlRDYGZHhhlgpcIR
 DAgpsn6h/4/tPaVuhdSOF+7aqVSf4isjoC9259Qysxgm5zeNmukNllM0IQredB0sUU/lvWFAqLu
 y3P/2hR7gEjviizA1Qa+Rs+VicZA/NiSz5O+PO/pYC46NEdwDlkqyV5bxMT667orp2GNIvUm7vf
 nsgFYyhcqSRgSBa5m5AUYaiYrdf5YI4ZMNVMs7wOWRhavmoi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rC3dcPs7HOF2d4HGxe34MOz1hv2BjNYl
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab85333 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8wNfRxjPmpLGpMwT6toA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rC3dcPs7HOF2d4HGxe34MOz1hv2BjNYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfXz4gJVmcoYss4
 IDlzkGPOphgT/PBaJV/q+CouZqLaU6GEqmedMDoC2GdTem1oYpHq0/Ck1jvQTZ2byR0m6BxA+QE
 y95CkCc2jOg269Pp8b6eeN+kwT2RrT7r7/Egd67v2w9HaGBczmPi20cTLIKeQ2ZLxhFCc4vdh/z
 Npn0Vewa86riFoBox1xcT5eG2blI7cRIdCjHIfJptQp89V03QwE9jJ6lATvWt2jy6RBA5uQyChn
 xDWSg9t6Mra7NOhABIimWxxGq/MobUTz7NW5NpZ35BPEbretvPfaV237+4fru7ZXBSIQVB6tckx
 LPbyNecY1y14gINdYAk5p/PFvfwxD2gPDiJ7pkjY+Toa13pXa2D/2uujlucqOe7S6KXMlgnX/CF
 BNTBFAhxzuz8fzQXKf+RvDalrUCztsF5C+28VefnkHfWVlMPy79AZhN6WtbboHHF4g/hilNy4/c
 CLLBRcBUg4piIRDoCAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfXzArmvspLDPuS
 eGwfK6wH4QqLrOVzLd4wQGHFn7gh3EAxJZktCq0dnHymh+eHe/86ayEzoHqS+TR/DSdpYOZ7jqb
 YeiYYjfYL2Xw0Q+Ww1rbx/O7DSftgKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260093

A5xx has no progress callback, so any submit still running when the
hangcheck timer expires is declared hung, and long compute dispatches
such as KHR-GLES31.core.compute_shader.simple-compute-shared_context are
reset on A530 while still making progress.

Comparing the CP IB1/IB2 state, as a3xx and a6xx do, is not enough: during
a long dispatch the CP has fetched the whole IB and waits in one packet.
Also count ALU working cycles on SP performance counter 0, which Mesa
leaves to the kernel (and the kernel hasn't been using up to now).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5d96b8f63156..9f4a97195cde 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -748,6 +748,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* Select RBBM0 to countable 6 to get the busy status for devfreq */
 	gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_SEL_0, 6);
 
+	/* Select SP0 to count ALU cycles for hangcheck progress detection */
+	gpu_write(gpu, REG_A5XX_SP_PERFCTR_SP_SEL_0, PERF_SP_ALU_WORKING_CYCLES);
+
 	/* Increase VFD cache access so LRZ and other data gets evicted less */
 	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
 
@@ -1687,6 +1690,29 @@ static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A5XX_CP_RB_RPTR);
 }
 
+static bool a5xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read64(gpu, REG_A5XX_CP_IB1_BASE),
+		.ib2_base = gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
+		.ib2_rem  = gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ),
+	};
+	u64 alu_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_SP_0_LO);
+	bool progress;
+
+	/* The CP can stall on one packet while shaders keep running */
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state)) ||
+		   alu_cycles != a5xx_gpu->last_alu_cycles;
+
+	ring->last_cp_state = cp_state;
+	a5xx_gpu->last_alu_cycles = alu_cycles;
+
+	return progress;
+}
+
 static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
@@ -1800,6 +1826,7 @@ const struct adreno_gpu_funcs a5xx_gpu_funcs = {
 		.gpu_state_put = a5xx_gpu_state_put,
 		.create_vm = adreno_create_vm,
 		.get_rptr = a5xx_get_rptr,
+		.progress = a5xx_progress,
 	},
 	.init = a5xx_gpu_init,
 	.get_timestamp = a5xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 407bb950d350..fb05f1ca3e81 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -36,6 +36,8 @@ struct a5xx_gpu {
 	uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
 	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
 
+	uint64_t last_alu_cycles;
+
 	atomic_t preempt_state;
 	spinlock_t preempt_start_lock;
 	struct timer_list preempt_timer;

-- 
2.47.3

