Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF649B210
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162532; cv=none; b=W5IA526dnczObRDUgFVPxjskq5NIEhIsPboorL5GGLt21JpgYZNVWe/Pf+gqjbO0cwJg/8JC8TFHDvZaJnfsTxg42x/KANqqJWUBR5RWzRUn1JdDFWNxwmCiIIWXLJ0WtglG3WUsjIpX1yzHyOq5CfJWVMDfq5E5sgCn2zNW/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162532; c=relaxed/simple;
	bh=eQA5R35ET4k5nwXSvrrrcgFh4IxA2fZ4brvzW6pwn5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EmiB+wHXUjFESv43suTruWVe7zNkMugvULi4zmMwlqukVIHziHZb9XG+wX3aXYto/4yggu2PjC0kAHjICT2mSrw1BIlcm2SU5cc9Etmq9CihG1PmK+ot3YWfNcs1UX4GAPZslF1rIYRgnbagof2fgp5CHbVVS9Llfr4v1pzOpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ahMOEPjT; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ahMOEPjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=D5
	9ll9Cqgn4VIwMdD2H3ggT0fglPHG03tnHtRxDpyso=; b=ahMOEPjT1wiz58wN6i
	GaFqKzCkFYIdEG3J876IqJUV0WHafDPhuqpRjlNegc54ua3WCl462yA/uYD7Tc34
	9AQBYeJgj2Rlwbj52x7ZYHjnazKwJGdF33PmPc/N/TXq3vDWrqep0lrnKBpHGDfx
	L0mH/jcBmGvqB7bnNsBo6F19M=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXn08JtrNqnlFPAQ--.25126S2;
	Wed, 23 Sep 2026 19:20:42 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Hui Su <sh_def@163.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm/migrate_device: consolidate compound folio handling
Date: Wed, 23 Sep 2026 20:20:41 +0900
Message-ID: <20260923112041.2103427-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXn08JtrNqnlFPAQ--.25126S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFy8CrW3Cry3Aw13KFyrXrb_yoW7uw4kpF
	40g3WDtrZrWryjkw13Zr48Ar13urZ3Xa1fKFZrGwna9Fs8JFy3uw1Iq3Z8XFs8u397AFyx
	Zay7ta4xu3WDJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6Qs3lmqztgsF1AAA32

Commit dc41e961a269 ("mm/migrate_device: avoid out-of-bounds writes for
compound folios") added handling for compound folios that do not fit in
the remaining PFN array.

migrate_device_range() and migrate_device_pfns() duplicate the logic for
locking device PFNs, encoding compound folios, and handling this boundary
condition.

A compound folio cannot be represented partially for migration. Use
VM_WARN_ON_ONCE() when one does not fit in the remaining PFN array, while
retaining the existing defensive handling: release any lock and reference
acquired for the current folio, clear the remaining entries, and stop
collecting.

Move the shared collection and encoding logic into a helper so both
interfaces handle compound folios consistently. Also use memset() for the
compound-folio tail entries instead of open-coding the clearing loop.

If locking a folio fails, leave its source entry zero while still consuming
and clearing the slots belonging to the whole folio. This prevents a tail
page from being treated as a new source PFN by the caller's next iteration.

Document that an encountered compound folio must fit entirely in the
remaining range or PFN array.

Link: https://lore.kernel.org/r/c99ca53a-73ef-4a0c-8738-eba1cc89bea2@kernel.org
Suggested-by: David Hildenbrand <david@kernel.org>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Hui Su <sh_def@163.com>
---

Changes in v3:
- Keep the source entry zero when migrate_device_pfn_lock() fails instead
  of setting MIGRATE_PFN_COMPOUND, while still consuming and clearing all
  slots belonging to the compound folio.
- Use VM_WARN_ON_ONCE() for the truncated compound-folio invariant while
  keeping the defensive clear-and-stop path independent of CONFIG_DEBUG_VM,
  as suggested by Balbir Singh.

Changes in v2:
- Fix the helper parameter indentation and keep the declaration to two
  lines, as suggested by David Hildenbrand.

 mm/migrate_device.c | 91 +++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..68b787bdc8be 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1392,6 +1392,40 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 }
 
+/*
+ * Collect a device folio into the page-granular PFN array.
+ *
+ * Return the number of entries consumed, or 0 if the folio does not fit in
+ * the remaining array.
+ */
+static unsigned int migrate_device_collect_folio(unsigned long *src_pfn,
+		unsigned long pfn, unsigned long remaining)
+{
+	struct folio *folio = page_folio(pfn_to_page(pfn));
+	unsigned int nr;
+
+	*src_pfn = migrate_device_pfn_lock(pfn);
+	nr = folio_nr_pages(folio);
+
+	VM_WARN_ON_ONCE(nr > remaining);
+	if (nr > remaining) {
+		if (*src_pfn & MIGRATE_PFN_MIGRATE) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		memset(src_pfn, 0, remaining * sizeof(*src_pfn));
+		return 0;
+	}
+
+	if (nr > 1) {
+		if (*src_pfn)
+			*src_pfn |= MIGRATE_PFN_COMPOUND;
+		memset(src_pfn + 1, 0, (nr - 1) * sizeof(*src_pfn));
+	}
+
+	return nr;
+}
+
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
  * @src_pfns: array large enough to hold migrating source device private pfns.
@@ -1410,35 +1444,22 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * migrating pages that aren't free before unmapping them. Drivers may then
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
+ *
+ * A compound folio must fit entirely in the remaining range.
  */
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, pfn;
 
 	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		unsigned int nr;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
-		nr = folio_nr_pages(folio);
-		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				folio_unlock(folio);
-				folio_put(folio);
-			}
-			memset(&src_pfns[i], 0,
-			       (npages - i) * sizeof(*src_pfns));
+		nr = migrate_device_collect_folio(&src_pfns[i], pfn, npages - i);
+		if (!nr)
 			break;
-		}
-		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
-			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
-			i += j - 1;
-			pfn += j - 1;
-		}
+		i += nr - 1;
+		pfn += nr - 1;
 	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
@@ -1454,33 +1475,21 @@ EXPORT_SYMBOL(migrate_device_range);
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-populated
  * array of device pages to migrate.
+ *
+ * A compound folio must fit entirely in the remaining PFN array.
  */
 int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 {
-	unsigned long i, j;
+	unsigned long i;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
-		struct folio *folio = page_folio(page);
-		unsigned int nr = 1;
+		unsigned long pfn = src_pfns[i];
+		unsigned int nr;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
-		nr = folio_nr_pages(folio);
-		if (nr > npages - i) {
-			if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
-				folio_unlock(folio);
-				folio_put(folio);
-			}
-			memset(&src_pfns[i], 0,
-			       (npages - i) * sizeof(*src_pfns));
+		nr = migrate_device_collect_folio(&src_pfns[i], pfn, npages - i);
+		if (!nr)
 			break;
-		}
-		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
-			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
-			i += j - 1;
-		}
+		i += nr - 1;
 	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.55.0

