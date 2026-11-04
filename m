Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818250;
	b=x84fGy56HS+ybyRjhQYCe5K5w07rpNpMT/H1zYLCz0SMzRSU85FbvDiDYr6GHYN+QpH9
	 rmZJKO2EVtmRdhn8k8qtp1vyyrrldL1ewKMTrvfLo3BsZ1IeFyLW/x2Z75IwjyUpYPyQo
	 0MjA7PddLmP/2t14rzrIhf08z2TgsRdbeg5L1BiipGOBkU2J8INXY86eg2/T9rgqdznSn
	 VMuAa5VSKMsuS3Cbz2A2oHZ7wsGFz/1mZnFRwhYJRZV+NdWDIQn1WQO19Mmow/EcMpNM3
	 f6FkiqyX1djSkSXvfNbPRK3M4UhGKow4vjrV0gslPloJNsLtWoPb3p2o2538ViPzTyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818250;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KYk/rYVUH9sKkLHkXPaswMG89OcnV7lqE2vPN5adjK0=;
	b=wbwUhqi7DDkD1EJwe2Cl2w7DxCMINt8d1O+HB5wXcDjGa857MO2KCAJXD/Vljyzq7+fC
	 s76ttVEzfstg6Oi1wRz+TcILqBM4CC/4y0MlQ6INZ9FE9ueTCsH2ATMc6bcE71m3fGDVf
	 /Zey9pEtxtZ+eKE39i6upN79pnp0t/wT7MXNQahtckWRBitxxu6D4P4+f639qC4YGxoSV
	 Jl0SGORjdo65c8Tu/qG6EkWV12NpZWCu55h6ZmNdVJL4R3QWDirg45boVosCnBwAoYBUV
	 nqA7I/e60ZuB+Er6E1uhh3CoCXxeGtRZImgU4fRyD4sN1thU6YfeB24rKAUEcU/7Ycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QU9y9kYT;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644546083617
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644546083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QU9y9kYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818248; x=1825354248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hkqOPs0MryBzncER5OPywGYkljtuY5Bq5ZseL6rJ+pc=;
  b=QU9y9kYTUMs703VklfKhZqnOsEzEDS6pRDCOsCYUFuy45BWu8TS1kNy8
   vpGPPNv0tLOUovqOPbE4F8f0c/kYoqg7bl725gBDEHXPeSo8mCDAw3/Ld
   eqOKVFvb6opyPLkpkpWlU07pFacwb5WT7OwbgPjBDnjiv0QnDlsOC67ZU
   ueWvUKBPoki+vXeMdKr8/lo0hhW00+OAsKdaeaToMPWenxGy7Hw6BmADu
   FaT7QFl+aO4rGL88pNYrhFIC31jBNV+1itzO+HyjpVzDZH2X0ASAxSoC7
   U2/8gXjZ5kJCq+ERYc1jI+442Y94sPv04IY3Oh+FQ6BaJvFF4lbkSl427
   g==;
X-CSE-ConnectionGUID: ja58wX0dSbeMSz38ofHwow==
X-CSE-MsgGUID: jaWsQyZNTw61duh+QFu/Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485021"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:48 -0800
X-CSE-ConnectionGUID: lvbRNwOcRfm7M5Jodr2Bcw==
X-CSE-MsgGUID: jK5s4yuTSN29JLxrgzf3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336772"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:48 -0800
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
Subject: [PATCH v4 3/9] stop_machine: Introduce stop_machine_nmi_cpuslocked()
Date: Wed,  4 Nov 2026 18:23:16 +0000
Message-ID: <20261104182322.578066-4-chang.seok.bae@intel.com>
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

With the NMI control logic in place, introduce an API to run the target
function from NMI context.

