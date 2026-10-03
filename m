Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40252E736F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989896; cv=none; b=KRElo7+2/0jkV15BqqymWYj7bQhNdmvQJptbwU89fAG3tHkuNjY380AMWsRhvCsiX/H+XndKO3aEp+ssOZV69QSMXyvB5xPT0TwdNwssupKWJ5db6aMDxJpNMBAig3PsjmcP6ZNxwip6Wt9b+uBpF/KwgYogoZpXRqXuGv2oe3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989896; c=relaxed/simple;
	bh=mROZdpueaKI6eMl7al8TgNb2Tz4+kYnbS0Lfp+BXgNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=kMp8lb2gYCBg+246T+JCjfE+jDMo401M5BwWxEBAyloak6AUEjQIt7OHPTV+Eb/8Q1Tq/g+jNorG1z5xLdeCLpLKn0OayQXYj0kGWhOri0nAXub9mVucJ4Q3rHh/T9K5LQL9Ms7UiQCYr7esrw1H3vH2T8Pp4GZQa9uNRuJmMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bb32ca3e7bf7924e;
	Sat, 03 Oct 2026 01:11:31 +0000
X-Mizu-Trace-ID: bb32ca3e7bf7924e
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	tj@kernel.org,
	mkoutny@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 2/6] mm, swap: do not charge zswap-backed xswap entries
Date: Sat,  3 Oct 2026 09:11:07 +0800
Message-ID: <20261003011111.1003090-3-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
References: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Nhat Pham <nphamcs@gmail.com>

An xswap entry occupies no physical swap space: its data lives in zswap
until a backend is taken.  It was nevertheless charged against
memcg->swap at allocation, as if it did.

Record the memcg at allocation but do not charge.  The charge is taken
when the entry acquires physical backing, and released with it.

memory.swap.current therefore counts only on-disk swap usage, not
zswap-backed xswap entries.  A cgroup can reclaim its anon memory with
memory.swap.max set to 0, provided zswap is allowed for it.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 8e52ace44de8..0310b474f08d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2147,7 +2147,12 @@ int folio_alloc_swap(struct folio *folio)
 	 * The owner is taken here, then charged and recorded.
 	 */
 	if (mem_cgroup_swap_get(folio, &swap_id)) {
-		if (unlikely(mem_cgroup_swap_charge(swap_id, size))) {
+		/*
+		 * An xswap entry has no physical swap yet, so only record the
+		 * owner here.  Its backing is charged when one is taken.
+		 */
+		if (!(__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP) &&
+		    unlikely(mem_cgroup_swap_charge(swap_id, size))) {
 			mem_cgroup_swap_put(swap_id, size);
 			swap_cache_del_folio(folio);
 			goto failed;
@@ -2298,10 +2303,15 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 	return ERR_PTR(-EIO);
 }
 
-/* Uncharge a batch of freed swap slots and drop their owner refs. */
-static void memcg_swap_free(unsigned short id, unsigned int nr)
+/*
+ * An xswap entry was not charged at allocation, so there is nothing to
+ * uncharge here and only the owner refs go.  Its backing, if any, was
+ * uncharged when it was released.
+ */
+static void memcg_swap_free(unsigned short id, unsigned int nr, bool is_xswap)
 {
-	mem_cgroup_swap_uncharge(id, nr);
+	if (!is_xswap)
+		mem_cgroup_swap_uncharge(id, nr);
 	mem_cgroup_swap_put(id, nr);
 }
 
@@ -2318,6 +2328,7 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 	unsigned int ci_off = ci_start, ci_end = ci_start + nr_pages;
 	unsigned long ci_head = cluster_offset(si, ci);
 	unsigned int batch_off = ci_off;
+	bool is_xswap = si->flags & SWP_XSWAP;
 
 	VM_WARN_ON(ci->count < nr_pages);
 
@@ -2347,14 +2358,14 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 		id_cur = __swap_cgroup_clear(ci, ci_off, 1);
 		if (batch_id != id_cur) {
 			if (batch_id)
-				memcg_swap_free(batch_id, ci_off - batch_off);
+				memcg_swap_free(batch_id, ci_off - batch_off, is_xswap);
 			batch_id = id_cur;
 			batch_off = ci_off;
 		}
 	} while (++ci_off < ci_end);
 
 	if (batch_id)
-		memcg_swap_free(batch_id, ci_off - batch_off);
+		memcg_swap_free(batch_id, ci_off - batch_off, is_xswap);
 
 	swap_range_free(si, ci_head + ci_start, nr_pages);
 	swap_cluster_assert_empty(ci, ci_start, nr_pages, false);
-- 
2.54.0

