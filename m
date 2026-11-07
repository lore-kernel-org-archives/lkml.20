Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=Dkntxxpw+rr87ibCHYSHcM1gi+DCfWIwU+sfGXXOrAw8jicAAMRo20yE2bTS1T3hfLUW
	 m0ks2rITB71vzUZFBcUa1jesnfhnND4nGioypTC6opF5pzGLkiZ4xW+zerh7Fvq2GuxCi
	 LbLBUlxGoZV6BLXqWmakYMxzCQkKwoJYwyeNfIwc5RlEjp8KqAv/I2UF1k4ZVUJBQxE2+
	 GWGa25IZVZmfRWZNIMR78p9YL1AGZ6kt27TBuNoZOBaRc9rclRoXj+jijzc0Uyw9mgCtz
	 dXA7h20HdVNQUX8g94XI9B9dpSS0ZsOpgNdK6jJiHGBM/pFUJXJdLxt8eu+Y1ea4n7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=36gH6Y4wdKFNcSJld6N4fwgOrUat/acOxs4ICx2dvzg=;
	b=2L0a3XceldU0tRjhgOyUZbs0wM687oYLQzGUtCaMz3NlDkeQwKHoTJ1mnKDohvhWOdeM
	 x1IwUX4yJqiuGtlMtRupH/tpyREmYRXJwPT7Btp6qQmRXEZcfZ2rCyCmIkAMNIkodmoDk
	 ykFqee6Rq/Ywcdrs49xLtc+G7DjzBBXIapzzracbJCm7xeir2IMksooT7eMk8TpKmxGlh
	 hMjV33gmq5fUt4k5CUxt3bg2SXx+RNn9Gd1WAcwj0iXUOsi+Ycw79EEVl1Sw6VuVxkCc7
	 8GIO9+qGS8Zi6HIErCg3HN1/T4AQpzt38/9etCoIaZS7+mvveF2Xt9MQ8/JQAgKasaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PJ4suObX;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF58606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PJ4suObX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=36gH6Y4wdKFNcSJld6N4fwgOrUat/acOxs4ICx2dvzg=; b=PJ4suObX8LdSVYQtr6+BauMRAM
	dljgKpjXwc4iMHI1dELAQrepqHOqmL6776KytESxZC9SCH8ZQvlLOI96qL7dJlbbfTyC1hqeo6BHe
	KLpq5fg/QmkWwleiCXXBR2KME3E3ry14XFe/gSqJWm19PU1nzqiNSOr7ElsJey50kJnOtHE6VKIa6
	1YvOujRjRiWtB8wxeSz/+Kuf/9Fehzms+rVIGyUkUXbYfUidZ3WhrMwLeBKN+Slj/71rytg4j6Yff
	NkR7QeRDWnuxMhqN+PhHN0zPrBbyS5jI1dkgAImWNlPdNRHKgXja6UY/tH6KRz9+vFmDH2+tC5Le7
	5iQVOBXQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf89-000000008xJ-2GQb;
	Sat, 07 Nov 2026 12:02:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 1CB66300FB6; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120206.980785656@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 03/12] sched/core: Decompose update_rq_clock()
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Adds __update_rq_clock() which lacks the double update warning. Additionally it
will now always set UPDATED, even though it might skip the actual update.
Because when we skip the update, we must be up-to-date by definition.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -867,29 +867,32 @@ static void update_rq_clock_task(struct
 	update_rq_clock_pelt(rq, delta);
 }
 
-void update_rq_clock(struct rq *rq)
+static void __update_rq_clock(struct rq *rq)
 {
-	s64 delta;
-	u64 clock;
-
 	lockdep_assert_rq_held(rq);
 
-	if (rq->clock_update_flags & RQCF_ACT_SKIP)
-		return;
-
-	if (sched_feat(WARN_DOUBLE_CLOCK))
-		WARN_ON_ONCE(rq->clock_update_flags & RQCF_UPDATED);
 	rq->clock_update_flags |= RQCF_UPDATED;
 
-	clock = sched_clock_cpu(cpu_of(rq));
-	scx_rq_clock_update(rq, clock);
+	if (!(rq->clock_update_flags & RQCF_ACT_SKIP)) {
+		u64 clock = sched_clock_cpu(cpu_of(rq));
+		s64 delta;
+
+		scx_rq_clock_update(rq, clock);
+
+		delta = clock - rq->clock;
+		if (delta > 0) {
+			rq->clock += delta;
+			update_rq_clock_task(rq, delta);
+		}
+	}
+}
 
-	delta = clock - rq->clock;
-	if (delta < 0)
-		return;
-	rq->clock += delta;
+void update_rq_clock(struct rq *rq)
+{
+	if (sched_feat(WARN_DOUBLE_CLOCK))
+		WARN_ON_ONCE(rq->clock_update_flags & RQCF_UPDATED);
 
-	update_rq_clock_task(rq, delta);
+	__update_rq_clock(rq);
 }
 
 #ifdef CONFIG_SCHED_HRTICK


