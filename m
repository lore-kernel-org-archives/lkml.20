Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A165237A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799282; cv=none; b=m40jFG+qRNhx7lFDmSdfSwrmBqXVNPYlQVQVKgNdze6hlaud+4ESvQMzu/howDaPSxfCA3h6IctlvbgzHHPwYyTtLcY+3pqmWoNNwybUWJM9yoUTeQIz2xBcSsd/ay570wzdJnEypQFr667xxEgjdIjDJx3s1IBOV79wGgcYoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799282; c=relaxed/simple;
	bh=bg2LtBOiInFvsUQT6RFJe0ZifqG9J3M2uZ08FcfT3C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E37NPb9Fx3vLsp4SUEjm3/2RdFGYPuJ6/f8mtiHHqMWV3IJ7BUZYxviQ4zyGqiZbmE6KSvMrC+/2yCtjYsfbD8D10oR70owGi1uO9O9Llxvr7cOPluTlCp1zJhbRNAdLwDGpN2FNCgGJ/iRodFhmP6nGCGAQu75AYObYx13RQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOLpsiVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOLpsiVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43751F00A3E;
	Mon,  7 Sep 2026 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799281;
	bh=wqNnNOeyF2su9n4mzn1R8Wcjz8mRX855cd6K/73nr0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nOLpsiVOdFNS8Hp2ofA2btaw/5sIOg3g4GksTnUtVwEiiUevrOrOyNqb4MrosSPhR
	 pGBPKPbqI5sF0D4sApWVmNCkHaw/RKJmwPn8qFsneOpU/c0MeYiOmKOb/fY+aXs0s7
	 hMgW5wGz/lNGhcqkWEKftOyYuINQvsT0jZYR1/ZPcfq6HSeikj3TLp0vpZErhVsS3a
	 4Hqgtu/sOmYeJ094hE8gFfLCYEouZiaxLFLlO/MGPSTEyrg5mTZRQMAgyB5dMDPX8U
	 FQGXA6VcdgrKzNCS1oD9iOmheVm2dvs3erNkIX1YZDRYl9eZLM3z4J0pni2DvHahio
	 hQLfdtd9HV8yA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 16/19] arm64: cpu_ops: Expose optional argument to target cpu in ->cpu_boot()
Date: Mon,  7 Sep 2026 17:40:19 +0100
Message-ID: <20260907164024.17164-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some backend implementations of 'struct cpu_ops', notably PSCI v0.2+,
allow an optional argument to be passed in register X0 to the target
CPU during boot.

Expose this functionality by extending the ->cpu_boot() CPU operation
to take an additional argument which is ignored unless the new optional
->cpu_boot_has_arg() callback is present and returns 'true'. For now,
we continue to pass zero.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cpu_ops.h          |  6 +++++-
 arch/arm64/kernel/acpi_parking_protocol.c |  3 ++-
 arch/arm64/kernel/psci.c                  | 11 +++++++++--
 arch/arm64/kernel/smp.c                   |  2 +-
 arch/arm64/kernel/smp_spin_table.c        |  2 +-
 5 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index cd298a8710d8..e7662a1879d9 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -21,6 +21,9 @@
  *		mechanism for doing so, tests whether it is possible to boot
  *		the given CPU.
  * @cpu_boot:	Boots a cpu into the kernel.
+ * @cpu_boot_has_arg: Optionally determines whether @cpu_boot passes its
+ *		      (non-zero) second argument to the booting CPU in
+ *		      register x0.
  * @cpu_postboot: Optionally, perform any post-boot cleanup or necessary
  *		synchronisation. Called from the cpu being booted.
  * @cpu_can_disable: Determines whether a CPU can be disabled based on
@@ -36,7 +39,8 @@ struct cpu_operations {
 	const char	*name;
 	int		(*cpu_init)(unsigned int);
 	int		(*cpu_prepare)(unsigned int);
-	int		(*cpu_boot)(unsigned int);
+	int		(*cpu_boot)(unsigned int, unsigned long);
+	bool		(*cpu_boot_has_arg)(void);
 	void		(*cpu_postboot)(void);
 #ifdef CONFIG_HOTPLUG_CPU
 	bool		(*cpu_can_disable)(unsigned int cpu);
diff --git a/arch/arm64/kernel/acpi_parking_protocol.c b/arch/arm64/kernel/acpi_parking_protocol.c
index e1be29e608b7..24ebde1241bf 100644
--- a/arch/arm64/kernel/acpi_parking_protocol.c
+++ b/arch/arm64/kernel/acpi_parking_protocol.c
@@ -56,7 +56,8 @@ static int acpi_parking_protocol_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int acpi_parking_protocol_cpu_boot(unsigned int cpu)
+static int acpi_parking_protocol_cpu_boot(unsigned int cpu,
+					  unsigned long ignored)
 {
 	struct cpu_mailbox_entry *cpu_entry = &cpu_mailbox_entries[cpu];
 	struct parking_protocol_mailbox __iomem *mailbox;
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 6b25a12ed143..3ba4fa14b9e3 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -36,16 +36,22 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int cpu_psci_cpu_boot(unsigned int cpu)
+static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
+				  context);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
 	return err;
 }
 
+static bool cpu_psci_cpu_boot_has_context(void)
+{
+	return psci_ops.get_version() >= PSCI_VERSION(0, 2);
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 static bool cpu_psci_cpu_can_disable(unsigned int cpu)
 {
@@ -114,6 +120,7 @@ const struct cpu_operations cpu_psci_ops = {
 	.cpu_init	= cpu_psci_cpu_init,
 	.cpu_prepare	= cpu_psci_cpu_prepare,
 	.cpu_boot	= cpu_psci_cpu_boot,
+	.cpu_boot_has_arg = cpu_psci_cpu_boot_has_context,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_can_disable = cpu_psci_cpu_can_disable,
 	.cpu_disable	= cpu_psci_cpu_disable,
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 2e98a92eb764..b57f8f752f78 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -103,7 +103,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
-		return ops->cpu_boot(cpu);
+		return ops->cpu_boot(cpu, 0);
 
 	return -EOPNOTSUPP;
 }
diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
index 49029eace3ad..a5e6f444c25f 100644
--- a/arch/arm64/kernel/smp_spin_table.c
+++ b/arch/arm64/kernel/smp_spin_table.c
@@ -104,7 +104,7 @@ static int smp_spin_table_cpu_prepare(unsigned int cpu)
 	return 0;
 }
 
-static int smp_spin_table_cpu_boot(unsigned int cpu)
+static int smp_spin_table_cpu_boot(unsigned int cpu, unsigned long ignored)
 {
 	/*
 	 * Update the pen release flag.
-- 
2.55.0.979.g7e5102b832-goog

