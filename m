Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D3477292;
	Fri,  2 Oct 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933600; cv=none; b=LILDmbj7qRjs5WfNFYkPwauY555A3Bgrbo4YavhEBFp4BNM6KER0EqwHFt+o7hAja63yIAL6zDsSgoRvs/ktP3lHjYLi4T4websW3l9g9yHGyyUC1rwqwg5rrCXF6N+hCQEDEw75QZdOF7A+fICARYxxmOHhpzpe1Ob2ZPyNnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933600; c=relaxed/simple;
	bh=uX7NmCooC8YWFMgb2H4MF0ohOEoswNUKICDLg1K5f7Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=D2bvMQPTSBPidPUxT22Yv7WhQ7S20XBar0iIBBf1xn5D3E83KEOT5NEMtdne44cOeXH7Kve4tWi/WuRfSe412Z8uM9bBv4kfbkuuMZAqBBxMx5G6hbQcEpelnYlRStpfIO+lKZvs48pL6K291PYYa40hJD1BI9mCTQDbI4Ype4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hCp6rQRg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A7+fwuDW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hCp6rQRg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A7+fwuDW"
Date: Fri, 02 Oct 2026 09:33:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933597;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qlx1b+JSJEKulsJsKX9g3kSOFCFFhcK5r40TYnYSfhk=;
	b=hCp6rQRg7hikVLQq6RqSMCuLz3DR1MkvSaDsL+N17mVz6egkXSpwJdonDdp8lZChYN92ta
	AO5dkPs6CSEP93AVRp3ZgUFyiI1gTxLPIn/3a7Se7ld5e1peOj79Lm/dvwq7rOrZGdeoMe
	ZL1ZvdiCAyGgziIlFTbd4MAKo+vts3jwx+iLUo9HlsL50WUMMZ5padwrkQQuO5/MwETPCV
	tpOpfctm32Ts7A9Q448DK1g4gNae5VexX4VW6heGwimCMVH9WbZHeKD0Nl2zavS4jmiXek
	EAc3037zy+dD9uSyk2bE/ju7aKymtno4Q4nCIlcfV4t0kboVzSVdrT+lqfRZbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933597;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qlx1b+JSJEKulsJsKX9g3kSOFCFFhcK5r40TYnYSfhk=;
	b=A7+fwuDWySQe/zpZnaBkLGqQ+VF9AsxTBZ1b96GhJtE3MCU5HkGBr5dbLjmX5DiHgHxBTo
	9b1UunB79YOg5QCQ==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Honor asymmetric SMT priority in idle selection
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Srikar Dronamraju <srikar@linux.ibm.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, Breno Leitao <leitao@debian.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929165538.726616-2-arighi@nvidia.com>
References: <20260929165538.726616-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359542.3910103.11289749326097814578.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     c8fc4136fd3c58458592b77168f0916d08dbea5a
Gitweb:        https://git.kernel.org/tip/c8fc4136fd3c58458592b77168f0916d08d=
bea5a
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 29 Sep 2026 18:54:40 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:35 +02:00

sched/fair: Honor asymmetric SMT priority in idle selection

POWER7 uses SD_ASYM_PACKING at the shared-capacity SMT level to order
hardware threads, and NVIDIA Olympus benefits from the same policy. Idle
CPU selection does not consult that order, so a task can wake on an
arbitrary sibling and remain there until load balancing corrects the
placement. On these systems, that initial choice can prevent the core
from entering its preferred lower-thread resource mode and cause a large
and persistent performance loss.

When idle selection finds an available CPU in an SMT core, choose the
highest-priority available sibling. On SMT2 Olympus this only changes
selection on fully idle cores. A partially idle core has only one
available CPU. On wider SMT systems such as POWER7, it also fills
available siblings in priority order while the core is partially busy.

Apply the preference to idle-core and idle-CPU scans,
asymmetric-capacity scans, target, previous, recently-used CPU fast
paths and the slow path. Inspect the lowest scheduling domain directly,
but require both CPUs to share its span because isolcpus can split
hardware siblings across scheduling domains.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
maximum capacities, then SD_ASYM_PACKING selects the preferred available
sibling inside the chosen core, whose siblings continue to share equal
capacity.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Tested-by: Breno Leitao <leitao@debian.org>
Link: https://patch.msgid.link/20260929165538.726616-2-arighi@nvidia.com
---
 kernel/sched/fair.c | 85 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c687c3..b42a0ca 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8576,6 +8576,35 @@ static inline bool test_idle_cores(int cpu)
 }
