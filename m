Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612292;
	b=Ryz5t0WtBbSFkUXmHvd+3jg2uhG/xboWCxslbZHzowaPwXBDVbsmyUNM999ktz3v1BXS
	 pl04yqQXEGAXYiGUyp0bIlib9lx+rdwYbiBH8VQ13rLOXVVt/4ThLbbr4Ur7hwOpenSoh
	 8/KNkMfjIIsQitPcnBXHW2IuUZvWX4YgAdzNUq1AsRsye4r9YJ2h6KWnIIMKqtIjje1wv
	 yoU9Fh+3/KJ/Gv0ITeeY2FaECSmm8JKp9Xia+zX8cGvzr7mIHe2XJltSExWFHMCnGFIN7
	 ZYIv7RYJwPa4yqlxhN+fS8uIuGNVyEkD0ZpL+DlIcuI2Pv7YUJoH9BLliOC35qHaVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612292;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=K9OgEhosXPpF7K9P03X9GTglI3n9+cOJqj5LkIzPlqE=;
	b=FAJt0LSWn8zUfZ4y7i2+3xK7+VCPSsQf+wRb4cKzg9GXQcfXZnooGLiwifvhdRGTVTQa
	 oeGOmK19FWSdrv4rqcOxPoYpX/im0CfPOsB9TjkoslpV0C0QprPyy3VEw6rbnhplJqh1V
	 f8Ia97/bKHaHzOXBT3vfYnSkQAtHcOi7/Y3IvU+TCQpEwXxAp3fRbxM4QhV6dg+VivWkg
	 kjiGAzfRRr9tpkv25bWDdDtpUTchGuemuG9c9fbild9oW/aYXCp3RHRJMImo1EeILA6Ns
	 ivAxIFbuqMDFzggffDRPj5kpioH2eWmR6IyXzhAipvLdnyi3lxfrJJA+/ulRPs+h3FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LVpDRFXE;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821560A3804
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0821560A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LVpDRFXE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612292; x=1824148292;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=TEqLEoc349M8awcd5ovbSUH3zLFHcxqrNVVg+ZKjgoY=;
  b=LVpDRFXE2r79i2lm9zIt85HcBtlKFWi0PPDhvr615Xb8+icqTEvYcr5X
   AGdNP/HmHxgM14vh1SVUy4sgjRaTIMQ/h5XHxjtAvCxrcCZYJvZL8ltpZ
   NjmWarzh1MIY/UQpAQyMV5IC+23gZ8ZteiELPdIOhxkD+sLxsy5ScUrDO
   8qc1NSojcDbTokDOe1mjRaUFttiJK3ZxN3hY6wY26nNtQStKUVVbeUKlx
   1uhF/KuHgSsL8E5QsuUZhCBviZHHjfAgWrV3NzUmla5ApXuxsou7WP880
   HvGxBmWry6stcT2iK79/RkXbChJefkvM53mwvbYEVQMMWuUpkk66VPo8z
   Q==;
X-CSE-ConnectionGUID: CmVnOv3VS6CbSpk5vYAj8g==
X-CSE-MsgGUID: SabA2nd2RNWMdpqVEJhaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230114"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230114"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:32 -0700
X-CSE-ConnectionGUID: VAuTG5StQwaAbX1kOb+9Jw==
X-CSE-MsgGUID: 3rt0vg/OQHu45qtS4q0wtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092094"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:31 -0700
Subject: [RFC][PATCH 08/24] x86/cpu: Add basic x86 kernel shadow stack infrastructure
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:31 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195131.6D21AF43@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Add a kernel shadow stack CPU feature and Kconfig option. Enable it
to help compile testing during development. This polarity will be
flipped in the eventual merge-ready code. TODO/FIXME.

Add the feature bit next to the userspace one. This requires a
minor amount of reshuffling of software bits.

On the naming, use "KERN" to make for nice natural vertical alignment
with "USER".

The Kconfig dependencies are not "real" yet. They represent the
dependencies present in the coming implementation.

---

 b/arch/x86/Kconfig                   |    9 +++++++++
 b/arch/x86/Kconfig.cpufeatures       |    5 +++++
 b/arch/x86/include/asm/cpufeatures.h |    9 +++++----
 b/arch/x86/kernel/cpu/common.c       |   14 ++++++++++----
 4 files changed, 29 insertions(+), 8 deletions(-)

diff -puN arch/x86/include/asm/cpufeatures.h~x86-kernel-shadow-stacks-base arch/x86/include/asm/cpufeatures.h
--- a/arch/x86/include/asm/cpufeatures.h~x86-kernel-shadow-stacks-base	2026-10-21 12:36:36.156877670 -0700
+++ b/arch/x86/include/asm/cpufeatures.h	2026-10-21 12:36:36.187877729 -0700
@@ -309,10 +309,10 @@
 #define X86_FEATURE_SMBA		(11*32+21) /* Slow Memory Bandwidth Allocation */
 #define X86_FEATURE_BMEC		(11*32+22) /* Bandwidth Monitoring Event Configuration */
 #define X86_FEATURE_USER_SHSTK		(11*32+23) /* "user_shstk" Shadow stack support for user mode applications */
