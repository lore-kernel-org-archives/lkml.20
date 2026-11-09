Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203844;
	b=FK7775WIxFX56kOys+bsem7h5ddR6Bt1HO05Cf0XRwjg4jGhm37x2CeJfK79WghthIdp
	 /jaXnEAMx7C8BFeIwuQFzTXM/kCetLTZe8GICwWZHRzcbq8+o8B7UXWbzDSgfu3LMEqy7
	 ABXufpBiQyv9UmP5XNT4yhlGLGenyMD1sj/14FVANZHywtz3Dyutle6CjQ6umMP87+ppg
	 Mm+vxP7gCysYCL7zfJiaa+o09bhqFhw6pi89uhqGMv7SFqpkoLbArxr/Wa4PVFASIZqal
	 pNBKGnI8r2FJiQKzhjruJdbLhj/jE5JvKcYj+QMw2xB67xprTsenDiRdMpqLwzLDAfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203844;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=Hi4EIS3H0oOuvQqh1pA94yfvsmnVJtg6dWs/l28pJIk=;
	b=edccFiYlODimoQl5g/ek8p1+CQDagWBFQuRsBhixN5lxn1MtCS2VzFUfliQViibsHjEQ
	 2Pq0+qiH8UNacK9b2A2KCqUYW0IomHjmQiyKLZYiQjo5LeQ+NCtOt19dYFG1UTEgm2QBo
	 GlLbgE9A+6R+UmoeC/Ak8p6/iLjg1GPoGwtkPMZij7I30rk+MjkIXzN0jtj3vkMZ0Titb
	 xLegTDHXc6GjdISOhwWzTHbNhk5CEr6w9N3QANrreExIKeEoHMhOW6oKF8WNzAH+4DKVZ
	 hWA3lyPsXSjUrXE6NXay0J6Xi2z1NAshRtSMmuncFy3ZpS3a/yjvHKobtH4SO7VrOrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sf1q/AMO";
	arc=none smtp.remote-ip=91.218.175.214
Received: from mta0.migadu.com (out-214.mta0.migadu.com [91.218.175.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09F606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A09F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sf1q/AMO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yoFPRIeRtwPCWbg+M06U2YQyPT7ejs7j9hdcin6S+Mk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203841; v=1; x=1794808641;
 b=sf1q/AMO8dTP5YGrO+VGouhOQaVJQkJe91tUyVt6HGSZLrjKd+ZvYxWsnR4MQEpznsrPl+Wz
 APwvLx0t4i5L9zFZmFjf9CzsuHSEt1m+zzFjiGoSkTmYnr3rGkjY624J12/OWeABJCDlVXEoNPp
 3ZUqGOtVASLhbQsD+PDbnHOw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3fae3b4452c9649c;
	Mon, 09 Nov 2026 05:57:21 +0000
X-Mizu-Trace-ID: 3fae3b4452c9649c
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 16/19] mm, swap: prepare xswap_unmap_clusters for range shrinking
Date: Mon,  9 Nov 2026 13:54:52 +0800
Message-ID: <20261109055455.536925-17-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

Split xswap_unmap_clusters() into a locked helper and a wrapper that
takes xswap_lock. The shrink path already holds xswap_lock and must
call the helper directly.

This is a pure refactor. The existing path already falls back to
bounded batches when the range is too large for vm_area_unmap_pages();
the comments are expanded to explain why, and the cross-reference in
swap_alloc_fast() follows the new name.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index bc30ab42203c..097ed288b1ca 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1692,7 +1692,7 @@ static bool swap_alloc_fast(struct folio *folio)
 		 */
 		unsigned long mapped;
 
-		/* Pairs with the release store in xswap_unmap_clusters(). */
+		/* Pairs with the release store in xswap_unmap_clusters_locked(). */
 		mapped = smp_load_acquire(&si->nr_clusters_mapped);
 
 		if (offset / SWAPFILE_CLUSTER >= mapped) {
@@ -4318,8 +4318,8 @@ static unsigned long xswap_grow(struct swap_info_struct *si)
 }
 
 /* Caller must hold si->xswap_lock.  Cannot fail. */
-static void xswap_unmap_clusters(struct swap_info_struct *si,
-				 unsigned long start_idx, unsigned long nr)
+static void xswap_unmap_clusters_locked(struct swap_info_struct *si,
+					unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
 				   (size_t)start_idx * sizeof(struct swap_cluster_info);
@@ -4331,8 +4331,6 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 	unsigned int noreclaim_flags;
 	unsigned long npages, idx;
 
-	mutex_lock(&si->xswap_lock);
-
 	/*
 	 * Publish the smaller range before its memory goes away.  Readers
 	 * that use nr_clusters_mapped without xswap_lock pair with this
@@ -4347,7 +4345,6 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 		 * goes away with that cluster; publishing the smaller
 		 * cluster count is still correct.
 		 */
-		mutex_unlock(&si->xswap_lock);
 		return;
 	}
 
@@ -4362,6 +4359,11 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 
 	npages = (vm_end - vm_start) >> PAGE_SHIFT;
 
+	/*
+	 * vm_area_unmap_pages() refuses a range above totalram_pages() and
+	 * returns without clearing the PTEs.  Freeing those pages would
+	 * leave dangling mappings, so use the batch path for that case.
+	 */
 	if (npages <= totalram_pages()) {
 		/* Reclaim here would re-enter xswap_map_clusters() and its lock. */
 		noreclaim_flags = memalloc_noreclaim_save();
@@ -4371,11 +4373,11 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 		if (pages) {
 			xswap_unmap_range(si, vm_start, vm_end, pages, npages);
 			kvfree(pages);
-			goto out_unlock;
+			return;
 		}
 	}
 
-	/* No memory for the array, or too large: unmap in bounded batches. */
+	/* No memory for the array, or too large a range: unmap in batches. */
 	for (idx = start_idx; idx < start_idx + nr; idx += XSWAP_UNMAP_BATCH_CLUSTERS) {
 		unsigned long batch = min(start_idx + nr - idx,
 					  XSWAP_UNMAP_BATCH_CLUSTERS);
@@ -4390,7 +4392,13 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 			xswap_unmap_range(si, bstart, bend, batch_pages,
 					  ARRAY_SIZE(batch_pages));
 	}
-out_unlock:
+}
+
+static void xswap_unmap_clusters(struct swap_info_struct *si,
+				 unsigned long start_idx, unsigned long nr)
+{
+	mutex_lock(&si->xswap_lock);
+	xswap_unmap_clusters_locked(si, start_idx, nr);
 	mutex_unlock(&si->xswap_lock);
 }
 
-- 
2.54.0