Originally-by: David Kaplan <david.kaplan@amd.com>
Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://lore.kernel.org/lkml/20260202105411.GVaYCCUygtEUNrMUtG@fat_crate.local
---
V3 -> V4: Remove the fallback prototype

  Tracking back the previous feedback on V1,
	  https://lore.kernel.org/lkml/87wm0zl8p2.ffs@tglx
  tglx gave this comment "That function should not be exposed at all when
  the config switch is off."

  So, the x86 microcode loader is the only user and the callsite should be
  compiled out when CONFIG_STOP_MACHINE_NMI=n.
---
 include/linux/stop_machine.h | 22 +++++++++++++++++
 kernel/stop_machine.c        | 46 ++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index b53b028296e0..af3218987f53 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -198,6 +198,28 @@ stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
 void arch_send_self_nmi(void);
 bool noinstr stop_machine_nmi_handler(void);
 
+/**
+ * stop_machine_nmi_cpuslocked() - Freeze CPUs and run a function in NMI context
+ *
+ * @nmisafe_fn:	The function to run
+ * @data:	The data pointer for @nmisafe_fn()
+ * @cpus:	The CPUs to run @nmisafe_fn() on (NULL = one unspecified online CPU)
+ *
+ * Description: This stop_machine() variant runs @nmisafe_fn() from NMI context
+ * to prevent preemption by other NMIs. The callback must be built with noinstr.
+ * Other than that, the semantics match stop_machine_cpuslocked().
+ *
+ * Context: Must be called from within a cpus_read_lock() protected region.
+ * Avoid nested calls to cpus_read_lock().
+ *
+ * Return: 0 if all invocations of @nmisafe_fn return zero, -ENOMEM if cpumask
+ * allocation fails, -EINVAL if not initialized yet or any target CPU failed to
+ * receive NMI. Otherwise, the value returned by an arbitrarily chosen member of
+ * the set of calls to @nmisafe_fn that returned non-zero.
+ */
+int stop_machine_nmi_cpuslocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data,
+				const struct cpumask *cpus);
+
 #else
 static inline bool stop_machine_nmi_handler(void) { return false; }
 #endif /* CONFIG_STOP_MACHINE_NMI */
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index ad01b7c5266c..2f3fe13cd3aa 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -802,6 +802,52 @@ static int multi_stop_run(struct multi_stop_data *msdata)
 	return msdata->use_nmi ? nmi_stop_run(msdata) : msdata->fn(msdata->data);
 }
 
+int stop_machine_nmi_cpuslocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data,
+				const struct cpumask *cpus)
+{
+	struct multi_stop_data msdata = {
+		.nmisafe_fn	= nmisafe_fn,
+		.data		= data,
+		.num_threads	= num_online_cpus(),
+		.active_cpus	= cpus,
+		.use_nmi	= true,
+	};
+	int ret;
+
+	if (!stop_machine_initialized)
+		return -EINVAL;
+
+	if (!zalloc_cpumask_var(&msdata.nmi_cpus, GFP_KERNEL))
+		return -ENOMEM;
+
+	/*
+	 * NMI CPUs should be exactly those 'active' CPUs executing the
+	 * stop function. Follow the selection logic in multi_cpu_stop()
+	 * if not provided.
+	 */
+	if (!msdata.active_cpus)
+		cpumask_set_cpu(cpumask_first(cpu_online_mask), msdata.nmi_cpus);
+	else
+		cpumask_and(msdata.nmi_cpus, msdata.active_cpus, cpu_online_mask);
+
+	lockdep_assert_cpus_held();
+
+	ret = stop_multi_cpus(&msdata);
+
+	/*
+	 * The NMI handler clears each CPU bit. If any of those NMIs were
+	 * ever missed out, return error clearly.
+	 */
+	if (!cpumask_empty(msdata.nmi_cpus)) {
+		pr_err("CPUs %*pbl didn't run the stop_machine NMI handler.\n",
+		       cpumask_pr_args(msdata.nmi_cpus));
+		ret = -EINVAL;
+	}
+
+	free_cpumask_var(msdata.nmi_cpus);
+	return ret;
+}
+
 #else
 
 static int multi_stop_run(struct multi_stop_data *msdata)
-- 
2.53.0