=20
 /*
+ * Redirect a CPU to a higher-priority available sibling in its SMT domain,
+ * subject to task affinity.
+ */
+static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
+{
+	struct sched_domain *sd;
+	int best =3D cpu;
+	int sibling;
+
+	if (!sched_smt_active())
+		return cpu;
+
+	sd =3D rcu_dereference_all(cpu_rq(cpu)->sd);
+	if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
+	    !(sd->flags & SD_ASYM_PACKING))
+		return cpu;
+
+	for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
+		if (sibling =3D=3D best || !choose_idle_cpu(sibling, p))
+			continue;
+
+		if (sched_asym_prefer(sibling, best))
+			best =3D sibling;
+	}
+
+	return best;
+}
+
+/*
  * Scans the local SMT mask to see if the entire core is idle, and records t=
his
  * information in sd_balance_shared->has_idle_cores.
  *
@@ -8959,7 +8988,7 @@ static int select_idle_sibling(struct task_struct *p, i=
nt prev, int target)
=20
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto select_smt_priority;
=20
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8969,8 +8998,10 @@ static int select_idle_sibling(struct task_struct *p, =
int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
=20
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(prev, target))
-			return prev;
+		    cpus_share_resources(prev, target)) {
+			target =3D prev;
+			goto select_smt_priority;
+		}
=20
 		prev_aff =3D prev;
 	}
@@ -8988,7 +9019,8 @@ static int select_idle_sibling(struct task_struct *p, i=
nt prev, int target)
 	    prev =3D=3D smp_processor_id() &&
 	    this_rq()->nr_running <=3D 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target =3D prev;
+		goto select_smt_priority;
 	}
=20
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9002,8 +9034,10 @@ static int select_idle_sibling(struct task_struct *p, =
int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
=20
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+		    cpus_share_resources(recent_used_cpu, target)) {
+			target =3D recent_used_cpu;
+			goto select_smt_priority;
+		}
=20
 	} else {
 		recent_used_cpu =3D -1;
@@ -9025,7 +9059,11 @@ static int select_idle_sibling(struct task_struct *p, =
int prev, int target)
 		 */
 		if (sd) {
 			i =3D select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target =3D i;
+				goto select_smt_priority;
+			}
+			return target;
 		}
 	}
=20
@@ -9038,14 +9076,18 @@ static int select_idle_sibling(struct task_struct *p,=
 int prev, int target)
=20
 		if (!has_idle_core && cpus_share_cache(prev, target)) {
 			i =3D select_idle_smt(p, sd, prev);
-			if ((unsigned int)i < nr_cpumask_bits)
-				return i;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target =3D i;
+				goto select_smt_priority;
+			}
 		}
 	}
=20
 	i =3D select_idle_cpu(p, sd, has_idle_core, target);
-	if ((unsigned)i < nr_cpumask_bits)
-		return i;
+	if ((unsigned int)i < nr_cpumask_bits) {
+		target =3D i;
+		goto select_smt_priority;
+	}
=20
 	/*
 	 * For cluster machines which have lower sharing cache like L2 or
@@ -9053,12 +9095,19 @@ static int select_idle_sibling(struct task_struct *p,=
 int prev, int target)
 	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
 	 * use them if possible when no idle CPU found in select_idle_cpu().
 	 */
-	if ((unsigned int)prev_aff < nr_cpumask_bits)
-		return prev_aff;
-	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
-		return recent_used_cpu;
+	if ((unsigned int)prev_aff < nr_cpumask_bits) {
+		target =3D prev_aff;
+		goto select_smt_priority;
+	}
+	if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
+		target =3D recent_used_cpu;
+		goto select_smt_priority;
+	}
=20
 	return target;
+
+select_smt_priority:
+	return select_idle_smt_cpu(p, target);
 }
=20
 /**
@@ -9735,8 +9784,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cp=
u, int wake_flags)
 	}
=20
 	/* Slow path */
-	if (unlikely(sd))
-		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+	if (unlikely(sd)) {
+		new_cpu =3D sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+		return select_idle_smt_cpu(p, new_cpu);
+	}
=20
 	/* Fast path */
 	if (wake_flags & WF_TTWU)
