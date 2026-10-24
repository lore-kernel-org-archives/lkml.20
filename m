Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792885191;
	b=L37spwS0xj7Fq8nFZn2lmKYHczf+NjSHjLjUENbJ3/ssLWGWLWjo9nKjiQ8Jd/hXLdBu
	 hA7efa03MczVp1DZrwNUgveHFis8AmQCQ9j3uADYdHAtnf+lL1WfhWCQ44LxOE5PU2nBz
	 wLiyNBX+rJaUMxX2Hz2I8oKufl59WO77OcRi4Xlv6zCwyDCXLHGHURgVzpjf17bTFhcjD
	 kqde9ue0G2wTS+NOddE9mDtWkkcJXSo/TKIS0mAfJnG4g3psaTgVUHYI/2s9RMIiE1C+S
	 nPyEz4GisYFAlNGSbGG+M2bgWiqqOk5X+hMsUefKVAJIlDEJP836J0Az0aEgUjmiNlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792885191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VVP8hPYtMjXurYxxgqcEh2Yszhjx9R7XqeUKJVNl3nE=;
	b=4oxUVZpi4TTsDXbOie4g8JKIDl54hM1+o5pQuUVepzKKXyc7jLUFpig19GZS//2khyYQ
	 iuP3eYlAP/IerJX+dL50HyrrSLPDS8iEA38BP34n7Bhbhy+TO8Uo30mBeycX7HmSXRaJU
	 7i6EJjvUCfc8Am2/OVDpO/PceVkHwDdw4hVRcv/IMW1EPpfJ8SPXBJ+KzpLIG6w/tf9A7
	 O4NiYhAn2k2DN1CkztcTRrwOlbTyD6ZsE3bOnyRHZqw/mhrONSV3FXS6U1Ot8a7QXaHvW
	 e6qk6T9cLJtnTQs/bS52wKWbK03w8sF5XO0+0pZVttWtLKBZs48q7pRuo9WzXZnPHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FbuagCkj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FbuagCkj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19587325e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1792885189; x=1793489989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVP8hPYtMjXurYxxgqcEh2Yszhjx9R7XqeUKJVNl3nE=;
        b=FbuagCkjcFn9bUlc6Gje5f0QE28w0xIXuR19zturSigan9L1wjk037BeoosB3LzQ3O
         x24F5RbFamiXEoCGCcZlZGImNeAJkwt+S1M8WButkzJW2hQjoOHOe5unj7rQSgnS0GBM
         ZZjwp0Akd5fsNj6vSmBNSr+4JzH90SKRaJ/4wTCVyJFJTHy/sdF4BiZ7R881fkr7zfkw
         s6nJddSaUMJKaQM0+PhMzjB9LNUx5IDZlQY5O0H/3Z44fxnqTeQ2Potct5M4tDxd6yRQ
         xElZ3V3odINY69FNdyJgxHOvgPj5/2ZWCyKbuowyCBlBEZJTAro4z0FJVHZzmQnjHsRv
         W9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792885189; x=1793489989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVP8hPYtMjXurYxxgqcEh2Yszhjx9R7XqeUKJVNl3nE=;
        b=ElWlEa6mul620gX2sgHPs7mwd8U7AlleE5bUJkvbZxNO3k0qsGV3VPq50TgAXFxgLH
         yT3KwjxG6IXEqIY5CDSZoq3W8NtXp9LDDnPZd+QBfhLolU9u3fiD5tSx6nqh8ycqtr9A
         rrdeT+nTqgAslRrtOSJyQEOmSSouQDYaAS6eIvOsTflbi4ToRL4TQ6kHDqUXPpjAfsvL
         OUGYCzf9ujGh9AB8U5qnTXpr1y5bThC+nK4EtBZCHF+yHJufKc0y08Fh9sYh9+pK+JOV
         S7wCZAbKl8d4iiqgo2CLT03N2oVMMy2ZL3gVE26ifXEczKjj1nDwfdNcN6qYNCHCyapW
         i18A==
