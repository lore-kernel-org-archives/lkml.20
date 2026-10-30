Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398723;
	b=wuYzeR3ROUojVNM1ramQEUUgmp8qLMnMwsaCmJ4j+WsCt8caHNxhXhIfxZWROMHxTvBW
	 KGI5oeJ23NIXYD1/K8lXY1sxmgWNHqtFx+C0x55ZeHIFt9yfeHF0j6IvoYjvZham7E0We
	 Zjzcuz+Gqri87TOYVyDYGhRlgxAvUr5CfvkkWDUdRZ7/80xiC4jPiO5szlZR2IOtAGn+i
	 oZ0xzO6EwkCoMrp6r2nEdWfbh9qZV9V2qwZGuiVd0ASfmFzZ5dhNYFGqYXvKTx0jzrU+v
	 CprQEyh5Ld09q4W6un95OvnmBFUuZsIBMG6b4GRuZiLmdfR2ajYeBuFYh2hqIvtLDIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398723;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=No0gQCPPnO85fYaY6Bc/3wJ1AALHc6MXIGM8lc1qTt0=;
	b=M603Wd0uZa9aOVW5y0++Jf+mwDDSm7uck4wQZhQM14z1Ayl1QFom3II/YdbPeaXeS3Oc
	 nrfojH83dRplwe6cQVYGZ9mIo+fPnOPSpq24RY9zceH2aT5eyS38tra4dBuI2lmwCnyhS
	 OUImCfSOTr2nSG3vmLKO+9LQmT5Rgh0dGDF4MpR2y3v48j5CIs+phK+DQgFrbqla0RY4H
	 hj91ObQ8mIM4V67wGQATqhtiahvNJGojqKoYAqqn1UuRK3N7GzDap8gnXeua5RKcFKc3d
	 lLsMfjp05v23QIk5SDj2KTTYc1QWhsDENkB6BkxahzpgYjBmgDsdNVzkk92u6V2e+TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5w5pgxY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54198606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5w5pgxY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9681F000C1;
	Fri, 30 Oct 2026 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398723;
	bh=No0gQCPPnO85fYaY6Bc/3wJ1AALHc6MXIGM8lc1qTt0=;
	h=From:To:Cc:Subject:Date;
	b=e5w5pgxYyaQq4cLAsho1uwID1c+WPP0dlQeVFoH4UDStWgFuaWQmaOFnU4HRXjk1r
	 cSF49b2hjoBy/y9C7xX9a1gliq33TY5TA+j6XYK8bnrqOLsNW9rINX3hBoBdqVuwp/
	 t5IGeV3Pg09+baHREamLnGJigraOQVFU9UHFikVuQVRRw8DDJX6y3LMimObwQMlUQK
	 25Bb0J0I9tYP4Vy9C6zsoVDjx7B9TsNHff6XHTc2AjpGcnemeWUPyLwT6PqULH015T
	 Lw6pHbcr3zgoHIsKwKU0AmN133EI8tHEPxDtfeoXrVb19mcJlrwto4Tum+5N/BCDzX
	 LlyFb8kKG6ACw==
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH sched/urgent] sched/deadline: Fix stale rq->dl_server after a server pick returns RETRY_TASK
Date: Fri, 30 Oct 2026 12:18:42 -1000
Message-ID: <20261030221842.4071610-1-tj@kernel.org>
X-Mailer: git-send-email 2.56.0
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

__pick_task_dl() records the server in rq->dl_server whenever the server's
pick returns non-NULL, RETRY_TASK included. __pick_next_task() clears
rq->dl_server at its top, but a RETRY_TASK restarts the pick below that
clear. put_prev_set_next_task() then hands the stale server to whatever the
restarted pick takes.

Since b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()"),
fair_server_pick_task() returns RETRY_TASK when the newidle balance released
the rq lock and a higher class task was enqueued meanwhile.

That task, an RT task for example, then carries the fair server in
p->dl_server until it is next put. The RV deadline monitors see the fair
server switch in with it, and core scheduling, if enabled meanwhile, treats
the task as deadline priority.

Don't record the server when its pick returns RETRY_TASK. The restarted pick
records whichever server it goes through, if any.

Verified with a synthetic reproducer.

Fixes: b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()")
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/deadline.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..cc9c7cb7dc42 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2836,6 +2836,13 @@ static struct task_struct *__pick_task_dl(struct rq *rq, struct rq_flags *rf)
 			dl_server_stop(dl_se);
 			goto again;
 		}
+		/*
+		 * RETRY_TASK restarts the pick. Don't record @dl_se, or
+		 * put_prev_set_next_task() hands it to whatever the restarted
+		 * pick takes.
+		 */
+		if (p == RETRY_TASK)
+			return p;
 		rq->dl_server = dl_se;
 	} else {
 		p = dl_task_of(dl_se);
-- 
2.56.0

