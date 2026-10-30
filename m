Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379531;
	b=UC8iKCWifk3sExWPwDehW4zHsKFbVIaUoGHgt+oNrNqn88Ob2y59tTEqAJ3/Be0hWEGt
	 R7Mz4ja+WZdWmO8MxgR3ZzlAmNMMJOCmL+1H90a3RdLKzx7m6Q9arauAd43EVcYHviUIL
	 V/XufSNbVhhzSKpYBedgI8SQllnNKGq1IMTaLAmuIbkSJSlMN6KBc9IqnvW90f9oi5PxB
	 XpSfvB+dl2IN3L76J/dyhwBB1/UGn8UNE7FeAYWtKlW6T2Ew8gf3O1MhZC0e+ceLF+qZh
	 GpYghKH2Y90zy4Cd32AUCYNvKUqdg6HEA2drJ6KXKXQURNCudx3cY3Ks4TuVyUC7S4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E0o7l/pShR1+SqYicqhHSKEqObfbQ+XkPYrzgPFmubQ=;
	b=BXR2qSI2jZIinChiEcK8zbKGRhwOTt1wbwRyiTqTBEGqfxMGRDalemfHmt2qJ5P5MiXT
	 KS4oRCMyAmiU4O66MSaeSlIQzJok+5u0TaIeNgaMIjLU6inRVwfyPMyk7zcfuk917AOfT
	 LSLAL3O8ocHUI6VVs5+wgqzJa6mOFrarK8DgubJpIT2Qyj0OkPEAc7q4fcv77r+qqu/MA
	 vlExRW1pB5v5BYJqJLU4C4AiybU6BrYFVj7PtPkovODezFU0kEnD7fQkT43NsCobbwDGz
	 spjibt0NQeZhCVO4iBHenqvF8TY8/ndoAjls1wSyIDH5LdNFsTE71DyzHJcnpCpY4iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=2y909wnk;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B9C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=2y909wnk
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jGS3m0SClzlfvqP;
	Fri, 30 Oct 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793379520; x=1795971521; bh=E0o7l/pShR1+SqYicqhHSKEqObfbQ+XkPYr
	zgPFmubQ=; b=2y909wnklU2A+ClYMerPOG3NZGXIP6oyU5On42tAacJMwUyp9Bh
	8Ol+pm80xoQPKEE8pQ/73VXnfk2D+kxbxdEsW9OwEzPQ7TwQbYLdEnhnu4Nn6eBR
	KZ8YDzA/D59VXhamt86aZmUwJ0Zjc0iGjmLP5KVH46+zCu4EOnzq4LO5P+Wr8rxs
	LzbEbSDzmWJBgU/4AyNikFb8oScL4su+hzcFrGbWWUaIAH4UsClhkEKHMwHfULG9
	Xd4HZzIeZDbtVqVtFqU3pM9A3eX6YF4glgr9sj/iLTn+KWkv/XPAu3k2tXnLdRdl
	A43c9QrBQRda6WFMyhbtPVcFW9qlEuXWGQA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tIOHeKqG_gr3; Fri, 30 Oct 2026 16:58:40 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jGS3h36Y2zlfvqH;
	Fri, 30 Oct 2026 16:58:40 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] ARM: Flush the entire TLB for large kernel ranges
Date: Fri, 30 Oct 2026 09:58:08 -0700
Message-ID: <ea3f6c05ad01fedc3859d8c16e98eaf521cee624.1793379488.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

__purge_vmap_area_lazy() flushes the TLB for a single range that covers
all lazily freed vmap areas. On ARM, BPF JIT images and modules are
allocated below PAGE_OFFSET while other vmalloc allocations are above
it, so that range can span hundreds of megabytes. flush_tlb_kernel_range(=
)
invalidates such a range one page at a time, which takes up to hundreds
of thousands of per-page TLB maintenance operations. That loop has no
voluntary preemption points and runs while vmap_purge_lock is held, so
other tasks that free vmalloc memory are blocked.