X-Forwarded-Encrypted: i=1; AKwUvByWj6ffilFxGkdbRrOvETy/VBsIbAeYU1IdCrecbn/Splako6ZFLyXc9HOCLfjlRldTqyswNdorwDG6nXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQUZxFzNy0vuIrWzZrgRqIlkQjjvtOEU2f8BKMS5zCdD6z7nJM
	1UGbNE1M6rjlsDr/wtsHKIfimAEzcTy4Hmd8Jb+W06zo4q8gPNUjOW37Ochpa/YzEK8=
X-Gm-Gg: AYBFou2+A+gPtaQ4wH85R0HVrQBqQUBgvCuDhXWLYwDsGU8mPdtqC5devDvVUZfiGre
	ybJ3ZsCoiGSl6lgjl64TaODLrFbZGd6Zpb6DH78n8u6U14M/lKzRQO3VS5Pl2obNxnvJioh1Lz4
	3f9JztgU9jWKIJi+UthuWcGP/T+SMR7ZA3issQu/ZULXfDHeLDN3jkqMbG17SSnBe8TR94vtDAp
	fwsD4uQ6sEymhx7K0NZuYeNUwNltsuIf7dxfieffR3zhXPoyqvNbtI8mDYvHzhXQFewq1LPm658
	MyY6dv6ORWrZvPb6Bt+UKI0JgRjd2e+RdMgDpLVLemj2Eemp+hOoTaV2v3gA7WKp2+m6wBsn+i1
	96NlQaM6CIUd1dNFhH+7KsR2/dqjK7gjUQW0dzdXBiefjkPhj7gRtcMMcDqLSqmA6cmsIk1P5Xz
	wuOQf41m1s+rPJidBHbSVJarAgz3YjqxFRtl79MQNVRRT6YqM3CECPMy6X8saMyzv5Ki9Oyb7zo
	QX6Fyg1CS2JIz/1I31Yh5AWQiktB7jwZ6c069X2w0kmiqKGQU07PBuM3P2ExzKNsSw2U08NH9DZ
	DVySIhTQmxMS9ks6gCZYsDWgyAII
X-Received: by 2002:a05:600c:4f84:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a575d2c6c7mr499675e9.22.1792885188446;
        Sat, 24 Oct 2026 16:39:48 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm104282825e9.1.2026.10.24.16.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:39:47 -0700 (PDT)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>,
	Wei Wang <wvw@google.com>
Subject: [PATCH] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Sun, 25 Oct 2026 00:39:45 +0100
Message-ID: <20261024233945.74794-1-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
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

Static keys are not guaranteed to be enabled atomically across CPUs.
Which means when sched_uclamp_used is enabled, some CPUs will return
true for uclamp_is_used() while others won't, leading to asymmetric
ulcamp_rq_{inc, dec}_id. If we decrement without increment this is safe
as documented in the code. But an increment without a decrement is
a problem and will leave the uclamp_rq in a corrupt state.

The race for increment without a decrement is interesting as it means
a CPU has seen the static key flipped and incremented while enqueueing
a task, but the task was dequeued on another CPU that hasn't seen the
static key flipped - we need to be wary this might be a symptom of
something else going wrong.

Plugging the race is hard as discussed in [1]. Take it for granted and do
correction actions on going to idle to guarantee this state is transient
for a short period after uclamp_sched_used is enabled.

