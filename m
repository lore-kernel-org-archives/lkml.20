Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6B52ED35;
	Fri,  4 Sep 2026 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559911; cv=none; b=kwothVVI4nNUntEMiK8FgEEmjX2HqvFdXD0usUUJhWVDoWedC0TZMR2z9STsP913PDJuH+ueBkmTglnFJRH9uwWiQdekBbWl46SnE87P7qC/udkYaHjOh4UlO05yCvR9nhp2sppu/nTYsce4LTeGO2/8L5GOGGukG9D3rgJW2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559911; c=relaxed/simple;
	bh=ZAiCYp6OOI4W64K6dRL1Foun7sKNpHU8RYznzDqd0Ko=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jotcnqWRw0aTXKx3QTha8XVC+fXHVf8/GW/IqE+tFRKIzrQukYBCuIL0KcGufmOJN4MrgrC3h8qMmoJj70ReURZIeaMW/BfdreuommsvYxlzUIBlYuAWAhpbIxRbQGKGAd//xzsKKuetEBL5/0TO3rpUzmr6hnVSFAPAwIN1hPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C/oKefYk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xEcWwW+q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C/oKefYk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xEcWwW+q"
Date: Fri, 04 Sep 2026 22:11:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559907;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvVi8QkS2vPSMM+CLPDm9oguqe6NbFN0DCwtS5zeRMY=;
	b=C/oKefYkqIsK1hzb7rYTtSgTI6wZKNbPdyptCfT8LaKr7d3DFLqaQo2JbqPZQO1P/jZead
	T5X8k7/v3W1w8Sasb8PqcZ1hZX7eD7AImStSVYHlz2lZF7donEdQqS75CgRYp0uyqrq3M+
	cRKY3ftJet9CpzUW0WJx0TiwCMBf9q/PXhtOM/twq/hWpafUI+r72ohgjgJk6qsvFKO4y9
	cL+YECwyRzbljTFZKPx9au2P6fBLsd9qPduHVx1GvetBiCwWQ+WFXugx5PYMLPm3+HEPce
	1eLztpZ4ym/Dq09QHkJliTYqfnaonHP1yptbZ4Jyn+M6yoD8b/q0ZFHwKvREMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559907;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvVi8QkS2vPSMM+CLPDm9oguqe6NbFN0DCwtS5zeRMY=;
	b=xEcWwW+qw2zuvhIaHCKwJbxNxMFiy/5Pg7Tg0wE8mI+vnCH/A0PCUMmAgAwQe7ggRjWhwF
	zzRNJvzdY5gweZCw==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] x86/virt/tdx: Allocate refcounts for Dynamic PAMT memory
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-5-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-5-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855990602.3717435.5955662667414197594.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     5386c5288001f00e5f2019d5f7b50c97d62f3a7b
Gitweb:        https://git.kernel.org/tip/5386c5288001f00e5f2019d5f7b50c97d62=
f3a7b
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:34 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:02 -07:00

x86/virt/tdx: Allocate refcounts for Dynamic PAMT memory

The PAMT memory holds metadata for all possible TDX protected memory. Each
physical address range is covered by PAMT entries at three levels (1GB,
2MB, 4KB). With Dynamic PAMT (DPAMT), the 4KB level of PAMT is allocated
on demand. The kernel supplies the TDX module with page pairs to store the
4KB level entries, which cover 2MB of host physical memory. The kernel must
provide this page pair before using pages from the range for TDX. If this
is not done, SEAMCALLs that give the pages to be protected by the TDX
module will fail.

Allocate reference counters for every 2MB range to track TDX memory usage.
This can be used to handle concurrent get/put callers, in order to
accurately determine when the dynamic 4KB level of DPAMT needs to be
allocated and when it can be freed.

This allocation will currently consume 2MB for every 1TB of address
space from 0 to max_pfn. The allocation size will depend on how the RAM is
physically laid out. In a worst case scenario where the entire 52 bit
address space is covered this would be 8GB. Then the DPAMT refcount
allocations could hypothetically cause the savings from DPAMT to go
negative on exotic platforms with sparse, small amounts of memory.

Future changes could reduce this refcount overhead to be only allocating
refcounts for physical ranges that contain memory that TDX can use.
However, this is left for future work.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Based on a patch originally by Kiryl Shutsemau.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Vishal Annapurve <vannapurve@google.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://patch.msgid.link/20260904215841.303070-5-rick.p.edgecombe@intel=
.com
---
 arch/x86/virt/vmx/tdx/tdx.c | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index a9c5b6f..305289b 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -30,6 +30,7 @@
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/idr.h>
+#include <linux/vmalloc.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
 #include <asm/msr-index.h>
@@ -66,6 +67,14 @@ static DEFINE_PER_CPU(bool, tdx_lp_initialized);
=20
 static struct tdmr_info_list tdx_tdmr_list;
=20
+/*
+ * On a machine with DPAMT, the kernel maintains a reference counter
+ * for every 2MB range. The counter indicates how many users there are for
+ * the DPAMT at the 2MB range. The kernel allocates DPAMT refcounts at
+ * initialization.
+ */
+static atomic_t *dpamt_refcounts;
+
 /* All TDX-usable memory regions.  Protected by mem_hotplug_lock. */
 static LIST_HEAD(tdx_memlist);
=20
@@ -256,6 +265,42 @@ static struct syscore tdx_syscore =3D {
 };
=20
 /*
+ * Allocate DPAMT reference counters for all physical memory.
+ *
+ * It consumes 2MB for every 1TB of physical memory.
+ */
+static __init int init_dpamt_refcounts(void)
+{
+	size_t size =3D DIV_ROUND_UP(max_pfn, PTRS_PER_PTE) * sizeof(*dpamt_refcoun=
ts);
+
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return 0;
+
+	dpamt_refcounts =3D vzalloc(size);
+	if (!dpamt_refcounts)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static __init void free_dpamt_refcounts(void)
+{
+	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
+		return;
+
+	vfree(dpamt_refcounts);
+	dpamt_refcounts =3D NULL;
+}
+
+static __maybe_unused atomic_t *tdx_find_dpamt_refcount(unsigned long pfn)
+{
+	/* Find which PMD a PFN is in. */
+	unsigned long index =3D pfn >> (PMD_SHIFT - PAGE_SHIFT);
+
+	return &dpamt_refcounts[index];
+}
+
+/*
  * Add a memory region as a TDX memory block.  The caller must make sure
  * all memory regions are added in address ascending order and don't
  * overlap.
@@ -1155,10 +1200,14 @@ static __init int init_tdx_module(void)
 	 */
 	get_online_mems();
=20
-	ret =3D build_tdx_memlist(&tdx_memlist);
+	ret =3D init_dpamt_refcounts();
 	if (ret)
 		goto out_put_tdxmem;
=20
+	ret =3D build_tdx_memlist(&tdx_memlist);
+	if (ret)
+		goto err_free_dpamt_refcounts;
+
 	/* Allocate enough space for constructing TDMRs */
 	ret =3D alloc_tdmr_list(&tdx_tdmr_list, &tdx_sysinfo.tdmr);
 	if (ret)
@@ -1208,6 +1257,8 @@ err_free_tdmrs:
 	free_tdmr_list(&tdx_tdmr_list);
 err_free_tdxmem:
 	free_tdx_memlist(&tdx_memlist);
+err_free_dpamt_refcounts:
+	free_dpamt_refcounts();
 	goto out_put_tdxmem;
 }
=20
