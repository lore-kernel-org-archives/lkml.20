Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560579;
	b=MFZdjsTZgf3nX5HXAR1DLRgPHcxI7mNYITE5hcg426YIa8PgwhdsZKzRGpMgYwNBKlUu
	 ChmqSLTHdKyCjSTwlV8m7VNHm3WXn1Igo6FTQGpKmZfSQwkhSbnEoUYTWcWSZNrwKPRdz
	 uWwTvfdpiVQ32ki5Ddy/hTXd+DIMOii3Zoyb3Ta0CVbLIGhqEQqPA8jtWeZ6mrvMG3l/J
	 fcUCabIXesbq7mk1LPVLDP0F45JOT5tTei89OhM/dorfCfL8EvLbtwrxHmwzbRZt6BTgD
	 1M57Ts+qHi2Uxc5Juk0+D/5QGRnsuQKLfsOmW6narDc6uoGuPY8xg5mq0+TyTLcykpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560579;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kaBI3oDmG0U7duODVUMc6x3njVfi8ktjKAg2vHEM1AE=;
	b=KMUV5sYL0a9jRyTCDzS9S86bVGoDGqTPlEDAS+Qc2lQlANT3AR4/BR0zrwlwhHZ9gapJ
	 B0pgLASJCV9YM3TABlegEolTDVRZDNXYQGXh+wv1as+9mAh2+LDaDXimIsjeutxPZjMoO
	 frCoYR8g4jCVD7wze/XIpkfu+rQl0EBDiPtj/nzBHg+PQYNjzytnYo1+U4BeU/gSRt14t
	 2Amc2IVVDfksjnxOSYPlTon3DfuEza2okKXc95IDA0iJrvlU4aBAsMcQ+5tFKcUm7Lge1
	 17MAOMnTYAtx2AOn0QGzlSu8+eZGOHxq2UHmZwtc+Fk1B3gL/F0hNLWPG0X5gvBy0wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWJhXmOz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAEB60A3827
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWJhXmOz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794560578;
	b=YSP/AFKMgHSbbAQlhLfz3XJfe78b7EOUkV/KllDpJmFYhBLkhg0v1XFPpDltGeoe4Xzs
	 9v0VbVg3dNOQeUvoKPYzMkVS7f12XFYjWvNl6vC90iAUPltI2P/8mQF7ufUK1kKTf40Lo
	 +beNyD1ZZz/cKYPIrfT3fBbWoq2M58yNhZxggizslFgQ/byYORz0o9U009eAheO0Q7Ykl
	 eyghKaguwe2guORneY7P5jcpxLboDgqrFSz9LalN2yA0dWyhMsDdXUSjlv3O84ivJu+XP
	 AGQacNQoS3oc8UJsqIXPrSGyYPja8bsKHdldTJ+rE/ELaB77hymNR/JZINsFrgEs+2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794560578;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kaBI3oDmG0U7duODVUMc6x3njVfi8ktjKAg2vHEM1AE=;
	b=NacY13mdJkD4O4vtEiMYiQmASxSAwtkcmx3d1GD/OUC7rhZHxUiFrrskjMaaRuQ6Pn5k
	 f47uUPwnlck71E5/kxcEi1VQQvMa+F5xx6Hv8KaC6E8lsLcWoPogcGOwm68RC7/oj12/j
	 n2MvJcbLUjCFqEUnngpdAAbzeBNfH13i5xsfrhR+FC0mypGdYqBRH4R5yncl5xW86elyn
	 HTpPNVoykyab03BuyoQFxqHK7Bk0Aj7IiS4uFuZrnYTdNarKtcHdj+WOMXWMi23cesEsS
	 FcdMeOY2xcwJdKpWN4xWZGZtsOiFRA3oQxBPXRiMaJ7p1Ct1MahGj1nfMsW4OvRZjyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E8761F000C5;
	Fri, 13 Nov 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560578;
	bh=kaBI3oDmG0U7duODVUMc6x3njVfi8ktjKAg2vHEM1AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SWJhXmOz2aIM494x0wOTHJ9TbzGnawVFz0dasCtDTEj97u1hw8XcKQJNwfA+tb6R+
	 06wAI4nYA1nLciI5wXEfspgfqCGldFv6CpgC6qreiDJd4h/bgAFo0GDCUUSx4/NSO7
	 gHrjIg2AUFVsd96Vod8gfvhyXcNupriu9CHBTAFUNhvp8brWclk48ch3VrZmVEWqmA
	 MfA9/XEiJ5UvuR+ZbL7a94bbZ9k5G9A+mkQrzQRo4KGCpbklZznGzVYqG4Pqd6GpPu
	 3DNcE1zM7dqISUHg7/IkbvKQi5GGW83THZhW9KXo4XRD4ek1i2UZr8sXbdyieJZdjn
	 1SETa75jblcVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F451476FA;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 09:03:02 +0000
