Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203777;
	b=JUkTPWo8vOAiR+pV1X04gmyHaKH23t09wITplLhJiSkKh+Dm9kLDPyR5EZU7Eoakxu1A
	 yp10L1jE+dDQmj84ogmxhV+gJsfuAKVSxmznJu9DYoOaZxwXckkPNN8RuzzlMNB1M5PtQ
	 4cKaR9lwLMYuF+LAKAkTPLs1TZMdnA1ID2dWRNvTsxYBBMhkv/2eOIJVICPRqeCsmRTY0
	 /2ZqFlt78wEmXUs1OlLZlTa7UDYlDbFawV18CYgOZj6+3Fuu5sta+QLtrQIn3TMF9kdjQ
	 WhLT7E6Im/7Kl4jAeRVWSVnzNm/kBGXfUKkUyBLN7gA5B3LVcjyEPrMbL2/h992gH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203777;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=sCJwY+DdwqZxBCMRTX1FWlqdIowtf+5OPns6jt+c8gE=;
	b=tEAdYQTME+Tj8dEc1SJ69XcjDQNJJUJZaJQIZC+UEJDoY12X4kL6sIGbmGOjUxgW97ub
	 mZOX44zqgyvRXRA3jolQQx3ccev6J+IIwYNidgHBumC7mB88tf2jQvSxsiLT8pNb37IIV
	 NlO5lzCy+wUhnabyWB/tb7Lk3MAe4c8vavtEA6fRet1v/y11L5utJOVZbqFrGgI2MA162
	 T41ePDD5f71Pv7Eeo1YdR0xvn4e+lPG5DMqQxPwxY7jnNiZBTk1FR1HGRInxzmF/S6NLo
	 0Tr8k3vaoALqH6KtNtYlnZWGkoNT4tn8GBzSOVaoASL3W1EQpiC/aRjRr59SEfGvS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMJAylua;
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMJAylua
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uhVAgDjfU+twOJuyAfnvA+TpcEkp7IgyeJ9VbEIlhAo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203773; v=1; x=1794808573;
 b=CMJAylua15Y3TZLDlI7BENtmT9Phf0JFsUEo0hwxPbsEjGHDkPjuwn/wu4pfd+hp8q/ZRDW9
 X0jELW4y865Jaih/YqRp0uy55hfUk/z87sTO8hJOPqUmvMHpUQhDXilaXxsaNwCMd56kYY7w1sM
 8NIC0VbCvonKduRpR+nQMLmk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d96a14a4a47fae48;
	Mon, 09 Nov 2026 05:56:13 +0000
X-Mizu-Trace-ID: d96a14a4a47fae48
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
Subject: [PATCH v5 05/19] mm, swap: widen swap_info_struct max/pages to unsigned long
Date: Mon,  9 Nov 2026 13:54:41 +0800
Message-ID: <20261109055455.536925-6-baoquan.he@linux.dev>
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

si->max and si->pages are unsigned int. With 4 KiB pages, this limits
an xswap device to 16 TB. xswap may need a larger address space, so
change both fields to unsigned long.

Several places still use unsigned int for offsets and indexes. Widen
them as well:

- the return value of cluster_offset() and the cluster scan helpers;
- the allocation offsets in cluster_alloc_swap_entry() and
  swap_alloc_fast();
- the indexes in find_next_to_unuse() and try_to_unuse().

Also change the related print formats from %u to %lu.

A real swap device is still limited by swap_header.info.last_page,
which is __u32. So this only widens the xswap address space. The old
overflow clamp in read_swap_header() is no longer needed; the header
check still limits real devices.

