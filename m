Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924B5221D6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799272; cv=none; b=tz5YYiAsPJOp9hrOCHZnLfrigaRPmk27larLezPqFYhRPPQoK8hImO+5/hGgV79RB9dR5wOh/868a0mLCklxjlvsapbBRwh64Dys4v3a2SHj+d8T8NKookU7u8pPv5p/2/VHUR1hH6/QYlo3IJ1lBbSLnJsDYkJq3GMhhhSbRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799272; c=relaxed/simple;
	bh=N9lnQLkeplkCv1wPilKKijOZP/z6UyXjFuVLPGZlpPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vn7ANKfNXcxcUg/ZTbfSPBiR+QR9uxR9FZUCZLH8koEkhLo1ll+AQZbZf1cSQlM3T92ZFRRvmfhg6hoaX78qXDcQoa84B/jg/L5n8FgqoIJGunxhpO2I7nzz29ZyBz38gF7AKDvY2WLgyfzo+m1BGPdv8a/ccrbqU/AUtRxjIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOkITSgh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOkITSgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F081F00ADB;
	Mon,  7 Sep 2026 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799269;
	bh=vOcosIoOZUylABIr2H2Dhy/0SsM1lRvXoK46nuhzuCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iOkITSghGleQZW/uuzPixqRARqkNrb+Gcku9ztKJFGvgPMGdTwTM3VGf67kBXUwvB
	 VHLuMowJNNEC4rw38yEj4iZ0j9yjq7WKSIdAWHl+qUDp1Xo6tl9gKsbSQRSftocDjJ
	 P8QDk2bNG5gWsnRdjAEx9t1NAloDA/AkmHktxDRK1xj7izXzRJciUpKFEt6nU3TBd7
	 /Q+5ToQHPwvWPLWx6AVZqg2A0J8sPyuworDM0u6tPs0vnlpkwZwPCho7v6sssFfdwT
	 hIJKMyyALF308ik//Ps1QVHGBwStx2Aci6hBKk/JuvE6Cnd7wNGk1SQH5+IqneMK7i
	 HyKZuJpY3Vl8Q==
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
Subject: [PATCH 12/19] arm64: cpu_ops: Make 'cpu_operations' pointer global instead of per-cpu
Date: Mon,  7 Sep 2026 17:40:15 +0100
Message-ID: <20260907164024.17164-13-will@kernel.org>
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

'cpu_ops' is an NR_CPUS-length array of 'cpu_operations' pointers, which
theoretically allows for different CPUs to have different bringup and
hotplug backends.

In reality, this complexity exists only to deal with the case where CPU0
is not hotpluggable, so replace the array with a single, global pointer
and record separately whether or not they apply to the boot CPU. Update
the logic in init_cpu_ops() to enforce that only a single set of
'cpu_ops' is required.

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
2.55.0.979.g7e5102b832-goog

