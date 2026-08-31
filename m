Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F7438FE6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183388; cv=none; b=S5vAubHiQ84E6RliImlsDUwL6dDJGJ+AbJ3JdQ9UznAzXlYESIElQkfU+tZV5i5RzQhy8mdqZ6JSWTrzbhgZBMCPLjBuBIBpqWLQmf2atSaRjbVB4RT3Wude0Oo5rSTgIr1wGHLEeIcvk4w5xg10xp88LMxsOozVunY7MjFm+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183388; c=relaxed/simple;
	bh=c3XB6pclgUDulfG0w1HZ57HAEcJOtSCEIStcIHB0wrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSruIpdrmhQV/MVnpkifalKFTKGrdI8WtXW9c+vE9DQ73rqZQgv2ST8qvuytCmyRBBoVqsqIjIHDoveaXft1RxxlYYqXFnoO6FbFiyXnsLb1NyrWjoiVBoqo8WK9YVbxjibaXxRh/rXaV3QE9HPTRJxRsHo9E2jbdH28tyigKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LWrUCsyp; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LWrUCsyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=w/
	ZOvr0cFnO+KxNXzKLYo9hHd8muTFSoABjiNPb5SQo=; b=LWrUCsyp6sBJRjuFFH
	WoX/i60LcZJIhpl9tb8texE4kWXekPjEjDwGD0GBLWceXAlSipmfOb1zX3SH5iGW
	Nndy4j6SMPn2S98e9bLe+YVaEsNI7xnQl0qloYEDZnJH2MgTjYLRYO3oxjymQtLj
	9Ag1QdX40jVFjzUjGlD6nfAW8=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHHmEbg5VqFKS5Sg--.13223S4;
	Mon, 31 Aug 2026 21:35:27 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	mike.kravetz@oracle.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH v2 2/2] mm/hugetlb: cap demotion at currently available free pages
Date: Mon, 31 Aug 2026 21:35:19 +0800
Message-ID: <20260831133519.2505020-3-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831133519.2505020-1-xialonglong2025@163.com>
References: <20260831133519.2505020-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHHmEbg5VqFKS5Sg--.13223S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr17Cw1xArW5Aw45tF1rCrg_yoWrJFy5pr
	W8tw1Sk3ykZF9rGr1Sqw1Dt3WfZw4xKrWrA34fJ3y5Zw13X3sF9r1xJryUZa4xuFWfJanI
	9F4DZ34DZry5XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc6p9UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+B-n4GqVgx+NqAAA3m

From: Longlong Xia <xialonglong@kylinos.cn>

Demotion must not remove free huge pages that back existing reservations.
The sysfs path checks whether any page is available, but passes the entire
request to demote_pool_huge_page(). For example, with two free pages and
one reservation, a request for two pages removes both and leaves the
reservation without a backing page.

Cap the sysfs request by both global availability and the selected node's
free pages. Recheck global availability in demote_pool_huge_page() before
each node batch because that function drops hugetlb_lock while restoring
vmemmap and reservations can change before the next batch.

Testing:
Tested on an x86_64 QEMU guest booted with:

  hugepagesz=1G hugepages=2

Reserve one 1 GiB huge page with an untouched hugetlbfs mapping:

  nr=2 surplus=0 free=2 resv=1

Request demotion of two pages. Before this fix, both free pages are
demoted:

  nr=0 surplus=0 free=0 resv=1

Touching the reserved mapping then fails with SIGBUS. After this fix, the
request is capped at the single available page:

  nr=1 surplus=0 free=1 resv=1

Touching the reserved mapping succeeds. After the process exits, the
counters are:

  nr=1 surplus=0 free=1 resv=0

Fixes: c0f398c3b2cf ("mm/hugetlb_vmemmap: batch HVO work when demoting")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/hugetlb.c       | 22 +++++++++++++++++++++-
 mm/hugetlb_sysfs.c | 10 +++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 640df58be4e5..ae26d400ad31 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3998,6 +3998,26 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 		LIST_HEAD(list);
 		LIST_HEAD(surplus_list);
 		struct folio *folio, *next;
+		unsigned long nr_available, nr_target;
+
+		/*
+		 * Re-check available each node batch: the previous
+		 * batch released hugetlb_lock for vmemmap restore/split,
+		 * and a new reservation could have been added in that
+		 * window, shrinking the budget.  available is global
+		 * (resv is not per-node), so 0 means no node can
+		 * contribute -- stop the whole scan.
+		 */
+		nr_available = available_huge_pages(src);
+		if (!nr_available)
+			break;
+
+		/*
+		 * Cap this batch at the current budget; expressed as a
+		 * cumulative stop point because nr_demoted is running.
+		 */
+		nr_target = nr_demoted + min_t(unsigned long,
+				nr_to_demote - nr_demoted, nr_available);
 
 		list_for_each_entry_safe(folio, next, &src->hugepage_freelists[node], lru) {
 			bool adjust_surplus;
@@ -4012,7 +4032,7 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 			if (!adjust_surplus)
 				nr_persistent++;
 
-			if (++nr_demoted == nr_to_demote)
+			if (++nr_demoted == nr_target)
 				break;
 		}
 
diff --git a/mm/hugetlb_sysfs.c b/mm/hugetlb_sysfs.c
index 79ece91406bf..326a54b4d991 100644
--- a/mm/hugetlb_sysfs.c
+++ b/mm/hugetlb_sysfs.c
@@ -211,15 +211,15 @@ static ssize_t demote_store(struct kobject *kobj,
 		 * Check for available pages to demote each time thorough the
 		 * loop as demote_pool_huge_page will drop hugetlb_lock.
 		 */
+		nr_available = h->free_huge_pages - h->resv_huge_pages;
 		if (nid != NUMA_NO_NODE)
-			nr_available = h->free_huge_pages_node[nid];
-		else
-			nr_available = h->free_huge_pages;
-		nr_available -= h->resv_huge_pages;
+			nr_available = min(nr_available,
+					   h->free_huge_pages_node[nid]);
 		if (!nr_available)
 			break;
 
-		rc = demote_pool_huge_page(h, n_mask, nr_demote);
+		rc = demote_pool_huge_page(h, n_mask,
+					   min(nr_demote, nr_available));
 		if (rc < 0) {
 			err = rc;
 			break;
-- 
2.43.0

