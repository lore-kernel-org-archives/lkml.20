Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650256;
	b=jbYRnLEEtAxQh4sSwlZ20KeYGmtyNhvRoGxv7d1EvBCSRdQzfK5RqlFNCMQQmqazaUJa
	 5GEEPQqUzzC09it9vfUMUe+CdAxJcB7frejSDhNMf+BkiwBCyzSWYCyqYDyPeve2QMqe4
	 SeXnnY/6crMJgyRfqiupY8JywgLFxS4U906/h1/hQ+BlrQOpq6UhWUClQ4FVZfwf6Jzl1
	 Tft2LrBaLJrxn+JihOYhzThEGohGYTHkMQm+RraXRVKnSdix2ZgJx9BO4ylz83CLj9wXd
	 ahSaCs18yGyK37lmhbupTx5Ymw3F82Qvp4qvUMrXQgVc+J9G4/6vwjxWAnK4Osstv0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650256;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NyrZtijtyGTQPq4lZyx+gSPus8J8tZcRW7L4bdstfYA=;
	b=neC4X+AIQc6zj4NDyuZ0XehnbnbBFwiJYH5ilOWsXraArBqZt3HeGm04viFDvFnrK0WN
	 vJrNw7euvLMBWYiy8rNiieZ8YbFifIwYSTuf8vQIAMUKIzJOrjtZ4qdPM4dJTZD2o3El5
	 v70faISQK/u/KKSHLlEWQMPB3Ks63h7bcgeN+nCkNuhcCvG0cI+Pb5yTIrmoj856vk3tg
	 66/DNpBdyFURmCR2tBTbGQBpM+E9lIzwZT1sbvMy7zp+re8YHis6v6mxOeIkRTW9/Hs/I
	 knONyth5hOtIlWk9tqw+tTLkXd6+X571eQj5mJpoystGPh92IQkPyfkacJ+4z4NYSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XXLTTM3D;
	arc=none smtp.remote-ip=91.218.175.129
Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D59606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D59606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XXLTTM3D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0zr077h6eg8GG3MPE83DyOxebLzAcrGd6CAuktOVwoA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792650252; v=1; x=1793255052;
 b=XXLTTM3DTVlB/dRJOBlmhavo5YA9IomhysFwM5JI0srZOJAGfSSNqvAZOP2W+zbvyPsRHkP1
 LY6EsFg9HnihSidEcv+kgMNUEA7SaHKdlg2iPtLvjh2e1IN+4lwsuG2mPQhAVurrqSSj3sd2YoG
 guk3+hYDU2H+qg5YsMuDfHd4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ed6f83f251452fba;
	Thu, 22 Oct 2026 06:24:12 +0000
X-Mizu-Trace-ID: ed6f83f251452fba
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Thu, 22 Oct 2026 14:24:01 +0800
Message-ID: <20261022062401.62096-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-2-songmuchun@bytedance.com>
References: <20261020115824.823278-2-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:58:15PM +0800, Muchun Song wrote:
>The new head page is already tracked on the vmemmap page list before
>remapping starts.  Passing it separately gives the remap walker two
>ways to refer to the same page and unnecessarily complicates its
>interface.
>
>Use the page list as the single handoff mechanism for the head page,
>removing the redundant state from the walker.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
> mm/hugetlb_vmemmap.c | 17 +++++++----------
> 1 file changed, 7 insertions(+), 10 deletions(-)
>
>diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>index 8b3abb562599..164e93e980bf 100644
>--- a/mm/hugetlb_vmemmap.c
>+++ b/mm/hugetlb_vmemmap.c
>@@ -25,7 +25,6 @@
>  *
>  * @remap_pte:		called for each lowest-level entry (PTE).
>  * @nr_walked:		the number of walked pte.
>- * @vmemmap_head:	the page to be installed as first in the vmemmap range
>  * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
>  * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
>  *			or is mapped from.
>@@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
> 					     struct vmemmap_remap_walk *walk);
> 
> 	unsigned long		nr_walked;
>-	struct page		*vmemmap_head;
> 	struct page		*vmemmap_tail;
> 	struct list_head	*vmemmap_pages;
> 
>@@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
> 	pte_t entry;
> 
> 	/* Remapping the head page requires r/w */
>-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
>+	if (unlikely(walk->nr_walked == 0)) {
>+		struct page *head;
>+
> 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
> 
>-		list_del(&walk->vmemmap_head->lru);
>+		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
>+		list_del(&head->lru);
> 
> 		/*
> 		 * Makes sure that preceding stores to the page contents from
>@@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
> 		 */
> 		smp_wmb();
> 
>-		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
>+		entry = mk_pte(head, PAGE_KERNEL);
> 	} else {
> 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
> 
>@@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>  *		to remap.
>  * @end:	end address of the vmemmap virtual address range that we want to
>  *		remap.
>- * @vmemmap_head: the page to be installed as first in the vmemmap range
>  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
>  * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
>  *		responsibility to free pages.
>@@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>  * Return: %0 on success, negative error code otherwise.
>  */


/**
 * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
 *			to use @vmemmap_head/tail, then free vmemmap which
 *			the range are mapped to.

Nit: could you update the @vmemmap_head/tail comment too, now that the
head argument is gone?

Nothing jumped out at me, so

Reviewed-by: Lance Yang <lance.yang@linux.dev>
