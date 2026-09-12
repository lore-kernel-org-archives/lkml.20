Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4D3515CB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789184717; cv=none; b=lyVh8/r6fGBzBNZsW8V4/xKblnisfRVNMfRIzfgZxcOeYRoVRU++vhg+n1U0BR5UlWALDTIutUsEsHeRNHCMZBuHCKpWGDA2zPTkqwrVzbqlLgaf9pG0rpWeGZqlLIbRxLxfKGS4Gi0M3s6Nozq+IWjojRJNsse69w6PAwjeSnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789184717; c=relaxed/simple;
	bh=bIwuxMyUCAhuNfIWh8WUFWnZ9Amsu+HOG8fMNc00tO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLEs7SuIH+Md+CcwnKYzWDdsL+Ua7fib1ToH0zyyzztriMXbpAoyAXe6w1+iw57+bokWdaueDMYvQKWfID/NVFUfK9UIE1ytoIYDCLyS6c6Lxo+COUzWna4pqQ16S324FQI+bJt4h4ZFuk7OpT2gciFTKQkKr3d7hrgV5akhs2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gBvc+pXu; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gBvc+pXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gj
	VmVH5S4Dxs6ChmY6XlrEUo+G/7AHP0A242MZDHi70=; b=gBvc+pXuOrnoiSmTtG
	kzAIlnlNC6z/4AEO4NWd/lPf1aeQ43IQat+MWgWOovmemn2RZx41dH3wHEUhbeNI
	Lhaa4z31Fl6fTlhQV3dazHdB4CZVmJVqUVMFib11uIrX7sUg2Px1gifFKoReKON9
	UE8+EhDJGyRfzfzDV0KZnToDg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnyxSOyqRqs6a7AA--.33047S2;
	Sat, 12 Sep 2026 11:44:15 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2] mm/migrate_device: consolidate compound folio handling
Date: Sat, 12 Sep 2026 12:44:14 +0900
Message-ID: <20260912034414.1943342-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnyxSOyqRqs6a7AA--.33047S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1UJrWfAr43GFyDAr1fJFb_yoW7Xr13pF
	40g3W7trZrWry2kw13Zr18Ar13ur93Xa1fKFZrGrn2kFs8JFy5uw1Iq3Z5XF45W397XFyx
	ZFW7tFy7Z3WDGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RGa+WqkypGQdgAA3o

Commit dc41e961a269 ("mm/migrate_device: avoid out-of-bounds writes for
compound folios") added handling for compound folios that do not fit in
the remaining PFN array.

migrate_device_range() and migrate_device_pfns() duplicate the logic for
locking device PFNs, encoding compound folios, and handling this boundary
condition.

A compound folio cannot be represented partially for migration. Warn when
one does not fit in the remaining PFN array, while retaining the existing
defensive handling: release any lock and reference acquired for the
current folio, clear the remaining entries, and stop collecting.

Move the shared collection and encoding logic into a helper so both
interfaces handle compound folios consistently. Also use memset() for
the compound-folio tail entries instead of open-coding the clearing loop.

Document that an encountered compound folio must fit entirely in the
remaining range or PFN array.

Link: https://lore.kernel.org/r/c99ca53a-73ef-4a0c-8738-eba1cc89bea2@kernel.org
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Hui Su <sh_def@163.com>
---

Notes:
    Changes in v2:
    - Fix the helper parameter indentation and keep the declaration to two
      lines, as suggested by David Hildenbrand.

 mm/migrate_device.c | 89 ++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..ace543fd6946 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1392,6 +1392,38 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
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
+	if (WARN_ON_ONCE(nr > remaining)) {
+		if (*src_pfn & MIGRATE_PFN_MIGRATE) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		memset(src_pfn, 0, remaining * sizeof(*src_pfn));
+		return 0;
+	}
+
+	if (nr > 1) {
+		*src_pfn |= MIGRATE_PFN_COMPOUND;
+		memset(src_pfn + 1, 0, (nr - 1) * sizeof(*src_pfn));
+	}
+
+	return nr;
+}
+
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
  * @src_pfns: array large enough to hold migrating source device private pfns.
@@ -1410,35 +1442,22 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
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
@@ -1454,33 +1473,21 @@ EXPORT_SYMBOL(migrate_device_range);
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

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0

