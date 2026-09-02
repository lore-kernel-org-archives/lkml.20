Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A24377A87;
	Wed,  2 Sep 2026 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333727; cv=none; b=HAb8DWT7zMrSPw2rwb77XrSDKGEukzQNk2p0aZODRcDIDhDBS/suIo7gp/oNrqTlLfuNJLpqTJQAkoTnqMkr+PSLBHS1KAzWfLBz51jpcTjfwVVQMCjrqql/THOYCM9FOpZYDpJm/9iVP/aKvlrtoifFtXMgr+F5nBv6RKs4YEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333727; c=relaxed/simple;
	bh=OIQ0hICKlEsNmdAV5Ztm6aLSvMFmnjoxvketpm/ti/g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tEK+LBDNcl2oIWWGv9Fb15VoqRLXTOLQfUgdNLMWpa9hfdrX+5s5x3OOYFi9N8yWwFk6vfNX4gBfAJsW4kmP+qCcY4EH3H7kt62SOvzQ8ubAD7OOvbKiXYlisOZUo9cAci6rH0TDwog+TTqm/PrxhM1euUL7Wbxt2v1vAcwlzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=baAsyASI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5RMYcGwx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="baAsyASI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5RMYcGwx"
Date: Wed, 02 Sep 2026 07:21:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333717;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvyzEd4LrZlxwh0j9vEYD1BfnTs+AHtcjPcxpHrAsFc=;
	b=baAsyASIsehwJlYhX606XK8hxJmDMYUWbh068rM9x+mqBTAjc+/Vw0ORTfUoReUMvZoOLh
	lnc7OQWV8Dy6QCG3+BZxWMO+JUybBP1o39Xvird86qRhsAU2w1ri4ygWAY53mpo8+IMRRK
	9i5giKr3S5tZ0QMNJ39pdYzIPtb1aSPPdNiTdt8OiItQ7odDm24e3mojwlxl4TOuRuvAaR
	bg2ckPS1B6UoNkd/lgTrkRp8418e2qzF7h0MHBf7p/UR+sX/U6dirdnvf78EI35onBTHSF
	72InU99ZjQmXUbu+x6E85ViDVDS6q1YV8DAnKZjrFulGLf/S2ZgMkX1/BeZKMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333717;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvyzEd4LrZlxwh0j9vEYD1BfnTs+AHtcjPcxpHrAsFc=;
	b=5RMYcGwxQLaSMTI/aNOwbDULty4fT7aabvwAje7x8EfVqi6SLRgF2OLPo/nALQlVsQdU2r
	sAJWig5CMHUx5zAQ==
From: "tip-bot2 for Tim Chen" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Avoid creating misfits during
 cache-aware balancing
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Chen Yu <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <edbb2503d554c63dc9b72e201fb4a17e1cb119e7.camel@linux.intel.com>
References: <edbb2503d554c63dc9b72e201fb4a17e1cb119e7.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833371591.3717435.12313738810106701533.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     f0d243a96f2684ad771d678767d17972cf840bd7
Gitweb:        https://git.kernel.org/tip/f0d243a96f2684ad771d678767d17972cf8=
40bd7
Author:        Tim Chen <tim.c.chen@linux.intel.com>
AuthorDate:    Mon, 31 Aug 2026 10:40:53 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:50 +02:00

sched/fair: Avoid creating misfits during cache-aware balancing

Cache-aware load balancing biases tasks toward their preferred LLC. On
asymmetric CPU capacity systems (e.g. big.LITTLE) the destination LLC may
contain CPUs that are too small to run the task. Pulling the task there
turns it into a misfit, trading a cache-locality gain for a capacity loss
that's more detrimental to performance.

Guard both cache-aware migration entry points against this:

 - can_migrate_llc_task(): forbid the LLC migration when the task fits its
   source CPU but would not fit the destination CPU.
 - alb_break_llc(): veto the active balance under the same condition so the
   runnable task is not pushed onto a CPU that cannot accommodate it.

Both checks are gated with checks for hybrid processors, so symmetric
systems are unaffected. Tasks that already do not fit their source CPU
are left to the existing LLC policy, since the move cannot make their
fitness worse (this also preserves misfit up-migration to bigger CPUs).

