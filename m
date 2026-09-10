Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6A306B3D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010808; cv=none; b=sqlxXFyr+YPZyIblcX5u+PPK3lZMtLvnioxQ2waTX2EmzY+lQ/F6QupcDA3meBp83w9z4FWnfe4bK9RZXyJ4U8AzO7CA9zmcjw2EXUWTf8j6nZKXDlmh/dCMOQRGXBhnx3mKlysSD2bTBtlJ9d3o6quPZQLlVeCkXvKknC5z7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010808; c=relaxed/simple;
	bh=cXBTgmojZTfcsDooqkYht7IVhXeM1FF/Iq80iJfE03k=;
	h=Subject:Cc:Date:To:Message-Id:Mime-Version:From:Content-Type; b=BuBfi1ioLBQuADqpfW8ZfKdux3izJneRH99odxI357CknXr/mvlmNRZtl3J90M4NHM0ulVYuefxDO5j/6kWhXT+qYjtRC/0OhDzsYWx+MqogrMpt9Wbyqvc8sNO007ehCI26M+vSMRa6AyGEwBCLAODMiqvhFFKx+gqeqkl3d4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MeTGtajl; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MeTGtajl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789010795; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HaweDL7Mt0Kz8Nqxsbbq/5mN6UCAfT1ipg31lZ821wg=;
 b=MeTGtajlxnWK7pS+yraybhbO5UO3z1aEKzSYwBRt3FXJEZWp+3WqrjxqRpl+9YaXM1TvHe
 3NjNbduTsP7CWlKTExV/RTzCjrRRLu50KYBsSAjAvjqF6HJ9hixA1nP9vVWZfzFPwKp/n5
 SLOC0IxHcW6ukbp2ucuP62/97EA7N1r43qTqfiKRdjr3DAPc1YzQ50QGo8xXtIgYfrWYWY
 qT/B9HrrLUi+5AxpBhMOafy+CyZKO836VlSJ2CrftkIbzhNS8W93utdlKy1SHnl5RmX+t9
 V1lNAoTkhl9jy5RDz294IBaxz6d2MJ147rI/VP38p+O6gSpn/lVqlSz4Codxjw==
Subject: [PATCH v2] riscv: crash: Add crash hotplug support
Cc: <qirui.001@bytedance.com>, <debug@rivosinc.com>, <martin@kaiser.cx>, 
	<mindal@semihalf.com>, <fustini@kernel.org>, <kees@kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 10 Sep 2026 11:26:19 +0800
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26aa2236a+4f2ed9+vger.kernel.org+qirui.001@bytedance.com>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>
Message-Id: <20260910032619.2477279-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

When CPUs or memory are hot-plugged on a running system, the crash
dump's elfcorehdr -- which describes the available CPUs and memory to
the capture kernel -- must be kept in sync, otherwise a crash after a
hotplug event would produce a vmcore that does not reflect the current
system topology.

Enable crash hotplug for RISC-V by selecting
ARCH_SUPPORTS_CRASH_HOTPLUG and providing the three architecture hooks
invoked through the override macros in <asm/kexec.h>:

  arch_crash_hotplug_support() reports whether an image supports the
  mechanism; arch_crash_get_elfcorehdr_size() sizes the segment for
  NR_CPUS and, with memory hotplug, CRASH_MAX_MEMORY_RANGES;
  arch_crash_handle_hotplug_event() rebuilds the elfcorehdr through the
  crash_prepare_headers() helper and writes it over the old segment.

The elfcorehdr is copied with memcpy_flushcache(), matching the x86
implementation; on RISC-V this currently expands to a plain memcpy()
and will benefit automatically once the architecture provides a
flushcache backend. The implementation otherwise follows the x86 crash
hotplug model.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
Tested-by: Rui Qi <qirui.001@bytedance.com>

---
Changes in v2:
- Add a forward declaration of struct kimage before the crash hotplug
  prototypes in <asm/kexec.h> to fix a build breakage.

Testing performed:

Verified that kdump was loaded before each panic, then triggered a
sysrq panic under each of the following hotplug states:

  - CPU1 offline only
  - one memory block offline only
  - two CPUs offline
  - two memory blocks offline
  - CPU and memory offline, held for 60 s before panic

Each case produced a valid vmcore that could be opened with the crash
tool. At panic time the observed state matched expectations: offline
CPUs were reflected in __cpu_online_mask, and offline memory blocks
appeared as MEM_OFFLINE. kdump worked correctly across all tested CPU
and memory hotplug offline scenarios.
---
 arch/riscv/Kconfig             |   3 +
 arch/riscv/include/asm/kexec.h |  13 ++++
 arch/riscv/kernel/Makefile     |   1 +
 arch/riscv/kernel/crash.c      | 113 +++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 arch/riscv/kernel/crash.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ab7ca8f57420..123a6862dc10 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1133,6 +1133,9 @@ config ARCH_DEFAULT_CRASH_DUMP
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 	def_bool CRASH_RESERVE
 
