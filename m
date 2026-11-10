Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.65.7.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352892;
	b=MDdhBbcbqrperZdIm+9m/OBMIkIaAz8H6qaQAwuhkmkNrayC9ngW3dISc7KW6z//5sRK
	 r93RGqHUi/rUHSI+sGyAKe9xlh9ctE+uqDGSLkVeNtb6ZISVTD8X4NKSi9jQK0EU2Mwce
	 ZYKFbCIOB7+FCUWMW/O30pUt4Vl7miRifYzKtJAPr08iUDosRHGnICasxN/bXKFDtRwN+
	 1JKmVQyIPTmsNbR4iqRt5XuhwNNf35BNcVbje/JEZYwD6W3IDCDt6b0dEMc47tOv1U4f3
	 tGp0Pd06dHQgP15SGwGopWqKL10ojPeuB+JmZ+UPgXecQ+aPPOj6CSm+pAjAUXTg+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352892;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Feedback-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-F-Verdict:X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=RZw3L21e/0rsVOZd3eQw1bN8e/rZNGp/MGHju+KSYYE=;
	b=QpOlRXyo5fFjgTUY3SZDHdVndXndD0bHxzxsYLqI7tRXiV0wlSUsjlERW1b/KgRjN8dL
	 gAM7y62Gf1NxO7zy3S8+sIP9l5SPAVbZ2Z+PwxXTP4YTBoj0QyngcMHocf2I9YRezgpu9
	 0ygd8khWCS48JHwiocC/AoXNkJ5mTZGP7POgpwIFY7GBNkhsDhlU4lRbPOb/Ej8Cf/sea
	 aQ7pXiKR/baCy0rFjlblpfEt+RfULCgLJFJESbHJmsdL5kgXYiiU/4P60bNJXQf1tDo8r
	 nuqDeQANWDRvLx6kqoZ4VhTgFQd5Xgpgw2W9ZjyeU5TW5Fohj2ezGmtuHPHtUAqjw6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=dYjDIMMj;
	arc=none smtp.remote-ip=3.65.7.70
