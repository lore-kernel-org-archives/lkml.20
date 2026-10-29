Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296584;
	b=4A+PQuS55SxWDX2CgRv5ODpYZ5Ukr+LIYuDoBNOBsRuhq2EyBuHFADmRL4Z3q6WlV280
	 1U+eKJPzYBqKUKPyxCqLBprU2DMSbIafEy6wearc8ERrPzfSizWu1bM0b0woi5oSzdLOg
	 EjRRYFHZiNkY6bO3O+DS3g61dWaVoXQpl2Md0lxqip81vFIRklY7dxZMFwIOTHkfieuiQ
	 3gmDVojyOSDcK2TcjF9g/lGKv4RAT876nAOuJV5OI/Gb8DR3oKl5m63vdxt7RFSIlwpIt
	 fSIxabyPgZ0vrsE59+bNYvBffgiGonIV1ySRAPXDik3k5EBr6OEtIbDIC2Knic6I4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296584;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7FUMY7F0vN8nur8mpeVI5JUqqNfaw0q0B8QOwU5Vc/U=;
	b=Foua7LcEb9hordbPJ9AxbRuRURDfLgsP1mvoDL9l9xnrgErJnirgcI0pgNeAC3pHaiYu
	 JXA+2PutrG97JowgIeUiDRGwTFuNR3nUhZN3KLvq2aI7FzsWJLryMjt1qhemcPSaV/McR
	 QC5TWcH8nOnX75oinLBfBabAX7w8wu3AQJhiX9rpF1dpEPh09hUurqsN/PANhJxlY9g/K
	 7qsmft/ue5Bgz97c3naZj2DsRs4H4fsXB6mRrTagenI8PsbWqxDY+7y4CGaDu8fLwW4mR
	 L0EK8B/HIGLXW32QHRNMnW6II6mDw9DZQ9DKFzLaGfsT34ct4vi3NWZPVPIDft5GKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=MEp5tggs;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBD606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FBD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=MEp5tggs
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3062640E04F4;
	Thu, 29 Oct 2026 17:56:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 85_lWR2Xs0ut; Thu, 29 Oct 2026 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793296577; bh=7FUMY7F0vN8nur8mpeVI5JUqqNfaw0q0B8QOwU5Vc/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEp5tggszAEAoSdWPWn23YFxqlm70NfzQYoxziFJrqyzIsxzKOfgfz2mjMuuisXWq
	 CR/+rRjIovm3JLMCUqYiiqCTcKjZNvFSEbquk6uM0lZ1QonIgOQWFn03xcH+PzB83z
	 5SQbyUhTVtg9FUEqtezt2olQwqRoTHJKWyJ0VgKnstkght7A1ixIgch//zUoQt8Zwo
	 qlx8WsTMYCriTX7u1W13K0z6vsf4/kVm4ZN1rl2w7zXCXthpKEa+X6FVzCLu947+nN
	 yjQc8nzsSnDUTXHMf0MkKCpnQFS1FNjE5ydyhktqRKJ0Bor6ytkQCweAMuqB6s5B5w
	 Gac7+p1DOriguh9nTVa1OE+U91HVzWOCUbi4xBZRjnv3izBPhdpkseNBA70SbjQU34
	 b6DwTajXj7TnPRCVSu/AzGGNfHYAiR7SCsVGt8sy3zUzDBpOcXbmJAttvJcdlNBof7
	 +8F+Afd0aM/APXyUk0Yr2SQ0xE8ANM7C2+m875WucXBxwl5FMrjHyV+afq98lq2/Og
	 bZ75dVqKOARkSSsdhjMIq2yw1EoumXMU0CCxZ0k+S80okOC+jB/XImA7Ny055AN1ia
	 RXIYKLmwRz09QLefv8PckbvEyVwPVrdtgZrS3eRS1PFD9nzcBKIs7WLWKowhCtBwaC
	 gIb/ib1WbOvmokdynPTN0pGI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D258C40E02B7;
	Thu, 29 Oct 2026 17:56:13 +0000 (UTC)
