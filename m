Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE623ACEEC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540540; cv=none; b=q1wQK3y2aw20PEH1IwS+IqVTS6LFXRKMmzHpTIGHqwG7VQxp3oXYDdk6x1k5r4CV8nxw2TuogU7JlpsZyv/rC6NLm5dfF/L38cZVpAevzor3bMqkMKvr2wOGXnmCh0O/5COg9rxjc9bEz8Oi7qU9FComBDUgLFGpA1gRgr+Uc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540540; c=relaxed/simple;
	bh=P0dauNE66uO3XZlwdvpBPJb+pYmXjCJ4eperm1+5W0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fR2DONSVFDWE8pEmnYFmFBVt5ud5IPGw5MYYafSOeblgiJuXgo9Pl0I4orMGWCWUB6Wop+g0ZvnPR51dLHBF2JDb5eLLvztq/UGERTznHr5GxuWYXincnoUk3Dfx15CARU+GMc//4HzlvMPvL3rvkMgc3wTKVc4ZOgTOiUUhT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkTEbCDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkTEbCDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442971F000FF;
	Fri,  9 Oct 2026 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540539;
	bh=ejWlqAZiflFRPHyVuEca3IrvbIYIVFJO3Zo4KOgmGFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lkTEbCDEkBPd7DIkTzOcxFUamN6RLoxwhq3irgquiJVBvNq/MUpBjSyrs00+c5Whn
	 ssskytPWZYCnSxZEFc3SCq5WDv7lVqh/YdJm7WP97jzGxI7WWue9GN9i/x+eD9h+aJ
	 /l26/HW3WSq4/EMuKFQ27RSMf9yBFCT9AvlssPhrBndu6LWLEB7vtyiEmyL3DpWlsf
	 W4f5dwEgyWIGDhv+iSw9TmlfslOM+VltATUiaWhZ36sIdfg/dYIhNagoQEEZQfz42P
	 c6HQ2WHeNpltVkvSIo18WoWlMrRSbdFrsoeNIEV9ZqPo2GCG2ZAMoNrHaAN0Cni2iY
	 r7WVRJuIzCSvg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 19/23] firmware/psci: Extend ->cpu_on() callback to take an additional argument
Date: Fri,  9 Oct 2026 11:07:30 +0100
Message-ID: <20261009100738.31288-20-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
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
2.56.0.385.gd3acb90ef8-goog

