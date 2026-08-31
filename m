Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5142E8F4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198057; cv=none; b=OX7fqQndE5hJhkYVZT/I4bMvZ7mvNwLoVId4/wTZBc+Af9+2LDjvOKl3/7nQRuP4ZOyxTU8GmJN6ZOj0qPDfNgopHkEnNJGRR+BV7CEwq9Ob/By3mAgASwRPrs1JhGR1J7ZcEtfyAao43x5sgf6gtWoNCwkrVXW2k3BVKhZS488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198057; c=relaxed/simple;
	bh=W+5yEh6TSCY7ZDVufia/DtGrIF35LnEBawW8VPTEAQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nrlKf0/ITDxbsXLd6t2zetsaBNiUYbZUIr1umYnWPQyxHkJxHda8u6MITvLSELsb5k69w3HMhLGw5BQ3lVEJwutiDPkkfPFHcqGu2I5A9dFO5kaVY0NZVpV+ufhCRSSfpT0boMXAYGoOvs8g9ZjL8BkuqyhulhP/jw/ngU7MkfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bufPFW6f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bufPFW6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788198056; x=1819734056;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=W+5yEh6TSCY7ZDVufia/DtGrIF35LnEBawW8VPTEAQg=;
  b=bufPFW6fiNuyg9HjccN4FpyX6MCVvzk1Cgt4L+8OUlpsxgPnal7UTOKi
   KXP7mR8S7IHHUYSUUbYxjJjS9iG1FayyvQLwxKbgzTyDYUu/ohlYQku+I
   ULweYcFVxkBG8RsljiMzVwDyYmImjjI7zstwuxn1pJ9mudO2TwjtnrhYz
   hA6rivTlscdzo/bWA1Fk7AC8taIEJ/8LdcZfTnfgDYDEheRhTA0Q77Ykx
   McGdiaWY+lr8oqcIAwaOIpiSGwA0u2BovmELAGTgWLBfk5M1bsrReYHFz
   ddI1cblcabjSnoh79/HsSyVpe99FN8qf2S67WbJKjHaMMIoMyCqb5msff
   A==;
X-CSE-ConnectionGUID: mUvu1VWfR7uON1qXCcQOhg==
X-CSE-MsgGUID: qe+ej/mXTDaZHte7hkJ2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92299554"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92299554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:40:55 -0700
X-CSE-ConnectionGUID: c4BAr9avSE6v/n3YaAu2DA==
X-CSE-MsgGUID: BdgJANxbQ0S/p8eyWvX6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="292353573"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:40:54 -0700
Message-ID: <edbb2503d554c63dc9b72e201fb4a17e1cb119e7.camel@linux.intel.com>
Subject: Re: [PATCH] sched/fair: avoid creating misfits during cache-aware
 balancing
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
 Chen Yu <yu.c.chen@intel.com>, Ricardo Neri <ricardo.neri@intel.com>,  Len
 Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
 linux-kernel@vger.kernel.org,  Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>
Date: Mon, 31 Aug 2026 10:40:53 -0700
In-Reply-To: <20260831084149.GG4120091@noisy.programming.kicks-ass.net>
References: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
	 <20260831084149.GG4120091@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 10:41 +0200, Peter Zijlstra wrote:
> On Tue, Aug 25, 2026 at 10:41:12AM -0700, Tim Chen wrote:
> > Cache-aware load balancing biases tasks toward their preferred LLC. On
> > asymmetric CPU capacity systems (e.g. big.LITTLE) the destination LLC m=
ay
> > contain CPUs that are too small to run the task. Pulling the task there
> > turns it into a misfit, trading a cache-locality gain for a capacity lo=
ss
> > that's more detrimental to performance.
> >=20
> > Guard both cache-aware migration entry points against this:
> >=20
> >  - can_migrate_llc_task(): forbid the LLC migration when the task fits =
its
> >    source CPU but would not fit the destination CPU.
> >  - alb_break_llc(): veto the active balance under the same condition so=
 the
> >    runnable task is not pushed onto a CPU that cannot accommodate it.
> >=20
> > Both checks are gated with checks for hybrid processors, so symmetric
> > systems are unaffected. Tasks that already do not fit their source CPU
> > are left to the existing LLC policy, since the move cannot make their
> > fitness worse (this also preserves misfit up-migration to bigger CPUs).
> >=20
> > Additionally, if there are misfit tasks found in the load balancing
> > classification phase, prioritize misfit task migrations
> > over LLC load aggregation on asymmetric systems. A better fitting
> > CPU will boost performance more than better cache locality.
> >=20
> > Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Tested-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Reviewed-by: Chen Yu <yu.c.chen@intel.com>
>=20
> Tim sends patch, Tim adds SoB, yes?
>=20
> Also, we start $subject with capital after subsystem: part.

Here is the patch updated with the fixes.

Thanks.

Tim

---

From d28acbf5a7f30125a7f15d85bf77b8e4b6e8bfc5 Mon Sep 17 00:00:00 2001
Message-Id: <d28acbf5a7f30125a7f15d85bf77b8e4b6e8bfc5.1788198279.git.tim.c.=
chen@linux.intel.com>
From: Tim Chen <tim.c.chen@linux.intel.com>
Date: Wed, 19 Aug 2026 13:03:56 -0700
Subject: [PATCH] sched/fair: Avoid creating misfits during cache-aware
 balancing
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Vincent Guittot <vincent.guit=
tot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Ricardo Neri <ricardo.neri@=
intel.com>, Len Brown <len.brown@intel.com>,
Aubrey Li <aubrey.li@intel.com>, linux-kernel@vger.kernel.org

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
---
 kernel/sched/fair.c | 50 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..cf5c022bbd55 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10691,17 +10691,40 @@ static enum llc_mig can_migrate_llc(int src_cpu, =
int dst_cpu,
 	return mig_llc;
 }
=20
+static inline bool task_misfits_asym_cpu(struct lb_env *env, struct task_s=
truct *p)
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
@@ -10805,8 +10837,7 @@ static bool migrate_degrades_llc(struct task_struct=
 *p, struct lb_env *env)
 	    READ_ONCE(p->preferred_llc) !=3D llc_id(env->dst_cpu))
 		return true;
=20
-	if (can_migrate_llc_task(env->src_cpu,
-				 env->dst_cpu, p) !=3D mig_forbid)
+	if (can_migrate_llc_task(env, p) !=3D mig_forbid)
 		return false;
=20
 	return true;
@@ -11869,6 +11900,15 @@ static inline bool llc_balance(struct lb_env *env,=
 struct sg_lb_stats *sgs,
 	if (env->sd->flags & SD_SHARE_LLC)
 		return false;
=20
+	/*
+	 * On asymmetric domains, group_misfit_task_load
+	 * should be prioritized to move tasks to CPU that fit them
+	 * over aggregating tasks to their preferred LLC.
+	 */
+	if ((env->sd->flags & SD_ASYM_CPUCAPACITY) &&
+	    sgs->group_misfit_task_load)
+		return false;
+
 	/*
 	 * Skip cache aware tagging if nr_balanced_failed is sufficiently high.
 	 * Threshold of cache_nice_tries is set to 1 higher than nr_balance_faile=
d
--=20
2.32.0

