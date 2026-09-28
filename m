Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7337DEA8;
	Mon, 28 Sep 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578880; cv=none; b=BnVL7DGZD7IR7V8R4pPa5o2nmX0wNAXdrPNboIJQQLCCgpYLtGH6FKFRGV5FHUvbQnuirAYOekfHnbFxg4Lo7fPQim9PCNqjZF+KFxNq1dCJPK5rtMCRd01IyoQUfljGdB+XCub2rzgcO/h2qpnwdv4bbzmdoZkDbhEnUuHoc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578880; c=relaxed/simple;
	bh=6kZxe9XM9IsWIYF3n6nQWo33FFM2KLPwdifWGNr32n8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UgZ2amq5yEYkYB7kSo2dKYjkXsJUi5x2ZYvzNdfDF+9+gUcN+i+f3oFTrhG4fZtJxOKUNhobz5W+nkkAwGNZ9Kt/e3gCA4WOqHmEFOt2Z9btPx845l2IoLEd+RV6w7qkI0f5XwzgSdkEQq7eLKmyS1Ecq8pjUFsuFwbtKvCpKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pxL+XVdL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ijTbg1qI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pxL+XVdL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ijTbg1qI"
Date: Mon, 28 Sep 2026 07:01:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578876;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlwYLNCS/qVJeuvePkmCVxZJvWWalYHDw4+kp49Qpb0=;
	b=pxL+XVdLR+5U/dZIvrZPPKyv/nQrLUCNFV+wEI+b+STu2gavQhUQy5ZtW/zHVAPx+GaNAQ
	nfkjF3i5ReQLVSqYWmONEQ0gxHJUcHNqRq1Y6uszJRYjlf7wAh6IHkje2iBVWD2VcaLOJo
	CnSKfjbSql/5dS0sDSuk0hbZtFGgGGAgXlT6QtxmYWOuAkrNGUGe66AS+4XulRRJAEQdkt
	FLxwjyXf535i0nsok20oYSFyUUxFpyHX1xlbrWqAmapfNdEWpSvjKEVlecqwnf8oyyDiPY
	MlThruq3sMBfxn+5xxNGCveahDzI8cB1+IH/RiUNCVp+0eSse0HgNQaf+9TT4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578876;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlwYLNCS/qVJeuvePkmCVxZJvWWalYHDw4+kp49Qpb0=;
	b=ijTbg1qIQtiCb6wdgy0ZIwKx6n9tJd5yC1gA31AxG30me9T8SSXDQ0o6np2unnxrSXj6gr
	Axys8EgPQd+bK3CA==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] virt/steal_governor: Implement steal_governor policy loop
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-13-sshegde@linux.ibm.com>
References: <20260928053728.797539-13-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057887508.3910103.18314799044981020919.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     27d47ebce4d6490ce093031a48cc2d81bf9997a3
Gitweb:        https://git.kernel.org/tip/27d47ebce4d6490ce093031a48cc2d81bf9=
997a3
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:27 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:43 +02:00

virt/steal_governor: Implement steal_governor policy loop

Schedule work at regular intervals to implement the steal_governor
policy loop, which monitors steal time and takes action on the state of
preferred CPUs. The interval is determined by the interval_ms parameter.
schedule_delayed_work() is used since interval_ms is on the order of
milliseconds and the work does not need to happen instantly.

Periodic policy loop essentially does:

- Gets the total/delta steal values and cpus to use steal_ratio.
- Calculate the steal_ratio as below.

       steal_ratio =3D (delta_steal * 100*100)/(delta_ns * num_cpus())

  It is calculated this way to consider the fractional values of steal
  time. I.e 10 means 0.1% steal time. A few tricks such as
  divide by 10,000 are used to avoid possible overflow.
- If steal ratio is higher than high threshold, call the method to reduce
  the preferred CPUs.
- If steal ratio is lower or equal to low threshold, call the method to
  increase the preferred CPUs.
- If the steal ratio falls in between, no action is taken.
- Ensures design constraints always met.
  1. At least one core/CPU must be there in preferred mask.
  2. preferred CPUs is subset of active CPUs.
  If not met, then restore preferred CPUs to active and stop
  requeue of the work. Driver is effectively non-functional after that.

