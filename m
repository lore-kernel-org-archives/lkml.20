Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134146;
	b=JZ5Gv82fTDYo4C6Uus96jE8V6mjEUO2lWeX6OPMOTOciWdOCs8XTwdt2zrJKzyaFkeQQ
	 /+lLbiKoXcBls3fc1IQyhYNFD8/yhyyzJKHWd28CjmZfWLVqzBgwFtjXqAbiN3TjlUjdB
	 vqucxBvix8Epsuj2tUGHrQArm9hFQJ3ou+hnYIFNKop5Pa2IIwUdl6AbR2/7/y+p9XQR+
	 xLbKbD5MUS1M63ddwO5mAHfZ5PVdSvomK7EmFJ9Ut+PJpoSQpKtbyNe1o2pxr2RVyy0RN
	 HMR6BGmcVLfshVP2d+OYC8YYG8cutqLi3wcFtl0lFNWmCALCmn6qHRaDNS3p0VAHnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
	b=RBz+cIK3Ul0XtxXO7DX15OUv85qhdyElzYivgAfP+V5bxAQmtTTeVQWcxE1gECuUQ0Qk
	 rshw/SAj1udm8Oe3i7Szgtpt6hA8ppHlKcc76zwMpM8lvodD8rz4sQAWiUp7MwxJZl2O+
	 tMV0+VFhOg71NHREX/uWEzbQKmpYS2ghmMJg1BT24xb/SfIayQSF0khUmeiHNxTw8uG31
	 zNea8c5fdo06LZBk55Kxj33Qsh8Wdd9LJ+zJW1Vvj8URfukG0ug8jyZ63TiVN2w029SL9
	 /5a/grJs9W5R4/S8zSzSmSlIfUXrX7jpszoR5fcjGCOAUTNtYBT9JeG1yHekBqGfPQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4idKlJF;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA8C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4idKlJF
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2790105e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134144; x=1793738944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
        b=i4idKlJFAdQeiFyVEzCfHl4JdjLGwUYB46fnzJphuGrfOfJl64Xhwmh+vZBGH5KBKU
         nImD8MAMV+BGgkSrjZJLfA/y9MRJQVPzksCv6Jzag5Q5IOZz2YM1OiMl+ga3JZJNkHNL
         kc06XAnAOdOEwNGL8oySF2MTtEa+UyTzSDiotBYKs1IPq0CRjKzhckF0hZcduv74Wz7B
         hvEgeqb0Ay3SIbmQ88wCIdkCd/xSvMBnltVR4MDGoe+DfQa8CGsAwoT78Mh2KqP0Bjyo
         vVhm8XErx1TI/5m3+xcDCrk7pfSGgXycqLyajQgXb+w9mzc7ieQ7d93effGlDOODvRDi
         8Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134144; x=1793738944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
        b=v+upFqSb49YFIOySmSRKciYQDYV7Ik6dhbfHInyj9vS6eT3pWeg9QFbQSUbYuWoswD
         wvH7PzJtyTfGLES5U3JasvZTSqN2uI4yIkU7MhK411JUo6+tvAMsYhWaSkhWQa0fungt
         b13/eLluDutIa3bE5KMRhJdysLSxIoO3kybPG0golAwJlXgl2XpeY36ki+y9efwp88pv
         ScMP5yTDgWRPjuBtVTemxlNM4/HDVuI83dzXlD/1YoCjIL4c3WtjnZViQ50KDoojo9RR
         146wTgWk0MJoZy3L18EmAr++1Fl1o+7Kcs/gIljBv4YiDeutFIq5qZUemUejS6S5i7Uo
         XcLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHh/U9vp6FUWY1iYmwzkf4BUxIMPCZypOPeuiPd4Z9G63LgkcaA2JipUcFXDXCPM3cxVoJsu+4gETkM3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQnaI0ptpJxD2lwqpv//Qw4XqGZnrNCRVRCeLQW+LWw3G2lPPP
	SvTTRLX/Luy1Ahuf5CB5JltdgnqG57KaeGU+ZpUH6klIEKM6Y7YUb1pP
