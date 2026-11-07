Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018586;
	b=pJ3OaP4UKf8wcG1Z7tb49qkSuEUSW6UaXpXgCZFI87ohMzk2Z9gj3gH/CxWDeXGyvwQl
	 41R7OMTZZIkRkTXuDv0OADU0dykl/VdB3FHweFtMvElMulG045dghjiPExqR6Hz6WLYCT
	 /tAgxFAlGCSdJVv88zZg4UEyleqArGvaM5CBM7ZBXpyrlKUQTL0xS4Bo7vH2nSr4qeX1t
	 3BhCT/mGN0lRpFkMKnrgDHCLmrId0eAQ4ATblbu6KewVZIYdyWh/L0M3Nn3Vpy3lrQOQh
	 Vmwq3EW2QcUbyqrnoLUA7QyuW+lCpGWAvsZ3PkVlfBR/prwTP6FHxzRD3rsemE+QAkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4uCFWqPMTnZRtCRRA9qkII40/o+YhydxwOfnXOzxxvs=;
	b=rK7Cr8iNkPeaPaoguFlrdZOtXZ5a9X4QgKe7wV8JwyBmnn6KCHIoTBqM/z9fQutPEB8y
	 GmE0Ni+cNyuRW1eC8g4nyRltRwxsgij9ZBNJukbrPlvp9fE78U8RPcUk7iueXZia+6Jw1
	 5MhXHYOoLQmdS8IkWeAo049uEdGwM89MR0LepmHeqrHHMPaFs3aoCrM5gVspYWlFm2vuG
	 MpMZ2Nv0iyFMmIBQ69OLheIUK5RdpMIZ+UP3w80N+cJWejT1KGE+/DieJLd8BqwHBqiBi
	 8wXQ2XroO+xih41wdMv41QGIdSJ1Fo2gUUNtzLpUPUP3y9jo6WXGCyiQJ0dHd1658xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UhMcgY51;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5107B606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5107B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UhMcgY51
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3712b6d9843so36691eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018585; x=1794623385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uCFWqPMTnZRtCRRA9qkII40/o+YhydxwOfnXOzxxvs=;
        b=UhMcgY51mIgX4KxgHIqGOc0bYeWdJVWOJqsPxXh4PzB9JgCDcMQfzDTJFW93JaD/IU
         KJA1F85/A5U8yHNeOndBTYs+abrla7GOxzQqC/Ci3VoqpD4PaiO4ZzXCO4VveeaNyPjG
         vjJFkkkYZ4Nd1YcpVEVUNFaLg5eQGXNPSfhOpSQlOaaV4Q/X5OsToigX18Ao4He9JzSb
         RYxqkWsTQflM5aPW8gG1YY9KWI1FVlQNbwo/MPO+Ml3JbnrmgxjtFT76NdUX1IGIB+lj
         QFKrMrj/ygsWYC+yQ+qV36/fdNu8lfXRaNpfd/D+umg7+whcc8+0VCdhepWIwyxj2o5R
         N6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018585; x=1794623385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4uCFWqPMTnZRtCRRA9qkII40/o+YhydxwOfnXOzxxvs=;
        b=doLUu9v9SUVOSzhH2ar7xSr9Po6sSm/MHrX+0kNWz0cDbglryi/EG+jWBaAsEwH7PK
         Xcv8jDXftCswt9OUEWzRJRYpet5NFIaW5LzqW2A1l5NMU9sSXLL8sqKZPtJ9u++oC18E
         FuUGFJ34FHnRauoDBfL96pYaf5oID3I2pZTGi+U9QRfpS68PuLznW2CKHrc+8Xg6dBWz
         x06oWs0mqMgDLU4KiQ8zb0ANoqjEgF2y4bQI2tAvxu2X4GSSF2a6GkXBcDeisCO0yVfU
         n4cYzvSGQm3sT05TGIb0GqzfsVfqzT0oDluC+LQVsvTRkGQIDniwUNTGU1qP/NMJiXN1
         Hyow==
X-Forwarded-Encrypted: i=1; AL+hErFw0HKGw0uDXjOJ/lOxlyJLm3mqD9i33KJ/d7J0598ijFfe0wjF556gXWiPd9JPPU4BZbRJHiBBWN+tLPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4R/6CG182YnBv4VqhAzMh2652Wx644VSaClZr2zA56dnauGVu
	akV583dY/wlzWukD3OZwH/I3kBvIp6ZrSsU2qZrBuYz+KsmkBkVhgVJeXJJYxuFbQfo=
