Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497552;
	b=WltrixgBkKehU9sptMtAoLi8nk93xJ3rVuev4vZhtoOqgkMlqTxQHk0eEeaRSZKE19Xk
	 g1Av4XjK+qc84TygUvxlP8kjLbJ0iSe1Jso2TwWho72oFlGTh0eEBTJv2w+3Vw7iNSynh
	 J/rn7CLugheyiSmUSuNiEvzcewXfAXmrPCRgxlipYVDWmadl/O/Ig2uTfaTlgAuDtOTjJ
	 9Qzl9TSj6ryTUpNpcw6EcnovCysEPBg2QaVTqMIzTQVGkNlpN3l2PBHyqRb31+B7W4N+B
	 gqnz7yOWMR2B7LlzTAyRwztNaZJVzQPuOz3pGctENf5I2Z/RaOYiXT7JMwgvfI8gXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgPekKjovvl8zoMfDt3tTZBqBHO/YqQvoPiE7cFhRPs=;
	b=x5k82ZSjgv/S+dUidqVWBIIN/bOQWZR1OJ6QCvzmgb7bQim85g+peklc0eOQZd0IGoTR
	 3vDUlR873aywllZhpxtAiI0T1O6To+rd1hmvfJjEuNN85zVb0WgQNTRD2z1qxExO57e95
	 9l09MPvDdH+WLo3rS//cfnuQK25520lohpAnqlSU7PUWYgJX3NtcG5Ie6NOj5v6sw7NaG
	 gxkGv5MjkkxftNMXDtXRYt9zTNIFeQju0AWAWoRFa1ujT183Up5bxx5IcP4cGVaIct0y8
	 X9z1sdJTbriNo7z43ZMX6/2M847uC4o9Pbpvssm04/Cwwn8dIiSfblwsyO7UbWmdN9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="Tz/SCs7g";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA3660A4AE0
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA3660A4AE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Tz/SCs7g
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so342275a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497552; x=1793102352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgPekKjovvl8zoMfDt3tTZBqBHO/YqQvoPiE7cFhRPs=;
        b=Tz/SCs7gVkMDRDETwExACXlyDKfU/MVoA8ssyQfZjvVRwy1rrwKvIzEDGgA1I/Fwbr
         3RFNQz/vkBZbGM0V1p4QEgmxrKz3YsnAJolbMUPT21pHSgESSK8AIP/ILEWz8ExHRSs4
         gkuXnKzOGdGGBWOlRfF1xyVLx1DhlCFikoFHlpQcExAok7Bmrkk6+6jJnvdUGonpvjjv
         8PKOrIeFGQKC38KyzNp5Z0qcB1N4ogYls+oMYMNqo6PGeOVdgt/YkpMUX8C8XBkBO67n
         kBdJGRupRyT28IATTMXa63dDosRgbLsxJGH0+gdyOT9/kw9UCK1GDkWr6fVmMH9nDZNU
         r/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497552; x=1793102352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgPekKjovvl8zoMfDt3tTZBqBHO/YqQvoPiE7cFhRPs=;
        b=lTk2Qmzx8ES27V3ES/uX2gjwlLBu43LsD7iD2zX74coE9tSiOelTN/8Q0U4KuocLd4
         ptP0DMOL6DEH6GdPBX4zDrzE5tAmalQUZ3TcHBQXzchh1MZKS3pFxriaVpXALOpLd7BS
         g4SbqKVEnp/8wEJm52qMQLySX6jgFHBWVOJu2MGybvb1ND//3oEJ6vXGA1ukkqjJbICZ
         CmJo2NKsoqs6pYMIcTItivQhf052E6e1FYNzfmTNJgVw/FmjpZUo/6FIhLYIv8PEXf2d
         Q6LFwZl8Brib+U9rVVqil7t1Vo7Qxx5WSfr1wQnxSOQxhdb0ry/7fNAsgNbB4pNQ4V5D
         JCNg==
