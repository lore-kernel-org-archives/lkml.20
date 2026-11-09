Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203858;
	b=xRZdrxU9TYmszX1NGBup7V+lJHbCbDhdgFhlrg5lYyTYzon9SJ/6ryovWSD4PwEMSGLs
	 hd8oSdThjGj09ciWASQFzGGU7QN9UgXxhqU2wEnZ1vEoLAQXRS7Oc1y5As/bZ8Mb+LQrF
	 NbWWpMpypom8z1pLISLKW9GADpnkcT+7MDxzhfZDwKn70dGe5KmiVju6yBeluhotd9V1K
	 mAELDB35+WWuOUMXP9Fv0iayg5+zZKNu0Gd29B0ioVLzRSKgNjEs/5661GaZKLzf9cDkL
	 82DnbK6T9pIpqB6Tqp0xQMpsENPsrqLf4ahg8VSBji/+VeGLxTTId4gtAJc9Culb7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203858;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=BH70BivN2GD0Klusjco0YU6q3vc8ILOcQiEUMI9oss8=;
	b=Tb1BnXZ3cdhD/li42YEbvpQSh9/7YRJbvb+YBTKEBtYqWKTNlev+Og9kLCZjC5i743ib
	 T6YEF2C3e61l2KzcyGiiNCtB1dp679kSFfAmlekGSqfkAARG2EIEZh5LE8UXHPEMFtrf0
	 2hUbRqCUuZ6tBW4TnHV1Hy2s7obyqDqMj67ZLTfJJ4SnT0+M3C/2sc26uVROr/fDORNHp
	 KhoNNwpjH/9JHXQkKx9G68dwe0bUdnoIN8KvFOU8i+QhPXAqfe2FsgBdW2dsMleXym6p2
	 a1dHKo1q0ARet24GzGHKfhUuhwKcZqllwt7/JMDYVAQpez1LhL0dlX2SVasnKhM/DTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wgpy0rlx;
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57949606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57949606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wgpy0rlx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uVlH/XHtAK1ioth7PG9F5K6yxSpZvO+5NShBYbVvhrM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203855; v=1; x=1794808655;
 b=wgpy0rlxBY6e+IZWaoZIW4ozpKOvTFuebcNV2pV7IvwteCpy2jsJvnOELBgtZB8BlONknUbX
 7YCrp8S9kAUDxZ7GNnnLT/4XzoJIp9GOIp192zezQ1IGpZ98VJgSNxJWFkIJOFAZtrDhcaa3M5t
 BY9uH+YULhknLDAD4IhE1cxs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id be7ce9f4d596a11c;
	Mon, 09 Nov 2026 05:57:35 +0000
X-Mizu-Trace-ID: be7ce9f4d596a11c
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
Subject: [PATCH v5 18/19] mm, swap: do not give an xswap slot to a cgroup that cannot zswap
Date: Mon,  9 Nov 2026 13:54:54 +0800
Message-ID: <20261109055455.536925-19-baoquan.he@linux.dev>
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

At this point, an xswap slot holds only a zswap-backed page. It has no
storage of its own. If the folio's cgroup cannot take another zswap
page, giving it an xswap slot is wasted: zswap refuses the page and the
slot cannot hold it.

Skip xswap devices when the cgroup cannot zswap, and try a physical swap
device instead.

The check is obj_cgroup_may_zswap(). It is false when memory.zswap.max
is 0 anywhere in the hierarchy, or when the hierarchy has already
reached that limit. So the routing follows how much the cgroup has in
zswap, not only how it is configured. zswap_store() uses the same check,
but it first tries to shrink the memcg. The allocation-time check does
not try to shrink, so it is stricter.

Count active xswap devices, and do the cgroup lookup only when one
exists. Update the counter when the device is enabled, before a full
device can skip the avail-list insert, so a full device is still counted.

A device can appear between that read and the allocation. So if the
slot the allocator picked is on an xswap device, check the cgroup
again; when it cannot zswap, drop the slot and retry without xswap
devices.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2e5383036fdc..efb48ef71611 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -326,6 +326,8 @@ static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 atomic_t nr_real_swapfiles;
+/* Active xswap devices, as in nr_real_swapfiles. */
+static atomic_t nr_xswap_files;
 /*
  * Some modules use swappable objects and may try to swap them out under
  * memory pressure (via the shrinker). Before doing so, they may wish to
@@ -1519,7 +1521,9 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 		lockdep_assert_held(&si->lock);
 		si->flags &= ~SWP_WRITEOK;
 		/* Count active devices, not merely those on the avail list. */
