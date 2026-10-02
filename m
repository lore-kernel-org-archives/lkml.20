Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC5E25F7B9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975781; cv=none; b=lqPGHmxPkGa9/ca2WOevbkzxxPjU0r+mMfGmZNl+kGQjygOwlKBjq9p6wDhPQJs14RM3Wle6QYwupSggiTCN3Vuq8lz0PZCKaTunwoj11ekNiuYEvSDstm9TjaNJJR+yV/is93OkxUqYgFAXYk3MkOB1F/1lzn1OAY5v9bWJMPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975781; c=relaxed/simple;
	bh=iWJINnlDrOftowfoGhxkJf705MBebOzL7c4W6AMdQ70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IydbEm+Q5fW1DuGRCiOH7CTe/cCwNQlpGpoCD+N5zOprSxKdr8CGnrO3dd+lsHZcd9pfptuNDRrFE3ykNM0vwNnW5/azsmX/H+aZ3LFoE5e4gljzb9EunSCf8gThg0z3HMiNRPSJd3g3r2QTqDbeE3GfrIVtporjuU2T+Y9S40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fB79RhAe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fB79RhAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2B71F000FF;
	Fri,  2 Oct 2026 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790975779;
	bh=OKYnKgYrHClMD1obTpPvxEWFYDGIOLzE5fVt8z/a5gk=;
	h=From:To:Cc:Subject:Date;
	b=fB79RhAevy+lGoRCC9aSnrE2JEX8D24OumGbd7yfBddkzY0E2VKiH7n/5fIP2C/dt
	 BevKf52tBD3QQXRR84OGfhMC+GNQoXqyY72uwB7N73OISOivowwNNtKzHrCT7T5ZcL
	 QGtgCBV54giEdTE+ksx8MVpog/1afiw8h+k4BZGRQlVLlgPSJwzIRuOcJ+VMvvIK5k
	 48xtreiX7cSTHZ/CBbevtU0tjJRcZJByPmG99JMpYOhCNyocO5ZqGEK+jYjKx+wZtc
	 RFiHea44dnVAlurC073PGNwM0EKW6AxQXHN58D9zWV3djoC+r8CHIcmSE4aCWMs/ri
	 OPxKpLr+UeaKA==
From: Borislav Petkov <bp@kernel.org>
To: X86 <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	stable@kernel.org
Subject: [PATCH] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
Date: Fri,  2 Oct 2026 14:16:17 -0700
Message-ID: <20261002211617.1001617-1-bp@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

The processor may fail to invalidate a TLB entry while executing an
INVLPGB/TLBSYNC instruction pair.

Detect the erratum and apply a software workaround when a microcode fix
is not present.

Fixes: 82378c6c2f43 ("x86/mm: Use INVLPGB for kernel TLB flushes")
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
---
 arch/x86/include/asm/cpufeatures.h | 3 +++
 arch/x86/include/asm/tlb.h         | 6 ++++++
 arch/x86/kernel/cpu/amd.c          | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f70ee74b5f92..fe84cf4e97d3 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -477,6 +477,8 @@
 #define X86_FEATURE_NO_NESTED_DATA_BP	(20*32+ 0) /* No Nested Data Breakpoints */
 #define X86_FEATURE_WRMSR_XX_BASE_NS	(20*32+ 1) /* WRMSR to {FS,GS,KERNEL_GS}_BASE is non-serializing */
 #define X86_FEATURE_LFENCE_RDTSC	(20*32+ 2) /* LFENCE always serializing / synchronizes RDTSC */
+
+#define X86_FEATURE_TLBSYNC_SFW_NO	(20*32+ 4) /* TLBI Erratum #1718 fixed in microcode */
 #define X86_FEATURE_VERW_CLEAR		(20*32+ 5) /* The memory form of VERW mitigates TSA */
 #define X86_FEATURE_NULL_SEL_CLR_BASE	(20*32+ 6) /* Null Selector Clears Base */
 
@@ -587,4 +589,5 @@
 #define X86_BUG_TSA			X86_BUG( 1*32+ 9) /* "tsa" CPU is affected by Transient Scheduler Attacks */
 #define X86_BUG_VMSCAPE			X86_BUG( 1*32+10) /* "vmscape" CPU is affected by VMSCAPE attacks from guests */
 #define X86_BUG_SEAMRET_INVD_VMCS	X86_BUG( 1*32+11) /* "seamret_invd_vmcs" SEAMRET from P-SEAMLDR clears the current VMCS */
+#define X86_BUG_TLBI			X86_BUG( 1*32+12) /* "tlbi" AMD TLBI Erratum #1718 */
 #endif /* _ASM_X86_CPUFEATURES_H */
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 866ea78ba156..eba925c85f52 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -110,6 +110,12 @@ static inline void __tlbsync(void)
 
 	/* TLBSYNC: supported in binutils >= 0.36. */
 	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
+
+	if (!static_cpu_has_bug(X86_BUG_TLBI))
+		return;
+
+	/* TLBSYNC: supported in binutils >= 0.36. */
+	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
 }
 #else
 /* Some compilers (I'm looking at you clang!) simply can't do DCE */
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 54e14ed276b5..40463bad1078 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1049,6 +1049,10 @@ static void init_amd_zen5(struct cpuinfo_x86 *c)
 		msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
 		pr_emerg_once("RDSEED32 is broken. Disabling the corresponding CPUID bit.\n");
 	}
+
+	if (cpu_has(c, X86_FEATURE_INVLPGB) &&
+	    !cpu_has(c, X86_FEATURE_TLBSYNC_SFW_NO))
+		set_cpu_bug(c, X86_BUG_TLBI);
 }
 
 static void init_amd(struct cpuinfo_x86 *c)
-- 
2.53.0

