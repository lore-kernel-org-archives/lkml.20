Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667605;
	b=y9y8wQJl4EDXjXxmpreFP2fCYwRGBw4LBelfYdiRb2+krhAXS+U1KLaNBCKJPTT90hWP
	 p7IZYCypxDhsz9IOrFdyBkUPU1MGPHglkgL9mZ7pfgNgKiEVrq0tANBM0g3P1x2JwKeAo
	 ar6kV6p2M4+hd2FQAoxmhWG87OwLbA2xuYIlbYXk9pTQpaj9GoT+kncZ/T3ErjwSWxwwo
	 +xCSBkFj2PE9rZX+uBSFx9eNcpELRfFvCtNFSuR18n+1yArEiUsXkue76lheblcc/MTX0
	 fYEf9Zwy7o75xNtGUhxESzSZrEgis7gIAoN60/3raYxiiANmI+F/w5hoN8br99xiH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
	b=OWMkoI4/2Gq8/Ddear3dXdsYGRQsctvn6unK07Pm1O0yOi9hnaENS2jAhjuXzOwDV50W
	 98CLofXV6zp437gcKrxaHRHjotJcweTsHCzgaNoeWH1U/wX7+RDl/Zd47cL8Ki5sg18xS
	 +1skf+vMeS09pPUyj3XRudWjPse1pcdzXfdTVOPdpwc+KeqRvXZ3BFPZfbCFTFBGqn0sn
	 97JaHGb3KGPJf/m+YeFJc62s5i6QbY1FFMCoe8v9tKV4s1UmiWdH60fUbFGwrOSB8ePJy
	 mC4IS9GvJK3vF2rVqmk/jQZb8birMek3SMH3dgZDAoCDEfVIdvmDvFjbgoCy8V1bu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bk11H2CX;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62123606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62123606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bk11H2CX
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1808537f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793667604; x=1794272404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
        b=bk11H2CX9mBBY6Awku8pUpA6SMnyFQZLqdbQUCqAv69TRprvaqBIovgGCQwINURy7A
         78ETHHCu1yHLTnyMcLf5CkX5pZyGa2YxAAV+KTDjUOkcrLHeR0prVzUVnCOtnA88SS30
         LMxYxEbIjK6OYMQfC1dTms1EOTvwNnYQUYTHeM41wFPphbM7tjGN1o5UsOUHlEUA5quI
         A9t+9IkdKJFo6Jxm+0Z57cemeLiqvmmwjvzW0tSlXzd22bN0ZQxGjmfMgNBgy9nMSFjK
         vA2x+5PUhWKPGlZFoVzQ9c6XswyPIGrQT4zLcEbYoYD3xBTZKnhkjVt21n6tw98c45hx
         fwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667604; x=1794272404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
        b=kB9ey+FGel9VxsjRUO7vVECc6HUCn4NmjzxPR69Y5c+6GP5oJ3AejoVkofSomvDvlB
         zWG/D00GWRlD3VOLedh5LY2/oCbiJysa7Awsf7H0DMXJECFicjPuZDW1DzSGC0HtOKe9
         nN2WRixm4Shw2OXbTVXeew6UxnbPMqEsO1zYQn/MLfw73cS46yE5xEQRc9WD3X8J6Iqm
         sOpWMJFceELvaYovRwHMm+HPEt7UUoFBo3AWJpAOPIuuylGiqihhy3iUWxGR0tXcIsnj
         z3G7qAYaO5fLEcO4MKsrRo2WfYg3ZhRvB6MdXmCbdx09IUZ3wY7E/nBMtQ4Fs3QOz2jA
         NI+g==
X-Forwarded-Encrypted: i=1; AKwUvBxgpuSINSR+tHuVikz59zQyVIjpt3YiYrUKTP8anjE67UTHhHDNuqXXuBvyaeNBVCK0xg979EqQL2Mtij4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M3UA8/b6MbnSagmcK9Pg/rSOWSLCYG6c8b5KIPowfbZIcX8mM
	voSJN42qyYO/4GbT5Hvs1Dr/D7D67SXt3wd4Sjw3ZSpGxNgdYm5ZM1SDcf6J5z3rriE=
X-Gm-Gg: AYBFou0+N5KhSqakd39ON7AKpm2k4jDZ6BXTvGS4KtZMezfnXXd8IgqIHK8r0oTLvbf
	/IwYihfdy/N4l3+Kl5xwose59sX1cRUFs7awkH8F8Ind6psSYdLu/6Q6uqeplxAm2GpoDH/C+JK
	saARbx3A3VWf/xJh1z7gSw/AKEltCPg8Ar+XK6m4y8ciC7ciZw4Vg18+k5DI5tsi01ayLnbt3dY
	2snfoe8ItKLmkgCXbkGONlIjTgm3RvvVjiYS6BkiTLkdR1kir5Yy+E9pK+wB+ZR008dBAISY4iw
	hkxoC4i3oO+ghH4VYMUw9EJKNyrx4+1E80B4p2xM1D58S73T9B/D3NcQ8F+2RV0rWkVN9El0DJ+
	SogfZGr058aE5di4lslVl40mDSpiRwkdr0//upQTgk6KQERifmCaVHCDxoIRq9pgUvfJCBMF8xP
	JpMchl1kh/PovGAarLostu9ignUhIpxHo4nKlNtudnx87vyMcOtGltDSNVWGOmpAQEAc8MnSRfS
	JsIvkG1aCqJidCQxpM1qmFNhnJFXLQoiBhAk1mV1Jaaru/waUFs7PK8UD990H1h0J0pdvnlsTeV
	wAzUpO7dcCAoKwEa956u3v3We0g6XkrhL6nfyrVe9PQHBJHcLaUC4pddP15UG77g0rDsBhclFAx
	+aw==
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr27755980f8f.31.1793667603664;
        Mon, 02 Nov 2026 17:00:03 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm22351872f8f.49.2026.11.02.17.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:00:02 -0800 (PST)
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
Subject: [PATCH v5 1/4] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Tue,  3 Nov 2026 00:59:50 +0000
Message-ID: <20261103005953.56271-2-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103005953.56271-1-qyousef@layalina.io>
References: <20261103005953.56271-1-qyousef@layalina.io>
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

Static keys are not guaranteed to be enabled atomically across CPUs.  Or
across callsites on the same CPUs. Which means when sched_uclamp_used is
enabled, some CPUs/callsites will return true for uclamp_is_used() while
others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
decrement without increment this is safe as documented in the code. But
an increment without a decrement is a problem and will leave the
uclamp_rq in a corrupt state.

The reported case seems to happen due to callsites on the same CPU not
seeing the flipped state.

Plugging the race is hard as discussed in [1]. Take it for granted and
do correction actions on going to idle to guarantee this state is
transient for a short period after uclamp_sched_used is enabled.

[1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/

Reported-by: Wei Wang <wvw@google.com>
Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  |  2 +-
 kernel/sched/idle.c  | 19 +++++++++++++++++++
 kernel/sched/sched.h |  3 +++
 3 files changed, 23 insertions(+), 1 deletion(-)

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
index 76f3c84ca6846..84301fc49e699 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
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
+	 *
+	 * We need to be careful of some paths that can force idle with tasks
+	 * are still queued.
+	 */
+	if (uclamp_is_used() &&
+	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
+		init_uclamp_rq(rq);
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

