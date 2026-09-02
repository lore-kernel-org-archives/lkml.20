Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BAE46D570
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348419; cv=none; b=Sv1TxdRVeCDWnXID99dRfEDLhtrwgt/gxX7ubRS3KeHIPw+RK2p1gAhexKX4mbIEu350sdoLkyCSmr9YrCTGoP7uC1DNgLR1wqi7hw2n8HsFNwsunYbkkDpCRwcKuVWcUU+IZZx/by6THSaayJleU6qQuJPG/sUu06rYaYamZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348419; c=relaxed/simple;
	bh=R99blkJ0BdN4HbZjowWx6fI1h7ps3V8oh+MSsd1Fwfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jncCXCsM/rYw5vIv1ai1NJ0WIoizA0DOqlZ23FJ7vwXxivWqCMbrzHWug0rrn4BtTgjFhYhuvsPoZdY14Pm1En53atRm1c4gLRve8jpmI+1knei6ublpNoMOrSwsqPDoAfKfmvDcQoJj2/q2v1q1GkECBwedEyBPZY5HLb2FXwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YptHwRGR; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YptHwRGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dy
	/VpdoAJJuABggCpD8DaFybP1TUbiVgCdsTwtVmkL8=; b=YptHwRGRdxZrwAl555
	34u//tVteZfK2S6YGNpTFpkBWVCFF3vt3grqwII/iPQ61SUEIX76L/6GfnAK8gwR
	PD3HdQUB95ypEyXZ8gQlmlLxNPZonKuBEj1qPv0hTyrS1Ixm7wyaZx89yFB2aGd7
	VKpF83vGcQflImO4ZRdr8IF1M=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3n3mzB5hqCTZ9AA--.19778S2;
	Wed, 02 Sep 2026 19:25:40 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	jstultz@google.com,
	connoro@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: fix task_sched_runtime() for proxy execution
Date: Wed,  2 Sep 2026 19:25:39 +0800
Message-ID: <20260902112539.879979-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n3mzB5hqCTZ9AA--.19778S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zry5Wr4fJr4fCF48tr1DJrb_yoW8uw4UpF
	WDZFW3tw48ta43KF1qy39rW3yrG39xG3W2grWktayfZrWFq3WrKryYqw1YqF4jyr1SkFWa
	vrya9393CayjyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDMa5UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RSvD2qYB7Q-AQAA3i

With proxy execution, rq->donor is the scheduling context while
rq->curr is the execution context. Runtime accounting charges
sum_exec_runtime to rq->curr, while scheduler-side accounting is
charged to rq->donor.

task_sched_runtime() currently flushes pending runtime only when the
queried task is rq->donor. As a result, when a mutex owner is being
proxy-executed, it is rq->curr but not rq->donor, and its pending
sum_exec_runtime is not flushed before being returned. CPUCLOCK_SCHED
reads can therefore observe stale runtime until the next scheduler
accounting event.

Check whether the queried task is the current execution context instead.
The update itself must still be performed through rq->donor->sched_class,
as the scheduling state belongs to the donor. This is particularly
important when the donor and execution context belong to different
scheduling classes.

When rq->donor == rq->curr, the behavior is unchanged.

Tested with both RT and fair donors proxy-executing a fair mutex owner.
Before the change, CPUCLOCK_SCHED reads repeatedly returned unchanged
runtime during confirmed proxy-execution windows. After the change, no
stale reads were observed. The non-proxy control case was unchanged.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..83a82a4d1087 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5706,10 +5706,10 @@ unsigned long long task_sched_runtime(struct task_struct *p)
 	 * project cycles that may never be accounted to this
 	 * thread, breaking clock_gettime().
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
2.54.0

