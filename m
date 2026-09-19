Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C97E78F2B;
	Sat, 19 Sep 2026 00:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776719; cv=none; b=b7Ls9cPE8VjAp3XP1GvK52ryUPDMQI7AM08HOsaFlkPMZXb1Gjr7gLPt5Ocbb7kOaIrh057Ac+AtcoJ1+p1Fg90ff/YgxZFagoaiE41llX3zKxxvQsT4j0JdRrCQ0FFYM+NKi6Jgvh70rumz4EzyXDmt3UEMA8tQuLw0aBGjmok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776719; c=relaxed/simple;
	bh=Hfuth5eHF7lTRh20RRO0d0c2emr8uouYqnJwYOopxpQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RzTDZ7knXdyZezMTKnzzIf0URe6cIWKjVWPvBeo8Flzvi1x/3hjQkC/C9uoru/572Tptpdfu8NiPIgg8Gnp/9zeDr4w7a8FeTB9DzNTvlPTqLdh1L9/klkZVnDrT3ndwgmrKwNym+s80DCHsAEyd+hyZ7KJN70ZyhRZqxXRJH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xaEj0XH/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JEbGRjkK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xaEj0XH/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JEbGRjkK"
Date: Sat, 19 Sep 2026 00:11:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789776715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAo+we5L8GZJQFEi3fmpL3pF7jmWoJSn1HYu46T8kWE=;
	b=xaEj0XH/ccJ6wi6MZi8DCK2CtoI3N6A9w7Gw/p5fi7GU+BxEwjUjmmZdfZgj2hkEL3nHSg
	Pqqen0IuqtSv44AiAohgwc70o7jUxZOSGURy3GpNtQQalpyM9Nr0DStT5SuVn7zef/fwwl
	4JL1blzGnvsL23pZci+Zug3kCsyJrbmccD2HCLofvZKx6ytELGpyCwMcHirnq7EenM/aCm
	kTFaGhlAo2TUAcF0ZhrR7ZM+VM3iXV5rOOh2hp3LrR5YipRJFKZiJAlxhoooOuxkr42IfL
	L6AddUCUC0mQoQ+ydOFJo9PgNrRSigGO2Qv0r3IsQYdEkcTisAG2w6WM+GmTYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789776715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAo+we5L8GZJQFEi3fmpL3pF7jmWoJSn1HYu46T8kWE=;
	b=JEbGRjkK/bo6xo+NnQ6jK69FBNJwyOzIT8U/H89Q0uF60u61QqcC3oUFubQ/ITSRi2k6hP
	gi0ZLoHWScZwXhBw==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/sev: Perform RMP optimizations asynchronously
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ashish Kalra <ashish.kalra@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Cdaa513fbe8f0672b00bc5e026e4399244be6dc72=2E1789594?=
 =?utf-8?q?774=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3Cdaa513fbe8f0672b00bc5e026e4399244be6dc72=2E17895947?=
 =?utf-8?q?74=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178977671394.1720534.8400839405075873984.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     c6c6f156d192bf905eb6e46d8ad6229fa9bbe036
Gitweb:        https://git.kernel.org/tip/c6c6f156d192bf905eb6e46d8ad6229fa9b=
be036
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Wed, 16 Sep 2026 22:15:14=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 18 Sep 2026 16:58:13 -07:00

x86/sev: Perform RMP optimizations asynchronously

When SNP is enabled, all writes to memory are checked to ensure memory
integrity. This imposes performance overhead on the whole system.

RMPOPT is a new instruction that minimizes the performance overhead of
RMP checks on the hypervisor and on non-SNP guests by allowing such checks to
be skipped for 1GB regions of memory that are known not to contain any SNP
guest memory.

Add support for performing RMP optimizations asynchronously using a dedicated
per-CPU workqueue.  Shortly after SNP initialization, run an optimization pass
over all physical memory.

As SNP guests are launched, RMPUPDATE assigns their private pages to
guest-owned state; when such a page falls within an optimized 1GB region, the
hardware clears that region's RMPOPT optimization and RMP checks resume there
to protect the guest memory.

Since launching SNP guests clears these optimizations, perform them again
asynchronously using the dedicated workqueue.

  [ bp:
   - Massage commit message and comments
   - simplify code
   - redo some of the logic ]

Suggested-by: Thomas Lendacky <thomas.lendacky@amd.com>
Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/daa513fbe8f0672b00bc5e026e4399244be6dc72.17895=
94774.git.ashish.kalra@amd.com
---
 arch/x86/virt/svm/sev.c | 100 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 6 deletions(-)

diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 1fecd24..2d2a8b1 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -19,6 +19,7 @@
 #include <linux/iommu.h>
 #include <linux/amd-iommu.h>
 #include <linux/nospec.h>
+#include <linux/workqueue.h>
=20
 #include <asm/sev.h>
 #include <asm/processor.h>
@@ -124,7 +125,27 @@ static void *rmp_bookkeeping __ro_after_init;
=20
 static u64 probed_rmp_base, probed_rmp_size;
