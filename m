Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CC456296;
	Mon, 28 Sep 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578889; cv=none; b=REATvkaYxTZifwJWR5jFnpncSTbaU9EDwZVqWbU0kiK3Tb3Jetj28jCXrO+Tbiv1RHwZFhlruOULbkdWf5Gqr5DJxeRbJuVv2vqgAV6XN1N+2zs1RqUo3uV1lAIFxtHSlu0+JSSFMG/6k7IfNBeiC2Xi+HpRLOZj48kfoci2sOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578889; c=relaxed/simple;
	bh=SkNc/LFqeskQIcgk+zG6fRu/vx977CIdCt+xwb8TlTU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ctTXj/vwdCLyvmPmOBn47/B5HFNlvkeGfvt7/ivzoMTeiukMoK0LnWWm+r15JypBxTWU1h8vNGEpjOt0vyJau3d9cY4tTTx7iw5P03LEgP8qfd00iH1Ndzf9fCmjI0EnFG8l66nR7m5JL+6jvha2QLbuCoSjgHJ2lXaoVNRSDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b/IYo7su; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7xyl0q0p; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b/IYo7su";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7xyl0q0p"
Date: Mon, 28 Sep 2026 07:01:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578886;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXX5z+Zq+51Cd/BY/JYfrXcJAbpX8/ARXZwuj5XwH1g=;
	b=b/IYo7suB5s0nPFBsNVtrLwXtJa42eH1XaBnZuZof+HgFtedyj+dS6ecOe022KHcBjbvir
	pRYgVhnLv85HUOkPPvFe+4XMkAT/pV52L9uem1S9PK9KRgVHGvr3OtZDE1ePhyH00bdp8n
	tBveSmVopLc5LUxbleVJW3KKoWXf5P2EosFPVDA/3mPH/96ZwN00Vvju5wyZcL+sgpyYEE
	O2YklRzAXNyuDJex/O7sE+/tMKTWJt2IIMWpZwB+DBA2weHSEMVRlkRTu+TZ6xnnrChmBM
	ssQ/SPECz3Hyp9Wl4cL5QCiu4mlAZWqJqb0B/E/XCoDr5ydIEl/b96dd9Ke7Ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578886;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXX5z+Zq+51Cd/BY/JYfrXcJAbpX8/ARXZwuj5XwH1g=;
	b=7xyl0q0pRqdNnUNUX0l8vGBM5j3pNEcRrQFpOCu4NJbcl4vUcUPAA3l4x8+KEm28ABFZwC
	anXg1GGu1rp0ekBg==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Try to use a preferred CPU in is_cpu_allowed
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-7-sshegde@linux.ibm.com>
References: <20260928053728.797539-7-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888428.3910103.13123130766597438434.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     d8a3da0de8433d494db1ff5ec541559c764da4ab
Gitweb:        https://git.kernel.org/tip/d8a3da0de8433d494db1ff5ec541559c764=
da4ab
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:21 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:41 +02:00

sched/core: Try to use a preferred CPU in is_cpu_allowed

When possible, try to choose a preferred CPU.

This is essential to maintain user affinities when preferred
CPUs change. A task pinned on a non-preferred CPU should continue
to run there, since this is a non-user triggered event.

If a CPU is non-preferred and the task can run on other CPUs which are
currently preferred, then choose a preferred CPU instead.
This is decided by checking if cpus_ptr, cpu_preferred_mask and
task possible CPUs intersect or not. If yes, then the task has
other preferred CPUs. This takes care of tasks with architecture-specific
CPU masks (e.g., 32-bit tasks on arm64).

The push task mechanism uses a stopper thread which calls
select_fallback_rq() and uses this mechanism to pick a preferred CPU.

This takes care of the wakeup path for FAIR tasks too.
is_cpu_allowed() is called to ensure wakeups happen on preferred CPUs.
With that, additional checks in available_idle_cpu() are not necessary.

Ignore the preferred CPU state if a task's affinity is changing and
its new mask no longer includes the CPU it is currently running on.
This ensures migration_cpu_stop() does not abort, preventing the task
from being stranded outside its allowed affinity.

For the majority of cases, this would still keep select_fallback_rq()
as O(N). cpumask_intersects_and(), which is O(N), is called only if
!cpu_preferred. The task running there is expected to move out.
Subsequently, it should run on a preferred CPU. This becomes O(N**2)
only for tasks pinned solely to non-preferred CPUs. That is a rare case.

Overhead is minimal when the CPU is preferred.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-7-sshegde@linux.ibm.com
---
 kernel/sched/core.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d4edee7..d095fb1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2511,6 +2511,24 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
 	return rq->nr_pinned;
 }
=20
+static inline bool task_can_migrate_to_preferred(struct task_struct *p, int =
cpu)
+{
+	/* No need to migrate from a preferred CPU */
+	if (cpu_preferred(cpu))
+		return false;
+
+	/* Only FAIR tasks honor preferred CPU state */
+	if (unlikely(p->sched_class !=3D &fair_sched_class))
+		return false;
+
+	/* Ignore preferred state if task affinity is changing */
+	if (unlikely(!cpumask_test_cpu(task_cpu(p), p->cpus_ptr)))
+		return false;
+
+	return cpumask_intersects_and(p->cpus_ptr, cpu_preferred_mask,
+				      task_cpu_possible_mask(p));
+}
+
 /*
  * Per-CPU kthreads are allowed to run on !active && online CPUs, see
  * __set_cpus_allowed_ptr() and select_fallback_rq().
@@ -2526,8 +2544,12 @@ static inline bool is_cpu_allowed(struct task_struct *=
p, int cpu)
 		return cpu_online(cpu);
=20
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
+	if (!(p->flags & PF_KTHREAD)) {
+		/* Try to use preferred CPU if task's affinity allows */
+		if (task_can_migrate_to_preferred(p, cpu))
+			return false;
 		return cpu_active(cpu);
+	}
=20
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2537,7 +2559,11 @@ static inline bool is_cpu_allowed(struct task_struct *=
p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
=20
-	/* But are allowed during online. */
+	/* Try to keep unbound kthreads on a preferred CPU if possible. */
+	if (task_can_migrate_to_preferred(p, cpu))
+		return false;
+
+	/* Otherwise, they are allowed to run on online CPU. */
 	return cpu_online(cpu);
 }
=20
