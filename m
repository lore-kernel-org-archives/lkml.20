Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B23531607;
	Thu, 15 Oct 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078693; cv=none; b=A9C0A9NOG5jbMR17YsjMSvdVSLy8l4k125jNbZ0/Gx8j2RW0Bi06Ku9yi8eAZtV84PKP8lX6x8xVwGLVWMZyEv+R8U0iYHKLO2A5zQpV+WTRGwUr5DPsCovTGomR8Yy6ULCind0G4pOdnggCJArOO8xIZ7LzcSI8KJ3PWngvJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078693; c=relaxed/simple;
	bh=nl0h5NBPyd9cqoyEjsRrT1emTdR0o4R38AIHOkOFa/g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YBKX8BZSJI/YeiUDrtJp3CxB1YCiF5aFPtAOjFFaesZ2yszOHJKgIa5KaK6Epo8HI2MDS1U/p7E1g0fbhn54/W0g2aExyQzHtIgVmWgKdryuDsQXMf8E5VL7/t4yVVm3Nf9tkevydmCSVTvR4SwqplFM7PJ1rhrEf83iALSBmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l56Oi98w; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/br/aqsR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l56Oi98w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/br/aqsR"
Date: Thu, 15 Oct 2026 15:37:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtdh4LZj5loAdKvP1LexxHtXfmnjWew2NuXCFbjVWI4=;
	b=l56Oi98wMVkPD1IsXLpi5uP08YnlVBxXoBx/v2O5LXL9McG3X9ejkoW5YtLsJoFxMMfP5R
	I5AXmPLx2fbEV92dNPxXPh45dG6s3XDVUkStnffCsPXZLl6AoRkYXOwAuKfmjcQfO1UNXW
	RNuWK4gu9eNUeOtblYGe+yggi66HVPxC7TdxS+AI1PlwWLw5ifpMhLU/TdDNaBkiMILASf
	Hs6kT2k8QJFrPMerOaaDUYiRTek2/NZbeiT3CZ51KZ4/FUmYCrjBXFwOlOAIBMaDOi/X0C
	bKQ7hHBavuvlMsDouGLNHZXsimmOJhOCKr1kcgfVTSY5fYE5YSNLLv6ZM6tiGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtdh4LZj5loAdKvP1LexxHtXfmnjWew2NuXCFbjVWI4=;
	b=/br/aqsRaRGdhQAoAT8yYuDfNO/IO3JCFZg2Qwb7vqcq+NkY7rFNGqz5iFr61cs8wzzrfm
	KSxMRcDZDlFZYyAA==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso: Delete asm-generic/vdso/vsyscall.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-5-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-5-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866915.2666988.1884597841534271932.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     8579b901d1506024656bb398ddff9d9115f4a06b
Gitweb:        https://git.kernel.org/tip/8579b901d1506024656bb398ddff9d9115f=
4a06b
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:18 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

vdso: Delete asm-generic/vdso/vsyscall.h

Recent refactoring have made the header empty.

Remove it and its mentions.

Also that header was never a real asm-generic header anyways.
It had no reason to be in the asm-generic directory.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-5-63ae=
856cc659@linutronix.de
---
 MAINTAINERS                                |  1 -
 arch/arm/include/asm/vdso/vsyscall.h       |  3 ---
 arch/arm64/include/asm/vdso/vsyscall.h     |  3 ---
 arch/loongarch/include/asm/vdso/vsyscall.h |  3 ---
 arch/mips/include/asm/vdso/vsyscall.h      |  3 ---
 arch/powerpc/include/asm/vdso/vsyscall.h   |  3 ---
 arch/riscv/include/asm/vdso/vsyscall.h     |  3 ---
 arch/s390/include/asm/vdso/vsyscall.h      |  3 ---
 arch/sparc/include/asm/vdso/vsyscall.h     |  2 --
 arch/x86/include/asm/vdso/vsyscall.h       |  3 ---
 include/asm-generic/vdso/vsyscall.h        | 10 ----------
 11 files changed, 37 deletions(-)
 delete mode 100644 include/asm-generic/vdso/vsyscall.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 879089f..6c9810f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11062,7 +11062,6 @@ M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
-F:	include/asm-generic/vdso/vsyscall.h
 F:	include/linux/vdso_datastore.h
 F:	include/linux/vdso_time.h
 F:	include/vdso/
diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso=
/vsyscall.h
index ff1c729..14f2ea9 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -14,9 +14,6 @@ void __arch_sync_vdso_time_data(struct vdso_time_data *vdat=
a)
 }
 #define __arch_sync_vdso_time_data __arch_sync_vdso_time_data
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLY__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/=
vdso/vsyscall.h
index 3f3c8eb..7d9d6bd 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -19,9 +19,6 @@ void __arch_update_vdso_clock(struct vdso_clock *vc)
 }
 #define __arch_update_vdso_clock __arch_update_vdso_clock
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/incl=
ude/asm/vdso/vsyscall.h
index 558eb9d..db65378 100644
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ b/arch/loongarch/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
=20
 #include <vdso/datapage.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vd=
so/vsyscall.h
index 0f061a9..f01ab2e 100644
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ b/arch/mips/include/asm/vdso/vsyscall.h
@@ -8,9 +8,6 @@
=20
 #include <vdso/datapage.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/=
asm/vdso/vsyscall.h
index bee18e8..6a6510f 100644
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ b/arch/powerpc/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
=20
 #include <asm/vdso_datapage.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* _ASM_POWERPC_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/=
vdso/vsyscall.h
index 558eb9d..db65378 100644
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ b/arch/riscv/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
=20
 #include <vdso/datapage.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vd=
so/vsyscall.h
index b00acec..c74c307 100644
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ b/arch/s390/include/asm/vdso/vsyscall.h
@@ -8,9 +8,6 @@
 #include <vdso/datapage.h>
 #include <asm/vdso.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/=
vdso/vsyscall.h
index 8bfe703..b08e0bd 100644
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ b/arch/sparc/include/asm/vdso/vsyscall.h
@@ -5,6 +5,4 @@
=20
 #define __VDSO_PAGES 4
=20
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso=
/vsyscall.h
index 4aa311a..57598db 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -14,9 +14,6 @@
 #include <vdso/datapage.h>
 #include <asm/vgtod.h>
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
=20
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/v=
syscall.h
deleted file mode 100644
index cfb740e..0000000
--- a/include/asm-generic/vdso/vsyscall.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_GENERIC_VSYSCALL_H
-#define __ASM_GENERIC_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_GENERIC_VSYSCALL_H */
