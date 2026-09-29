Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19184E4336
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718802; cv=none; b=tM+wzTRs5Y5JMgfm43VfW02Elle8xMntAvuoz01VzcpnYzZdJRLzVLTiYx1JY3ih52hCLr58f5dGSL377XcqbcfAPRZcjEsugm/I/KqJ3ONWsBPfJorzv8Go78FqgOQko15xe7FdRORSloRTlRs4P9tIKNEjSE6Hcwjf7hNE0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718802; c=relaxed/simple;
	bh=7VFM+99/ZzAAejKGREvUdeb6MP4v0H61o0giPoXUx/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hr1VcfGFmhDYurCZZShUmfrD27PiHe09dvdrptx1W/8AreI5J0d8g5j7w6LF3o4LrRZIHCeul6BB0ixxEmSbLh9asSOHWo1xHIkhC/sMlvMeCpk96yVC/05JC8sxWk2mn5p9tC25TvK3k/WjibzbT6NyykX6hAPTjuHXAG+8ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6dUJOFt; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6dUJOFt"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-349ffa249bdso3922287eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718800; x=1791323600; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9oDUPam2OtyD04KoExZWYJnbuDJYbUQdofAXr0u5VE=;
        b=I6dUJOFtGQnxfkxRGkSJO+LodNzCuCFpqH1VqA9oiZYUsFo9VnKPtFjwpYYQxek3N1
         4BdufDA5uYcUFPxe5HCArUxUZljVExMF+UR/FgnB6nbAJl3t+qpVnpsuziT4w4C0gEL4
         ENn9kry9hnD5OZc2uWIoBF6usH1fGAllM0P617TpZjIRmIfpf55LkhQ1ZFI8WkRgxiV/
         tEII14SAIoapmtHVXaQGy68YENfEnoEqhpRe5CnNaVCCCfBrqGFHVobv+x2spLhOgm22
         0Ut7g7CLLvXV+8oISqko+o5bXC4/4pexKnP5kQOP1yLu0kZ8GKZsCNxSkJtNtwPQSiaz
         Z84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718800; x=1791323600;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9oDUPam2OtyD04KoExZWYJnbuDJYbUQdofAXr0u5VE=;
        b=TB1mLT/aXokk3bBhVSYhOvMKG3lH4AUPC4bLE3FypEcyr602cUAYzB631T4+8ZOdOL
         gQrwuAdSrSohokA228ByC9gPnGzw4kW8qCvG5fvMYQNumfcN+v5cNYA5tjjrfNerTqKc
         pdN7zczGm9Y7UAtwJe6vS5I6MfPoKKznt1lJnPCbtlCxkvSr3+s5DuvmRvo38Lk1CQYv
         gQT1yhJPl32NscBM43ZSQmvGHzloQzCstQbX96DrTYrX5uZoXyWdszqwGnQ0yU4QCiX5
         Oj7ygJ+XMh96dR905TIgj2eleB3LaVesoKaN4Xsm1rWoBLqcLTZ1ferUm1gZoZcsXwDV
         i3Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzYUhykqBsKR8OnS+ToglGioozESRgbM83qNeWNeBmuSDSnOMdDyuxWxC5oxTO/nU2aXCHg6SusFS0QrCk=@vger.kernel.org
X-Gm-Message-State: AFuF++lq914FnU1bnWHcUm6kxz6XI/pOEkgNjmfh05+hbsN2nLtsIVOW
	BBMyJyWuvt3HQBK//B/VY0M4ASzPVTxihVRhY0nMKuyiYQEUgfGiwt/4bEurGZiayI1V/8tqIrf
	7WsQkYeTxm6T8Cw3wuzgYxw==
X-Received: from dlbef6.prod.google.com ([2002:a05:7022:f46:b0:14a:9017:9767])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3b83:b0:143:50a0:56d1 with SMTP id a92af1059eb24-14c9d9ede6fmr784069c88.17.1790718799260;
 Tue, 29 Sep 2026 14:53:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:55 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-5-nilayvaish@google.com>
Subject: [PATCH 04/15] mm/hugetlb_vmemmap: use folio_page() for vmemmap
 address arithmetic
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct (unsigned long)&folio->page casts and the implicit folio
pointer passed to copy_page() with folio_page(folio, 0) so HugeTLB
Vmemmap Optimization (HVO) operates on the vmemmap head page rather than
the struct folio address when struct folio is separately allocated.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/hugetlb_vmemmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..807c6bb23997 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -403,7 +403,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
+	vmemmap_start	= (unsigned long)folio_page(folio, 0);
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
 	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
@@ -531,11 +531,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 		goto out;
 	}
 
-	copy_page(page_to_virt(vmemmap_head), folio);
+	copy_page(page_to_virt(vmemmap_head), folio_page(folio, 0));
 	list_add(&vmemmap_head->lru, vmemmap_pages);
 	memmap_pages_add(1);
 
-	vmemmap_start	= (unsigned long)&folio->page;
+	vmemmap_start	= (unsigned long)folio_page(folio, 0);
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
 	/*
@@ -578,7 +578,7 @@ static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *fol
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
+	vmemmap_start	= (unsigned long)folio_page(folio, 0);
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
 	/*
@@ -610,7 +610,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			 * Already optimized by pre-HVO, just map the
 			 * mirrored tail page structs RO.
 			 */
-			spfn = (unsigned long)&folio->page;
+			spfn = (unsigned long)folio_page(folio, 0);
 			epfn = spfn + hugetlb_vmemmap_size(h);
 			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

