Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590017;
	b=gN9eyxfVfEeKJ0kiMSzYXvv4dEewLaFLKEB7lx6giJcdwH0P3zLksteu3xvVoLA3t9Dd
	 GEjG3chk1vOYE05Bb5Mpu0JdhXTNDgCb9YLXXpg+JDJdwksawnMt1U7omEggowO+zwnAs
	 /eRbmfY8/RzYAdy5BqceTxEpDsiuIKwGe5MiW3HMpsDqWZ2RO96JV586OWW8jDtAZitWV
	 U9H43vOJUs2Pi4u7dXwrae9QL8UixDyYSjsrCEnMM1/3CQ9yMz4bYqlVG+/KXTwhp3h9t
	 BHpp3/7OLi4yA8UNDtpjZIdDrc25sKMZYR124aRWyrdH0Ytj8GeppX5OBQLspJGoUSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dzhdjZ4hyQHE1HRM5dLGCKz9meGVOFWIYuM30E0c+fs=;
	b=IovRtJ2SFgGp2FlRuxh4ltAbqssm9NkXwQ4Rst/M9uPHwMZFhUTwLZmOPJ30F6904oKm
	 UJ5Sz7NEOmZj8qxxm6uO1z+J9vWmA6iIZqE5PnrYLbNmcv95LDVXvXhz++Q/7ylAbmDzn
	 dCW7xCoysEWh21uTAaKpdWf5D2MVByGXCTYo/Sf3t8/NnrPT+H8SyBMFXo9J149hyUM1L
	 L5YWuCVtFhZ1vkZx2ZmVIyOCp3B/nUTk+hXUGe6o49NrNIGQ2orZ/iC2UbQenYkndfeL1
	 Icy63+LUYy4tOYYJ20Es0pc3kL5sGcrLPT9U7O4UGjUgwuZh9awye0EE0NBNafEVotQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jghbHEfU;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6730A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jghbHEfU
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so982535b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590017; x=1794194817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzhdjZ4hyQHE1HRM5dLGCKz9meGVOFWIYuM30E0c+fs=;
        b=jghbHEfUKwoEfN1F0VaopD5qjqXX+0xJ3hiCfKrsG9oMSnXnAuAhyxGhj0dNMlHVlc
         K4enSDRqHvCOfRc3En2hYgCXsQsapMTYQJUzwdhu+QZDw6CE5o39CYLH6XXDCp/vhQaA
         BIYhPmwG8SnPtgG5A0kMbW6nsuVGZAxneXY9wTmO8NhvWN8kSJx/nwT7Q6W7Pbwz2gkk
         7IVimWM8oset2EWyhCvTLYeDOTt6oh94QsIWqUjp1C4HYEkXcMHarxNzDXdamrKbz+dR
         F2I4t+s84+YeF+Ju4XAaxl9T4Y5snkDAPVo/Y11KahCznn3ys3edyYSyDjB+a6slpwXF
         3nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590017; x=1794194817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dzhdjZ4hyQHE1HRM5dLGCKz9meGVOFWIYuM30E0c+fs=;
        b=l+fFa+WTUePUUVlVls2yoOenhPg0/+F+JgGkzxfU04n3L2T5JGcTaxszBij2st/VSb
         Y3FBW7lzEiEKCxvBKtgZESodWFp1igUdi/FrUVqOmYbZacEwuvP0n4hemv/d4o7R4ruB
         p9LrCapR0lvoCn4nxLkSYLTb0TuaZcpK0yxYPjz30iQWxzl3V03E9tZn7kptCPuk8rCP
         k0n8pm/IWAE5yfA3B2Tcw2/rakgH0LDF51JJOvSr4kaHdMf+Yz1yGlFftXQYDVQDziZA
         Lr1vSWkPq7B22dyDstJMiBuHhCelL+u25FPCDvcSdfV4+F9ZSCcEA3IBZ+3fAxvrmFe9
         sFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx85KSxric4ICxuCz1y4Oa0G0o+KGMiduGmBooVRYyJ6z7drYZoQ2b1z+p0xfU+Ri3UU2DP+UxU2ljEME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UMtSZSbIVRHFA1BAj9W6AumL8vI6+ejqJ8jqL7NSQ2sFNuuvC
	V4XzXIoeEdvhuIxkhhfeSkWDHJHmxVbAKDPAiJf31bJRMHraX1lYd/4bzQzvHYDiRL1p/kkKhc7
	11Off