Additionally, if there are misfit tasks found in the load balancing
classification phase, prioritize misfit task migrations
over LLC load aggregation on asymmetric systems. A better fitting
CPU will boost performance more than better cache locality.

Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Tested-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/edbb2503d554c63dc9b72e201fb4a17e1cb119e7.camel=
@linux.intel.com
---
 kernel/sched/fair.c | 50 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 97021a5..ade1ece 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10691,17 +10691,40 @@ static enum llc_mig can_migrate_llc(int src_cpu, in=
t dst_cpu,
 	return mig_llc;
 }
=20
+static inline bool task_misfits_asym_cpu(struct lb_env *env, struct task_str=
uct *p)
+{
+	/*
+	 * On asymmetric CPU capacity domains, do not let cache-aware
+	 * balancing pull the task onto a destination CPU that cannot
+	 * accommodate it. Doing so would turn the task into a misfit on
+	 * the destination, trading a cache-locality gain for a capacity
+	 * loss. If the task already does not fit its source CPU, the move
+	 * cannot make things worse, so let the LLC preference decide.
+	 */
+	if ((env->sd->flags & SD_ASYM_CPUCAPACITY) && p &&
+	    !task_fits_cpu(p, env->dst_cpu) &&
+	    task_fits_cpu(p, env->src_cpu))
+		return true;
+
+	return false;
+}
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
  */
-static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
+static enum llc_mig can_migrate_llc_task(struct lb_env *env,
 					 struct task_struct *p)
 {
 	struct mm_struct *mm;
 	bool to_pref;
-	int cpu;
+	int cpu, src_cpu, dst_cpu;
+
+	if (task_misfits_asym_cpu(env, p))
+		return mig_forbid;
=20
+	src_cpu =3D env->src_cpu;
+	dst_cpu =3D env->dst_cpu;
 	mm =3D p->mm;
 	if (!mm)
 		return mig_unrestricted;
@@ -10758,6 +10781,14 @@ alb_break_llc(struct lb_env *env)
 		unsigned long util =3D 0;
 		struct task_struct *cur;
=20
+		/*
+		 * Migrating misfit tasks from current CPU
+		 * to CPU with a better fit.
+		 * Prioritize that over LLC preference.
+		 */
+		if (env->migration_type =3D=3D migrate_misfit)
+			return false;
+
 		if (env->src_rq->nr_running <=3D 1)
 			return true;
=20
@@ -10765,7 +10796,8 @@ alb_break_llc(struct lb_env *env)
 		if (cur && cur->sched_class =3D=3D &fair_sched_class)
 			util =3D task_util(cur);
=20
-		if (can_migrate_llc(env->src_cpu, env->dst_cpu,
+		if (task_misfits_asym_cpu(env, cur) ||
+		    can_migrate_llc(env->src_cpu, env->dst_cpu,
 				    util, false) =3D=3D mig_forbid)
 			return true;
 	}
@@ -10805,8 +10837,7 @@ static bool migrate_degrades_llc(struct task_struct *=
p, struct lb_env *env)
 	    READ_ONCE(p->preferred_llc) !=3D llc_id(env->dst_cpu))
 		return true;
=20
-	if (can_migrate_llc_task(env->src_cpu,
-				 env->dst_cpu, p) !=3D mig_forbid)
+	if (can_migrate_llc_task(env, p) !=3D mig_forbid)
 		return false;
=20
 	return true;
@@ -11870,6 +11901,15 @@ static inline bool llc_balance(struct lb_env *env, s=
truct sg_lb_stats *sgs,
 		return false;
=20
 	/*
+	 * On asymmetric domains, group_misfit_task_load
+	 * should be prioritized to move tasks to CPU that fit them
+	 * over aggregating tasks to their preferred LLC.
+	 */
+	if ((env->sd->flags & SD_ASYM_CPUCAPACITY) &&
+	    sgs->group_misfit_task_load)
+		return false;
+
+	/*
 	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
 	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_failed
 	 * to avoid excessive task migration at the same time.
