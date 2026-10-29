Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279649;
	b=hZ7kxKQ7DlRID4jcIfFAhe2d1kQnSxN2Pdp0tlKQjH/FGRJeVqTOFxV5aNEsZ63TUUs3
	 zILGEcd9Ey/zMYuCRWWMYmv9HxBBpknK8g1kbKy7pVcWNeqEKOI1V8IfR91CsQ1V2CjXf
	 mGTyxVdBhu4iiB+U3rC/3XUOaM7gzMnaiPfMuTYLDvhlKxuw4uAqVRAt9qDNI8agah7Pe
	 /LBCrn1f4TxpprNJVby4t23JxBn5mp5xLeELS5jnLUgm4zf2Gl8ElxNya0IeXct7ymPIX
	 mdh4lsO0I/2QiaH0bUw5hXDBMTnDhXYW0GLq+ZrZj8SDRgCNTQEQcj3JyD+UCBeZ+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
	b=x2RgD4Foxe3FPHa5O73fEnmk5BM13jbtFU5NKIE/F4OtmCkzb0wuwEcD8C7PSXYNquB/
	 CtKpQkev4NVhEMdG7vW91954xqKmIRN5Riv5YPf2HnxoHHhTcIbykUKQO7xsCvHoX9KrU
	 vF9jKX4az3leYE5H9Vk4l6JbjhXTfHFf0BVPVW8s6QqHUM6oHfNDw5vMc8mEgLwhR2WsH
	 2N96hC73TBLjRW+xOwDsNYVaNVYEcJcakk2L27OkO/V0KsMAaN2AMVEtdZBp4BM4ADRd3
	 Dkxzg11ergM7bK+UtL7e7cBeHhEuiSyZoMRtdW62nrFhNzcAQZv2VHF3dIb8z6/ToRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hhlVXN27;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C967606A330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C967606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hhlVXN27
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so18927355e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793279646; x=1793884446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
        b=hhlVXN27AA1W249f2ie5OkXhkiNVadx+RpisaKqDI6/SL1Kzmc90g+6HdqGRzua8j3
         v2E86JHUXkUzykuYfdednMgNlF3wXdZhehOl4awj1scdlBWuF4ARm1WmQSt1j6uP97dP
         q4i1zGTwTs2McClkF4Z0P8AVxUY09DRD2/skEP97Mqh47Mrvr6NKhv+wb+HW/9MIWGtv
         PF+MNyhreDjWikwix4xpP2JO2roZa3iee0rRHt3Mp6C5TKwHlL/GCRyeS5ztyzBvJEHF
         7fF45XNGPgg5OUlk1O5WSnNsmJn4SPGyvsP4kGa1irya8E67gtpYKev9k1aEv67drwiJ
         CyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279646; x=1793884446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kpz8snzieTqMzdxzMvKo/tSUuQbAXkjGVpFaeFDlNE4=;
        b=r4aby6fdMOTcazYbJfoahruKhdYox73l+r9JFPsYYuRbWSBopt705+yW4CLm2YSuGw
         VCdaDRs81CgWCL0r6AFzvwCvAP3NQlgmkbFPpFWoPB2X/XVNNry8NuU4PsX1QoXpqoYq
         M9b4kuO3ureq+dVv7dY0G79QCSp7s5rkHSNhaA2nWlS/j7kyi/Aw1wm4LKKLXKDks5NP
         Bi43ghr3YyvMJSSGfX+L6nWhpe5YAFogfu4O0C3i0+aR1NtMqvKioMIKXphcXdHmJkMZ
         r4+h7SLS6feGBWsylaAtYeIl5jjIsh4NR0E/tdBgZaqcEfUamMjTV9BEeWWDfOLDFnoo
         +RCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqC/t74ivtjutxmXIuBahGsdt3nWPXDi5z5UXGKkkWWH7W47T6/FprSjIAvQmOJsjzDNivPUwXKvyIkJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKybdh66cnLwzRyokwhd/0AGE7F0lDVHkiMVyu4NCRHtXblqpDo
	1I/UDDMR2bxHdHIOxCKGfIV+bKlvPgT57/B948bHnVE5RzX7VEKgxoBhyZK9T9WXERA=
X-Gm-Gg: AYBFou1/I39H9jwq9GlBGHVefANs1/BsARHfsvhZ7vZWFVNoKJZI6La6SD7x2Zmr5I+
	A67J+hw+Vzf8gvgNVwNhB7KCu30+zbGPTW5KimsTh9aZXDIV45cs+WxEU/Be5GOk4ctXtHb2leK
	QRgO/F15qQqXUyh/sBRDXkBxb145AzpEk3mcFvNxDn5L35/N9wwTIjkSFy4kZiD2R3gdi9IkggG
	sTKBNHHRA38XklxYAEuFMwP7n7bcOX+LlNiTT5s8hLccNvy9Mlhv9ZYxEaPkEiO/9+xb81SF3Z+
	lNEBYs/MzZKq0TCJuHvvShJCY0sEqWn0Tje9Xtq+PfxfTOUcVo+29bsYUVENgyE87Pb5oiQkYR5
	jc8NjA6kBRqe2HwDScco9qHQYK4ThIxU1xzv1G+/MWUC5n5Mh1yxGEsw0GukGGx77GXqdOk4J/C
	EfnbR9IgikNeIePCAOUBZBEbgqsVHy9AgvmlyUTR55H39I6nOodpww8PNWbxMJD9rzwfJ2nUKk+
	UO33zdu3eZKhQ7Y50XKT4MuLo/Ez2a5f5mdtLTtPEJZIlVGN1BoK9rIMB2o3h+IsJRYayDzG0v9
	MMg41+0PuXzhQvn6khvZ75+cMxicDPtwME1EjHLL0khKm/OwChZorEwsApfIXIbpozbqD5iTlTV
	xGg==
X-Received: by 2002:a05:600c:4e43:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a96658730cmr122725665e9.17.1793279645749;
        Thu, 29 Oct 2026 06:14:05 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm76637805e9.9.2026.10.29.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:14:05 -0700 (PDT)
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
Subject: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
Date: Thu, 29 Oct 2026 13:13:53 +0000
Message-ID: <20261029131354.11030-2-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029131354.11030-1-qyousef@layalina.io>
References: <20261029131354.11030-1-qyousef@layalina.io>
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

