Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207721FF2A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986897; cv=none; b=sHfI1/mFbiCnN9pI51mMy0GFwa5sfptPCk4/Yom38Tck50jQchsv1zmuchT5V9D0NcwfiGwZLOQFs9DPN1pOCSKv35WcFJC4wQV6gVUiSQQGvNYJy4z9GbaYRWz3OqsOfF26V3GeBRKWT7OPLOd+EBWVmxiA6YH351F5P4gM0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986897; c=relaxed/simple;
	bh=OnsPqfPdFb0S9hczwQ+jtEKE5MrNkwyZVltV/Gehw1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uil2v6+8tsChXnPrMFGPcs9xCbGVHsVtYPofqS+Jyw2chbr9lMDswaDcvUNRFBZKXuBy+eDer/vo47497CLLl9UJlxWP0P/p582zTMHckc90QcnGYPDpVUqlKb78XtZ5ksEdaXFLyKoisPmeryuLAulmec71cidhxdvORQoR7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MxCpM+OH; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MxCpM+OH"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso361947a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986895; x=1791591695; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZAZ5JKeK6vnKji79QsGpXUoqDaDTR7rYrRqlCcRuaw=;
        b=MxCpM+OHUib7uZNwNEX+lBnx8m4LIWKMy6zkavO4bm1c7ErZdeG/FL6TLrsTuJU+tx
         D4APVPlCh0eLUgtemGJBgxsaXYPHD9x7UdX8CYSyQnem3BU6Ivs//AQDCbSlFOfO5D5v
         Jm5ADIGxbpv4bOh+pA6S5XffZ/Do054Jao4BOgpo0wdgD+2udfljkCZ7fWv1OUHZSBF9
         ewLA2TfiXbaWzIEFj8uVYXszzHCHECigBPtswJPgcJ5Q+EN/ADpVq4S9Z7ay5jt42gMD
         yunICEusbcQFkgWNZ5Dz3P0HV1Zdx/C0OW3HDuFW565QQYBRg7BhDWH2dSniUbJT+69D
         AR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986895; x=1791591695;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZAZ5JKeK6vnKji79QsGpXUoqDaDTR7rYrRqlCcRuaw=;
        b=eiTs6ZjlOUeSW3t6uXja2e28USefADAz84u6n0T6o88i11ddznNm49fpXuZ+vtcKpq
         gTyD78vPbPvu4Jii3GeqFr7KpRDuuXkg69MnkbZ4FXMb//ekIS+zF4PJibhJ9EvQdVgg
         Bxd17F/MoDjJHgkM01HkM+DmoSlnfTfJgiCGwwfz8hRetYm09N0/YUBA9K1Er0BluRe/
         RPk3hgAiKosDm8Cpu4XNz5j2Z0R0I/zl5QlmMjUwh+TWt9X2cp67YQ+iy63omj2j3ZFA
         eNLhCDHfjbkxto00M4gZDjTYQXYZkiqJpS0QdShuLxqvBm7L0wsD5CgnW+JTRAYk6Kei
         nHCA==
X-Forwarded-Encrypted: i=1; AKwUvBw/2bpYWe466Q4twKYF3oOoLetSZKdjRVZidV6hqjmorLCbLDUrtPgNrgEeW3gO/FZ8PS2tkL1YIyRGsuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP2Y6MWm19yxZ+HrfqOLSL+xgLhrC+MxnAGw5Co+5AN9V9/ZkI
	KPIyNJNVOVOAIIWmjk7IsbHoWAEAA/5X0lv4WxZ+DTbF+vO+yDrqvyyAhouk0g29h49alZkhlYf
	XLEQG/aCGMdCe763q/OYiTg==
X-Received: from pjbpv1.prod.google.com ([2002:a17:90b:3c81:b0:3a6:f669:2f33])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:268f:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a6cec8cd26mr2396583a91.40.1790986895284;
 Fri, 02 Oct 2026 17:21:35 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:04 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-2-jthoughton@google.com>
Subject: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed folios
 on bulk restore error
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

When hugetlb_vmemmap_restore_folios() fails, it stops processing the
list, so folio_list may still contain folios that were never vmemmap
optimized, e.g. because HVO failed when they were allocated. Their
hugetlb flag has already been cleared by remove_hugetlb_folio().

If no folios could be restored, bulk_vmemmap_restore_error() then calls
hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
including those, which trips the !folio_test_hugetlb() check in
__hugetlb_vmemmap_restore_folio():

  page dumped because: VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
  WARNING: mm/hugetlb_vmemmap.c:503 at __hugetlb_vmemmap_restore_folio+0x270/0x300
  ...
   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
   hugetlb_vmemmap_restore_folio+0x1c/0x30
   update_and_free_pages_bulk+0x2c0/0x368
   __nr_hugepages_store_common+0x2e8/0x3f0

Otherwise this is benign: the restore is a no-op returning success for
non-optimized folios, which are then freed as intended.

Skip the restore for folios that are not vmemmap optimized; they can be
freed right away.

This is very unlikely to happen without fault injection, as it requires
both HVO and a subsequent vmemmap restore to fail.

Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list of pages")
Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1b51251103b..4dac7ed1df57 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		 * page is made a surplus page and removed from the list.
 		 * If are able to restore vmemmap and free one hugetlb page, we
 		 * quit processing the list to retry the bulk operation.
+		 *
+		 * Folios whose vmemmap was never optimized (e.g. because HVO
+		 * failed when they were allocated) can be freed right away;
+		 * remove_hugetlb_folio() has already cleared their hugetlb flag.
 		 */
 		list_for_each_entry_safe(folio, t_folio, folio_list, lru)
-			if (hugetlb_vmemmap_restore_folio(h, folio)) {
+			if (folio_test_hugetlb_vmemmap_optimized(folio) &&
+			    hugetlb_vmemmap_restore_folio(h, folio)) {
 				list_del(&folio->lru);
 				spin_lock_irq(&hugetlb_lock);
 				add_hugetlb_folio(h, folio, true);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

