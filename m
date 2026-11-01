Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793500372;
	b=hnll0dIf+4WrqEQyjUgZIBZA5ORpDT7cuu4/YzO6I9VUKaiN/zSKKZpgDI7U0qdBOp1h
	 yWQ3V0tC5E5KDH6Fi2A31N/l5pliDCoc1kOP8YVbIKVouuOQgQH7Bb8szZpGqcwmQO/J+
	 M/X6j5RVvA8+1rROc0kSNEUTev21+9B0WC8RzQF2Go+hRZ96JZSWMk5DnY3GFHtir7YfR
	 8h7Y7lbJ21L8Crrzz6A8V9jeqQ2jgWtN7bRvtWUp+ufXGvJSeqR1Hz4zBbBvmYfn8wwm+
	 csffEONw0oU/R8NbPXw6KnzGsvTxT+Wcg85aAh7D1YcEbaiAQrDfKsdH9QnvonvSeLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793500372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RPTdoERrtCUaYsWy3Hw6bLccNB5R8Vd7D03kGhJSZf4=;
	b=V5lSGZSU7jwSXL8cCWM9F8CnTqzlQDWlpdMjbCIje+woPaaD4yiazfAr7ZkIKMTRmM//
	 3UJfDnerWcgBzJV+YFcc4Pt/lbSbYpWuVtjgyOvYYAOpNVBMfrT6HvDjlvlB+5NiaZ5lK
	 ftChdYhzbvBLugrAlkcQ9Q4z3ArjzJWtOYIwNtmavlsEmd4erIbpSgsOZOesgDVMw8Yfq
	 2ejWnfmbIHsv2fGW4E/V1XW2FWgOi4rB7XDfNQIdTkBwxnOe2EjiYYvuKFS+m1v1+13k6
	 KyMUPnQxn5n7aL4FWzAdC+6f1RlgN3dfRDTcsV9FZ8zXSgT9+JMqify8Jef65MXu1jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6vn5UGw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D866606A326;
	Sun,  1 Nov 2026 02:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6vn5UGw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793500372;
	b=IoyahOUQK8m8horfdU8Av0pSCk/LN1WxSwnQoO4BXc1YshWs6Zcp96q4y6PjuWTPYOUz
	 bf8poGVGtGTTiNfFhjlS8PsV++M2fPq7WwM2KvNfhhBDaFHDV3zfAG/RmFRWeMeQMZTsD
	 jggI0xLa7eMla+iu3Qd/S025FOf+/JFj/MFUUPI+ZvHpQgvTte4mx+os8tXVNIQnx5LJF
	 fqDnXIyXCwqeQHD0dojicXQvji5B/PPvc6oE9BPFi5Qsxe8tMvcN2RRM/SOmqX2FREybB
	 20A6TN4qSHAp7J/CSI61GICJSCTE1Q2S/Z8A10H5Tlymado68g/TJAC6LAM8+Zuuwzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793500372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RPTdoERrtCUaYsWy3Hw6bLccNB5R8Vd7D03kGhJSZf4=;
	b=S67n5a/D5Tw3cTgEKoRaF6FSVswc+RXh2JELp/fyKRvyK4DhQ5nIlZjmnEXkf5q4bgV/
	 hc9QwQLVioprfiIzcUAfv9117HnCq6Dmp1OgodLonvGdcJJryE1ESNxFSNbayZaeVcSkZ
	 io25mBGKmS07BsAUhws0LuaABYAKZ88sQa8mKyLpBZmDFXyN+4esZmgvrWUMy2Brmbztu
	 u0k27JEFZEFVAhPRTiDkNkNUG2lR3CJrRDDmRTHaqx0cwDankpZ2JJeEnmHTTz5P9/1hH
	 SYEWpXnOO9/4GsyWveU2yLzO3w+MSAgzUKYjAqY7A9hpyLdIX2odOeRuss/kB2MSYVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 647E01F0093A;
	Sun,  1 Nov 2026 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793500372;
	bh=RPTdoERrtCUaYsWy3Hw6bLccNB5R8Vd7D03kGhJSZf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e6vn5UGwND2NB7k6wlboecyaAZ0fT9p6Zi6Ar2KA7n9vPlrX+og1if1sxOJVxoblQ
	 zzTkGeyMjf3liNrzocjzitRGWW65KeP64SyaczbIujp+5dwrEsmvWvWe+VM0ZUEKEj
	 GbH7moRaD0K5VSO28E7Hxv3C2ND9Tf1aDoo7eAItofKhR0q9Pq6ZAvNCzz1uLaLlJ9
	 xPata8fkAAB2OKAWxnH78r5q4RmQOHEty3rtkuK7THdeM1Zh86Bh04hL1YwB6Iy71d
	 0UH8n8Tcs6+7pwDEkJAvD34NWg2s/nBVYjAiJ1Cow2IDY4rnEkYJE9Xo3VL3pKo70j
	 5iKE3MG2TO9oQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E5DEC4605F;
	Sun,  1 Nov 2026 02:32:50 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Sat, 31 Oct 2026 23:32:51 -0300
