Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E64D1780
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718796; cv=none; b=gcFv9E5Jno/blo6NNV2q34eBNZMJ2xUdNOxZW62QgHq1lmGakQbcyXDwL65zc4MjsmtJ30iXY4nsgE2TBZoWEDVFyHjau214JfJgH4yXz6D+i4ql3lLceWoquv7eHU40f6piuVUYPgggz0meKdMCZFC8liQEaJoMWy9gN+vCXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718796; c=relaxed/simple;
	bh=yYlUHXeU1rSx4t+U8qxu7dtA8Nvhruq9KGdMjctBjd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tygb/KIkaiy7tXZviU+CPy79+vaJoMh8Qgpnday5A3mShy/MygPBEEkyTIhdYYmdRLG1HmxojC8boyEP+RfnyK7Wzc8eL9n/mS7DqZz2ytJdA1hH61ym3q4VJYNFLoebrtSVcRdJmETQ6U+FlvLLaX9LlSWy3bbQk3UPKUJvWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GC3N2AyJ; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GC3N2AyJ"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4825042eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718793; x=1791323593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8S1L9thUbDBOo5IvvqirVWz8KUgkebaENmH325jJXM=;
        b=GC3N2AyJhLoRlUlZWtehrQq4SPuw40DKVi3UaxwM2kbxY6HiKJTxyXLPRqtMSKbyKb
         yKOwLwUcmoIL4bGFiWSv+v3a3c12s8RZaLHEWyzvM9+Txyxe1ash2dbRobDRKXA6+kRW
         oK59J16WiCj6RoABPxBaH9ubYycBL0tKYriKahVa31TcqVCUYaNi62FuedtGH+nPIt09
         8839G04bb2OAmgdopTt3gcR4mq9pjitkEYTrwz4lDFpIvUxajoBr5TFdRGOoM2evTltu
         QK8UULteq5Gugm4Udx3kA9+kN9XzOr/eOiIX1RkZMy4xNnT/aXypLuf7YgxEmHr4yN8a
         lfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718793; x=1791323593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8S1L9thUbDBOo5IvvqirVWz8KUgkebaENmH325jJXM=;
        b=sKpCfjH4hDiZnLLuksRkEmOoPqM9A5LhQkXY1lD/gn5414f57qDJgqzeodcCjbcP7Z
         2fECOv4B9iforRLrQr0wvrxYgLHhNPsqdSMassU9u4QuHZmWN5Oa5b/K1Wulu4qyPHc5
         +cWboRCPFK2Wn25z5682xaqWe2zQWw/uvbCDnGmPRCfFJ6Kbn70g9WmYizjk8DVXHpGo
         oKYEJrrsrxhm/RgKJJuZyyYv/Yeqxl5/CS+87JikQ+ymc7LbggnQ7arrESPVW8QTRyWF
         jr8S/BQr6W9OO+4B4xBXLC8FB2+FhvHUtCvVELE8OTu9TNj68FrT6ZEXHtA0p3MIQURK
         5DFw==
X-Forwarded-Encrypted: i=1; AKwUvByl+PfiP6OyZYq6GMAzc4bvmcfKXoENcH4FVeqcXUeeoT9GT9FVdwCqkT/V1sjmINsDOptP9OHfDvKt1Gc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGmOdeRj0LQwOHPRoYmq0rTSmkt69EFTVj2oFiZBWqOCyUsDur
	UmgkP50lLL9lqbICBZNTMXwK66VLbP87OO36dKn54mkPGSwMFmnAsbPBctXpLxTY2RkhTa5jTLQ
	IcbNDbc90Omg/3V8d/FT+xw==
X-Received: from dlx9.prod.google.com ([2002:a05:7022:89:b0:144:d025:68b5])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2706:b0:146:6755:ff08 with SMTP id a92af1059eb24-14c9d60e402mr605303c88.9.1790718792863;
 Tue, 29 Sep 2026 14:53:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:52 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-2-nilayvaish@google.com>
Subject: [PATCH 01/15] mm/khugepaged: drop redundant page parameter from set_huge_pmd()
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

set_huge_pmd() is a static helper with a single caller that passes both
'folio' and '&folio->page'. Drop the redundant struct page parameter and
pass folio_page(folio, 0) to do_set_pmd() so khugepaged no longer
references folio->page directly.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 913086eaf17b..63acb13f24eb 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1793,7 +1793,7 @@ static void collect_mm_slot(struct mm_slot *slot)
 
 /* folio must be locked, and mmap_lock must be held */
 static enum scan_result set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
-		pmd_t *pmdp, struct folio *folio, struct page *page)
+		pmd_t *pmdp, struct folio *folio)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_fault vmf = {
@@ -1821,7 +1821,7 @@ static enum scan_result set_huge_pmd(struct vm_area_struct *vma, unsigned long a
 	}
 
 	vmf.pmd = pmdp;
-	if (do_set_pmd(&vmf, folio, page))
+	if (do_set_pmd(&vmf, folio, folio_page(folio, 0)))
 		return SCAN_FAIL;
 
 	folio_get(folio);
@@ -2032,7 +2032,7 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 maybe_install_pmd:
 	/* step 5: install pmd entry */
 	result = install_pmd
-			? set_huge_pmd(vma, haddr, pmd, folio, &folio->page)
+			? set_huge_pmd(vma, haddr, pmd, folio)
 			: SCAN_SUCCEED;
 	goto drop_folio;
 abort:
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

