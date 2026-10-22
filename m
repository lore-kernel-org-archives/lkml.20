Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641666;
	b=dA1Q1BzzI7BpoEK8VgVVy3fcKFFWJqgX1afl/i4QqtCmTNn+H6kBULpb6Rxgi4T3YKJ5
	 KEiWVjnt2nGU+Wl85B4/dr8D/nEytllSmmo3urBEoq+IrQL5hrrLHG9eOafQe6yZqI+sd
	 1inlqIgp6230njqZ3wsrYRRLj9UkkF7Fe+gKP2tuo31+pj0HFj6hSW0NVL/54BpROZvKT
	 YkqJ3zoG+YRZwDMkXxyZMakHq3rT8HWnfwL0eiUdgpdUuqDVfAElmJm40pBo4TkUbeFvH
	 QTs4kuxeaVfUHk4YgFdGrED8x1H5ieWPh1H4BpXUjfyQgB8oTxasysbWwaq9Sf0qKvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641666;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=f+2B8XcGwW4aiiJVapgagOKoGAXeHs6Szs9MYTUj93k=;
	b=2gOVdYhEEWaGsWyQBE0mPM9L4nqUKEC0gAgL2IS5wCvwV8rlPBq0KDk6abxue28ujB+9
	 yMZ+hkb/70Z6SvTWVbwFwSQZ5AOWtX2onwTODLOK8q0Z5kpWTctlxd9HTd+gc6tAKIJNn
	 5XmgC/A5pQZXPsUDukqJP0fYJy1vtKtRBC2MCdJ18eCJaj4GpJgB0OzN947IVDk5S3c2y
	 dKzUjDKRicIGj6C7eIJgPYrKQc3zYN99c2b/9Sr1pJhSKLBLSX6MR3hqD/ci1OiaB+6Kp
	 60r4DhKfdlaAORHk8c1yoHpN+fnf5+Uu0Ow3yD2dkkdC4KarAUnihMcfH3iJ9nFLR2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gKNtOxHI;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E5D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gKNtOxHI
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4973040E047F;
	Thu, 22 Oct 2026 04:00:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KrjKjto0bd1I; Thu, 22 Oct 2026 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792641653; bh=f+2B8XcGwW4aiiJVapgagOKoGAXeHs6Szs9MYTUj93k=;
	h=Date:From:To:Cc:Subject:From;
	b=gKNtOxHIaMkCoh3LQPn/VCnijDZyLuRXGi11jiOq4X0M6sRxOR4rbfhAvmF6YnkX6
	 Svb+UHl4u5RUL3hozLRapxIdyLKVRZKaz614SU08a7gcIekA2NpWH/w0SAsYMo94aJ
	 jn3HX25xfH72vLGIQCbio9XJiWvT7lErke1irnuHImVPXR9NmU/fPIWBhdelEOYTUx
	 jP1zRw039JjFMSIq18y1a3GfSPE/WowNHkUMZAPt6qF2dvkTfaktGkMDoKGpK/hk8l
	 koPgERNjnbH+mPZr0NWrHG3Z0KyH3luE93HR9WwHBQTXs3lpJn/kjABsOsHobSNoBm
	 UCwOWXmPRp9J6reDBljVZOGblpNKfH/8f/xzToIwbPPWTmym+y9qeA0uQYfShuR+fw
	 ASfpMR0GtLsJozzfIEOr18qMNxrigHUCC6RrOXNOs37/FOZ9Ai4wrkkXMM614swvs0
	 cKcyPL5SGvG88ws0LOepCmsRRLNOg9zYi9bRAjwFy9fKWjl31pzJSoz50xKlnAkNUl
	 PJYrQdsgpIjM3UeWvbeKJ8qiuUFbUT6QRz7YHF9xb+d6wB2LF5PQLccNk9Tsj4+Bqj
	 rK3xfYrQXdCcO8EgfXKZEnCFn1Actlm6WSRI2d4KOwIBdLrVLMGGp5gsbmQRxxYfD9
	 6o0DP7QHf/xz2YzM7zcf1Xq0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B512740E01D2;
	Thu, 22 Oct 2026 04:00:50 +0000 (UTC)
Date: Wed, 21 Oct 2026 21:00:47 -0700
From: Borislav Petkov <bp@alien8.de>
To: x86-ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I have been wondering how to improve that Zen uarch detection and handling and
be able to do range checks of uarches, i.e., "this code needs to run on Zen
microarchitectures 3 to 5". And I asked AI.

It gave me a lot of blurb but the basic idea is good so I went and did it. See
below.

