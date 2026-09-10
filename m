Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEB3DD87B;
	Thu, 10 Sep 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030931; cv=none; b=P8cnEyG7n2wcZ5kcP/+UmGbvJylvVu4bjAhyKYPiY2jWINF5R3OM0CigzvjPzT04b7sxJXxH4Qtc2+T7pBIF1AkStqIDZsiDg/twM+G6fkHdu1tXWesS9ZfGe3njJ8WkJqbJlGY3Anu1MkWcvS/KNEeipOEoPlDJX7LzWzE2iTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030931; c=relaxed/simple;
	bh=8Qy0HMfs6hxeSy2n5VUZxPBYxcDI72+8Ud1GnGdV8FA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RhHgl7LGDND/Zyz9tDU+baFvTcp5UvfILIAGjf53tPYr+ZlBcMncvDHPKvg7W7rYBHTiK3TIilNjotb37xzWuOjQAHtIp9TVXUOneAwoXjl8v4XNReZRxDM+j0OjrZMzFmTBIZtTkTqOP7Uil9yZWLK7k+CWWIDremHppEGas1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jmBfBIBI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EFbhtCMR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jmBfBIBI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EFbhtCMR"
Date: Thu, 10 Sep 2026 09:02:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030926;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yytr8lHCBN0CZQHPEBbPDXj0WwKTxwR7N/R/MXuKQ4E=;
	b=jmBfBIBIRxqQe2U/mkmsyu/6+Sm3NkuLSAIGDG/vyVg2LDt3JcV9SLUhRhiqwkhD7J8doG
	0yuXM9KclkMQnomlOzDHk7jCmTRY3QfKGuXEyd32XDm70LxSvYxbnsyezBm7/TtqKo5WnK
	7/y7cRWXgp8UJi488ca92pvO3mX+FiRq/tY0Dek1fuLDYXl/9c+FJpfw8u/WKi5SnCdkn0
	ul+SA7MAnfKSq27s3j25x0kD6n1/gnwUnwlWq9eZYO5unozp1O5P1D58Igx4jiitf1Del9
	U8L30tP1hFHvMJm+/DzvRovgoccFcgXc4bA7TyBIX7GVidtyKo+ggWLnn3pKRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030926;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yytr8lHCBN0CZQHPEBbPDXj0WwKTxwR7N/R/MXuKQ4E=;
	b=EFbhtCMRSIuX7d1ENOi85OtxR6ISF1fMDgmkh3mV4SVdz1/yMvndbfu/+YgBSNW7MW9t0u
	ACmrBYD4OWxVLSAA==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched: Account cgroup CPU time to the execution context
Cc: Tejun Heo <tj@kernel.org>, Hui Su <sh_def@163.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904034707.268416-1-sh_def@163.com>
References: <20260904034707.268416-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903092448.623050.5657792086283390932.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     c23810313bdf6b02f39a1f2a1464c4b18bd39e31
Gitweb:        https://git.kernel.org/tip/c23810313bdf6b02f39a1f2a1464c4b18bd=
39e31
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Fri, 04 Sep 2026 11:47:07 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:52 +02:00

sched: Account cgroup CPU time to the execution context

Proxy execution separates the scheduling context from the execution
context. Commit aa4f74dfd42b ("sched: Fix runtime accounting w/ split
exec & sched contexts") made per-task and thread-group runtime
accounting follow the task that actually executes, while cgroup CPU
usage is charged to the donor.

When the donor and execution task belong to different cgroups, this
makes a task's execution time count against a different cgroup from the
one the task belongs to.

Cgroup CPU usage should follow the execution context, matching the
per-task, thread-group, and cgroup user/system accounting. Keep
scheduling state associated with the donor, but charge cgroup CPU
usage to rq->curr.

A reproducer with the donor and execution task in separate cgroups
showed the execution task accumulating runtime while cgroup CPU usage
was charged to the donor's cgroup. With this change, the execution
task's cgroup accumulates the CPU usage instead. The same behavior was
verified with an RT donor and with legacy cpuacct accounting.

Fixes: aa4f74dfd42b ("sched: Fix runtime accounting w/ split exec & sched con=
texts")
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Tejun Heo <tj@kernel.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260904034707.268416-1-sh_def@163.com
---
 kernel/sched/fair.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 944833e..7455a83 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1414,7 +1414,6 @@ static s64 update_se(struct rq *rq, struct sched_entity=
 *se)
=20
 	se->exec_start =3D now;
 	if (entity_is_task(se)) {
-		struct task_struct *donor =3D task_of(se);
 		struct task_struct *running =3D rq->curr;
 		/*
 		 * If se is a task, we account the time against the running
@@ -1427,8 +1426,7 @@ static s64 update_se(struct rq *rq, struct sched_entity=
 *se)
 		account_group_exec_runtime(running, delta_exec);
 		account_mm_sched(rq, running, delta_exec);
=20
-		/* cgroup time is always accounted against the donor */
-		cgroup_account_cputime(donor, delta_exec);
+		cgroup_account_cputime(running, delta_exec);
 	} else {
 		/* If not task, account the time against donor se  */
 		se->sum_exec_runtime +=3D delta_exec;
