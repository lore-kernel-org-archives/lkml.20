Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451342;
	b=YUiVjoiRzHoa+npYRlkJ/WBx9iRUZvZD5+MlI7mlctnc2QnwgegJc3K0EzbqDHJqONvb
	 MO2PUsgvyjAXXBO+FqN7lNnSJ2CaThkUY64F2mIpqMGHAExlbL8nTEIzbMUaxFZqbA6xS
	 boFM37qsEIZwy/nAOujK9P8pjem+y7YZgBisTffZMAO+tC2GcJ7b6/iO6swB9nAo8hn69
	 yV4/00hPUb/SPTEOTHLsid/rMlsSbdviXI+k+QdLmR+XiVY0ZQTscAnspOrLG775tGmAW
	 tInuN7oFc1KZCIsPO77VFgGbWKRYTIU/W7ffJfJjy1PR29zraRg0YwuY/7ag5zr80gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451342;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BmMZehpDKSpEn7nRN/rF7DeEJUhsnBSKzNR43ZzewZI=;
	b=T49qG7KVcqHmg8bspa6BbPSExj9JBCOOnkqlOJS1wxhtz2NwEfcjIKXfttRRAUmqGgAG
	 eFmpcovrNQ950m3R6m6/88ljto7WG1JVv0tetxe/+E3Km17RLgZOUy16+scK8dxM7wKnQ
	 aCQMkXkKcBIzvJYgTUhOjoIBQPUVjxYvr9lNMVAwme3hjXTCRH2guEw/9mkkzdkLYbep4
	 pCLVy0aBFoQ2UjSRORt7yiBuGpyzyIHcFfRKi7lxgBV/5qIteNcjqVEuu2WgUtH5FqXzA
	 Dwafsuv9kOmelHbN51t3lDyJc03fj9h66f549+iYhG6hb/eQyG7Zv5jXVf2kowgXidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xt3z8Ap7;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4439C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xt3z8Ap7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hUR76X8sOGsT1gQiqGf/UMfNUHj/r2aGOXHtYORE5aU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794451339; v=1; x=1795056139;
 b=xt3z8Ap785+aZPG1wBch9mMr+RRwQbj/xK9txSB+hIQKJ/Fx5E1D3f8XKoH56118ZhNWliD2
 qT0i5xAvBTPcBMlJWR1raxN0hltgEfoSbwEEGmkOX4lGuYqpkqtf0cAAAg5LLZHHromiwNkQV5p
 HYaQ8ItzPlkeMvAfhK3RYlfc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a6a23ddec0f4e7eb;
	Thu, 12 Nov 2026 02:42:19 +0000
X-Mizu-Trace-ID: a6a23ddec0f4e7eb
X-Migadu-Flow: FLOW_OUT
From: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>
To: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	rppt@kernel.org,
	blum@kernel.org,
	david@kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4] x86/corruption-check: Remove the BIOS memory corruption check feature
Date: Wed, 11 Nov 2026 21:42:10 -0500
Message-ID: <20261112024210.3984587-1-luiz.capitulino@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Note that one case still "works", which is passing
memory_corruption_check_size= to scan a larger region. But this is not
useful either: the parameter takes a size, not an address range, so what
gets scanned is whatever memblock happens to have free below that size.

Remove the feature.

Acked-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>
---

Notes:
  - I'm now sending from luiz.capitulino@linux.dev
  - Kept hpa's ack as the diff is unchanged

v4
  - Improved changelog to state clearly that the feature should be removed
    rather than fixed (Borislav)

v3
  - Updated changelog to emphasize that the default configuration is broken
    (Thorsten)
  - Improved subject prefix
  - Resending on top of latest Linus tree

