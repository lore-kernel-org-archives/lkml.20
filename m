Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4C2F7EF5
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173314; cv=none; b=LfPMThhXZa1X98O1HCictbijFuYUBqf2J5x4/10m9mI9OfzaTlePl7S7GhbiwK7088RwySCXWun2T2KaeP4TTKfjSC6WmyZkYrudDumqaUwcAKIT41oI16lmFDsjuJlnv2mxGBN3XejOfpwkRZsTpyWMG4PIrNOmgTDfeLHhuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173314; c=relaxed/simple;
	bh=VazsLcKJUucH3Vht+P6pWie1oVKC3Ras5avUVWPi1hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gg7GFOpKrdRE3GMDj5h3hr9GaXktnwq6E5KE/pzAnoPkdSjGlQXJvvkUQofhofEb4B8y9txgVnU+QyX2junXJHD9pbNSRDyDbE3GWe/Iim/7KE/iWs1/MMb65puweVImyUyQkt2dr+mjdcWQQ299P+Bar4uVPxgzoDwuIabNr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1SPSlTm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1SPSlTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173313; x=1820709313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VazsLcKJUucH3Vht+P6pWie1oVKC3Ras5avUVWPi1hI=;
  b=A1SPSlTm8dqL8aU0cExhw4lpFheqP5zbcWu3vCrazfwRyuPehfpbw1jJ
   TazZUZVLp9eoKP6a0/cNCy0V9fgkaWZjaLFz2JiJYhd3KZpGVrf8uSHHQ
   Pz9z/tz/kN3JuzPHhBmg3MJXTZu38wmC08r+04yUZevtM3pgQCWJKVPwg
   Yy3dQ3x2Np9xXj5Gg92Jgx8VLs/9sv2Dnr+mv/YO2dln1Zw2A8M5BCq0y
   mn5QxlAaj6wHf+s0hCjMl0W/wLAU3DqxVHuS/0AHd0gzRIO/XTsUU9L9+
   DR+z6UwMQa/lQqTHxgd/5eb0Nl7PQ0GkIyL8dA5aGhZl1N15ld9sHGZjS
   Q==;
X-CSE-ConnectionGUID: 6tNM7cfHRGmO073G9nK01Q==
X-CSE-MsgGUID: 2gKy3MMtSBSyWzRLcOmVmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174988"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:13 -0700
X-CSE-ConnectionGUID: o6Nk2K7nSqK89mjcozDc6Q==
X-CSE-MsgGUID: h5E1atBAQzGpoo6CSQ1kAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217724"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:12 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 8/8] x86/microcode/intel: Enable uniform loading
Date: Sat, 12 Sep 2026 00:08:14 +0000
Message-ID: <20260912000815.997720-9-chang.seok.bae@intel.com>
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

Uniform scopes are now available for both early- and late-loading paths.
This feature simplifies the loading process by reducing the number of
update triggers.

Ignoring the CPU's uniform scope results in more triggers than necessary.
While this behavior is acceptable, it can increase update latency,
particularly for the late-loading path. Enable the feature.

Certain invalid states, such as incomplete firmware configuration or an
unknown loading scope, can leave the update mechanism unreliable. Detect
those conditions early and disable the loader before any update occurs.

Module, tile, and die scopes are also possible, but currently reserved
for future implementations. Treat them as equivalent to the default
per-core scope.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/include/asm/microcode.h      |  2 +
 arch/x86/include/asm/msr-index.h      | 10 ++++
 arch/x86/kernel/cpu/microcode/core.c  |  5 ++
 arch/x86/kernel/cpu/microcode/intel.c | 69 +++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 645e65ac1586..710b79aa03ec 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -21,11 +21,13 @@ void load_ucode_bsp(void);
 void load_ucode_ap(void);
 void microcode_bsp_resume(void);
 bool __init microcode_loader_disabled(void);
+void __init microcode_disable_loader(void);
 #else
 static inline void load_ucode_bsp(void)	{ }
 static inline void load_ucode_ap(void) { }
 static inline void microcode_bsp_resume(void) { }
 static inline bool __init microcode_loader_disabled(void) { return false; }
+static inline bool __init microcode_disable_loader(void) { }
 #endif
 
 extern unsigned long initrd_start_early;
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3a8e51a0c9e8..6a412371e02f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -975,7 +975,17 @@
 #define MSR_IA32_UCODE_WRITE		0x00000079
 
 #define MSR_IA32_MCU_ENUMERATION	0x0000007b
+#define MCU_UNIFORM_AVAIL		BIT(0)
+#define MCU_UNIFORM_CONFIG_REQD		BIT(1)
+#define MCU_UNIFORM_CONFIG_COMPLETE	BIT(2)
 #define MCU_STAGING			BIT(4)
