Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEF24DCF9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986917; cv=none; b=LCZu84Dc814+nsBieai9Fho0Fx0cl/HHYPpO0wCdzOo/rVFubNkEICuaWeoO+v5ZOxTaZNyJxEyLBjq19zIX8jUvjkRPK5E5n60KkffGcGZl36UFffNsN3QfYuznquW7wlVL/++mPj4YrECqtuTZhLDTrfJ9jZuIww5GqTPHWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986917; c=relaxed/simple;
	bh=3Q5bTHQS1L7nkQQYX39ccm8ys/WrKTII8WcrAVjjkTc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PIH0saWv5ljhpJFoluhiOVxGJuOp2Pnxgfbmp54ZK6IlGDVZIHeghHhuWCEu09ohozsu/Parr5r/Vx60MqHYfhJMhEynMVjtagg6pl+Rmyf3a4B7NGklLTKcHHS5yWvZa3DX4p8OgTW6/fYOkZVGHqLwIhwXrihtaFZ5RFaHQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uboRVPMP; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uboRVPMP"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so58705ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986912; x=1791591712; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qp+JasK82C1RW+o2wrGx0jSXA4z4FWd0AFKo27jNBek=;
        b=uboRVPMPT2ZuWAVlXgFqaQy2i7XcGHqfROngRPt9K4Qg8SKZo9hxOwcNqas7Qyjdjk
         66ckuyTSGhxAv5kMWSIj68wK1f32wCcGBWz/XdHI1n9kMOGo0x+r538LCAhYiwczadiA
         U5N+inXRrlK66UGmzDBkVLdXUiKgdOKinccu3qBL7lWYKAxCTvD1fRDXm7ptYqlFLEG8
         Pv7gYY21Prhg4Fpl+jUfDBZM0h4CKcD0tKuVwvpMibdL/GeTqeoG7HKFeLysaNe6orU5
         uNRDEpOLAqMggobjrN5TFtJKLzTAuCdvilMUipE1mbEFMajMfkCjiHiiV5ljuj28xME1
         NJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986912; x=1791591712;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp+JasK82C1RW+o2wrGx0jSXA4z4FWd0AFKo27jNBek=;
        b=vVTEmlDoyW2nkO3qdqL3MdwBAF+F1s29V+cMehDQvrpepDtwQNwi+qslpE0oy2b8GO
         Mx1DPlHM/csS7GeoOWEmhoiAdkLji6i/srPD5fo+eJ+OdBKA3WieHzz06nz85zyBCcuy
         23S9gDdnlGEtGahvv0/flbpB4LPT0B22TS1T1BNtM2QwvpOVDwoVi2GyEcVWFygRfzyi
         F28/a2g9T1MqSezVg3m0wqB+mLtsMZepE1RD/g988SZJc/iTDsp3dcJDfzPtt6goiSOI
         LruCn+4Y7LivqEPQihQW72ERlny8KpoSqYpvP+1iGzLaksJYbYS7Kxovr6GIwsvcWkfZ
         /9aA==
X-Forwarded-Encrypted: i=1; AKwUvBysS4AYUVcgjurCOfVmYg0d3ZyoIionHOOYfhdUrjOjM9R+njJrCDSr41tpxnrQGsalBcYLQMsgftwIIwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6v37bIzrRKQJDUCbg6CUxZ9bn3BrES9ZLZtVso7HR2o/IzvW9
	z0yW/WeY665aRJuPTVC/TpdDemXy93BogvfYTWSRreA0kQ2w0gATX5bfEgwy5D1feSluBAOR5Oi
	xhHaGbTAeIIXeWaivHFNmpA==
X-Received: from plpv6.prod.google.com ([2002:a17:902:9a06:b0:2df:660d:f283])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:37c6:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2e49b4e29edmr36276715ad.13.1790986911618;
 Fri, 02 Oct 2026 17:21:51 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:22 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-20-jthoughton@google.com>
Subject: [PATCH v2 19/20 DO-NOT-MERGE] hugetlb_vmemmap: Add fault injection
 for in-place vmemmap PMD splits
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

Like try_update_vmemmap_pte(), try_populate_vmemmap_pmd() may fail,
e.g. on arm64 when replacing the block mapping keeps racing with
hardware access flag updates. HVO handles such failures by not
optimizing the folio.

Add a fault-injection capability, fail_hugetlb_vmemmap_pmd, alongside
fail_hugetlb_vmemmap_pte. When a fault is injected, the PMD split fails
with -EAGAIN without touching the page tables.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pmd= boot option. Since vmemmap PMDs are only split
once, the boot option is the most effective way to exercise this path.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../fault-injection/fault-injection.rst       |  8 +++++---
 lib/Kconfig.debug                             |  4 ++--
 mm/hugetlb_vmemmap.c                          | 20 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 403206645fa4..5cfabea811da 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,10 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
-- fail_hugetlb_vmemmap_pte
+- fail_hugetlb_vmemmap_pte, fail_hugetlb_vmemmap_pmd
 
-  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
-  optimization. (try_update_vmemmap_pte())
+  injects failures of the in-place vmemmap PTE remaps and PMD splits done by
+  HugeTLB vmemmap optimization. (try_update_vmemmap_pte(),
+  try_populate_vmemmap_pmd())
 
 - fail_usercopy
 
@@ -269,6 +270,7 @@ use the boot option::
 	failslab=
 	fail_page_alloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 96cd1f1da94a..7abda377c737 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2072,8 +2072,8 @@ config FAIL_HUGETLB_VMEMMAP
 	help
 	  Provide fault-injection capability for the in-place vmemmap page
 	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
-	  try_update_vmemmap_pte(). This exercises the rollback and
-	  partially-optimized folio paths.
+	  try_update_vmemmap_pte() and try_populate_vmemmap_pmd(). This
+	  exercises the rollback and partially-optimized folio paths.
 
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9e0f52474bdb..f50880dd79a2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -53,6 +53,7 @@ struct vmemmap_remap_walk {
 
 #ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
 static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pmd);
 
 static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 {
@@ -60,11 +61,19 @@ static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 }
 __setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
 
+static int __init setup_fail_hugetlb_vmemmap_pmd(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pmd, str);
+}
+__setup("fail_hugetlb_vmemmap_pmd=", setup_fail_hugetlb_vmemmap_pmd);
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 static int __init fail_hugetlb_vmemmap_debugfs(void)
 {
 	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
 				  &fail_hugetlb_vmemmap_pte);
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pmd", NULL,
+				  &fail_hugetlb_vmemmap_pmd);
 	return 0;
 }
 late_initcall(fail_hugetlb_vmemmap_debugfs);
@@ -80,8 +89,17 @@ static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
 		return -EAGAIN;
 	return try_update_vmemmap_pte(addr, ptep, pte);
 }
+
+static int hvo_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+				    pte_t *pgtable)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pmd, PMD_SIZE))
+		return -EAGAIN;
+	return try_populate_vmemmap_pmd(addr, pmdp, pgtable);
+}
 #else
 #define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#define hvo_populate_vmemmap_pmd	try_populate_vmemmap_pmd
 #endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
 
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
@@ -113,7 +131,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 	if (likely(pmd_leaf(*pmd))) {
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
-		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		ret = hvo_populate_vmemmap_pmd(start, pmd, pgtable);
 		if (ret)
 			goto free;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

