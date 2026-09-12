Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB22F549F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173312; cv=none; b=Svh6xxcPN69/YAGHlaDijK25AxW3DpC7JbQrA2zgIYaOyHih0TN1esdDDt96WHa0C7+ay8si5DBTwIVsIodAhAaIEPCive7XU66a5UeMeOLX9rBizHeGVlxzTO+NqMeWvWV7ZYzY6z+z8uBm+y8XiagVWTg9koXSmOrxYwICzvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173312; c=relaxed/simple;
	bh=jSAeJNOqF8YEG9tUnSYtAHr8JZ8rjcLYO1EZl9WbSjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n00INe/enC63FzUeGPBcC8g4YHzNawRz2Bf3TwwxsVMWx9rtc92AcYjhZbV45bF5D3x55CZ5Ot64hTkd6vIlGFJher4xXyv9hdIzUlErv6i4Lqp5xEABFKg0BmHuJfsN1akYCaI0Pu3IfQdcJ00r2HByxfrADf84XPu0zBqDocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVIitJWR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVIitJWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173312; x=1820709312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSAeJNOqF8YEG9tUnSYtAHr8JZ8rjcLYO1EZl9WbSjU=;
  b=XVIitJWR0XG2iS92n9AWUxijf5+/jjeJ+G5mjLBQeZZBWx7kB2lDMP6S
   4yi7Bq/sqd/7sECQgsRkasi2AQ75KqVavtksEGaeNPCEJCIuuQZr1rEId
   fXwBROqViFoi5ifPye/obUMB076cSmud/V08lL+AOjssXXJhoHbnbBX/F
   NeU5l5nTK3jsrIfl3IFd8eip3tvSp8wHOXu82CxsABz3KPOSBOTlMO6bD
   eXeI/P+JNh4VMNETf5gONdiy3AxPSq7mfcMEMJa49rxwAOGp/xjJpjoTk
   fOOocKbX7OM/KYFyMlgdKAO5N65rYVszedlxNvjnV8Mv7lm5d0LgFu6nC
   w==;
X-CSE-ConnectionGUID: RHCbwAm1TaOMrGVOCLZKqQ==
X-CSE-MsgGUID: 5H680vRmTuGu/nacRH3Mew==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174983"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:11 -0700
X-CSE-ConnectionGUID: KNRLmKe5Q6OF3VHYiDueAw==
X-CSE-MsgGUID: rBfgnburTpOnyYO5OLdrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217693"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:11 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 7/8] x86/microcode/intel: Support uniform scope for early loading
Date: Sat, 12 Sep 2026 00:08:13 +0000
Message-ID: <20260912000815.997720-8-chang.seok.bae@intel.com>
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

The parallel bringup facility queries whether the architecture provides a
custom set of primary CPUs. Extend x86 hooks with the Intel-specific
logic so that the primary CPU selection matches the uniform loading
scope.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/core.c     |  9 +++
 arch/x86/kernel/cpu/microcode/intel.c    | 70 ++++++++++++++++++++++++
 arch/x86/kernel/cpu/microcode/internal.h |  4 ++
 3 files changed, 83 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index dfa311a2edbd..ed547f2b4601 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -906,14 +906,23 @@ static int mc_cpu_down_prep(unsigned int cpu)
 /*
  * Queried by the parallel bringup code to determine whether x86 provides a
  * custom primary CPU mask for early loading.
+ *
+ * Uniform loading scope is Intel-specific, so let the vendor code determine the
+ * primary CPU selection.
  */
 bool __init arch_cpuhp_primary_aware(void)
 {
+	if (x86_cpuid_vendor() == X86_VENDOR_INTEL)
+		return intel_primary_aware();
+
 	return __max_threads_per_core > 1;
 }
 
 const struct cpumask *__init arch_cpuhp_get_primary_cpus(void)
 {
+	if (x86_cpuid_vendor() == X86_VENDOR_INTEL)
+		return intel_get_primary_cpus();
+
 	return cpu_primary_thread_mask;
 }
 
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 4b5feee14712..6178bddb7f60 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -989,6 +989,76 @@ static __init bool staging_available(void)
 	return !!(val & MCU_STAGING);
 }
 
+bool __init intel_primary_aware(void)
+{
+	if (!microcode_intel_ops.use_uniform)
+		return __max_threads_per_core > 1;
+
+	switch (microcode_intel_ops.uniform_scope) {
+	case UNIFORM_SYS:
+		/*
+		 * The boot CPU performs the update for the entire system. But,
+		 * returning false would fall back to the SMT primary mask.
+		 * Return true to indicate the primary CPU clearly.
+		 */
+		return true;
+	case UNIFORM_PKG:
+		/* One primary core per package participates. */
+		return true;
+	case UNIFORM_DEFAULT:
+	case UNIFORM_CORE:
+		/*
+		 * Fallback to the legacy per-core loading, where the primary
+		 * CPU distinction matters only when SMT is on.
+		 */
+		break;
+	default:
+		/* Unknown scopes fall back to the legacy per-core scope. */
+		WARN_ON_ONCE(1);
+	}
+
+	return __max_threads_per_core > 1;
+}
+
+static struct cpumask primary_cpus __initdata;
+
+static void __init set_primary_cpus(void)
+{
+	if (!microcode_intel_ops.use_uniform) {
+		cpumask_copy(&primary_cpus, cpu_primary_thread_mask);
+		return;
+	}
+
+	switch (microcode_intel_ops.uniform_scope) {
+	case UNIFORM_SYS:
+		/*
+		 * CPU0 is guaranteed to be online and acts as the system
+		 * primary.
+		 */
+		cpumask_set_cpu(0, &primary_cpus);
+		break;
+	case UNIFORM_PKG:
+		/* One CPU per package is sufficient. */
+		cpumask_and(&primary_cpus, cpu_primary_core_mask, cpu_primary_thread_mask);
+		break;
+	case UNIFORM_DEFAULT:
+	case UNIFORM_CORE:
+	default:
+		cpumask_copy(&primary_cpus, cpu_primary_thread_mask);
+	}
+}
+
+/*
+ * The bringup code may query the mask more than once. Compute it on first use.
+ */
+const struct cpumask *__init intel_get_primary_cpus(void)
+{
+	if (cpumask_empty(&primary_cpus))
+		set_primary_cpus();
+
+	return &primary_cpus;
+}
+
 struct microcode_ops * __init init_intel_microcode(void)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 0a74794e0245..0552d66f4012 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -128,11 +128,15 @@ static inline void exit_amd_microcode(void) { }
 void load_ucode_intel_bsp(struct early_load_data *ed);
 void load_ucode_intel_ap(void);
 void reload_ucode_intel(void);
+bool intel_primary_aware(void);
+const struct cpumask *intel_get_primary_cpus(void);
 struct microcode_ops *init_intel_microcode(void);
 #else /* CONFIG_CPU_SUP_INTEL */
 static inline void load_ucode_intel_bsp(struct early_load_data *ed) { }
 static inline void load_ucode_intel_ap(void) { }
 static inline void reload_ucode_intel(void) { }
+static inline bool intel_primary_aware(void) { return false; }
+static inline const struct cpumask *intel_get_primary_cpus(void) { return cpu_none_mask; }
 static inline struct microcode_ops *init_intel_microcode(void) { return NULL; }
 #endif  /* !CONFIG_CPU_SUP_INTEL */
 
-- 
2.53.0

