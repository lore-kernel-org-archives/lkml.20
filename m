Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945583;
	b=om4bUo27H9H744zVTyLWs17BKyIxs6LsaRphva224fX/+qiYbnD4C6gdEPq5oH7K+t/f
	 r5XvtLUAmyqQqiUaamtkEsIXkJNNlv718Wjy0QbGnQ/P3GgN/yr83TNk2MamIvzeNiQyk
	 Xs2uAHLr+rTVmQDYkXrrq2MlA8Du+/t3/bOc4bOqiNmH7eEawYSZd4NmJYZude5ZsX1PZ
	 6y5O0Z/vIg1uAhN09S+OFjBUSk7ugnNY4bb0HX4jlqRiYzCmLKDwnnyFiUgk4LKmLpnpl
	 0leZtabRs/ycbk+odIIr+0MUPJu7r9QQZGrA4ccSHzyTkiNt5rLm0+FFlh6kDcSdQGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HzLaESHy38sPGd1D1uaWnB2JgjNj6rDjwn6R5mpsew0=;
	b=WT8JVqmmtpruKN1flWTKN+iUavFXlNgNh7Tv/aJ26nNstWzePcYYq4t7Mcsrimn6tw8n
	 +ooIizIcWXM6NMur6g0COreJ0UI905NNBksGaG48HK+l+W1oxTSMUo+yIor9GFICj7BfO
	 eX+IhRQUWWvxOLwejQ8GGVC0GcoBIX+9gI013WFQLYXBNZr60Yr3pl4DJ0dXK/naP594L
	 oEm2KY9nLA1rT/eGKy+mKbUR3+zNxeIYsPVYI1oDzcNXp85YBsRtPWgmNJKDFuDfxpO0J
	 qYjgkAjpReK+r8euCeoLntNY6Zzh6BSi9iAi17zYJj607iWmbasgT48Q334zWMaYuYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TM2nY2xD;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B263606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B263606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TM2nY2xD
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23221005e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1792945581; x=1793550381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzLaESHy38sPGd1D1uaWnB2JgjNj6rDjwn6R5mpsew0=;
        b=TM2nY2xD8P3pmh/DQiKUn1LVo6qZqcKsmpFWnwbJjZMoevo4F3fL6g/Akarh61NOxv
         Ms/gvxRxtgl73vSrD14h7XlJa3Qp67O5h1nOa6a41qQTr7qarZkUzELQjWP8FXTmZNol
         rNqEhCrHEKvXhfNcn7qtjpcumYgCjhnk4TGiv71ed4uW37OUpbHi+V5B6WTxPlnVXAwo
         LAvyyzJCijbrnUkyDMqLhwmbz9oA1htrCwiufcV0IBp0ECzFjvSD+GWKyaWpaKBdJB+j
         +A0RaUBYosQtLwbn9hsfVDXMm/Qyg5mpiDOFKOEYDsXyu72vw0PB4INxnO/LHgTLk2d1
         MPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945581; x=1793550381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzLaESHy38sPGd1D1uaWnB2JgjNj6rDjwn6R5mpsew0=;
        b=Vbfb4rdrwwBj5zYQlpfBrRVxtto4q4Ar1jDYJwSpgrlzQq9lSqvAsP2ZIBe2aY9W0N
         UBkTUgi5elYzvTo0VGtQkJd3fYTvBEi/WV35yuiQYRFBl9+2TvjUbfFNyEu2mbrARqSq
         wAZiFRnYHvLczOt6PHsU7NboU92pmosds3alXbCHM9b8r1aqm+VEzCnOoA9KMdSPQat3
         x3B597v9CYRHNw4NWpjJesxKEBGmIiFnYnVJuF6GKAZeV3YL2qHqJmWjVJXK38Tq//Fc
         LUfuJNg9eTIELDaOzJi/luTRsbQfcRgvxyaSF3Vliono3P/TozFFRObvijBM4h5Qsqk3
         ObcA==
X-Forwarded-Encrypted: i=1; AKwUvBy6B/DGr8dcdwLTap9SUVTY9A8FXfQmHJ4lg5tyZuq1A4VPAfpNTFqUZzadRWNQh0eJBLVuL52h1Qib0Tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKscDgMULZ3MdswxYheDNcz1/aankI/18RAVEzs37Uv3Pn739N3
	doUoXTBsIq9NXN5Yzw1WrIxoxt58qsIhdqccn9tKnzfP+ux4y1BW9q8DgC3JoZj7HpI=
X-Gm-Gg: AYBFou1ZITr/68a+RJ0pTA4HvbPk4DEJGHVoS9+SodFNIaWpd5w+qQtju7w+RH/WtSV
	/LfgOrsU5Lc680rlUxlwKYR0xw7Y+lKJR/VcPMW4lkCR7BmJFuA/b0j/EV/V6NvI2GbkPinozzX
	0qmKutDsaDYR6yoRsGohvKlnYgJz+FnZWcJfZCgXJ5fdScVni3WCasNBxAffWHQd/LuA8giWISM
	h4Lz6psDYRGOIr+hI9DPQkl8aOOI1z2JeJ6Vrs2SfcP94sgcwM75Qfwa07iNNPM9UTLJOof9zud
	u5ODDmpDnub9wyVH/37okmHC5n1PgM1Ln9Qu4v8MfzEqYFjDPx+z1V9DAASbpzWcQ9xA30OnicV
	rp/28WuQtRXIfL5JaMQjtoRRAlSdm3B55JnqX0ToUFic810JEJKbRXkjmpRoInb4jk6CgBEZelu
	sZwv5gVDEfBOyANslieU0es+Q0lA0tIYjlyxDNHfGxlsB2PRB4sVDHWlX1CctHa9wUPdy4E7SNc
	wxBVKH+ES81EWyRYt8kiYHvKxCej9OZnp+Z4+jwzCjcLhzeOagLxrQe7XejCnhxL4dZci5gOiTi
	kze7kicvPSBZq+j8xfCrsEX+pG/gC4IemajAoxWRCWN48W8Yqg==
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr56911075e9.9.1792945580679;
        Sun, 25 Oct 2026 09:26:20 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm103814465e9.1.2026.10.25.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:26:19 -0700 (PDT)
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
Subject: [PATCH v2] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Sun, 25 Oct 2026 16:26:12 +0000
Message-ID: <20261025162612.360033-1-qyousef@layalina.io>
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

Plugging the race is hard as discussed in [1]. Take it for granted and
do correction actions on going to idle to guarantee this state is
transient for a short period after uclamp_sched_used is enabled.

[1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/

Reported-by: Wei Wang <wvw@google.com>
Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---

Changes since v1:
	- Fix kernel test robot report due to missing static inline in dummy
	  definition of init_uclamp_rq()

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
index 7d2ec527b8a25..47dcfd74e150f 100644
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
 
+static inline void init_uclamp_rq(struct rq *rq) {}
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