Subject: [PATCH 2/2] drm/msm/a5xx: Record per-submission GPU time and
 cycles
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
Message-Id: <20261031-a5xx-submit-stats-v1-2-16a67ac96edd@gmail.com>
References: <20261031-a5xx-submit-stats-v1-0-16a67ac96edd@gmail.com>
In-Reply-To: <20261031-a5xx-submit-stats-v1-0-16a67ac96edd@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793500370; l=2787;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=UZvYI2+JsvZ0udAefkfHBN4v1q+DPk+DHVfHhpLHJgo=;
 b=ZIg3OCm2GyExJMw7ykZd/y8UhQcHErpLRr8LQciymK8R+oOuwPyU4ZIvcZyWy6sFSf/s0bCxK
 WMgV6bvSMhSB/GNc8YrDZvVLRB5pobZwo+4rAgHKpaeLhZJ8ixYgzSw
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

The GPU time and cycles msm records for each submission, reported in
the msm_gpu_submit_retired trace event and added to fdinfo's
drm-engine-gpu and drm-cycles-gpu, come from counters the CP copies to
memory around each submission. a6xx_submit() emits those copies;
a5xx_submit() does not, so on A5xx all of them read zero.

Copy the CP cycle counter and the always-on counter before and after
the submission's IBs, as a6xx does.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
The counters are copied outside the IBs, so a preemption inside a
submission, at a yield point in its IBs, would count the other ring's
time in it. Switches between submissions were tested.
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 16c7335c4b1f..7d4a9db0a3de 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -124,8 +124,20 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	msm_gpu_retire(gpu);
 }
 
+static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
+			      u64 iova)
+{
+	OUT_PKT7(ring, CP_REG_TO_MEM, 3);
+	OUT_RING(ring, CP_REG_TO_MEM_0_REG(counter) |
+		CP_REG_TO_MEM_0_CNT(2) |
+		CP_REG_TO_MEM_0_IS_64B);
+	OUT_RING(ring, lower_32_bits(iova));
+	OUT_RING(ring, upper_32_bits(iova));
+}
+
 static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
+	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
@@ -167,6 +179,11 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
 	OUT_RING(ring, 0x02);
 
+	get_stats_counter(ring, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
+			  rbmemptr_stats(ring, index, cpcycles_start));
+	get_stats_counter(ring, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
+			  rbmemptr_stats(ring, index, alwayson_start));
+
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
 		switch (submit->cmd[i].type) {
@@ -208,6 +225,11 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, 0);
 	OUT_RING(ring, 0);
 
+	get_stats_counter(ring, REG_A5XX_RBBM_PERFCTR_CP_0_LO,
+			  rbmemptr_stats(ring, index, cpcycles_end));
+	get_stats_counter(ring, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
+			  rbmemptr_stats(ring, index, alwayson_end));
+
 	/* Turn off IB level preemptions */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
 	OUT_RING(ring, 0x01);

-- 
2.56.0


