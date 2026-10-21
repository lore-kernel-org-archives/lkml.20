Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576283;
	b=fk/Bfo2JlZeOP5PzvFNhw9VQKaQbkrzNKSMYBZMvqnaZfZLFwtmpmFLaZPXwesEoKclw
	 PL8qdhxaadBuShsQpqNrpELojicNc1gqQ5XGSa6G5auGc+1+tih3qcuKltwdIbOHQUomO
	 49KD0SOQ0kQFrOyMxGPK6EP6YpZGG+o4qPNmLZ1JtrWyoBmMzqn6ebizPn9Lq9usS6U3q
	 hMxeTELxo1YxddnrNR3VOaNUoDgkNDSduNqj6DVosXoTGRPWOMECGlvoLEEJZUOrW7rOW
	 78Fvza0m2Fk8E7MjpfF4da3wXdtaaYmiL2IBkbl1Jdcz0S1OAdpbykihV0fMvUCnweA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576283;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:References:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mWuS0AsYJJi9T7xKrsJyIfDdRO31AHg+o4qD7hXTnD0=;
	b=NI1IFzMD2SjWJmuPPobmxXIOLFSNaVt3WuE5h+Qa9CnQHIGQ9Kc19dsnl62oAhhwdTeB
	 TucXsMwSSJphD/jXMVJ1R3wfBUmaet9nlqCfDRIBOVLfMi+ulXtv4I4g0MaYnwzAUDdrR
	 7kwamU31L16PV/No0QRm77JrN0qQMBU1nR1IrcpaFmmtOvGTQJZjjb1sAvhe5S4dS/vGb
	 mMEfzbsLwNp38hsy282m7+r2lzWDUsbF8gik2NFwNqZr4v0JxOpQTI2EE3WXK7grxfokY
	 bgwnzdInzv2EE3D1MKAD1TFPO3fg/q0ZIhI6FDLU28PxZ+c5Gm0EBplKONGQNqs3+Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRxu2XMF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAC606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRxu2XMF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0A01F000CD;
	Wed, 21 Oct 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576283;
	bh=mWuS0AsYJJi9T7xKrsJyIfDdRO31AHg+o4qD7hXTnD0=;
	h=Date:From:To:Cc:Subject:References;
	b=nRxu2XMFuEHFeG1jBz7WX0zeWy6cho0zIAlV/WgcLopIUhPP76DOM/HdVUNbjcqgj
	 B0NbZjYWClAGRg/4Q5GTLlAENBIrWV1xu/z+6C4dF6olqeD6zxghudiQecl3urEQ2/
	 hR+prcGAiUKp7ZFKQzoyFCtBBIlgY8VsIciu4T9lHB7iadj2Ttye1BveQ5tKm/Ujrg
	 tMaaffeewb571+bgZVMfbZE0ejy795vxRtE2EPHpLh2qqxXe07Z4F3mVF9z48A2Cxq
	 xhWc1pKp8nUc+2fZ0W5yE7fOTshAcMG7orEhY6LLnkt1GELLJH3agTd4yg8Qutv5M6
	 +GZDQyg2TDJ9Q==
Date: Wed, 21 Oct 2026 11:51:20 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/vdso for v7.4-rc1
References: <179257622431.804100.15107946105101279363.tglx@fw13>
Message-ID: <179257623037.804100.424498045146929293.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest timers/vdso branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-vdso-2026=
-10-20

up to:  8d17190fae2c: vdso/vsyscall: Keep the CLOCK_AUX base scaled


Updates for the VDSO subsystem:

  - Ensure that the CLOCK_AUX base calculations are properly scaled against
    the base timekeeper. The update function failed to take the fractional
    nanosecond part into account, which results in a rounding error.

  - Cleanup and consolidate the vsyscall headers to get rid of pointless
    copies all over the architectures.

  - Replace a runtime conditional in the time getter function for namespaced
    clocks by simple pointer arithmetic which speeds up the read function.


Thanks,

	tglx

------------------>
Thomas Wei=C3=9Fschuh (16):
      vdso: Move the kernel-side time update helpers to a new header
      vdso/gettimeofday: Define fallback __arch_get_vdso_u_time_data() in get=
timeofday.c
      vdso/getrandom: Define fallback __arch_get_vdso_u_rng_data() in getrand=
om.c
      vdso/vsyscall: Define fallback time synchronization functions in vsysca=
