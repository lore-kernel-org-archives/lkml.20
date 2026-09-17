Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC165383EE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663185; cv=none; b=q8v/PZ7I89ohXyphPkG2sa7VTatHSYJ6MeVA/9ZYnzsSd/2t0ztx6qcs/Mv7lHpoF4jEReuT4n6DJJJjvKuKSiPwVjdH07V3zDNUpBRGvSjeCWOSWM/jAxU3RdoZ31C1UZ+1Ziil5srKW7JyUg/uzIAcDFfgqQ4mEhjyS9oMUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663185; c=relaxed/simple;
	bh=Ymmw9t0FKfCLKn6PuLpN9/QXnDU5dDfQyFKISkmhwrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nntPh6mgv82pLfY11j4LDJJ88chOWpjpE88lle2aaL8s2BPFjh1sM0BSaggPcxlYMzWwmNFTqayjSMxSBhzS8SvPEMWykFAitabGgkBP+UbudAOSquyiZ2UsNE9KMNQWKa2g3aBNzDz2klEh7yBvungt8GWayNe3B0i/NanHwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MuPoEC52; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MuPoEC52"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ymmw9t0FKfCLKn6PuLpN9/QXnDU5dDfQyFKISkmhwrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789663180; v=1; x=1790267980;
 b=MuPoEC52CrLmWqK1oY3EVrT2AVzvBto3XMvBTeW6mTYOhbSxbpD8UiDE2QxFONdeSt9Ex+fT
 ZERh0JliKXBCqgbRC84HRqYiaEOcnEhKdWh2fQQs6RQctVMBUxHW3F7svbyr/t+/Keuxz5vAt3Z
 Ve0cNS/mZM+9XQ+d+/iC8WVw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 00caff7f19f0b012;
	Thu, 17 Sep 2026 16:39:40 +0000
X-Mizu-Trace-ID: 00caff7f19f0b012
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
Subject: [PATCH] tick/nohz: Avoid unused timekeeping_max_deferment() calls
Date: Thu, 17 Sep 2026 09:39:29 -0700
Message-ID: <20260917163929.1271332-1-usama.arif@linux.dev>
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
 kernel/time/tick-sched.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c8f2c4a503b08..e7c7c28311156 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -872,18 +872,25 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 	 * If this CPU is the one which had the do_timer() duty last, we limit
 	 * the sleep time to the timekeeping 'max_deferment' value.
 	 * Otherwise we can sleep as long as we want.
+	 *
+	 * Only read the max deferment in the former case: it is a seqcount
+	 * read of the globally shared timekeeper, and on a large machine
+	 * almost every caller is not the do_timer() CPU and would throw the
+	 * value away.
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
+		delta = timekeeping_max_deferment();
+
+		/* Calculate the next expiry time */
+		if (delta < (KTIME_MAX - basemono))
+			expires = basemono + delta;
+		else
+			expires = KTIME_MAX;
+	}
 
 	ts->timer_expires = min_t(u64, expires, next_tick);
 
-- 
2.53.0-Meta

