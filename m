Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526847;
	b=aN68FY/kx17bEzEW6ZI6fg0e3dDcBobmyChVZX4nCx0Ond70VRsFrJvY66BpWDCIAJ3H
	 G/Qlt8zD1IrQd6+HNxRDadSvOgDZSdJxke05NaGTr/BFSMVERVLEDi8xLKFVAlU9imMT6
	 WbPFxXw02jvqzMOKt2bOlUTTcw2mV0eDDOE6NL5aOtNVj21347XQqNX9VMAWdgPhxjucV
	 GBaj7EGe6CDNivrdb0k/iTZJhYuVivSt/AEIUcQp0GX4MGqFnbpIHHxmQ8cL7WYdyFQan
	 y0iAiiuPBuPWNZ9BsK8pyyUcgzQP1aQwnviBbyrzLQNeFuPCpAuQ1dFs93JsBhR9fEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526847;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=q4CtdbGHKajBacB5IGCC5mgI3Z/2R2z7meAjFvekqvU=;
	b=nNE3OIzDItf2jjD9cJWPQEAMfxujYmplRitjDmvvJyTnPGp0xC0MlKBlY6pOXah2l7ry
	 2uUFr+IWOaBMK6TOvjlrtsn2yS6f96vetNk/l9fkTogWkGjXc2sXIozgV9pvWLw7uMp82
	 cfnIzf8R1xEOtvmx/+meKUap5zaf1vq3Ltr4U7fHU54ncIDTMuXnSqlLM9WQhkdNK1Hzt
	 tTRxXGqNhYDC2p5r+bvfD0nVR44k3g5pHkM0qVTfvjJ66HuXpnWdq6kILMBh0+Y+KFcUt
	 QPfTvxJy43PJkfpV8Ic3AF+2e9GorgkfhK3EKOsljzF0kBbDqHQXZbu250m4zxJryzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xj8vHk6b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dTXh83HM;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0075606A31C;
	Thu, 12 Nov 2026 23:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0075606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xj8vHk6b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dTXh83HM
Date: Thu, 12 Nov 2026 23:40:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794526844;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q4CtdbGHKajBacB5IGCC5mgI3Z/2R2z7meAjFvekqvU=;
	b=xj8vHk6bV2Km2zy3rBBZN211VImD61JRmF3TVpql3n0krYiWUxMq2Iq24HvW3/JkRNef3J
	SIbVqIg2PfSmScq6jg6yN8M3Qv68rmte5mZWDMUkkQniJjvXXWpwVr2h31HXR1ciHHQMuZ
	pjTl8tjqz0JvOH9hWbT0PTkYOYbEi1JmSOmaoZWAPQ8BmSPykiE7uYEY33Hz8cw6MqU90t
	JNuiFf3Et9VrWVrsu31eOWsYt8TXxx+A89WAG60ehqMnULuF2BVZX2EukYFdF45D3Z+sQk
	4BZwO/HeZZYt9Skr8eFfumT6HJ8aHiPq6z9Unui4qImKvOZG7lBRtGiHgmz0/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794526844;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q4CtdbGHKajBacB5IGCC5mgI3Z/2R2z7meAjFvekqvU=;
	b=dTXh83HMMaxjk8tKHxPlbx+zrYeZDKr5nV5d60jPlZO3nuvIJxAdrlbc6mGE/lXSXU45oi
	937jyhrn0JquESBA==
From: "tip-bot2 for Luiz Capitulino" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cleanups] x86/setup: Remove the BIOS memory corruption
 check feature
Cc: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112024210.3984587-1-luiz.capitulino@linux.dev>
References: <20261112024210.3984587-1-luiz.capitulino@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179452684281.2969448.12157575033251925048.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     57964216f9f6a61e4ce43f6826bb975c12cc3c87
Gitweb:        https://git.kernel.org/tip/57964216f9f6a61e4ce43f6826bb975c12c=
c3c87
Author:        Luiz Capitulino <luiz.capitulino@linux.dev>
AuthorDate:    Wed, 11 Nov 2026 21:42:10 -05:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 12 Nov 2026 15:02:36 -08:00

x86/setup: Remove the BIOS memory corruption check feature

By default, the BIOS memory corruption check works by reserving the
first 64 KiB physical area from memblock, zeroing it and then scanning it
periodically.

However, in its default configuration it has been broken since v5.13 by
two commits:

- Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
  Moved trim_low_memory_range() into early_reserve_memory(), which runs
  earlier in setup_arch(), causing the first 64 KiB to be reserved
  before setup_bios_corruption_check() runs

- Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
  Hardcodes the reservation of the first 64 KiB early in
  early_reserve_memory()

This has been broken for years and nobody reported it, which suggests the
feature might have no users.

It may be possible to fix this by running setup_bios_corruption_check()
earlier, but that's not worth doing: the feature was intended to detect
corruption in the first 64 KiB but the kernel will never access that
range anyway.

Note that one case still "works", which is passing memory_corruption_check_si=
ze=3D
to scan a larger region. But this is not useful either: the parameter takes
a size, not an address range, so what gets scanned is whatever memblock
happens to have free below that size.

Remove the feature.

Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: H. Peter Anvin <hpa@zytor.com>
Link: https://patch.msgid.link/20261112024210.3984587-1-luiz.capitulino@linux=
.dev
---
 Documentation/admin-guide/kernel-parameters.txt |  23 +--
 arch/x86/Kconfig                                |  30 +--
 arch/x86/configs/i386_defconfig                 |   1 +-
 arch/x86/configs/x86_64_defconfig               |   1 +-
 arch/x86/include/asm/bios_ebda.h                |  17 +-
 arch/x86/include/asm/setup.h                    |   1 +-
 arch/x86/kernel/Makefile                        |   2 +-
 arch/x86/kernel/check.c                         | 187 +---------------
 arch/x86/kernel/setup.c                         |   4 +-
 9 files changed, 266 deletions(-)
 delete mode 100644 arch/x86/kernel/check.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/=
admin-guide/kernel-parameters.txt
index 0b3c140..0508666 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3998,29 +3998,6 @@ Kernel parameters
 			specified as e820 types, e.g., 1 =3D RAM, 2 =3D reserved,
 			3 =3D ACPI, 12 =3D PRAM.
=20
-	memory_corruption_check=3D0/1 [X86,EARLY]
-			Some BIOSes seem to corrupt the first 64k of
-			memory when doing things like suspend/resume.
-			Setting this option will scan the memory
-			looking for corruption.  Enabling this will
-			both detect corruption and prevent the kernel
-			from using the memory being corrupted.
-			However, it's intended as a diagnostic tool; if
-			repeatable BIOS-originated corruption always
-			affects the same memory, you can use memmap=3D
-			to prevent the kernel from using that memory.
-
-	memory_corruption_check_size=3Dsize [X86,EARLY]
-			By default it checks for corruption in the low
-			64k, making this memory unavailable for normal
-			use.  Use this parameter to scan for
-			corruption in more or less memory.
-
-	memory_corruption_check_period=3Dseconds [X86,EARLY]
-			By default it checks for corruption every 60
-			seconds.  Use this parameter to check at some
-			other rate.  0 disables periodic checking.
-
 	memory_hotplug.memmap_on_memory
 			[KNL,X86,ARM] Boolean flag to enable this feature.
 			Format: {on | off (default)}
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b..7ba002d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1602,36 +1602,6 @@ config X86_PMEM_LEGACY
=20
 	  Say Y if unsure.
=20
-config X86_CHECK_BIOS_CORRUPTION
-	bool "Check for low memory corruption"
-	help
-	  Periodically check for memory corruption in low memory, which
-	  is suspected to be caused by BIOS.  Even when enabled in the
-	  configuration, it is disabled at runtime.  Enable it by
-	  setting "memory_corruption_check=3D1" on the kernel command
-	  line.  By default it scans the low 64k of memory every 60
-	  seconds; see the memory_corruption_check_size and
-	  memory_corruption_check_period parameters in
-	  Documentation/admin-guide/kernel-parameters.rst to adjust this.
-
-	  When enabled with the default parameters, this option has
-	  almost no overhead, as it reserves a relatively small amount
-	  of memory and scans it infrequently.  It both detects corruption
-	  and prevents it from affecting the running system.
-
-	  It is, however, intended as a diagnostic tool; if repeatable
-	  BIOS-originated corruption always affects the same memory,
-	  you can use memmap=3D to prevent the kernel from using that
-	  memory.
-
-config X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
-	bool "Set the default setting of memory_corruption_check"
-	depends on X86_CHECK_BIOS_CORRUPTION
-	default y
-	help
-	  Set whether the default state of memory_corruption_check is
-	  on or off.
-
 config MTRR
 	def_bool y
 	prompt "MTRR (Memory Type Range Register) support" if EXPERT
diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index 79fa38c..848c2d9 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -36,7 +36,6 @@ CONFIG_PARAVIRT=3Dy
 CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
 CONFIG_X86_MSR=3Dy
 CONFIG_X86_CPUID=3Dy
-CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
 # CONFIG_MTRR_SANITIZER is not set
 CONFIG_EFI=3Dy
 CONFIG_EFI_STUB=3Dy
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defc=
onfig
index e6896ae..7c76abe 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -35,7 +35,6 @@ CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
 CONFIG_X86_MSR=3Dy
 CONFIG_X86_CPUID=3Dy
 CONFIG_NUMA=3Dy
-CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
 # CONFIG_MTRR_SANITIZER is not set
 CONFIG_EFI=3Dy
 CONFIG_EFI_STUB=3Dy
diff --git a/arch/x86/include/asm/bios_ebda.h b/arch/x86/include/asm/bios_ebd=
a.h
index 4d5a17e..2f441fd 100644
--- a/arch/x86/include/asm/bios_ebda.h
+++ b/arch/x86/include/asm/bios_ebda.h
@@ -20,21 +20,4 @@ static inline unsigned int get_bios_ebda(void)
=20
 void reserve_bios_regions(void);
=20
-#ifdef CONFIG_X86_CHECK_BIOS_CORRUPTION
-/*
- * This is obviously not a great place for this, but we want to be
- * able to scatter it around anywhere in the kernel.
- */
-void check_for_bios_corruption(void);
-void start_periodic_check_for_corruption(void);
-#else
-static inline void check_for_bios_corruption(void)
-{
-}
-
-static inline void start_periodic_check_for_corruption(void)
-{
-}
-#endif
-
 #endif /* _ASM_X86_BIOS_EBDA_H */
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 895d09f..cd04275 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -42,7 +42,6 @@ static inline void vsmp_init(void) { }
=20
 struct pt_regs;
=20
-void setup_bios_corruption_check(void);
 void early_platform_quirks(void);
=20
 extern unsigned long saved_video_mode;
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 31f46fd..7025369 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -149,8 +149,6 @@ obj-$(CONFIG_JAILHOUSE_GUEST)	+=3D jailhouse.o
 obj-$(CONFIG_EISA)		+=3D eisa.o
 obj-$(CONFIG_PCSPKR_PLATFORM)	+=3D pcspeaker.o
=20
-obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) +=3D check.o
-
 obj-$(CONFIG_OF)			+=3D devicetree.o
 obj-$(CONFIG_UPROBES)			+=3D uprobes.o
