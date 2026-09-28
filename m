Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7697E45518D;
	Mon, 28 Sep 2026 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578885; cv=none; b=KNs2NLxBfwr7YrILT/GdQlmtO2ZL4+RilZN6QfE90sxLXEv6E+TEgehYbp/MIcpghn9eS+j0ZYVxEHMQf9ex1NNALA1a418vzObGnTnUyGPofl4ZoUUkNZYjpfWigQ1SoSDA1ZTEACzkA5NuldUPc0/iyppyTFFJj+HCrX1gvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578885; c=relaxed/simple;
	bh=4vDoyHEANe1fM3UhKQS6peQVGmoIOUGPwAZUr5H9oRg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MMmxhtd6G7vzhs6YnRWKTSj/o720UeTx1ZxDS/2yne5GoVMPGdyPqOSi3RYxtVacO+REVlvMMCSE1GiW3pUGiZYUBK34QcGSHXdX6O+DRAzQ2Yzoq5K9symN6RCVRuOV6W0o/eGV+QHll0Ggxi4KHq72F8d1fOCXH7i/xrZiGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OlGkBFPA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HFr3sanl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OlGkBFPA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HFr3sanl"
Date: Mon, 28 Sep 2026 07:01:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578879;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3niDAaibCeVXhMkhjARVnHOCTIAuWVR2zLHfBRdSXo=;
	b=OlGkBFPArYUJ6IISVUoFxZhV0k0Kv+h2VMGiTEtYUP0uaJLa8eLT+eO/83QKkb6yyi0fQn
	W8TOgOG9pVhN6M97umV6WtcDOMYVxsgEvSG/r5IGyO9EO2CWdG+3H1cpcEFS/h4y85mS9o
	p5SAm/KRD2dVBIHdIpK/cO/DDBVbiO5eTZj3kV7ldpQWkzYCcDn9ZX9Btayy7RGQfhQSaM
	pjJ4RytyjSqFy0+m8UQsIOaubIA/EJSg5FqDvhGRUv3p8dPWMrlzOFjWpcDivgEXOOosFk
	f5h80xui3BlUGH4jsXOutiMoxZZ30smw16R8X/5Tt+3ECBJrUWjh48WQwCVziQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578879;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3niDAaibCeVXhMkhjARVnHOCTIAuWVR2zLHfBRdSXo=;
	b=HFr3sanlSHK7PSMRj2kN+bM8JMtx7BN5tIZgMlVINiQglpAsHaUrHQI23TnUvoj3bHYRV0
	vQOn91wHlec5IoCw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] virt: Introduce steal governor driver
Cc: Yury Norov <yury.norov@gmail.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-11-sshegde@linux.ibm.com>
References: <20260928053728.797539-11-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057887801.3910103.15629197510486282018.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9a8e740ee9f69ec857ffa0c76cf1a01d1cb7360f
Gitweb:        https://git.kernel.org/tip/9a8e740ee9f69ec857ffa0c76cf1a01d1cb=
7360f
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:25 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:43 +02:00

virt: Introduce steal governor driver

Introduce a new driver in virt named steal_governor. This driver
will compute the steal time and drive the policy decisions regarding the
preferred CPU state.

Note that this driver is strictly intended for actual guests. Hence
block it on Xen dom0.
More details can be found in Documentation/driver-api/steal-governor.rst.

A new kconfig called STEAL_GOVERNOR is introduced in subsequent patches,
which enables this driver. This driver will select CONFIG_PREFERRED_CPU.
This makes configs driven by user preference/configuration.
When the driver is disabled, preferred CPUs remain the same as active CPUs.

The file layout of the driver is kept simple for now. The code is in
drivers/virt/steal_governor.c, and the configs are part of
drivers/virt/Kconfig.

The main structure of the steal governor contains:
- work, delay: Deferred periodic work function variables.
- steal, time: Used to calculate deltas during periodic work.
- interval_ms, high_threshold, low_threshold: Tuning knobs for the
  steal governor.

While there, add MAINTAINERS entry for this new driver.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-11-sshegde@linux.ibm.com
---
 Documentation/driver-api/index.rst          |   1 +-
 Documentation/driver-api/steal-governor.rst | 151 +++++++++++++++++++-
 MAINTAINERS                                 |   9 +-
 drivers/virt/steal_governor.c               |  78 ++++++++++-
 4 files changed, 239 insertions(+)
 create mode 100644 Documentation/driver-api/steal-governor.rst
 create mode 100644 drivers/virt/steal_governor.c

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/in=
dex.rst
index 6601a25..26b7638 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -139,6 +139,7 @@ Subsystem-specific APIs
    sm501
    soundwire/index
    spi
