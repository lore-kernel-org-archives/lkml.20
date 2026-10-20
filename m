Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497522;
	b=mq0qBO+MlSD9jkL8MquGJjsFhQijZrhue7pysgvifzopLPFvguOiOYom9FCDvVU4HLn8
	 MqmHEYcuWKG/84hxHi7Jwa75f39FvSPnrmbq3GPiccURFaXzhQoYMbNZBd0O/RapwysoW
	 43Gm1+CCIpCWbfpUGSwai0WTSyBrXFKdV+yHlBwQcgvKM9pV45NnBQirx0XUO6hhlAJ+Z
	 7w2P6sIVEvGB6N0r6RJHk0HGUTEN3baq4sesAnl2QuONNx1rvYe/2Lkas9V8kRp5kCsYZ
	 BmmTz8H/Hf/VQpxVAc8wxiV0RelMH6fgyci+9V7L9c1ZbkNN7BuPz9oz5QaJw+U0qyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uTHS7FXG3yRMZ0GtPZv/7Y6mv5vhk3N/ykMwP6C0L64=;
	b=O5UHJrfbVXwRQClUkRLm/ohf/CktZhAjhSt62MlMofZOB5gGCbeFyD9+Woodd+FXay5m
	 JyNefj3kp4k0tBA9uXmDP4F8AezlOoXiym9b4SxZ9yFPW5lWAhvtM51XXkjl8uDnBl8Yl
	 0+0octcdl/13fIeJ8SqRUQ4md9bgcSPJw4NNi0NxUMdyhNqCkYJs/KEOi5kzD5rH7+I2w
	 AkP1biLqp/jaVofdFqJYbamWiN/41VbTPdIL3RrQy1wce6ocwo77bGxonUVYvFM/13pVb
	 sQBPU/t8wWLyUIWCTuHHNRLZBoTY3ntwU3NZcld3OHFp0NL+BjVbv6YW/ErL9SR9Yfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QX+Rl+BC;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6C60A380F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A6C60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QX+Rl+BC
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so2660986a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497521; x=1793102321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTHS7FXG3yRMZ0GtPZv/7Y6mv5vhk3N/ykMwP6C0L64=;
        b=QX+Rl+BCddCn5qjq1AHytX3aaCEDEeU8NUpkd5S3/WP3bE1rguP7ORsixqh4zdmlrS
         PW6IbVvi3GHZ3hG4HGnvgVn14zjXlMQmKb3KYkRXkDqJQ/i1Gi+CH0adlRossm8qNYFa
         Gsz2w0dTArw7Zr/ALb4FXLVFn0d7Avpm6Ctq5IZchVzQ2P/tnx3W1MkuOW0HrsXoNW+2
         j28wBAS05aG5fr3DQl5/nTQFnwkPKXM1suc5Y9cmww67CTcZ943N/yLYJ9XmMxqistlS
         eA8LILZmAbcqwAXs7G9fgfiTtU6zXPlezl7BU0Pi6TVAhVp25Svwik7kBDePjH3F2rxh
         iCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497521; x=1793102321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTHS7FXG3yRMZ0GtPZv/7Y6mv5vhk3N/ykMwP6C0L64=;
        b=RO16jIQwhlNqULZ18jWP9SubSBMs3vBgN0/7rhx5KTn7irKKH+N+4cfMvcrCiOVqHi
         zFYloVtkHVIQ3k8pdYOqxTNr67KIQ4q+EULMbYSs90sxfLbGvOM8eOmgM0ScIxRsho3e
         QfHn7IKoKDYWPIKbNtByuG8DAOiBNEfl7Xd25kOMntxN1qtdSKk4tXJ59eOvDwunnC/U
         H9b3lW8Cb5O2oN3X8sVmyReXHDN9rbJbMUKZB5stEiccgwXEmDskzV5nfZ3A/653SlAM
         BixDKwdenDdyTz48Dde0bJK3iib5yL0RgnP3pruRLFcYV8kFfVt7qRR7tyK/DmH3Egyn
         avHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRxrHcrWfukE1HSGE2leh0A9pKnganA9QOWxi7qAtHr0m8U7WavyFDSH9nA8veemEMFCMzzU/YNBdfOz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUkTqmt9BzF7LN30tGmXphL8CvQWDAcumiBNKEEV6T7w6lRWN3
	lcm/Q5QnXJDkfs0oU4IaS4ocgLFDfvXd8+gSwGMzeJbWA27U+GMUl2E0YBwQtw8qD64=
