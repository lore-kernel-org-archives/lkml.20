Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B1401486;
	Tue, 15 Sep 2026 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442124; cv=none; b=IcqROdIdw1K7jyJukIDcA31qZ+GGPe7ulSxdMxiT5qQrUcHrQuhZkiKweHq15xhoXNLWzx9XmNrU5iUKze4PPed3vJ/Kpo9m6OSfYAveuODSJHzZtsbLwruc1ZsLCgvOKmd5lY8982grDr/t12IU4bmS5THX7EvIRq1GeNeKyWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442124; c=relaxed/simple;
	bh=1hrpwED56aICRgCw5UmqGeuhqDux00DXCvD5kn7kcH0=;
	h=Date:From:To:Subject:Cc:MIME-Version:Message-ID:Content-Type; b=sihhjGFNd8pD15r84eSNUVVMsezOcWhlzpDDiFd6gy9wwB2+lXZd+kmXjRzNeRDk9S/RzS0kkxbdaodHAJrXpfcZdGVdcTvjUEbRjJ9ZRCFaOTTUjd49ZkctjMFCKaoT16qhSjfQMrXB/Z0Y/7Y+uUfLGwB0oXnxiZ5NZ28INeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ft6nYM+Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eEy6aq6s; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ft6nYM+Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eEy6aq6s"
Date: Tue, 15 Sep 2026 03:15:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789442120;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=lTMb+s7wVNEzepyE6+9ul5RUelQwCBAXDj3+Sz50Kr0=;
	b=ft6nYM+Zh4EPXCbn350rTlFRQpbovKTcr+DOnyKGLqVQil5XVZA/QWAr4EvNVa3MuUYErM
	K4dF5epS5lEoBTqc3z0ZlgMgWz/OFgiWwHOiDvaeCW+PMKwh+oxIA0jJcvRXth3Uru8Aix
	4wxuWBRbF6cgstLvDJTeSUYfg/vh0t7byImt/gkpyxd7eJe+Zu75maiDOaKBP553r0mZ8L
	bzARNeUtR/BQYq1HD8SMd1j84Khy7PHy8441qwrusElNxD7bcNP7P1vRu5bISVkR+T73G6
	iymLo7uS4Xc9oJmRAgEkb9KuAkUT+cClwVTFKtntX7TSIsO9t2cN/SGDUoAakg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789442120;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=lTMb+s7wVNEzepyE6+9ul5RUelQwCBAXDj3+Sz50Kr0=;
	b=eEy6aq6sSawSE7ySeGBS00NkyeGA5sbOGrv2f0NLFBgmKxT5gzRUz7XjcBWS7eVkTNa72h
	UfPixQUoa5y6dOBQ==
From: "tip-bot2 for Borislav Petkov (AMD)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cpu] x86/CPU/AMD: Fix Zen5 TLB sizes reporting
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178944211754.1720534.2478135602660561730.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cpu branch of tip:

Commit-ID:     228200f695c0f92c5fd06ff0bdcf94bb0d2ca7f5
Gitweb:        https://git.kernel.org/tip/228200f695c0f92c5fd06ff0bdcf94bb0d2=
ca7f5
Author:        Borislav Petkov (AMD) <bp@alien8.de>
AuthorDate:    Thu, 20 Aug 2026 17:02:10 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 14 Sep 2026 19:10:24 -07:00

x86/CPU/AMD: Fix Zen5 TLB sizes reporting

Starting with Zen5, TLB sizes in CPUID_Fn80000006_E[AB]X are reported
as multiples of 32. There's a CPUID bit which determines that:

  CPUID_Fn80000021_EAX [Extended Feature 2 EAX] (Core::X86::Cpuid::FeatureExt=
2Eax)
  ...

  14: L2TlbSizeX32. Read-only. Reset: 1. Indicates that L2TLB sizes are encod=
ed as multiples of 32.

Update the places which report that information.

With it, the numbers look correct now:

  -Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
  -Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
  +Last level iTLB entries: 4KB 2048, 2MB 2048, 4MB 1024
  +Last level dTLB entries: 4KB 4096, 2MB 4096, 4MB 2048, 1GB 0

