Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91042379C56
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810667; cv=none; b=tg5vNeMGmA4LHpNxbp6+B6DbqasXZ4Jzn04QK4z+hNlAOWFwumicCtblugJSv6tqJRM4s2hjjczrlvSNayxdERIT7bGJ09R6uVH3AehZQaEi/owd9pEAkwXhUSlgprzWjzeX3ESM1L8zYmnJTneV5he9jZZuWuuM5osP//1ZPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810667; c=relaxed/simple;
	bh=cJbtgQwqykg1LXPsytnNr397R9faH08EN1BeuubIxCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CisMYhH1L4e09f4qbDkvBmiO3+7NfFpDoh8sN5e2b3OIogNZNKT+HsjZDX4Or6wH35M0cjj8mGscapkobPSzTCk0U8Gqpc1QpEUQSclDPAUlqQHP7fbhZ+vIlgP5+qCKbLkU0xqveRxZ3DaNxAXwilmKF3J9LWEGAMn9vWX0PVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=iNbxD+KA; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iNbxD+KA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791810660; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6RfKdx5FdAu3miw0erxA7X0WAeA1bc5udK2v4s0HIwo=;
	b=iNbxD+KAN68ckN3DP35oerndAdxkPkwTWVdFjCcpBlVzvQr+5eqTqvsMll1f3qTE5EMc10gq9yrlXSDUcrSTTS+wahQ/DcnZlgd61dJEFEyvEHRc8fqQE4C1qRi7Z5G/uEylKWqlB4U+RijlzLEc7rTqMZZgnkR9p097HaPb00Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XCgVPlj_1791810634;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCgVPlj_1791810634 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 21:10:59 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: sudeep.holla@kernel.org,
	conor.dooley@microchip.com,
	atishp@rivosinc.com,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Populate boot CPU topology on UP kernels
Date: Mon, 12 Oct 2026 21:10:33 +0800
Message-ID: <20261012131034.1026-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
zero-initialized and its sibling masks are empty.

The sysfs topology interface is available on UP kernels too. As a
result, cpu0 exports empty thread_siblings_list and core_siblings_list
attributes rather than masks containing itself, violating the expected
topology semantics of this stable ABI.

Initialize and store the boot CPU topology in a UP-only early initcall.
This runs after DT and ACPI CPU discovery and after the memory allocator
is available, before the topology is exposed through sysfs.

SMP kernels continue to initialize topology in smp_prepare_cpus(). NUMA
needs no additional handling because it depends on SMP.

Fixes: fbd92809997a ("riscv: topology: fix default topology reporting")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Tested on QEMU virt (RV64):
- UP, default DT: cpu0 thread_siblings_list, core_cpus_list,
  core_siblings_list and package_cpus_list all contain CPU0.
- UP, DT with 32 KiB L1 instruction/data caches: the same topology
  checks pass, and both caches appear in sysfs with shared_cpu_list=0.
- SMP, 8 CPUs: each CPU's thread_siblings_list and core_cpus_list
  contain itself; core_siblings_list and package_cpus_list are 0-7.

 arch/riscv/kernel/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..234d9af414b7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arch_topology.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/mm.h>
@@ -370,6 +371,17 @@ void __init setup_arch(char **cmdline_p)
 	riscv_clear_hypervisor_csr();
 }
 
+#ifndef CONFIG_SMP
+static int __init riscv_init_cpu_topology(void)
+{
+	init_cpu_topology();
+	store_cpu_topology(0);
+
+	return 0;
+}
+early_initcall(riscv_init_cpu_topology);
+#endif
+
 bool arch_cpu_is_hotpluggable(int cpu)
 {
 	return cpu_has_hotplug(cpu);

-- 
2.50.1

