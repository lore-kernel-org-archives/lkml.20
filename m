Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818247;
	b=X/LsMQkqkS3jv+ZGHlKjfs1U+jHUCBLidW+CiSka2Lk5pi0OI+E321mQpio5Cpms9ahL
	 nfZprn+1x82FL4kISe8P/pwL+FIdBhqqAN77gTsxNmuWK11XYe4u9bj+EBduEGkfwQcut
	 T8cZ668i4ezgmR3bMAdYQYAiFphz2JJa945flEeZmVrbwNqE2x7kf9ztswxFSgevqmKk+
	 mdH4sRKtnK6C6oxUZxarmLZ0hgWsF/FgN5WdAleMywiH4QWNCPn+Kfxx5aPoK+dlrZv/F
	 4DcEDHKX2eafygWuO3tly2PWWEdD4srJXFu7FPc+0luxX9dhXn5v5G7kj4QBG0Qbxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MoTquV1XtOzVR4BJIJ6jBhGMFL/wYB+Tu6a1HhzVCrs=;
	b=1wz5oUcZv8QaAgelKqLTNiEOMxiJK/4eCaveJQZZmYkfaQ5nFh/ahg2GVx+UZwOAolpX
	 ODsJdsWLB5AKAArqH3D/xsygNcPSRceNU3rN0iWGwZ2np5W5l7FgVc8lSmgYCXgAfmiui
	 BIGDbysMryq3QvE9qWBX6OVfpUUTxxjPKDODBffFPBINOIBOdig29f62t/WMct/vPz4rl
	 sifJz50AocOWj2vQ8Y3VsGwyJYoIAAcYrmhRGj0NwRzfeHWPAIVNkZENe3PodicJmiWG4
	 YpDliDrixZPQtEooUFgay8cuaDkxCmR8v52ROBJREEuSWMus6q+7gQpirg792+bHbKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UJIFL4ED;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36D6082BFC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E36D6082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UJIFL4ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818246; x=1825354246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1O++slxIyvXHygkkxrrjbTkg1qNvpMhdtuCmzm6O9WM=;
  b=UJIFL4EDcQw2KakMUECIY+l6yNRKu2CVhvLkKnVuphtVLNyBpCZoTBro
   1zyp+/tYvx7Rnhg0djZwjpuVaMlgI3x8ty2s6a91D15LvxxbVeOn0NsDx
   2PQBlcmMY3cKbGGqBASjZst7sICVbuwICfSyDYMQlS+sdtn5D7eqNC4K/
   eoSq95x0HgSi8HhstVU7JMfEgD8Qot2bJYrCA2mx9cjCJiNyDMq7q1MMe
   WQvc0PDQ4RGPPDpM+JBAX33WtHup+GUFJFEdJ5Paiw0g5PtUmcDh2B2VC
   PI1pmEzOA7fnpITdXj39UF7DCCOYAW1xk0XENL9Bk+HUSZNoGSPMH3btG
   w==;
X-CSE-ConnectionGUID: 9O0Lt81nSWax5Def4vN2+Q==
X-CSE-MsgGUID: D0wt5qaXRPyIkSJZNaZYGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485010"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:46 -0800
X-CSE-ConnectionGUID: FO3AvnmER7u3MDgcQ5HGcA==
X-CSE-MsgGUID: wISQ933pTzGJYt98xoWcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336752"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:46 -0800
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
Subject: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
Date: Wed,  4 Nov 2026 18:23:15 +0000
Message-ID: <20261104182322.578066-3-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104182322.578066-1-chang.seok.bae@intel.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
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
 arch/Kconfig                 |  3 ++
 include/linux/stop_machine.h | 16 ++++++
 kernel/stop_machine.c        | 99 +++++++++++++++++++++++++++++++++++-
 3 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 1163736de1f9..a4b62f83efb6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1824,4 +1824,7 @@ config ARCH_HAS_CPU_ATTACK_VECTORS
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