=20
-static phys_addr_t rmpopt_pa_start;
+static u64 rmpopt_pa_start, rmpopt_pa_end;
+
+enum rmpopt_op_type {
+	RMPOPT_OP_VERIFY_AND_REPORT_STATUS,
+	RMPOPT_OP_REPORT_STATUS
+};
+
+static struct workqueue_struct *rmpopt_wq;
+static struct delayed_work rmpopt_delayed_work;
+
+/* Software RMPOPT facilities initialized */
+static bool rmpopt_soft_init;
+
+/*
+ * Delay, in milliseconds, before the RMP re-optimization pass runs after an
+ * SNP guest is torn down. This coalesces a burst of teardowns into a single
+ * scan and gives each guest's pages time to be converted back to the shared,
+ * hypervisor-owned state.  The 10 second value is a heuristic trading
+ * re-optimization latency against scanning too eagerly.
+ */
+#define RMPOPT_WORK_TIMEOUT	(10 * MSEC_PER_SEC)
=20
 static LIST_HEAD(snp_leaked_pages_list);
 static DEFINE_SPINLOCK(snp_leaked_pages_list_lock);
@@ -565,6 +586,9 @@ void snp_shutdown(void)
 	if (syscfg & MSR_AMD64_SYSCFG_SNP_EN)
 		return;
=20
+	if (rmpopt_soft_init)
+		cancel_delayed_work_sync(&rmpopt_delayed_work);
+
 	clear_rmp();
 	on_each_cpu(mfd_reconfigure, NULL, 1);
=20
@@ -577,21 +601,82 @@ void snp_shutdown(void)
 }
 EXPORT_SYMBOL_FOR_MODULES(snp_shutdown, "ccp");
=20
-static bool rmpopt_capable(void)
+/*
+ * RMPOPT optimizations skip RMP checks at 1GB granularity if this range of
+ * memory does not contain any SNP guest memory.
+ *
+ * @pa is a system physical address; RMPOPT operates on the containing 1GB.
+ */
+static void rmpopt(u64 pa)
 {
-	return cpu_feature_enabled(X86_FEATURE_RMPOPT) &&
-	       cc_platform_has(CC_ATTR_HOST_SEV_SNP);
+	enum rmpopt_op_type op =3D RMPOPT_OP_VERIFY_AND_REPORT_STATUS;
+	u64 pa_start =3D ALIGN_DOWN(pa, SZ_1G);
+
+	/* Supported by binutils 2.48+ */
+	asm volatile(".byte 0xf2, 0x0f, 0x01, 0xfc"
+		     :: "a" (pa_start), "c" (op)
+		     : "memory", "cc");
+}
+
+static void rmpopt_scan_range(void *arg)
+{
+	u64 pa;
+
+	for (pa =3D rmpopt_pa_start; pa < rmpopt_pa_end; pa +=3D SZ_1G)
+		rmpopt(pa);
 }
=20
+static void do_rmpopt_work(struct work_struct *work)
+{
+	/*
+	 * Warm up the RMPOPT cache on this pinned per-CPU worker with interrupts
+	 * enabled, so the IRQ-disabled fan-out below only issues cache-hit RMPOPTs.
+	 */
+	rmpopt_scan_range(NULL);
+
+	on_each_cpu_mask(cpu_primary_thread_mask, rmpopt_scan_range, NULL, true);
+}
+
+static int __init rmpopt_init(void)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
+		return -ENODEV;
+
+	rmpopt_wq =3D alloc_workqueue("rmpopt_wq", WQ_PERCPU, 1);
+	if (!rmpopt_wq) {
+		pr_err("Failed to allocate RMPOPT workqueue\n");
+		return -ENOMEM;
+	}
+
+	INIT_DELAYED_WORK(&rmpopt_delayed_work, do_rmpopt_work);
+
+	/* The optimization range is fixed at boot; compute it once. */
+	rmpopt_pa_start =3D ALIGN_DOWN(PFN_PHYS(min_low_pfn), SZ_1G);
+	rmpopt_pa_end =3D ALIGN(PFN_PHYS(max_pfn), SZ_1G);
+	if ((rmpopt_pa_end - rmpopt_pa_start) > SZ_2T)
+		rmpopt_pa_end =3D rmpopt_pa_start + SZ_2T;
+
+	pr_info("RMPOPT optimizations enabled\n");
+
+	rmpopt_soft_init =3D true;
+
+	return 0;
+}
+device_initcall(rmpopt_init);
+
 void snp_enable_rmpopt(void)
 {
 	u64 base;
 	int cpu;
=20
-	if (!rmpopt_capable())
+	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
 		return;
=20
-	rmpopt_pa_start =3D ALIGN_DOWN(PFN_PHYS(min_low_pfn), SZ_1G);
+	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
+		return;
+
+	if (!rmpopt_soft_init)
+		return;
=20
 	/*
 	 * Per-CPU RMPOPT tables cover at most 2 TB.  Program each core's
@@ -602,6 +687,9 @@ void snp_enable_rmpopt(void)
 		for_each_cpu(cpu, cpu_primary_thread_mask)
 			wrmsrq_on_cpu(cpu, MSR_AMD64_RMPOPT_BASE,
 				      rmpopt_pa_start | MSR_AMD64_RMPOPT_ENABLE);
+
+	mod_delayed_work(rmpopt_wq, &rmpopt_delayed_work,
+			 msecs_to_jiffies(RMPOPT_WORK_TIMEOUT));
 }
 EXPORT_SYMBOL_FOR_MODULES(snp_enable_rmpopt, "ccp");
=20
