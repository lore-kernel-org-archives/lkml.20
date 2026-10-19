Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FD4B921A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409486; cv=none; b=WZtI6LHt6ND7S7vxfaaaoqFOmRFl+Lc5uChuFjVxSLyYH4K1Ke04DO/MBWV+yZ711XdgaYnRuLH34yZhF7Pu521iGH/QqHZw4247mY5H8ciryiRUXEKX8bEJzgQ7XbPtuOBF0UP57BUaGTL573BPnrItJq8Y9aETISLJCx/Kz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409486; c=relaxed/simple;
	bh=s116/0cIts+9lfGas8ESHv5JVElyo39nT21zYAAbe1Y=;
	h=From:Message-Id:Mime-Version:In-Reply-To:References:To:Subject:
	 Date:Cc:Content-Type; b=rr7AbdYEAyoduLx4jlCTZQ+d9m/Fx+p6vcdKnDScbSU74taoZJpdeefdGAuIBGO540uyHrn6CgFpJHee9yrVGUBfJ0UaSDB3yvVsfniqa+I+Iw/xdgiofBTq1aPNCOw1to5iDpbDa8lCLP39IBx/tL2mrKVFOEmMjDBDFkOJgO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Lx6k4wGK; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Lx6k4wGK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792409478; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NAWO0hPInuKz2svZuq+EEVdySP1nRs4Jci480qIc9q4=;
 b=Lx6k4wGKAlwP6ewF+be1ydhXjT82JEf9VbN55LkxJLHO4udT+TljPSGmZ0UjYqMXSlPZbm
 4+146W1P7EMBCLmspyuGMwhwRgNuYSIicUC0hZq+buKDz3GFCViC/SrXuKFMP9WaLHFj5N
 t7tEqFLvTTfpI5sQXZX7a4mUDAjM/9mSH4H2gsfJt+VVXbfoIQhx3MMAqd8T7x6VZQe6zk
 Ymg+l3npscgnxFhGZHUj2UBDTc0n8svXgIKlvVurrh3j7u6eahlZvuQysfGdXWNb8WXFZa
 u5x+E/oHw1Sg+Wgohgm6Q0Yw/G1hKmDM6St/7T+8gR/T/e8zsAiq75N9XMjJfg==
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261019113034.97690-2-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261019113034.97690-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
References: <20261019113034.97690-1-lizhe.67@bytedance.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <peterx@redhat.com>
Subject: [PATCH V2 1/3] mm/hugetlb: fix mremap move length truncation
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad5ff84+6a4c52+vger.kernel.org+lizhe.67@bytedance.com>
Date: Mon, 19 Oct 2026 19:30:32 +0800
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8

move_hugetlb_page_tables() returns the number of bytes moved, but
its return type is int while the generic move_page_tables() path uses
unsigned long lengths.

A hugetlb mremap() move length above INT_MAX can therefore be
misreported to copy_vma_and_data(). The out-of-range conversion to int
is implementation-defined; on common 64-bit builds, for example, a
4 GiB move can be reported as zero, making the caller treat the move as
a failure and use the wrong length for rollback.

Return unsigned long from move_hugetlb_page_tables(), matching
move_page_tables() and preserving the full byte count.

Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/hugetlb.h | 18 +++++++++---------
 mm/hugetlb.c            |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 16c4c4caa126..cc12040e4032 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -121,10 +121,10 @@ void hugepage_put_subpool(struct hugepage_subpool *spool);
 
 void hugetlb_dup_vma_private(struct vm_area_struct *vma);
 void clear_vma_resv_huge_pages(struct vm_area_struct *vma);
-int move_hugetlb_page_tables(struct vm_area_struct *vma,
-			     struct vm_area_struct *new_vma,
-			     unsigned long old_addr, unsigned long new_addr,
-			     unsigned long len);
+unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+				       struct vm_area_struct *new_vma,
+				       unsigned long old_addr, unsigned long new_addr,
+				       unsigned long len);
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
 void unmap_hugepage_range(struct vm_area_struct *,
@@ -339,11 +339,11 @@ static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 	return 0;
 }
 
-static inline int move_hugetlb_page_tables(struct vm_area_struct *vma,
-					   struct vm_area_struct *new_vma,
-					   unsigned long old_addr,
-					   unsigned long new_addr,
-					   unsigned long len)
+static inline unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+						     struct vm_area_struct *new_vma,
+						     unsigned long old_addr,
+						     unsigned long new_addr,
+						     unsigned long len)
 {
 	BUG();
 	return 0;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cea25773a6c9..2c64ca985dfa 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5139,10 +5139,10 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 	spin_unlock(dst_ptl);
 }
 
-int move_hugetlb_page_tables(struct vm_area_struct *vma,
-			     struct vm_area_struct *new_vma,
-			     unsigned long old_addr, unsigned long new_addr,
-			     unsigned long len)
+unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+				       struct vm_area_struct *new_vma,
+				       unsigned long old_addr, unsigned long new_addr,
+				       unsigned long len)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping = vma->vm_file->f_mapping;
-- 
2.20.1
