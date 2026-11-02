Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589994;
	b=0AFbLrH5/rOrhJCTUA7Mwp/fG5WpkR0WLjBkRe8UMEVIbdViRfWrFLKdXzqutMxXW6Vx
	 r0Q5n2HdibgUa98RGTV2oiYIgOdRXoNz54bIwOK4ahSG/GgbjwH0a1SLS4IB50Zb6G+UW
	 I2ONC2wkE4uLux0qrbhdJwrkMPtmgJ8a8yCZeLrDwGLKfoCELFqXwavoj+qMS2dpA7jMY
	 XPdf5146vdl382t0xBUKbHQabpNbVdc5BHPIFhKnzztXh3/wD72UZNUThj5n7CQDr718v
	 WFRFW26jgwtMmZfIBd6fgldb7mz24QiBrPFrGFhT49iwiE6T3ADn5r5+0IDQHFpkqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WBkp68rV0/lZxrO5waWBGU0MnUd67ZX+BTZGzOmvwqI=;
	b=Zg/9+FwTPOFy/3cBnPDJwVbBhqa/sVDjLAx4Tx9UgN+YEmfzkWAZkaHQO96XMqUn5omm
	 v7GF7qjYTs1sVbQa3BeAYsek2qOZrK4754wQ93Q1Y9XV/Rn3uXzFvAZ1x4AWkMdggK1UD
	 2uW5Z/I2CjSr01IRwcMIhMX/nAXsR/N5FeOBkl/MicUNUW6O17Vl8TuXXhWy3OY1ug/Js
	 RxBtvMORTJBbjTKYI9KsKpyndcbK1zbLlqjDWkUwH3+N3bh5K75gxi27YN1gCy0kzlN51
	 WEZ0x4zs5GM29N/yf7Y5BvoibeuLwuIA/SJJotCFbK6TMJTyVDUcW/n2EihrOEoT+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DGcl5aYs;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CD606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299CD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DGcl5aYs
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso839624a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793589994; x=1794194794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBkp68rV0/lZxrO5waWBGU0MnUd67ZX+BTZGzOmvwqI=;
        b=DGcl5aYspDFSJTL7+vK9LhZgVrfro634c+1gDGkLb9ygw2+PLjTSp+QktI9mUVn/Vl
         /+cyH+8513HBCJNfhen35F/S0MK/vqYwK0gG66wFGTls7YjNcARp0ju3GC7YHWGaECmP
         RD20sIIpuzm7PubDl1EqycaQ2kcOn2fgjZTeCPvgqYu/18aZIjLBPsE1I26yQI8HAsN1
         0aVIxPMUjIM3UxAWRpvCnbXyi2OOra8rD6bfgQxgTur4EAX1a2sJZW691C4V0zi9OrXA
         EGsagdNySKPOejmmuntLCl+SvM7qEgl6Bvxc366sIeYK70x0Ki/HKy3YFtbFraHYlWZ6
         s3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589994; x=1794194794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBkp68rV0/lZxrO5waWBGU0MnUd67ZX+BTZGzOmvwqI=;
        b=KxWO/vyXZtEpsvE4N1uG3trmrlq6XAjuSlKqDlfxnjorQuVmGoXaJIfVk9/E9CLDf4
         GJHamWDXdG8Lwco1GbIqCv3UuT1VvFcAPPgfyurbTXB9j83DNDorJsSYi01ZMtKN8nnX
         uCu3iPi5dFujoHAxH6SIPlTCjepBwQysdtulENWyvjoyq4KyKQ41ca05497UY6USffNC
         ZY5CK6WnNPolK2ov3px5pH2ESADO75b5FMLpIQto2vekdDllCnCk27Wn0octm4r84ATV
         L3xqN/53pylPK0BTwhVlYkSu5JK7fNyngL8odNZPWyCp0Z2LdaeaDfEDkSd3ixYgE/oG
         QQGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKdZnbDz06DpYD5W+sLgDGUMuGNOoo4rWBUbgUqSrqb3QZ6g2+e5HEZgFExAuiaqsS3bkjeTA/9ecGV08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wXWnUfdnltO0D4YwvcR/VddYkb2F/Q6ubk41pyUiocL4bKvm1
	rnCseCQiB2koGh0nz8kpctxyAzZx0bzjG46q4myyP1WedXvofBT/zXtEd34MhnkM1zU=
