Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018624;
	b=quKTWg+8SNl4GbQhIrSwNDPgbjJ+HXratWIQ5LIL5BcLR6FRsIDJ0MZD+LC4cBqFpGUA
	 VuAi0fxtqxe9Zr7ALPkfkS2remKZSEizbRon7l7uqvKhCvH1NlVHnz/nqsp3gwSBZfsPY
	 D3NeJbsNyXIfO5E8Kkd4XRvcV046iH9KxY+rJK2/lGdIGFRBhD9yE/UOlBPHVUWhYf66l
	 ykaxgo3paaQz68b4tr06VM3F9qco+Pj3gxnDuSVnhlwRddIfgvSVCiiJPubAs7GHf70+6
	 05ag41893rSjNiggGTnXQxgq6YZxTe4NXyWs2fA72HtQ6Ta4k9QBK98l6ToUU1/v7Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GTp1i9BduYTpsMZ/IMpoCtzJTxHjxTbrJBkyfID/DQw=;
	b=EkjGQEMykjc3lyoUDqbtfBV1TDz5/AxcE97TJk36J9WjDfXa8qpxnqHTZnXvKPn607/J
	 LSF7JgCf8exgE8WNz+zYs/7fwjfKzPthzw67Icynqh8NECadsjRr+WIHy8CKUzjmYUBhn
	 6HkCWLp0xVX/1T8IvU+xgPZPxAayDSea2bsmH68Mt+ZyJm3/HlOzT5eLHsiqHdfVjGyjz
	 hRQWIPUE+6mb8mUWKJpWnod0AHOw3HCEP8bty7Bm0A1Oqhwtk0pLbH8HHD5dKg3J3UhJB
	 lDeUuOcAchP1HCiLdDF4AShT2Sus+foV/pRZR/q+8H1dlFgNQkVhbNTtAAq4osD5x/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F5N4Uwjo;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423E606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F423E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F5N4Uwjo
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2035791eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018623; x=1794623423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTp1i9BduYTpsMZ/IMpoCtzJTxHjxTbrJBkyfID/DQw=;
        b=F5N4UwjoH23ihRq6Tpq/i/x7yP3YwBz9YUZHXPS5XMqHwWfmdrPT5xyNkP9XLfzyH1
         KGGE9wIXr4juyouO4figDv18UlfRCKfaexBTwL4c/iOscp9oluJmNwWRlsKvvU/VWSZk
         hXi9zik30FmP9c6EiUDT/950ufNr4JJNokxSP6a1+8ojXTAhlc2F3RbRNccIT5YoMCmM
         +dFWWrISbAKWH6Cu45yyLZxOJAjFiUtjGx+dNlY6xZRQN9r6VRHYFcc850FLvz+3XARJ
         03QIOv4bz/bCWzUzyu+/G15ymsAEvFwxmrK9jc45Ey59VygN8WjZr1xtGQ7/d40cR6JT
         NSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018623; x=1794623423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GTp1i9BduYTpsMZ/IMpoCtzJTxHjxTbrJBkyfID/DQw=;
        b=VR1G1Bt2x+oL1w+12QQmiZd3ipezVxeGu8muhy+3gu1KqCHdTVOJ4ZmYMVzGeBq1lk
         tr5h0ordsnOUKQDNtnBnRSxNej14TY/VVoZbagpbZRrdadg6nqIV5FWrtRemV7Sk2Meq
         f3Qr6aLUz2/5gExRlRX3aZ2j/gykxEO3WrENDAyXpst0okAD6kxTNHVkiPhkk8raHxnD
         WgAFm4sLaVT3X512KNcobj/3M8I6JqF97csU579h36GtwlpQ/0POAyBORZPON5FWO3P3
         jMD2tfqaOvSl+WdbUGCICJB6fTIi0LSWdqKkPkhDZLTX60MpJo84AGjFfkSjiGsZsp6J
         NxRA==
X-Forwarded-Encrypted: i=1; AL+hErFBM/E4wYGR0OvhL0ZTg7lujSQqL0UwRQ0zSwKz6I6HWcPXzIPAusY481ssbfOmqyWoMUCKVfxELR2knUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7XdCHhSz8Q2nDW7NYhYNc5mvnIxRRIAt8BRwex8+FLycNM5Pu
	tLyadqrz5YGWAZM3U7RmvNtrt/HBb6IST7mZprX2dHud0i8JopX8D/Hpjr/etCxtAlA=
X-Gm-Gg: AYBFou1DzvjlbRHEs5PyT3e7rv0CgzJl8NLltcgyNMFrIS1Z3J06tT2ToDPgKBVukJe
	PJ7vR7SDs2E3uYIeRvJ6rnyJltyxQ4SRLEwMOypnjU76KDiOEveemcwDdGp7+qQ2L+fo4PsHZ+A
	p4lzSVQ0Am5WkzOQW0VAdZP3d6lRDNH+8mbauydUADLCjMmT2ZcA8j+5KxSiSOF4Qk9FByByWaT
	dfPhBtVvuUtieS8RsnlzIVPiAH3pB3P/j83bm3gKUWMfXZnfBk2nEiwh+xHy1Wa7pfvZqSvi8Wl
	3HZD6ZkE+G1UbyKToWAuiuktCRaYjzGtT7luhedw/9dkmzyqV1/eprK659R6G5KyD8ZNDLcalwd
	g8josbQO4e55ccE5wCs/5YxAO5b5D8qYRC/z/n+uffCKtJe4z8FiPo4D8Su5vgypyTR2DY7dUNw
	5ZcAFBvtI5N3rhcdP7VM22BDQ7I+fLuny9+eaUv0F+jD7fjzjcStTd7CFjbSbDVZKAMZnKPT40v
	mbUDfdTgdxUytipVfheRo2J5rukVWLHXxK6YafRZCM7LqSpeIosn0vCknsH1Cm9B6yyF054dTYc
	PprQ6KnsocosYe8h69lmrPCoJOiNl8HRIZNz7c/pxHI+BxXXunhyXLnE7ih5
X-Received: by 2002:a05:7300:f195:b0:369:f420:8679 with SMTP id 5a478bee46e88-36f784c065cmr8122187eec.38.1794018623000;
        Fri, 06 Nov 2026 18:30:23 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.30.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:30:22 -0800 (PST)
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
Subject: [PATCH v4 13/13] mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented
Date: Sat,  7 Nov 2026 10:27:56 +0800
Message-ID: <20261107022756.77731-14-songmuchun@bytedance.com>
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

Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
operation, but the current interface exposes a raw address range and
hardcodes deferred TLB flushing.  This splits the common mechanism
across layers and couples it to the HugeTLB batching policy.

Make the folio the unit of PTE conversion and let callers select the TLB
flush policy through the folio-oriented interface.  This keeps
HugeTLB-specific eligibility and batching outside the common operation.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Remove the redundant order check from vmemmap_pteify_folio()
  (suggested by Oscar Salvador)
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Use two tabs for the new wrapper parameter continuation (suggested by
  Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b8c10671d53b..ba8e11e399b2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -300,19 +300,22 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
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
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= NULL,
-		.flags		= VMEMMAP_DEFER_TLB_FLUSH,
+		.flags		= flags,
 	};
 
 	return vmemmap_remap_range(start, end, &walk);
@@ -537,21 +540,13 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
+static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *folio,
+		unsigned long flags)
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
 
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
@@ -576,7 +571,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 
 		nr_to_optimize++;
 
-		ret = hugetlb_vmemmap_split_folio(h, folio);
+		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
-- 
2.54.0