-#define X86_FEATURE_SRSO		(11*32+24) /* AMD BTB untrain RETs */
-#define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* AMD BTB untrain RETs through aliasing */
-#define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* Issue an IBPB only on VMEXIT */
-#define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* IA32_TSC_DEADLINE and X2APIC MSRs need fencing */
+#define X86_FEATURE_KERN_SHSTK		(11*32+24) /* Kernel Shadow stack support */
+#define X86_FEATURE_SRSO		(11*32+25) /* AMD BTB untrain RETs */
+#define X86_FEATURE_SRSO_ALIAS		(11*32+26) /* AMD BTB untrain RETs through aliasing */
+#define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+27) /* Issue an IBPB only on VMEXIT */
 #define X86_FEATURE_ZEN2		(11*32+28) /* CPU based on Zen2 microarchitecture */
 #define X86_FEATURE_ZEN3		(11*32+29) /* CPU based on Zen3 microarchitecture */
 #define X86_FEATURE_ZEN4		(11*32+30) /* CPU based on Zen4 microarchitecture */
@@ -430,6 +430,7 @@
 #define X86_FEATURE_SUCCOR		(17*32+ 1) /* "succor" Uncorrectable error containment and recovery */
 #define X86_FEATURE_CPPC_PERF_PRIO	(17*32+ 2) /* CPPC Floor Perf support */
 #define X86_FEATURE_SMCA		(17*32+ 3) /* "smca" Scalable MCA */
+#define X86_FEATURE_APIC_MSRS_FENCE	(17*32+ 4) /* IA32_TSC_DEADLINE and X2APIC MSRs need fencing */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EDX), word 18 */
 #define X86_FEATURE_AVX512_4VNNIW	(18*32+ 2) /* "avx512_4vnniw" AVX-512 Neural Network Instructions */
diff -puN arch/x86/Kconfig~x86-kernel-shadow-stacks-base arch/x86/Kconfig
--- a/arch/x86/Kconfig~x86-kernel-shadow-stacks-base	2026-10-21 12:36:36.166877689 -0700
+++ b/arch/x86/Kconfig	2026-10-21 12:36:36.189877733 -0700
@@ -1865,6 +1865,15 @@ config X86_USER_SHADOW_STACK
 
 	  If unsure, say N.
 
+config X86_KERN_SHADOW_STACK
+	bool "X86 kernel shadow stack"
+	depends on X86_FRED # implies X86_64
+	# Shadow stacks are allocated next to the
+	# regular stack in the VMAP area:
+	depends on VMAP_STACK
+	depends on AS_WRUSS
+	select X86_CET
+
 config INTEL_TDX_HOST
 	bool "Intel Trust Domain Extensions (TDX) host support"
 	depends on CPU_SUP_INTEL
diff -puN arch/x86/Kconfig.cpufeatures~x86-kernel-shadow-stacks-base arch/x86/Kconfig.cpufeatures
--- a/arch/x86/Kconfig.cpufeatures~x86-kernel-shadow-stacks-base	2026-10-21 12:36:36.168877693 -0700
+++ b/arch/x86/Kconfig.cpufeatures	2026-10-21 12:36:36.189877733 -0700
@@ -205,3 +205,8 @@ config X86_DISABLED_FEATURE_SEV_SNP
 config X86_DISABLED_FEATURE_INVLPGB
 	def_bool y
 	depends on !BROADCAST_TLB_FLUSH
+
+config X86_DISABLED_FEATURE_KERN_SHSTK
+        def_bool y
+        depends on !X86_KERN_SHADOW_STACK
+
diff -puN arch/x86/kernel/cpu/common.c~x86-kernel-shadow-stacks-base arch/x86/kernel/cpu/common.c
--- a/arch/x86/kernel/cpu/common.c~x86-kernel-shadow-stacks-base	2026-10-21 12:36:36.184877724 -0700
+++ b/arch/x86/kernel/cpu/common.c	2026-10-21 12:36:36.189877733 -0700
@@ -634,20 +634,26 @@ __noendbr void ibt_restore(u64 save)
 
 static __always_inline void setup_cet(struct cpuinfo_x86 *c)
 {
-	bool user_shstk, kernel_ibt;
+	bool user_shstk = 0;
+	bool kern_shstk = 0;
+	bool kernel_ibt;
 
 	if (!IS_ENABLED(CONFIG_X86_CET))
 		return;
 
 	kernel_ibt = HAS_KERNEL_IBT && cpu_feature_enabled(X86_FEATURE_IBT);
-	user_shstk = cpu_feature_enabled(X86_FEATURE_SHSTK) &&
-		     IS_ENABLED(CONFIG_X86_USER_SHADOW_STACK);
+	if (cpu_feature_enabled(X86_FEATURE_SHSTK)) {
+		user_shstk = IS_ENABLED(CONFIG_X86_USER_SHADOW_STACK);
+		kern_shstk = IS_ENABLED(CONFIG_X86_KERN_SHADOW_STACK);
+	}
 
-	if (!kernel_ibt && !user_shstk)
+	if (!kernel_ibt && !user_shstk && !kern_shstk)
 		return;
 
 	if (user_shstk)
 		set_cpu_cap(c, X86_FEATURE_USER_SHSTK);
+	if (kern_shstk)
+		set_cpu_cap(c, X86_FEATURE_KERN_SHSTK);
 
 	if (kernel_ibt)
 		wrmsrq(MSR_IA32_S_CET, CET_ENDBR_EN);
_
