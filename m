Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1154E56D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775429; cv=none; b=XAKYan0CnPhnqWH8nX+5rxmRBeZXs83i0yVp5w9EAd8XLBc/v4MREju5KdwES15mSpEepyzhTwYbJEKmMUOcF1Wc1l8tdK0gssdXrDCa/QZZb2JltcilBd8/n7SjxmZr4Q0W7qpF62qAleaT7qQ44JwoakKsBs8e5HIttGYbYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775429; c=relaxed/simple;
	bh=5j7e0HkNKk1PCIDPhYgV70i6SghClNSTMPq1qNiKRnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jht8IS6vAV6IeJfR7DQoRV7mS51bt7ueKi44BNG9h7gYxqKRRMySnzuULG+KxtaO63rg9SpDK78/x7laQXTAh15K5TlKm1YWNyFxxdKXKqZBA3Cpw7zNXx3RmNYBs+Tbw6KN6sStmgw80nF7oa9x8ormHn9LNxyYPwY1bxnNWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peJ03wPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/W9VuZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peJ03wPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/W9VuZy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hu72584053
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=; b=peJ03wPRAJtbDZGm
	kt7yP0NhIl8GP6lT/NBxKbW4cypAeK9qqfurVszXhEOzw2vFIFS1JTDQpbe3v6Hb
	FGofqCVExAcLStLydz5/jCQ4oWMsY5db3Oxe+SqvIUZV9wWLEcJAiawWOg7ZnJnE
	HebIy/L4iquLbObTl9Ky3Gu8YsibeZVcCxip0Kqw2IAQoePGYu9w7wQySggVKgzA
	ioFCN+1j5P/FdfdqdkRYRUzFX/naZvJRhezc+fl8aZKRgn2BSMrjY9H5EtNsn6vD
	4/5hLqsHUDxpKcEBpKw3EHELSoNYWOebSWR9RcBzdRAtl5eyGCBkmO1c4Bl1mvD7
	qYOYpw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhek2ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so1285339137.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775415; x=1791380215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=H/W9VuZy5BX6wLZ/p1cGwVy7b026qlYvHXhgfQQ7hSNHOl6gIDOZhEQeAycvJebOG7
         ZzK2fggkBSHLPBe6E8CT6lNI7Hj0jWxLp5KlPSnc6cBnktZy5lcrVky7GeyY8c8/++hX
         5icYsXu7Hxf9AbAdsK8Hj/luTmkPZSUgrtwVoZ08qfUdlzP2XbhNTu+7qaULi12QsrTx
         oHSYIb5eDzfwJNDwnV51GAeKhN+BA0zsKmz/H903Nsl4ZYf8YslnK7KOVbnJ/2VKoE4J
         ZcTRGJEwECSVl1KW3TipUGGWtWcwqVUKULeqiOoGgBiZesmBGeSPlfvRomR6p65xN3hQ
         GOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775415; x=1791380215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOZvv3gRAV4Yfr/2IAD8LT6d/JrOTz4oDcixnCJZyHI=;
        b=kIWxtGBpB65dufDRbz0odiMAS+ObgE/1QSOhGZF+tPMykOIyARO/6/Dn9t0wLOvBzs
         YSAp5gKSgiGYq2n/pYmd25p+qAXBtYkZ8KmOcINwrhmfY9mTMx0JEsAd4Ei0FSyAnM7z
         U1mkxYS+UxmFvhfIgFXey769wO1TP3ql+iXcCU0gdWoVozjUozH9LWjY0Kwj17V6KJL4
         hbaxrWpSTJW+LVGa2YfLR4Ydv/rL/i9TkXT4y0fyTYOS+efmlcithb21ckgSX3zKvQnP
         fDp4/VmipBiYD1exZ/ldUcEBiqpbRdnoayyddyvDGrH4N1uzuVYb0PeQYgHQfj1/h5G+
         LOqQ==
X-Forwarded-Encrypted: i=1; AKwUvByB1zYSzm3GmaPFs1/0dDyDx39is6MW6kVBn8lR3m3iSsY3nngnFZ4/IkwuExs6dicZjijfDaD0Hhm68VI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHMHBTZny1PQlEzZXYWiA+y+TesXkCYrBwmKyd350uz6bFA/rs
	TlGKARERdBY+DbtjtUjOQ5TcI8ToTULchP/Wd1AOT38jBu+sZF4ovB6aMNKDMfJARBQld9EwXr9
	voaWDpXaFdePdzqepRm0WFuZDyW5D18ZCaga/h8/ZREypqWcl3kVvmB5kFPSfB8x6+Kc=
