Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF426056C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409898; cv=none; b=G5HIkxXDnJIjmnUc2y3PZvXibi5ni1tsXi7edIHlyZVufULDWAZ1HMbovHJcTs9sHb3HKsMPrXMMZ/TjV4tKBqeIl8rEwpWp1GDSy3CIKnFXXs8uN91fUv0QyE6UYbW0wvEUEpULXQnQ52T3uDh6vp3SNvakaNV3WGnBnwjFQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409898; c=relaxed/simple;
	bh=2+Wf9CTFkssOjA8yFTJDy8XhrKs+fVGTlq64tyWU6Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RAbRKO2gQRvopwh8RhivZq5vyFCFniqLqS6nCfBZyJXX3odhLmVTL773FUOZgXxCIzLTWZpYStHNfpN5t7x06tIAuCZ4Z5Ow7Yhbz6vQ5nXQ0FpxAvINi5oT6mGgGBy+JOwiYzYrdbkGqJ3ojhg/uKohdzYIfJwH+nM5Z3aJw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSrXLSKm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSrXLSKm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so14194975e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790409894; x=1791014694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HZxt3zeKnEnrs8DVV8VtTUi6IgHEqmk5kCmbCMy8wo=;
        b=KSrXLSKmZs5cklPv+IM8FELqwVeF/UbXxwV4a9A6mvlnFE3LObzCU0G14MyGy7z59t
         hMclzZuNDdIyW+RtHw6dWuIB7s+Wc9niRRJi8Jta38aKOfWvPiDQJpGztbR6++qX0BII
         nW4AQdvgO0i2tlvb+iFFXk/tyq/E7kpPcsYEX/V3SRAfCe8hKJfcI4IXSGb0+PUq3w5P
         kaAejmFn/2DkgjzPR4jr09Tg9X1pJtU3zCthCnZR5gZ7S3iZOPdmazAjxNWTZMhqsAkR
         LsZz+Jx2Jv9Hd561VbA+GyuGsl+jttdh04rdgupU669drqAVjUb4mKZcApAlf+vPUTw6
         pRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790409894; x=1791014694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HZxt3zeKnEnrs8DVV8VtTUi6IgHEqmk5kCmbCMy8wo=;
        b=eC7GQtX6z7NbTpu3H/i1MfrOvFPumTu6T2FIbnHnNOyqj7J9hEcS7sTODogKCqBD6u
         uDyJibypx75TZxzuBfSMN9cbgxU7hOTGgYI2CYBGO8J21IIpJRNAJmMW4t5MDZ9OBliK
         V9uFAdLVXkkadbKzBBal/O2FszsGUXICALwrOx3Y8I3UvgTScQy9C84UazJngV4tK6uY
         tn7uHvWz7FlEafa2ClEkjkn3BbRNi+9p1QsMR0SvlO3T3ddWq3Pa4a4S/r+IAkeGIrtS
         9XhtovWVRXo4SWqC9mKUE5I/aZCjbjyYwRMrNzGBxWHbz5Kp+6gObFIPjkSNvsBf110I
         X2nA==
X-Forwarded-Encrypted: i=1; AKwUvBzv67TLb6mCkNdF6SGaL3NM/4TbcTNbzbOD8qcyGAekNI7oyD5VlNpLmGkoB5q3/8fVzUuwpaAXGNvp2sY=@vger.kernel.org
X-Gm-Message-State: AFuF++m7n0WT8ZkI2RhGM79uraItbRKFi4vtCPD3u/CCWhFxiQmhKNCs
	/lWSRsyIIJYMzraADOz1l5gdotMDzxTUs/thmzQdtBFHYRbkSm1ApKKk
X-Gm-Gg: AYBFou0z6qmlmVwDmPDO+4ECL8TIDORUigVC3pANh5Cll7929eYaRT95gIRvq4lcfay
	pTde9X7ySVfzwKdvnty0YqLuUANgWJ4hrJRCcGHzapSOD9L0a53zjqKTogAB3OfoV7scuvJYXdL
	JMa05lFFp4U7t5dkT/yTzhDEB6657npLCTPvMdkv/Yu/RNo6tudak/Yo3NFAIOrvOBZqwjiF3nQ
	TdQ7XTm3tg6SGHs68dvsU3LZzUnxDBkkThItek+ul+VzrEhVQjrTBDT6LM0QTkpK61CFwoKntt7
	R0ElwOAkmMz+8ra9H6HVKbD7eiQZ0BEx3bTAmRLSQ4iHZ/B9BbY+zonGymYT/DW0NMLlt7o0R6x
	crPVXWRvHUSSeWPhgasdpkFd4SzfPVMKOT+3SIQ9q0TaDByj/SMMLAejRk3PlIsZJn79LfDqDAG
	co4aYJHikNTEdMmms/ed15e8VxebA1rHJ+qUfcA+jaVGo8VZBGzZk4YJoIvO1lt+oHw1iqP4dKb
	9X3b2WgFcQHiyg9OfIWl1173zo09TuIap322oPDd4U8WIclA5QuL44HutiACfxb3NmLJEHUvq3G
	sC/tL1cE5euVK05mI9jXlHjAmp4GZzSA5bJWPUTwabI7VC0h0UZXxZS+sUvixlwgpW/UGqkdbHC
	JeEHTahKGL3QTibd2eEp3xA==
