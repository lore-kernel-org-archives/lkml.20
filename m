Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214B50129A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738462; cv=none; b=stLlLCO+xur7TVYsdcTrglttb3CCHwg0TEcEb+GIu1YyMMdsJkYp3yhIznGNnYQgfD/VT0hK58HdwwD8giWGzncq7QQEbFvkLAHs2frHDoQdXOW+CbqdbMjlQmVHQ5yNxAMPjFPn4WW4FwwNdQidCYWv4BpDpVNCtMEy0ZHQuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738462; c=relaxed/simple;
	bh=QNJzCBnu54BpVshGaNyg8PaNs/5K+yMc5H4BxDJHLDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJuI/g+KZs1p4HW3tLIaH50g81w8zbsvnkL/u+soXakrpF/6Z+3q8KKbnUci4TkAViZjLmJuSAIaE81fvVBDgG5e396jDblbB+pPicQwimRJTeuaL1iwupYAh2KHQ47KeyJhyW+cR6hwe+rI6cJgZaX2cIqsMlI/mNT4WhhU9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NusLnPTS; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NusLnPTS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QNJzCBnu54BpVshGaNyg8PaNs/5K+yMc5H4BxDJHLDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789738458; v=1; x=1790343258;
 b=NusLnPTSYHJXZJvMrpcKsfrcZNMJdOegRQ/ryyF4YSJJihuWDnJTChUVF0k42AS5Y3vnkqm+
 cDvJJ86QUvuwReJkNX9s3teZJDt6wCXuFQrYtDdA1v5rkwcGhABqocBR7KtMTm82CWjznxgIite
 Bf3tRNqmJoex48N19j4ByyqI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 010ce4c2667fe2a4;
	Fri, 18 Sep 2026 13:34:18 +0000
X-Mizu-Trace-ID: 010ce4c2667fe2a4
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	tglx@kernel.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v2] tick/nohz: Avoid unused timekeeping_max_deferment() calls
Date: Fri, 18 Sep 2026 06:34:08 -0700
Message-ID: <20260918133408.2834751-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tick_nohz_next_event() limits a CPU's sleep interval to the maximum
deferment supported by the current clocksource when that CPU owns the
do_timer() duty. If the duty is unassigned, the limit also applies when
the CPU's TS_FLAG_DO_TIMER_LAST flag is set.

After the early timer checks, the function currently reads the maximum
deferment unconditionally. It then replaces the result with KTIME_MAX
unless one of the two conditions above applies.

timekeeping_max_deferment() performs a seqcount-protected read of the
shared timekeeper and follows its clocksource pointer. Check the do_timer
state first and avoid this work when the result would be discarded. This
leaves the resulting expiry unchanged and reduces accesses to timekeeper
data that is modified regularly.

On x86-64 this removes 18-20 dynamically executed instructions, including
the call, from the common non-owner path when the seqcount does not retry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
v1 -> v2:
- Remove the unnecessary comment and delta variable (Frederic Weisbecker).
---
 kernel/time/tick-sched.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c8f2c4a503b08..a7893a079a83f 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -816,7 +816,7 @@ u64 get_jiffies_update(unsigned long *basej)
  */
 static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 {
-	u64 basemono, next_tick, delta, expires;
+	u64 basemono, next_tick, expires;
 	unsigned long basejiff;
 	int tick_cpu;
 
@@ -856,8 +856,7 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 	 * If the tick is due in the next period, keep it ticking or
 	 * force prod the timer.
 	 */
-	delta = next_tick - basemono;
-	if (delta <= (u64)TICK_NSEC) {
+	if (next_tick - basemono <= (u64)TICK_NSEC) {
 		/*
 		 * We've not stopped the tick yet, and there's a timer in the
 		 * next period, so no point in stopping it either, bail.
@@ -873,17 +872,19 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 	 * the sleep time to the timekeeping 'max_deferment' value.
 	 * Otherwise we can sleep as long as we want.
 	 */
-	delta = timekeeping_max_deferment();
 	tick_cpu = READ_ONCE(tick_do_timer_cpu);
 	if (tick_cpu != cpu &&
-	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST)))
-		delta = KTIME_MAX;
-
-	/* Calculate the next expiry time */
-	if (delta < (KTIME_MAX - basemono))
-		expires = basemono + delta;
-	else
+	    (tick_cpu != TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_DO_TIMER_LAST))) {
 		expires = KTIME_MAX;
+	} else {
+		expires = timekeeping_max_deferment();
+
+		/* Calculate the next expiry time */
+		if (expires < (KTIME_MAX - basemono))
+			expires += basemono;
+		else
+			expires = KTIME_MAX;
+	}
 
 	ts->timer_expires = min_t(u64, expires, next_tick);
 
-- 
2.53.0-Meta

