Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D51A268
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173300; cv=none; b=C5zfs9NvXMQdJgnaZH+gBFhjObMvjsUUT8YUrdg/3oFABxUf9IYWnkpPfk16QEyHI/W3rl7zkz4/yak0epQLNnWVQrVM5Z9JQBHytreIxDHlW+VYTtsyMmaPIjUX2Ql0tog7D5WYXMeuhvH8KJumDbxM0RsRXScceJ3c8eD0cyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173300; c=relaxed/simple;
	bh=qe7XIhIewwHBV/9KsEFxItJNJXwxG5s13s91Wa/n9Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhyxTm61ZBiZ/WR8SMHCsTu0HZgr7fwISrbez3Hsfm8ifcUwrsFneiyL9uDOjWwTwWcYPcdVxI3EqljjsoYz4je4TmX4nFqai/cKgOSl3XHQ1G4vf7ocrbQmq7xUXPmUC5wbseDVVsVtkvqePM8zP5aYoUC98xSG4C01trqUB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4qsL3ok; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4qsL3ok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173299; x=1820709299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qe7XIhIewwHBV/9KsEFxItJNJXwxG5s13s91Wa/n9Zo=;
  b=V4qsL3ok28g9BqAdEnlxty8fijovmgDxXmVqIcUnoMFqEdfCEeJ7BzU7
   jhCyuh5NbBz5lEKkWXwlnbv7zaM3XqDrJO4AcFUAfdfdcfVBr+H7bsU9Q
   qpVIVq7F/505lBV9N4X1gSpbgTN7RdiG3MAvWB8MtQDXzJEceRJf82rsF
   vCMGp3CcPJJcB0lMQSkny2GxCjDaOuaY2nQzfHESrAo8REwoUBzFDwiGE
   qYLU9Nmo+iQgtKJog9dlaDnEx92nA1oKJqAtj0oHUZCNShJFQfR6FWpC5
   lWieKDZ4IgegrKKwzEe04Yxuvw7wKZM2YKDkavrCJlXkpic85yFLKv5pt
   Q==;
X-CSE-ConnectionGUID: alvGDlsGQmOXqDI6teOI8w==
X-CSE-MsgGUID: 67+7oD/CSFWdG15rfB2QhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174947"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:34:59 -0700
X-CSE-ConnectionGUID: L2XRBnIeRhWnh7Yd+ZvHbA==
X-CSE-MsgGUID: 3QoVzrcJSk644q0wHhcdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217561"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:34:58 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 1/8] cpu/hotplug: Allow architecture-specific primary CPU bringup
Date: Sat, 12 Sep 2026 00:08:07 +0000
Message-ID: <20260912000815.997720-2-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parallel CPU bringup currently proceeds in two phases: first for the SMT
primary threads and then second for the remaining secondary threads. This
ordering avoids race conditions, specifically for x86 microcode loading.

Upcoming x86 changes expand the microcode loading scope beyond a single
core to package scope or even system-wide updates. Introduce architecture
hooks that allow customizing which CPUs participate in the first phase:

 * arch_cpuhp_primary_aware() - indicates whether the architecture
   provides a custom primary CPU selection scheme, or not.

 * arch_cpuhp_get_primary_cpus() - returns a CPU mask for the first
   bringup iteration.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/Kconfig        | 4 ++++
 include/linux/cpu.h | 9 +++++++++
 kernel/cpu.c        | 8 ++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..f38d80d583bf 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config HOTPLUG_PARALLEL_ARCH_PRIMARY
+	bool
+	depends on HOTPLUG_PARALLEL
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 9b6b0d87fdb0..11e375d00df7 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -19,6 +19,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/cpuhplock.h>
 #include <linux/cpu_smt.h>
+#include <linux/cpumask.h>
 
 struct device;
 struct device_node;
@@ -233,4 +234,12 @@ int arch_prctl_get_branch_landing_pad_state(struct task_struct *t, unsigned long
 int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state);
 int arch_prctl_lock_branch_landing_pad_state(struct task_struct *t);
 
+#ifdef CONFIG_HOTPLUG_PARALLEL_ARCH_PRIMARY
+bool __init arch_cpuhp_primary_aware(void);
+const struct cpumask *__init arch_cpuhp_get_primary_cpus(void);
+#else
+static inline bool arch_cpuhp_primary_aware(void) { return false; }
+static inline const struct cpumask *arch_cpuhp_get_primary_cpus(void) { return cpu_none_mask; }
+#endif
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..5225f91c4d8c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1837,15 +1837,19 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
 	if (!__cpuhp_parallel_bringup)
 		return false;
 
-	if (cpuhp_smt_aware()) {
-		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
+	if (arch_cpuhp_primary_aware() || cpuhp_smt_aware()) {
 		static struct cpumask tmp_mask __initdata;
+		const struct cpumask *pmask;
 
 		/*
 		 * X86 requires to prevent that SMT siblings stopped while
 		 * the primary thread does a microcode update for various
 		 * reasons. Bring the primary threads up first.
 		 */
+		pmask = arch_cpuhp_primary_aware() ?
+			arch_cpuhp_get_primary_cpus() :
+			cpuhp_get_primary_thread_mask();
+
 		cpumask_and(&tmp_mask, mask, pmask);
 		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_BP_KICK_AP);
 		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_ONLINE);
-- 
2.53.0

