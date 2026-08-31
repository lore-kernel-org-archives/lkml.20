Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77297399360
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202667; cv=none; b=STNFlKpFBm95z/gz1ZNqdaOWGlPQkDXjy1X2y53tHX6OsvEZ7oQK54XR2gx81SGAoxmD/l9U9cgC24GJFIptUwFmOF371KYQCNL9t46FumF3/h2ssGMCXDmLa66sSEUbSdVDdm6JPChx0BWLdjfJklHhepv98Za5RwqkUAIdC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202667; c=relaxed/simple;
	bh=b7fW2ptF4Ja4YQqNEm+ydFij1NWertP95Z3eVpUJklY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNS1zU9ZsFxtG+eYdGfC3WGifwmz6cV3y1SXws+/zVmnic6hInfgngCniADG+WBukzzxK2VWIvwMW3tgJclsAApPMflYHfQTxX/vWFn8DMMOjCl6NC2RDndhE+xZWI5rdr1sDaYLS/hblAmZIytjGS7NOsKVzIoJPyl0Ub4RyFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIXvIzWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIXvIzWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61BF1F000E9;
	Mon, 31 Aug 2026 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202666;
	bh=577+IXA9ZtkleQNyTEpEVnO5R3b1dye2OPtU9RMfV2Y=;
	h=From:To:Cc:Subject:Date;
	b=HIXvIzWX++p59EctdbNcUEDZ8CvlZzPoglxt46WJvJuhDtz6Od6OAMv1cK9RbQWNm
	 rpG63Heje5fZLypK4AUsyKhpt32vI05x5uhy/2LYb2jxElHsq9mBeubbVSkAoJ603B
	 euXOJn+QYTdR6HDIgoD+Z0nFt/wsGDEwTecbguwl7UoJKdqC85NoDc0MNtJ8TOYmCt
	 hrBHzdynPCoCBtQMv6hLWsC614h9cyD8nyyLISLNxTUOqbJAFd6+X+jHHlNsbPrLf+
	 W09aTAMY3bSVflXk8HKHcQvjD4xXEozvSw5x56ilM5uKca54V6G2c2/jvoxMwvWIEV
	 oQOYJrjN8Hq0w==
From: Eric Biggers <ebiggers@kernel.org>
To: x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
Date: Mon, 31 Aug 2026 11:57:06 -0700
Message-ID: <20260831185706.90103-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related
glue code"), X86_FEATURE_FPU is mandatory.  If it's absent, the kernel
halts execution in fpu__init_system_early_generic().  Remove unnecessary
checks for X86_FEATURE_FPU that occur later in core x86 code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/kernel/fpu/bugs.c   | 4 ----
 arch/x86/kernel/fpu/core.c   | 2 +-
 arch/x86/kernel/fpu/init.c   | 2 --
 arch/x86/kernel/fpu/xstate.c | 5 -----
 4 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/kernel/fpu/bugs.c b/arch/x86/kernel/fpu/bugs.c
index edbafc5940e3..4b84cd0a9d24 100644
--- a/arch/x86/kernel/fpu/bugs.c
+++ b/arch/x86/kernel/fpu/bugs.c
@@ -29,10 +29,6 @@ void __init fpu__init_check_bugs(void)
 {
 	s32 fdiv_bug;
 
-	/* kernel_fpu_begin/end() relies on patched alternative instructions. */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		return;
-
 	kernel_fpu_begin();
 
 	/*
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5e..100bfe7336dd 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -491,7 +491,7 @@ void kernel_fpu_begin_mask(unsigned int kfpu_mask)
 	if (likely(kfpu_mask & KFPU_MXCSR) && boot_cpu_has(X86_FEATURE_XMM))
 		ldmxcsr(MXCSR_DEFAULT);
 
-	if (unlikely(kfpu_mask & KFPU_387) && boot_cpu_has(X86_FEATURE_FPU))
+	if (unlikely(kfpu_mask & KFPU_387))
 		asm volatile ("fninit");
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_begin_mask);
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 0d33c217b71c..8804ef0295dc 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -31,8 +31,6 @@ static void fpu__init_cpu_generic(void)
 
 	cr0 = read_cr0();
 	cr0 &= ~(X86_CR0_TS|X86_CR0_EM); /* clear TS and EM */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		cr0 |= X86_CR0_EM;
 	write_cr0(cr0);
 
 	/* Flush out any pending x87 state: */
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a7b6524a9dea..029a9b896997 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -810,11 +810,6 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 	int err;
 	int i;
 
-	if (!boot_cpu_has(X86_FEATURE_FPU)) {
-		pr_info("x86/fpu: No FPU detected\n");
-		return;
-	}
-
 	if (!boot_cpu_has(X86_FEATURE_XSAVE)) {
 		pr_info("x86/fpu: x87 FPU will use %s\n",
 			boot_cpu_has(X86_FEATURE_FXSR) ? "FXSAVE" : "FSAVE");

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0

