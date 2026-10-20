Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497546;
	b=x5+D+vXManuazvs08w1kBmNLP1W3m/dmAxSIFQlJ1B66uyjoRW2Sm08gIedCBcQ1CMvS
	 +J+ZqhU70/SCFLLS/4E8CGp0q5DevNwsMlWwPpS0zqHYGEZXfuAvDhk0nrKL6najIfCus
	 obZoEndFup+TKxprNjIAB/EYlnkxUJCuU1uQLLbWyohL4OrfgtD3sS31h+zxM65/sxfc6
	 AoKfFHX7QL9hhDE+4p+dioXeeRMBSWpbvvH84qw3DRnO3bJPzwQOLJuPgsq7oU3FuLSqk
	 ehWUxfGZ4JWEKtZja53/xaQOiB6LozeF6kDGq8Ln919FJs2Ql35mcQEbfR3EvtRfjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L5dsk1r4CpLxFzZUxacgQtAcApMHxSN0UPdR+VrmuZs=;
	b=aWQPEYtE1AKWfLwipLPVfsrZtAYV8ZsAUs5daDnok+AOJtK8PTBUTQj7rJbzasVnzaJI
	 cJc/72t42s+6ypXyv5LTTgqiJEUByeUzr+3tjOACQyOZwzBEnxopjqAuaasaaXBtyvs4L
	 ckQ63uzuSQYZPdFiF7wZLEvgkcRJj8kfN2G0qLdW5qThGqKj2pARBZO799Py/GCuI5Biy
	 hVXwPk+KwQDu3heUdAVGQh4klPXI+8LoMSBocLGIx5hM99dvggUI+yBc/u/eDPad63H/9
	 VXWe7MQn6bDzY2+InJ2J6rQwg/bz5mWPtb3gLQJeJEpOmZiBqGpxiBSY4ZSSzG8DT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CsM3pWmq;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B960A2636
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668B960A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CsM3pWmq
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1262609a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497541; x=1793102341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5dsk1r4CpLxFzZUxacgQtAcApMHxSN0UPdR+VrmuZs=;
        b=CsM3pWmq5YrCJYAyB8UH6xt9z1NqsQ71skOdErtILrqp7y44IGWrgWXVSusHq/rJk5
         1N6+y6rhuZad3BVOsF9BQ2DAbaAAZ9RUammK8PiWBSyTgg5/huIfZ7uM3dPHBprkRqA7
         hIT91o/Ftqbz6kxl5CnyE8hBb69lVZN5o5688gAdknO0zfg/4BUjMdhotYHVpkcO4a9Y
         36g0zVuBdWZE6Q9Z7D9Rwk7Xvt/JMrjoAOaIi7xNdChmT7WUHUwNob6o0RSzYDPN3Uxh
         HraSemyU9shhDaEty353RzzX0JV/YTpG8S5BYuxTAeWZJTz2S31Qq1qpUzLyxcZhD2xi
         95bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497541; x=1793102341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5dsk1r4CpLxFzZUxacgQtAcApMHxSN0UPdR+VrmuZs=;
        b=WVKQCKFpbqiYkHDYu4q1Yvzn600g4bBhoh+sSYgWiPCAtaVlk2H936vMZZh7SxjdpO
         ZRhdtrGenzFM2dwIVzSW15JlNWdzAUZGq8mRd6eo4sD8A1GCOV3y35L9vN3RvSDmU4GL
         8QInlKlfBDIsANSh/VUfAfKOkD9Dn5sJQH8kfLcwGEdKB9Yuob2AQ0SnEAOC/x6oQPR2
         HpTZQkkar1LwuO2rb5FeoOrIaSXRnRX72XtHkpflEmrJAhS+HNVojlMfvEku0Rk+RLKE
         5P0H1l0eLNqfkjyejzA3fFPK9r8LJI3C6ImRYMzC47LXLO8KtQg/P9OvaFCUrKZrlNlc
         r1/g==
X-Forwarded-Encrypted: i=1; AKwUvBwITuVnIBWf9MM0+PSRtW/97RPyRsEPXUvH570Zd8t1q0r47VhT/UHzTMMzm6U10ohbQbs7zWTulCGSml0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ9t6vkA4PAOpwVrmBQ2YTf9Kp3KXgeM5K9oi3FVf9dj/vH+IH
	lmTAQZ+kMNwJaNyAi3rD7v+YSCgDYERq+OTJsYGyOxlWUtg3pX/Q7+B/tho4MKgFWaQyss1k/52
	Zyno0JYQ=
X-Gm-Gg: AYBFou3FCiAEVxM2DCOg2lpE/W5cABC47q1XeapRR2QmgznuHKc/JtYPsl1kgvChFze
	UOYl1QHRTXOgzf47jkEZWnxQo8M9WBB2CkBkX5BkNxIZ5gQkTcFmaGW1rcBDt0Tm0thEptuYLwK
	VjiwlwNrddn3nfHs67yG35QZznzFIjnsdSK8FXHuRLadAU/xyJh+iL1j8qwAvAz8J+O5VeyerUB
	8wDh3Osl5xgdxeiOEH0J7HkZcGuGVL/D3Bkb11y61sIXS2iUzSy0lmm/CGa9ylnXKB/mwaHuPaj
	JT/uv4kUHP5N+0jZHkhHDlDm8COv1ihkd5aFUCDkDMIuGcOXnL5E/ADJT3Wzn1dnc0c+YReqhSI
	YGBSxGTKhQHHw+FCnahFf7hyNcaIanUAFD3lQCl0WJS/N9n1pVavWdD5ibbqwrcuuOXzIxbC7TM
	OJjMmKPeVXmLE8sgixHr824YEej5GsPJE9K2hY/bztWrSXz9CW8ojTh9fZg+tzY08wvPs2xLgeD
	YxizLXS+aKlt1cL/k8/vz/gEIRe7a57lzi+vmRsa3a/VERTZNmOQy0gpccftzmfA/rgZyZJUJBQ
	HA==
X-Received: by 2002:a17:90b:1cc6:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3acef3d6405mr8700493a91.42.1792497540565;
        Tue, 20 Oct 2026 04:59:00 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:59 -0700 (PDT)
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
Subject: [PATCH 09/12] mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
Date: Tue, 20 Oct 2026 19:58:21 +0800
Message-ID: <20261020115824.823278-8-songmuchun@bytedance.com>
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
---
 mm/hugetlb_vmemmap.c | 67 ++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 89f000227d4b..b76203e34881 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -232,6 +232,11 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
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
@@ -299,29 +304,39 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to use the shared tail page.
- * @start:	start address of the vmemmap virtual address range that we want
- *		to remap.
- * @end:	end address of the vmemmap virtual address range that we want to
- *		remap.
- * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
- *		responsibility to free pages.
- * @flags:	modifications to vmemmap_remap_walk flags
+ * vmemmap_optimize_folio - optimize the vmemmap backing of a folio
+ * @folio:	folio whose vmemmap pages should be optimized.
+ * @vmemmap_pages: list used to stage replacement pages and the old vmemmap
+ *		backing pages after they have been removed from the mapping.
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
@@ -486,16 +501,12 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
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
@@ -509,23 +520,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
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

