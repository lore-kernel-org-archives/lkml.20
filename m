Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63339768D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540529; cv=none; b=rmQ3mOiAR3gqDWP8Xta9lwpRB76K5huZau8/P+kVx88iKHrMjRKOE4pbdWc6rzhoi4Ku6hJnM95poN9yuIc4UI3eghrTXN9w0Y3TZh/Bd++1Oh2EsRhGLhVv617TUvW4QU710et/tAkFNMrHsODKnrALEquNUYp/OUKwWYdzdoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540529; c=relaxed/simple;
	bh=/RFzRXT1i274yWP12KOobAOHREkprwzLEI+WV66y1rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fl83anbZ5raDG+9PlypXblAdM88Nt9dHxC1cyYPfkyQXDQECRi9Z14iSwzCFZxnHIa9HU1+BxTAznk4BV/2wKEK4U2flXx7myWMSGlLXcoGlSYbic5I5Ew+p6umd3CyJy8Aa3zaQZ2QbuW5XFDBCZuQHxniXWvHMC1C2RPTopd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2BAUAlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2BAUAlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7871F00893;
	Fri,  9 Oct 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540528;
	bh=8SAwb2KHxo/EKB1KjZuIDXXR8cPoheuP4WaqUgC+rpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2BAUAlc9dhrjzb9Kj+S8uacULkrsYjJqHOJwpA26NUNrajQyu2cmnKHB6ydVjrvg
	 SMwQJenvFNe48h0xkoXYeOphMziUZoU1btAEX+qVGj5bl4gJ4ehtnmoBXJUWb3FhTD
	 B4ArRhAs/vyuchF299ODxJ8t0Ug0a+/Bp6iP4yVTTK//xSg3/7zTzFxmfdMbPuxdX8
	 1pw56K2K5jzEFiM4UhHPzJ0nTP3OqNcpF8KW13JSS3bwSM3HrinbXzSmujxHvzV7cO
	 42e22FEhTimh8eAXS6+NADN6EqqjsNT7NL7Irv87qpA4QvjMYFP40v6GSTFz7vRr3I
	 UC9271Q1+H2Wg==
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
Subject: [PATCH v2 16/23] arm64: cpu_ops: Make 'cpu_operations' pointer global instead of per-cpu
Date: Fri,  9 Oct 2026 11:07:27 +0100
Message-ID: <20261009100738.31288-17-will@kernel.org>
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

'cpu_ops' is an NR_CPUS-length array of 'cpu_operations' pointers, which
theoretically allows for different CPUs to have different bringup and
hotplug backends.

In reality, this complexity exists only to deal with the case where CPU0
is not hotpluggable, so replace the array with a single, global pointer
and record separately whether or not they apply to the boot CPU. Update
the logic in init_cpu_ops() to enforce that only a single set of
'cpu_ops' is required.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/cpu_ops.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index e133011f64b5..eacfb88a0c0c 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
 #endif
 extern const struct cpu_operations cpu_psci_ops;
 
-static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
+static const struct cpu_operations *cpu_ops __ro_after_init;
+static bool boot_cpu_has_enable_method __ro_after_init;
 
 static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
 	&smp_spin_table_ops,
@@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 {
 	const struct cpu_operations *const *ops;
 
+	if (!name)
+		return NULL;
+
 	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
 
 	while (*ops) {
@@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 		ops++;
 	}
 
+	pr_warn("Unsupported enable-method: %s\n", name);
 	return NULL;
 }
 
@@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
 	return enable_method;
 }
 /*
- * Read a cpu's enable method and record it in cpu_ops.
+ * Read a cpu's enable method and update/check cpu_ops.
  */
 int __init init_cpu_ops(int cpu)
 {
 	const char *enable_method = cpu_read_enable_method(cpu);
+	const struct cpu_operations *ops = cpu_get_ops(enable_method);
 
-	if (!enable_method)
+	if (!ops)
 		return -ENODEV;
 
-	cpu_ops[cpu] = cpu_get_ops(enable_method);
-	if (!cpu_ops[cpu]) {
-		pr_warn("Unsupported enable-method: %s\n", enable_method);
-		return -EOPNOTSUPP;
-	}
+	if (!cpu_ops)
+		cpu_ops = ops;
+	else if (cpu_ops != ops)
+		return -EBUSY;
+
+	if (cpu == 0)
+		boot_cpu_has_enable_method = true;
 
 	return 0;
 }
 
 const struct cpu_operations *get_cpu_ops(int cpu)
 {
-	return cpu_ops[cpu];
+	if (cpu || boot_cpu_has_enable_method)
+		return cpu_ops;
+
+	return NULL;
 }
-- 
2.56.0.385.gd3acb90ef8-goog

