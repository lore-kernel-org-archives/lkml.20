Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589998;
	b=Dp5ktKVwLWj+oY96CtscwOfHlMUTuG8vzYsTTaCsTjZR4SVtuiQluyI+VEahFJ0pArvK
	 2IlPbYdxakTM2cgTCQ32zdQu87C0zPS01hQXiIbpH2c4HY+cQ5tcT7X+e7gHxyMu58A29
	 TfEKhLazzYILlSq0Ee/P8onEUcIt48ZJNeB9CIyJfu7A8LUrw0g7MR7fywXbhFvdB+nwy
	 uHpNoCbe8nuGJiX3SF8EXPcBtrRLHeng+ZULFrEm4Da6v0FnUQru7e5VAEUTMwzilrxFl
	 xqPZNHMkYWsWPjSlww5xURSOGfGGp8UNfzbtPocL45edC9P3DPUV8atXYBLcilkwHsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rtjzOv93ZQQ1NtevyfPlHmlaYatVtEvSfGfez3JEDoc=;
	b=ujnx/X5Xlc9W02KmatRshBMajjq6mSrj5wl5JToh7EkXp1HCpJSYbipQqrqj26RZn/tS
	 bXoq4fUbW1ETY5EyiZvr+X8oyzMaQwL5dM1tfJetfpfvsCV2v48nARzMPbqIooi3f0GFs
	 QO0g0EHP3XRVxVJWPKrk3fDEQoV+VbJyyaorRyKa/MCWcgurk1hV1X3TthtEoiIskPVb9
	 +U7ZPw0A8m7qjHdHiXSS4dbfGob6cbPMw08S3y2BrH6OFzEtB+Hv40xdFvFRd2K4Z5t0z
	 F/6SlF5u59/e2A5dwDNEv8iY9+TT+NBSKmyOqH4Gj6d/f7+iglE4WD3NKizKMyDYb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X1qxkHpO;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB9606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AB9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X1qxkHpO
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1279772a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793589997; x=1794194797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtjzOv93ZQQ1NtevyfPlHmlaYatVtEvSfGfez3JEDoc=;
        b=X1qxkHpOw9IK3DmNO1wtLTRu+uE6SJMmVJUiYLMr5jO4o+SSXfhb+G4kBF/DUnFjMo
         6/v7WKN3xi+Um2YiaswC6oUUddln50VpPOHvAxBH/7Z0Ze+Y/eAGn7Chn0I/rLiiQQQB
         dKCbViWjFHXneyhGgxfSaNl7B+++ZxnGR8G2BKj1pBOENLa32uUEG9jVjheewayQ5vVs
         sxQzt/oUsbs+a3BYeSSjh8lcF3UvLAIsI3W7HoSE4vDwn1LGtAHB3gH+ooK3pZ2LSFeR
         zYF/W3eH8uOGG8m8QyWwXgKUHOTbEd9DMQwZZYje4dLl/2BcY5CfOjXnVQsp2IGM5pxB
         ohDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589997; x=1794194797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtjzOv93ZQQ1NtevyfPlHmlaYatVtEvSfGfez3JEDoc=;
        b=Y6ktApERVK0yl36m97bp0f+qNAk/0V0TE4AnJxeI14WOFVUxC8DU+zydNQpD36A+PQ
         nfcZpN5sunHAYpV5TifA8GI1jVdfUaQjECoIX9D579c4fTPSTxG0UeIzGa6FvrYc3akE
         ohPJu2r6Xi+a48lZvhWg0la8vivp9y9ZSUptJDYxJFqNsuLzv8QEO9iW2Rr8+MGKKLxo
         z5Fg+Pj+mChM4mInreTxcsOL+W0IXEJZVCaeLgf64Vmlm/Vq/AW0GulV9SejbcMWsfHY
         nCwDjSpG+13koUeD9bEFquS3gVTFyg7FpyMyqQfqreJIQyWckKKMU8aDykPzZcfvS3bq
         Fc2w==
X-Forwarded-Encrypted: i=1; AKwUvBwysmzTLw3GdDYZI9qO9MTmgRfJi4VQM61xkFtiORbnsdvEzhKY3w+XJH9gMYFCByAw8tQC9i3qCgq4iuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FHk05nkSvgL7pomzaOI0HguC95u3O2PYVpiudQaqlh1AEQ2qG
	6enjeiPdxVou9YEBekbpL2goLE5F7nFDVP9i5T6ogQOiui5e7a18g8fXONhopo+i920=
X-Gm-Gg: AYBFou3B3JzDxrPDFcA1qd7wqvl9PzR+AvApFZPhR2gSvT8DITZcTPL62iaQvWVTwBU
	FLa/MZ0aOfVBMI/pYL0lhjT16xmd6D6b/wO0i8hkI9C6NVS/tRZfef0obcQJ1Ku4Dt5L0T/EXbA
	4i+yfIk1qutWpifO75nLj3jS0WnkoijM+5CaUwtoxXh7iKTQsLOyuoOkP5WTlsZQzflcQMS6MAb
	FdX1DArkGxkDK3H9Dj3xj6qwpd1bYOazsVI5KkygzVf8NYpx4dXV7yZ6MqBBLXaOb3wrknh8hv0
	FcUiLIqPee6kS9TNNzoT8nPHw9crEGwXvZRiJGDHpF4jBeNnDqAmjczzkvN1Zx4D8ybIpPP6m2V
	tWRnfFZUf2oN1A0Bhhh9TGwhFj+gnIUvZQyGOqEwsvh7ga04veExYprpMB79fkiaqsQheFNUM7T
	Qo3dodSk91jGNcDOPdB+yY9+bsoFMlc1vUz+t8H0flssj8tmG/QhETI9o8vVHsGcGYCHBr8H+Jq
	lBQPq1jpgcW/HxLfQRjgRUD7EdTscQ9zhQ1Kq01lN21UqLjL1gTwtPCd5K1VG7h58NUs1sCXucD
	jOaqcLoN1FCb2P7KkBk0u/WYOsjiNg6/KDwO7ePo3bhYhvYKdA==
X-Received: by 2002:a17:90b:5863:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3ae897f4f9dmr7296008a91.26.1793589996933;
        Sun, 01 Nov 2026 19:26:36 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:36 -0800 (PST)
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
Subject: [PATCH v2 04/12] mm: hugetlb_vmemmap: generalize vmemmap page allocation
Date: Mon,  2 Nov 2026 11:25:17 +0800
Message-ID: <20261102032525.3597743-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0e5b2b182d1b..4b20a8efc067 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -334,28 +334,26 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
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
+	LIST_HEAD(local);
 
-	for (i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, gfp_mask, 0);
-		if (!page)
-			goto out;
-		list_add(&page->lru, list);
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		struct page *page;
+
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

