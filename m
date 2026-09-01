Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBA4A441D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306205; cv=none; b=i7O/qC7SgW0xrRgEGY3sl0W149t5ytceQqlybjnkLwIRzIf1+aQcP8LcE+uZkFcoNP70XEL3Gbdzd5PlYnJ64ad3JEVhjXHMcrzA1hvo0ghmPmEiB4+HTtsZ6+LA7WQHiVdSMVgeYZacBNZD853EfaidrK5Ehi/0Ne2kNfQv0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306205; c=relaxed/simple;
	bh=tAaLoUhI728wDlwgEmOtvEJGL4lrrkrloUQyfXITh1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0oW/Ij8uHBkbElaeCfzYntli7lw+jFcWv/52sMXZwcOEjvuWgyf5U8Ahv/VoHXq3LJqmldjPx1DOnNf6GA14pCWeqbUrXolILnYr1NZeNPJxxgjboQhZEjOyBDWRVBB3cKyQODkTbfG+wGnfD9m4plDuREhrdrfdo79ToLpAvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAKFFdYP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAKFFdYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306204; x=1819842204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tAaLoUhI728wDlwgEmOtvEJGL4lrrkrloUQyfXITh1E=;
  b=GAKFFdYPj7+nP8wHQJuAL+ntX6ymLLrwf9eDIYGFuo7XUGEMuQ9SZT9/
   wUCul0SEznEzcqBocWFPNxKQNSqDdbZdr1bVsiAob5t/3nB9GruGvE/Ke
   vRxgGLVo2YWMxitMXf6WBeUlZmaq/VOAejCv1UBTyCu4Boo3Y4B2jpJaF
   RCB/JoSg+frCr0heivlQ5D+bfi3dyfscI00I0IoMC/zzMONdpUomAQuuJ
   kkpVVrUTew2CihTy8fUHW0GA9NDlNB7z87ECzRaVjY2grrX5Xzti6wHiJ
   fAZmQ1LHM3h3ReyaCG/hJoQf6ULeiN8HIuKSJEEhD+81oQlaw+nN+DN8J
   A==;
X-CSE-ConnectionGUID: pIgxfycAT8utuLWPNvolKA==
X-CSE-MsgGUID: 6YzPI1kRQ9eR+FFQ2SzJyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891892"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:24 -0700
X-CSE-ConnectionGUID: 1vbDc5ACRfCeuHSXu2rUaw==
X-CSE-MsgGUID: ApSTwKdURTeuCA+Q6cff7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469903"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:24 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC 5/8] x86/microcode: Decouple minimum revision check from late loading
Date: Tue,  1 Sep 2026 23:16:30 +0000
Message-ID: <20260901231634.714144-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901231634.714144-1-chang.seok.bae@intel.com>
References: <20260901231634.714144-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode minimum revision check was originally introduced to express
dependencies involving OS-visible changes, thus it has been limited to
the late-load path.

In fact this can serve as a general guard against unsafe microcode
loading. Make the check independent of the loading path in preparation
for applying it to the early path as well.

For now, reject early loading if enforced. Taint the kernel on early
loading because the early path does not perform the check yet.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Note for the review:
The AMD loader does not have the minrev checker anywhere (yet). So,
force_minrev is effectively dis_ucode_ldr which may appear excessive.
Without enforcement though, it is going to taint the kernel on every
early loading then. This side-effect should be reviewed.
---
 .../admin-guide/kernel-parameters.txt         |  4 ++--
 arch/x86/Kconfig                              | 19 +++++++++----------
 arch/x86/kernel/cpu/microcode/amd.c           |  8 +++++++-
 arch/x86/kernel/cpu/microcode/core.c          | 13 ++++++++++---
 arch/x86/kernel/cpu/microcode/intel.c         | 17 ++++++++++++-----
 arch/x86/kernel/cpu/microcode/internal.h      |  1 +
 6 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cde092017cd8..b5f7a8142f58 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4073,8 +4073,8 @@ Kernel parameters
 
 			force_minrev[=<bool>]:
 			Enable or disable microcode minimal revision enforcement
-			for the runtime microcode loader according to <bool>. If
-			<bool> is not given, enable the enforcement.
+			for the microcode loader according to <bool>. If <bool>
+			is not given, enable the enforcement.
 
 	mini2440=	[ARM,HW,KNL]
 			Format:[0..2][b][c][t]
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..6c503004775e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1338,18 +1338,17 @@ config MICROCODE_LATE_LOADING
 	  minimal revision check. This minimal revision check can be enforced on
 	  the kernel command line with "microcode=force_minrev".
 
-config MICROCODE_LATE_FORCE_MINREV
-	bool "Enforce late microcode loading minimal revision check"
+config MICROCODE_FORCE_MINREV
+	bool "Enforce microcode loading minimal revision check"
 	default n
-	depends on MICROCODE_LATE_LOADING
+	depends on MICROCODE
 	help
