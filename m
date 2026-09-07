Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DDA3CAE8D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798010; cv=none; b=UrxfckSwi44PXGGVFcxAH+xVM0XnaPUBqC6YkQAnZl4Y3iNI+xNK0Cbi3qWkAP4nt9EJSzZFCvXEIzduH89NkUXrGOUBEykgeEsMu3kD6q6BYLegQIrOzMUkGilHtXlwQNNHiSI0KAKb5ssNYoJwLUr1eyW2I8I7QDH3C8LlVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798010; c=relaxed/simple;
	bh=1XGBWTFhM0L2uu8mbsMWE7IDB6a9pxtBEz2fzhyTJss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1yTPymQpPQeWElP6z0tGhmMBN8N2KbxRXcyrVU1zyHuyX8Y1jsi60zEkRXwExseyfJtN1YEZAmmRfKxFP0a/daOxjb5w0iJjYvoogu8GO9rXO1i6IsznL2n5WrokSXB79dxlFzYbLE2o3vy5QUZaahTXRInOYRXSq0dqNuNx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YXtXGJJT; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YXtXGJJT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1XGBWTFhM0L2uu8mbsMWE7IDB6a9pxtBEz2fzhyTJss=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788797999; v=1; x=1789402799;
 b=YXtXGJJTXa9Nzv+/A+Jl8I1IhDWOI9xU1uzlz0oO5unI86Is2Jq1La58W7o8teXNSQXbAZfC
 xLs6/j4+392B/7ZZwJ4va7pxH6rBL3Tt1J+U6waDvnGft8IWekdacc1UNE1BfmqdYDCTKFq7BX7
 C7xv/zd/BJxMxjUyXSZn8yuk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5b486cf219189843;
	Mon, 07 Sep 2026 16:19:59 +0000
X-Mizu-Trace-ID: 5b486cf219189843
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: yosry@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	chengming.zhou@linux.dev,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com
Cc: kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] mm: zswap: don't fail a large-folio swapin whose range is not in zswap
Date: Mon,  7 Sep 2026 09:19:38 -0700
Message-ID: <20260907161938.1932355-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thp_swapin_suitable_orders() and shmem_swap_alloc_folio() sample
zswap_never_enabled() to decide whether a swapin may use a large folio.
zswap_load() samples the same one-way static key again once the read
reaches it.  Nothing serialises the two reads, and in between the task
allocates and pins a high-order folio, which can sleep.

If zswap is enabled for the first time in that window, a large folio that
was correctly permitted reaches zswap_load(), which rejects every large
folio with -EINVAL.  swap_read_folio() treats anything other than -ENOENT
as "zswap handled it" and skips the backing-device read, so the folio
comes back unlocked and not uptodate: SIGBUS for an anonymous fault, -EIO
for shmem.  The data is intact on the swap device - it was written there
before zswap was ever enabled - and the not-uptodate folio stays in the
swap cache, so every retry of the fault fails the same way.  With
panic_on_warn the WARN takes the machine down rather than the task.

Scan the range instead of rejecting the folio.  The caller has pinned
every slot before issuing the read, so zswap cannot start a store or a
writeback into the range and the scan is stable.  If nothing in the range
is in zswap it is all on the backing device: return -ENOENT and let
swap_read_folio() read it.

A range that does have a slot in zswap is still refused, because zswap
stores large folios as order-0 entries and cannot reconstruct one.  That
stays reachable - a slot shared with another task can be stored inside
the same window - and refusing is correct, since the alternative is
returning the stale device copy.  Report it as -EIO rather than -EINVAL:
the request is valid, zswap just cannot serve it.  The only caller
distinguishes -ENOENT from everything else, so that part is a
documentation fix.

Fixes: 242d12c98174 ("mm: support large folios swap-in for sync io devices")
Cc: stable@vger.kernel.org
Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/zswap.c | 58 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e3..fd36ac38e9a1e 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1571,6 +1571,32 @@ bool zswap_store(struct folio *folio)
 	return ret;
 }
 
+/**
+ * zswap_is_present() - is any slot in [entry, entry + nr) in zswap?
+ * @entry: base swap entry of the range
+ * @nr: number of contiguous slots to check
+ *
+ * Context: The caller must keep the range pinned, otherwise the answer can
+ * change under it.
+ * Return: true if at least one slot in the range is in zswap.
+ */
+static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
+{
+	pgoff_t offset = swp_offset(entry);
+	struct xarray *tree = swap_zswap_tree(entry);
+	unsigned long index = offset;
+
+	/*
+	 * A pinned range is at most SWAPFILE_CLUSTER slots and is aligned to
+	 * its own size, so one tree covers all of it and a single lookup is
+	 * enough. Scanning only part of the range would report a false
+	 * "absent" and let the caller read a stale copy from the device.
+	 */
+	BUILD_BUG_ON(SWAPFILE_CLUSTER > ZSWAP_ADDRESS_SPACE_PAGES);
+
+	return xa_find(tree, &index, offset + nr - 1, XA_PRESENT);
+}
+
 /**
  * zswap_load() - load a folio from zswap
  * @folio: folio to load
@@ -1578,15 +1604,12 @@ bool zswap_store(struct folio *folio)
  * Return: 0 on success, with the folio unlocked and marked up-to-date, or one
  * of the following error codes:
  *
- *  -EIO: if the swapped out content was in zswap, but could not be loaded
- *  into the page due to a decompression failure. The folio is unlocked, but
- *  NOT marked up-to-date, so that an IO error is emitted (e.g. do_swap_page()
- *  will SIGBUS).
- *
- *  -EINVAL: if the swapped out content was in zswap, but the page belongs
- *  to a large folio, which is not supported by zswap. The folio is unlocked,
- *  but NOT marked up-to-date, so that an IO error is emitted (e.g.
- *  do_swap_page() will SIGBUS).
+ *  -EIO: if the swapped out content was in zswap but could not be handed
+ *  back, either because decompression failed or because a slot in a
+ *  large-folio range is still in zswap and zswap cannot reconstruct a large
+ *  folio from per-page entries. The folio is unlocked, but NOT marked
+ *  up-to-date, so that an IO error is emitted (e.g. do_swap_page() will
+ *  SIGBUS).
  *
  *  -ENOENT: if the swapped out content was not in zswap. The folio remains
  *  locked on return.
@@ -1605,13 +1628,18 @@ int zswap_load(struct folio *folio)
 		return -ENOENT;
 
 	/*
-	 * Large folios should not be swapped in while zswap is being used, as
-	 * they are not properly handled. Zswap does not properly load large
-	 * folios, and a large folio may only be partially in zswap.
+	 * A large folio can legitimately reach zswap_load() with its whole
+	 * range on the backing device, so scan the range rather than rejecting
+	 * it outright. The caller has pinned every slot, so zswap cannot start
+	 * a store or a writeback into the range while we look.
 	 */
-	if (WARN_ON_ONCE(folio_test_large(folio))) {
-		folio_unlock(folio);
-		return -EINVAL;
+	if (folio_test_large(folio)) {
+		if (WARN_ON_ONCE(zswap_is_present(swp,
+						  folio_nr_pages(folio)))) {
+			folio_unlock(folio);
+			return -EIO;
+		}
+		return -ENOENT;
 	}
 
 	entry = xa_load(tree, offset);
-- 
2.53.0-Meta