/proc/cpuinfo

  -TLB size        : 192 4K pages
  +TLB size        : 6144 4K pages

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20260821022031.946311-1-bp@kernel.org
---
 arch/x86/include/asm/cpufeatures.h |  2 ++
 arch/x86/kernel/cpu/amd.c          | 21 +++++++++++++--------
 arch/x86/kernel/cpu/common.c       |  4 +++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufea=
tures.h
index f70ee74..a7689e6 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -483,6 +483,8 @@
 #define X86_FEATURE_AUTOIBRS		(20*32+ 8) /* Automatic IBRS */
 #define X86_FEATURE_NO_SMM_CTL_MSR	(20*32+ 9) /* SMM_CTL MSR is not present =
*/
=20
+#define X86_FEATURE_L2_TLB_SIZE_X32	(20*32+14) /* L2 TLB sizes are encoded a=
s multiples of 32 */
+
 #define X86_FEATURE_GP_ON_USER_CPUID	(20*32+17) /* User CPUID faulting */
=20
 #define X86_FEATURE_PREFETCHI		(20*32+20) /* Prefetch Data/Instruction to Ca=
che Level */
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 54e14ed..e5279bc 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1192,7 +1192,7 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *=
c, unsigned int size)
=20
 static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 {
-	u32 ebx, eax, ecx, edx;
+	u32 ebx, eax, ecx, edx, shift, tmp;
 	u16 mask =3D 0xfff;
=20
 	if (c->x86 < 0xf)
@@ -1201,10 +1201,12 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 	if (c->extended_cpuid_level < 0x80000006)
 		return;
=20
+	shift =3D !!cpu_has(c, X86_FEATURE_L2_TLB_SIZE_X32) * 5;
+
 	cpuid(0x80000006, &eax, &ebx, &ecx, &edx);
=20
-	tlb_lld_4k =3D (ebx >> 16) & mask;
-	tlb_lli_4k =3D ebx & mask;
+	tlb_lld_4k =3D ((ebx >> 16) & mask) << shift;
+	tlb_lli_4k =3D (ebx & mask) << shift;
=20
 	/*
 	 * K8 doesn't have 2M/4M entries in the L2 TLB so read out the L1 TLB
@@ -1216,16 +1218,18 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 	}
=20
 	/* Handle DTLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!((eax >> 16) & mask))
+	tmp =3D ((eax >> 16) & mask) << shift;
+	if (!tmp)
 		tlb_lld_2m =3D (cpuid_eax(0x80000005) >> 16) & 0xff;
 	else
-		tlb_lld_2m =3D (eax >> 16) & mask;
+		tlb_lld_2m =3D tmp;
=20
 	/* a 4M entry uses two 2M entries */
 	tlb_lld_4m =3D tlb_lld_2m >> 1;
=20
 	/* Handle ITLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!(eax & mask)) {
+	tmp =3D (eax & mask) << shift;
+	if (!tmp) {
 		/* Erratum 658 */
 		if (c->x86 =3D=3D 0x15 && c->x86_model <=3D 0x1f) {
 			tlb_lli_2m =3D 1024;
@@ -1233,8 +1237,9 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 			cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
 			tlb_lli_2m =3D eax & 0xff;
 		}
-	} else
-		tlb_lli_2m =3D eax & mask;
+	} else {
+		tlb_lli_2m =3D tmp;
+	}
=20
 	tlb_lli_4m =3D tlb_lli_2m >> 1;
=20
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c735282..3716a6a 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -857,7 +857,7 @@ static void get_model_name(struct cpuinfo_x86 *c)
=20
 void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 {
-	unsigned int n, dummy, ebx, ecx, edx, l2size;
+	unsigned int n, dummy, ebx, ecx, edx, l2size, shift __maybe_unused;
=20
 	n =3D c->extended_cpuid_level;
=20
@@ -877,7 +877,9 @@ void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 	l2size =3D ecx >> 16;
=20
 #ifdef CONFIG_X86_64
+	shift =3D !!cpu_has(c, X86_FEATURE_L2_TLB_SIZE_X32) * 5;
 	c->x86_tlbsize +=3D ((ebx >> 16) & 0xfff) + (ebx & 0xfff);
+	c->x86_tlbsize <<=3D shift;
 #else
 	/* do processor-specific cache resizing */
 	if (this_cpu->legacy_cache_size)
