Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4724293C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958971; cv=none; b=oee114/CE7yIXQ9/a47+sTveDV0OPzhk2iy8cMcWSJ72fyY2AegV9x+E687tyt5gysIwj3IipPBF/xeC17we88UjZp4ANIFmv4/DwaqFZaMcgTpshjjiVpBbCiripaodVXOuED00oPR+2XnUpe3U6wOdMD5iASnwNwEPy0icE5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958971; c=relaxed/simple;
	bh=M1OuwPSXFYrCV5avkmZ8uKad0kejTbrSuXfsjAW6Osk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAyul9fQjayjE7JJoQCSWBjBoIjsJcF3QigtbM5VFWHB0PG1yoTtVQxyyvwtbr1N2FuIATIycZzNfkZkJT+S9PTor34ZsWKGlT+dxVf+VPhzLanRB2yovfPiCNkY97DRKPlNVzlRBOxntUKENgCfHPMG/hP9YoUZ+iAoPHaE3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZC9TcTYB; arc=none smtp.client-ip=95.215.58.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZC9TcTYB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M1OuwPSXFYrCV5avkmZ8uKad0kejTbrSuXfsjAW6Osk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789958965; v=1; x=1790563765;
 b=ZC9TcTYB9YnKG+qckGRcRDwTiSGh41KZA3yNbqGQJWnXIZDNHoBHUMG3F1Thfhv+XGUXyFDt
 JEiG06jL9K4KbYEU03vLXWeo0ezekmtuv/yho8pYj0nB5bMsstYEBftBJIGWGV9ZRq29C3ljNEx
 vRiJbG2nYeYFs2PNiQxlM7Ug=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dfa1332f1bc8a3c0;
	Mon, 21 Sep 2026 02:49:25 +0000
X-Mizu-Trace-ID: dfa1332f1bc8a3c0
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	gregkh@linuxfoundation.org,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU __get_user_pages_locked()
Date: Mon, 21 Sep 2026 10:49:14 +0800
Message-ID: <20260921024914.12819-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
References: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Sep 19, 2026 at 12:04:36PM +0200, David Hildenbrand (arm) wrote:
>From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
>get_page() reference for each page regardless of foll_flags:
>	if (pages[i])
>		get_page(pages[i]);
>
>This is reached from pin_user_pages*() with FOLL_PIN set.
>unpin_user_page() is shared between MMU and NOMMU configurations and
>unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
>GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.
>
>This means that pin adds 1, and then unpin will subtract 1024.
>
>If a user maps a page (refcount 1), registers it 1023 times as an
>io_uring fixed buffer (1023 pin_user_pages calls -> refcount 1024), then
>unregisters: the first unpin_user_page subtracts 1024, refcount hits 0,
>the page is freed and returned to the buddy allocator.  The remaining
>1022 unpins write into whatever was reallocated, and the user's VMA
>still maps the freed page (NOMMU has no MMU to invalidate it).
>Reallocating the page for an io_uring pbuf_ring then lets userspace
>corrupt the new owner's data through the stale mapping.
>
>Use try_grab_folio() which adds GUP_PIN_COUNTING_BIAS for FOLL_PIN and 1
>for FOLL_GET, mirroring the CONFIG_MMU path so pin and unpin are
>symmetric. Keep supporting the traditional behavior where users specify
>a pages array but don't set FOLL_GET.
>
>While at it, don't return NULL pointers in the page array,
>as this is really not expected for GUP users; instead, just fail and return
>-EFAULT.
>
>[ david: support traditional behavior with no FOLL_GET, extend
>  description ]
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: David Hildenbrand <david@kernel.org>
>Cc: Jason Gunthorpe <jgg@ziepe.ca>
>Cc: John Hubbard <jhubbard@nvidia.com>
>Cc: Peter Xu <peterx@redhat.com>
>Reported-by: Anthropic
>Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
>Assisted-by: gkh_clanker_t1000
>Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---
>I added a best-guess fixes tag. Given that this has been around for a
>while ... and it's nommu, I think this is fine just going into the next
>merge window. In that case, I will pick this up myself. If we want this
>as a hotfix, Andrew please pick it up.
>---
> mm/gup.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/mm/gup.c b/mm/gup.c
>index eb898ea1ee22e..1681bea8eed7e 100644
>--- a/mm/gup.c
>+++ b/mm/gup.c
>@@ -1659,6 +1659,10 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
> 	if (!nr_pages)
> 		return 0;
> 
>+	/* See the MMU variant: support the traditional behavior. */
>+	if (pages && !(flags & FOLL_PIN))
>+		flags |= FOLL_GET;
>+

Wait ... isn't this the wrong __get_user_pages_locked()? The MMU version
already does this a few lines below ...

Shouldn't the NOMMU version get the check instead, using foll_flags?

---8<---
diff --git a/mm/gup.c b/mm/gup.c
index 2ac04f88d244..dea61daa10fc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1659,10 +1659,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;

-	/* See the MMU variant: support the traditional behavior. */
-	if (pages && !(flags & FOLL_PIN))
-		flags |= FOLL_GET;
-
 	/*
 	 * The internal caller expects GUP to manage the lock internally and the
 	 * lock must be released when this returns.
@@ -1997,6 +1993,10 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 	if (!nr_pages)
 		return 0;

+	/* See the MMU variant: support the traditional behavior. */
+	if (pages && !(foll_flags & FOLL_PIN))
+		foll_flags |= FOLL_GET;
+
 	/*
 	 * The internal caller expects GUP to manage the lock internally and the
 	 * lock must be released when this returns.
---

Cheers, Lance