Note that design checks are always performed. This helps avoid placing
driver-specific design constraints inside the core CPU hotplug mechanism.
User may offline specific set of CPUs that could leave the preferred
mask as empty. With the design check performed always, driver gracefully
shuts down upon detecting that edge case.

In order to help the above loop, a few helper functions have been added.
1. get_system_steal_time()
- steal governor takes global view of steal time instead of individual
  vCPU. Collect the steal values across the vCPUs of interest.
- Sum up steal time values across possible CPUs. This helps to keep it
  a monotonically increasing number and avoids spikes due to CPU
  hotplug.

2. decrease_preferred_cpus()
- Called when there is high steal time. It needs to decide which CPUs to
  mark as non-preferred.
- Get first housekeeping CPU and its core mask. Mark it as
  protected core. This helps to keep at least one core as preferred.
  (kernel ensures at least one housekeeping CPU stays active.)
- Find the last CPU outside of this protected core mask. i.e target CPU
- Based on that target CPU, get its sibling and mark them as
  non-preferred.

3. increase_preferred_cpus()
- Called when there is low steal time. It needs to decide which CPUs to
  mark as preferred and set that state.
- Get the first active non-preferred CPUs. This likely is the last
  set of CPUs being marked as non-preferred.
- get the siblings of that CPU and mark them as preferred.

4. get_system_cpus()
- informs how many CPUs needs to be considered for steal_ratio
  calculations.
- Since only active CPUs effectively contribute to steal time delta,
  returns number of active CPUs. This also helps to avoid dilution of
  thresholds in sparsely populated systems.

Notes:
1. Using core instead of individual CPUs performs better as SMT is
   quite common and some hypervisor such as powerVM does core scheduling.

2. This doesn't do any NUMA splicing to keep the code simpler and
   minimal overhead. Current code expects CPUs spread uniformly
   across NUMA nodes.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-13-sshegde@linux.ibm.com
---
 drivers/virt/steal_governor.c | 149 +++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+)

diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
index 27f53ea..6e31f99 100644
--- a/drivers/virt/steal_governor.c
+++ b/drivers/virt/steal_governor.c
@@ -13,13 +13,18 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/cleanup.h>
 #include <linux/cpuhplock.h>
 #include <linux/cpumask.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/kernel_stat.h>
 #include <linux/kconfig.h>
 #include <linux/ktime.h>