=20
diff --git a/arch/x86/kernel/check.c b/arch/x86/kernel/check.c
deleted file mode 100644
index 5136e68..0000000
--- a/arch/x86/kernel/check.c
+++ /dev/null
@@ -1,187 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/init.h>
-#include <linux/sched.h>
-#include <linux/kthread.h>
-#include <linux/workqueue.h>
-#include <linux/memblock.h>
-
-#include <asm/proto.h>
-#include <asm/setup.h>
-
-/*
- * Some BIOSes seem to corrupt the low 64k of memory during events
- * like suspend/resume and unplugging an HDMI cable.  Reserve all
- * remaining free memory in that area and fill it with a distinct
- * pattern.
- */
-#define MAX_SCAN_AREAS	8
-
-static int __read_mostly memory_corruption_check =3D -1;
-
-static unsigned __read_mostly corruption_check_size =3D 64*1024;
-static unsigned __read_mostly corruption_check_period =3D 60; /* seconds */
-
-static struct scan_area {
-	u64 addr;
-	u64 size;
-} scan_areas[MAX_SCAN_AREAS];
-static int num_scan_areas;
-
-static __init int set_corruption_check(char *arg)
-{
-	ssize_t ret;
-	unsigned long val;
-
-	if (!arg) {
-		pr_err("memory_corruption_check config string not provided\n");
-		return -EINVAL;
-	}
-
-	ret =3D kstrtoul(arg, 10, &val);
-	if (ret)
-		return ret;
-
-	memory_corruption_check =3D val;
-
-	return 0;
-}
-early_param("memory_corruption_check", set_corruption_check);
-
-static __init int set_corruption_check_period(char *arg)
-{
-	ssize_t ret;
-	unsigned long val;
-
-	if (!arg) {
-		pr_err("memory_corruption_check_period config string not provided\n");
-		return -EINVAL;
-	}
-
-	ret =3D kstrtoul(arg, 10, &val);
-	if (ret)
-		return ret;
-
-	corruption_check_period =3D val;
-	return 0;
-}
-early_param("memory_corruption_check_period", set_corruption_check_period);
-
-static __init int set_corruption_check_size(char *arg)
-{
-	char *end;
-	unsigned size;
-
-	if (!arg) {
-		pr_err("memory_corruption_check_size config string not provided\n");
-		return -EINVAL;
-	}
-
-	size =3D memparse(arg, &end);
-
-	if (*end =3D=3D '\0')
-		corruption_check_size =3D size;
-
-	return (size =3D=3D corruption_check_size) ? 0 : -EINVAL;
-}
-early_param("memory_corruption_check_size", set_corruption_check_size);
-
-
-void __init setup_bios_corruption_check(void)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	if (memory_corruption_check =3D=3D -1) {
-		memory_corruption_check =3D
-#ifdef CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
-			1
-#else
-			0
-#endif
-			;
-	}
-
-	if (corruption_check_size =3D=3D 0)
-		memory_corruption_check =3D 0;
-
-	if (!memory_corruption_check)
-		return;
-
-	corruption_check_size =3D round_up(corruption_check_size, PAGE_SIZE);
-
-	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE, &start, &end,
-				NULL) {
-		start =3D clamp_t(phys_addr_t, round_up(start, PAGE_SIZE),
-				PAGE_SIZE, corruption_check_size);
-		end =3D clamp_t(phys_addr_t, round_down(end, PAGE_SIZE),
-			      PAGE_SIZE, corruption_check_size);
-		if (start >=3D end)
-			continue;
-
-		memblock_reserve(start, end - start);
-		scan_areas[num_scan_areas].addr =3D start;
-		scan_areas[num_scan_areas].size =3D end - start;
-
-		/* Assume we've already mapped this early memory */
-		memset(__va(start), 0, end - start);
-
-		if (++num_scan_areas >=3D MAX_SCAN_AREAS)
-			break;
-	}
-
-	if (num_scan_areas)
-		pr_info("Scanning %d areas for low memory corruption\n", num_scan_areas);
-}
-
-
-static void check_for_bios_corruption(void)
-{
-	int i;
-	int corruption =3D 0;
-
-	if (!memory_corruption_check)
-		return;
-
-	for (i =3D 0; i < num_scan_areas; i++) {
-		unsigned long *addr =3D __va(scan_areas[i].addr);
-		unsigned long size =3D scan_areas[i].size;
-
-		for (; size; addr++, size -=3D sizeof(unsigned long)) {
-			if (!*addr)
-				continue;
-			pr_err("Corrupted low memory at %p (%lx phys) =3D %08lx\n", addr, __pa(ad=
dr), *addr);
-			corruption =3D 1;
-			*addr =3D 0;
-		}
-	}
-
-	WARN_ONCE(corruption, KERN_ERR "Memory corruption detected in low memory\n"=
);
-}
-
-static void check_corruption(struct work_struct *dummy);
-static DECLARE_DELAYED_WORK(bios_check_work, check_corruption);
-
-static void check_corruption(struct work_struct *dummy)
-{
-	check_for_bios_corruption();
-	schedule_delayed_work(&bios_check_work,
-		round_jiffies_relative(corruption_check_period*HZ));
-}
-
-static int start_periodic_check_for_corruption(void)
-{
-	if (!num_scan_areas || !memory_corruption_check || corruption_check_period =
=3D=3D 0)
-		return 0;
-
-	pr_info("Scanning for low memory corruption every %d seconds\n", corruption=
_check_period);
-
-	/* First time we run the checks right away */
-	schedule_delayed_work(&bios_check_work, 0);
-
-	return 0;
-}
-device_initcall(start_periodic_check_for_corruption);
-
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 19fc8e1..8627eb7 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1108,10 +1108,6 @@ void __init setup_arch(char **cmdline_p)
 	/* preallocate 4k for mptable mpc */
 	e820__memblock_alloc_reserved_mpc_new();
=20
-#ifdef CONFIG_X86_CHECK_BIOS_CORRUPTION
-	setup_bios_corruption_check();
-#endif
-
 #ifdef CONFIG_X86_32
 	printk(KERN_DEBUG "initial memory mapped: [mem 0x00000000-%#010lx]\n",
 			(max_pfn_mapped<<PAGE_SHIFT) - 1);