+#define MCU_UNIFORM_SCOPE		GENMASK(15, 8)
+#define MCU_UNIFORM_SCOPE_CORE		0x02
+#define MCU_UNIFORM_SCOPE_MODULE	0x03
+#define MCU_UNIFORM_SCOPE_TILE		0x04
+#define MCU_UNIFORM_SCOPE_DIE		0x05
+#define MCU_UNIFORM_SCOPE_PACKAGE	0x80
+#define MCU_UNIFORM_SCOPE_PLATFORM	0xc0
 
 #define MSR_IA32_UCODE_REV		0x0000008b
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index ed547f2b4601..887ffdc814de 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -111,6 +111,11 @@ static bool amd_check_current_patch_level(void)
 	return false;
 }
 
+void __init microcode_disable_loader(void)
+{
+	dis_ucode_ldr = true;
+}
+
 bool __init microcode_loader_disabled(void)
 {
 	if (dis_ucode_ldr)
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 6178bddb7f60..e6c2b693f30b 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -23,6 +23,7 @@
 #include <linux/uio.h>
 #include <linux/io.h>
 #include <linux/mm.h>
+#include <linux/bitfield.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/cpuid/api.h>
@@ -69,6 +70,8 @@ static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
 
 #define MBOX_XACTION_TIMEOUT_MS	(10 * MSEC_PER_SEC)
 
+#define CPUID_EDX_ARCH_CAP	BIT(29)
+
 /* Current microcode patch used in early patching on the APs. */
 static struct microcode_intel *ucode_patch_va __read_mostly;
 static struct microcode_intel *ucode_patch_late __read_mostly;
@@ -737,11 +740,21 @@ static int __init save_builtin_microcode(void)
 }
 early_initcall(save_builtin_microcode);
 
+static __init void setup_uniform(void);
+
 /* Load microcode on BSP from initrd or builtin blobs */
 void __init load_ucode_intel_bsp(struct early_load_data *ed)
 {
 	struct ucode_cpu_info uci;
 
+	/*
+	 * The loader could be disabled during the uniform setup if any firmware
+	 * misconfiguration is found.
+	 */
+	setup_uniform();
+	if (microcode_loader_disabled())
+		return;
+
 	uci.mc = get_microcode_blob(&uci, false);
 	ed->old_rev = uci.cpu_sig.rev;
 
@@ -989,6 +1002,62 @@ static __init bool staging_available(void)
 	return !!(val & MCU_STAGING);
 }
 
+static __init void setup_uniform(void)
+{
+	u64 val;
+
+	if (native_cpuid_eax(0) < 7)
+		return;
+
+	if (!(native_cpuid_edx(7) & CPUID_EDX_ARCH_CAP))
+		return;
+
+	if (!(native_rdmsrq(MSR_IA32_ARCH_CAPABILITIES) & ARCH_CAP_MCU_ENUM))
+		return;
+
+	val = native_rdmsrq(MSR_IA32_MCU_ENUMERATION);
+	if (!(val & MCU_UNIFORM_AVAIL))
+		return;
+
+	/*
+	 * Ensure that the firmware did all the necessary steps. Any improper
+	 * configuration makes the update mechanism unusable.
+	 */
+	if (val & MCU_UNIFORM_CONFIG_REQD && !(val & MCU_UNIFORM_CONFIG_COMPLETE)) {
+		microcode_disable_loader();
+		pr_err("loading disabled: incomplete firmware configuration.\n");
+		return;
+	}
+
+	/*
+	 * Configure the uniform scope accordingly. To make it simple, treat all
+	 * scopes narrower than the package scope as per-core scope.
+	 */
+	switch (FIELD_GET(MCU_UNIFORM_SCOPE, val)) {
+	case MCU_UNIFORM_SCOPE_MODULE:
+	case MCU_UNIFORM_SCOPE_TILE:
+	case MCU_UNIFORM_SCOPE_DIE:
+		pr_info("Uniform scope is narrower than package, using core scope.\n");
+		fallthrough;
+	case MCU_UNIFORM_SCOPE_CORE:
+		microcode_intel_ops.uniform_scope = UNIFORM_CORE;
+		break;
+	case MCU_UNIFORM_SCOPE_PACKAGE:
+		microcode_intel_ops.uniform_scope = UNIFORM_PKG;
+		break;
+	case MCU_UNIFORM_SCOPE_PLATFORM:
+		microcode_intel_ops.uniform_scope = UNIFORM_SYS;
+		break;
+	default:
+		microcode_disable_loader();
+		pr_err("loading disabled: unknown uniform scope.\n");
+		return;
+	}
+
+	microcode_intel_ops.use_uniform = true;
+	pr_info("Enabled uniform feature.\n");
+}
+
 bool __init intel_primary_aware(void)
 {
 	if (!microcode_intel_ops.use_uniform)
-- 
2.53.0