count_swap_pages() returns unsigned int and is only used by
hibernation. Hibernation never selects an xswap device. If that ever
changes, WARN and return 0 instead of silently truncating the value.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  4 +--
 mm/swapfile.c        | 59 +++++++++++++++++++++++---------------------
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 382a578140b5..569989856c25 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -240,7 +240,7 @@ struct swap_info_struct {
 	signed short	prio;		/* swap priority of this type */
 	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* size of this swap device */
+	unsigned long	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for cluster_info */
@@ -254,7 +254,7 @@ struct swap_info_struct {
 					/* list of cluster that contains at least one free slot */
 	struct list_head frag_clusters[SWAP_NR_ORDERS];
 					/* list of cluster that are fragmented or contented */
-	unsigned int pages;		/* total of usable pages of swap */
+	unsigned long pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
 	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 00c7b398bafe..83aaf00b75d3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -429,10 +429,10 @@ static inline unsigned int cluster_index(struct swap_info_struct *si,
 	return ci - si->cluster_info;
 }
 
-static inline unsigned int cluster_offset(struct swap_info_struct *si,
-					  struct swap_cluster_info *ci)
+static inline unsigned long cluster_offset(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci)
 {
-	return cluster_index(si, ci) * SWAPFILE_CLUSTER;
+	return (unsigned long)cluster_index(si, ci) * SWAPFILE_CLUSTER;
 }
 
 static void swap_cluster_free_table_folio_rcu_cb(struct rcu_head *head)
@@ -836,7 +836,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	/* si->max may got shrunk by swap swap_activate() */
 	if (offset >= si->max && !mask) {
-		pr_debug("Ignoring bad slot %u (max: %u)\n", offset, si->max);
+		pr_debug("Ignoring bad slot %u (max: %lu)\n", offset, si->max);
 		return 0;
 	}
 	/*
@@ -1002,11 +1002,12 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
-static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
-					    struct swap_cluster_info *ci,
-					    struct folio *folio, unsigned long offset)
+static unsigned long alloc_swap_scan_cluster(struct swap_info_struct *si,
+					     struct swap_cluster_info *ci,
+					     struct folio *folio,
+					     unsigned long offset)
 {
-	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
 	unsigned long end = start + SWAPFILE_CLUSTER;
@@ -1053,12 +1054,12 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	return found;
 }
 
-static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
-					 struct list_head *list,
-					 struct folio *folio,
-					 bool scan_all)
+static unsigned long alloc_swap_scan_list(struct swap_info_struct *si,
+					  struct list_head *list,
+					  struct folio *folio,
+					  bool scan_all)
 {
-	unsigned int found = SWAP_ENTRY_INVALID;
+	unsigned long found = SWAP_ENTRY_INVALID;
 
 	do {
 		struct swap_cluster_info *ci = isolate_lock_cluster(si, list);
@@ -1141,7 +1142,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 {
 	struct swap_cluster_info *ci;
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
-	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -1418,7 +1419,7 @@ static bool swap_alloc_fast(struct folio *folio)
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
 	struct swap_info_struct *si;
-	unsigned int offset;
+	unsigned long offset;
 
 	/*
 	 * Once allocated, swap_info_struct will never be completely freed,
@@ -2509,9 +2510,15 @@ unsigned int count_swap_pages(int type, int free)
 
 		spin_lock(&sis->lock);
 		if (sis->flags & SWP_WRITEOK) {
-			n = sis->pages;
-			if (free)
-				n -= swap_usage_in_pages(sis);
+			/* Hibernation only; it never selects an xswap device. */
+			if (unlikely(sis->flags & SWP_XSWAP)) {
+				WARN_ON_ONCE(1);
+				n = 0;
+			} else {
+				n = sis->pages;
+				if (free)
+					n -= swap_usage_in_pages(sis);
+			}
 		}
 		spin_unlock(&sis->lock);
 	}
@@ -2832,8 +2839,8 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
-static unsigned int find_next_to_unuse(struct swap_info_struct *si,
-					unsigned int prev)
+static unsigned long find_next_to_unuse(struct swap_info_struct *si,
+					unsigned long prev)
 {
 	struct swap_cluster_info *ci;
 	unsigned long i, cluster_end, end;
@@ -2903,7 +2910,7 @@ static int try_to_unuse(unsigned int type)
 	struct swap_info_struct *si = swap_info[type];
 	struct folio *folio;
 	swp_entry_t entry;
-	unsigned int i;
+	unsigned long i;
 
 	if (!swap_usage_in_pages(si))
 		goto success;
@@ -3722,12 +3729,8 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 		pr_warn("Truncating oversized swap area, only using %luk out of %luk\n",
 			K(maxpages), K(last_page));
 	}
-	if (maxpages > last_page) {
+	if (maxpages > last_page)
 		maxpages = last_page + 1;
-		/* p->max is an unsigned int: don't overflow it */
-		if ((unsigned int)maxpages == 0)
-			maxpages = UINT_MAX;
-	}
 
 	if (!maxpages)
 		return 0;
@@ -4209,7 +4212,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 	if (si->pages != si->max - 1) {
-		pr_err("swap:%u != (max:%u - 1)\n", si->pages, si->max);
+		pr_err("swap:%lu != (max:%lu - 1)\n", si->pages, si->max);
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
@@ -4300,7 +4303,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	/* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap device */
 	enable_swap_info(si);
 
-	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
+	pr_info("Adding %luk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
 		K((unsigned long long)span),
 		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
-- 
2.54.0

