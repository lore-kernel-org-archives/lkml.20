Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497521;
	b=u0vrxq+sxg4awf/hUskB/nyb1//+6KS5IaxFlbomg/T9mJW1ymE/BWh45RS7MOnf7sBb
	 +0WW2Yoovxi8YSWZIUH9rhSSVR/HgYOA5kTMgH9eukmmR5krajK46jUuw9LbItp+9NCk8
	 6TpWaVwSperiScuoGaNESdf8JFIcaeyFeyAPgP5ghEv+tb8EcaDp60UXeDsdjkK13+zbR
	 K0U+IGuRmIBkwzwPyKi31tDgp/OtWg/Eawca7VVBbPg6AF2DYAt0zdJVIhVD9QAAWJFo/
	 IERR6hTViLaA9IRAMbSA45RI9hbBHiBt+px6BFjm5659prokHWfdWPrxskF+BM+NYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOATlRclB5ldxSU64tDVzXHk9/aZOUpgsZVHD8H/s2Y=;
	b=f6GFxO1FwMdie+vZ08HGF3JDDI1F7gBzCybMuvefqEKbgosqIMK1gigoNg1BeGlBOket
	 Q/H7ebU71rfpoDxeIQLs3rPaiRjpz5hCvJyhJTDlbklQMroxYnOYbgrpJ8EtiBPhBdLc/
	 UskG9Uld+s0hUwGCjJMKRaMvrIIowswY3tS/BrXlAlSrm09EXmv2G+hrj0n4/chTlw1UU
	 g8NZHMIvRnWWwgfTlOS5WDXlAn+upFNKL5F2K5TtCknIQts9s4IRk1h9k4g97IjCEjfv5
	 XF1icItlgo+50CBqxsFSHJMJDDX6IP0rOCDOI3LhEAxcbx6nX+HAaeLsGWwslKmF0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HDAl2v2D;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0E60A4ADA
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF0E60A4ADA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HDAl2v2D
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso2042761a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497516; x=1793102316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOATlRclB5ldxSU64tDVzXHk9/aZOUpgsZVHD8H/s2Y=;
        b=HDAl2v2DREB6zdsqcepyL7FJe3xegaZiAUmfhWGLny2vfJ2LGMQYfpMneTVbC/Aq42
         PseGm8lAQBURPuqqTzoKm+Hpnafiqut2mf9j+bUkBO7st8JGyAo26WmTXKsOaapdD2Pd
         5GbHlycm2xGAaWrkKGmOfWerpyRAxwHvSzYo/MOq0/H5xG6BSt1B19UAWI/D8t0VtMLY
         08mp+/gwynGB4nNSDPR6YlmOV2/kUBdDuv2PrWqpsLa+L9zsBG781nJP2blv5u30akGr
         sWxFwoIl1rcUFIl8nGZXFulgjgypY9JnegHlQU1tc+GjB1eGIV9rjwhxZ7MYhXebH1I8
         +M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497516; x=1793102316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOATlRclB5ldxSU64tDVzXHk9/aZOUpgsZVHD8H/s2Y=;
        b=ehDCffh17r3A5FtbySb+bPkydjxGfoON1uKorAxdk4Auq3fUWNwcPhiKv6S62YPbrr
         IaMvZGZckGkU3w+fgiEJCw+hUfnNdRjC351ZG10ns5QP6Kd/pcrnUA/mZAypjFrd1jYr
         IuNJ4KRwW/C2p9hjvCtjyfMC04E9O+ScAx3S4aAuxFCeSuqsLenx7+xSTOre+75qT9Rw
         daU/COnjXpttWXPrUIHW0xRGQGw0HyJoCHWybmw4VH5tbCmOCghTnOONScBGme6J8mCE
         ZgMIuye79lrklcSUojmrRrnFHTz9KUJ+YycJ4UYFkF/VMFZxfbwUvK84AiPnkjSs5yjr
         Y9nw==
X-Forwarded-Encrypted: i=1; AKwUvBwHZHgRIssYk92izOPfekBtRQ59AwMauFjhSNewylXj1Jq7/IAQ+G0av+5mVu1OKhrSob8Zxh6cNkHEyKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0yQNxWVrLWxbmCyV4d9sMy0I8agr+AokbE3mHkMXG/jDT3JQf
	wL75B9hSM8cUEo3N3htmCMsCMRnOzL36PzR9q5CyXB7P1wx9WDKWmIZABhVGPzmrLYU=
X-Gm-Gg: AYBFou3s6QXBB3Ci59x0Od44SYf+UT2tylYCehO0q6k8bx9duRQ64IX4uBedAvp0crS
	l+TR7pFalaoZtyyICZ9Ml0bndCnC+Orp5a9rgqV4grbamklg+F5Fe2E8A25Dvl72naS/1SSEzTV
	aU381qGNjKkfdXf2lHr9DhGVVxosxjY0/3tA/2sxkNP1rF1mw0eiMrUTNqt+wFlKj9IEpWz3zYc
	V6jPcEAHkdJ/7sK/IDwh2dvXV+PJWOObLmya9jq5IPBLbdVY0yenvgRwpfGkJM38fvY+8RGrvDR
	MX9g2TkJpsRMF8sC3cAAUS4jV5WGqmHaBUioobrt6af0WV1TcabnmQAUTqGuAho7N3rUzNCjWQ4
	SndF1pvtyCFbaD3KcDJtxSW4UUKSUebnuEEgC0u9kb/GVAussxtLP0GWYbc49t2NpAHtvfXn06e
	yn+TXKfcK18wQPsrPLD5H+oVJ+5QmzJGnjXziMDvP0l11KIdHgynaU+1RGPisKbPcxrIcnCcSpd
	t51wDmqVto85dX47tQs
X-Received: by 2002:a17:90b:1cc6:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3acef3d6405mr8699700a91.42.1792497515587;
        Tue, 20 Oct 2026 04:58:35 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:35 -0700 (PDT)
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
Subject: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Tue, 20 Oct 2026 19:58:15 +0800
Message-ID: <20261020115824.823278-2-songmuchun@bytedance.com>
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

The new head page is already tracked on the vmemmap page list before
remapping starts.  Passing it separately gives the remap walker two
ways to refer to the same page and unnecessarily complicates its
interface.

Use the page list as the single handoff mechanism for the head page,
removing the redundant state from the walker.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8b3abb562599..164e93e980bf 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -25,7 +25,6 @@
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
  * @nr_walked:		the number of walked pte.
- * @vmemmap_head:	the page to be installed as first in the vmemmap range
  * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
  * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
  *			or is mapped from.
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
 
@@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @vmemmap_head: the page to be installed as first in the vmemmap range
  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
  * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
  *		responsibility to free pages.
@@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct page *vmemmap_head,
 			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
@@ -306,7 +305,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_remap_pte,
-		.vmemmap_head	= vmemmap_head,
 		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
@@ -547,8 +545,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
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