X-Gm-Gg: AYBFou08nHBId16v7sHieD/QdphWu3apM0PfUjEEXpDnN9lhY1Vq6BSWrr23UOCly5j
	CYzxmJdcJo7pDkhXppYlxK57pdXAsyHzumPE70vWY7lY8N00Ngc4jFGI2JlBsZnIvhr+p1Nxzqy
	Y46qdI3r6qU7MJ31BR3uzdtMxwpZSR0wFqfiNbKmdXGuQgQYRhsFRxcSYL5km0n6iOJ6S2jmunj
	5RsvkXNuVHM7D5BgwC1hK6WilfmT1EgW+kmmZ6WZzlLz11oQQL9nixBJzx76liDj1u58EoRGzoL
	PB0Sp27B+JwRnNxjTrUvkPQvgfDzQo5M3RdNUr7t1HmO+tCIWgbS0Q4bQZ+3S2Xvwkm4qAV3H3C
	1uyFYKK+/Ad/KlHI5yLDR/3iTSguf1nOEisj+U1nNYnrcnZWOHwvtDklJ6Cv0c97h5b2XfTEb4w
	==
X-Received: by 2002:a05:6102:8097:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7be72ab7b3emr293635137.11.1790775414796;
        Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8097:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7be72ab7b3emr293615137.11.1790775414195;
        Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:36:48 +0300
Subject: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
References: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
In-Reply-To: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqvRBvIk0vfYBZyCPpYepLk5T7fPnp9O3i3128F
 XQ3bhvbqn+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCar0QbwAKCRCLPIo+Aiko
 1WhWB/9IfBV7lWmh/j4E45WV3DyfcZEOXfz0L88TOvyOABUeFhTm8gMTHo3FIwsMy9tNlo9Gh25
 jHOp4GyLRYkouATi1FpQ5Z2plLVxmukXIXntRsMlT9OmfJ49fB3u/RlpEAisih6SGq/9vod4Xy7
 faqcQDdg+9b06dMbUIXUP5skmpu9OmRLtkurVCpSDPkvnjHKdCjwK1lcEbHp3YXvJGSzLp5PZa1
 7iZtlPziQVJrRkudQv+aA4BVyV2H7fLsqm+EkJDBUSNAsC4C+nX/smW+5cuOeFRdRhE8Syi/o4O
 VEPooo9qzfFX0D8pLzClj0Q9m+3ELIsWm3pa86p8SM2Reepn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Vjtt6Te7ZQAoAcMCNyBrjgfex8EkYnjC
X-Proofpoint-ORIG-GUID: Vjtt6Te7ZQAoAcMCNyBrjgfex8EkYnjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX0XtAk15ByXQd
 AW+ruDyg52o9HE6SwDGZak5dQijm8HwvU5sKVYC/BJ3a/ZLezQRxG8gW9daPe5ZQPTk+gVwlQ3G
 1Rum80IBG89CoMxCqlIUiV3DV+ifG7erNdrDoSgsmqOt9aoBhKRiRVM+9xnPbfUbuqBCmIJ5tus
 Cz7DbjDU5ANrfwhYv+VgkB6WHGioRJc6unmkzURyvIAwT4Bgh91EmI27c+KIlhKGIXbtJmTBn+/
 BFRlRJ6kEr/xEc055lUbTXVYlwvNP4vCTJHtzeEVGn5wmzVObOlCyZoTiP2PiNs6EOPb5fr7l+C
 awDvyUcgBcJLAN3ON2mcruLkX2FYsFMl1Srh41Ah9ZVtqv9k+ZEFQrZdUC5RK89KL72UpMzwCHx
 z/a2YIAa5xJnw8nJvV2WolMqcvq7rKax6Zkl6gKVvNd10njdmzcqlMXXbnHOiLPpXbwXwyeHL8r
 vGQcW8lHdWpVEj84xpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX1QApxZDb5ZP/
 0OBKJoNL/z+Wh9HT/gYpiw97sWRY5KZ9UdEu61+9jb/vEXptvIp7bdAxRkWCNw3PKYOqMzlYa0w
 SW8i03i25JpS8y4XDweJ5xXFM0Q1/nM=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd1077 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8wNfRxjPmpLGpMwT6toA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300054

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