X-Received: by 2002:a05:600d:644e:10b0:49f:e3d4:4c1f with SMTP id 5b1f17b1804b1-49fe7b62d1bmr99568365e9.8.1790409894114;
        Sat, 26 Sep 2026 01:04:54 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm326651415e9.12.2026.09.26.01.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 01:04:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	Muchun Song <muchun.song@linux.dev>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Rik van Riel <riel@surriel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: [PATCH 5.10.y] mm/hugetlb: fix avoid_reserve to allow taking folio from subpool
Date: Sat, 26 Sep 2026 10:04:49 +0200
Message-Id: <20260926080449.80322-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2025021033-cupcake-spud-c04d@gregkh>
References: <2025021033-cupcake-spud-c04d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Xu <peterx@redhat.com>

commit 58db7c5fbe7daa42098d4965133a864f98ba90ba upstream.

Patch series "mm/hugetlb: Refactor hugetlb allocation resv accounting",
v2.

This is a follow up on Ackerley's series here as replacement:

https://lore.kernel.org/r/cover.1728684491.git.ackerleytng@google.com

The goal of this series is to cleanup hugetlb resv accounting, especially
during folio allocation, to decouple a few things:

  - Hugetlb folios v.s. Hugetlbfs: IOW, the hope is in the future hugetlb
    folios can be allocated completely without hugetlbfs.

  - Decouple VMA v.s. hugetlb folio allocations: allocating a hugetlb folio
    should not always require a hugetlbfs VMA.  For example, either it got
    allocated from the inode level (see hugetlbfs_fallocate() where it used
    a pesudo VMA for allocation), or it can be allocated by other kernel
    subsystems.

It paves way for other users to allocate hugetlb folios out of either
system reservations, or subpools (instead of hugetlbfs, as a file system).
For longer term, this prepares hugetlb as a separate concept versus
hugetlbfs, so that hugetlb folios can be allocated by not only hugetlbfs
and other things.

Tests I've done:

- I had a reproducer in patch 1 for the bug I found, this will start to
  work after patch 1 or the whole set applied.

