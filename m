Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912820;
	b=l0+jVVYineMDBHSqXTLiI8sROfgyUs3H0CiaGcuBSjLfuHzWCnWEij6mYNPy4HCiQGbS
	 tt3uSz1M3f6nCd6NfZJqLz/siozuRDnOQNHznlDPCiTFYSMThvkxX2jGI9kntuWWDIIIe
	 BI1RZcZ54bQHJQeqsCAbShD5/5Mc5+k6Dfk8rDP+I7+DWV9pYK83QzqwYcCThWyp67HYQ
	 HYZrV8V4Twt1+yAbDqyaZcw+edFYfk8ap8pbq35TYmLO7soqWYZBPms/7M7GLlYpwSEo2
	 NT1rXs3DGusoDw86rtebFnOG3Z5fp9Y7WG+j7l3aaSLMRE8eV7Z6E9AdftdB/Spj2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912820;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fT3Jad9DgAzKR5zvAS87Ds5ad4/2/jBDqrtkMOTLmbM=;
	b=JqKZi7znZxI307nY2+izPLN9AMECOltaibtkAPdIxsyGt1MUKws56H+NHBg0VpNfXohj
	 jZFjFmTfDu4IOQP3Lp30sHyAeFySts3Oe5qrcC5UmgeFc+cTq4vYrXo3jNf0gRsVpF7Zt
	 kcGJLoTmuQvaXYF1R4qTERZMB9nLy1rVRJhzTc4NamUeBZurlCEULpNS34k2TZ2ZiTN97
	 jH93U7zJEYMUEX7UHOKkb4fZwZtdNY5J8sSLPbaCFqkcVHaSqKjngjuCx+LSoYwrNstcz
	 +tXSdTmnYD7pZHJvW3Tgej36xAkL0NkXJf+vyRRnVnYqTnFHxPYVcTNgSpHbTj52/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EAqwmjiy;
	arc=none smtp.remote-ip=91.218.175.85
Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671F5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EAqwmjiy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YFNiLL0I2m3i/6cux7HexDCrpEBYBYGPhPSttFoXzUo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794912817; v=1; x=1795517617;
 b=EAqwmjiy79+Z5SgK11fBMosiZI3dH19WB4qihM+Fle0FvohwkOd9AgN1nA8IddLGqyLrXFuw
 oJZox1IhvoJ372DRxL1YlnhFvwvgVvVEBJkqYlFkOkNhBAA8Z5DCBek5XSMCXBIp5ZStd258rer
 IW640LClb/zsCeZ+KxXXvMZ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 97a83f3fbac5ab3b;
	Tue, 17 Nov 2026 10:53:37 +0000
X-Mizu-Trace-ID: 97a83f3fbac5ab3b
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Tue, 17 Nov 2026 18:53:12 +0800
Subject: [PATCH 2/2] mm/hugetlb: remove the gfp_mask argument from
 alloc_hugetlb_folio_reserve()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-for-memfd-v1-2-fa68f433171e@kylinos.cn>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
In-Reply-To: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794912797; l=3157;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=IjnOZZrnZDKRLDKXw32+ol/AbXDeQpA8yo/PMl1put0=;
 b=aoZXwGlYQYYqDn+g+4J6nl2sZww5iBP8Mz0QhL1bZCaCmHxrvz7lIcPdeOHvFAV9roYI82w8y
 OCn7pyxA1VYBEateZai1fyl8qKGeJuurzqktUPxlmZH3aIf+j//3fYv
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

alloc_hugetlb_folio_reserve() takes a gfp_mask argument that
memfd_alloc_folio() always sets to exactly htlb_alloc_mask(h), which the
helper can derive by itself.

Derive the mask inside alloc_hugetlb_folio_reserve() as
alloc_hugetlb_folio() does, and drop the argument.

No functional change intended.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 include/linux/hugetlb.h |  4 ++--
 mm/hugetlb.c            |  3 ++-
 mm/memfd.c              | 13 +------------
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 69732e4cc03e..a88c59476e79 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -735,7 +735,7 @@ struct folio *alloc_hugetlb_folio_nodemask(struct hstate *h, int preferred_nid,
 				nodemask_t *nmask, gfp_t gfp_mask,
 				bool allow_alloc_fallback);
 struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
-					  nodemask_t *nmask, gfp_t gfp_mask);
+					  nodemask_t *nmask);
 
 int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,
 			pgoff_t idx);
@@ -1161,7 +1161,7 @@ static inline struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 
 static inline struct folio *
 alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
-			    nodemask_t *nmask, gfp_t gfp_mask)
+			    nodemask_t *nmask)
 {
 	return NULL;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 88c9aa700533..e84203406da3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2221,8 +2221,9 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
 }
 
 struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
-		nodemask_t *nmask, gfp_t gfp_mask)
+		nodemask_t *nmask)
 {
+	gfp_t gfp_mask = htlb_alloc_mask(h);
 	struct hugetlb_cgroup *h_cg = NULL;
 	size_t nr_pages = pages_per_huge_page(h);
 	struct folio *folio;
diff --git a/mm/memfd.c b/mm/memfd.c
index 8905e3e9efc8..08b9d54b0d8a 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -69,22 +69,14 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 {
 #ifdef CONFIG_HUGETLB_PAGE
 	struct folio *folio;
-	gfp_t gfp_mask;
 
 	if (is_file_hugepages(memfd)) {
-		/*
-		 * The folio would most likely be accessed by a DMA driver,
-		 * therefore, we have zone memory constraints where we can
-		 * alloc from. Also, the folio will be pinned for an indefinite
-		 * amount of time, so it is not expected to be migrated away.
-		 */
 		struct inode *inode = file_inode(memfd);
 		struct hstate *h = hstate_file(memfd);
 		int err = -ENOMEM;
 		long nr_resv;
 		u32 hash;
 
-		gfp_mask = htlb_alloc_mask(h);
 		idx >>= huge_page_order(h);
 
 		/*
@@ -101,10 +93,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 			goto out_unlock;
 		}
 
-		folio = alloc_hugetlb_folio_reserve(h,
-						    numa_node_id(),
-						    NULL,
-						    gfp_mask);
+		folio = alloc_hugetlb_folio_reserve(h, numa_node_id(), NULL);
 		if (folio) {
 			/*
 			 * Zero the folio to prevent information leaks to userspace.

-- 
2.54.0

