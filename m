Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675151814F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748110; cv=none; b=dT467J5kpKgXcGkdu8FCotQCGPNweVbzyJwDl/jJUoIyHiSZHQoSQ92JBqrxWhjP/rSPzskiLCIYt91rSwZjPukYq93uZKhHzDizsOHb/MBg0w9w/HDVKAP0HOxgZzLjBmIKjGl7vWZXw1SDzxU3qr5BeKgD9a84MHdRKINLhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748110; c=relaxed/simple;
	bh=llOvWVYViqY0vmfDVhIh84dvZVHJjkdP1y8KQLkPkZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCSanxQhzR/rCMnmtKM5Uc4YkwQ4C+mdq3Nv5xXQElww89uIYH6lGPTjQeNeKgTbAKIg65AlTG7PxV7O3kCmuVzo/Zr3Ag8xssyQja1Lk33/9pPASBCakndJSurzPxjlufnhbzbOBOWCQlif7U6WasIXwno5fqireLxbPD6+qVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1bL8DTy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1bL8DTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6C51F000FF;
	Fri, 18 Sep 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748108;
	bh=Eo1Mu3/UqB3iPcOR9znRzzkYsVC8kR8uT7JIdm2G87o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i1bL8DTyxaWwPU8TmGAoCePCspJVY5PvZJnYDmNVOGLub5VO4F6tsWTvDd1WS/AkC
	 94V05/JqBZRNJDkHkd5DzYnOdbBcVuLaxspjaPJqk/97qxUHkYs17+qq14oapAeo8P
	 KIcaGIOomO9VflToJe9jdtuve71vCN8mpBlKkOfJemv1zI2uIBjlJUJaRTa5xMWtNo
	 85IMk1+2akR7OhmPUGmVYjj5NB5xVqrwDXqQYlzie/ycIcdcTwoVx+Au08Qj/2AFfw
	 k3bNy9qpww/NLJ+RWZ907wCvj/QquOD3pwDWmRg7M/caCZG2gXNLm0GBtXf4gkTFMb
	 aKX/Tb8Vw1slA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Date: Fri, 18 Sep 2026 17:13:59 +0100
Message-ID: <20260918161407.2300-16-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With SP_EL0 now available for use in the kernel, point it at the
overflow stack so that exception entry from EL1h will later be able to
switch to the overflow stack by writing to SPSel.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S |  2 ++
 arch/arm64/kernel/head.S  |  3 +++
 arch/arm64/kernel/smp.c   | 12 ++++++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index a45be0a837c8..6958ee238649 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -227,6 +227,8 @@ alternative_cb_end
 	mrs	x21, sp_el0
 	ldr_this_cpu	tsk, __entry_task, x20
 	msr	tpidrro_el0, tsk
+	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
+	msr	sp_el0, x19
 
 	/*
 	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index c33551ee6572..27a19e1a0ee6 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -210,6 +210,9 @@ SYM_CODE_END(preserve_boot_args)
 	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
 	set_this_cpu_offset \tmp1
+
+	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
+	msr	sp_el0, \tmp1
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 702dee8d0db5..4c122d6598de 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -51,6 +51,7 @@
 #include <asm/processor.h>
 #include <asm/smp_plat.h>
 #include <asm/sections.h>
+#include <asm/stacktrace.h>
 #include <asm/tlbflush.h>
 #include <asm/ptrace.h>
 #include <asm/virt.h>
@@ -448,8 +449,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 
 static void __init set_boot_cpu_offset(void)
 {
-	asm volatile("msr tpidr_el1, %0"
-			:: "r" (per_cpu_offset(0)) : "memory");
+	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
+
+	asm volatile(
+	"	msr	tpidr_el1, %1\n"
+	"	add	%0, %0, %1\n"
+	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
+	: "+r" (ovf_sp)
+	: "r" (per_cpu_offset(0))
+	: "memory");
 }
 
 void __init smp_prepare_boot_cpu(void)
-- 
2.55.0.1082.g2b9226bbc0-goog

