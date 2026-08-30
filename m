Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A72DEA95
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066854; cv=none; b=AuYC/l29gc5ks+s5+JIX4JUnTHucFAX97k4P7rgIZNK/JicvzhdvfVTYNbYknFR7NC5atm8pb3UZmZS39ljX0z49wPhhp4oHsWsBkvm1Ckmtau7pgf6QN8WuAU9x8jVp3dnW8iiinqF4/Tf2jkCXc4dVEU+Z4nxo2xJtwWOV3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066854; c=relaxed/simple;
	bh=qDar28JySQZOFBLHqw4DU1n4wiE0RevwYt64tfL76/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPT20RN9wNMDCSR8slbT00virl+plyO2LnbEaEFIwBKjF4OqdOex47y7Bs66fAAqwxEILS1XjNKR0WE99Dsp7tqvIbNbsRJblxvwqlJtzSUH/I1usWbios2vpVZyknZYHkDeXuKVFw0K/jW3g5tULyJec6j7hb4OOLAtv3XVEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=cLSdzcQ0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="cLSdzcQ0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce7d2adef4so36228035ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066852; x=1788671652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ezj01Z6T9okgOiQa4EOGNSsW3Mil1bOoLksIRT0LM8A=;
        b=cLSdzcQ0B669YvQHpR9RGQTQtmoUbFAgfvsUNpKI6/51FHgXS/zA9OqeF7StFly33k
         L4jtT2i2YpQ1Okk8Th4rxZ2cXmk9KPl7Edad3mq8uDVhUoVcAwk9gB6CWHYL1jQr92LG
         ndQQOmtwFwGwZ8nWUZUaW+c/iEHXfuSyy1oac9afe6QtI83fdj9estWIDS3YczMpjwi8
         EBz7OZu4aotked7NMtF+6PnQGdDpz1kFZtpD8LJX614YYl9dfLZM89aXjQwIKDvex7wn
         sGjW1URJB7QJWxE97dN5iBw6K1kYkNwUmgFzp8Q/HJjXAUE0CTiAX3Ax4yaWSGmzZKiy
         wfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066852; x=1788671652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ezj01Z6T9okgOiQa4EOGNSsW3Mil1bOoLksIRT0LM8A=;
        b=T3Smbitp7Ial0QTl2s15mfc8cU0cRbP+nakZlQ8j+2YkgF8CVDnidL7NSkvayO0ADH
         APzqxgE5rPxcUzX2RQ2IVW950S8xIvX2EX4JlRqUEFoshDsp8cQxkI1gm0iegndCo129
         94qCRaltzlrVXwoJds+AEY7/K8/4vDIldL2J04bKEy/jVlSOvvgCTvr6cqc+mVr4a9wB
         nH2fAzrme8Z0CGuVAlJqy7kDjuSPOLiQod+OYsiuUtITgy0lDE0ojsW3+fRHV96kcag2
         pH0mMDy7ghSGiLUQDEV63cfh7hJ39b0O4pdZdjVE8lVVi1VgESq3uolfzX7nqgJBw0R/
         skTw==
X-Forwarded-Encrypted: i=1; AKwUvBxA7lk5VvJ/Sfd4V5npqRgf3K5W6oRwM5LTHPn7BmDTMN0JD0HKe775WQDWj+d2fv3gS+k3AB/iSlr139o=@vger.kernel.org
X-Gm-Message-State: AFuF++m6kzilCim9oZ/cKzgjSFaip/Ml+ei6xlb5nIa7YntQUaAvSLZf
	YcISany3iRICiMu5/ezQhtHMm/WZDP0gSQSnf1Efv7T1MX7vcLQor5A9NvaB5DRD4oA=
X-Gm-Gg: AR+sD13oNrqjmKLo3h2z++OkvitFlD5qdXr909UIOliuBGxElZBDc0FIZ/lAl9WdKDA
	PzZ4izfH0PWR6j9HGkmkxe7lM5VDb/kvhrfGUcxKPEp2Mm4b7ppsiALh65zEeE2sl5AiXN0k/rD
	GdW3/QbgqZrf1wBD35tbf7ShIJPCxIjYU/c/nHb6I9TJkyXY6dZX1Ch6X6tSNObFwZMXr0Gu9QK
	OrXDI4sAmn4aLB7N/9qAbRw1V1Zz/Vj6qjX9XlHvPNJ0eCJt0IiQOpZKdmSb7WSovw5WyV8Rg8D
	VrVgziJpNll4M0WwvJOKFyK2QnQrpT2Y8d7yNjzyY9kw+EqXmOBLEG4nr21gIUBIMJR6fnRTwCF
	yy3wBx2hgIGDllfakmOmWRfKt4+6P+dx3da0/PswZbcYSTfjUzqUZUfyJ39Ru3/vSep69iNlsjL
	999NLjaKnaYEPFtoQ9eposYbteU/q7iH4PmgGEgL4w7GnU4Zaxztq7kc30s/rsoasqs195oQM1V
	1la0D6NJcR7OmRT6ZqrBcdCVEV3ljnPhrPb
X-Received: by 2002:a17:903:2342:b0:2d7:414e:f2f with SMTP id d9443c01a7336-2d74def676fmr265059445ad.14.1788066852465;
        Sat, 29 Aug 2026 22:14:12 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:12 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 3/6] mm/damon/paddr: support hugetlb folios in access monitoring