X-Gm-Gg: AYBFou1ppQFAM5sjh8uIqrAJRh/Cl2ZLCGhjLuCyd7YPG8QcrQZxYyXX9AvAfvh/N/x
	N878D5zKTaeHDGOdb//XoPzI9HhixyPei/FAqKSgSAIbwB1o1lbdqaJHAvbSnkK15gQKpfhRjej
	YIoFMhuND2zJ4ys/8H1eDrekWpfc7ME+KHXUf4hFg2U3+QeJDipZ8tBJ08lHXEK91PMvgVD0N/l
	12enoIAMao7Juh1oUW5QPk79s+nXsQZ/tU9jylE2QtNy5TII4Qps4cscQPG7PHhgmKnFkubJSnx
	nSy4XmFhVGlMQqFsv7V43l2MJ8aPvpa+rHBFY9aQI95/T0CzbSaG2Fms+jxp0b5ZmdGFvQgl5d1
	oteflnUHxYm4vnW/0cTWRxG/r77JYRm1SLXspSC/f9FBfievPGgtq2k1AQytv/YjBE2BqbQUlc7
	4Ies1AQId/pv0IvbnRcxdn9TPn6Ohk393F+yRfVXs5la6sva0gbOQALFmE3Su9J4yiPs1J+gFp+
	iVyk4G3XGgvGD+wBiwJ3z+Fy3BaBSxK5ucUsnm+4gtJOWfMQGz43dhlkkJ7qgDSO/IUDUkKYmC6
	/g==
X-Received: by 2002:a17:90b:590c:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3acee97a193mr10603271a91.8.1792497518926;
        Tue, 20 Oct 2026 04:58:38 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:38 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 04/12] mm: hugetlb_vmemmap: generalize vmemmap page allocation
Date: Tue, 20 Oct 2026 19:58:16 +0800
Message-ID: <20261020115824.823278-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
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
the restore and optimization paths can share the same allocation policy.
This also allows HVO head-page allocation to fail gracefully under memory
pressure without triggering the OOM killer.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 164e93e980bf..ffb56ffed680 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -333,28 +333,25 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
-				   struct list_head *list)
+static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
+				   int nid)
 {
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
-	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
-	int nid = page_to_nid((struct page *)start);
-	struct page *page, *next;
-	int i;
-
-	for (i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, gfp_mask, 0);
-		if (!page)
-			goto out;
-		list_add(&page->lru, list);
+	LIST_HEAD(local);
+	struct page *page;
+
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
+		if (!page) {
+			memmap_pages_add(i);
+			free_vmemmap_page_list(&local);
+			return -ENOMEM;
+		}
+		list_add(&page->lru, &local);
 	}
+	list_splice(&local, head);
 	memmap_pages_add(nr_pages);
 
 	return 0;
-out:
-	list_for_each_entry_safe(page, next, list, lru)
-		__free_page(page);
-	return -ENOMEM;
 }
 
 /**
@@ -373,13 +370,14 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 			       unsigned long flags)
 {
 	LIST_HEAD(vmemmap_pages);
+	int nid = page_to_nid((struct page *)start);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
-	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
+	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
 		return -ENOMEM;
 
 	return vmemmap_remap_range(start, end, &walk);
@@ -526,15 +524,13 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
-	if (!vmemmap_head) {
+	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid)) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
+	vmemmap_head = list_first_entry(vmemmap_pages, struct page, lru);
 	copy_page(page_to_virt(vmemmap_head), folio);
-	list_add(&vmemmap_head->lru, vmemmap_pages);
-	memmap_pages_add(1);
 
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-- 
2.54.0