+   steal-governor
    surface_aggregator/index
    switchtec
    sync_file
diff --git a/Documentation/driver-api/steal-governor.rst b/Documentation/driv=
er-api/steal-governor.rst
new file mode 100644
index 0000000..3817eed
--- /dev/null
+++ b/Documentation/driver-api/steal-governor.rst
@@ -0,0 +1,151 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Steal Governor
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+:Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The steal governor is aimed at mitigating the Noisy Neighbour problem
+which occurs in paravirtualized environments with CPU overcommit.
+The performance of a workload running in one VM gets degraded by
+the activity of other VMs on the same host. As a result, all VMs
+collectively make slower forward progress.
+
+In such systems, high utilization in all VMs causes the hypervisor to
+frequently preempt vCPUs. This vCPU preemption is expensive.
+To mitigate this, the kernel aims to restrict workloads to a subset of
+Preferred CPUs to reduce physical CPU contention.
+A detailed explanation of Preferred CPUs is available in
+``Documentation/scheduler/sched-paravirt.rst``.
+
+The steal governor selects ``CONFIG_PREFERRED_CPU=3Dy`` which enables the
+scheduler core infrastructure to move the tasks to Preferred CPUs where
+possible. The driver controls the policy decisions regarding the state of
+preferred CPUs. That is, this driver decides which CPUs are preferred
+and which CPUs are non-preferred.
+
+The driver code is available at ``drivers/virt/steal_governor.c``.
+
+Core idea
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+steal time is an indication available today in Guest which shows contention
+for underlying physical CPU. Use it as a hint in the guest to fold the
+workload to a reduced set of vCPUs. When there is contention, steal time
+will show up in all the guests. When each guest honors the hint and folds
+the workload to a smaller set of vCPUs (Preferred CPUs), it reduces the
+contention and thereby reduces vCPU preemption.
+This is achieved without any cross-guest communication.
+
+Steal governor driver effectively does:
+
+1. Periodically computes the steal ratio using accumulated steal time
+   across possible CPUs, normalized by the number of active CPUs.
+
+2. If steal ratio is greater than high threshold, reduce the number of
+   preferred CPUs by 1 core. Ensure at least one core is left always.
+   Skip changing the state of offline CPUs in that core.
+
+3. If steal ratio is less than or equal to low threshold, increase the
+   number of preferred CPUs by 1 core. If preferred is same as active,
+   nothing to be done. Skip changing the state of offline CPUs.
+   This helps to handle cases where few CPUs are offline in a core and
+   those offline CPUs will not be marked as preferred.
+
+4. Ensure preferred CPUs is always subset of active CPUs.
+   On feature disable it is same as active CPUs.
+
+This feature works best only when all the VMs enable the feature as
+it is a co-operative scheme. If a specific VM doesn't enable this feature
+it may end up with more CPUs than others, still should lead to better
+performance when seen from system view. Those who enable this driver must
+ensure it is enabled in all VMs.
+
+Note that this driver is strictly intended for actual guests; for example,
+loading this module in a privileged VM like Xen Dom0 is blocked.
+
+Workload considerations
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The steal governor is useful for workloads where vCPU preemption has
+costs beyond the lost CPU time, such as lock-holder preemption, critical
+sections, communicating threads, and cache or TLB disruption.
+
+Pure CPU-time workloads with independent workers may not benefit and
+could see a small regression due to additional guest scheduling overhead.
+
+Module Parameters
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+interval_ms
+-----------
+
+How often steal governor checks for steal time.
+Default: 1000 i.e. 1 second. Value should be in between 100ms to 100sec.
+
+This controls how fast steal governor driver reacts to changes to the
+contention of physical CPUs. Since it does a fair amount of work, setting
+too low may have overhead. Setting it too high might render it ineffective.
+
+low_threshold
+-------------
+
+lower threshold value in percentage * 100.
+Default: 200, i.e. 2% steal is considered as low threshold.
+Can't be higher than high_threshold.
+
+This determines what values should be considered as nil/no steal values.
+When steal governor sees steal ratio is less than or equal to this value,
+it will increase the preferred CPUs by 1 core.
+Using zero might cause oscillations.
+
+high_threshold
+--------------
+
+higher threshold value in percentage * 100
+Default: 500, i.e. 5% steal is considered as high threshold.
+Can't be lower than low_threshold. Must be less than 10000.
+
+This determines what values should be considered as high steal values.
+When steal governor sees steal ratio is higher than this value, it will
+reduce the preferred CPUs by 1 core.
+
+Limitations of default values
+-----------------------------
+
+Because of the vast diversity in VM configurations and different
+architectures, the default thresholds may not be optimal for all systems.
+Users may need to tune these parameters based on the system under
+test to achieve the best results.
+
+The governor sums the steal time across all possible CPUs, which ensures
+the accumulated steal time remains a monotonically increasing value.
+However, to calculate the effective steal ratio, it divides this sum
+by the number of active CPUs. Because only active CPUs contribute to
+the steal time delta, this prevents threshold dilution on sparsely
+populated systems.
+
+The driver reduces/increases preferred CPUs by core-level. This could provide
+faster convergence for hypervisors such as powerVM. But on KVM and Xen
+convergence could be slower depending on the configuration.
+Using a smaller interval_ms could help one to expedite it.
+
+Reasons for CONFIG_STEAL_GOVERNOR=3Dm
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Selecting this driver makes CONFIG_PREFERRED_CPU=3Dy. That makes configs
+driven by user preference. Though one can have CONFIG_STEAL_GOVERNOR=3Dy,
+It is recommended to build CONFIG_STEAL_GOVERNOR=3Dm due to below reasons:
+
+1. Doing periodic work has additional overheads. Enabling this driver
+   in systems where steal time cannot happen is of no use. There is no
+   benefit with additional overheads in such systems.
+
+2. This works well when all VMs work in a co-operative manner. When an
+   administrative user enables it in one VM, he/she will likely enable
+   it in all VMs.
+
+3. User can tweak the module parameters by reloading the module.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da7..28003d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26223,6 +26223,15 @@ F:	rust/helpers/jump_label.c
 F:	rust/kernel/generated_arch_static_branch_asm.rs.S
 F:	rust/kernel/jump_label.rs
