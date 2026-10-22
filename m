Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792713162;
	b=1VXw6Eq1b0hPRyMmyeZntCkZDIVm/xdbhKjNcu+RjZNV6PVYObJWtKuGw9J9XYPzcvXi
	 /Tw2Qe0AcU1jPTA02FsZJndSxDPJfWkArzkiVojOWL9AQNMrZ4C0TLZgHsrSOGO/EFDqA
	 Bq9RMDSzl5Fk391dwAcjkBf9h3coRl6aBcXjuK2iQvDUKcQXzZvFfgOfrspiPJdWNnEuh
	 WjcXQrIDIBdn2ycF7vn9D+gkrC63Ys7IQHjXmuuJqcrEINTuHB0g6jDvsq7iknhNmuRP5
	 wSCGok8PoKYka16qyBpB8ev+TOp+p1nnq1wjLB2qvkqTXYhAoqM4P+s8uWI1Oz40V2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792713162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvm/RgLmDhDbIAIXBn1RQMX1ygpGK3rKtyK5vAvNKAw=;
	b=hbiOov0GSrQi+OgBpVm+uPMZPYS6fKsw8YWyg6cy6gJe/9XoEJTcSljS5W7PzF7htG17
	 WTe/uF7yWNTrB9kM9p+K50uLJ/JVwAc4s5dHQ7X2o6YdVjhrs8+AGWXbMq8+/z0qVEa31
	 KH3wLPkgMP7QdGuO+dtBQzmJIQgyyfsb7GuHkrtuauz63s5KPtNgJKjsd4rKFkx86o316
	 4rDrR4GPEqhSe1aJqkyzd9TBxECjOfAiPJMa+YLomD58DzQ/4lPeFrvZMGIesYyF0C5Zu
	 4J9cuQwkhODo0JwJDbu6WURUOzkQuJ4rdWZoyHyPqYMs43xq8VyweNQy2AlTg8NO8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VawTb9sg;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99852606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99852606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VawTb9sg
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8246b13cbso2308025ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792713161; x=1793317961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvm/RgLmDhDbIAIXBn1RQMX1ygpGK3rKtyK5vAvNKAw=;
        b=VawTb9sgzVjFDuznyRT9IVUs+GMwrK8R5xD3LzMmCHnFQDbrue50p9Dkuu/vRPxY/7
         mhF5ykMi88BZxD7ieA1nwhNYB90OrILpy25yDQSndWwb/o4sVjsRsCoFQmFLSFWYlcvw
         CnjWq6IgKYytmncD0GIjELeTpwQ7xYQzyMzeVMf1Hhv+PFTzFaj2Sf02t6vIqA/SERuo
         qt2XUcBpu7pDbPX/R/WGA7HoEycX+B6Yl8iwczXW7H1XS45hcHE9qnb8If0JSsFcUWqg
         Rxl/FkSnPEmamI9KVWsRiE2tvWYUMvMsIizL02vD3YSnn/4FX5bb7iOYCgnx10y8ounW
         tWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792713161; x=1793317961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvm/RgLmDhDbIAIXBn1RQMX1ygpGK3rKtyK5vAvNKAw=;
        b=YwMaQo7IqOqF3E4tIMv6+uqqF958XtgCA91zuVahacRm7Zo2uOTeOP/GRe2YIHCS4l
         UsqbNAy83d51rVFAm3xKKE3NwOoXO9mVBgtw7/fOpkjpXEX45QDAYh4hS6yppYoIN9u5
         TTe4cuKoaxq2YQjmnxAWm5xYg37xInqP3E7nit9iBRl3TO4SicJQ6kdXHtKNnfqMqfvk
         y4NLIAaPOdA88HJB7TOqfNhjhUq06DEhi/lzygbA/ONWdUJZBoSuz6jLIn2r4OJm+PqR
         FvDTTme7HrzoYmNhP0wg1jI25jNSqLEmEwvx25WR1kkfCN6c6FFVX0HPaFb58Kw/0B+T
         as7w==
X-Forwarded-Encrypted: i=1; AKwUvBxiwSTyGLb3u84vySpwcUHbuRH1L4zPXfW2VGvAeq8xaQfqRZpYy1JGWpmWEhLaOxifHYj3DVm0yO05vaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKXlQz56KEjL4tzlUdCx8kmPDKS+7iXG8Xpt5sDIYAFhcvgwe5
	fNY3UEc5XvBpz4M6hYUiKbxN1S+dHLVe0ktWoQxqf+Em1GZ/SDQIPaEc
