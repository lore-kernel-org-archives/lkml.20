Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A78420E89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366922; cv=none; b=LuYSREF+DlrhvbHU+lgcLmgTJschFFMZVaNu+b/SCUPBGYPy/mQ9teXsH8aFlSHGdki/M3PCmHxqjkcA8Q8t3k/qgCvqH0ZpADVqRUWQMmSEyT0HMTTIckDX6EIdIJN2AfNMiQiYV6Tr5wrIhMCLZCHLfGpxIq64LyKofseN97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366922; c=relaxed/simple;
	bh=uTyV/n/8iuzYfDftL1fj91IK3hiDuLkjq9xhPjqQyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfsTiewmU8WktvuhmC13lb5TBZ/OSPIBDTZO85t2EG8NA5AaAC6MEtDsEY5WcTyM51QXsxWHqUPHmnF1e3JH2KpHFAwqcPfJf/2HHxlWibM91FKENUpnHXsIVlXaHHdb7m2VWTJRDcAAT5u6FyRr3Hqg3V3aRNp/6zQomwLwevo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WwXxeDPH; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WwXxeDPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=g6
	dBPLBeQQynbiaiYwtAr4XLB1WJIB0C8bRY0oWkEWA=; b=WwXxeDPHP9do6wBL2I
	4pTAQXsWysbxvoyDfVeBruZuYPoQCOV0aSMzG8n3DjSMxCYxnffsE6e65iFzuhCB
	BiCwBa2sDMdgM4NAMmXY2EXn9PiFG/kTgallHgxi9QFYkUl4suboRH2l7Yn5E4+k
	l6onBkvqqkigpaV+U6yFUDgJQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBX5AzgT5hqUfasAA--.24299S2;
	Thu, 03 Sep 2026 00:33:37 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	metin.kaya@arm.com,
	connoro@google.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH 1/2] sched/numa: Use execution context for NUMA task tick
Date: Thu,  3 Sep 2026 00:33:35 +0800
Message-ID: <20260902163336.1552840-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBX5AzgT5hqUfasAA--.24299S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4fJw48Jr1DWF1fCr47twb_yoW8GrW7pF
	WDtF4UAw4kGayjkFyDZa9Yga43Wwn3A347Cr4DGrZ5ur15Jw18trWkt3Wa9F4Yyr40yFW2
	vr4vkrWxGw1UKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi75r7UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gHMLGqYT+GZWwAA3V

With proxy execution, fair_sched_class::task_tick() receives the
scheduling context in rq->donor, while rq->curr identifies the task
that is actually executing.

NUMA tick handling is tied to the execution context. In particular,
task_tick_numa() uses the task's sum_exec_runtime to drive periodic
scans and queues numa_work against that task and its mm.

Proxy execution runtime accounting deliberately charges sum_exec_runtime
to rq->curr rather than rq->donor. Passing the donor to task_tick_numa()
therefore drives NUMA scanning from a task whose runtime is not being
advanced by proxy execution, while the executing task's NUMA state is
not driven by the tick.

Use rq->curr when invoking task_tick_numa() so the runtime, mm and
task_work all belong to the execution context.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Hui Su <sh_def@163.com>

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..09ddb3802c28 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15043,7 +15043,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 		return;
 
 	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
+		task_tick_numa(rq, rq->curr);
 
 	task_tick_cache(rq, curr);
 
-- 
2.54.0