=20
+STEAL GOVERNOR DRIVER
+M:	Shrikanth Hegde <sshegde@linux.ibm.com>
+R:	Yury Norov <yury.norov@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
+F:	Documentation/driver-api/steal-governor.rst
+F:	drivers/virt/steal_governor.c
+
 STI AUDIO (ASoC) DRIVERS
 M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	linux-sound@vger.kernel.org
diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
new file mode 100644
index 0000000..2320cbf
--- /dev/null
+++ b/drivers/virt/steal_governor.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Steal time governor driver periodically computes steal time.
+ * Based on the thresholds it either reduce/increase the preferred
+ * CPUs which can be used by the workload to avoid vCPU preemption
+ * to an extent possible in paravirtualized environment.
+ *
+ * Available with CONFIG_STEAL_GOVERNOR
+ *
+ * Copyright (C) 2026 IBM
+ * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cpuhplock.h>
+#include <linux/cpumask.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/kconfig.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#ifdef CONFIG_XEN
+#include <xen/xen.h>
+#endif
+
+#if !IS_ENABLED(CONFIG_PREFERRED_CPU)
+#error "Steal Governor requires CONFIG_PREFERRED_CPU"
+#endif
+
+struct steal_governor {
+	ktime_t			time;
+	u64			steal;
+	unsigned long		delay;
+	unsigned int		interval_ms;
+	unsigned int		high_threshold;
+	unsigned int		low_threshold;
+	struct delayed_work	work;
+};
+
+static struct steal_governor sg_ctx;
+
+static void restore_preferred_to_active(void)
+{
+	int cpu;
+
+	guard(cpus_read_lock)();
+	for_each_cpu(cpu, cpu_active_mask)
+		set_cpu_preferred(cpu, true);
+}
+
+static int __init steal_governor_init(void)
+{
+#ifdef CONFIG_XEN
+	if (xen_initial_domain()) {
+		pr_err("Cannot load in Xen Dom0 (Host OS). Driver is for guests only.\n");
+		return -ENODEV;
+	}
+#endif
+
+	pr_info("enabled\n");
+	return 0;
+}
+
+static void __exit steal_governor_exit(void)
+{
+	restore_preferred_to_active();
+	pr_info("disabled\n");
+}
+
+module_init(steal_governor_init);
+module_exit(steal_governor_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("IBM Corporation");
+MODULE_DESCRIPTION("Virtualization Steal Time Governor");