X-Forwarded-Encrypted: i=1; AKwUvByG5gZzSFqhqyHN60DyPHDTMzEvGqZW5oSpeHn6q8inAMeR5fLLULrWfR3QuaYtEY4xxaOocDdRAquNLhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC7wvGI+NwPK/pkAJGsPnn0DXjQ+8o9AXhFUEO8FgY2KMueZr8
	GycjFkLVIAe8i9x1Mi3JcrcBp0a4GpbQ4o4V+3MwJVvhq4iLdW5vTNR93bBfuq2ma0U=
X-Gm-Gg: AYBFou1Eomu//4DH4/G3dATy+T7D0v6+zgwomgG0tjvcs6RW/cHw/rtdNvwUmLNrLL6
	hCKMmwiRvVEsCLrCYc1rmAkFSxFKUpSb0FR3DFoPRuPUbo9h1fdLvq+vFVF011QeNeATQk2v8hi
	DZ5kR1zGqpkynn7xoakVAAYXntZPBN272TMwbhzzqkeYVM5PgUCte3Y5Vj/NKf3mFmfyJyTIZLW
	lZISuNtrFU/81RINPs+UJta0F/M1X92MctDCNkPyuA3EWMr9K/B9jSOH7NjTbBLItPSUvw/gA+N
	ivFZUtyEo5M8LSg4G5gWo7v9tuYrXD3FCjn2b5QzfnZiunJDkWCZa7BlT8W3If0WRtZSYRGH//c
	9uy98LoLqIoZNjdGxtxUQkXTpe8Yzj//rgMNdnKBCcJl0EBPsRBoMdKrfFO28YRVbkIdJhqpAmA
	byIpCQ0tok3gvD9o9bLIm6ZX0yxAHfONvvy6T9kWCMh27fyqhEV/CAzq9C+DQSvic6wx9GG0Srn
	2/io4Vl4MXAQQEWJMYeiUKllf94piM=
X-Received: by 2002:a17:90b:4b0d:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ad64bba7a1mr1118419a91.25.1792497551857;
        Tue, 20 Oct 2026 04:59:11 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:59:10 -0700 (PDT)
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
Subject: [PATCH 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented
Date: Tue, 20 Oct 2026 19:58:24 +0800
Message-ID: <20261020115824.823278-11-songmuchun@bytedance.com>
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

Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
operation, but the current interface exposes a raw address range and
hardcodes deferred TLB flushing.  This splits the common mechanism
across layers and couples it to the HugeTLB batching policy.

Make the folio the unit of PTE conversion and let callers select the TLB
flush policy through the folio-oriented interface.  This keeps
HugeTLB-specific eligibility and batching outside the common operation.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2cfb88dc4fba..75ab5584abe3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -297,20 +297,26 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
 }
 
 /**
- * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
- *                      backing PMDs of the directmap into PTEs
- * @start:     start address of the vmemmap virtual address range that we want
- *             to remap.
- * @end:       end address of the vmemmap virtual address range that we want to
- *             remap.
+ * vmemmap_pteify_folio - convert the vmemmap backing of a folio to PTE mappings
+ * @folio:	folio whose vmemmap range should be converted to PTE mappings.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Convert mappings covering @folio's vmemmap into PTE mappings. If TLB flushing
+ * is skipped, the caller must flush TLBs after all pteify operations are complete
+ * before remapping the folio's vmemmap pages.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_split(unsigned long start, unsigned long end)
+static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 {
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= NULL,
-		.flags		= VMEMMAP_REMAP_NO_TLB_FLUSH,
+		.flags		= flags,
 	};
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
+
+	if (!vmemmap_optimizable_order(folio_order(folio)))
+		return -EOPNOTSUPP;
 
 	return vmemmap_remap_range(start, end, &walk);
 }
@@ -529,21 +535,13 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
+static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *folio,
+					unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	/*
-	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end]
-	 */
-	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
+	return vmemmap_pteify_folio(folio, flags);
 }
 
 static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
@@ -577,7 +575,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 
 		nr_to_optimize++;
 
-		ret = hugetlb_vmemmap_split_folio(h, folio);
+		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
-- 
2.54.0