Flush the entire TLB on both SMP and UP configurations if the range
touches at least PTRS_PER_PTE (512) pages, matching MAX_DVM_OPS on
arm64.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/arm/include/asm/tlbflush.h | 30 +++++++++++++++++++++++++++++-
 arch/arm/kernel/smp_tlb.c       | 15 +++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/tlbflush.h b/arch/arm/include/asm/tlbfl=
ush.h
index 38c6e4a2a0b6..c6a61f4488a9 100644
--- a/arch/arm/include/asm/tlbflush.h
+++ b/arch/arm/include/asm/tlbflush.h
@@ -9,6 +9,7 @@
=20
 #ifndef __ASSEMBLY__
 # include <linux/mm_types.h>
+# include <asm/page.h>
 #endif
=20
 #ifdef CONFIG_MMU
@@ -597,14 +598,41 @@ static inline void clean_pmd_entry(void *pmd)
 #define local_flush_tlb_range(vma,start,end)	__cpu_flush_user_tlb_range(=
start,end,vma)
 #define local_flush_tlb_kernel_range(s,e)	__cpu_flush_kern_tlb_range(s,e=
)
=20
+/*
+ * Bound the number of per-page TLB invalidations to avoid soft lock-ups=
 and
+ * long vmap_purge_lock hold times on large ranges (not necessarily a
+ * performance improvement). Matches MAX_DVM_OPS (PTRS_PER_PTE) on arm64=
.
+ */
+#define MAX_TLB_KERNEL_RANGE_PAGES	512
+
+static inline bool tlb_kernel_range_exceeds_max(unsigned long start,
+						unsigned long end)
+{
+	unsigned long pages;
+
+	if (end <=3D start)
+		return false;
+
+	pages =3D ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
+	return pages >=3D MAX_TLB_KERNEL_RANGE_PAGES;
+}
+
 #ifndef CONFIG_SMP
 #define flush_tlb_all		local_flush_tlb_all
 #define flush_tlb_mm		local_flush_tlb_mm
 #define flush_tlb_page		local_flush_tlb_page
 #define flush_tlb_kernel_page	local_flush_tlb_kernel_page
 #define flush_tlb_range		local_flush_tlb_range
-#define flush_tlb_kernel_range	local_flush_tlb_kernel_range
 #define flush_bp_all		local_flush_bp_all
+
+static inline void flush_tlb_kernel_range(unsigned long start,
+					  unsigned long end)
+{
+	if (tlb_kernel_range_exceeds_max(start, end))
+		local_flush_tlb_all();
+	else
+		local_flush_tlb_kernel_range(start, end);
+}
 #else
 extern void flush_tlb_all(void);
 extern void flush_tlb_mm(struct mm_struct *mm);
diff --git a/arch/arm/kernel/smp_tlb.c b/arch/arm/kernel/smp_tlb.c
index d4908b3736d8..957cc2eb662f 100644
--- a/arch/arm/kernel/smp_tlb.c
+++ b/arch/arm/kernel/smp_tlb.c
@@ -4,6 +4,8 @@
  *
  *  Copyright (C) 2002 ARM Limited, All Rights Reserved.
  */
+#include <linux/build_bug.h>
+#include <linux/pgtable.h>
 #include <linux/preempt.h>
 #include <linux/smp.h>
 #include <linux/uaccess.h>
@@ -234,6 +236,19 @@ void flush_tlb_range(struct vm_area_struct *vma,
=20
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
+	static_assert(MAX_TLB_KERNEL_RANGE_PAGES =3D=3D PTRS_PER_PTE);
+
+	/*
+	 * __purge_vmap_area_lazy() may pass a range that spans from the
+	 * modules area to the end of the vmalloc area. Invalidating such a
+	 * range page by page takes hundreds of thousands of broadcast TLB
+	 * operations, without voluntary preemption points.
+	 */
+	if (tlb_kernel_range_exceeds_max(start, end)) {
+		flush_tlb_all();
+		return;
+	}
+
 	if (tlb_ops_need_broadcast()) {
 		struct tlb_args ta;
 		ta.ta_start =3D start;
