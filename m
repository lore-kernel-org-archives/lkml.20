Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018581;
	b=X9vJJPrlERoVOFnw7SfXO030aQfh8IvnJK0foq9aOnWjNI/6hSbwDJT1fKGdGHOxsK22
	 uGgFOPUiNFwYqz8xEBk9Rzf9rpMVwUzaTo7AS6kGQI/d4Uc4YN5LHadSsPA2Cnvko6n2F
	 lm+4PvTXNQZdgct3glAh0WFZOOWcPcUvS0gJ9+AlHXXftKk7l77BLShAXHUKneEmoUw5N
	 JCTCu7/NbCKwbtmDM45eRD53QILKO1zZlAXJ+Jw5zse+wh5v7KoYY6amiHH855mYxptJD
	 mLGurvV5QOGGJZGVsyXl0io5ZiOPs+6EeBDUyBUG9f5v14x4Jk1jp7iwatiEzRhqNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZP0Njj2Pc4sOvWsLncKRQe3PWXnRhxBlesqmoRjD4ZI=;
	b=5F7HT1MmWkX8O5QvUrMZwfmk079a765LEBB/6fUtRLCp66ksUcLCCAXF5iiqFqOZw35T
	 pNH1DhzB9yx5KrNalGJb8D+MXzVnxsL3z2TuXL1ZzcwqgbT8AJfbmjiBNpkqydv4LFIDF
	 CUkcz4/ylwdkYrlCnWW4mn/1H28dMQ/i65avhcxrmrL/o4mcDrgRW+93XKa5bWWdLu9Aq
	 ApmswztC7HyEZWSljc8ykQSh4NnCTTNiQPJ/FAUx8rQK3IHo9U3GsbkWLCPmu83Cwg2DU
	 EWUHyq75zmm8sBGNx2XY8gE0LKabJ9sAQMvO5J2Hn9fQRlcx9dqWnmfAiYF/MK1FzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g2aySJCa;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AEB606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AEB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g2aySJCa
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1898932eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018580; x=1794623380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZP0Njj2Pc4sOvWsLncKRQe3PWXnRhxBlesqmoRjD4ZI=;
        b=g2aySJCaubyeLp1EYYpV0jxtkbqFeI+h0CERkBKdJcUtgg5DOBoflRrwpI+RIOgA2i
         m+TyBhOO4X9utQ1RiyyzjP7EL53i2/712VGjJ1X9C/aLetj3Gl+u7y0JZdzVHLW4gjVv
         CwqxDFp8sXJuCXESasf6CtWIJcp4QHpIsj0QdgkJFW9cu5bY1NPEsuuOEddSBYGBzLJN
         jEY3u3TGJn5zK/mx3DTdR5YccpCH+1FWJNMN43py2LjvGp+h2iagzu1+PESiYYbN4ey8
         AyUXgnjC3Rqqk1dPW8J5+labZEPVQA0ZCU0NDM7t2lfknJ6JmDLQs1RGME5RSvF0ETSi
         pq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018580; x=1794623380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZP0Njj2Pc4sOvWsLncKRQe3PWXnRhxBlesqmoRjD4ZI=;
        b=i92BtwWfDFnsJCSvnrOJ6//hvW8jKP0331T2qfDIzi5+RUHcsMUSbFX2XNp3WRbePP
         RPmWWpAObGlZbq9pldhpaJ8iGmKU+CYjMdKu6ZZRsIx+ly605RsD08kgACIp2gGUyPPu
         +244sXbb+zlDOhy56AGUe+ne4FoMYXEsFD4BewcsgPT4ma3wKvlulUqY3pEXfARpza5Y
         d7me2A9l2WXYl+Wa2JzjVbxZljP+2CnsgaPdlGVIvBaTwdz1YRmo4KpvH2eE2Aej0aDU
         QIu2GlKGJDxOb0U8JGmXPn4JhHSS1/rZCErtyX8XtrRRbULyIBCwYK5qs3LvP56WXZvp
         JSlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd31WWYnVYe/1yFfaxkmD0lle9ankvy7B673U5WyGp3fKwXAjybzch5XMe18hakmkjqL/457BpNKQYChY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C92TqMGAnIhP5mDhdY9T8nMmZZUQdf5tNekyyhAtAmt/1U5Dt
	evYBWO3lq67KbCcQo+uF1GHr8KjNU3CTGsR7lF73YU8jTDcVpzhF+vRtBwuKbydodmk=