v2
  - Rebased against latest Linus tree (v7.2-rc4)
  - Improved changelog

 .../admin-guide/kernel-parameters.txt         |  23 ---
 arch/x86/Kconfig                              |  30 ---
 arch/x86/configs/i386_defconfig               |   1 -
 arch/x86/configs/x86_64_defconfig             |   1 -
 arch/x86/include/asm/bios_ebda.h              |  17 --
 arch/x86/include/asm/setup.h                  |   1 -
 arch/x86/kernel/Makefile                      |   2 -
 arch/x86/kernel/check.c                       | 187 ------------------
 arch/x86/kernel/setup.c                       |   4 -
 9 files changed, 266 deletions(-)
 delete mode 100644 arch/x86/kernel/check.c

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..05086660b07f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3998,29 +3998,6 @@ Kernel parameters
 			specified as e820 types, e.g., 1 = RAM, 2 = reserved,
 			3 = ACPI, 12 = PRAM.
 
-	memory_corruption_check=0/1 [X86,EARLY]
-			Some BIOSes seem to corrupt the first 64k of
-			memory when doing things like suspend/resume.
-			Setting this option will scan the memory
-			looking for corruption.  Enabling this will
-			both detect corruption and prevent the kernel
-			from using the memory being corrupted.
-			However, it's intended as a diagnostic tool; if
-			repeatable BIOS-originated corruption always
-			affects the same memory, you can use memmap=
-			to prevent the kernel from using that memory.
-
-	memory_corruption_check_size=size [X86,EARLY]
-			By default it checks for corruption in the low
-			64k, making this memory unavailable for normal
-			use.  Use this parameter to scan for
-			corruption in more or less memory.
-
-	memory_corruption_check_period=seconds [X86,EARLY]
-			By default it checks for corruption every 60
-			seconds.  Use this parameter to check at some
-			other rate.  0 disables periodic checking.
-
 	memory_hotplug.memmap_on_memory
 			[KNL,X86,ARM] Boolean flag to enable this feature.
 			Format: {on | off (default)}
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..7ba002d1a201 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1602,36 +1602,6 @@ config X86_PMEM_LEGACY
 
 	  Say Y if unsure.
 
-config X86_CHECK_BIOS_CORRUPTION
-	bool "Check for low memory corruption"
-	help
-	  Periodically check for memory corruption in low memory, which
-	  is suspected to be caused by BIOS.  Even when enabled in the
-	  configuration, it is disabled at runtime.  Enable it by
-	  setting "memory_corruption_check=1" on the kernel command
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
-	  you can use memmap= to prevent the kernel from using that
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
index 79fa38ca954d..848c2d924668 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -36,7 +36,6 @@ CONFIG_PARAVIRT=y
 CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
-CONFIG_X86_CHECK_BIOS_CORRUPTION=y
 # CONFIG_MTRR_SANITIZER is not set
 CONFIG_EFI=y
 CONFIG_EFI_STUB=y
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index e6896aeb77d8..7c76abee3f36 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -35,7 +35,6 @@ CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
 CONFIG_NUMA=y
-CONFIG_X86_CHECK_BIOS_CORRUPTION=y
 # CONFIG_MTRR_SANITIZER is not set
 CONFIG_EFI=y
 CONFIG_EFI_STUB=y
diff --git a/arch/x86/include/asm/bios_ebda.h b/arch/x86/include/asm/bios_ebda.h
index 4d5a17e2febe..2f441fd9ebf8 100644
--- a/arch/x86/include/asm/bios_ebda.h
+++ b/arch/x86/include/asm/bios_ebda.h
@@ -20,21 +20,4 @@ static inline unsigned int get_bios_ebda(void)
 
 void reserve_bios_regions(void);
 
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
index 895d09faaf83..cd042752e6ce 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -42,7 +42,6 @@ static inline void vsmp_init(void) { }
 
 struct pt_regs;
 
-void setup_bios_corruption_check(void);
 void early_platform_quirks(void);
 
 extern unsigned long saved_video_mode;
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 31f46fd00527..702536938433 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -149,8 +149,6 @@ obj-$(CONFIG_JAILHOUSE_GUEST)	+= jailhouse.o
 obj-$(CONFIG_EISA)		+= eisa.o
 obj-$(CONFIG_PCSPKR_PLATFORM)	+= pcspeaker.o
 
-obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
-
 obj-$(CONFIG_OF)			+= devicetree.o
 obj-$(CONFIG_UPROBES)			+= uprobes.o
 
diff --git a/arch/x86/kernel/check.c b/arch/x86/kernel/check.c
deleted file mode 100644
index 5136e6818da8..000000000000
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
-static int __read_mostly memory_corruption_check = -1;
-
-static unsigned __read_mostly corruption_check_size = 64*1024;
-static unsigned __read_mostly corruption_check_period = 60; /* seconds */
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
-	ret = kstrtoul(arg, 10, &val);
-	if (ret)
-		return ret;
-
-	memory_corruption_check = val;
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
-	ret = kstrtoul(arg, 10, &val);
-	if (ret)
-		return ret;
-
-	corruption_check_period = val;
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
-	size = memparse(arg, &end);
-
-	if (*end == '\0')
-		corruption_check_size = size;
-
-	return (size == corruption_check_size) ? 0 : -EINVAL;
-}
-early_param("memory_corruption_check_size", set_corruption_check_size);
-
-
-void __init setup_bios_corruption_check(void)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	if (memory_corruption_check == -1) {
-		memory_corruption_check =
-#ifdef CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
-			1
-#else
-			0
-#endif
-			;
-	}
-
-	if (corruption_check_size == 0)
-		memory_corruption_check = 0;
-
-	if (!memory_corruption_check)
-		return;
-
-	corruption_check_size = round_up(corruption_check_size, PAGE_SIZE);
-
-	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE, &start, &end,
-				NULL) {
-		start = clamp_t(phys_addr_t, round_up(start, PAGE_SIZE),
-				PAGE_SIZE, corruption_check_size);
-		end = clamp_t(phys_addr_t, round_down(end, PAGE_SIZE),
-			      PAGE_SIZE, corruption_check_size);
-		if (start >= end)
-			continue;
-
-		memblock_reserve(start, end - start);
-		scan_areas[num_scan_areas].addr = start;
-		scan_areas[num_scan_areas].size = end - start;
-
-		/* Assume we've already mapped this early memory */
-		memset(__va(start), 0, end - start);
-
-		if (++num_scan_areas >= MAX_SCAN_AREAS)
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
-	int corruption = 0;
-
-	if (!memory_corruption_check)
-		return;
-
-	for (i = 0; i < num_scan_areas; i++) {
-		unsigned long *addr = __va(scan_areas[i].addr);
-		unsigned long size = scan_areas[i].size;
-
-		for (; size; addr++, size -= sizeof(unsigned long)) {
-			if (!*addr)
-				continue;
-			pr_err("Corrupted low memory at %p (%lx phys) = %08lx\n", addr, __pa(addr), *addr);
-			corruption = 1;
-			*addr = 0;
-		}
-	}
-
-	WARN_ONCE(corruption, KERN_ERR "Memory corruption detected in low memory\n");
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
-	if (!num_scan_areas || !memory_corruption_check || corruption_check_period == 0)
-		return 0;
-
-	pr_info("Scanning for low memory corruption every %d seconds\n", corruption_check_period);
-
-	/* First time we run the checks right away */
-	schedule_delayed_work(&bios_check_work, 0);
-
-	return 0;
-}
-device_initcall(start_periodic_check_for_corruption);
-
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 19fc8e1714e6..8627eb7aa769 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1108,10 +1108,6 @@ void __init setup_arch(char **cmdline_p)
 	/* preallocate 4k for mptable mpc */
 	e820__memblock_alloc_reserved_mpc_new();
 
-#ifdef CONFIG_X86_CHECK_BIOS_CORRUPTION
-	setup_bios_corruption_check();
-#endif
-
 #ifdef CONFIG_X86_32
 	printk(KERN_DEBUG "initial memory mapped: [mem 0x00000000-%#010lx]\n",
 			(max_pfn_mapped<<PAGE_SHIFT) - 1);
-- 
2.56.0

