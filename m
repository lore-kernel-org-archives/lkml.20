Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705271;
	b=WrzOZfDouOB2sYug/ibYtotqDZzjvZ3h8Sh9sBIIIN0QxrLLK4RB08o7IfVKUuB3PPb/
	 W9z5SyMd9fk9Lc+jMThtI5S/bQbnLR6eQuREWBGqx/cDEzWH60bDUjYRx/z7WLFBKSqjo
	 6sHtPMkVxsaZsUMIgxoaw2EpLpy1hIrsr15wFN2iga72u4WBMxXAuzqVjr9k85InLsEMQ
	 r4TIwPgZ/x/w2wSwWrSr7bmzLcvqvFKrVdUSJ2OrvazvXgBGKDWTyOR5BvzXZUdkFwMSn
	 qQ2eXZ6UQr1aofFzaQO+oimwwayckGYLB1eorh0V94ecZ0rbmUeBEybtUm2JY+MjWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705271;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=qIse5j0BoeVrhZs95x7Ls5UkUaHKKKFA78Ztpx/+YnI=;
	b=BI63zl80K7X1oeVN3jX521pNax9GS2Sj4+fw9cT1qQauJQwHDHdT5onI7KCtxCh55i13
	 etUuH3SLSmcQkumzVBcz/Z+lK31H1D21Q59Xg4IGW5T2GScBvrkGMkGN9w7Rwjk4EJwXP
	 c11YO9eNhZ7KhJkWm/TEeGlb3XvUWSppPhdsrYXx64Hy/1acWqg2CpMSn/SnauizMErA1
	 u54aWmTgSpyev3oXyiX8HOdxUhLTQOJBL07CzcAJeVIkiJ1oILdlDMlJAtbRzBX6a2o5Q
	 tpt/xRtYOuxJ3SP9OSSiunQbjjo4DESkDMfGuHX2rYzD8CQt4RS/KJft3pWifQ5+4Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6zSzkJQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EA606C5B4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838EA606C5B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6zSzkJQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIse5j0BoeVrhZs95x7Ls5UkUaHKKKFA78Ztpx/+YnI=;
	b=X6zSzkJQI5uHRBXCA/KuVjqaXVZzl49c1t+n4lQMI6m5qbhrTzbDy88lKbRcaCyLoSqKpB
	5OYh6GZzZEwgbFSumvtgpC3Q4xldG+ylv0y1QFdVDuEP8bwCtVmgwREy2j2dZa0UVz0PiQ
	/HXjceNBpgFeE2V4qgUagX/ncyyeagk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-fTYeUVGiNPmWKZ9VD_ET3g-1; Tue,
 03 Nov 2026 06:27:44 -0500
X-MC-Unique: fTYeUVGiNPmWKZ9VD_ET3g-1
X-Mimecast-MFC-AGG-ID: fTYeUVGiNPmWKZ9VD_ET3g_1793705262
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 418AD180134A;
	Tue,  3 Nov 2026 11:27:42 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 707C97E9;
	Tue,  3 Nov 2026 11:27:38 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Tue, 03 Nov 2026 12:26:30 +0100
Subject: [PATCH 2/4] sched/deadline: Fix total_bw leak when switching away
 from SCHED_DEADLINE while !queued
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-sched-dl-bw-fixes-v1-2-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Luca Abeni <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
 Weiheng Qiu <weihengqiuu@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
 Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793705249; l=2974;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=9ZjbnDQ2DWHVCGIdzJ2M9KOc33pIhqB/QhNYdi3pZQU=;
 b=5nrHzPerxNfrvHciRtFcZB8PQXRl7ChdFaBJF6f7XhwvVKR2Ir3qtjFZtxAaGN9La/bsatAjV
 FoHnV6RAf9bBU/hGaqsDclCMdaW1FpVVz2CihmDuOvm4P9GeiNlAu0l
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When a SCHED_DEADLINE task is switched to another policy while it is not
queued (sleeping or stopped), its bandwidth leaks in the root domain's
total_bw. The leak happens because:

 - switched_from_dl() only calls task_non_contending() for queued tasks.

 - For non-queued tasks, it subtracts running_bw and rq_bw, but never
   releases total_bw from the root domain's dl_bw.

 - The inactive timer is the only path that calls __dl_sub() to release
   total_bw, but it is either not armed (the task never ran as DEADLINE)
   or already fired while the task was still DEADLINE (only dropping
   running_bw at that time).

Repeating this fills total_bw up to the admission cap, after which
sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY.

Fix this by releasing total_bw directly in switched_from_dl() when the
task is not queued and dl_non_contending is not set (meaning no pending
inactive timer will handle it).

Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
Reported-by: Tejun Heo <tj@kernel.org>
Closes: https://lore.kernel.org/all/2b5fb3f22bca6aa383be8f4781923392@kernel.org/
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/deadline.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 68019dafbaf18..963fda6ddb7f6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3547,14 +3547,32 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
 	dec_dl_tasks_cs(p);
 
 	if (!task_on_rq_queued(p)) {
-		/*
-		 * Inactive timer is armed. However, p is leaving DEADLINE and
-		 * might migrate away from this rq while continuing to run on
-		 * some other class. We need to remove its contribution from
-		 * this rq running_bw now, or sub_rq_bw (below) will complain.
-		 */
-		if (p->dl.dl_non_contending)
+		if (p->dl.dl_non_contending) {
+			/*
+			 * Inactive timer is armed. However, p is leaving
+			 * DEADLINE and might migrate away from this rq while
+			 * continuing to run on some other class. We need to
+			 * remove its contribution from this rq running_bw now,
+			 * or sub_rq_bw (below) will complain.
+			 *
+			 * inactive_task_timer() will find !dl_task(p) and
+			 * release total_bw via __dl_sub().
+			 */
 			sub_running_bw(&p->dl, &rq->dl);
+		} else {
+			/*
+			 * No pending inactive timer: the task never ran as
+			 * DEADLINE or the timer already fired while still
+			 * DEADLINE (only dropping running_bw at that time).
+			 * Nobody else will release total_bw, do it now.
+			 */
+			unsigned int cpu = dl_task_root_domain_cpu(p);
+			struct dl_bw *dl_b = &cpu_rq(cpu)->rd->dl_bw;
+
+			raw_spin_lock(&dl_b->lock);
+			__dl_sub(dl_b, p->dl.dl_bw, dl_bw_cpus(cpu));
+			raw_spin_unlock(&dl_b->lock);
+		}
 		sub_rq_bw(&p->dl, &rq->dl);
 	}
 

-- 
2.56.0