It boots in a VM, I'm not even trying to cause the cat to catch fire by
booting on a real machine but that will happen soon too.

The thing can easily be extended to pre-Zen but that is not really needed, I'd
say.

X86_FEATURE_ZEN to mark all Zens remains, that will be a future patch. Perhaps
something as simple as:

	if (boot_cpu_data.x86_uarch)

but I have to move Hygon off of that usage. We'll see. Small steps.

Thx.

---

Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Mon Oct 12 22:42:51 2026 -0700

Not-Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 49b6b8fce566..e61857c74c16 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -291,13 +291,13 @@ static const u64 amd_zen4_perfmon_event_map[PERF_COUNT_HW_MAX] =
 
 static u64 amd_pmu_event_map(int hw_event)
 {
-	if (cpu_feature_enabled(X86_FEATURE_ZEN4) || boot_cpu_data.x86 >= 0x1a)
+	if (boot_cpu_data.x86_uarch >= AMD_UARCH_ZEN4)
 		return amd_zen4_perfmon_event_map[hw_event];
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2) || boot_cpu_data.x86 >= 0x19)
+	if (boot_cpu_data.x86_uarch >= AMD_UARCH_ZEN2)
 		return amd_zen2_perfmon_event_map[hw_event];
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN1))
+	if (boot_cpu_data.x86_uarch >= AMD_UARCH_ZEN1)
 		return amd_zen1_perfmon_event_map[hw_event];
 
 	return amd_perfmon_event_map[hw_event];
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c23b8c..bc699050131a 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -415,7 +415,8 @@ static int perf_ibs_init(struct perf_event *event)
 		config |= (ldlat - 1) << IBS_OP_LDLAT_THRSH_SHIFT;
 
 		config |= IBS_OP_LDLAT_EN;
-		if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+
+		if (boot_cpu_data.x86_uarch == AMD_UARCH_ZEN5)
 			config |= IBS_OP_L3MISSONLY;
 	}
 
diff --git a/arch/x86/include/asm/cpu_device_id.h b/arch/x86/include/asm/cpu_device_id.h
index c62d8fae52c3..50ea0eefcd06 100644
--- a/arch/x86/include/asm/cpu_device_id.h
+++ b/arch/x86/include/asm/cpu_device_id.h
@@ -5,13 +5,13 @@
 /*
  * Can't use <linux/bitfield.h> because it generates expressions that
  * cannot be used in structure initializers. Bitfield construction
- * here must match the union in struct cpuinfo_86:
+ * here must match the union in struct cpuinfo_x86:
  *	union {
  *		struct {
  *			__u8	x86_model;
  *			__u8	x86;
  *			__u8	x86_vendor;
- *			__u8	x86_reserved;
+ *			__u8	x86_uarch;
  *		};
  *		__u32		x86_vfm;
  *	};
@@ -19,11 +19,11 @@
 #define VFM_MODEL_BIT	0
 #define VFM_FAMILY_BIT	8
 #define VFM_VENDOR_BIT	16
-#define VFM_RSVD_BIT	24
+#define VFM_UARCH_BIT	24
 
 #define	VFM_MODEL_MASK	GENMASK(VFM_FAMILY_BIT - 1, VFM_MODEL_BIT)
 #define	VFM_FAMILY_MASK	GENMASK(VFM_VENDOR_BIT - 1, VFM_FAMILY_BIT)
-#define	VFM_VENDOR_MASK	GENMASK(VFM_RSVD_BIT - 1, VFM_VENDOR_BIT)
+#define	VFM_VENDOR_MASK	GENMASK(VFM_UARCH_BIT - 1, VFM_VENDOR_BIT)
 
 #define VFM_MODEL(vfm)	(((vfm) & VFM_MODEL_MASK) >> VFM_MODEL_BIT)
 #define VFM_FAMILY(vfm)	(((vfm) & VFM_FAMILY_MASK) >> VFM_FAMILY_BIT)
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f62944700975..1302cd3edfb8 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -74,8 +74,8 @@
 #define X86_FEATURE_CYRIX_ARR		( 3*32+ 2) /* "cyrix_arr" Cyrix ARRs (= MTRRs) */
 #define X86_FEATURE_CENTAUR_MCR		( 3*32+ 3) /* "centaur_mcr" Centaur MCRs (= MTRRs) */
 #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