Date: Thu, 29 Oct 2026 10:56:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Message-ID: <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
 <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
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
In-Reply-To: <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>

Looks easy enough but needs thorough testing and perhaps some commenting how
we're using x86_vfm on AMD a bit differently.

amd-family.h is not really necessary right now but that's immaterial for this
change - we can always convert to it later if absolutely necessary. And
I don't think it will be.

Thx.

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 49b6b8fce566..baa6ce7f4d6d 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -291,13 +291,13 @@ static const u64 amd_zen4_perfmon_event_map[PERF_COUNT_HW_MAX] =
 
 static u64 amd_pmu_event_map(int hw_event)
 {
-	if (cpu_feature_enabled(X86_FEATURE_ZEN4) || boot_cpu_data.x86 >= 0x1a)
+	if (boot_cpu_data.x86_vfm >= AMD_ZEN4)
 		return amd_zen4_perfmon_event_map[hw_event];
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2) || boot_cpu_data.x86 >= 0x19)
+	if (boot_cpu_data.x86_vfm >= AMD_ZEN2)
 		return amd_zen2_perfmon_event_map[hw_event];
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN1))
+	if (boot_cpu_data.x86_vfm >= AMD_ZEN1)
 		return amd_zen1_perfmon_event_map[hw_event];
 
 	return amd_perfmon_event_map[hw_event];
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c23b8c..000fcb7c3eb1 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -415,7 +415,8 @@ static int perf_ibs_init(struct perf_event *event)
 		config |= (ldlat - 1) << IBS_OP_LDLAT_THRSH_SHIFT;
 
 		config |= IBS_OP_LDLAT_EN;
-		if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+
+		if (boot_cpu_data.x86_vfm == AMD_ZEN5)
 			config |= IBS_OP_L3MISSONLY;
 	}
 
