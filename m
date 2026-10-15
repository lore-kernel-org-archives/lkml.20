Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A444A409
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100503; cv=none; b=PmIXckfJTeeC+nyBXxNHSDBZR/iaCLRxxRouTHQE7uN08tEFY/w1R5mQi3QyiXBUPaDOJOio9BamEK2j7RuvVEiM3XFijv3hc3ygEgqLgt4ypEUDTBGIFsvzh5vzNM1ISJF/cIJ3pf+B0fJ2k0QZfZTdVCjCQsuQzcLwge/eWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100503; c=relaxed/simple;
	bh=9lDo9dCB4fQyLgtDH/RRxRct/B16dohpnYjHilZUO9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NA4qEeBuJQFLdC9dDkvSNIWonKiBhrvxCx/F944nVhmCSyLKMPH8bdN1A4J3bDYmpRCasivzfxodaKmQccvKtKIq0I/GUYl0yMaXgbn2nCZaK1wz47z7lTS1Q0rWfEIaQufLeaRwi2+0PF14cZkX/Rr7S5I0f8J2fvePZIOVbSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXYbVMAE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXYbVMAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100502; x=1823636502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9lDo9dCB4fQyLgtDH/RRxRct/B16dohpnYjHilZUO9g=;
  b=JXYbVMAEfnKre07J+bb/HWxLJSK63zbbBOZDDflBXU3D0VFttNkUkTZY
   +CtYvvxBm5pJzupZvzVpbC2EIo482z/OZnLQ9zrp/NNgTKKKbssOy7jLX
   VP6PA9Z0sKk8UFfv73Q98v75sq6Oncu9HWP+4rGLufvDOo06hO6LQEOjT
   cjZC4wFMrl3abE0B+5CbeDX63zw1s+hKFb1+5ioNY12Ad3k1wQRpUpIQL
   6qbH7fp6XvpMfDuzgYVHdw+YZ2X+3X2pV3i7rRJjswsSAHseZ2AXyXmqi
   CXlWj5a8CzdRlxPnXzzPlJFr4InMmNl+Z0Uz1hEcMTpYJIYDf/+zLnQPM
   w==;
X-CSE-ConnectionGUID: JUz0rRvNQKauHefw3j/T2g==
X-CSE-MsgGUID: pc8QWONWRw6e0rzya+dUdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902125"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:38 -0700
X-CSE-ConnectionGUID: U3wkeJolSVSsaoyfzQFzww==
X-CSE-MsgGUID: hYEjE6qOQfi6etfgcPyXlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104371"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:39 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 2/9] stop_machine: Add NMI-based execution path
Date: Thu, 15 Oct 2026 21:14:19 +0000
Message-ID: <20261015211426.49114-3-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015211426.49114-1-chang.seok.bae@intel.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently multi_cpu_stop() executes the stop function in the
MULTI_STOP_RUN state. But NMIs can still preempt the execution. For use
cases requiring stricter isolation from them, provide an option to run
the stop function from NMI context.

Then, the NMI stop function must be built without instrumentation, as
exceptions may re-enable NMIs on return via IRET. Annotate the NMI
handler entirely with noinstr.

However, objtool cannot reliably determine whether the indirect call
target is located in a noinstr section, so it may emit false positives.
To avoid this, temporarily lift the instrumentation restriction around
the indirect call site and document the intention.

The x86 microcode loader is currently the primary user for this. But
other architectures are not expected to use it. Add a build option to
make it opt-in.

Originally-by: David Kaplan <david.kaplan@amd.com>
Suggested-by: Borislav Petkov <bp@alien8.de>
Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://lore.kernel.org/lkml/20260129121729.GRaXtP2aeWkQKegxC2@fat_crate.local
Link: https://lore.kernel.org/lkml/87wm0zl8p2.ffs@tglx
---
V2 -> V3: Address Sashiko review
* Avoid instrumentable functions:
  smp_processor_id() -> raw_smp_processor_id()
  cpumask_test_and_clear_cpu() -> arch_test_and_clear_bit()
* Remove `done` tag to avoid false setting. Instead, data == NULL as indicator
---
 arch/Kconfig                 |  3 ++
 include/linux/stop_machine.h | 16 ++++++
 kernel/stop_machine.c        | 99 +++++++++++++++++++++++++++++++++++-
 3 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..afa564261e1c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1878,4 +1878,7 @@ config ARCH_HAS_CPU_ATTACK_VECTORS
 config HAVE_ARCH_GET_SECUREBOOT
 	def_bool EFI
 
+config STOP_MACHINE_NMI
+	bool
+
 endmenu
diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index 84e7fb627ba4..b53b028296e0 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -20,6 +20,12 @@
  */
 typedef int (*cpu_stop_fn_t)(void *arg);
 
+/*
+ * Stop function variant runnable from NMI context. This makes the
+ * noinstr requirement explicit at the type level.
+ */
+typedef int (*cpu_stop_nmisafe_fn_t)(void *arg);
+
 #ifdef CONFIG_SMP
 
 struct cpu_stop_work {
@@ -186,4 +192,14 @@ stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
 }
 
 #endif	/* CONFIG_SMP || CONFIG_HOTPLUG_CPU */