Received: from mail30.out.titan.email (mail30.out.titan.email [3.65.7.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22227606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22227606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=dYjDIMMj
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jPN2D6TGyzBrJb;
	Tue, 10 Nov 2026 23:21:24 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..inyEBhW3B4Xog1A3._GE160RGyFAp-OFoeY8uuo32rpx-pOT6afetyWh2fg9wHNImNCExo43x_0svHpDaxUm_XEl4DRCKPXSyIvntCK1XYtS3Jl40T8nuMoFa_l0iv32q3dpRdbOMGA.4_GVos2x0yXMb2zeVniOOQ
DKIM-Signature: a=rsa-sha256; bh=RZw3L21e/0rsVOZd3eQw1bN8e/rZNGp/MGHju+KSYYE=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=subject:mime-version:from:references:to:date:message-id:in-reply-to:cc:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794352884; v=1;
	b=dYjDIMMjb0VudLDz0SHlRPAvsHwfcpeZZB+iuHZoOU0b+tggf0w1IYlSz2viq/UryiIz7XS8
	hO3JY0QQm6F3b2tB2CBs08GtH69AAWhoN2ymx2vDJvGLa5Z6ESp7fsbaQ7NXAJqWFsvu5YrrG87
	NJcO8GyK+ubE9JyrZoxcAtUA=
X-AuthUser: mgorman@techsingularity.net
Received: from morpheus.112glenside.lan (unknown [84.203.172.48])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jPN2D2X58zBrJT;
	Tue, 10 Nov 2026 23:21:24 +0000 (UTC)
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>
Subject: [PATCH 1/3] sched/rt: Do not account migrate-disabled tasks as pushable
Date: Tue, 10 Nov 2026 23:20:55 +0000
Message-ID: <20261110232057.4144723-2-mgorman@techsingularity.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110232057.4144723-1-mgorman@techsingularity.net>
References: <20261110232057.4144723-1-mgorman@techsingularity.net>
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
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794352884679860303.1930444.5240477926886348043@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af3a6f4
 a=yHdhZq8wnfzzRmla7jO6EQ==:117 a=yHdhZq8wnfzzRmla7jO6EQ==:17
 a=CEWIc4RMnpUA:10 a=R_Myd5XaAAAA:8 a=Glf531OiLhxPMAFaNzMA:9
 a=L2g4Dz8VuBQ37YGmWQah:22

Commit dae5c0292080 ("sched/rt,dl: Skip migrate-disabled tasks when
picking a push candidate") stops pick_next_pushable_task() returning a
migrate-disabled task which fixes the balancer trying to push pinned tasks
off the CPU. It notes

    The self-IPI path is closed by the rto_next_cpu() fix above, and that
    part works. But the runqueue is still marked overloaded, because the
    pinned task is still advertised as pushable. Other CPUs now send the
    push-IPIs during their own RT balancing, and the same loop runs again.
    Closing the self-IPI path did not stop a pinned task from triggering
    push balancing.

As above, the runqueue is still marked overloaded by enqueue_task_rt()
and put_prev_task_rt() even if the task is migrate-disabled. A
migrate-disabled task reaches the pushable list through enqueue_task_rt()
or put_prev_task_rt() when it is preempted, or when it wakes while
still migrate-disabled. Either path calls enqueue_pushable_task() to set
rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
useless for a condition that was detectable when placed on the pushable list.

Unfortunately, IPIs can be continually fire at the same task that cannot
move.  The problem motivating this patch was a misplaced pgrep running
at RT priority and while the pgrep can be bound to another CPU by the
application, the underlying problem was that pgrep is spinlock-intensive.

Stop adding migrate-disabled tasks to the pushable list. This is not a
heuristic as migrate-disabled tasks cannot move. Even when enabled, the
rq still has no pushable candidates until the task schedules.

Note that altering the RT class only is deliberate and deadline
is left alone. The justification for RT is eliminating ineffective
RT_PUSH_IPIs. Deadline is trickier -- it tries to push the task running
on the rq that holds an off-CPU, migrate-disabled task, so that the
migrate-disabled task can run there instead of waiting while another CPU
runs later-deadline work. The cost of that push is bounded, unlike arbitrary
IPIs, and justifiable because deadline ordering is otherwise violated.

For deadline the same two decision sites exist, and any change must update
both together.

In the specific context of put_prev_task_dl(), the task is going off-CPU
with migration disabled, so pushing the running task may take longer
than letting the running task use its budget. The problem is that the
time to migrate the running task can only be estimated but ignoring EDF
requirements is a root-domain-wide violation of deadline principles.
That is out of scope for this patch.

In the specific context of enqueue_task_dl(), it could be justified on
the basis that the task is only enqueued, not yet running. This is the
same question as put_prev_task_dl() -- honour EDF ordering or ignore it.
That is also out of scope for this patch.

Updating deadline in a similar fashion is not justified by the RT IPI
problem. It has different requirements that merit its own patch and
separate justification.

-stable warning: This patch is part of a series and applying just this
	patch on its own breaks the !RT_PUSH_IPI case.

[mgorman@techsingularity.net: deadline decision, changelog]
Signed-off-by: Yousaf Kaukab <ykaukab@suse.de>
Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
---
 kernel/sched/rt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..2587ef92efc3 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1448,7 +1448,7 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	if (task_is_blocked(p))
 		return;
 
-	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
+	if (!task_current(rq, p) && p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
 		enqueue_pushable_task(rq, p);
 }
 
@@ -1746,7 +1746,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 	 * The previous task needs to be made eligible for pushing
 	 * if it is still active
 	 */
-	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
+	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
 		enqueue_pushable_task(rq, p);
 }
 
-- 
2.55.0