ll.c
      vdso: Delete asm-generic/vdso/vsyscall.h
      x86/vdso: Move vDSO page definitions to asm/vdso.h
      sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
      s390/vdso: Delete asm/vdso/vsyscall.h inclusions
      sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
      x86/vdso: Delete asm/vdso/vsyscall.h inclusions
      arm64/vdso: Delete asm/vdso/vsyscall.h inclusions
      riscv/hwprobe: Include vdso/datapage.h
      vdso: Remove unnecessary vdso/vsyscall.h includes
      vdso: Add asm-generic/vdso/vsyscall.h
      vdso: Remove __ASSEMBLER__ guards from vsyscall.h
      vdso/gettimeofday: Avoid runtime conditional in do_hres_timens()

Zhan Xusheng (3):
      vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
      vdso/math64: Add and use __iter_div64_u64_rem()
      vdso/vsyscall: Keep the CLOCK_AUX base scaled


 MAINTAINERS                                  |  2 +-
 arch/arm/include/asm/vdso/vsyscall.h         |  7 ----
 arch/arm/kernel/vdso.c                       |  1 -
 arch/arm64/include/asm/vdso/getrandom.h      |  1 -
 arch/arm64/include/asm/vdso/vsyscall.h       |  7 ----
 arch/arm64/kernel/vdso.c                     |  1 -
 arch/arm64/kernel/vdso/vdso.lds.S            |  1 -
 arch/loongarch/include/asm/vdso/vsyscall.h   | 14 --------
 arch/loongarch/kernel/vdso.c                 |  1 -
 arch/mips/include/asm/vdso/vsyscall.h        | 16 ---------
 arch/mips/kernel/vdso.c                      |  1 -
 arch/powerpc/include/asm/vdso/vsyscall.h     | 14 --------
 arch/riscv/include/asm/vdso/vsyscall.h       | 14 --------
 arch/riscv/kernel/sys_hwprobe.c              |  2 +-
 arch/riscv/kernel/vdso.c                     |  1 -
 arch/s390/include/asm/vdso/getrandom.h       |  1 -
 arch/s390/include/asm/vdso/vsyscall.h        | 16 ---------
 arch/s390/kernel/time.c                      |  6 ++--
 arch/s390/kernel/vdso.c                      |  1 -
 arch/s390/kernel/vdso/vdso.lds.S             |  1 -
 arch/sparc/include/asm/vdso.h                |  6 ++++
 arch/sparc/include/asm/vdso/vsyscall.h       | 10 ------
 arch/sparc/vdso/vdso-layout.lds.S            |  2 +-
 arch/sparc/vdso/vma.c                        |  1 -
 arch/x86/entry/vdso/common/vdso-layout.lds.S |  1 -
 arch/x86/entry/vdso/vma.c                    |  1 -
 arch/x86/include/asm/vdso.h                  |  7 ++++
 arch/x86/include/asm/vdso/vsyscall.h         | 22 ------------
 include/asm-generic/Kbuild                   |  1 +
 include/asm-generic/vdso/vsyscall.h          | 35 ------------------
 include/linux/vdso_time.h                    |  8 +++++
 include/vdso/math64.h                        | 33 ++++++++++++++---
 include/vdso/vsyscall.h                      |  7 ----
 kernel/time/vsyscall.c                       | 53 ++++++++++++++++----------=
--
 lib/vdso/getrandom.c                         |  8 +++--
 lib/vdso/gettimeofday.c                      | 23 +++++++-----
 36 files changed, 106 insertions(+), 220 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/mips/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/riscv/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/s390/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/sparc/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/x86/include/asm/vdso/vsyscall.h
 create mode 100644 include/linux/vdso_time.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..6c9810ff274a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11062,8 +11062,8 @@ M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
-F:	include/asm-generic/vdso/vsyscall.h
 F:	include/linux/vdso_datastore.h
+F:	include/linux/vdso_time.h
 F:	include/vdso/
 F:	kernel/time/namespace_vdso.c
 F:	kernel/time/vsyscall.c
diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso=
/vsyscall.h
index ff1c729af05f..b97dda100e52 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLY__
-
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
=20
@@ -14,9 +12,4 @@ void __arch_sync_vdso_time_data(struct vdso_time_data *vdat=
a)
 }
 #define __arch_sync_vdso_time_data __arch_sync_vdso_time_data
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLY__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index e306d0c5a21c..7be871f5eb9e 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <clocksource/arm_arch_timer.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 #define MAX_SYMNAME	64
=20
diff --git a/arch/arm64/include/asm/vdso/getrandom.h b/arch/arm64/include/asm=
/vdso/getrandom.h
index da1d58bbfabe..d9b9104d4ea1 100644
--- a/arch/arm64/include/asm/vdso/getrandom.h
+++ b/arch/arm64/include/asm/vdso/getrandom.h
@@ -6,7 +6,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <asm/unistd.h>
-#include <asm/vdso/vsyscall.h>
 #include <vdso/datapage.h>
=20
 /**
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/=
vdso/vsyscall.h
index 3f3c8eb74e2e..7c46c37fd36f 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLER__
-
 #include <vdso/datapage.h>
=20
 #define VDSO_PRECISION_MASK	~(0xFF00ULL<<48)
@@ -19,9 +17,4 @@ void __arch_update_vdso_clock(struct vdso_clock *vc)
 }
 #define __arch_update_vdso_clock __arch_update_vdso_clock
=20
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..50596dab23f9 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -22,7 +22,6 @@
 #include <linux/vmalloc.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 #include <asm/cacheflush.h>
 #include <asm/signal32.h>
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.=
lds.S
index 52314be29191..6334ca0a7673 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -11,7 +11,6 @@
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <vdso/datapage.h>
=20
diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/incl=
ude/asm/vdso/vsyscall.h
deleted file mode 100644
index 558eb9dfda52..000000000000
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 8ce8159c10b9..1edc8fb720de 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -20,7 +20,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 #include <vdso/datapage.h>
 #include <generated/vdso-offsets.h>
=20
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vd=
so/vsyscall.h
deleted file mode 100644
index 0f061a9babd1..000000000000
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,16 +0,0 @@
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
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 8165dd3fc1f8..8eb1760a8a9b 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
=20
 static_assert(VDSO_NR_PAGES =3D=3D __VDSO_PAGES);
=20
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/=
asm/vdso/vsyscall.h
deleted file mode 100644
index bee18e8660a0..000000000000
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_VDSO_VSYSCALL_H
-#define _ASM_POWERPC_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <asm/vdso_datapage.h>
-
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* _ASM_POWERPC_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/=
vdso/vsyscall.h
deleted file mode 100644
index 558eb9dfda52..000000000000
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d32622..d427d2f02c60 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -18,7 +18,7 @@
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
-#include <vdso/vsyscall.h>
+#include <vdso/datapage.h>
=20
=20
 #define EXT_KEY(isa_arg, ext, pv, missing)					\
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9c2f5e442338..5666cec180ac 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -15,7 +15,6 @@
 #include <asm/vdso.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
=20
 #define VVAR_SIZE  (VDSO_NR_PAGES << PAGE_SHIFT)
=20
diff --git a/arch/s390/include/asm/vdso/getrandom.h b/arch/s390/include/asm/v=
dso/getrandom.h
index 6741a27199f8..ff5882f2fc70 100644
--- a/arch/s390/include/asm/vdso/getrandom.h
+++ b/arch/s390/include/asm/vdso/getrandom.h
@@ -6,7 +6,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/syscall.h>
 #include <asm/unistd.h>
 #include <asm/page.h>
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vd=
so/vsyscall.h
deleted file mode 100644
index b00acec8ddbc..000000000000
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,16 +0,0 @@
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
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 2b989bebd220..bca65bf1c8cb 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -39,7 +39,7 @@
 #include <linux/gfp.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
-#include <vdso/vsyscall.h>
+#include <linux/vdso_time.h>
 #include <vdso/clocksource.h>
 #include <vdso/helpers.h>
 #include <asm/facility.h>
@@ -527,7 +527,7 @@ static int stp_sync_clock(void *data)
 			cpu_relax();
 		rc =3D 0;
 		if (stp_info.todoff || stp_info.tmd !=3D 2) {
-			flags =3D vdso_update_begin();
+			flags =3D vdso_time_update_begin();
 			rc =3D chsc_sstpc(stp_page, STP_OP_SYNC, 0,
 					&clock_delta);
 			if (rc =3D=3D 0) {
@@ -537,7 +537,7 @@ static int stp_sync_clock(void *data)
 				if (rc =3D=3D 0 && stp_info.tmd !=3D 2)
 					rc =3D -EAGAIN;
 			}
-			vdso_update_end(flags);
+			vdso_time_update_end(flags);
 		}
 		sync->in_sync =3D rc ? -EAGAIN : 1;
 		xchg(&first, 0);
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 0fe616c49fcc..a905f989f910 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -18,7 +18,6 @@
 #include <linux/random.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/alternative.h>
 #include <asm/vdso.h>
=20
diff --git a/arch/s390/kernel/vdso/vdso.lds.S b/arch/s390/kernel/vdso/vdso.ld=
s.S
index 841daeec4be2..6bcdb64315f2 100644
--- a/arch/s390/kernel/vdso/vdso.lds.S
+++ b/arch/s390/kernel/vdso/vdso.lds.S
@@ -4,7 +4,6 @@
  * library
  */
