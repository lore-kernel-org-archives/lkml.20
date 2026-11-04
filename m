Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758125;
	b=L45svkPmRRB70jRqYuA6V8aDvdaMFZmfd7xoNH9+yiXzdRdSsEhxBhAhdwbH00Lp/XY/
	 P0fJlmJztcicAxI5Yzdc+JiEZ1k40r2KBa4BNXVKXalVFtEGTpKLczI4lzq7jKPvOht22
	 7kce2xAc9lbabhGqXcu8KIjSSNf2ro+5etDMcv94JU+MDVUIGHgdRWxnMFcbuwjnAIvr2
	 OY5LOsOes8zOUzXL86A/8xWeJIu6muTNt+yU13JSTRYzmaPS4U5Ce8gMuJ5WpqPmaciL3
	 jWKV0DecYxCfKoITcgy6npdJZ/6uQds2r/g8P2AzdT72ct8vRSZHl+kOk6a7jYXhe4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758125;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9PvvmTIC+xa1Yy/jymB0jeQjmM6XsPcLJd3t+U1N/8A=;
	b=YRZhaXWfb7sEV0brxNfArXPXbq5hkcGxKRSzv3x5FQuL/VVmdwABdPVoInV6G5SWZv1r
	 7L9KJDcFY2dzMS5TIDRKW0gQN6KIRsuvfT00//VSZ7rcpqx8bK/8rkcMMHSXCaMFJcKL3
	 TxCc51PI5+b65uKx8kGrdQwmDUMff8GsHtQdWqIdeGuV7xNvoLRDjQ7ScyaNya6ejlUOg
	 MRpXRIu7zxHr7M1NEZMsMpZ9e/QGQ71SMimrjH9yhL8FeLfhUaws9ML4d9Xcjl0ItMVce
	 pPCw/SFuUHVWDMak0Wl5fgAscDr9MwTwX/fjRmS0ZLUhHibafvuS75D1OtI+bfR5wdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=VInwpyJv;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74208606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74208606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=VInwpyJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=9PvvmTIC+xa1Yy/jymB0jeQjmM6XsPcLJd3t+U1N/8A=; b=VInwpy
	JvVIXCDo/LHBgZ8Kj6utwxJ8KCGXohr9RwEPTqNExSSE5IObAantbD/wwpsHxhF6nJ32pOLm6t4C7
	hLyv6GgWDgEQtAuvnrcy+U/l/0btfVyaJArEr6Fa5L8OpiU7kYW2WPkKBYk5BDeuj4J9aS9Z02/6k
	KESryuflPEfcTc/zAvl/cvi0m4tmc1+6WtyeQuq9NDGS17j0ZXHMztsf52X6Dbz3u1C88Gb2hOkx7
	i1fwVfaOsdoHiDtQ5PvL4Ir1LxxWcRyH1YRkhVqudffximSsb+f8mqh93ggg8mPw0n0IxU5m/qQNn
	BV6Zf22pb/otl7EVi1GFsESO5E6A==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xOQQR-00000001pVT-0hEE;
	Wed, 04 Nov 2026 02:08:31 +0000
Date: Tue, 3 Nov 2026 21:08:30 -0500
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, Andrew
 Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John
 Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Suren
 Baghdasaryan <surenb@google.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH 8/8] mm/gup: batch contiguous same-folio PTEs into one
 refcount grab
Message-ID: <20261103210830.2870eaae@fangorn>
In-Reply-To: <1affac11-da98-40b3-8cc2-6e8374b5ab69@kernel.org>
References: <20261102193026.3860700-1-riel@surriel.com>
	<20261102193026.3860700-9-riel@surriel.com>
	<fa017227-448b-468f-9797-33c02854f018@kernel.org>
	<9d1572bd5e868d3c9d953aa5fae81967cc81ba55.camel@surriel.com>
	<1affac11-da98-40b3-8cc2-6e8374b5ab69@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 17:55:31 +0100
"David Hildenbrand (Arm)" <david@kernel.org> wrote:


> My plan is to get the small series for gup-fast ready, stage that, and then
> build on top of it.
> 
> By then I should have been able to dig through most of your series. The cleanups
> can stay part of this series.
> 
That sounds good. It looks like with this small change below,
GUP-fast and slow GUP can share another helper.

I can fold that into my series as well, or send the cleanups
in a separate series, whatever works best for you.

The PUD and PMD paths do not look as easy to untangle, but
maybe after some more cleanups on each end?

---8<---

diff --git a/mm/gup.c b/mm/gup.c
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -940,14 +940,20 @@
  * run under FOLL_WRITE or FOLL_PIN does need the per-page check, so it stays
  * one page at a time.
+ *
+ * @fpb_flags selects the scan: slow GUP merges young/dirty so
+ * folio_mark_dirty() sees any dirty PTE in the run; fast GUP scans
+ * locklessly and revalidates the run after grabbing it. @vma is only
+ * needed for FPB_MERGE_WRITE and may be NULL otherwise.
  */
 static unsigned long gup_pte_batch_len(struct vm_area_struct *vma,
 		unsigned long address, unsigned long walk_end,
-		struct folio *folio, pte_t *ptep, pte_t *batch_pte, unsigned int flags)
+		struct folio *folio, pte_t *ptep, pte_t *batch_pte,
+		unsigned int flags, fpb_t fpb_flags)
 {
 	unsigned long max;
@@ -961,8 +961,7 @@
 	max = (walk_end - address) >> PAGE_SHIFT;
 	if (max <= 1)
 		return 1;
 
-	/* Merge young/dirty across batch so folio_mark_dirty sees any dirty. */
 	return folio_pte_batch_flags(folio, vma, ptep, batch_pte, max,
-				     FPB_RESPECT_WRITE | FPB_MERGE_YOUNG_DIRTY);
+				     fpb_flags);
 }
@@ -1018,7 +1018,8 @@
 			folio = page_folio(page);
 			batch_pte = pte;
 
 			batch = gup_pte_batch_len(vma, address, walk_end, folio,
-					 ptep, &batch_pte, flags);
+					 ptep, &batch_pte, flags,
+					 FPB_RESPECT_WRITE | FPB_MERGE_YOUNG_DIRTY);
 			ret = gup_grab_folio_pages(folio, page, batch,
 						     pte_dirty(batch_pte), flags,

