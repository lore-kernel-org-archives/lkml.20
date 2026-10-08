Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5384ACC81
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466004; cv=none; b=oOqCsGTa6HukPsJCdNKGOojRTLz+lwt4/7Stytjr+1Qf3W5QaTjaaqaEMboIRb3FsSUtJwpoWx7QKTt8JQcAHX1Tih7wnEELygwTzk6ir8CZvAQ+dGozwjSrovHj3TuM0xIixRyl5Sp3HyLaFwRELDG6OZeNzFZf9rFOioYB9Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466004; c=relaxed/simple;
	bh=4+oidOGBkLU3RVPlbDNuWGYCR4gSNYmvVnmdx5guRng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiORbe30lzWYkJt8Kr4KbqQcwfdBNMMeHUpTLfeKGAr1wFgnRRAlSmfPYTAb81f4snrA9R2oOQoTkAxkAR6WiqQlyBIKw8avCPEbbmE3VZd658xKb5SHQoBlwhfqJlt0hy5oqlCKm4+1HYROIhZXZyi/24ALGrku/nXgAZxbGHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTwl6BII; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTwl6BII"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2811138a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791466000; x=1792070800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWWUckXEiaUS4FFQC/CuWp7QuZDCeEAuIScuLrpjPYI=;
        b=lTwl6BII0sfTIm+UyltqxMhVfQiQeu8PPa6YfjQbHoBxDO6tLXP2nElW6Vux4Q0Q7u
         qCavTQi6ntCzOBFRVRnHS4t4hHg6tOyVH/zkUB5TKMmir7ZssU/OEOd8uORRm1yFmGjk
         9eqkOh9F4bEmCgaNGT93cUDDYDv6j4kNONcT+LvRYKiqB5HHiRSCzcvNBoQO+w8oelLx
         oz18fCfJtigkY2tvQKw7CAhdOEllQGRwciY02tzXjnHKsAcwjkqoYo1eIHYF8dVoeLPM
         u02Y4YdTh4RgHfZ3wTDYXWOlowy9VcyJpXiRH/2IAkcsAIgACXtvjF2nQFAavoHq0ljl
         vGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466000; x=1792070800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tWWUckXEiaUS4FFQC/CuWp7QuZDCeEAuIScuLrpjPYI=;
        b=GVi1tEDz4OW+JHwwZldDYnAcBg8cZjbJCP4MHeyMgMS0IQMKY6DSzchSykwjn2Mc8c
         qxw/OOqvHT+jqlV/HCiJDYNONzRhMNUSSauhlIB1+Zg/eFKCzA94aYAFz1EynD/J9uAa
         J5XJCowLSgJW7EH/lDQ8HeZtrdq3fM5hZghhRnCmXEenQTkfv+DL1i7MlSXB5YrJAFKp
         GRaJ4mj6d5OZ3nd9tyrokmHnImSK98JIsQ5XGeQ/IIStqxeEp1RbfUecLr1q60+zyMJV
         UuPEnL2BpRVt9y1l+pSCGs2CsyFQN703uhxoL3HzUXWTiBsG3NKWvtomD3NVLhmfLiHG
         KurA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Cx4vgzP6c4DSb6BqtH//3wDrVMPJddNtW1KnDFdHCkWSYii3QAPQnGjoPzKiF3IFtTcRUg8KQ+P8Nuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhPnwpRzn7fQU2FbnHdSvffUrRnsJaMlHptArpnmI3pI9hev8g
	h/D+pac7PMCM2yvDjIz83XV+E1SUBoVMqXMSTYEZcm9QqVQeW59DQTKB
X-Gm-Gg: AYBFou00Nql7VZpM18ndRId8qb+RbPQZsT1EO7bQfbGqxIdJoXNsclXvELE5lHT+FTR
	j1k7t/ibSn5h7t9CkF/Ddmqo35yflJ0CzkY//T1Jezo8Y1edFRm7x/EgVGk0geT7lBhU9KLYJC9
	IOCGJ8UuO9vEX21BtEZPLE3Z78BHIB1j2UvofT4u1GYQYrjr9T33fetN6aTWZI2vPZ9rRDuo2sU
	09msL1aEdjv59BtcHQBfJ/g1HcLjnDf2LkPVphCBtooKmOk3FprXJnCmE2l5plxUa322hqtSisl
	kNfga5wf3/MoLxjo9ki15mU0y7QhhFnW8h/xTtalwLNuKRtriPu78wAY8ZizXyMghGEI7Un+/4F
	jqZEj9AdgwYGCkOVaAghV0VjoJG4ARLesDKCVmj25LHsvfyctsw8NqZ6Xc9rEzJVKEkgslhU1VK
	NsjKfRarf1uxx/HWyZOQcDl+yqWxz+95rqA5jg3frfND/Eh8Qxno2to9Jg7mblwWNzJ7QZ6A==
X-Received: by 2002:a17:90b:3ec9:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3a984821aadmr2781565a91.40.1791465995577;
        Thu, 08 Oct 2026 06:26:35 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab1e8b7d4csm476312a91.16.2026.10.08.06.26.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 06:26:27 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] sched/core: Flush pending runtime for the execution context
Date: Thu,  8 Oct 2026 21:26:03 +0800
Message-ID: <20261008132604.98242-3-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008132604.98242-1-jemmywong512@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_sched_runtime() reports sum_exec_runtime to getrusage() and
CLOCK_THREAD_CPUTIME_ID. It commits the open run interval first, but
only when @p is the donor, using @p->sched_class->update_curr().

The interval is not added to the donor. The donor class's update_curr()
reads the donor's exec_start, and update_se() charges that delta to
rq->curr. Under proxy execution those tasks differ: the lock holder is
on CPU as rq->curr, and the waiter blocked on the mutex is rq->donor.
A runtime read of the lock holder skipped the flush and dropped the
time since the last update.

Commit the interval when @p is rq->curr, through the donor class's
update_curr(). The delta is still taken from the donor's exec_start
and still applied to @p. Without CONFIG_SCHED_PROXY_EXEC, curr and
donor are a union and therefore the same task, so the condition is
unchanged.

Fixes: aa4f74dfd42b ("sched: Fix runtime accounting w/ split exec & sched contexts")
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Assisted-by: LLM
---
 kernel/sched/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..b2005fafae59 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5715,14 +5715,18 @@ unsigned long long task_sched_runtime(struct task_struct *p)
 
 	rq = task_rq_lock(p, &rf);
 	/*
-	 * Must be ->curr _and_ ->on_rq.  If dequeued, we would
-	 * project cycles that may never be accounted to this
+	 * Must be the execution context _and_ ->on_rq.  If dequeued, we
+	 * would project cycles that may never be accounted to this
 	 * thread, breaking clock_gettime().
+	 *
+	 * Pending time is charged to rq->curr by update_se(), not the
+	 * donor.  Under proxy execution those can differ; flush via the
+	 * donor's update_curr() so the delta lands on p.
 	 */
-	if (task_current_donor(rq, p) && task_on_rq_queued(p)) {
+	if (task_current(rq, p) && task_on_rq_queued(p)) {
 		prefetch_curr_exec_start(p);
 		update_rq_clock(rq);
-		p->sched_class->update_curr(rq);
+		rq->donor->sched_class->update_curr(rq);
 	}
 	ns = p->se.sum_exec_runtime;
 	task_rq_unlock(rq, p, &rf);
-- 
2.54.0 (Apple Git-157)

