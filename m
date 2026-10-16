Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49D26C385
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133974; cv=none; b=qvhpMBDS3HrXWj025BQ1zDaHr7fACmc5ZLLDIlqj9AY+/hhivCdhDiysD+0i0HNEuN0f7eZ1sDuN6EYTSN2oOAunTVwkUYgAemFnIZUlZqlDOiv7320ChMMZzjqpwVUT72QOS7j0c6Dh7RtXh62vErDXgcmlF96BPun8cz+8iTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133974; c=relaxed/simple;
	bh=YBk76f/Ysfi12pI6VBVZpEi5qvewc/wR/esNF7jDIek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klTh80msqtmpJ/ZHTa7dV2UYQyAGixs+nt/wxXBVZyQpUU48/DVY/7pGPr4VVuoh/QELDgf4T8nTFXbFCl8LHlc3LTZ4Y4PWa/qKXvYwDJVzF49rlegMb6m13GkRuKOKSXqnNFS27Byjj4rv1tU6qW5/QVcejE5AO7UYEP1vHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PJIEvhgd; arc=none smtp.client-ip=95.215.58.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PJIEvhgd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YBk76f/Ysfi12pI6VBVZpEi5qvewc/wR/esNF7jDIek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792133969; v=1; x=1792738769;
 b=PJIEvhgdnZ0e7C84i83ESLZLLPkWdSIND9qyqkOJz7Z+T7Yf9+cgAP9qohOAKm/cOdEKacAP
 FY73ShLvzZf6gqjzguDaWodXkl5GEqM4VUhLudHSoQl6gT1J9R4GBbvjsCtnF+mO0hEsbRc6NGz
 R0Y6mm7+DfPpVptzQ0kE0i9o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1616bc7e3c73b510;
	Fri, 16 Oct 2026 06:59:29 +0000
X-Mizu-Trace-ID: 1616bc7e3c73b510
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	kas@kernel.org,
	jack@suse.cz,
	djwong@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
	ngocthang2710.1999@gmail.com,
	willy@infradead.org,
	rppt@kernel.org,
	ljs@kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in collapse_file()
Date: Fri, 16 Oct 2026 14:59:20 +0800
Message-ID: <20261016065920.4153-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_file() can end up calling page_cache_sync_readahead() with
source folios from earlier in the range still locked. If truncate already
holds mapping->invalidate_lock exclusively and is waiting for one of
those folios, readahead blocks on the same invalidate_lock and neither
side can make progress.

Do readahead in a separate pass before we start holding source folios
locked for collapse. Keep page_cache_sync_readahead() and its existing
policy, and drop each folio's lock and reference after checking that it
is uptodate. If truncate or reclaim removes a folio between the two
passes, roll back instead of doing readahead again with source folios
locked.

Shmem handles swapin and fallocated folios through shmem_get_folio()
without taking mapping->invalidate_lock, so it isn't affected by this
lock inversion.

Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
happy to take this over.

Some older stable trees lack the folio infrastructure used here, and the
code will differ for each stable tree, so each backport will need quite a
bit of rework and its own review. I'm not sure whether to Cc stable here.
Once we agree on the fix, I'll send a separate backport for each maintained
stable tree except 5.10, which isn't affected.

v2 -> v3:
 - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
   a preparation pass using page_cache_sync_readahead().
 - Roll back on a new page cache miss during collapse.
 - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/

 mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index ef5cd6fda34f..b3f67617caf0 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	new_folio->index = start;
 	new_folio->mapping = mapping;
 
+	if (!is_shmem) {
+		/*
+		 * Populate the range before accumulating locked source folios:
+		 * readahead may block on invalidate_lock.
+		 */
+		for (index = start; index < end;) {
+			folio = filemap_lock_folio(mapping, index);
+			if (IS_ERR(folio)) {
+				page_cache_sync_readahead(mapping, &file->f_ra,
+							  file, index, end - index);
+				folio = filemap_lock_folio(mapping, index);
+				if (IS_ERR(folio)) {
+					result = SCAN_FAIL;
+					goto rollback;
+				}
+			}
+			if (!folio_test_uptodate(folio))
+				result = SCAN_FAIL;
+			index = folio_next_index(folio);
+			folio_unlock(folio);
+			folio_put(folio);
+			if (result != SCAN_SUCCEED)
+				goto rollback;
+		}
+		/* drain lru cache to help folio_isolate_lru() */
+		lru_add_drain();
+	}
+
 	/*
 	 * Ensure we have slots for all the pages in the range.  This is
 	 * almost certainly a no-op because most of the pages must be present
@@ -2320,17 +2348,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 			}
 		} else {	/* !is_shmem */
 			if (!folio || xa_is_value(folio)) {
-				xas_unlock_irq(&xas);
-				page_cache_sync_readahead(mapping, &file->f_ra,
-							  file, index,
-							  end - index);
-				/* drain lru cache to help folio_isolate_lru() */
-				lru_add_drain();
-				folio = filemap_lock_folio(mapping, index);
-				if (IS_ERR(folio)) {
-					result = SCAN_FAIL;
-					goto xa_unlocked;
-				}
+				/* The range changed after the preparation pass. */
+				result = SCAN_PAGE_LOCK;
+				goto xa_locked;
 			} else if (folio_test_dirty(folio)) {
 				/*
 				 * This page is dirty because it hasn't
-- 
2.49.0