Subject: [PATCH v3 10/14] drm/panfrost: Drop the cycle counter only for a
 job that holds it
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
Message-Id: <20261113-panfrost-long-jobs-v3-10-80ae78d38f6e@gmail.com>
References: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
In-Reply-To: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560572; l=3739;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=K4my8lr5ikGRu+Hfa7S/zTxL9cDYzAOG1ImzoduNMoE=;
 b=RknwTh4RMHguPcYmyD88FKi2AXukozuosAJO10LprQhctj4tmgoTJr812l1SFDFt1DjfFdG8n
 fBiyXP5bS3KBKe81u0PIvLQ1BKgzEWZqxg9A1jLmTZlF1q9StKJN5Zw
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_job_hw_submit() puts a job in pfdev->jobs[] but, while a reset
is pending, does not start it and takes no cycle counter reference.
panfrost_reset() drops one for every job in pfdev->jobs[] that wants the
counter, so use_count goes below zero. The same happens for a job that
was stopped (reference dropped at dequeue) and resubmitted while a reset
was pending: is_profiled is still set from its first run.

Today the GPU reset that follows WARNs in panfrost_gpu_soft_reset() and
sets use_count back to 0. Without a reset ("Soft-stop and resume a job
that outlives the timeout") the count stays wrong and
panfrost_cycle_counter_get() no longer starts the counter.

Record in the job whether it holds a reference, and drop it only then.

Found by code review (Sashiko). Not reproduced.

Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210891@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 19 +++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_job.h |  2 ++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 897743cb8..df7fcc436 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -160,6 +160,14 @@ panfrost_get_job_chain_flag(const struct panfrost_job *job)
 	return (f->seqno & 1) ? JS_CONFIG_JOB_CHAIN_FLAG : 0;
 }
 
+static void panfrost_job_put_cycle_counter(struct panfrost_job *job)
+{
+	if (job->cycle_counter_ref) {
+		panfrost_cycle_counter_put(job->pfdev);
+		job->cycle_counter_ref = false;
+	}
+}
+
 static struct panfrost_job *
 panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 {
@@ -174,8 +182,7 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 			panfrost_cycle_counter_read(pfdev) - job->start_cycles;
 	}
 
-	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT || job->is_profiled)
-		panfrost_cycle_counter_put(pfdev);
+	panfrost_job_put_cycle_counter(job);
 
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
@@ -259,8 +266,10 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		job->is_profiled = pfdev->profile_mode;
 
 		if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
-		    job->is_profiled)
+		    job->is_profiled) {
 			panfrost_cycle_counter_get(pfdev);
+			job->cycle_counter_ref = true;
+		}
 
 		if (job->is_profiled) {
 			job->start_time = ktime_get();
@@ -740,9 +749,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 			pfdev->jobs[i][pfdev->jobs[i][0] ? 1 : 0] = evicted[i];
 
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
-			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
-			    pfdev->jobs[i][j]->is_profiled)
-				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
+			panfrost_job_put_cycle_counter(pfdev->jobs[i][j]);
 			pm_runtime_put_noidle(pfdev->base.dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 3e3b97178..cd82d7930 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -36,6 +36,8 @@ struct panfrost_job {
 
 	struct panfrost_engine_usage *engine_usage;
 	bool is_profiled;
+	/* Holds a reference on the cycle counter */
+	bool cycle_counter_ref;
 	ktime_t start_time;
 	u64 start_cycles;
 };

-- 
2.55.0