- Hugetlb regression tests (on x86_64 2MBs), includes:

  - All vmtests on hugetlbfs

  - libhugetlbfs test suite (which may fail some tests, but no new failures
    will be introduced by this series, so all such failures happen before
    this series so shouldn't be relevant).

This patch (of 7):

Since commit 04f2cbe35699 ("hugetlb: guarantee that COW faults for a
process that called mmap(MAP_PRIVATE) on hugetlbfs will succeed"),
avoid_reserve was introduced for a special case of CoW on hugetlb private
mappings, and only if the owner VMA is trying to allocate yet another
hugetlb folio that is not reserved within the private vma reserved map.

Later on, in commit d85f69b0b533 ("mm/hugetlb: alloc_huge_page handle
areas hole punched by fallocate"), alloc_huge_page() enforced to not
consume any global reservation as long as avoid_reserve=true.  This
operation doesn't look correct, because even if it will enforce the
allocation to not use global reservation at all, it will still try to take
one reservation from the spool (if the subpool existed).  Then since the
spool reserved pages take from global reservation, it'll also take one
reservation globally.

Logically it can cause global reservation to go wrong.

I wrote a reproducer below, trigger this special path, and every run of
such program will cause global reservation count to increment by one, until
it hits the number of free pages:

  #define _GNU_SOURCE             /* See feature_test_macros(7) */
  #include <stdio.h>
  #include <fcntl.h>
  #include <errno.h>
  #include <unistd.h>
  #include <stdlib.h>
  #include <sys/mman.h>

  #define  MSIZE  (2UL << 20)

  int main(int argc, char *argv[])
  {
      const char *path;
      int *buf;
      int fd, ret;
      pid_t child;

      if (argc < 2) {
          printf("usage: %s <hugetlb_file>\n", argv[0]);
          return -1;
      }

      path = argv[1];

      fd = open(path, O_RDWR | O_CREAT, 0666);
      if (fd < 0) {
          perror("open failed");
          return -1;
      }

      ret = fallocate(fd, 0, 0, MSIZE);
      if (ret != 0) {
          perror("fallocate");
          return -1;
      }

      buf = mmap(NULL, MSIZE, PROT_READ|PROT_WRITE,
                 MAP_PRIVATE, fd, 0);

      if (buf == MAP_FAILED) {
          perror("mmap() failed");
          return -1;
      }

      /* Allocate a page */
      *buf = 1;

      child = fork();
      if (child == 0) {
          /* child doesn't need to do anything */
          exit(0);
      }

      /* Trigger CoW from owner */
      *buf = 2;

      munmap(buf, MSIZE);
      close(fd);
      unlink(path);

      return 0;
  }

It can only reproduce with a sub-mount when there're reserved pages on the
spool, like:

  # sysctl vm.nr_hugepages=128
  # mkdir ./hugetlb-pool
  # mount -t hugetlbfs -o min_size=8M,pagesize=2M none ./hugetlb-pool

Then run the reproducer on the mountpoint:

  # ./reproducer ./hugetlb-pool/test

Fix it by taking the reservation from spool if available.  In general,
avoid_reserve is IMHO more about "avoid vma resv map", not spool's.

I copied stable, however I have no intention for backporting if it's not a
clean cherry-pick, because private hugetlb mapping, and then fork() on top
is too rare to hit.

Link: https://lkml.kernel.org/r/20250107204002.2683356-1-peterx@redhat.com
Link: https://lkml.kernel.org/r/20250107204002.2683356-2-peterx@redhat.com
Fixes: d85f69b0b533 ("mm/hugetlb: alloc_huge_page handle areas hole punched by fallocate")
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Cc: Breno Leitao <leitao@debian.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc: Rik van Riel <riel@surriel.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
[ Karl Mehltretter: The upstream changes map directly to this stable tree's
  older page-based HugeTLB API. The backport retains this stable tree's
  SetPagePrivate() reserve marker, plain hugetlb_lock calls and direct
  -ENOSPC return; the functional changes otherwise match upstream. ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested against the current linux-5.10.y tip, 5.10.270:

- x86-64 QEMU, 2 MiB HugeTLB pages, at 1 and 4 vCPUs
- compared with the unpatched kernel, an extended version of the commit's
  fork/COW reproducer kept the child mapping alive during the parent write
  and changed HugePages_Rsvd after program cleanup from 5 to 4 and after
  unmount from 1 to 0
- parent/child data isolation passed and no kernel diagnostic was observed

 mm/hugetlb.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 70fe6a11daba0..b23c8b2699b58 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1137,8 +1137,7 @@ static struct page *dequeue_huge_page_nodemask(struct hstate *h, gfp_t gfp_mask,
 
 static struct page *dequeue_huge_page_vma(struct hstate *h,
 				struct vm_area_struct *vma,
-				unsigned long address, int avoid_reserve,
-				long chg)
+				unsigned long address, long chg)
 {
 	struct page *page;
 	struct mempolicy *mpol;
@@ -1155,14 +1154,10 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
 			h->free_huge_pages - h->resv_huge_pages == 0)
 		goto err;
 
-	/* If reserves cannot be used, ensure enough pages are in the pool */
-	if (avoid_reserve && h->free_huge_pages - h->resv_huge_pages == 0)
-		goto err;
-
 	gfp_mask = htlb_alloc_mask(h);
 	nid = huge_node(vma, address, gfp_mask, &mpol, &nodemask);
 	page = dequeue_huge_page_nodemask(h, gfp_mask, nid, nodemask);
-	if (page && !avoid_reserve && vma_has_reserves(vma, chg)) {
+	if (page && vma_has_reserves(vma, chg)) {
 		SetPagePrivate(page);
 		h->resv_huge_pages--;
 	}
@@ -2350,17 +2345,6 @@ struct page *alloc_huge_page(struct vm_area_struct *vma,
 			vma_end_reservation(h, vma, addr);
 			return ERR_PTR(-ENOSPC);
 		}
-
-		/*
-		 * Even though there was no reservation in the region/reserve
-		 * map, there could be reservations associated with the
-		 * subpool that can be used.  This would be indicated if the
-		 * return value of hugepage_subpool_get_pages() is zero.
-		 * However, if avoid_reserve is specified we still avoid even
-		 * the subpool reservations.
-		 */
-		if (avoid_reserve)
-			gbl_chg = 1;
 	}
 
 	/* If this allocation is not consuming a reservation, charge it now.
@@ -2383,7 +2367,7 @@ struct page *alloc_huge_page(struct vm_area_struct *vma,
 	 * from the global free pool (global change).  gbl_chg == 0 indicates
 	 * a reservation exists for the allocation.
 	 */
-	page = dequeue_huge_page_vma(h, vma, addr, avoid_reserve, gbl_chg);
+	page = dequeue_huge_page_vma(h, vma, addr, gbl_chg);
 	if (!page) {
 		spin_unlock(&hugetlb_lock);
 		page = alloc_buddy_huge_page_with_mpol(h, vma, addr);
-- 
2.53.0