=20
-#include <asm/vdso/vsyscall.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <asm-generic/vmlinux.lds.h>
diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index f08562d10215..b17c37c8075b 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -5,6 +5,10 @@
 #ifndef _ASM_SPARC_VDSO_H
 #define _ASM_SPARC_VDSO_H
=20
+#define __VDSO_PAGES 4
+
+#ifndef __ASSEMBLER__
+
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
@@ -17,4 +21,6 @@ extern const struct vdso_image vdso_image_64_builtin;
 extern const struct vdso_image vdso_image_32_builtin;
 #endif
=20
+#endif /* __ASSEMBLER__ */
+
 #endif /* _ASM_SPARC_VDSO_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/=
vdso/vsyscall.h
deleted file mode 100644
index 8bfe703fedc5..000000000000
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_SPARC_VDSO_VSYSCALL_H
-#define _ASM_SPARC_VDSO_VSYSCALL_H
-
-#define __VDSO_PAGES 4
-
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/vdso/vdso-layout.lds.S b/arch/sparc/vdso/vdso-layout.=
lds.S
index 180e5d0ee071..920396203a2e 100644
--- a/arch/sparc/vdso/vdso-layout.lds.S
+++ b/arch/sparc/vdso/vdso-layout.lds.S
@@ -6,7 +6,7 @@
=20
 #include <vdso/datapage.h>
 #include <vdso/page.h>
-#include <asm/vdso/vsyscall.h>
+#include <asm/vdso.h>
=20
 SECTIONS
 {
diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index 60029d60f4d3..ab6626c1ee61 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -23,7 +23,6 @@
 #include <asm/page.h>
=20
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
=20
 unsigned int __read_mostly vdso_enabled =3D 1;
=20
diff --git a/arch/x86/entry/vdso/common/vdso-layout.lds.S b/arch/x86/entry/vd=
so/common/vdso-layout.lds.S
index a1e30be3e83d..f190efbc640e 100644
--- a/arch/x86/entry/vdso/common/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/common/vdso-layout.lds.S
@@ -1,6 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
-#include <asm/vdso/vsyscall.h>
 #include <vdso/datapage.h>
=20
 /*
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 18dfd80a81ef..4bd3b22beea9 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -25,7 +25,6 @@
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
-#include <asm/vdso/vsyscall.h>
 #include <clocksource/hyperv_timer.h>
=20
 static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =3D=3D __VDSO_PAGES);
diff --git a/arch/x86/include/asm/vdso.h b/arch/x86/include/asm/vdso.h
index 4e735158c1b2..071e4a262b50 100644
--- a/arch/x86/include/asm/vdso.h
+++ b/arch/x86/include/asm/vdso.h
@@ -6,6 +6,13 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
=20
+#define __VDSO_PAGES	6
+
+#define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_P=
AGES) * PAGE_SIZE)
+#define VDSO_PAGE_PVCLOCK_OFFSET	0
+#define VDSO_PAGE_HVCLOCK_OFFSET	1
+
 #ifndef __ASSEMBLER__
=20
 #include <linux/mm_types.h>
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso=
/vsyscall.h
deleted file mode 100644
index 4aa311a923f2..000000000000
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#define __VDSO_PAGES	6
-
-#define VDSO_NR_VCLOCK_PAGES	2
-#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_P=
AGES) * PAGE_SIZE)
-#define VDSO_PAGE_PVCLOCK_OFFSET	0
-#define VDSO_PAGE_HVCLOCK_OFFSET	1
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-#include <asm/vgtod.h>
-
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 2bc00c67dc54..b7a388bef6ea 100644
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
index a6b03cfba0e2..e69de29bb2d1 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_GENERIC_VSYSCALL_H
-#define __ASM_GENERIC_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#ifndef __arch_get_vdso_u_time_data
-static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_d=
ata(void)
-{
-	return &vdso_u_time_data;
-}
-#endif
-
-#ifndef __arch_get_vdso_u_rng_data
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
-{
-	return &vdso_u_rng_data;
-}
-#endif
-
-#ifndef __arch_update_vdso_clock
-static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
-{
-}
-#endif /* __arch_update_vdso_clock */
-
-#ifndef __arch_sync_vdso_time_data
-static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data=
 *vdata)
