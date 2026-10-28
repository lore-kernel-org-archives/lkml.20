Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153128;
	b=LMH5r/nNbSjENM+lxILAkAAI+Y6lQ8njfgL/2lDBI3UaC/PRhab9n5c/jbS8fYuQjTFo
	 crT6zmWtHD/yh3050NOK8mKK5tRVeToxt2QcgCgR//Q1nA5CKAOAmS7HdXXJM1IVHISve
	 W7skki4qGgDySQnDwHCrLPRXQMMDjVogYyptx+s4274mDznouzaXa587yXjAklNZwls2q
	 EOc6tynn0CMMDGgWsFJkLWiUfNo1lfq66x8HXxUIcKtVqPYsquRgDfLY0Iiv42aQG0hIa
	 mEg5X3drri3oQQX4PxuLuPQeLUuvGIy0+Hb2RR0ZHLlHn3+nRbsTBsre8wAQ0s+RuDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sYP+fb3NulPhBnms0DATHYmnVZzGXS+tuZBxDB/IMTA=;
	b=KUHpiEBloAs4n7OTwWP4dpBdoJNL59jwWBme3Oe3sUMUgf3UVx7DAq1NbAxQW9Zm6Xyg
	 KOGpsMrJfeINgeSkaMC9dcQJ5Kf3EmhXesaVLqJwPYzY1tllEMiEMNzyltf+LoTm3hLw2
	 NabW8u5IivL8nXwaUnAFRzYPHrGkAyNQwn0PUAdiWiBNrBmrqCG/w3JDrqc00pJYXXpl0
	 qzbTAwilN0h+sFOY5kg0FyEobqz7ovIfrb7TNPqbBZw3K9sVXlm4gXJXjxb8ijsglvVQe
	 kiKVSsb9c7y9swA1+wXJL/2Lq/wQuy23ekYKRXTskFXjVosSwllGPnj+ujJ1cxGmtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NndPbjCb;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C9606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NndPbjCb
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso3014255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793153126; x=1793757926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYP+fb3NulPhBnms0DATHYmnVZzGXS+tuZBxDB/IMTA=;
        b=NndPbjCb4DRU7DOu+09Fahk8De9o9q7/wvkLvlwrYZ5Ne4qv6P563eklsZHNWX6WgE
         Mh960lGfEGsAgSsggrzoJLHsRzyXkpSNOHunBuIS4w/cYu0NDEwpN/rZbrNxfHWpCZBU
         znBU9Nmby8LUva700DADS9IEFSC44ShKzPjrHBjZa027Ld8lJEXnS575sttppVU5waT4
         2gcY/tbG91EIUsxarAbbB4DlDFVhlm6y2vzsBVkXYJFvHXabe+sc+Vp8n6VQiG8nwljl
         xKSXqa+YDCBV/920ZG0I+uNnoqGfWwk6POZtzU87cOPTh5IWNcA8Pk0flMi9FOhllp+t
         z+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153126; x=1793757926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYP+fb3NulPhBnms0DATHYmnVZzGXS+tuZBxDB/IMTA=;
        b=nNt8X7z4BQm+4FG+Bmwm5KvPF80HChhe6ewgeUf93WTPVqU7VtS7I/VXPet29KM6/q
         kUOU1hZIysSBPDrKyjBdu18dz3oOjqrt/ft9LTjZnxxLCAPDNH9lJIH/vXTpaRbTtFf6
         07s5mifEEFljsxQG8P0Gl7KJvzvAeoSv6CnjDzqIUWskgBhzVh3g4MkDLazMRkcQkxu8
         pI/AOB11J/kHOJtIlIcWYqJ7LnszoGyzCgWgHut5hItT2Gb2jugIhmCQznUuv1X23Sjs
         sw+I7b+OTlW0FezDcNLjAHv3htUZpogfp6W2MzS0I4AKHLjWBJxK13iwDNw95+KikQoT
         NuyA==
X-Forwarded-Encrypted: i=1; AKwUvByylxdUfj2w81PYEllk0ag1RSnvPMi1t7GXGK3oFr+STvsLzxDskaDHV/VNEVmaaCJylKLXnybLgaEoKfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXRCcCKCsH/0OewL1mKcvjSe7r60JZOPPKZSc9FzP90yLvmh9x
	+ARJCCnkQWIv1aykpJH2i4rUlx7x0zfh4VIw/S94AzoXcxl5+zUqQk0XSz7rZiUqycc=
X-Gm-Gg: AYBFou0dWrYiXTxKJ58+unVcuFcseNVyWMAJdqrPe/VggG9llJrRguHa318gBh4JB0C
	7ynS26VIbl1fO1gFkF6CpBEGIEHMSgRmwNOsGrdE2tA3LCMmXWQKkCpUQLnvi7+Eh9jJp8MwLF4
	zoOI8KG7kgevmlSL8TWViJyyzpepCLtDUKJN5jFX1u5YDucifON/KXuHKrQhhFv+5IEkr0oPxBr
	BmtSTUgrA+rB7LFw4Ga5cKz7KP6E8AT6DcgOyqVKIWzKytIGWFGoQbzGziXVdwDN8knn5ZDwRFR
	FnSx7wgN8aKYVq1vcCBjSu9ie9ljOTT5AoqvyRffPULXD7qHdvVgmLeEcn3kGIfUyshr1eIXOzU
	cQRNvn0kSy0SyAnoQBh+vRhPFv7nxtI08hx0VmbK5ehzB1F3GjtTReNmmU3VvLz3vH3d7PG4ysK
	XIM0Rn2IWQCZPTB3Czq+S6dYDTkgJXIA0tzZpEX36ITnMbMKK+fbYm9Ectb39EKXp17RwbKr1pB
	OiXdwjM8bahQYQwEJDYdL4pcL8k31M/WrQRSLKeU4vUofGZ+vDSvxTa4aUwczB2t3lkBYwfRpwc
	EsOAi4ZlxTL2Ye2zZyquULMTPACitvtUMiHRC6gLB+deWKYUHrzziRCBy/X0kDpSEi6wLW3az7i
	9IpKWzucwhHYHYXVRon2vozw=
X-Received: by 2002:a05:600c:4454:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4a9640f38efmr17771835e9.2.1793153126043;
        Tue, 27 Oct 2026 19:05:26 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm10101395e9.12.2026.10.27.19.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:05:23 -0700 (PDT)
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
Subject: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Wed, 28 Oct 2026 02:05:11 +0000
Message-ID: <20261028020512.10245-2-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028020512.10245-1-qyousef@layalina.io>
References: <20261028020512.10245-1-qyousef@layalina.io>
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
 kernel/sched/core.c  |  2 +-
 kernel/sched/idle.c  | 17 +++++++++++++++++
 kernel/sched/sched.h |  3 +++
 3 files changed, 21 insertions(+), 1 deletion(-)

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
index 76f3c84ca6846..c722b23e07dc2 100644
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
+	 */
+	if (uclamp_is_used()) {
+		if (unlikely(!uclamp_rq_is_idle(rq)))
+			init_uclamp_rq(rq);
+	}
 }
 
 struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a25..d87bdbd2121df 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 #ifdef CONFIG_UCLAMP_TASK
 
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
+void init_uclamp_rq(struct rq *rq);
 
 /*
  * When uclamp is compiled in, the aggregation at rq level is 'turned off'
@@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 	return SCHED_CAPACITY_SCALE;
 }
 
+static inline void init_uclamp_rq(struct rq *rq) {}
+
 static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
 
 static inline bool uclamp_is_used(void)
-- 
2.53.0