X-Gm-Gg: AYBFou0GCndHsN0IlHeQjGYXlPWi8pPBUEb/MI9F0bSuMork/kEpS7fwcmz0OWTnzH3
	aNF026DhOxPjI8TdsTmqHpe01aKbuaKOXPUhGXsmrRP7AKbxeF3dRrr6x6sYWwp7Rpaquma9dSr
	iPUmYO87kfTm8y5FSPRL3kg/gFfw/AOmMH7HXoiGb2HmeitRizO4JwT8+bPEp/9/Kc3G9vjqixx
	7EsQrQGd82Z7I50FMCli6ZFwBa+kigrUuKKnB3sB0Nw7+6nfrp2gx+6Mb6RG9pZcxWsELFa1emX
	Y99r2J4pfS8WaE+jT/3bfxkNmRcP2OtDV0I4n05UBhiKsDmHRDzZOs/jr+YtWR65i6o5Ye9Fy/e
	MNP6k1Vbe9zs3hY1Wnw7c22ADA49D9SCiQ966NwIJvZMwQ6NlO8aqDtWccCHff/+GWdrOPjUtqw
	D2CupfS0kbZw0wdgXav/i4Am0/rji/r1d5YoXuMKV3nr4qnwGTP2bcbquC3h0tH6EbetYe+IVhe
	T/AiqbkUqY80B4qWx5Ad1+8RQHVjWBYhMjTuwDOH+XDkWd1oxcEmaCt
X-Received: by 2002:a05:600c:811b:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4a967d96eebmr1828295e9.32.1793134144546;
        Tue, 27 Oct 2026 13:49:04 -0700 (PDT)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94ddf8c48sm6931075e9.3.2026.10.27.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:49:03 -0700 (PDT)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cinq Prairie <notprairie@gmail.com>
Subject: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Tue, 27 Oct 2026 21:48:40 +0100
Message-ID: <20261027204840.7823-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
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

With a single registered NAPI, io_napi_blocking_busy_loop() hands
io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
runs its own loop once, relying on __napi_busy_loop() to spin until
that predicate fires. napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED,
so __napi_busy_loop() also returns on the first need_resched(). io_uring
treats the return as the end of the busy poll period and sleeps in
schedule_hrtimeout() for the rest of the wait timeout.

With two or more NAPIs the inner loop is single-shot and io_uring's own
loop runs until its predicate is met, so busy_poll_to is honoured. The
same registration therefore behaves differently for one NAPI than for
several.

Make the busy poll deadline absolute, stored in io_wait_queue, so that
io_napi_busy_loop_should_end() no longer depends on the start_time the
napi loop snapshots on every entry. The single NAPI loop can then be
re-entered after an early need_resched() exit if there is budget left,
and the loop condition drops the "run once" special case. The fast path
that holds the NAPI across polls is kept.

Measured on io_uring-7.4 at 9c207aa58e54, x86-64, HZ=1000,
PREEMPT_DYNAMIC (lazy), no CPU isolation, low RX traffic, r8169 with one
RX queue, prefer_busy_poll, busy_poll_to = wait timeout = 10 ms.
"waker" is a SCHED_FIFO task pinned to the polling CPU waking every 1 ms:

  1 NAPI, waker, before:  busy 0.5-1.5 ms per 10 ms wait, ~0.8M polls/s
  1 NAPI, waker, after:   busy 10 ms per 10 ms wait,      ~16.2M polls/s
  1 NAPI, idle, before:   busy 10 ms per 10 ms wait,      ~15.3M polls/s
  1 NAPI, idle, after:    busy 10 ms per 10 ms wait,      ~16.2M polls/s
  2 NAPIs, waker, before: busy 10 ms per 10 ms wait,      ~7.2M polls/s
  2 NAPIs, waker, after:  busy 10 ms per 10 ms wait,      ~7.1M polls/s

The held-NAPI fast path polls about twice as often as the single-shot
path used for several NAPIs, which is why it is kept.

Fixes: 8d0c12a80cde ("io-uring: add napi busy poll support")
Cc: stable@vger.kernel.org
Signed-off-by: Cinq Prairie <notprairie@gmail.com>
---
v1 -> v2:
- keep the single NAPI fast path, make the deadline absolute and
  re-enter the napi loop after an early need_resched() exit instead of
  removing the special case (idea from Jens)
- add numbers for the single NAPI fast path when it is not cut short
- cond_resched() between laps deferred to a follow-up patch
v1: https://lore.kernel.org/io-uring/20261025232926.17944-1-notprairie@gmail.com/

Until the follow-up adds a cond_resched() between laps, a pending
need_resched() makes the single NAPI path fall back to one-poll laps
(acquire, poll, busy_poll_stop()) for the rest of the wait, i.e. it 
behaves like the multi NAPI path until the reschedule is serviced.

