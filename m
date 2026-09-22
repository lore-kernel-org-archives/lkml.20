Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A15304CA;
	Tue, 22 Sep 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070422; cv=none; b=qbMQdK46NEUHRsMVRDHF6blBXbNFFrJrKFGaEnvg7uTY7xlsur3HGK+qRZLRD3gUctHbHdXqMTl2xY6HdBb1IgjJBnC74OX5dTn+qWkbg7UExQgY9kmqbC5v73LbMpSy8zbSG8FN+luTSDHIUP4mXEbdEhgnY+5wSLEZNYSW+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070422; c=relaxed/simple;
	bh=Ncgw3qfnRn08RCIKlhAVXkP3fjuzxbdP7hZfgqqIA74=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=EGckZ1xvS0J7zv0CJIUmQzhZuP9wuxr6vsatX0Rsxu9bcxrxOU8TrUdnutjtYFBHK4SQXHanhI4A9ybm08zWWn2JU6VSG4HJNzMVYSBsMqvkE211DKqFHt9DPrcX+PVfHp5DUvcNyjH3oex9wE5B7CoqCGy/ImK4sdeogBXyxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cUpTPsJV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NC4Fs6Ml; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cUpTPsJV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NC4Fs6Ml"
Date: Tue, 22 Sep 2026 09:46:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070418;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eB3pgJ8yM+iPuPVCUnvj8n+wVSnRvwv01aYQERJe3N4=;
	b=cUpTPsJVDb7hMI7v2uwzbr9dhsajevjY7n/bwv9MTmgIhMV2bfp0MQwHUI+aIGYsq5DyG1
	S83WAuoLyP69BnTJsRRzO7fIYloO3GSHdLqb0JbjxOQNmo+7QiYY5YZDECNIpwIQi/5MSD
	Pz6L7vLg/FRmxGXPcO4RIy3sd9kCiMSyjYL3bKTErjr5AGutVvtf4PSFxGvMxY3gfYWBNv
	+IymK8XSefJ3refTvxiLNqE4nvfsidnPwFneph7MmPNKGFFCw6hw8hQJuER3OZM1fQcP7/
	3OykvSXUK9z095tQdso6tlyOT/RH7ba+xo3SpsZ2oRPE8Lb+oLnPwxwxUqFbxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070418;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eB3pgJ8yM+iPuPVCUnvj8n+wVSnRvwv01aYQERJe3N4=;
	b=NC4Fs6MlJJk0b+foRZTdEFnn4lpkf0RNnKgzkqV/9vAimAQWdoyY2Y8z6AZ2Q7woPpMgIs
	0CsUdZZUxp4M1NDA==
From: "tip-bot2 for Lu Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Honor migrate_llc_task semantics in
 active load balance, to fix LLC mis-scheduling bug
Cc: Chen Yu <yu.c.chen@intel.com>, Lu Wang <wanglu.priv@gmail.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Ccb39f64a17fc2b76097264aaec74a2d6dfff4315=2E1790035?=
 =?utf-8?q?273=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
References: =?utf-8?q?=3Ccb39f64a17fc2b76097264aaec74a2d6dfff4315=2E17900352?=
 =?utf-8?q?73=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007041695.2819794.8420655780816362849.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     d6013e2465d98d524b030a81c1223882a1bb7e4c
Gitweb:        https://git.kernel.org/tip/d6013e2465d98d524b030a81c1223882a1b=
b7e4c
Author:        Lu Wang <wanglu.priv@gmail.com>
AuthorDate:    Mon, 21 Sep 2026 17:37:23 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:50:29 +02:00

sched/cache: Honor migrate_llc_task semantics in active load balance, to fix =
LLC mis-scheduling bug

Cache aware scheduling introduced the migrate_llc_task migration type to dire=
ct
tasks toward their preferred LLC, but its semantics can be lost when passive
load balance falls back to active load balance (ALB). This may allow ALB to
select a candidate whose preferred LLC does not match the destination, moving
it away from its preferred LLC.

Example scenario:

src_rq has two runnable tasks, p1 and p2. p1 prefers dst_rq (dst_llc), while =
p2
prefers src_rq (src_llc). In this case, migrate_llc_task is set because src_rq
has at least one task, p1, that wants to migrate to dst_rq. In ALB,
can_migrate_task() finds p2 and returns true for it, thus moving p2 out of its
preferred LLC.

Solution:

The CPU stopper in ALB constructs a fresh lb_env that does not inherit
migration_type from the passive load-balance pass. Two approaches are
possible:

(a) Add a new member to struct rq so ALB can inherit migrate_llc_task
    from the passive LB that triggered it.

(b) Define a new flag LBF_ACTIVE_LB_LLC and select the stopper callback
    at kick time to preserve the migration semantics across the
    asynchronous boundary.

We choose (b) because it avoids passing migration_type through the
stopper, which would affect the meaning of migration_type for
delayed-dequeue tasks.