-{
-}
-#endif /* __arch_sync_vdso_time_data */
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_GENERIC_VSYSCALL_H */
diff --git a/include/linux/vdso_time.h b/include/linux/vdso_time.h
new file mode 100644
index 000000000000..6d81ee3a3c9c
--- /dev/null
+++ b/include/linux/vdso_time.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VDSO_TIME_H
+#define _LINUX_VDSO_TIME_H
+
+unsigned long vdso_time_update_begin(void);
+void vdso_time_update_end(unsigned long flags);
+
+#endif /* _LINUX_VDSO_TIME_H */
diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..6f1e311cfdbd 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,38 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
=20
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
+#include <linux/compiler.h>
+
+static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64=
 *remainder)
+{
+	u32 ret =3D 0;
+
+	while (dividend >=3D divisor) {
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
+
+		dividend -=3D divisor;
+		ret++;
+	}
+
+	*remainder =3D dividend;
+
+	return ret;
+}
+
+static __always_inline u32 __iter_div64_u64_rem(u64 dividend, u64 divisor, u=
64 *remainder)
 {
 	u32 ret =3D 0;
=20
 	while (dividend >=3D divisor) {
-		/* The following asm() prevents the compiler from
-		   optimising this loop into a modulo operation.  */
-		asm("" : "+rm"(dividend));
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
=20
 		dividend -=3D divisor;
 		ret++;
diff --git a/include/vdso/vsyscall.h b/include/vdso/vsyscall.h
index c5c2a2c07857..af62bbf04eac 100644
--- a/include/vdso/vsyscall.h
+++ b/include/vdso/vsyscall.h
@@ -2,13 +2,6 @@
 #ifndef __VDSO_VSYSCALL_H
 #define __VDSO_VSYSCALL_H
=20
-#ifndef __ASSEMBLER__
-
 #include <asm/vdso/vsyscall.h>
=20
-unsigned long vdso_update_begin(void);
-void vdso_update_end(unsigned long flags);
-
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __VDSO_VSYSCALL_H */
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919b8f2c..658553fd910b 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -9,12 +9,25 @@
=20
 #include <linux/hrtimer.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/vdso_time.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
=20
 #include "timekeeping_internal.h"
=20
+#ifndef __arch_update_vdso_clock
+static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
+{
+}
+#endif /* __arch_update_vdso_clock */
+
+#ifndef __arch_sync_vdso_time_data
+static __always_inline void __arch_sync_vdso_time_data(struct vdso_time_data=
 *vdata)
+{
+}
+#endif /* __arch_sync_vdso_time_data */
+
 static inline void fill_clock_configuration(struct vdso_clock *vc, const str=
uct tk_read_base *base)
 {
 	vc->cycle_last	=3D base->cycle_last;
@@ -41,14 +54,12 @@ static inline void update_vdso_time_data(struct vdso_time=
_data *vdata, struct ti
=20
 	nsec =3D tk->tkr_mono.xtime_nsec;
 	nsec +=3D ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
-	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	=3D nsec;
+	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_m=
ono.shift,
+						&vdso_ts->nsec);
=20
 	/* Copy MONOTONIC time for BOOTTIME */
 	sec	=3D vdso_ts->sec;
+	nsec	=3D vdso_ts->nsec;
 	/* Add the boot offset */
 	sec	+=3D tk->monotonic_to_boot.tv_sec;
 	nsec	+=3D (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
@@ -56,12 +67,8 @@ static inline void update_vdso_time_data(struct vdso_time_=
data *vdata, struct ti
 	/* CLOCK_BOOTTIME */
 	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	=3D sec;
-
-	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	=3D nsec;
+	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_m=
ono.shift,
+						&vdso_ts->nsec);
=20
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		=3D &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
@@ -161,11 +168,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
=20
 		vdso_ts->sec =3D tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
=20
-		nsec =3D tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec +=3D tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec +=3D __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec =3D nsec << tk->tkr_mono.shift;
-		vdso_ts->nsec =3D nsec;
+		nsec =3D tk->tkr_mono.xtime_nsec;
+		nsec +=3D (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec +=3D __iter_div64_u64_rem(nsec,
+						     (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						     &vdso_ts->nsec);
 	}
=20
 	__arch_update_vdso_clock(vc);
@@ -177,7 +184,7 @@ void vdso_time_update_aux(struct timekeeper *tk)
 #endif
=20
 /**
- * vdso_update_begin - Start of a VDSO update section
+ * vdso_time_update_begin - Start of a VDSO update section
  *
  * Allows architecture code to safely update the architecture specific VDSO
  * data. Disables interrupts, acquires timekeeper lock to serialize against
@@ -186,9 +193,9 @@ void vdso_time_update_aux(struct timekeeper *tk)
  * inconsistent data.
  *
  * Returns: Saved interrupt flags which need to be handed in to
- * vdso_update_end().
+ * vdso_time_update_end().
  */
-unsigned long vdso_update_begin(void)
+unsigned long vdso_time_update_begin(void)
 {
 	struct vdso_time_data *vdata =3D vdso_k_time_data;
 	unsigned long flags =3D timekeeper_lock_irqsave();
@@ -198,14 +205,14 @@ unsigned long vdso_update_begin(void)
 }
=20
 /**
- * vdso_update_end - End of a VDSO update section
- * @flags:	Interrupt flags as returned from vdso_update_begin()
+ * vdso_time_update_end - End of a VDSO update section
+ * @flags:	Interrupt flags as returned from vdso_time_update_begin()
  *
- * Pairs with vdso_update_begin(). Marks vdso data consistent, invokes data
+ * Pairs with vdso_time_update_begin(). Marks vdso data consistent, invokes =
data
  * synchronization if the architecture requires it, drops timekeeper lock
  * and restores interrupt flags.
  */
-void vdso_update_end(unsigned long flags)
+void vdso_time_update_end(unsigned long flags)
 {
 	struct vdso_time_data *vdata =3D vdso_k_time_data;
=20
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa9154f..e0fa10bbefc9 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -16,8 +16,12 @@
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
=20
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
+#ifndef __arch_get_vdso_u_rng_data
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
+{
+	return &vdso_u_rng_data;
+}
+#endif
=20
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >=3D sizeof(type)) {						\
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591aba59f..c0e81996532d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -27,9 +27,6 @@
=20
 #include <linux/build_bug.h>
=20
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
-
 #ifndef vdso_calc_ns
=20
 #ifdef VDSO_DELTA_NOMASK
@@ -93,6 +90,13 @@ static inline bool vdso_cycles_ok(u64 cycles)
 }
 #endif
=20
+#ifndef __arch_get_vdso_u_time_data
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_d=
ata(void)
+{
+	return &vdso_u_time_data;
+}
+#endif
+
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
 	/* Check for negative values or invalid clocks */
@@ -135,22 +139,23 @@ const struct vdso_time_data *vdso_timens_data(const str=
uct vdso_time_data *vd)
 	return (void *)vd + PAGE_SIZE;
 }
=20
+static __always_inline
+const struct vdso_clock *vdso_timens_clock(const struct vdso_clock *vc)
+{
+	return (void *)vc + PAGE_SIZE;
+}
+
 static __always_inline
 bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clo=
ck *vcns,
 		    clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd =3D vdso_timens_data(vdns);
+	const struct vdso_clock *vc =3D vdso_timens_clock(vcns);
 	const struct timens_offset *offs =3D &vcns->offset[clk];
-	const struct vdso_clock *vc =3D vd->clock_data;
 	u32 seq;
 	s64 sec;
 	u64 ns;
=20
-	if (clk !=3D CLOCK_MONOTONIC_RAW)
-		vc =3D &vc[CS_HRES_COARSE];
-	else
-		vc =3D &vc[CS_RAW];
-
 	do {
 		seq =3D vdso_read_begin(vc);
=20