[1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/

Reported-by: Wei Wang <wvw@google.com>
Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---

Tested with the patch below to force imbalance via sched_feat. I could see the
warning appearing and frequencies spiking during imbalance. Correct behavior is
restored when sched_feat is disabled where the idle entry reset fixes things
up.

I had a mix of uclamp_max mainly used in the system via schedqosd.

	diff --git a/kernel/sched/core.c b/kernel/sched/core.c
	index c6780358a7975..d3e73ba88f22b 100644
	--- a/kernel/sched/core.c
	+++ b/kernel/sched/core.c
	@@ -1889,6 +1889,11 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
		for_each_clamp_id(clamp_id)
			uclamp_rq_inc_id(rq, p, clamp_id);
	 
	+       if (sched_feat(UCLAMP_IMBALANCED)) {
	+               for_each_clamp_id(clamp_id)
	+                       uclamp_rq_inc_id(rq, p, clamp_id);
	+       }
	+
		/* Reset clamp idle holding when there is one RUNNABLE task */
		if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
			rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
	diff --git a/kernel/sched/features.h b/kernel/sched/features.h
	index 8f0dee8fc4755..b59e532500fd9 100644
	--- a/kernel/sched/features.h
	+++ b/kernel/sched/features.h
	@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
	  */
	 SCHED_FEAT(NI_RANDOM, true)
	 SCHED_FEAT(NI_RATE, true)
	+
	+SCHED_FEAT(UCLAMP_IMBALANCED, false)
	diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
	index 950e2885bba63..cb31b3c9df23c 100644
	--- a/kernel/sched/idle.c
	+++ b/kernel/sched/idle.c
	@@ -516,7 +516,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
		 * everything should work as expected.
		*/
		if (uclamp_is_used()) {
	-               if (unlikely(uclamp_is_imbalanced(rq)))
	+               if (unlikely(WARN_ON(uclamp_is_imbalanced(rq))))
				init_uclamp_rq(rq);
		}
	 }


 kernel/sched/core.c  |  2 +-
 kernel/sched/idle.c  | 17 +++++++++++++++++
 kernel/sched/sched.h | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158dea..c6780358a7975 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
 	uclamp_update_util_min_rt_default(p);
 }
 
-static void __init init_uclamp_rq(struct rq *rq)
+void init_uclamp_rq(struct rq *rq)
 {
 	enum uclamp_id clamp_id;
 	struct uclamp_rq *uc_rq = rq->uclamp;
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 76f3c84ca6846..950e2885bba63 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
 	 * lost_idle_time of clock_pelt
 	 */
 	update_idle_rq_clock_pelt(rq);
+
+	/*
+	 * Due to a race condition when enabling sched_uclamp_used static key,
+	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
+	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
+	 * the static key flipped. The race condition is unlikely, but ensure
+	 * the uclamp_rq() state is set properly on each entry to idle.
+	 *
+	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
+	 * lost. Since we are imbalanced, hard to know what is right. So just
+	 * cleanup. This should be a transient error state once we recover
+	 * everything should work as expected.
+	*/
+	if (uclamp_is_used()) {
+		if (unlikely(uclamp_is_imbalanced(rq)))
+			init_uclamp_rq(rq);
+	}
 }
 
 struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a25..232ed37227ee4 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 #ifdef CONFIG_UCLAMP_TASK
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
+void init_uclamp_rq(struct rq *rq);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3783,6 +3784,33 @@ static inline unsigned int uclamp_bucket_id(unsigned int clamp_value)
 	return min_t(unsigned int, clamp_value / UCLAMP_BUCKET_DELTA, UCLAMP_BUCKETS - 1);
 }
 
+static inline bool __uclamp_is_imbalanced(struct rq *rq, enum uclamp_id clamp_id)
+{
+	struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
+	int bucket_id = UCLAMP_BUCKETS - 1;
+
+	/*
+	 * On idle all bucket.tasks must be 0, or we have hit imbalance
+	 * problem.
+	 */
+	for ( ; bucket_id >= 0; bucket_id--)
+		if (bucket[bucket_id].tasks)
+			return true;
+
+	return false;
+}
+
+static inline bool uclamp_is_imbalanced(struct rq *rq)
+{
+	enum uclamp_id clamp_id;
+
+	for_each_clamp_id(clamp_id)
+		if(__uclamp_is_imbalanced(rq, clamp_id))
+			return true;
+
+	return false;
+}
+
 static inline void
 uclamp_se_set(struct uclamp_se *uc_se, unsigned int value, bool user_defined)
 {
@@ -3802,6 +3830,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 	return SCHED_CAPACITY_SCALE;
 }
 
+void init_uclamp_rq(struct rq *rq) {}
+
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
 static inline bool uclamp_is_used(void)
@@ -3830,6 +3860,11 @@ static inline bool uclamp_rq_is_idle(struct rq *rq)
 	return false;
 }
 
+static inline bool uclamp_is_imbalanced(struct rq *rq)
+{
+	return false;
+}
+
 #endif /* !CONFIG_UCLAMP_TASK */
 
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
-- 
2.53.0

