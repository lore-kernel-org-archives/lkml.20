Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640832;
	b=tPcfn23Sdh26wzXT9zdpTyyLMSwL517bwUgrnh+GfcqtMutnqxSMJev+rPCPiOJMcqkD
	 1VloHIgL/y7kiZ/YyomqVkQM03PRulLQMckWruIj0BcqzFePQ8tEg7quuZ6Xwq2L4Sde5
	 niq+PGQXiUpHuvBOsE0g18tM5dwkHL0i+7hltZN2C1azFpEZNWxi81xxnj/H3aSuutIJh
	 V9RpCMr5rjhRTBcmHf7eLfowEg5Ih5TvK5a36ecyiith+iKAiQK0sr5Z4hl7g4AlJ+g2G
	 pf22GlvqB4JJJKFAP9aqHNaesE31F1JfkQIpshkixIJqP0SpnOkhXSA5/IpXRvx93JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640832;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:
	 X-Original-From:Content-Type:From:Message-Id:X-Mailer:
	 X-Lms-Return-Path:To:Cc:Date:In-Reply-To:Subject:Mime-Version:
	 References;
	bh=EL4zKSYauXV7QL1vcktxiMTY6CZlzl+ylN8VKzLTC2Q=;
	b=O90qVIU4pyLnbTeKWh6bC8YrqL9RZTFXtp+WIY/Az3j4Fx6m6QGNPugom0TgpiffHqkv
	 I2m2TTOflzysja1EFTz0Y6N1rHMG9sYyuFYAIR6v30qAFt3SaQnzy1lXDdrk3quHxU4NY
	 pjdjOPMK8glcVaFFO7z/4ao/DhJVdk32ZnM+ow+KawZuJc/0tppTH94GVpeFs8s8v4Vel
	 O9XIlL3WsIxIVcLBKH9uuyPvn/6/hGjGfjwVL2aXqzX/PyyCWCvOOOcfGA+suYHLBimZl
	 xyc1bTv5RiMMIBCE24ZYflOPD8Ot3aK4oshZlUVbQA8lmFdLieVdE7pqQxG5aFYl/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YBGq61oz;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F43606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YBGq61oz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792640828; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EL4zKSYauXV7QL1vcktxiMTY6CZlzl+ylN8VKzLTC2Q=;
 b=YBGq61oz6isJmmWTS1MFJl+TIEwrQpHCUh9Uka4gdu4/JbjyWJWOJz+lAKSYGaPkS+b/6F
 LnmKIwsmAvzuAFiMCjADtsGNVA+7JuDzWgMzKMle55ArUh7ftPm9FqhousDx7g9I/H007A
 qqpwdg5EvJCCsTNFjRdKjAcnynnByVbTRHfjpxjvJzxjXpOrpeXlAW7KA0okcPc/T8U6ZY
 6DJ+q2A6JKr0J/w5nrgeizZjcgu66/JM4qfdCc6R3oOG81h5BeD2JiNS1qXq/j5oB17vuV
 MD45YSUkHAgmVa/fUDQXK7pRQk9PN+St36M1N81gWqhX27OXkq7RiT51R6QQmQ==
Content-Transfer-Encoding: 7bit
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261022034543.51226-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
X-Lms-Return-Path: <lba+26ad98731+c58b6e+vger.kernel.org+lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <peterx@redhat.com>, <rppt@kernel.org>, 
	<azpijr@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>, <stable@vger.kernel.org>
Date: Thu, 22 Oct 2026 11:45:41 +0800
In-Reply-To: <20261022034543.51226-1-lizhe.67@bytedance.com>
Subject: [PATCH v3 1/3] mm/hugetlb: fix mremap move length truncation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022034543.51226-1-lizhe.67@bytedance.com>

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
Cc: stable@vger.kernel.org
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/hugetlb.h | 15 ++++++---------
 mm/hugetlb.c            |  7 +++----
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 16c4c4caa126c..d73e3cf7adf9f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -121,10 +121,9 @@ void hugepage_put_subpool(struct hugepage_subpool *spool);
 
 void hugetlb_dup_vma_private(struct vm_area_struct *vma);
 void clear_vma_resv_huge_pages(struct vm_area_struct *vma);
-int move_hugetlb_page_tables(struct vm_area_struct *vma,
-			     struct vm_area_struct *new_vma,
-			     unsigned long old_addr, unsigned long new_addr,
-			     unsigned long len);
+unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len);
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
 void unmap_hugepage_range(struct vm_area_struct *,
@@ -339,11 +338,9 @@ static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 	return 0;
 }
 
-static inline int move_hugetlb_page_tables(struct vm_area_struct *vma,
-					   struct vm_area_struct *new_vma,
-					   unsigned long old_addr,
-					   unsigned long new_addr,
-					   unsigned long len)
+static inline unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len)
 {
 	BUG();
 	return 0;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cea25773a6c95..4a70716deaa41 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5139,10 +5139,9 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 	spin_unlock(dst_ptl);
 }
 
-int move_hugetlb_page_tables(struct vm_area_struct *vma,
-			     struct vm_area_struct *new_vma,
-			     unsigned long old_addr, unsigned long new_addr,
-			     unsigned long len)
+unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
+		struct vm_area_struct *new_vma, unsigned long old_addr,
+		unsigned long new_addr, unsigned long len)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping = vma->vm_file->f_mapping;
-- 
2.20.1
