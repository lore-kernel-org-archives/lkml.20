Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0A4AE12F;
	Mon,  5 Oct 2026 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222147; cv=none; b=j5iuqUSJMr03EGL+hC7RXGAoP1UdoTwObml5yAPFd+UnIcZxlqSzLdOeIi3oNFOjdSEdP5+CM7pGQDmDW8sAs+Ao16XecaLyJVXcKh9rsM6t8GdBiTnrdvwAn4VtRbHMOh4qq0tUCBuv6RtlTh0/Fy2TWmfo9sT4moMopAHRbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222147; c=relaxed/simple;
	bh=1IhzbE0K/3tMW/zRuaVQoSOLmnWvA+Stq7l3GsJCWBQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=t/TeqL4ZHHHMHE0dD1VpjcqoZ2VBMlor6+8j5TC+inpioQU+kcaqT+6m+eoV0FyktZ3knlxzLycWZ+mFy00u2tKY9U0WbCoTf8fqdCJnw2k/V70MooR70hK0vYGeU/DuMMAsYxb50mWPtG0ogYs8cw8KShYSc6AG8RsewAquMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gL13wYN3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+8EoKTKN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gL13wYN3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+8EoKTKN"
Date: Mon, 05 Oct 2026 17:42:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791222143;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EnMCzb4uE7olSeKQQmoSE6hBSQOUB7akYlTIxXuOFc=;
	b=gL13wYN3WO+J9qMgGFELMgdT+fHYnKC0Pl7WOGhv4eWbU5cpamBNkYmbEZwun/eOvRZK0g
	HSzJb6gIfabziVfftxG/K+4xKAWWM8ih7NiioG2AXza9PVaDVRKbBmRESyTbX/j2euKg7u
	q6+bNJqyELURCNkwLmSO0reak/UD4A5yHrVo57aSkt3XoXVmwau0gZOGTJ+tu/z7Gt/P6z
	ruk2ZAtaLUkrB3VZQEnbQBhs7VS4RitP8dvsdnmA5S7d/I0u6qU8pNaXNyU0EfrATvZghT
	1RQn0YvD7KxCc0xMODiAd444wYuIXxLZ6m6TQF3WVu9XF6IFAWb3m/+TXHet2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791222143;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EnMCzb4uE7olSeKQQmoSE6hBSQOUB7akYlTIxXuOFc=;
	b=+8EoKTKNvZw4jf45SRm6RGDDzPhTIltAniOHUsJ9axd8NL1f7EumXx9uY2qlZMg/GJrcNz
	PZoKO9Rc0QGAxDDA==
From: "tip-bot2 for Borislav Petkov (AMD)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, stable@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261002211617.1001617-1-bp@kernel.org>
References: <20261002211617.1001617-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179122214127.816309.14884640527661155843.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     87db7795cbaaf636ae22ae031f4906db7bb77803
Gitweb:        https://git.kernel.org/tip/87db7795cbaaf636ae22ae031f4906db7bb=
77803
Author:        Borislav Petkov (AMD) <bp@alien8.de>
AuthorDate:    Fri, 02 Oct 2026 14:16:17 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 05 Oct 2026 10:29:08 -07:00

x86/CPU/AMD: Fix AMD TLBI Erratum #1718

The processor may fail to invalidate a TLB entry while executing an
INVLPGB/TLBSYNC instruction pair.

Detect the erratum and apply a software workaround when a microcode fix
is not present.

Fixes: 82378c6c2f43 ("x86/mm: Use INVLPGB for kernel TLB flushes")
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Rik van Riel <riel@surriel.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Rik van Riel <riel@surriel.com>
Cc: stable@kernel.org
Link: https://patch.msgid.link/20261002211617.1001617-1-bp@kernel.org
---
 arch/x86/include/asm/cpufeatures.h | 3 +++
 arch/x86/include/asm/tlb.h         | 6 ++++++
 arch/x86/kernel/cpu/amd.c          | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufea=
tures.h
index f70ee74..fe84cf4 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -477,6 +477,8 @@
 #define X86_FEATURE_NO_NESTED_DATA_BP	(20*32+ 0) /* No Nested Data Breakpoin=
ts */
 #define X86_FEATURE_WRMSR_XX_BASE_NS	(20*32+ 1) /* WRMSR to {FS,GS,KERNEL_GS=
}_BASE is non-serializing */
 #define X86_FEATURE_LFENCE_RDTSC	(20*32+ 2) /* LFENCE always serializing / s=
ynchronizes RDTSC */
+
+#define X86_FEATURE_TLBSYNC_SFW_NO	(20*32+ 4) /* TLBI Erratum #1718 fixed in=
 microcode */
 #define X86_FEATURE_VERW_CLEAR		(20*32+ 5) /* The memory form of VERW mitiga=
tes TSA */
 #define X86_FEATURE_NULL_SEL_CLR_BASE	(20*32+ 6) /* Null Selector Clears Bas=
e */
=20
@@ -587,4 +589,5 @@
 #define X86_BUG_TSA			X86_BUG( 1*32+ 9) /* "tsa" CPU is affected by Transien=
t Scheduler Attacks */
 #define X86_BUG_VMSCAPE			X86_BUG( 1*32+10) /* "vmscape" CPU is affected by =
VMSCAPE attacks from guests */
 #define X86_BUG_SEAMRET_INVD_VMCS	X86_BUG( 1*32+11) /* "seamret_invd_vmcs" S=
EAMRET from P-SEAMLDR clears the current VMCS */
+#define X86_BUG_TLBI			X86_BUG( 1*32+12) /* "tlbi" AMD TLBI Erratum #1718 */
 #endif /* _ASM_X86_CPUFEATURES_H */
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 866ea78..eba925c 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -110,6 +110,12 @@ static inline void __tlbsync(void)
=20
 	/* TLBSYNC: supported in binutils >=3D 0.36. */
 	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
+
+	if (!static_cpu_has_bug(X86_BUG_TLBI))
+		return;
+
+	/* TLBSYNC: supported in binutils >=3D 0.36. */
+	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
 }
 #else
 /* Some compilers (I'm looking at you clang!) simply can't do DCE */
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 54e14ed..40463ba 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1049,6 +1049,10 @@ static void init_amd_zen5(struct cpuinfo_x86 *c)
 		msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
 		pr_emerg_once("RDSEED32 is broken. Disabling the corresponding CPUID bit.\=
n");
 	}
+
+	if (cpu_has(c, X86_FEATURE_INVLPGB) &&
+	    !cpu_has(c, X86_FEATURE_TLBSYNC_SFW_NO))
+		set_cpu_bug(c, X86_BUG_TLBI);
 }
=20
 static void init_amd(struct cpuinfo_x86 *c)
