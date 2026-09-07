Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E685221DA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799280; cv=none; b=mSDbxeyhMq2mvVqRfPCwrv6i/sIjnHkiSo0YjBdqGc9iZNoWsur8d4k6oaUputoub5VAb+PXQ9uaiA87m54W2wST37v2ITvN6buiLaGXLXkaFsSM3tJXCaLE/P+BfHAUoBAj3xfcki+L8Ee1T3MBZwOuHTEMztg1OXBfz9Gd+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799280; c=relaxed/simple;
	bh=bgPTGnCWVvoxUpLPi2BHrsmzBJzjQX+F6enuRclaGIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kykta1t7B1y6sgFXNmLCbwrgA9eSv3+BOr80bDdWyAa2zRyZ5O0/1CUwV3CTXoIqxgpx7ePjdj5yaRVTclD588T9T/nauy0VfiDwdaXXXnTWlXvmkd+WzpWmqI2YiuBbxAYUIcS+uJrtn3ioY1WjKrn8JKNXjJZ3QkLDUV1dlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FohXLra+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FohXLra+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06C01F00A3D;
	Mon,  7 Sep 2026 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799278;
	bh=lKt/YMXkeUnOCkc123JiDnkKWT5tbgOcytIjHv2aWXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FohXLra+DVZLcaftbKCZPtZXj75Il8RfpJfE/b4/L1kSMIjeDZJQfv0iCN4tN0J14
	 rW3Ztyp1IwbHYYjnzv+lY2w+6KDDrGhMIJIKPD11I3oC/pIiGOI/HC7FABjgEUZfhE
	 IoSYozs4+sknPsukoWn71BE06yGgakEWc2Vh7n/p4LKEbCl3nYysRw/8iWYOEoAwUD
	 GUigPhlmj+pInbXIs4heHnDWM1Mz8d3PqqkW4rP4FV9gFl+e1cA0pHSw2G0IBtkvpJ
	 kbuuqVvAtowqFkqb2QBFxVEQa+DyYUcBcD5v1MVCfkEfmvdRb8GLl4puqsHAHt98NE
	 TOxUTZIqyqYDw==
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
Subject: [PATCH 15/19] firmware/psci: Extend ->cpu_on() callback to take an additional argument
Date: Mon,  7 Sep 2026 17:40:18 +0100
Message-ID: <20260907164024.17164-16-will@kernel.org>
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

In preparation for hooking up the 'context ID' parameter introduced by
PSCI v0.2 to the CPU_ON call, extend the ->cpu_on() callback to take
an additional argument and modify all callers to pass 0 for now.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm/kernel/psci_smp.c   |  4 ++--
 arch/arm64/kernel/psci.c     |  2 +-
 drivers/firmware/psci/psci.c | 20 ++++++++++++++------
 include/linux/psci.h         |  3 ++-
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/psci_smp.c b/arch/arm/kernel/psci_smp.c
index 3bb0c4dcfc5c..bf05dbf433b1 100644
--- a/arch/arm/kernel/psci_smp.c
+++ b/arch/arm/kernel/psci_smp.c
@@ -49,10 +49,10 @@ static int psci_boot_secondary(unsigned int cpu, struct task_struct *idle)
 		return psci_ops.cpu_on(cpu_logical_map(cpu),
 			((phys_addr_t)(&secondary_startup)
 			- XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR)
-			+ CONFIG_XIP_PHYS_ADDR));
+			+ CONFIG_XIP_PHYS_ADDR), 0);
 #else
 		return psci_ops.cpu_on(cpu_logical_map(cpu),
-					virt_to_idmap(&secondary_startup));
+					virt_to_idmap(&secondary_startup), 0);
 #endif
 	return -ENODEV;
 }
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index fabd732d0a2d..6b25a12ed143 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -39,7 +39,7 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
 static int cpu_psci_cpu_boot(unsigned int cpu)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
-	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
+	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
 	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 8bb3f7c37678..95034485cb4d 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -219,22 +219,30 @@ static int psci_0_2_cpu_off(u32 state)
 	return __psci_cpu_off(PSCI_0_2_FN_CPU_OFF, state);
 }
 
-static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
+static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point,
+			 unsigned long context)
 {
 	int err;
 
-	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
+	err = invoke_psci_fn(fn, cpuid, entry_point, context);
 	return psci_to_linux_errno(err);
 }
 
-static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point)
+static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point,
+			   unsigned long mbz)
 {
-	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point);
+	if (mbz)
+		return -EINVAL;
+
+	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point,
+			     0);
 }
 
-static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point)
+static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point,
+			   unsigned long context)
 {
-	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point);
+	return __psci_cpu_on(PSCI_FN_NATIVE(0_2, CPU_ON), cpuid, entry_point,
+			     context);
 }
 
 static int __psci_migrate(u32 fn, unsigned long cpuid)
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc4..0f43868a0bee 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -25,7 +25,8 @@ struct psci_operations {
 	u32 (*get_version)(void);
 	int (*cpu_suspend)(u32 state, unsigned long entry_point);
 	int (*cpu_off)(u32 state);
-	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point);
+	int (*cpu_on)(unsigned long cpuid, unsigned long entry_point,
+		      unsigned long context);
 	int (*migrate)(unsigned long cpuid);
 	int (*affinity_info)(unsigned long target_affinity,
 			unsigned long lowest_affinity_level);
-- 
2.55.0.979.g7e5102b832-goog