Fixes: e4c9a4cb244a ("sched/cache: Add migrate_llc_task migration type for ca=
che-aware balancing")
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Lu Wang <wanglu.priv@gmail.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Cc: <stable@kernel.org> # v7.2.x
Link: https://patch.msgid.link/cb39f64a17fc2b76097264aaec74a2d6dfff4315.17900=
35273.git.tim.c.chen@linux.intel.com
---
 kernel/sched/fair.c | 57 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index de3d589..514bd54 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10448,6 +10448,7 @@ enum migration_type {
 #define LBF_SOME_PINNED	0x08
 #define LBF_ACTIVE_LB	0x10
 #define LBF_LLC_PINNED	0x20
+#define LBF_ACTIVE_LB_LLC	0x40
=20
 struct lb_env {
 	struct sched_domain	*sd;
@@ -10867,6 +10868,21 @@ alb_break_llc(struct lb_env *env)
 }
=20
 /*
+ * Returns true if p's preferred LLC does not match the destination CPU
+ * under migrate_llc_task semantics. Passive LB passes migrate_llc_task
+ * in env->migration_type, while active LB carries LBF_ACTIVE_LB_LLC in
+ * env->flags to avoid overwriting env->migration_type.
+ */
+static inline bool
+migrate_llc_task_wrong_dst(struct task_struct *p, struct lb_env *env)
+{
+	return sched_cache_enabled() &&
+	       (env->migration_type =3D=3D migrate_llc_task ||
+		env->flags & LBF_ACTIVE_LB_LLC) &&
+	       READ_ONCE(p->preferred_llc) !=3D llc_id(env->dst_cpu);
+}
+
+/*
  * Check if migrating task p from env->src_cpu to
  * env->dst_cpu breaks LLC localiy.
  */
@@ -10894,8 +10910,7 @@ static bool migrate_degrades_llc(struct task_struct *=
p, struct lb_env *env)
 	 * run on env->dst_cpu, skip the tasks do not prefer
 	 * env->dst_cpu, and find the one that prefers.
 	 */
-	if (env->migration_type =3D=3D migrate_llc_task &&
-	    READ_ONCE(p->preferred_llc) !=3D llc_id(env->dst_cpu))
+	if (migrate_llc_task_wrong_dst(p, env))
 		return true;
=20
 	if (can_migrate_llc_task(env, p) !=3D mig_forbid)
@@ -10918,6 +10933,12 @@ alb_break_llc(struct lb_env *env)
 }
=20
 static inline bool
+migrate_llc_task_wrong_dst(struct task_struct *p, struct lb_env *env)
+{
+	return false;
+}
+
+static inline bool
 migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
 {
 	return false;
@@ -11016,7 +11037,7 @@ int can_migrate_task(struct task_struct *p, struct lb=
_env *env)
 	 * 4) too many balance attempts have failed.
 	 */
 	if (env->flags & LBF_ACTIVE_LB)
-		return 1;
+		return !migrate_llc_task_wrong_dst(p, env);
=20
 	degrades =3D migrate_degrades_locality(p, env);
 	if (!degrades) {
@@ -13415,6 +13436,20 @@ static int need_active_balance(struct lb_env *env)
 }
=20
 static int active_load_balance_cpu_stop(void *data);
+static int active_load_balance_llc_cpu_stop(void *data);
+
+/*
+ * migration_type is checked elsewhere to decide migration policy, so
+ * it shouldn't be repurposed just to flag an LLC-directed active
+ * balance across the stopper. Pick the callback here instead.
+ */
+static inline cpu_stop_fn_t alb_stop_fn(struct lb_env *env)
+{
+	if (env->migration_type =3D=3D migrate_llc_task)
+		return active_load_balance_llc_cpu_stop;
+
+	return active_load_balance_cpu_stop;
+}
=20
 static int should_we_balance(struct lb_env *env)
 {
@@ -13760,7 +13795,7 @@ more_balance:
 	}
 	if (active_balance) {
 		stop_one_cpu_nowait(cpu_of(busiest),
-				    active_load_balance_cpu_stop, busiest,
+				    alb_stop_fn(&env), busiest,
 				    &busiest->active_balance_work);
 	}
 	preempt_enable();
@@ -13865,7 +13900,7 @@ update_next_balance(struct sched_domain *sd, unsigned=
 long *next_balance)
  * least 1 task to be running on each physical CPU where possible, and
  * avoids physical / logical imbalances.
  */
-static int active_load_balance_cpu_stop(void *data)
+static int __active_load_balance_cpu_stop(void *data, unsigned int lb_flags)
 {
 	struct rq *busiest_rq =3D data;
 	int busiest_cpu =3D cpu_of(busiest_rq);
@@ -13915,7 +13950,7 @@ static int active_load_balance_cpu_stop(void *data)
 			.src_cpu	=3D busiest_rq->cpu,
 			.src_rq		=3D busiest_rq,
 			.idle		=3D CPU_IDLE,
-			.flags		=3D LBF_ACTIVE_LB,
+			.flags		=3D LBF_ACTIVE_LB | lb_flags,
 		};
=20
 		schedstat_inc(sd->alb_count);
@@ -13943,6 +13978,16 @@ out_unlock:
 	return 0;
 }
=20
+static int active_load_balance_cpu_stop(void *data)
+{
+	return __active_load_balance_cpu_stop(data, 0);
+}
+
+static int active_load_balance_llc_cpu_stop(void *data)
+{
+	return __active_load_balance_cpu_stop(data, LBF_ACTIVE_LB_LLC);
+}
+
 /*
  * Scale the max sched_balance_rq interval with the number of CPUs in the sy=
stem.
  * This trades load-balance latency on larger machines for less cross talk.
