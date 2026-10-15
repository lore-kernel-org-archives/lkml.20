Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3765304B4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100510; cv=none; b=ihAJXFA/PtroIc9SDSd2iTSmGHrcQCxVuVyK0mmAY0jhY2OXcL5zBIxqYUcJd4TSYrQ7S/zRZvp1bIzzGH9isexHoxd2nxA+aBdi3NyHcJJVG1D7nPQCwQV1FKwBeQN9bLwmke0U92NGlQyDf0FN7anlWGekFgNDjGfPxNMs5s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100510; c=relaxed/simple;
	bh=5hJfAB5Z7uxuLKuMjLX36DNtLrRk5xX3TzpwD8HCLZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACFQ3AOyoln0r6YSfWrN6HCI9buTJUefiRkWDj9yv7+uNf6RjyHXRhcZslABiJPVzzfM7ytXSfIqJNyVHXyf6ZNiymn5qUvnuEbMyFR1hbkmmOPM+kkmQIwJ5HQbP+yxr0d06K4p9fukgk07JOwU4F2FIq3+wVjjN2dDsWJRPQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBXjPVF7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBXjPVF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100505; x=1823636505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hJfAB5Z7uxuLKuMjLX36DNtLrRk5xX3TzpwD8HCLZM=;
  b=SBXjPVF7UQMBm2XNpz2Uk1RKN8wMiyOQL2cUPgw1SpmdjJjgqBz67KUA
   b+mfCbW7VZdHKK9Fdse8kBCNI6x6h/0nwKS5ZQzD3UyjgwqB25l8e5wqf
   09wnxgMwWt7kTpZ3lI78bwUvugXRyb8KjLT/fcyLEeV2aJmtXecntDaDx
   /sdrmMlKlr9CETC9IMwlS30YJzDkVmBoVec6QaL2EbhqKAhBRSi7lDUMU
   WQ0ooRvyHMN8UeD1svOxFinxRwO4N1kce8GGR/7EaEpoa7g2uG62lSu/t
   ls+3k9qbm4rGldP71WKf7f6YG5rf/j+lplusLSPGndj3cZ+JQKp96lCAv
   Q==;
X-CSE-ConnectionGUID: GnLZaE6nS3u3Tt1ooyKUJg==
X-CSE-MsgGUID: tCqQDsaJQTO8t7KxxRDlRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902170"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:43 -0700
X-CSE-ConnectionGUID: bK9cgCVKShKx76HxrEpjPw==
X-CSE-MsgGUID: XVuvxCYsQgy6pYdE480VcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104417"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:43 -0700
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
Subject: [PATCH v3 7/9] x86/microcode: Use stop-machine NMI facility
Date: Thu, 15 Oct 2026 21:14:24 +0000
Message-ID: <20261015211426.49114-8-chang.seok.bae@intel.com>
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

The existing NMI-based loading logic explicitly sends NMIs to online CPUs
and invokes microcode_update_handler() from the NMI context. The
stop-machine NMI variant already provides the mechanism on x86.

Replace the custom NMI control logic with stop_machine_nmi_cpuslocked().

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/include/asm/microcode.h     |  1 -
 arch/x86/kernel/cpu/microcode/core.c | 19 +++----------------
 arch/x86/kernel/nmi.c                |  3 ---
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..c0d8e172d708 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1328,6 +1328,7 @@ config MICROCODE_LATE_LOADING
 	bool "Late microcode loading (DANGEROUS)"
 	default n
 	depends on MICROCODE && SMP
+	select STOP_MACHINE_NMI
 	help
 	  Loading microcode late, when the system is up and executing instructions
 	  is a tricky business and should be avoided if possible. Just the sequence
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 645e65ac1586..e6c09dc48efb 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -78,7 +78,6 @@ static inline u32 intel_get_microcode_revision(void)
 }
 #endif /* !CONFIG_CPU_SUP_INTEL */
 
-bool microcode_nmi_handler(void);
 void microcode_offline_nmi_handler(void);
 
 #ifdef CONFIG_MICROCODE_LATE_LOADING
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 9c006cc90047..73a46c6c74de 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -562,22 +562,9 @@ static noinstr int microcode_update_handler(void *unused)
  * path which must be NMI safe until the primary thread completed the
  * update.
  */
-bool noinstr microcode_nmi_handler(void)
+static noinstr int microcode_nmi_handler(void *data)
 {
-	if (!raw_cpu_read(ucode_ctrl.nmi_enabled))
-		return false;
-
-	raw_cpu_write(ucode_ctrl.nmi_enabled, false);
-	return microcode_update_handler(NULL) == 0;
-}
-
-static int stop_cpu_in_nmi(void *unused)
-{
-	/* Enable the NMI handler and raise NMI */
-	this_cpu_write(ucode_ctrl.nmi_enabled, true);
-	apic->send_IPI(smp_processor_id(), NMI_VECTOR);
-
-	return 0;
+	return microcode_update_handler(data);
 }
 
 static int load_late_stop_cpus(bool is_safe)
@@ -615,7 +602,7 @@ static int load_late_stop_cpus(bool is_safe)
 
 	if (microcode_ops->use_nmi) {
 		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
-		stop_machine_cpuslocked(stop_cpu_in_nmi, NULL, cpu_online_mask);
+		stop_machine_nmi_cpuslocked(microcode_nmi_handler, NULL, cpu_online_mask);
 		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
 	} else {
 		stop_machine_cpuslocked(microcode_update_handler, NULL, cpu_online_mask);
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 26f5ca1ac8a5..066ac297873e 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -386,9 +386,6 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 	if (stop_machine_nmi_handler())
 		goto out;
 
-	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
-		goto out;
-
 	/*
 	 * CPU-specific NMI must be processed before non-CPU-specific
 	 * NMI, otherwise we may lose it, because the CPU-specific
-- 
2.53.0

