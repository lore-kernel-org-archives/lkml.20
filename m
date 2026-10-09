Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977234CFB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540518; cv=none; b=nM9/ldWqxWIuV9JksQPZa9wzXYU/Ik/ihFTd/iFEVVy4/aKiVbE8RNKdP/6bpbcPvCqRqCLw5lOQXEPq8a4gbnC6+ia0YEbGdJqSWh1YYZ2/eKY154jJJBIcL1h3lIYyzKP3C3+lY19vF5IgknasToZdz64OBEmw/fgXq5Oj6sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540518; c=relaxed/simple;
	bh=0TxPYBTMHvjXY/9b2Kv3ZleSYXdXjzWOsNd4oxkedzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MO6NeoUnSm83zgbANhNxHrIl25POs9MS9UElQsMs7NEo6Qc5RxcBnl71SOwblEe1Yl6MkCGdcbKLg9s6KQyLcG/hhv9jAfjdqFcMW9HdoabG4AbnLI88dcvPzxlVEP+M1fQO8sluxUi81vz4y4vNZ7P+oEYwt7MfDb3XY/+56XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omKRlAYW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omKRlAYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865291F00893;
	Fri,  9 Oct 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540516;
	bh=9fh/ibUG4ROn92eBl4vXntF4MbFtHYKZc485nR/O2as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omKRlAYWMaL3WnjSO+85WikBdzEJWYVeCvfv0TMkkxoMYV7+NVDy2vN+7j0/FiT6T
	 NJPWQ3PI52bZNfBAlyZPLUlQ/xHT+vfmv+wqzlepuFOVLN2vK+CsqxV640HVX9PeAx
	 sSufkGIAMqtoAkkIUWJbGm4CH2SMcYraTUz2afXKbAE3FoiXOBLZXKPU6zVlUq2EmQ
	 vXwjn0w5mX1kj8XpM8yJ2gaYipRKwzR1Adf6r1aljDWHVvz+qsZ70dZLVDHvWI8Cwt
	 bUCcuIgh/ajNNDhWg7aYthp8eeeXz3KKhpEBAaN6CfTKz+F32z3a6VdzpjBkQcT7U+
	 TBhhWdF1lcyPQ==
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
Subject: [PATCH v2 13/23] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Fri,  9 Oct 2026 11:07:24 +0100
Message-ID: <20261009100738.31288-14-will@kernel.org>
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

Calling rcutree_report_cpu_starting() early during boot can lead to
livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
on an RCU grace period while the CPU being onlined is spinning in
cpuhp_ap_sync_alive().

In preparation for enabling the generic CPU hotplug code on arm64, split
up the trace_hardirqs_off() call during secondary CPU bringup so that we
update lockdep early but defer the tracing updates until after the new
CPU has been registered with RCU, which itself is deferred until after
the early CPU compatability checks, allowing us to drop the explicit
call to rcutree_report_cpu_dead() entirely.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 6 +++---
 include/linux/rcutree.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index e1b15cab9ed6..014b163ce658 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
-	trace_hardirqs_off();
+	lockdep_hardirqs_off(CALLER_ADDR0);
 
 	/*
 	 * If the system has established the capabilities, make sure
@@ -235,6 +234,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Log the CPU info before it is marked online and might get read.
 	 */
 	cpuinfo_store_cpu();
+	rcutree_report_cpu_starting(cpu);
 	update_cpu_features(cpu);
 	store_cpu_topology(cpu);
 
@@ -242,6 +242,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Enable GIC and timers.
 	 */
 	notify_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ipi_setup(cpu);
 
@@ -411,7 +412,6 @@ void __noreturn cpu_die_early(void)
 
 	/* Mark this CPU absent */
 	set_cpu_present(cpu, 0);
-	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
index 16a04202888b..e6ad4f2a475c 100644
--- a/include/linux/rcutree.h
+++ b/include/linux/rcutree.h
@@ -116,7 +116,7 @@ int rcutree_offline_cpu(unsigned int cpu);
 
 void rcutree_migrate_callbacks(int cpu);
 
-/* Called from hotplug and also arm64 early secondary boot failure */
+/* Called from hotplug */
 void rcutree_report_cpu_dead(void);
 
 #endif /* __LINUX_RCUTREE_H */
-- 
2.56.0.385.gd3acb90ef8-goog