How the numbers were taken:
  - bpftrace on entry/return of __io_napi_busy_loop() to measure busy
  time per wait period
  - bpftrace on napi:napi_poll tracepoint to count poll rate
  - bpftrace on the return value of io_napi_busy_loop_should_end() to
  see whether the loop ended on io_uring's own condition. Before the
  patch, with one NAPI, it never returned true and every exit came from
  __napi_busy_loop() breaking on need_resched().

First seen on a 5.14-based distribution kernel (CentOS Stream 9)
carrying the 6.13 io_uring NAPI backport (arm64, ena, isolated CPU).
Registering a second unused NAPI id works around it, which is how the
asymmetry was found.

Only static tracking was tested. Dynamic tracking goes through the same
loop and is unchanged.

 io_uring/io_uring.h |  1 +
 io_uring/napi.c     | 38 ++++++++++++++++++++------------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 32247529076c..cd2a013143e3 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -139,6 +139,7 @@ struct io_wait_queue {
 
 #ifdef CONFIG_NET_RX_BUSY_POLL
 	ktime_t napi_busy_poll_dt;
+	ktime_t napi_busy_poll_end;
 	bool napi_prefer_busy_poll;
 #endif
 };
diff --git a/io_uring/napi.c b/io_uring/napi.c
index 7e698720cd51..be3d557db010 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -134,21 +134,21 @@ static inline void io_napi_remove_stale(struct io_ring_ctx *ctx, bool is_stale)
 		__io_napi_remove_stale(ctx);
 }
 
-static inline bool io_napi_busy_loop_timeout(ktime_t start_time,
-					     ktime_t bp)
+static inline bool io_napi_busy_loop_timeout(struct io_wait_queue *iowq)
 {
-	if (bp) {
-		ktime_t end_time = ktime_add(start_time, bp);
-		ktime_t now = net_to_ktime(busy_loop_current_time());
-
-		return ktime_after(now, end_time);
-	}
-
-	return true;
+	if (!iowq->napi_busy_poll_dt)
+		return true;
+	return ktime_after(net_to_ktime(busy_loop_current_time()),
+			   iowq->napi_busy_poll_end);
 }
 
+/*
+ * The deadline is absolute so that the napi loop, which takes a fresh
+ * start_time on every entry, can be re-entered for the remaining budget
+ * after it ends early on need_resched() (NAPI_F_END_ON_RESCHED).
+ */
 static bool io_napi_busy_loop_should_end(void *data,
-					 unsigned long start_time)
+					 unsigned long __always_unused start_time)
 {
 	struct io_wait_queue *iowq = data;
 
@@ -156,8 +156,7 @@ static bool io_napi_busy_loop_should_end(void *data,
 		return true;
 	if (io_should_wake(iowq) || io_has_work(iowq->ctx))
 		return true;
-	if (io_napi_busy_loop_timeout(net_to_ktime(start_time),
-				      iowq->napi_busy_poll_dt))
+	if (io_napi_busy_loop_timeout(iowq))
 		return true;
 
 	return false;
@@ -215,13 +214,17 @@ __io_napi_do_busy_loop(struct io_ring_ctx *ctx,
 static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
 				       struct io_wait_queue *iowq)
 {
-	unsigned long start_time = busy_loop_current_time();
+	ktime_t now = net_to_ktime(busy_loop_current_time());
 	bool (*loop_end)(void *, unsigned long) = NULL;
 	void *loop_end_arg = NULL;
 	bool is_stale = false;
 
-	/* Singular lists use a different napi loop end check function and are
-	 * only executed once.
+	iowq->napi_busy_poll_end = ktime_add(now, iowq->napi_busy_poll_dt);
+
+	/*
+	 * With a single NAPI, hand our end check to __napi_busy_loop() so it
+	 * holds the NAPI for the whole spin. It may return early on
+	 * need_resched(), so keep going until our own deadline.
 	 */
 	if (list_is_singular(&ctx->napi_list)) {
 		loop_end = io_napi_busy_loop_should_end;
@@ -232,8 +235,7 @@ static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
 		do {
 			is_stale = __io_napi_do_busy_loop(ctx, loop_end,
 							  loop_end_arg);
-		} while (!io_napi_busy_loop_should_end(iowq, start_time) &&
-			 !loop_end_arg);
+		} while (!io_napi_busy_loop_should_end(iowq, 0));
 	}
 
 	io_napi_remove_stale(ctx, is_stale);

base-commit: 4a93427e99a8524f3612f29ec8bc0da5f8435a51
-- 
2.54.0

