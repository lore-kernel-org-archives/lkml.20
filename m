Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4D3E4105;
	Thu, 15 Oct 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078678; cv=none; b=WK0BYKWzdwr6zG8XxdL+Mv20laullNT9XRrbj/rfIhStwIpUucLodmgPnjOfDKC+7ngAbNuvJNDDOmcoUPLsiUZs61wfx7ng7dpjVHA6A+ThaPlU70Lg9wLO0Rk66geAegZb5yYdWYKl4YT8asffQ5DU7KLKYVNnmTj+HuVSi7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078678; c=relaxed/simple;
	bh=ifRmgl1Y0lmbAeuP0znofBfUGdK/gP66gMTOOooqtZc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bnPmm2etI+uQoOMzY7HpFI3pKtNjh65vkkx6/qjCYVMnQMEgglLzLL8Ve10ELh3uVKHwxHGtb75dUVnslU0YdJ2Qu6xeQ69VwmcJXDLzL55T/NWFiGoPlHLEKm3qj5Ef3mBTBH8K4smqn72aKEUT524m0gBmHCLSvFW7POr66iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UbzRecDz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CurXWYf9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UbzRecDz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CurXWYf9"
Date: Thu, 15 Oct 2026 15:37:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078657;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQqFlU8xlzb9bBRXSvNHvwyr3sfd9eeQbbbhbLscrLs=;
	b=UbzRecDzLbhHUEQ0tUJw11nsTPjK58axBtuxgaiKM13nSNW2ziApmJfHyGqxnUlMrGPgXb
	YAdM6T1/6M/yY47ULUJqSPHAQmBL0oCbcMJjz65lzllAuGT5IrIbPq+9lRXwh7MLngmld8
	iI4WSkSwQuFIyRu+tufna4Q/m7Fymo7vrYq//44Cc9kgB7y9SXZS7S6Ysur5dIYtt7wTDf
	IJv+MQMq8+VWcTGDAozR+cbOXKe90291dk0gohiWTkLRppoXfIrktcxTw52Hm7X9wo1F5r
	G20NrajnytnAiyx0QX2kA/iYfTbd/ifxaEXyk31EbUoOulPbOws/nydqsJmNQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078657;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQqFlU8xlzb9bBRXSvNHvwyr3sfd9eeQbbbhbLscrLs=;
	b=CurXWYf94xtvv6ATDFT7KR/4Tq2oJU/MC5rvWyqWaUIEh1Y1M6C62LxUBp002StHogo++f
	4Dm360U6HxxIQ0DQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso: Add asm-generic/vdso/vsyscall.h
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-14-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-14-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865560.2666988.14969946295818010176.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     996b01393e9317d6443b0c1816fa7e5134c2a0a1
Gitweb:        https://git.kernel.org/tip/996b01393e9317d6443b0c1816fa7e5134c=
2a0a1
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:27 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso: Add asm-generic/vdso/vsyscall.h

Most architectures' asm/vdso/vsyscall.h do not define any symbols.

Add an empty asm-generic variant and replace the pointless
architecture-specific copies.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-14-63a=
e856cc659@linutronix.de
---
 arch/loongarch/include/asm/vdso/vsyscall.h | 11 -----------
 arch/mips/include/asm/vdso/vsyscall.h      | 13 -------------
 arch/powerpc/include/asm/vdso/vsyscall.h   | 11 -----------
 arch/riscv/include/asm/vdso/vsyscall.h     | 11 -----------
 arch/s390/include/asm/vdso/vsyscall.h      | 13 -------------
 arch/sparc/include/asm/vdso/vsyscall.h     |  6 ------
 arch/x86/include/asm/vdso/vsyscall.h       | 12 ------------
 include/asm-generic/Kbuild                 |  1 +
 include/asm-generic/vdso/vsyscall.h        |  0
 9 files changed, 1 insertion(+), 77 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/mips/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/riscv/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/s390/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/sparc/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/x86/include/asm/vdso/vsyscall.h
 create mode 100644 include/asm-generic/vdso/vsyscall.h

diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/incl=
ude/asm/vdso/vsyscall.h
deleted file mode 100644
index db65378..0000000
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vd=
so/vsyscall.h
deleted file mode 100644
index f01ab2e..0000000
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#include <asm/page.h>
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/=
asm/vdso/vsyscall.h
deleted file mode 100644
index 6a6510f..0000000
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_VDSO_VSYSCALL_H
-#define _ASM_POWERPC_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <asm/vdso_datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* _ASM_POWERPC_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/=
vdso/vsyscall.h
deleted file mode 100644
index db65378..0000000
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vd=
so/vsyscall.h
deleted file mode 100644
index c74c307..0000000
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <linux/hrtimer.h>
-#include <vdso/datapage.h>
-#include <asm/vdso.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/=
vdso/vsyscall.h
deleted file mode 100644
index ff62b29..0000000
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_SPARC_VDSO_VSYSCALL_H
-#define _ASM_SPARC_VDSO_VSYSCALL_H
-
-#endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso=
/vsyscall.h
deleted file mode 100644
index 65d10f4..0000000
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-#include <asm/vgtod.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 2bc00c6..b7a388b 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -63,6 +63,7 @@ mandatory-y +=3D trace_clock.h
 mandatory-y +=3D uaccess.h
 mandatory-y +=3D unwind_user.h
 mandatory-y +=3D vdso/clocksource.h
+mandatory-y +=3D vdso/vsyscall.h
 mandatory-y +=3D vermagic.h
 mandatory-y +=3D vga.h
 mandatory-y +=3D video.h
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/v=
syscall.h
new file mode 100644
index 0000000..e69de29
--- /dev/null
+++ b/include/asm-generic/vdso/vsyscall.h
