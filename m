Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F7A435A9E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183387; cv=none; b=DOeDJPaM2SnahY+69tTZUqIJbfyCBLQZBBLSp6mqnW3j+nMhTW8A9H001//PSB1WC7BGWzBVQduVLYUlDbGa+fhCoteiuBkvlAqOwqfIkKPaKoHvQ8V51PAK1n+Z+vvurE2GlAwbsWz4nOLFDZs/y9rqc/n7rwCG9MI+Y8c5/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183387; c=relaxed/simple;
	bh=4qLV+I2TLdLxH1jJbYPeqrjBblREqvDLagnJNPs3g1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs7svYl/b0Ou1ts1hcttZqRAm3BXLbTjwAxf2B0gmu4ytLcmD5IuasLcWO7ofJVxZI5V0vqmgzbsgPphluGb3ygtGP+KBL7x98t61XvKycTL4+yg2h3ztVQ5OAmfU28kV1GLI3RmrnNIdU6KtVj31vjtGtxT4OFBTgseLscxhGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m2SKSnTB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m2SKSnTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Se
	R1+mALksfzVZt4agnwdff+4ehIP+rnZ95J6spXEug=; b=m2SKSnTBFVwCNze2g6
	hr979eG4m1npQqij6JEbCGskhQSApcqT1y/qW9WJ2rnN7ePjrdL6AvDwADMP9FS7
	TyXUzEh7QdGfdy/PQW1wT71AUgm22mTrfRKUugjOanCjj5RzuVGdLwCH5P8VdQ2J
	7M6RBeFwmBNrn4lJ+KtyYRXRM=
Received: from XLL-9950X.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHHmEbg5VqFKS5Sg--.13223S3;
	Mon, 31 Aug 2026 21:35:26 +0800 (CST)
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
Subject: [PATCH v2 1/2] mm/hugetlb: preserve source surplus accounting during demotion
Date: Mon, 31 Aug 2026 21:35:18 +0800
Message-ID: <20260831133519.2505020-2-xialonglong2025@163.com>
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
X-CM-TRANSID:_____wBHHmEbg5VqFKS5Sg--.13223S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFykGr4fWFyDJw4ktryfXrb_yoWrCw17pa
	yYkwnYkrW8Ar9xGr4Sq34qywn8G340vrWjya4fKr43J3ZxZ34UKr13Xw1UJayv9rWfJF43
	Xw4DZFyDWF43ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2v38UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3B7n4GqVgx6CpgAA3D

From: Longlong Xia <xialonglong@kylinos.cn>

demote_pool_huge_page() currently removes every source folio as a
persistent folio. A free folio can instead account for one of the source
hstate's surplus pages, for example after a vmemmap restoration failure.
Removing such a folio without adjusting surplus_huge_pages makes the
persistent count underflow, and later subtracting it from max_huge_pages
can underflow that counter as well.

Classify selected folios against the node's surplus count while holding
hugetlb_lock, and preserve that classification on rollback. Track the
number of successfully demoted persistent folios separately so only those
folios reduce the source max_huge_pages target. All successfully demoted
folios still increase the destination target because the new destination
folios are added as persistent pages.

Testing:
Tested on an x86_64 QEMU guest booted with:

  hugepagesz=1G hugepages=0 hugetlb_cma=1G
  hugetlb_free_vmemmap=on

For testing only, add a one-shot fault injection that makes the first call
to __hugetlb_vmemmap_restore_folio() for an optimized 1 GiB folio return
-ENOMEM. Set nr_overcommit_hugepages to 1, then allocate one 1 GiB huge
page:

  nr=1 surplus=1 free=0 resv=0

Unmap it. The failed restoration leaves the folio on the freelist while it
is still accounted as surplus:

  nr=1 surplus=1 free=1 resv=0

Demote one page. Before this fix, the result is:

  nr=0 surplus=1 free=0 resv=0

After this fix, the result is:

  nr=0 surplus=0 free=0 resv=0

The fault injection is one-shot, so the restore performed during demotion
can succeed.

Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/hugetlb.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ed26105b84de..640df58be4e5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3983,6 +3983,7 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 	struct hstate *dst;
 	long rc = 0;
 	long nr_demoted = 0;
+	long nr_persistent = 0;
 
 	lockdep_assert_held(&hugetlb_lock);
 
@@ -3995,22 +3996,40 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 
 	for_each_node_mask_to_free(src, nr_nodes, node, nodes_allowed) {
 		LIST_HEAD(list);
+		LIST_HEAD(surplus_list);
 		struct folio *folio, *next;
 
 		list_for_each_entry_safe(folio, next, &src->hugepage_freelists[node], lru) {
+			bool adjust_surplus;
+
 			if (folio_test_hwpoison(folio))
 				continue;
 
-			remove_hugetlb_folio(src, folio, false);
-			list_add(&folio->lru, &list);
+			/* Surplus accounting is maintained per node, not per folio. */
+			adjust_surplus = src->surplus_huge_pages_node[node] > 0;
+			remove_hugetlb_folio(src, folio, adjust_surplus);
+			list_add(&folio->lru, adjust_surplus ? &surplus_list : &list);
+			if (!adjust_surplus)
+				nr_persistent++;
 
 			if (++nr_demoted == nr_to_demote)
 				break;
 		}
 
+		if (list_empty(&list) && list_empty(&surplus_list))
+			continue;
+
 		spin_unlock_irq(&hugetlb_lock);
 
-		rc = demote_free_hugetlb_folios(src, dst, &list);
+		if (!list_empty(&list))
+			rc = demote_free_hugetlb_folios(src, dst, &list);
+		if (!list_empty(&surplus_list)) {
+			long tmp_rc;
+
+			tmp_rc = demote_free_hugetlb_folios(src, dst, &surplus_list);
+			if (rc >= 0)
+				rc = tmp_rc;
+		}
 
 		spin_lock_irq(&hugetlb_lock);
 
@@ -4018,6 +4037,14 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 			list_del(&folio->lru);
 			add_hugetlb_folio(src, folio, false);
 
+			nr_demoted--;
+			nr_persistent--;
+		}
+
+		list_for_each_entry_safe(folio, next, &surplus_list, lru) {
+			list_del(&folio->lru);
+			add_hugetlb_folio(src, folio, true);
+
 			nr_demoted--;
 		}
 
@@ -4029,7 +4056,7 @@ long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 	 * Not absolutely necessary, but for consistency update max_huge_pages
 	 * based on pool changes for the demoted page.
 	 */
-	src->max_huge_pages -= nr_demoted;
+	src->max_huge_pages -= nr_persistent;
 	dst->max_huge_pages += nr_demoted << (huge_page_order(src) - huge_page_order(dst));
 
 	if (rc < 0)
-- 
2.43.0

