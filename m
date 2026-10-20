Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497545;
	b=4hKa0bLoLi3aFAz9cb3M6fb9rGWym7u7+8H9VUHTtlHJPzm9ovzAPwngFzW+RIu/3nnw
	 ntdFpe73RYVVCx9jPks0ghbWe5x0Bb7L0VIq15pAVgv7MDmTLt7ea+ibOQCTQL0/xnhVR
	 Dk33CaT03nj7gO2CCliAiOkfX9Tx1sP1th0d4+K9029+IurO+BmSeSBWcnEViAxVmZL41
	 6nCQ6ez4W7qOYgaGkhGX9Vrku5EyNOJKgoNirZMFuGOWJ+OPoM2cKCYn4z/IZOld81d4u
	 qvnYfHH28b/k+IVjQIUrzZIt3IwcKWAi7fO+hVCfR9LJEEvyB2k4VH2glpiyhTCP4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/kLuwranRIcc6BAkD4t9DaufgZSf9Rq+8qNPAMIVhU=;
	b=bBsgkXoazkMtzeyKhZG3GpcmWZHFi4a8uvQ0GGuRzs5WP37x36WPgcqzsJmR4u6Qcd9T
	 rgcDbLY1we/mCKjN3Fyz2p5h/BqwQRwqKTnelo7+T2z/vtTrLhH67A0nGUpZtqdxYgH/t
	 ajbB8lsVu/qWAw9OqsgmhQXeSWYODv0nQ6mDAB6xtexG530mAP37WVMTt0ZG7xz6AiE/1
	 xW3iSvezN8dldC/16tlEgcNu9FQ/fBPWf4svSgkaHkSdWxeTJs1WbDqkDu0jJ8IbxQW2g
	 42MySe7kWNPYTdyJAshrr3FnIeBkxLT7DuT7Ul3lvznm4SMQ6xcM8/pfIrmmOmIOKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SCT3vTf9;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SCT3vTf9
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1514191a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497544; x=1793102344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/kLuwranRIcc6BAkD4t9DaufgZSf9Rq+8qNPAMIVhU=;
        b=SCT3vTf9lI8kvqHQElqgP7dGwE3fAUqlQIiXsPCJeyz0GC2QoshmUyuSt8DKaIWW4h
         p7z7oeTYmaKDkXEYolCn1PT+6FUIj7OtlKK4rsULg7oJru6F84q/CvkOpUa3cBFYE1Oi
         GYULiTxkSrQ2rw7eXBqlXDVVAHvH5UvVM95RLYahVY9yPcGnfaIbLrto6SCKPq4nqNxk
         kf/Dg4goQDewaKnksDnuVe5Cxp2iVChDS03D2jtU5ts8oPMOlIkaMWzAfI0t46UYYsx7
         ae+pNmWCTPA+NIhr1RUvhreaLNEpcc/210/T5GtHj2W4ch3aUHqFNZKn2w8LIlXZrV8I
         qkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497544; x=1793102344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/kLuwranRIcc6BAkD4t9DaufgZSf9Rq+8qNPAMIVhU=;
        b=dyKJd2UKYCKsQRsrj/ep/qf0BDND5yEjLsRvOPKdT0UMM9/KcQcvFlf2N/bLm7BCrf
         CJJI9yC00DPrEwQ0Luw9I2rqntNuQiv9KFiRpzPKHXHCw2bJdv+Vjobb1W6sGuPjpAb2
         jquMS1/tiirP8Lj5PWWPih0dLLlnq0VM5lbX5Etgy8l9P8mHH9BZzWgVeIa4peyR1lVe
         1NuLAmKoWY/Bj8EznnhrUYGiahZjbw/CbV0/KqMw/tssamEmYSXgOHmtlxZo5lHFe0FG
         hKBsYYqtt6e6bobaeTNEouGOzP4ULampXSoHi2399ASjAIc/7LEmMFFz1Jrcr/ZabRZE
         8i4g==