-	  To prevent that users load microcode late which modifies already
-	  in use features, newer microcode patches have a minimum revision field
-	  in the microcode header, which tells the kernel which minimum
-	  revision must be active in the CPU to safely load that new microcode
-	  late into the running system. If disabled the check will not
-	  be enforced but the kernel will be tainted when the minimal
-	  revision check fails.
+	  To prevent that users load microcode which modifies already in use
+	  features, newer microcode patches have a minimum revision field in the
+	  microcode header, which tells the kernel which minimum revision must
+	  be active in the CPU to safely load that new microcode into the system.
+	  If disabled the check will not be enforced but the kernel will be
+	  tainted when the minimal revision check fails.
 
 	  This minimal revision check can also be controlled via the
 	  "microcode=force_minrev" parameter on the kernel command line.
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 6cdc410e7547..0625d5e8eb7e 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -800,6 +800,11 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 	/* Needed in load_microcode_amd() */
 	ucode_cpu_info[0].cpu_sig.sig = cpuid_1_eax;
 
+	if (force_minrev) {
+		pr_warn_once("No early load: minimum revision check is not implemented.\n");
+		return;
+	}
+
 	if (!find_blobs_in_containers(&cp))
 		return;
 
@@ -1202,7 +1207,8 @@ static int __init save_microcode_in_initrd(void)
 	enum ucode_state ret;
 	struct cpio_data cp;
 
-	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
+	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10 ||
+	    force_minrev)
 		return 0;
 
 	cpuid_1_eax = native_cpuid_eax(1);
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index ed1eb6b753d6..7d6caf191795 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -46,7 +46,7 @@
 static struct microcode_ops *microcode_ops;
 static bool dis_ucode_ldr;
 
-bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
+bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_FORCE_MINREV);
 
 /*
  * Those below should be behind CONFIG_MICROCODE_DBG ifdeffery but in
@@ -603,7 +603,7 @@ static int load_late_stop_cpus(bool is_safe)
 
 	if (!is_safe) {
 		pr_err("Late microcode loading without minimal revision check.\n");
-		pr_err("You should switch to early loading, if possible.\n");
+		pr_err("You should update microcode incrementally.\n");
 	}
 
 	/*
@@ -912,9 +912,16 @@ static int __init microcode_init(void)
 
 	pr_info_once("Current revision: 0x%08x\n", (early_data.new_rev ?: early_data.old_rev));
 
-	if (early_data.new_rev)
+	if (early_data.new_rev) {
 		pr_info_once("Updated early from: 0x%08x\n", early_data.old_rev);
 
+		if (!early_data.is_safe) {
+			pr_err("Early microcode loading without minimal revision check.\n");
+			pr_err("You should update microcode incrementally.\n");
+			add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+		}
+	}
+
 	microcode_fdev = faux_device_create("microcode", NULL, NULL);
 	if (!microcode_fdev)
 		return -ENODEV;
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index c502138fd8e9..3247c619eaa1 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -786,7 +786,15 @@ void __init load_ucode_intel_bsp(struct early_load_data *ed)
 	uci.mc = get_microcode_blob(&uci, false);
 	ed->old_rev = uci.cpu_sig.rev;
 
-	if (uci.mc && apply_microcode_early(&uci) == UCODE_UPDATED) {
+	if (!uci.mc)
+		return;
+
+	if (force_minrev) {
+		pr_warn_once("No early load: minimum revision check is not implemented.\n");
+		return;
+	}
+
+	if (apply_microcode_early(&uci) == UCODE_UPDATED) {
 		ucode_patch_va = UCODE_BSP_LOADED;
 		ed->new_rev = uci.cpu_sig.rev;
 	}
@@ -842,9 +850,8 @@ static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
 	int cur_rev = boot_cpu_data.microcode;
 
 	/*
-	 * When late-loading, ensure the header declares a minimum revision
-	 * required to perform a late-load. The previously reserved field
-	 * is 0 in older microcode blobs.
+	 * Ensure the header declares a minimum revision required to perform a
+	 * load. The previously reserved field is 0 in older microcode blobs.
 	 */
 	if (!mc_header->min_req_ver) {
 		pr_info("Unsafe microcode update: Microcode header does not specify a required min version\n");
@@ -857,7 +864,7 @@ static bool ucode_validate_minrev(struct microcode_header_intel *mc_header)
 	 */
 	if (cur_rev < mc_header->min_req_ver) {
 		pr_info("Unsafe microcode update: Current revision 0x%x too old\n", cur_rev);
-		pr_info("Current should be at 0x%x or higher. Use early loading instead\n", mc_header->min_req_ver);
+		pr_info("Current should be at 0x%x or higher. Update incrementally.\n", mc_header->min_req_ver);
 		return false;
 	}
 	return true;
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index a10b547eda1e..1b35f9099580 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -42,6 +42,7 @@ struct microcode_ops {
 struct early_load_data {
 	u32 old_rev;
 	u32 new_rev;
+	bool is_safe;
 };
 
 extern struct early_load_data early_data;
-- 
2.53.0