X-Gm-Gg: AYBFou3sS7uh+9MnT5IaYBAkKucefhiNXhoPIabEUzwrGvXFfoaab338liINAq7PHzK
	k8iNjejXeb15R04auMMd4NvDeOiyMkbfQVH8V52sFJEyeSxe+F4/cnjLKbVZVgUZHHzJU5NtK9v
	+s0L4Kb3ayPjtmGDgM75v+1EapemDms9utErPLzHqKDpkMZ81qIskwFShzDUwniXhzEpknw8dmN
	1OJ5YFn8tSSphIwm2a+ccDYYCfEL4E4d5uw3tAGBrObqcAWViiVuR8pkgONmHvDi1ntAfZzFYCT
	SJNy8LgflGR7fi9lL3EziQIl5jxEg8AVl9nxS5JFJiATHVLZF84SXPeTQEAS9+uBRDx9e1zUGea
	9CZ2Ui0uF5wclgLIuED3Ohw4c/wu/6DFR2V4uW/HlOnuzwEx2aHwlkFT96RHWqDouzGz8fTGON9
	IYFk3Y11eDw2jM4OahAMdodRgQAnLNZsvQapZteuHneYZcp+hYRC0dXSSHNmQE/mH9PcT1WgQus
	fD8V1cfSX3L4XEh18W83igUuycq8MspLtr7byBOFjhFW8j4nDlgPjjZL04f/Kzsf07o
X-Received: by 2002:a17:90b:3dce:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3adcdfa8867mr402613a91.18.1792713160839;
        Thu, 22 Oct 2026 16:52:40 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm937957a91.0.2026.10.22.16.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:52:40 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Aaron Lu <ziqianlu@bytedance.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] sched/fair: Clear throttle state when leaving the fair class
Date: Fri, 23 Oct 2026 08:52:33 +0900
Message-ID: <20261022235234.150957-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Task-based CFS bandwidth throttling removes a task's fair sched_entity
while the scheduler core still considers the task queued. p->throttled
carries the fair-specific state across dequeue/enqueue operations.

DEQUEUE_CLASS removes the task from cfs_rq->throttled_limbo_list
but retains the bit. If the last finite CFS quota is disabled while
the task runs in another class, it is absent from the unthrottle walk and
the bit survives.
Returning to fair while cfs_bandwidth_used() is false then performs a real
fair enqueue with p->throttled still set.

After bandwidth is re-enabled, a class-change dequeue treats the
stale bit as limbo state and skips __dequeue_task(). p->se.on_rq therefore
remains set, and put_prev_task_fair() places the entity in the EEVDF tree
while the task moves to RT. On exit, the fair picker can select the
TASK_DEAD task. __schedule() then returns to do_task_dead(),
which hits BUG().

Keep p->throttled across migrations and group moves, but clear it on
DEQUEUE_CLASS because fair-specific state must not outlive fair-class
membership. A later return to fair uses the normal enqueue path. That path
still respects a throttled cfs_rq.

A KASAN, LOCKDEP and DEBUG_LIST v7.3 kernel reproduced the do_task_dead()
BUG in 3/3 root and 3/3 delegated uid-1000 runs with CapPrm=CapEff=0 and
RLIMIT_RTPRIO=1. The fix passed both matrices plus a 3/3 class-switch
control with bandwidth continuously enabled, without a scheduler warning,
KASAN report, lockdep splat or crash.

An AI coding assistant analyzed the state mismatch and drafted the initial
reproducer, fix candidate and this changelog. The source paths, trigger,
controls and results were rechecked against the cited revisions.

Fixes: e1fad12dcb66 ("sched/fair: Switch to task based throttle model")
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
Cc: stable@vger.kernel.org
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37eb..524fe88bbb381a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6957,8 +6957,8 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
 	WARN_ON_ONCE(p->se.on_rq);
 	list_del_init(&p->throttle_node);
 
-	/* task blocked after throttled */
-	if (flags & DEQUEUE_SLEEP) {
+	/* Task blocked after throttling or is leaving the fair class. */
+	if (flags & (DEQUEUE_SLEEP | DEQUEUE_CLASS)) {
 		p->throttled = false;
 		return;
 	}
-- 
2.55.0