X-Gm-Gg: AYBFou1FBvoKn76jm/0BNjPy6zSsYtpswSBt+vuYb9PWG61MM0lXPkUZXa25wFpHZwK
	CGu6gTYFVcZ8vIPpGZC4Ls9lF2EAARDirdnPWEfOYgnF+RVpTmu2kzHJLhYUYbO+opmIUzzDmck
	LWRiwc4H9ofBzCDQqkttWKlR7qpG2DhMwjjxVe5x7FC5walYlFQN96yXOH4bFMWcT1EaHzUnQuH
	rTI38R6Pz0EcW4SKF5Bb8apA+Q52hd3L4H2zBMLstp7mOcRJXMlCcPhk+YuAAaPwtFn+aOYvFtV
	Wpbz+PP8OdX+plT8yFyhP9yHp/YKoXz8NbeJ235zqsGHvbxlWnvCFocqLKw9u/W+TKL5Hlt5KmZ
	0YZjAkgJX+V+2S13M8Jzc53ND///yLK8hzoUF30CIU3oW6ueqDsHCLMVBslt11XEbBOA9UKQSWp
	tSisar+/hwra3G929rQKYlwBNyaXMxoPrGW8yl6Af3fVBudtaaTyOME4SlN5hZngZdJtR+1aFy/
	IBl+pQWzDO7dlbLKbEXrIR6pzVpOXW+zClQPPjVN00QG+p24waWQcGmSr3heNrxXeFXLup2DNBt
	ZPVKZvWgu7UTJdiRu5czwJKKfTrUmUSZQq6kYiWvj+jB2KHt53rNlO0sAjHQ
X-Received: by 2002:a05:693c:250a:b0:36c:c483:7077 with SMTP id 5a478bee46e88-36f75b1ffefmr5101945eec.14.1794018585212;
        Fri, 06 Nov 2026 18:29:45 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:44 -0800 (PST)
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
Subject: [PATCH v4 06/13] mm: hugetlb_vmemmap: unify writable vmemmap page preparation
Date: Sat,  7 Nov 2026 10:27:49 +0800
Message-ID: <20261107022756.77731-7-songmuchun@bytedance.com>
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

Installing a writable vmemmap page requires consuming a replacement page,
copying the current contents into it and making the copy visible before
publishing the new mapping.  HVO currently splits this sequence between
the page-table walker and its caller depending on the remap path.

Centralize the sequence in the walker so all writable replacements follow
the same copy-and-publish protocol.  This keeps page preparation with the
mapping update and removes path-specific handling from higher-level HVO
code.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
---
v4:
- Keep the caller-selected allocation mask after moving page preparation
- Collect Reviewed-by from Oscar Salvador
- Collect Tested-by from Andrew Morton

v3:
- Use two tabs for the new helper parameter continuation (suggested by Mike
  Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
- Replace page_to_virt() with page_address()
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 290dd8f31738..d58f7a369c9c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -199,6 +199,20 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static struct page *vmemmap_dup_page_from_list(const struct page *src,
+		struct list_head *vmemmap_pages)
+{
+	struct page *dst = list_first_entry(vmemmap_pages, struct page, lru);
+
+	list_del(&dst->lru);
+	copy_page(page_address(dst), page_address(src));
+
+	/* Ensure updates to @dst page are visible before set_pte_at(). */
+	smp_wmb();
+
+	return dst;
+}
+
 static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 			      struct vmemmap_remap_walk *walk)
 {
@@ -211,16 +225,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
-		list_del(&head->lru);
-
-		/*
-		 * Makes sure that preceding stores to the page contents from
-		 * vmemmap_remap_free() become visible before the set_pte_at()
-		 * write.
-		 */
-		smp_wmb();
-
+		head = vmemmap_dup_page_from_list(page, walk->vmemmap_pages);
 		entry = mk_pte(head, PAGE_KERNEL);
 	} else {
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
@@ -253,15 +258,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
 
-	dst = list_first_entry(walk->vmemmap_pages, struct page, lru);
-	list_del(&dst->lru);
-	copy_page(page_to_virt(dst), page_to_virt(src));
-
-	/*
-	 * Makes sure that preceding stores to the page contents become visible
-	 * before the set_pte_at() write.
-	 */
-	smp_wmb();
+	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
 }
 
@@ -501,7 +498,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    unsigned long flags)
 {
 	unsigned long vmemmap_start, vmemmap_end;
-	struct page *vmemmap_head, *vmemmap_tail;
+	struct page *vmemmap_tail;
 	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN;
 	int nid, ret = 0;
 
@@ -534,9 +531,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (ret)
 		goto out;
 
-	vmemmap_head = list_first_entry(vmemmap_pages, struct page, lru);
-	copy_page(page_to_virt(vmemmap_head), folio);
-
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-- 
2.54.0