+config ARCH_SUPPORTS_CRASH_HOTPLUG
+	def_bool y
+
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
 	default 64BIT
diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index b9ee8346cc8c..e218835eb10c 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -75,4 +75,17 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			unsigned long cmdline_len);
 #endif
 
+#ifdef CONFIG_CRASH_HOTPLUG
+struct kimage;
+
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
+#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
+
+int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
+#define arch_crash_hotplug_support arch_crash_hotplug_support
+
+unsigned int arch_crash_get_elfcorehdr_size(void);
+#define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
+#endif
+
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ebe1c3588177..d0a5d442110f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o kexec_image.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
+obj-$(CONFIG_CRASH_HOTPLUG)	+= crash.o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
new file mode 100644
index 000000000000..fe5a4b306aae
--- /dev/null
+++ b/arch/riscv/kernel/crash.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V crash hotplug support
+ *
+ * Copyright (C) 2025 Bytedance Ltd.
+ */
+
+#include <linux/kexec.h>
+#include <linux/crash_core.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+
+#ifdef CONFIG_CRASH_HOTPLUG
+
+#undef pr_fmt
+#define pr_fmt(fmt) "crash hp: " fmt
+
+int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
+{
+#ifdef CONFIG_KEXEC_FILE
+	if (image->file_mode)
+		return 1;
+#endif
+	/*
+	 * For the kexec_load() syscall path, the user space kexec tool
+	 * needs to indicate that the elfcorehdr segment is excluded from
+	 * SHA verification by setting the appropriate flags.
+	 */
+	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
+		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
+}
+
+unsigned int arch_crash_get_elfcorehdr_size(void)
+{
+	unsigned int sz;
+
+	/* kernel_map, VMCOREINFO and maximum CPUs */
+	sz = 2 + CONFIG_NR_CPUS;
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		sz += CONFIG_CRASH_MAX_MEMORY_RANGES;
+	sz *= sizeof(Elf64_Phdr);
+	return sz;
+}
+
+/**
+ * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
+ * @image: a pointer to kexec_crash_image
+ * @arg: struct memory_notify handler for memory hotplug case and
+ *       NULL for CPU hotplug case.
+ *
+ * Prepare the new elfcorehdr and replace the existing elfcorehdr.
+ */
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
+{
+	void *elfbuf = NULL, *old_elfcorehdr;
+	unsigned long mem, memsz;
+	unsigned long elfsz = 0;
+
+	/*
+	 * As crash_prepare_elf64_headers() has already described all
+	 * possible CPUs, there is no need to update the elfcorehdr
+	 * for additional CPU changes.
+	 */
+	if ((image->file_mode || image->elfcorehdr_updated) &&
+		((image->hp_action == KEXEC_CRASH_HP_ADD_CPU) ||
+		(image->hp_action == KEXEC_CRASH_HP_REMOVE_CPU)))
+		return;
+
+	/*
+	 * Create the new elfcorehdr reflecting the changes to CPU and/or
+	 * memory resources.
+	 */
+	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+		pr_err("unable to create new elfcorehdr");
+		goto out;
+	}
+
+	/*
+	 * Obtain address and size of the elfcorehdr segment, and
+	 * check it against the new elfcorehdr buffer.
+	 */
+	mem = image->segment[image->elfcorehdr_index].mem;
+	memsz = image->segment[image->elfcorehdr_index].memsz;
+	if (elfsz > memsz) {
+		pr_err("update elfcorehdr elfsz %lu > memsz %lu",
+			elfsz, memsz);
+		goto out;
+	}
+
+	/*
+	 * Copy new elfcorehdr over the old elfcorehdr at destination.
+	 */
+	old_elfcorehdr = kmap_local_page(pfn_to_page(mem >> PAGE_SHIFT));
+	if (!old_elfcorehdr) {
+		pr_err("mapping elfcorehdr segment failed\n");
+		goto out;
+	}
+
+	/*
+	 * Temporarily invalidate the crash image while the
+	 * elfcorehdr is updated.
+	 */
+	xchg(&kexec_crash_image, NULL);
+	memcpy_flushcache(old_elfcorehdr, elfbuf, elfsz);
+	xchg(&kexec_crash_image, image);
+	kunmap_local(old_elfcorehdr);
+	pr_debug("updated elfcorehdr\n");
+
+out:
+	vfree(elfbuf);
+}
+
+#endif /* CONFIG_CRASH_HOTPLUG */
-- 
2.20.1