+
+#ifdef CONFIG_STOP_MACHINE_NMI
+
+void arch_send_self_nmi(void);
+bool noinstr stop_machine_nmi_handler(void);
+
+#else
+static inline bool stop_machine_nmi_handler(void) { return false; }
+#endif /* CONFIG_STOP_MACHINE_NMI */
+
 #endif	/* _LINUX_STOP_MACHINE */
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 8dcd5be67b85..ad01b7c5266c 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -23,6 +23,7 @@
 #include <linux/atomic.h>
 #include <linux/nmi.h>
 #include <linux/sched/wake_q.h>
+#include <linux/delay.h>
 
 /*
  * Structure to determine completion condition and record errors.  May
@@ -175,6 +176,15 @@ struct multi_stop_data {
 
 	enum multi_stop_state	state;
 	atomic_t		thread_ack;
+
+#ifdef CONFIG_STOP_MACHINE_NMI
+	/* Used in the NMI stop_machine variant */
+	bool			use_nmi;
+	/* A separate function type to highlight noinstr requirement */
+	cpu_stop_nmisafe_fn_t	nmisafe_fn;
+	/* cpumask of CPUs on which to raise an NMI */
+	cpumask_var_t		nmi_cpus;
+#endif
 };
 
 static void set_state(struct multi_stop_data *msdata,
@@ -198,6 +208,8 @@ notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
 	cpu_relax();
 }
 
+static int multi_stop_run(struct multi_stop_data *msdata);
+
 /* This is the cpu_stop function which stops the CPU. */
 static int multi_cpu_stop(void *data)
 {
@@ -236,7 +248,7 @@ static int multi_cpu_stop(void *data)
 				break;
 			case MULTI_STOP_RUN:
 				if (is_active)
-					err = msdata->fn(msdata->data);
+					err = multi_stop_run(msdata);
 				break;
 			default:
 				break;
@@ -713,3 +725,88 @@ int stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
 	mutex_unlock(&stop_cpus_mutex);
 	return ret ?: done.ret;
 }
+
+#ifdef CONFIG_STOP_MACHINE_NMI
+
+struct nmi_stop {
+	struct multi_stop_data	*data;
+	int			ret;
+};
+
+static DEFINE_PER_CPU(struct nmi_stop, nmi_stop);
+
+/*
+ * Instrumentation may trigger nested exceptions such as #INT3, #DB,
+ * or #PF. IRET from those would re-enable NMIs, which opposes the goal
+ * of this NMI stop-machine facility.
+ */
+bool noinstr stop_machine_nmi_handler(void)
+{
+	struct multi_stop_data *msdata = raw_cpu_read(nmi_stop.data);
+	unsigned int cpu = raw_smp_processor_id();
+	int ret;
+
+	if (!msdata || !arch_test_and_clear_bit(cpu, cpumask_bits(msdata->nmi_cpus)))
+		return false;
+
+	/*
+	 * The indirect call to @nmisafe_fn() is indistinguishable at
+	 * post-compilation. Temporarily enabling instrumentation avoids
+	 * objtool false positives.
+	 */
+	instrumentation_begin();
+	ret = msdata->nmisafe_fn(msdata->data);
+	instrumentation_end();
+
+	raw_cpu_write(nmi_stop.ret,  ret);
+	raw_cpu_write(nmi_stop.data, NULL);
+
+	return true;
+}
+
+static bool wait_for_nmi_handler(void)
+{
+	/* Conservative timeout */
+	unsigned long timeout = USEC_PER_SEC;
+
+	/* The handler clears up at the end */
+	while (this_cpu_read(nmi_stop.data) && timeout--)
+		udelay(1);
+
+	return !this_cpu_read(nmi_stop.data);
+}
+
+static int nmi_stop_run(struct multi_stop_data *msdata)
+{
+	/*
+	 * Save per-CPU state accessible from NMI context and raise a
+	 * self-NMI to execute the stop function from the NMI handler
+	 */
+	this_cpu_write(nmi_stop.data, msdata);
+	arch_send_self_nmi();
+
+	/*
+	 * Ensure the handler went through before reading the result.
+	 * Otherwise, make no stale state left behind.
+	 */
+	if (!wait_for_nmi_handler()) {
+		this_cpu_write(nmi_stop.data, NULL);
+		return -ETIMEDOUT;
+	}
+
+	return this_cpu_read(nmi_stop.ret);
+}
+
+static int multi_stop_run(struct multi_stop_data *msdata)
+{
+	return msdata->use_nmi ? nmi_stop_run(msdata) : msdata->fn(msdata->data);
+}
+
+#else
+
+static int multi_stop_run(struct multi_stop_data *msdata)
+{
+	return msdata->fn(msdata->data);
+}
+
+#endif /* CONFIG_STOP_MACHINE_NMI */
-- 
2.53.0