-		if (!(si->flags & SWP_XSWAP))
+		if (si->flags & SWP_XSWAP)
+			atomic_sub(1, &nr_xswap_files);
+		else
 			atomic_sub(1, &nr_real_swapfiles);
 		atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
 	} else {
@@ -1558,7 +1562,9 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
 		 * Count the device here, not after adding it to the list: a
 		 * full device is still active and skips the add below.
 		 */
-		if (!(si->flags & SWP_XSWAP))
+		if (si->flags & SWP_XSWAP)
+			atomic_add(1, &nr_xswap_files);
+		else
 			atomic_add(1, &nr_real_swapfiles);
 	} else {
 		if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
@@ -1682,7 +1688,7 @@ static bool get_swap_device_info(struct swap_info_struct *si)
  * Fast path try to get swap entries with specified order from current
  * CPU's swap entry pool (a cluster).
  */
-static bool swap_alloc_fast(struct folio *folio)
+static bool swap_alloc_fast(struct folio *folio, bool may_zswap)
 {
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
@@ -1722,6 +1728,11 @@ static bool swap_alloc_fast(struct folio *folio)
 		}
 	}
 #endif
+	if (!may_zswap && (si->flags & SWP_XSWAP)) {
+		put_swap_device(si);
+		rcu_read_unlock();
+		return false;
+	}
 
 	ci = swap_cluster_lock(si, offset);
 	if (cluster_is_usable(ci, order)) {
@@ -1738,13 +1749,19 @@ static bool swap_alloc_fast(struct folio *folio)
 }
 
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_slow(struct folio *folio, bool may_zswap)
 {
 	struct swap_info_struct *si, *next;
 
 	spin_lock(&swap_avail_lock);
 start_over:
 	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
+		/*
+		 * Do not rotate a skipped device: the walk follows the
+		 * rotation and would spin forever.
+		 */
+		if (!may_zswap && (si->flags & SWP_XSWAP))
+			continue;
 		/* Rotate the device and switch to a new cluster */
 		plist_requeue(&si->avail_list, &swap_avail_head);
 		spin_unlock(&swap_avail_lock);
@@ -2067,6 +2084,17 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 	return err;
 }
 
+/* Can the folio's cgroup take another zswap page? */
+static bool folio_may_zswap(struct folio *folio)
+{
+	struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
+	bool may_zswap = !objcg || obj_cgroup_may_zswap(objcg);
+
+	if (objcg)
+		obj_cgroup_put(objcg);
+	return may_zswap;
+}
+
 /**
  * folio_alloc_swap - allocate swap space for a folio
  * @folio: folio we want to move to swap
@@ -2083,10 +2111,23 @@ int folio_alloc_swap(struct folio *folio)
 {
 	unsigned int order = folio_order(folio);
 	unsigned int size = 1 << order;
+	/* True unless the gate below finds an xswap device to route away from. */
+	bool may_zswap = true;
+	bool zswap_checked = false;
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
 
+	/*
+	 * A folio that zswap will not take must not get an xswap slot. With
+	 * no xswap device to route away from, skip the lookup; a device that
+	 * appears before we pick one is handled after the allocation.
+	 */
+	if (atomic_read(&nr_xswap_files)) {
+		may_zswap = folio_may_zswap(folio);
+		zswap_checked = true;
+	}
+
 	if (order) {
 		/*
 		 * Reject large allocation when THP_SWAP is disabled. Check below
@@ -2107,8 +2148,8 @@ int folio_alloc_swap(struct folio *folio)
 
 again:
 	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
+	if (!swap_alloc_fast(folio, may_zswap))
+		swap_alloc_slow(folio, may_zswap);
 	local_unlock(&percpu_swap_cluster.lock);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
@@ -2116,6 +2157,22 @@ int folio_alloc_swap(struct folio *folio)
 			goto again;
 	}
 
+	/*
+	 * The xswap gate was skipped because there was no device when we
+	 * looked. One may have appeared since; check before keeping the
+	 * xswap slot the allocator may have picked.
+	 */
+	if (unlikely(!zswap_checked && atomic_read(&nr_xswap_files) &&
+		     folio_test_swapcache(folio) &&
+		     (__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP))) {
+		zswap_checked = true;
+		may_zswap = folio_may_zswap(folio);
+		if (!may_zswap) {
+			swap_cache_del_folio(folio);
+			goto again;
+		}
+	}
+
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
 	if (unlikely(mem_cgroup_try_charge_swap(folio))) {
 		swap_cache_del_folio(folio);
-- 
2.54.0