X-Gm-Gg: AYBFou2R0vUtnwJ360jKAPV0qEWxHXN+8KWwJ90uygD4ZHnB6DKo6y7dDCagPFN28LJ
	qu45Venm3/QDvIwdxKDb/henVR/+gSODKKDkPyJRfgau63SiwW1sWpo3qf04Sz1r5Mze+ZadEPv
	7G85Ick7w6jV3ChfKhc8760qjetnXWpKCRMGi/wLt+dIaEP9u39v7JOa+LuUgP9LD8wTS/ZVxNp
	p9Sxz3rdwYc4QsxHOSwHM18nJTSQRZd9HbJaesDLEVIQSeym6tLVWIG93aFwa7x6iNFAFLN0ISC
	Ov7O52970V4UAvIOuH9EdQHSfhLzvjj2XhK2RAupDUovcG2i1S+qi1oZb809t5MXJ5BGquW2Ox5
	Dj4uohCi4tAaOprkZihvWp2Dlh8i7FqqhXBjsu8euaczswnUKFped0ENxhryR1sKDBEfjmN8TIW
	jFlhc7O+/lSdmUjIvJquiLpdfzBXO44CNhyoULsJLwWEHTk4eeqk1mo0jMjaX5JObBmhAPAZ/ad
	5iMk6dWFr6KLvcBWmqxSf5I21E+6wvoRkCxBNqrn2uRr171BVTJh00+MFnanSMkDl28SywXWOCh
	nwlCBGDm8TJ7+3+dAvw+9fHmovSMSrSyE7O82RAZ+czSkIKKMpy31+Jb8Ia0
X-Received: by 2002:a05:7301:420a:b0:368:6f29:f26c with SMTP id 5a478bee46e88-36f729cfbf4mr5474304eec.4.1794018579654;
        Fri, 06 Nov 2026 18:29:39 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:38 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 05/13] mm: hugetlb_vmemmap: generalize vmemmap page allocation
Date: Sat,  7 Nov 2026 10:27:48 +0800
Message-ID: <20261107022756.77731-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vmemmap page allocation is currently tied to restoring a virtual range
and assumes an empty destination list.  These constraints prevent it from
being reused when pages are requested independently of a vmemmap range or
appended to an existing list.

Generalize the allocator and give it an all-or-nothing list contract so
the restore and optimization paths can share the same helper.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Split the OOM-avoidance mask change into a prerequisite fix and pass
  allocation policy through the generalized helper
- Propagate alloc_vmemmap_page_list() errors (suggested by Oscar
  Salvador)
- Update the commit message after splitting the OOM fix
- Collect Reviewed-by from Oscar Salvador and Mike Rapoport
- Collect Tested-by from Andrew Morton

v3:
- Use two tabs for continued function parameters (suggested by Mike
  Rapoport)
- Rename the local allocation list to new_pages (suggested by Mike
  Rapoport)
- Use a goto cleanup path for allocation failures (suggested by Mike
  Rapoport)
- Free failed allocations directly and retain batched accounting (suggested
  by Mike Rapoport)

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index beb420c57ddc..290dd8f31738 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -334,26 +334,24 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
-				   struct list_head *list)
+static int alloc_vmemmap_page_list(struct list_head *head,
+		unsigned int nr_pages, int nid, gfp_t gfp_mask)
 {
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
-	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
-	int nid = page_to_nid((struct page *)start);
 	struct page *page, *next;
-	int i;
+	LIST_HEAD(new_pages);
 
-	for (i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, gfp_mask, 0);
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, gfp_mask | __GFP_RETRY_MAYFAIL, 0);
 		if (!page)
-			goto out;
-		list_add(&page->lru, list);
+			goto free_pages;
+		list_add(&page->lru, &new_pages);
 	}
+	list_splice(&new_pages, head);
 	memmap_pages_add(nr_pages);
 
 	return 0;
-out:
-	list_for_each_entry_safe(page, next, list, lru)
+free_pages:
+	list_for_each_entry_safe(page, next, &new_pages, lru)
 		__free_page(page);
 	return -ENOMEM;
 }
@@ -373,6 +371,7 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
 static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 			       unsigned long flags)
 {
+	int ret, nid = page_to_nid((struct page *)start);
 	LIST_HEAD(vmemmap_pages);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
@@ -380,8 +379,10 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 		.flags		= flags,
 	};
 
-	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
-		return -ENOMEM;
+	ret = alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE,
+				      nid, GFP_KERNEL);
+	if (ret)
+		return ret;
 
 	return vmemmap_remap_range(start, end, &walk);
 }
@@ -501,7 +502,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 {
 	unsigned long vmemmap_start, vmemmap_end;
 	struct page *vmemmap_head, *vmemmap_tail;
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
+	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -528,15 +529,13 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	vmemmap_head = alloc_pages_node(nid, gfp_mask, 0);
-	if (!vmemmap_head) {
-		ret = -ENOMEM;
+	ret = alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES,
+				      nid, gfp_mask);
+	if (ret)
 		goto out;
-	}
 
+	vmemmap_head = list_first_entry(vmemmap_pages, struct page, lru);
 	copy_page(page_to_virt(vmemmap_head), folio);
-	list_add(&vmemmap_head->lru, vmemmap_pages);
-	memmap_pages_add(1);
 
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-- 
2.54.0

