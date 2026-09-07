Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8E3537E5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799251; cv=none; b=RJgP8PKpEFPvMwf01SUcdzIVQF0c4LeUxBXLIl70bviwzsQKrb3M7UM/QRlkuStvGcR1dUouUGKZ12jnSWHMhPiTvVtWoSO1wKL4AZPdX6+0jY4rV5lp9iSYf/Yuc9ylFLw6tVPdiZRYLfCzxPtWDrTKDE9MMzojyTf2UVeGNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799251; c=relaxed/simple;
	bh=ipUAJJcrukKW2d4Wbw2f+Yj6q9MH9fMPDKvTGoFmEs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dz4eqmxc94OHBFLrOVj5+KFof8+Mv7MHkS/hOXjktP7BcpagnERy57P/Gj/295rOnsodrM0n5P/oMjLRU1VXbM455vUhm272zqSKRb3aeycrC2v2qDXwxPqxZQjKmYUEi6UGMPuCgy+oN8Pd8taGP/Gsi6j9fY9MXMkvpZCXAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmKzXbtp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmKzXbtp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346321F00A3D;
	Mon,  7 Sep 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799249;
	bh=0a/iC5zjIZl1+yxWZkKQgEAnwYE6tHACp2aQjXaciqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jmKzXbtp/XFzVXuQ0ObYir5nG2l4DtxVWqG4ztdZKe/OuMmrnbn+pMu0hbGlXCir2
	 aJKxp3dmesHH8d+bW1Lew1SSOTBNWUMiBzUV7YgbWb4XaheDHyNvMGZzm1qXvDMHME
	 7kyh1pNiujEpMmMlRNY3JdMf1dY1QXypQJNeSwlhnYgiOWQ53kCmiPTq7w7oTQtSQ+
	 brMx+dBmZAbfUOauVcMlVYJtCh+ZSDQrrlf6LFRSGNzMqsSuXj14zgM344yb5EIamd
	 xjv37Y2RsgnlGufseee9IXP27P5Is4MQVTrjtNeADYW7ueUNDZ6CDUZZov8Xf8Hcx3
	 O7Q+808rBEchg==
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
Subject: [PATCH 05/19] arm64: smp: Tidy up smp_prepare_cpus()
Date: Mon,  7 Sep 2026 17:40:08 +0100
Message-ID: <20260907164024.17164-6-will@kernel.org>
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

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..ff045080ca1b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -779,16 +779,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -803,8 +801,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.55.0.979.g7e5102b832-goog