diff --git a/arch/x86/include/asm/cpu_device_id.h b/arch/x86/include/asm/cpu_device_id.h
index c62d8fae52c3..3f3748752ba8 100644
--- a/arch/x86/include/asm/cpu_device_id.h
+++ b/arch/x86/include/asm/cpu_device_id.h
@@ -5,7 +5,7 @@
 /*
  * Can't use <linux/bitfield.h> because it generates expressions that
  * cannot be used in structure initializers. Bitfield construction
- * here must match the union in struct cpuinfo_86:
+ * here must match the union in struct cpuinfo_x86:
  *	union {
  *		struct {
  *			__u8	x86_model;
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..7c4851cd652c 100644
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
@@ -314,10 +314,10 @@
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
index 77488ff5eb8c..4df3942d969b 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -77,6 +77,19 @@ enum x86_topology_cpu_type {
 	TOPO_CPU_TYPE_UNKNOWN,
 };
 
+/*
+ * Ordered list of uarches so that range etc checks can work.
+ */
+enum amd_uarch {
+	AMD_UNKNOWN = 0,
+	AMD_ZEN1,
+	AMD_ZEN2,
+	AMD_ZEN3,
+	AMD_ZEN4,
+	AMD_ZEN5,
+	AMD_ZEN6
+};
+
 struct cpuinfo_topology {
 	// Real APIC ID read from the local APIC
 	u32			apicid;
diff --git a/arch/x86/kernel/acpi/cppc.c b/arch/x86/kernel/acpi/cppc.c
index 1c6bf56c3215..cb49efa8a3ed 100644
--- a/arch/x86/kernel/acpi/cppc.c
+++ b/arch/x86/kernel/acpi/cppc.c
@@ -257,7 +257,7 @@ int amd_get_effective_highest_perf(unsigned int cpu)
 	 * the highest performance level is set to 196.
 	 * https://bugzilla.kernel.org/show_bug.cgi?id=218759
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
+	if (boot_cpu_data.x86_vfm == AMD_ZEN4) {
 		switch (boot_cpu_data.x86_model) {
 		case 0x70 ... 0x7f:
 			return CPPC_HIGHEST_PERF_PERFORMANCE;
@@ -268,7 +268,7 @@ int amd_get_effective_highest_perf(unsigned int cpu)
 
 	/* detect if running on heterogeneous design */
 	if (cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES)) {
-		if (cpu_feature_enabled(X86_FEATURE_ZEN5) &&
+		if (boot_cpu_data.x86_vfm == AMD_ZEN5 &&
 		    cpu_data(cpu).topo.cpu_type == TOPO_CPU_TYPE_PERFORMANCE)
 			return CPPC_HIGHEST_PERF_PERFORMANCE;
 
@@ -301,7 +301,7 @@ int amd_get_max_frequency(unsigned int cpu)
 	enum x86_topology_cpu_type type = cpu_data(cpu).topo.cpu_type;
 	const struct amd_max_freq *max_freq = NULL;
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN6) &&
+	if (boot_cpu_data.x86_vfm == AMD_ZEN6 &&
 	    cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
 		max_freq = &max_freq_zen6_client;
 
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 3972966cb023..4ac268416fb1 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -367,8 +367,7 @@ static void bsp_determine_snp(struct cpuinfo_x86 *c)
 		 * instruction.
 		 */
 		if (!cpu_has(c, X86_FEATURE_HYPERVISOR) &&
-		    (cpu_feature_enabled(X86_FEATURE_ZEN3) ||
-		     cpu_feature_enabled(X86_FEATURE_ZEN4) ||
+		    (c->x86_vfm >= AMD_ZEN3 ||
 		     cpu_feature_enabled(X86_FEATURE_RMPREAD)) &&
 		    snp_probe_rmptable_info()) {
 			cc_platform_set(CC_ATTR_HOST_SEV_SNP);
@@ -409,8 +408,8 @@ static void tsa_init(struct cpuinfo_x86 *c)
 	if (cpu_has(c, X86_FEATURE_HYPERVISOR))
 		return;
 
-	if (cpu_has(c, X86_FEATURE_ZEN3) ||
-	    cpu_has(c, X86_FEATURE_ZEN4)) {
+	if (c->x86_vfm >= AMD_ZEN3 &&
+	    c->x86_vfm <= AMD_ZEN4) {
 		if (x86_match_min_microcode_rev(amd_tsa_microcode))
 			setup_force_cpu_cap(X86_FEATURE_VERW_CLEAR);
 		else
@@ -483,13 +482,13 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		switch (c->x86_model) {
 		case 0x00 ... 0x2f:
 		case 0x50 ... 0x5f:
-			setup_force_cpu_cap(X86_FEATURE_ZEN1);
+			c->x86_vfm = AMD_ZEN1;
 			break;
 		case 0x30 ... 0x4f:
 		case 0x60 ... 0x7f:
 		case 0x90 ... 0x91:
 		case 0xa0 ... 0xaf:
-			setup_force_cpu_cap(X86_FEATURE_ZEN2);
+			c->x86_vfm = AMD_ZEN2;
 			break;
 		default:
 			goto warn;
@@ -500,11 +499,11 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		switch (c->x86_model) {
 		case 0x00 ... 0x0f:
 		case 0x20 ... 0x5f:
-			setup_force_cpu_cap(X86_FEATURE_ZEN3);
+			c->x86_vfm = AMD_ZEN3;
 			break;
 		case 0x10 ... 0x1f:
 		case 0x60 ... 0xaf:
-			setup_force_cpu_cap(X86_FEATURE_ZEN4);
+			c->x86_vfm = AMD_ZEN4;
 			break;
 		default:
 			goto warn;
@@ -517,13 +516,13 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		case 0x40 ... 0x4f:
 		case 0x60 ... 0x7f:
 		case 0xd0 ... 0xd7:
-			setup_force_cpu_cap(X86_FEATURE_ZEN5);
+			c->x86_vfm = AMD_ZEN5;
 			break;
 		case 0x50 ... 0x5f:
 		case 0x80 ... 0xaf:
 		case 0xc0 ... 0xcf:
 		case 0xd8 ... 0xef:
-			setup_force_cpu_cap(X86_FEATURE_ZEN6);
+			c->x86_vfm = AMD_ZEN6;
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
+	switch (c->x86_vfm) {
+	case AMD_ZEN1:	init_amd_zen1(c);	break;
+	case AMD_ZEN2:	init_amd_zen2(c);	break;
+	case AMD_ZEN3:	init_amd_zen3(c);	break;
+	case AMD_ZEN4:	init_amd_zen4(c);	break;
+	case AMD_ZEN5:	init_amd_zen5(c);	break;
+	default: break;
+	}
+
 
 	/*
 	 * Enable workaround for FXSAVE leak on CPUs
@@ -1329,7 +1327,7 @@ void amd_check_microcode(void)
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return;
 
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
+	if (boot_cpu_data.x86_vfm == AMD_ZEN2)
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
 
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 96ca39c0045f..d018d1102654 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1268,15 +1268,11 @@ static bool __init avic_want_avic_enabled(void)
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
+		avic = boot_cpu_has(X86_FEATURE_X2AVIC) && boot_cpu_data.x86_vfm >= AMD_ZEN4;
 
 	if (!avic || !npt_enabled)
 		return false;
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 4bedfbfc18b6..d297be27e216 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -210,7 +210,7 @@ static int __init dmi_matched_7k62_bios_bug(const struct dmi_system_id *dmi)
 	 * broken BIOS lack of nominal_freq and lowest_freq capabilities
 	 * definition in ACPI tables
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
+	if (boot_cpu_data.x86_vfm == AMD_ZEN2) {
 		quirks = dmi->driver_data;
 		pr_info("Overriding nominal and lowest frequencies for %s\n", dmi->ident);
 		return 1;
@@ -2306,27 +2306,35 @@ static bool amd_cppc_supported(void)
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
+	switch (boot_cpu_data.x86_vfm) {
+	case AMD_ZEN2:
+		switch (c->x86_model) {
+		case 0x60 ... 0x6F:
+		case 0x80 ... 0xAF:
+			warn = true;
+			break;
+		}
+		break;
+	case AMD_ZEN3:
+	case AMD_ZEN4:
+		switch (c->x86_model) {
+		case 0x10 ... 0x1F:
+		case 0x40 ... 0xAF:
 			warn = true;
+			break;
 		}
+		break;
+	case AMD_ZEN5:
+		warn = true;
+		break;
+	default:
+		break;
 	}
 
+skip:
 	if (warn)
 		pr_warn_once("The CPPC feature is supported but currently disabled by the BIOS.\n"
 					"Please enable it if your BIOS has the CPPC option.\n");
@@ -2352,7 +2360,7 @@ static void __init amd_pstate_init_epp_values(void)
 	const struct amd_pstate_epp_soc *soc;
 
 	if (!id || !id->driver_data) {
-		if (cpu_feature_enabled(X86_FEATURE_ZEN6) &&
+		if (boot_cpu_data.x86_vfm == AMD_ZEN6 &&
 		    cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
 			pr_warn_once("No EPP tunings found for platform\n");
 		return;
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 5c996ab63895..7479da12f514 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -3136,12 +3136,15 @@ static int get_v2_svn(struct sev_device *sev)
 static bool sev_firmware_allows_es(struct sev_device *sev)
 {
 	/* Documented in AMD-SB-3023 */
-	if (boot_cpu_has(X86_FEATURE_ZEN4) || boot_cpu_has(X86_FEATURE_ZEN3))
+	switch (boot_cpu_data.x86_vfm) {
+	case AMD_ZEN3:
+	case AMD_ZEN4:
 		return get_v1_svn(sev) < 0x1b;
-	else if (boot_cpu_has(X86_FEATURE_ZEN5))
+	case AMD_ZEN5:
 		return get_v2_svn(sev) < 0x4;
-	else
+	default:
 		return true;
+	}
 }
 
 int sev_firmware_supported_vm_types(void)
diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 8a33e75b71c3..e2d31016d0fc 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -245,7 +245,7 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
 
 static void amd_stb_update_args(struct amd_pmc_dev *dev)
 {
-	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+	if (boot_cpu_data.x86_vfm == AMD_ZEN5) {
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