Date: Sat, 29 Aug 2026 22:14:04 -0700
Message-ID: <20260830051407.50008-4-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DAMON's physical address space monitoring is blind to hugetlb-backed
memory.  Every access check starts at damon_get_folio(), which rejects
folios that are not on the LRU lists.  Hugetlb folios are managed
outside of the LRU by design, so every sampling attempt on
hugetlb-backed memory silently fails and the pages are reported as
never accessed.

This is a significant blind spot on virtualization hosts.  Cloud
hypervisor hosts commonly back guest memory with 1 GiB hugetlbfs pages,
covering the vast majority of the machine's memory.  On such hosts,
modules like DAMON_STAT observe only the host-side remainder (kernel,
page cache, daemons) and report all guest working sets as permanently
idle, defeating the purpose of host-level access monitoring.  In
testing on a 1 TiB host, an hour of 4-thread random access over 842 GiB
inside a guest was statistically indistinguishable from an idle host,
while a 40x smaller host-side workload produced a quantitatively
correct response.

Add damon_get_folio_incl_hugetlb(), which additionally accepts hugetlb
folios, and use it in the two paddr access monitoring primitives,
damon_pa_mkold() and damon_pa_young().  With the previous commit
teaching the folio-granular rmap walkers to age huge PTEs and to call
the mmu notifiers spanning the whole huge page, this makes guest
accesses visible through secondary MMU (e.g. KVM/EPT) young bits.

Free hugetlb pool folios have a zero refcount, so folio_try_get()
naturally keeps rejecting them.

The DAMOS action appliers (damon_pa_pageout(),
damon_pa_mark_accessed_or_deactivate(), damon_pa_migrate(),
damon_pa_stat()) keep using damon_get_folio(): reclaim, LRU
manipulation and migration cannot act on hugetlb folios, so their
behavior is unchanged.

Note that the access check granularity for hugetlb-backed memory is the
huge page size: one touched byte reports the whole (up to 1 GiB) page
as accessed.  Also, DAMON now consumes secondary MMU young bits that
KVM's own aging uses; at DAMON's sampling rate (one page per region per
sampling interval) the interference is negligible.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/ops-common.c | 31 +++++++++++++++++++++++++++----
 mm/damon/ops-common.h |  1 +
 mm/damon/paddr.c      |  4 ++--
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 62004206ca31..ece101d34684 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -15,14 +15,20 @@
 #include "../internal.h"
 #include "ops-common.h"
 
+static bool damon_folio_observable(struct folio *folio, bool incl_hugetlb)
+{
+	return folio_test_lru(folio) ||
+		(incl_hugetlb && folio_test_hugetlb(folio));
+}
+
 /*
- * Get an online page for a pfn if it's in the LRU list.  Otherwise, returns
- * NULL.
+ * Get an online page for a pfn if it's in the LRU list, or a hugetlb folio if
+ * @incl_hugetlb is set.  Otherwise, returns NULL.
  *
  * The body of this function is stolen from the 'page_idle_get_folio()'.  We
  * steal rather than reuse it because the code is quite simple.
  */
-struct folio *damon_get_folio(unsigned long pfn)
+static struct folio *__damon_get_folio(unsigned long pfn, bool incl_hugetlb)
 {
 	struct page *page = pfn_to_online_page(pfn);
 	struct folio *folio;
@@ -33,13 +39,30 @@ struct folio *damon_get_folio(unsigned long pfn)
 	folio = page_folio(page);
 	if (!folio_try_get(folio))
 		return NULL;
-	if (unlikely(page_folio(page) != folio) || !folio_test_lru(folio)) {
+	if (unlikely(page_folio(page) != folio) ||
+			!damon_folio_observable(folio, incl_hugetlb)) {
 		folio_put(folio);
 		folio = NULL;
 	}
 	return folio;
 }
 
+struct folio *damon_get_folio(unsigned long pfn)
+{
+	return __damon_get_folio(pfn, false);
+}
+
+/*
+ * Same to damon_get_folio(), but also accepts hugetlb folios, which are
+ * managed outside of the LRU lists.  Aimed to be used by access monitoring
+ * primitives.  DAMOS actions that assume LRU-managed folios should keep using
+ * damon_get_folio().
+ */
+struct folio *damon_get_folio_incl_hugetlb(unsigned long pfn)
+{
+	return __damon_get_folio(pfn, true);
+}
+
 void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr)
 {
 	pte_t pteval = ptep_get(pte);
diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index f7811c9c7a02..68d7de49c87a 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -6,6 +6,7 @@
 #include <linux/damon.h>
 
 struct folio *damon_get_folio(unsigned long pfn);
+struct folio *damon_get_folio_incl_hugetlb(unsigned long pfn);
 
 void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr);
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr);
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 5c6c3a597fd0..09d418b2874b 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -37,7 +37,7 @@ static unsigned long damon_pa_core_addr(
 
 static void damon_pa_mkold(phys_addr_t paddr)
 {
-	struct folio *folio = damon_get_folio(PHYS_PFN(paddr));
+	struct folio *folio = damon_get_folio_incl_hugetlb(PHYS_PFN(paddr));
 
 	if (!folio)
 		return;
@@ -67,7 +67,7 @@ static void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
 
 static bool damon_pa_young(phys_addr_t paddr)
 {
-	struct folio *folio = damon_get_folio(PHYS_PFN(paddr));
+	struct folio *folio = damon_get_folio_incl_hugetlb(PHYS_PFN(paddr));
 	bool accessed;
 
 	if (!folio)
-- 
2.54.0

