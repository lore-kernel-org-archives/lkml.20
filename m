Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216252C3261
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986912; cv=none; b=R6a8lnX2/PnhyIIZNMcrEtyL3Qz+3ecaS3v9L3+RnoZNqxqZXdebMA7D6dPvvUEB4B9nj2OIRiGEpLsy8DseJX/0NAOJT10wf58zWlax3IIYzf9UsCs9lBSm1XLE95No3YzwLYonynn/Qcy0At/RlxSCh6Y5tz7RJ066NxfGSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986912; c=relaxed/simple;
	bh=DvreFID8frJUX2tXmZWmQeIDrcBX9ClDDyMosh2LgKA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZNpi2IcySIMU9x+iBW4woKkQv36bj2jBWOAVYAiJb/QuYfSPT1Dv0D+FQ2x0z9rtttrXdpPP5E2LNUrQRPpY21zOHfACp7LMseCIRGsT+//0Wjh55THNN/4HaXjPpgGJon9a3vyP18l0u/tb7n3vcAMfIpyPd9IcwluLtBHUDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bh1/yON9; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bh1/yON9"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so84756a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986907; x=1791591707; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4g1ObsslfRrIxGm9J1WErW3kJq6TK7lBBQX23Z9YIM=;
        b=Bh1/yON9gV0DF7g90SqtqWijg595HDc+JKkRpRJcedAyIUVfAZY6nIipkKRePtWZkh
         /vYo4vAGsel33CGq8hivsuKYMGIIcUtTeI1p72ighbyp0lZqwNVjqvXxvg0UCs6mPiHt
         3GEiyKRtb4jw3SiISvHJCc7XNI/JxqzWanN8OahXxK60kqKCatFZrAZHlnGTZlKGko94
         0BkSxVxHskuoNRn/fVcgWWSaivSlvZ2T87g1atXcwFPSqq3etFsMUfLqRE3BjGrbAtV2
         +UGRDB2t/h2QglXpyNSY7Mb70JiYFGsSYT7Yp5syKYOyrtf2mRwbtlchITZSPSl+h6gL
         FI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986907; x=1791591707;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4g1ObsslfRrIxGm9J1WErW3kJq6TK7lBBQX23Z9YIM=;
        b=tN2AHgVtbVcOUT+EqIkgRSw+iDFkmEFWyS8T924J0pGbCGrWL/gv+2RM/Bd1+1+CVl
         peJZskPwwiSeaCalD+3sq6yvP8bcAFDfM4foxoUQxSvDESYjJZU7HEbW/bAPKosS27e3
         6dLFlIOl0T6W13Oi3P/s61DoNx7kfS5YQ8b6qhSubobpGVwdp09o54m7qqzwjqJNwzWM
         bu5YKqGh+ZdGWlR4vtisXp7G+8DDskxXmWJz/KJFjsaHJiya6qg6CBP4/FTcmcSp1Htn
         rV0ltXd/6fmCad/7nXwZlcSC7/GUTk/rB4oSp2c+JnPmPj6PNHj4xTkLXPlDQyLywpH8
         wBmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnAXElDbPvBFVU8YVXjkDFul3SpqiSoOJ0N2yzKrB1+pH3Ef2we9bGXS1ANbChViS5ZvKq+jQIw+IP5yM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYI9Yljb4Rkf1uCU/8YpnsYdTZ8Hm2FBjR25d8sGVLQU5v6RVo
	p+YFwkTJwRSrd9U6ifu/LiMbxUrvYETTVdKe1nC3z5tDn9gObnEc93ZNQYgDTRXLHdwCOxEmtNF
	31J06Ma3zT8JrxHC3WEyZvA==
X-Received: from pjbmw9.prod.google.com ([2002:a17:90b:4d09:b0:3a7:239:2141])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr1812320a91.59.1790986907076;
 Fri, 02 Oct 2026 17:21:47 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:17 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-15-jthoughton@google.com>
Subject: [PATCH v2 14/20] hugetlb_vmemmap: Add fault injection for in-place
 vmemmap PTE updates
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

try_update_vmemmap_pte() may fail, e.g. on arm64 when the update keeps
racing with hardware access flag updates. HVO handles such failures by
rolling back the optimization, or by leaving folios partially optimized
if the rollback or a later restore fails. These paths are rare to hit
normally.

Add a fault-injection capability, fail_hugetlb_vmemmap_pte, under
CONFIG_FAIL_HUGETLB_VMEMMAP. When a fault is injected, the PTE update
fails with -EAGAIN without touching the page tables, as if the in-place
update had given up.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pte= boot option, the latter allowing failures to
be injected when optimizing bootmem folios.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../fault-injection/fault-injection.rst       |  6 +++
 lib/Kconfig.debug                             |  9 +++++
 mm/hugetlb_vmemmap.c                          | 38 ++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index c2d3996b5b40..403206645fa4 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,6 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
+- fail_hugetlb_vmemmap_pte
+
+  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
+  optimization. (try_update_vmemmap_pte())
+
 - fail_usercopy
 
   injects failures in user memory access functions. (copy_from_user(), get_user(), ...)
@@ -263,6 +268,7 @@ use the boot option::
 
 	failslab=
 	fail_page_alloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..96cd1f1da94a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2066,6 +2066,15 @@ config FAIL_PAGE_ALLOC
 	help
 	  Provide fault-injection capability for alloc_pages().
 
+config FAIL_HUGETLB_VMEMMAP
+	bool "Fault-injection capability for HugeTLB vmemmap optimization"
+	depends on FAULT_INJECTION && HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	help
+	  Provide fault-injection capability for the in-place vmemmap page
+	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
+	  try_update_vmemmap_pte(). This exercises the rollback and
+	  partially-optimized folio paths.
+
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
 	depends on FAULT_INJECTION
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fabf2b25fe59..1eca03a3def3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pgalloc.h>
 #include <linux/vmemmap-optimization.h>
 #include <linux/hugetlb.h>
+#include <linux/fault-inject.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -50,6 +51,39 @@ struct vmemmap_remap_walk {
 	unsigned long		flags;
 };
 
+#ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+
+static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pte, str);
+}
+__setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+static int __init fail_hugetlb_vmemmap_debugfs(void)
+{
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
+				  &fail_hugetlb_vmemmap_pte);
+	return 0;
+}
+late_initcall(fail_hugetlb_vmemmap_debugfs);
+#endif /* CONFIG_FAULT_INJECTION_DEBUG_FS */
+
+/*
+ * Inject failures as if the in-place update lost a race too many times
+ * (see the arm64 implementations), without touching the page tables.
+ */
+static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pte, PAGE_SIZE))
+		return -EAGAIN;
+	return try_update_vmemmap_pte(addr, ptep, pte);
+}
+#else
+#define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
+
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
@@ -235,7 +269,7 @@ static int vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
 	}
 
-	ret = try_update_vmemmap_pte(addr, pte, entry);
+	ret = hvo_update_vmemmap_pte(addr, pte, entry);
 	if (ret)
 		return ret;
 
@@ -279,7 +313,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	 */
 	smp_wmb();
 
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