-#define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture */
-#define X86_FEATURE_ZEN6		( 3*32+ 6) /* CPU based on Zen6 microarchitecture */
+/* unused, was: #define X86_FEATURE_ZEN5		( 3*32+ 5) * CPU based on Zen5 microarchitecture */
+/* unused, was: #define X86_FEATURE_ZEN6		( 3*32+ 6) * CPU based on Zen6 microarchitecture */
 #define X86_FEATURE_RMPOPT		( 3*32+ 7) /* Support for AMD RMPOPT instruction */
 #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a constant rate */
 /* free: was #define X86_FEATURE_UP	( 3*32+ 9) * "up" SMP kernel running on UP */
@@ -313,10 +313,10 @@
 #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* AMD BTB untrain RETs through aliasing */
 #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* Issue an IBPB only on VMEXIT */
 #define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* IA32_TSC_DEADLINE and X2APIC MSRs need fencing */
-#define X86_FEATURE_ZEN2		(11*32+28) /* CPU based on Zen2 microarchitecture */
-#define X86_FEATURE_ZEN3		(11*32+29) /* CPU based on Zen3 microarchitecture */
-#define X86_FEATURE_ZEN4		(11*32+30) /* CPU based on Zen4 microarchitecture */
-#define X86_FEATURE_ZEN1		(11*32+31) /* CPU based on Zen1 microarchitecture */
+/* unused, was #define X86_FEATURE_ZEN2		(11*32+28) * CPU based on Zen2 microarchitecture */
+/* unused, was: #define X86_FEATURE_ZEN3	(11*32+29) * CPU based on Zen3 microarchitecture */
+/* unused, was: #define X86_FEATURE_ZEN4	(11*32+30) * CPU based on Zen4 microarchitecture */
+/* unused, was: #define X86_FEATURE_ZEN1	(11*32+31) * CPU based on Zen1 microarchitecture */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1 (EAX), word 12 */
 #define X86_FEATURE_SHA512		(12*32+ 0) /* SHA512 instructions */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c..03e75b6ad9d3 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -77,6 +77,19 @@ enum x86_topology_cpu_type {
 	TOPO_CPU_TYPE_UNKNOWN,
 };
 