+#include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/sched/isolation.h>
+#include <linux/topology.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #ifdef CONFIG_XEN
@@ -111,6 +116,145 @@ module_param_named(low_threshold, sg_ctx.low_threshold,=
 uint, 0444);
 MODULE_PARM_DESC(low_threshold,
 		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
=20
+/* Return collective steal time across system. */
+static u64 get_system_steal_time(void)
+{
+	return kcpustat_field_total(CPUTIME_STEAL, cpu_possible_mask);
+}
+
+/* Return number of CPUs to consider for steal ratio. */
+static unsigned int get_system_cpus(void)
+{
+	return num_active_cpus();
+}
+
+/*
+ * Called when the steal governor detects high physical CPU contention.
+ * It finds the last active core in the preferred mask and mark those
+ * CPUs as non-preferred.
+ *
+ * Must ensure:
+ * - at least one core is always kept as preferred
+ * - preferred is always subset of active.
+ */
+static void decrease_preferred_cpus(void)
+{
+	const struct cpumask *first_hk_core;
+	int target_cpu =3D nr_cpu_ids;
+	int cpu;
+
+	guard(cpus_read_lock)();
+	cpu =3D cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
+				cpu_preferred_mask);
+	if (cpu >=3D nr_cpu_ids)
+		return;
+
+	/* Always leave first housekeeping core as preferred. */
+	first_hk_core =3D topology_sibling_cpumask(cpu);
+	cpu =3D cpumask_last(cpu_preferred_mask);
+	if (cpu >=3D nr_cpu_ids)
+		return;
+
+	/* Find the last CPU which doesn't belong to that first hk_core. */
+	if (!cpumask_test_cpu(cpu, first_hk_core)) {
+		target_cpu =3D cpu;
+	} else {
+		for_each_cpu_andnot(cpu, cpu_preferred_mask, first_hk_core)
+			target_cpu =3D cpu;
+	}
+
+	/* Only the first housekeeping core remains */
+	if (target_cpu >=3D nr_cpu_ids)
+		return;
+
+	for_each_cpu_and(cpu, topology_sibling_cpumask(target_cpu),
+			 cpu_preferred_mask)
+		set_cpu_preferred(cpu, false);
+}
+
+/*
+ * Called when the steal governor detects no/low physical CPU contention.
+ * It finds the first active core outside of preferred mask and mark
+ * those CPUs as preferred.
+ *
+ * Must ensure preferred is subset of active.
+ */
+static void increase_preferred_cpus(void)
+{
+	int first_cpu, cpu;
+
+	guard(cpus_read_lock)();
+	first_cpu =3D cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
+
+	/* All CPUs are preferred. Nothing to increase further */
+	if (first_cpu >=3D nr_cpu_ids)
+		return;
+
+	for_each_cpu_and(cpu, topology_sibling_cpumask(first_cpu),
+			 cpu_active_mask)
+		set_cpu_preferred(cpu, true);
+}
+
+static bool preferred_cpus_valid(void)
+{
+	if (cpumask_empty(cpu_preferred_mask)) {
+		pr_err("empty preferred mask. stopping\n");
+		return false;
+	}
+
+	if (!cpumask_subset(cpu_preferred_mask, cpu_active_mask)) {
+		pr_err("preferred: %*pbl is not subset of active: %*pbl, stopping\n",
+		       cpumask_pr_args(cpu_preferred_mask),
+		       cpumask_pr_args(cpu_active_mask));
+		return false;
+	}
+
+	return true;
+}
+
+static void steal_governor_loop(struct work_struct *work)
+{
+	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
+	ktime_t now;
+
+	now =3D ktime_get();
+	delta_ns =3D ktime_to_ns(ktime_sub(now, sg_ctx.time));
+
+	if (unlikely(delta_ns < NSEC_PER_MSEC)) {
+		pr_err_ratelimited("work scheduled too soon delta_ns: %llu\n", delta_ns);
+		goto requeue_work;
+	}
+
+	curr_steal =3D get_system_steal_time();
+	delta_steal =3D curr_steal > sg_ctx.steal ? curr_steal - sg_ctx.steal : 0;
+	sg_ctx.steal =3D curr_steal;
+	sg_ctx.time =3D now;
+
+	/*
+	 * steal_ratio =3D (delta_steal * 100*100)/(delta_ns * num_cpus())
+	 * To avoid possible overflow, divide the denominator early.
+	 * Note minimum interval is 100ms.
+	 */
+	delta_ns =3D max_t(u64, div_u64(delta_ns * get_system_cpus(), 10000), 1);
+	steal_ratio =3D div64_u64(delta_steal, delta_ns);
+
+	if (steal_ratio > sg_ctx.high_threshold)
+		decrease_preferred_cpus();
+	else if (steal_ratio <=3D sg_ctx.low_threshold)
+		increase_preferred_cpus();
+	/*
+	 * else: steal ratio is within bounds. Still do design checks so that
+	 * module restores to active if CPU hotplug breaks those assumptions.
+	 */
+	if (!preferred_cpus_valid()) {
+		restore_preferred_to_active();
+		return;
+	}
+
+requeue_work:
+	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
+}
+
 static int __init steal_governor_init(void)
 {
 #ifdef CONFIG_XEN
@@ -127,6 +271,10 @@ static int __init steal_governor_init(void)
 	}
=20
 	sg_ctx.delay =3D msecs_to_jiffies(sg_ctx.interval_ms);
+	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
+	sg_ctx.steal =3D get_system_steal_time();
+	sg_ctx.time =3D ktime_get();
+	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
 	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
 		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
=20
@@ -135,6 +283,7 @@ static int __init steal_governor_init(void)
=20
 static void __exit steal_governor_exit(void)
 {
+	disable_delayed_work_sync(&sg_ctx.work);
 	restore_preferred_to_active();
 	pr_info("disabled\n");
 }