X-Gm-Gg: AYBFou2y9lFRZDyFS36sd1A0xNgZilOPIG/2AtW+hZXySwlaCmuK5d/kp3KtLuVeqSe
	e8UyQs292LY3KXYP1dTAS/SLEQZA3J6+lWomeJ+xZcTJGBu67sSS+fx7Kv8qCJrGzeE21Vnkq4t
	pvR2ADLkkDySmSCKPi4XmNRfkNWazpKiYCj7IrUpGUd4smynDc7ZVZiRflfKVNCTEb3GC2s3DtW
	rRN8EL0gJBWnxgkwbvjn0If+2Kan26orUNgq/RX4jQrYtxj+RthuvxhlLPN/0UlPUg0WnzscLpD
	2X8c4+I+AIkSX+g9rV6tzgsv0IpI2x4wjmrWxbnrJmHTRRYiBhTyBwuF9fbpg/N9j9GqMjsgbs1
	pE6UYWUd0PTmympEuy06JKOX2tZvGo23OBptLnJ6OjyyqsF8WHAKbn3/IE3LrxGha8VKBgVuGw1
	naf+5BpCxcDNUXu5eRCQ8pnUDTSsuhMWJAlYQcQXcK9UPG37/tVTI2jPtjThJI6+yd84xHURn5c
	6aJUoQ27uR50b5uky1jDkk38TE5Fi2BjSqKJ+GcIlzrg2hyErdhtxh01Ff7SKg+8tSWUj0yjMWI
	VacVPhqsX9qqXqn80QkYGztwqU1in4VK128dYLJIoS31h0uR2Y6K428KcBzm09whlF6eeC0=
X-Received: by 2002:a17:90b:2891:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3ae897ab44emr6749741a91.44.1793589993498;
        Sun, 01 Nov 2026 19:26:33 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:32 -0800 (PST)
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
Subject: [PATCH v2 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Mon,  2 Nov 2026 11:25:16 +0800
Message-ID: <20261102032525.3597743-4-songmuchun@bytedance.com>
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

The new head page is already tracked on the vmemmap page list before
remapping starts.  Passing it separately gives the remap walker two
ways to refer to the same page and unnecessarily complicates its
interface.

Use the page list as the single handoff mechanism for the head page,
removing the redundant state from the walker.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Remove outdated head-page wording from vmemmap_remap_free() kernel-doc
  (suggested by Lance Yang)
- Document the vmemmap page list contract (suggested by Qi Zheng)
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 63e899cfaac3..0e5b2b182d1b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -25,10 +25,9 @@
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
  * @nr_walked:		the number of walked pte.
- * @vmemmap_head:	the page to be installed as first in the vmemmap range
  * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
- *			or is mapped from.
+ * @vmemmap_pages:	list supplying replacement pages for the remap and
+ *			receiving displaced backing pages for the caller to free.
  * @flags:		used to modify behavior in vmemmap page table walking
  *			operations.
  */
@@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
-	struct page		*vmemmap_head;
 	struct page		*vmemmap_tail;
 	struct list_head	*vmemmap_pages;
 
@@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 	pte_t entry;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
+	if (unlikely(walk->nr_walked == 0)) {
+		struct page *head;
+
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		list_del(&walk->vmemmap_head->lru);
+		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
+		list_del(&head->lru);
 
 		/*
 		 * Makes sure that preceding stores to the page contents from
@@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		 */
 		smp_wmb();
 
-		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
+		entry = mk_pte(head, PAGE_KERNEL);
 	} else {
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
 
@@ -284,23 +285,20 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 }
 
 /**
- * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to use @vmemmap_head/tail, then free vmemmap which
- *			the range are mapped to.
+ * vmemmap_remap_free - remap a vmemmap range and collect old backing pages
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @vmemmap_head: the page to be installed as first in the vmemmap range
  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
- * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
- *		responsibility to free pages.
+ * @vmemmap_pages: input/output list whose first entry supplies the new backing
+ *		page for @start; replaced backing pages are added to the list for
+ *		the caller to free.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct page *vmemmap_head,
 			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
@@ -308,7 +306,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_remap_pte,
-		.vmemmap_head	= vmemmap_head,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
@@ -549,8 +546,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * they can be freed by the caller.
 	 */
 	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_head, vmemmap_tail,
-				 vmemmap_pages, flags);
+				 vmemmap_tail, vmemmap_pages, flags);
 out:
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-- 
2.54.0

