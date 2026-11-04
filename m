Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759757;
	b=uPpEZmvEYc52/lOVakE1/O0fRlN8ne1GePNWGcTMUsmkGiX1hzPOUHcG8FGVBUKViE9B
	 IHikWaBPkIv/yIHlNU9vhzqoPWH7YQxKvW5rhuwuN5TevWFYeebcAzXXYOq/TYBatK5Bh
	 sc8WMRW88PWKIMfhCjYlQh7Zi44rmpdzJIXC63nZjooGOYraNSjL8aPcd1wNlZWC83bJf
	 +enMddnzdduwgG96c3Uk3NYbXov2MzeRGPMc8Mu2sDwLPweNBQjYpZ6+LMqb8TmtAQqZY
	 AmSNmrTqOYVxoQ/YCsfaJy+BRUX3MZXm37l/NfWCHwLn1BfHyQhS4UGJ0rtDGS6uIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B6UIfKs58bx4eAIKKxFi5xP86AHmAWfy+F6/2hzKqz4=;
	b=F9+8h+INvTQRrWcEkJkH1+vdcWsvwvCEhpazKHhLIt6sGzg2ldNbuEOUmZwU1TttYmyv
	 oJo8DxjjXHoAnE7MJzwyRqvbgOrXsje9NX0DzFxLgjp7UQM++qR1BX9GBmQuYwGlHjSeQ
	 TKOrSgojBxQVST9EvjQ7F9m1IVqEiI2fb0ZuT7WLUMa0SILPUw7dZlWQ+pmJ9buxJLPqA
	 3TCWrQGAqWI2JU4b8LhE0s1TWB4EVa41tHyLoRBlUrNkcCJTDHoDRkUefIXfMvK+Hci3X
	 akt4X6y1BFma1Cs7kpwEy1eKsf8qBJUyV8mI5wgUvsdl6y7vXSwOWn96KpWBmoev2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GjCGTivp;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB07A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GjCGTivp
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06c60065fso244958b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759756; x=1794364556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6UIfKs58bx4eAIKKxFi5xP86AHmAWfy+F6/2hzKqz4=;
        b=GjCGTivpdL2uto6zhdaV5MeT0mycpcjDFJcuFNd5jFakQL+ndjKw9jxoALmytm3GNU
         CcnOsydefnEtgpIkyV0DM6gcktjmkyAkbvWNwHm83Kzcg7sRINUNXWgPFcnGOOhAO8im
         /yyXTrxVYfPxZKnCL4rBmfcYfN39409JHKB78KnI9BpoGGje0gG8d4a0YYKwHphHfIXi
         /kbY8y4FtGXDyvrW98jlFy5aGJGB3kAXlkd0d/CC2VZ6IF2wKN1X1jmhmGQJ1G++cxcA
         x4nmLB1FmVkb7F+nkegOxAnlcgVPDBibvsKTWSx93WoYZHFlFk94h+qvoaL0iOpV9sB7
         4q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759756; x=1794364556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6UIfKs58bx4eAIKKxFi5xP86AHmAWfy+F6/2hzKqz4=;
        b=n75zhhOu13jUcJLyBr4L0X4ey1BYAfLvSzX1UtnLAR3HQGk9NbGcQpcGBYbN9zVb0l
         J+JUmqgPzh8pB+oTXbDfuPR6YPYTwLALD664Zokh4qVeqYxornpI/NR7TSaCytR1pMmE
         wzl7Bu0B5zBH7TRP1PLQh4f5Lq3aTeoHtsJ20dWhgAPj2Q8tniBokvPlxo8v0ofEQKjW
         qNYoY+QyZuS6cW3UZdup2dNCld7OvBmqM6pk3aZZj+wTuOrhY8PKQxeYe1HETVhchxru
         ObdTA0gH0sa10bVnktYda6evGgHyP955gL08T48ZwYZW4xyhCYIHNoADScmT0BE9/VzC
         x5oA==
X-Forwarded-Encrypted: i=1; AKwUvBwmnb4FZQa6oGMDp0oKv56QM7VScvfYRdB2AsgnIJUQw/siyeOyWfyxB4TDYiSnEOgmhZLWMWxUythqiUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/86B4aZ6yLIePhNpCVijPBsP4u2Vw2e+frtbUazxK6bacpk8+E
	Kcx6Lgwd0Dt8lbsC7FoV+/x5B0RiuF8NvQp6gQ1ohI1XE6A5EyHRqo6xl86BFAhOtZs=
X-Gm-Gg: AYBFou01Jefyv1dXdsxB2P4ExYrmgf8/nNVAZFWaegErC6fSEpKwF0YvYE0h52oHQ/i
	1BGNjHGnuFEr8rdG/IKw53/vo6ko4dLfcvTHdmmxIPN0N4QNpKUaCEHUJ6scvq1yk9LA5nPdYv3
	ri1jkVQLKL+5JPI7H2rJ1Qzg7PreAnNK5oq4n1IfawyzXALpReRXc7/1oPgHfpheb14NlTNk0Xh
	fLmKT6iQr7YCTkg/OsMAUOm4QAHN+Hh17ofExtN2OtPunE8ytQ05do+seQUob3frUcNkwqA897Y
	fuqaj3GqLLyLYUaVHNC9I5j+PFVs659yiINlHlNT1WF8uvIkFKL3dBgqTxljb5aw+RgW/0HP0eV
	ACU8UgXvf/94fU58zmBK+1jtHxeSeoKYq5P5QqJaJsIPUno6TQeFJoNATF+VgOpf95Dx1yet+yv
	t9L60WufVy4Df/Wi1WNGx5QoYbVdBSJp90Gogc1GroE5VxEgqIwwazm3pt2C8G2lN4MZGp54TJ9
	Lw90jb4OkLA+PjAtNHrXFhEBisUeotlh6X63kiR+qLYB7Z69P3ta/kHPJamEg4oT5IVpJL0ox8M
	2/baIZYHvlN/kiXKnSwN/xSsZ+sdAHBF8LZlbIxm7UjteW7uRg==
X-Received: by 2002:a05:6a00:3686:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8a9bcff6b2cmr12847979b3a.9.1793759755682;
        Tue, 03 Nov 2026 18:35:55 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:35:54 -0800 (PST)
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
Subject: [PATCH v3 04/12] mm: hugetlb_vmemmap: generalize vmemmap page allocation
Date: Wed,  4 Nov 2026 10:35:02 +0800
Message-ID: <20261104023510.260766-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
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
 mm/hugetlb_vmemmap.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0e5b2b182d1b..d3058e106795 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -334,26 +334,24 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
-				   struct list_head *list)
+static int alloc_vmemmap_page_list(struct list_head *head,
+		unsigned int nr_pages, int nid)
 {
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_RETRY_MAYFAIL;
-	unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
-	int nid = page_to_nid((struct page *)start);
+	LIST_HEAD(new_pages);
 	struct page *page, *next;
-	int i;
 
-	for (i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, gfp_mask, 0);
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
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
@@ -374,13 +372,14 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
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
@@ -527,15 +526,13 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
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