X-Forwarded-Encrypted: i=1; AKwUvBxpNX6VfA0IEz2KzFc5jLihjjTOvfx17ETAZRRwz9CGq0zd1NC+PxUFEC3pBJCDcd+bYp8UtTFQ3RhaYQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYICFn0txkhWvYVCUXiHzYkOK6ewb3uRUZHqo922S3DP4Imw1ILE
	5fDl9tG3569gKz5kveZwgZXhGRV25YnSYWevht+nXGEqajT5OL6UVXRxyE+hHH6IG2M=
X-Gm-Gg: AYBFou370WOvxRbkqNGlwo04mMlZ6+VdIGFfuN2TRUqtSDe6090MA/GEDoecF5gm1BN
	uMqyqgN59topLIVbyk0+K3m4MFp1g5Wvo4BCVCFDz6J5rMhUCpVMhC4fWmc0vQ/LfO9R8vBnRV+
	5mqR7pufd16dnxXTLwKhWdEXQQ+HxCg7V4QNPksQ7S8ZpwmYHBJwn8RVo9k/0QLImqjYQAZkGLy
	VIgPG8X+wRi8nxFG8DHrobAKPIWEVhjT8ysJk7ESZfEOhDTvKIvtPiLyV5HUAo2+s4MLPlaGD/O
	1cVWILiZO/uknNtawhi/7zBUmC64MFE6hicz4q83BwOeFBrnqBUrapYZtxX9u+wyMVsUG/vgwBa
	pGQKXz/JcmVeNDBGJ+aVcLIc+H+CreRR0bzaowv9IDl/qmv70QhRAnkruPGwwhio1SWcxs85sDS
	zQpjNbQ7zTb2h5wJuE0mkFBWH9ek3Od2qBA15xbvyvN8o7HM3Vc45kgAiSBXMa4SYoTAnLnx7dW
	524Nt8BhGacEJTyuZ1E
X-Received: by 2002:a17:90b:2ec3:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3acef134d96mr8468531a91.23.1792497544021;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:59:03 -0700 (PDT)
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
Subject: [PATCH 10/12] mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
Date: Tue, 20 Oct 2026 19:58:22 +0800
Message-ID: <20261020115824.823278-9-songmuchun@bytedance.com>
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

Like optimization, vmemmap restoration operates on one folio at a time,
but the current interface exposes a raw address range and requires the
HugeTLB caller to prepare part of the operation.  This splits the common
mechanism across layers and obscures its natural unit of work.

Make the folio the unit of vmemmap restoration and move the common
mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
eligibility and state in the caller and gives both directions of HVO
consistent folio-level interfaces.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b76203e34881..97748a9cefe2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -360,28 +360,29 @@ static int vmemmap_optimize_folio(const struct folio *folio,
 }
 
 /**
- * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
- *			 to the page which is from the @vmemmap_pages
- *			 respectively.
- * @start:	start address of the vmemmap virtual address range that we want
- *		to remap.
- * @end:	end address of the vmemmap virtual address range that we want to
- *		remap.
- * @flags:	modifications to vmemmap_remap_walk flags
+ * vmemmap_restore_folio - restore the vmemmap backing of a folio
+ * @folio:	folio whose vmemmap pages should be restored.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Remap @folio's vmemmap so optimizable entries are restored from the shared
+ * tail page back to distinct backing pages allocated for @folio, while
+ * non-optimizable entries remain unchanged.
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
-			       unsigned long flags)
+static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 {
 	LIST_HEAD(vmemmap_pages);
-	int nid = page_to_nid((struct page *)start);
+	int nid = folio_nid(folio);
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
+	start += VMEMMAP_OPTIMIZATION_SIZE;
 	if (alloc_vmemmap_page_list(&vmemmap_pages, (end - start) / PAGE_SIZE, nid))
 		return -ENOMEM;
 
@@ -399,7 +400,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
 	int ret;
-	unsigned long vmemmap_start, vmemmap_end;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
@@ -407,18 +407,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	vmemmap_start	+= VMEMMAP_OPTIMIZATION_SIZE;
-
-	/*
-	 * The pages which the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end) are mapped to are freed to the buddy allocator.
-	 * When a HugeTLB page is freed to the buddy allocator, previously
-	 * discarded vmemmap pages must be allocated and remapping.
-	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
+	ret = vmemmap_restore_folio(folio, flags);
 	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
-- 
2.54.0

