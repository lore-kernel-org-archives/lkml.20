Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8A34CFB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540503; cv=none; b=ffrUf3uCzqKwtZuK2Es8bUXu19ha5EkBSVE4/uUP5+VegQS+mI+FzY2vG0Rx6wWpeQbixKEgHbP1uZybNJ4SzGPMNpNjKOFsYMq7W30omEVnxEi0VgJzfs426qu/fkZb43V3hhsUuEG23iOy3UuI66Z/q59TecZj5hPMuqP4zjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540503; c=relaxed/simple;
	bh=FBu/8MgIptWtbnnKFOJoKwQM/wvJps8WSBYmFGbL8jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKKRADyMRgVuyzEt82lb3jU0H/xl36pN60N3nqNM7WoXGPU1eIkSHRCaN4NTtQSPr+q+jNYsORfLx1KhQiIC2bicYyaEFZqZJfe6yxaiwtPqSXPjVT4DPlCZogelKULAdiePyvT8k/BJb5KHp6U1B0T2NDEYpXXUl/Y5wOvnuNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkIwrFV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkIwrFV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D15D1F00893;
	Fri,  9 Oct 2026 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540501;
	bh=zxkYEJUGySSxzS2ixA+Ci8e7ZpD90Ys46w1ywM29lW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XkIwrFV+uODvTXAS3eVQBNQ5KZNsC0PR/tqjRCCwVKnRtmPcTl6N4bKWHxaoOBgDK
	 drri7VQIEFqTDk1NU0pU1ev+hRsXnzGm7jgtyYcOeV9Y8zxbKTPfaC5hCZT1P1jE+s
	 qly1sOx2owfr5ubcNcISzLxUIoxr1dD2O6fC+Am4TlUlO+2QXF+nZmDga/UUt3xgDs
	 +n9gwACl7LNnspENetoegdH4ubykoTqGidI0XmFWrmY8cmV8rNxmjIJkNGVQLUNr4A
	 vQOm81R9YFR/an4Uo4paOsu/+Tyc5dYst9h20bbhOcbYzQlmd62ugjeK10q+7dJk/v
	 C+VYcFmfWS/pg==
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
Subject: [PATCH v2 09/23] arm64: smp: Tidy up smp_prepare_cpus()
Date: Fri,  9 Oct 2026 11:07:20 +0100
Message-ID: <20261009100738.31288-10-will@kernel.org>
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

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index eac217b9ebf1..d2aa949e33a3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -781,16 +781,14 @@ void __init smp_init_cpus(void)
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
@@ -805,8 +803,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.56.0.385.gd3acb90ef8-goog