+/*
+ * Ordered list of uarches so that range etc checks can work.
+ */
+enum amd_uarch {
+	AMD_UARCH_UNKNOWN = 0,
+	AMD_UARCH_ZEN1,
+	AMD_UARCH_ZEN2,
+	AMD_UARCH_ZEN3,
+	AMD_UARCH_ZEN4,
+	AMD_UARCH_ZEN5,
+	AMD_UARCH_ZEN6
+};
+
 struct cpuinfo_topology {
 	// Real APIC ID read from the local APIC
 	u32			apicid;
@@ -145,7 +158,8 @@ struct cpuinfo_x86 {
 			__u8	x86;
 			/* CPU vendor */
 			__u8	x86_vendor;
-			__u8	x86_reserved;
+			/* AMD: CPU uarch number */
+			__u8	x86_uarch;
 		};
 		/* combined vendor, family, model */
 		__u32		x86_vfm;
diff --git a/arch/x86/kernel/acpi/cppc.c b/arch/x86/kernel/acpi/cppc.c
index bbade0da5130..fc06a78b3cfc 100644
--- a/arch/x86/kernel/acpi/cppc.c
+++ b/arch/x86/kernel/acpi/cppc.c
@@ -260,7 +260,7 @@ int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator)
 	 * the highest performance level is set to 196.
 	 * https://bugzilla.kernel.org/show_bug.cgi?id=218759
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
+	if (boot_cpu_data.x86_uarch == AMD_UARCH_ZEN4) {
 		switch (boot_cpu_data.x86_model) {
 		case 0x70 ... 0x7f:
 			*numerator = CPPC_HIGHEST_PERF_PERFORMANCE;
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 3972966cb023..2df33d59c185 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -367,8 +367,7 @@ static void bsp_determine_snp(struct cpuinfo_x86 *c)
 		 * instruction.
 		 */
 		if (!cpu_has(c, X86_FEATURE_HYPERVISOR) &&
-		    (cpu_feature_enabled(X86_FEATURE_ZEN3) ||
-		     cpu_feature_enabled(X86_FEATURE_ZEN4) ||
+		    (c->x86_uarch >= AMD_UARCH_ZEN3 ||
 		     cpu_feature_enabled(X86_FEATURE_RMPREAD)) &&
 		    snp_probe_rmptable_info()) {
 			cc_platform_set(CC_ATTR_HOST_SEV_SNP);
@@ -409,8 +408,8 @@ static void tsa_init(struct cpuinfo_x86 *c)
 	if (cpu_has(c, X86_FEATURE_HYPERVISOR))
 		return;
 
-	if (cpu_has(c, X86_FEATURE_ZEN3) ||
-	    cpu_has(c, X86_FEATURE_ZEN4)) {
+	if (c->x86_uarch >= AMD_UARCH_ZEN3 &&
+	    c->x86_uarch <= AMD_UARCH_ZEN4) {
 		if (x86_match_min_microcode_rev(amd_tsa_microcode))
 			setup_force_cpu_cap(X86_FEATURE_VERW_CLEAR);
 		else
@@ -483,13 +482,13 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		switch (c->x86_model) {
 		case 0x00 ... 0x2f:
 		case 0x50 ... 0x5f:
-			setup_force_cpu_cap(X86_FEATURE_ZEN1);
+			c->x86_uarch = AMD_UARCH_ZEN1;
 			break;
 		case 0x30 ... 0x4f:
 		case 0x60 ... 0x7f:
 		case 0x90 ... 0x91:
 		case 0xa0 ... 0xaf:
-			setup_force_cpu_cap(X86_FEATURE_ZEN2);
+			c->x86_uarch = AMD_UARCH_ZEN2;
 			break;
 		default:
 			goto warn;
@@ -500,11 +499,11 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		switch (c->x86_model) {
 		case 0x00 ... 0x0f:
 		case 0x20 ... 0x5f:
-			setup_force_cpu_cap(X86_FEATURE_ZEN3);
+			c->x86_uarch = AMD_UARCH_ZEN3;
 			break;
 		case 0x10 ... 0x1f:
 		case 0x60 ... 0xaf:
-			setup_force_cpu_cap(X86_FEATURE_ZEN4);
+			c->x86_uarch = AMD_UARCH_ZEN4;
 			break;
 		default:
 			goto warn;
@@ -517,13 +516,13 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		case 0x40 ... 0x4f:
 		case 0x60 ... 0x7f:
 		case 0xd0 ... 0xd7:
-			setup_force_cpu_cap(X86_FEATURE_ZEN5);
+			c->x86_uarch = AMD_UARCH_ZEN5;
 			break;
 		case 0x50 ... 0x5f:
 		case 0x80 ... 0xaf:
 		case 0xc0 ... 0xcf:
 		case 0xd8 ... 0xef:
-			setup_force_cpu_cap(X86_FEATURE_ZEN6);
+			c->x86_uarch = AMD_UARCH_ZEN6;
 			break;
 		default:
 			goto warn;
@@ -1090,16 +1089,15 @@ static void init_amd(struct cpuinfo_x86 *c)
 	if (c->x86 >= 0x17)
 		init_amd_zen_common();
 
-	if (boot_cpu_has(X86_FEATURE_ZEN1))
-		init_amd_zen1(c);
-	else if (boot_cpu_has(X86_FEATURE_ZEN2))
-		init_amd_zen2(c);
-	else if (boot_cpu_has(X86_FEATURE_ZEN3))
-		init_amd_zen3(c);
-	else if (boot_cpu_has(X86_FEATURE_ZEN4))
-		init_amd_zen4(c);
-	else if (boot_cpu_has(X86_FEATURE_ZEN5))
-		init_amd_zen5(c);
+	switch (c->x86_uarch) {
+	case AMD_UARCH_ZEN1:	init_amd_zen1(c);	break;
+	case AMD_UARCH_ZEN2:	init_amd_zen2(c);	break;
+	case AMD_UARCH_ZEN3:	init_amd_zen3(c);	break;
+	case AMD_UARCH_ZEN4:	init_amd_zen4(c);	break;
+	case AMD_UARCH_ZEN5:	init_amd_zen5(c);	break;
+	default: break;
+	}
+
 
 	/*
 	 * Enable workaround for FXSAVE leak on CPUs
@@ -1329,7 +1327,7 @@ void amd_check_microcode(void)
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return;
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
+	if (boot_cpu_data.x86_uarch == AMD_UARCH_ZEN2)
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
 
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 3b037e385523..5b5177d44f8d 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1258,15 +1258,11 @@ static bool __init avic_want_avic_enabled(void)
 {
 	/*
 	 * In "auto" mode, enable AVIC by default for Zen4+ if x2AVIC is
-	 * supported (to avoid enabling partial support by default, and because
-	 * x2AVIC should be supported by all Zen4+ CPUs).  Explicitly check for
-	 * family 0x1A and later (Zen5+), as the kernel's synthetic ZenX flags
-	 * aren't inclusive of previous generations, i.e. the kernel will set
-	 * at most one ZenX feature flag.
+	 * supported (to avoid enabling partial support by default, and
+	 * because x2AVIC should be supported by all Zen4+ CPUs).
 	 */
 	if (avic == AVIC_AUTO_MODE)
-		avic = boot_cpu_has(X86_FEATURE_X2AVIC) &&
-		       (cpu_feature_enabled(X86_FEATURE_ZEN4) || boot_cpu_data.x86 >= 0x1A);
+		avic = boot_cpu_has(X86_FEATURE_X2AVIC) && boot_cpu_data.x86_uarch >= AMD_UARCH_ZEN4;
 
 	if (!avic || !npt_enabled)
 		return false;
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 8bfd46d60843..258d95e5ff6d 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -165,7 +165,7 @@ static int __init dmi_matched_7k62_bios_bug(const struct dmi_system_id *dmi)
 	 * broken BIOS lack of nominal_freq and lowest_freq capabilities
 	 * definition in ACPI tables
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
+	if (boot_cpu_data.x86_uarch == AMD_UARCH_ZEN2) {
 		quirks = dmi->driver_data;
 		pr_info("Overriding nominal and lowest frequencies for %s\n", dmi->ident);
 		return 1;
@@ -2218,27 +2218,35 @@ static bool amd_cppc_supported(void)
 	 * debugging purposes. Besides, it may still be possible for
 	 * the driver to work using the shared-memory mechanism.
 	 */
-	if (!cpu_feature_enabled(X86_FEATURE_CPPC)) {
-		if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
-			switch (c->x86_model) {
-			case 0x60 ... 0x6F:
-			case 0x80 ... 0xAF:
-				warn = true;
-				break;
-			}
-		} else if (cpu_feature_enabled(X86_FEATURE_ZEN3) ||
-			   cpu_feature_enabled(X86_FEATURE_ZEN4)) {
-			switch (c->x86_model) {
-			case 0x10 ... 0x1F:
-			case 0x40 ... 0xAF:
-				warn = true;
-				break;
-			}
-		} else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
+	if (cpu_feature_enabled(X86_FEATURE_CPPC))
+		goto skip;
+
+	switch (boot_cpu_data.x86_uarch) {
+	case AMD_UARCH_ZEN2:
+		switch (c->x86_model) {
+		case 0x60 ... 0x6F:
+		case 0x80 ... 0xAF:
+			warn = true;
+			break;
+		}
+		break;
+	case AMD_UARCH_ZEN3:
+	case AMD_UARCH_ZEN4:
+		switch (c->x86_model) {
+		case 0x10 ... 0x1F:
+		case 0x40 ... 0xAF:
 			warn = true;
+			break;
 		}
+		break;
+	case AMD_UARCH_ZEN5:
+		warn = true;
+		break;
+	default:
+		break;
 	}
 
+skip:
 	if (warn)
 		pr_warn_once("The CPPC feature is supported but currently disabled by the BIOS.\n"
 					"Please enable it if your BIOS has the CPPC option.\n");
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 5c996ab63895..0070421c6687 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -3136,12 +3136,15 @@ static int get_v2_svn(struct sev_device *sev)
 static bool sev_firmware_allows_es(struct sev_device *sev)
 {
 	/* Documented in AMD-SB-3023 */
-	if (boot_cpu_has(X86_FEATURE_ZEN4) || boot_cpu_has(X86_FEATURE_ZEN3))
+	switch (boot_cpu_data.x86_uarch) {
+	case AMD_UARCH_ZEN3:
+	case AMD_UARCH_ZEN4:
 		return get_v1_svn(sev) < 0x1b;
-	else if (boot_cpu_has(X86_FEATURE_ZEN5))
+	case AMD_UARCH_ZEN5:
 		return get_v2_svn(sev) < 0x4;
-	else
+	default:
 		return true;
+	}
 }
 
 int sev_firmware_supported_vm_types(void)
diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 8a33e75b71c3..67a5c468171f 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -245,7 +245,7 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
 
 static void amd_stb_update_args(struct amd_pmc_dev *dev)
 {
-	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+	if (boot_cpu_data.x86_uarch == AMD_UARCH_ZEN5) {
 		switch (boot_cpu_data.x86_model) {
 		case 0x44:
 			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
@@ -254,6 +254,7 @@ static void amd_stb_update_args(struct amd_pmc_dev *dev)
 			return;
 		default:
 			break;
+		}
 	}
 
 	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
