Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2751E444
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799432; cv=none; b=myers/ecZ0q3YagUuWuWeU3nf9OV+LklwSy41BAaRvuuT6v4q/HixVyc/7/nluymnjtBYL6+UNm5zoFUBf6JkKAN3MYAuTPzslqKiRK2Oo9sz8CYrXfcSI9k1cHC7UgAkohh+YWT9J7bookk5gENn2tVaGqAqfGAKWZ6RbDfihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799432; c=relaxed/simple;
	bh=Te4DRSy4xtpWcqXZ88nRMIS+Kdm8FeBZqGLWgk+IODM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2KquTu/WjSgDKDiUuc1yyejuliW639ycGBJOSeZIm7RLpgR79UcIzqNVfnhCZHK95gS88cf4azinxYAQMhjDKkqwu4mTp7cHgiWliImAzm2h5Argrh6f3srDZwdNvku3vUo/C4nLrAUX5eqWOoHbF5QNELMdwhK7W8V6NqbMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrxXhU06; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrxXhU06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9795D1F00A3E;
	Mon,  7 Sep 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799431;
	bh=288+HAQJtG5VUtUXqsPB5v/Uwv9sAFZK9ElMT3/ktos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GrxXhU06Oa0TvnY8YBCKujRY7bHLUC/gxIrBnOT95k66+ccDei5lUu2g7a20DIZB8
	 qb0M86tduW0HvBxJkhxlBmb/byxZoaXasJOJ8mh6m0rfZItt35sMlwaOk9/DiJDHvi
	 rLlB5nNiFCBtVHuOWUmhCB92RHNuYFJDt+qFioS0arHQiELQeZ3yQbE3Ah6RX4WR93
	 RHNobZ8/EghVwtJPvnkgR0g3ei7GE1c5Lz01dwTEVUiE6aZtICBV57CZrqUVZjIArY
	 hHlXbPilHMWGK3g9WITSJgcbYWUFddyRQUDY/6d0r9vT8QamNJ/VF4jdVQgGCe4Upu
	 BKuQJ+sE6IzmQ==
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
Subject: [PATCH 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Date: Mon,  7 Sep 2026 17:42:40 +0100
Message-ID: <20260907164247.17223-16-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

