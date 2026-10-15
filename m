Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727F3F3293
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044355; cv=none; b=GUBroXo9dR5P5WuAkbFS+zDo1tzyLZyMbN8bQahes+fJmhAgSmFdGZ6DKNZbtGpODoygs9nFb5/9OmFRKp4j0KPEU1X23HyM6ljRo26r5Et2xmutV4lS0IScqMWQr8rREg8MJoNksnozEqR2iSNK3vHUQGZkGB+SWihqVsktXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044355; c=relaxed/simple;
	bh=J9GWURyfQ7XeSnnt8nEKld8twXqqnqqFys3Ywn2SEHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULFUfN1vvuLVk14B2oxOorxcqTFCLCziqpsQ3iGU5ar2x6/lGFB4C3c1sNq9UCA4Kv7rzqOGGtkFeFxqhTXiWiBWAf3kg4XpIppRV0Px8ozC6XtAzpPKB59E4tfNdfDqGViV1EqDL9EtIrsat3/78RO2CVBbQugEzXRC8vmu/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pz0W2hS8; arc=none smtp.client-ip=95.215.58.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pz0W2hS8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J9GWURyfQ7XeSnnt8nEKld8twXqqnqqFys3Ywn2SEHA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792044351; v=1; x=1792649151;
 b=Pz0W2hS8nvDz6r86Qr/w+qtm5riCqsoqESyJsPaFus9zoNw+CgAnSk7n5m8ep39Jh+jsdncT
 YWmenbBflNTDiSYE/yaaCi/uImqzilKFr8ITPahrBBw9ooNnTR/MBavBkB2Czkz1GeaoGP877JQ
 Q7gMIlS6U63CV/fU/i6VOzaM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ded6eec12efd0d3e;
	Thu, 15 Oct 2026 06:05:51 +0000
X-Mizu-Trace-ID: ded6eec12efd0d3e
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio that left the swap cache
Date: Thu, 15 Oct 2026 14:05:27 +0800
Message-ID: <20261015060528.302634-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiayuan Chen <jiayuan.chen@shopee.com>

swap_cache_get_folio() reads the folio from the swap table and takes a
reference with folio_try_get(), without any lock. If the folio is
removed from the swap cache and freed in between, and its memory gets
reused, folio_try_get() still succeeds and we return a page that has
nothing to do with the swap entry:

  CPU 0                                  CPU 1
  do_swap_page()
    swap_cache_get_folio()
      swp_tb = swap_table_get()
      folio = swp_tb_to_folio(swp_tb)
                                         madvise(MADV_DONTNEED)
                                           zap_nonpresent_ptes()
                                             swap_put_entries_direct()
                                               swap_put_entries_cluster()
                                                 __try_to_reclaim_swap()
                                                   swap_cache_del_folio()
                                                   folio_put()   <- freed
                                         page reused, e.g. as an anon
                                         folio of another task
      folio_try_get(folio)               <- succeeds
      return folio
    swap_update_readahead()              <- may clear PG_readahead on it
    folio_lock_or_retry()                <- locks it
    folio_matches_swap_entry() fails, unlock and put

filemap_get_entry() does the same lockless lookup for the page cache,
and after folio_try_get() it rechecks the xarray, because the folio may
have been freed and reused in between. swap_cache_get_folio() lost
that recheck when the swap cache moved to the swap table.

So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
takes the folio lock of someone else's page, before
folio_matches_swap_entry() finds out the folio is not ours.

Recheck the slot after folio_try_get() and retry if it no longer holds
this folio.

Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
https://sashiko.dev/#/patchset/20261014090821.227366-1-jiayuan.chen@linux.dev
---
 mm/swap_state.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index ebef568cd62e..d9e36c505398 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -92,17 +92,27 @@ void show_swap_cache_info(void)
  */
 struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
+	struct swap_cluster_info *ci = __swap_entry_to_cluster(entry);
+	unsigned int ci_off = swp_cluster_offset(entry);
 	unsigned long swp_tb;
 	struct folio *folio;
 
 	for (;;) {
-		swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
-					swp_cluster_offset(entry));
+		swp_tb = swap_table_get(ci, ci_off);
 		if (!swp_tb_is_folio(swp_tb))
 			return NULL;
 		folio = swp_tb_to_folio(swp_tb);
-		if (likely(folio_try_get(folio)))
+		if (!folio_try_get(folio))
+			continue;
+		/*
+		 * The folio may have been freed and its memory reused before
+		 * we got the reference. Make sure it is still in the slot.
+		 */
+		swp_tb = swap_table_get(ci, ci_off);
+		if (likely(swp_tb_is_folio(swp_tb) &&
+			   swp_tb_to_folio(swp_tb) == folio))
 			return folio;
+		folio_put(folio);
 	}
 
 	return NULL;
-- 
2.43.0