X-Gm-Gg: AYBFou0rHdlI44JrE2hoT/NYU2MzV2GEbbsTFtP8t2fUWWRS3U0YbNLTaOd9lbHl5ez
	n4HZRXoWhWDamDCNDhLovbav7/BtRaD5CIn6hiW7oj88jSUOz4nGUiPxdquVVnRCQgKl0X71BPY
	KiGXlrldrxoOAslbleWGHmBBXh++m1JHYjzvN9T6TXkcBcHZPQww4sWTYFtsGFWDRWhDXlPD6Qr
	Xmd9D1eR/mNYCOErJ6Iq5DJkRmTsMrIJoMEj9+BO0uF1JGvWrOjUN8ru4YmMntLkZnavvyV+X17
	mrBI4MaqF3bz9J3SRlY3c3Iu8Sd85q2zmUnZEWFcNOY63nBf5a7hWCiscQhzd/gTIpkJAzQzHOW
	xU3FH3Cj+jXy1EWZuesxbM9/xk6WQZ85OCB6eyTDt/SQH9KzbYHUxctzcq+CtYObr+VU5iIY78x
	EfHIG3yJjY2FMCfxEj0l2nfPVJktzZVhQPYknQLweeKpIrJL0DKkkeCeVdfm7xfUituXLzEct0h
	Wubtg6GjHxUYryBLSLob5MLBk8HchAtvi6dTiq3zOijyKse9ywxYPYpidVIvHrxf7rSmRSX7rCw
	LoyRZPGPv3QzS4htkSNlYAOsTUIFxe5CJiA1qKzni4g/7yY/sg==
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3ae896f8304mr7617976a91.10.1793590016392;
        Sun, 01 Nov 2026 19:26:56 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:55 -0800 (PST)
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
Subject: [PATCH v2 09/12] mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
Date: Mon,  2 Nov 2026 11:25:22 +0800
Message-ID: <20261102032525.3597743-10-songmuchun@bytedance.com>
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

Vmemmap optimization operates on one folio at a time, but the current
interface exposes a raw address range and requires the HugeTLB caller to
prepare part of the operation.  This splits the common mechanism across
layers and obscures its natural unit of work.

Make the folio the unit of vmemmap optimization and move the common
mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
eligibility and state in the caller while making the remapping code
applicable to any eligible folio.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 67 ++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 244cd8a0c78a..14390ee59ba2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -233,6 +233,11 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
+static inline unsigned long folio_vmemmap_size(const struct folio *folio)
+{
+	return folio_nr_pages(folio) * sizeof(struct page);
+}
+
 static inline struct page *folio_vmemmap_shared_tail_page(const struct folio *folio)
 {
 	return vmemmap_shared_tail_page(folio_order(folio), folio_zone(folio));
@@ -302,29 +307,39 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap a vmemmap range and collect old backing pages
- * @start:	start address of the vmemmap virtual address range that we want
- *		to remap.
- * @end:	end address of the vmemmap virtual address range that we want to
- *		remap.
- * @vmemmap_pages: input/output list whose first entry supplies the new backing
- *		page for @start; replaced backing pages are added to the list for
- *		the caller to free.
- * @flags:	modifications to vmemmap_remap_walk flags
+ * vmemmap_optimize_folio - optimize the vmemmap backing of a folio
+ * @folio:	folio whose vmemmap pages should be optimized.
+ * @vmemmap_pages: list holding replacement pages for the remap and displaced
+ *		backing pages for the caller to free.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Remap @folio's vmemmap so optimizable entries point at the shared tail page
+ * while non-optimizable entries are copied into replacement pages. Caller is
+ * responsible for freeing the pages left on the @vmemmap_pages list, even on
+ * failure.
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct list_head *vmemmap_pages,
-			      unsigned long flags)
+static int vmemmap_optimize_folio(const struct folio *folio,
+		struct list_head *vmemmap_pages, unsigned long flags)
 {
-	int ret;
+	int ret, nid = folio_nid(folio);
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_optimize_pte,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
 	};
 
+	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
+
+	if (!vmemmap_optimizable_order(folio_order(folio)))
+		return -EOPNOTSUPP;
+
+	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid))
+		return -ENOMEM;
+
 	ret = vmemmap_remap_range(start, end, &walk);
 	if (!ret || !walk.nr_walked)
 		return ret;
@@ -489,16 +504,12 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct list_head *vmemmap_pages,
 					    unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-	int nid, ret = 0;
+	int ret;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
-	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
 
 	if (!vmemmap_should_optimize_folio(h, folio))
-		return ret;
-
-	nid = folio_nid(folio);
+		return 0;
 
 	/*
 	 * Very Subtle
@@ -512,23 +523,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * the TLB and clear the flag below.
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
-
-	if (alloc_vmemmap_page_list(vmemmap_pages, VMEMMAP_OPTIMIZATION_PAGES, nid)) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	/*
-	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end).
-	 * Add pages previously mapping the range to vmemmap_pages list so that
-	 * they can be freed by the caller.
-	 */
-	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_pages, flags);
-out:
+	ret = vmemmap_optimize_folio(folio, vmemmap_pages, flags);
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
-- 
2.54.0

