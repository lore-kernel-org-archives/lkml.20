Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0544162A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984659; cv=none; b=rmPE/1vzOwW8Q55DPJPnz22o6UjOjsGhHAyM3ErTxZVTfbUNwSgPgVt6w6uqIGPgZwaqF37nwZVo+dzOW/NorhNnr9HmeY8G9EwItpkIIZoZFRtCWmNY352x58UaIilemewmaLcMqWjPcw6LXOaCD2/hR+7sG3zwS9EickqTvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984659; c=relaxed/simple;
	bh=72I9yBzfGM45+AogRjk7w3z/baq6RZ/juZGm0YnbT0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JlzPWEwRi1EuSHRGO4cWW0iMOvFvjS2QeMgMK1XSfJyQUbgyFFAJD/vntnFS4P2Rhy9k4DKZkZZALhoLprYb9JYu/PSSut2R4m9YmCIEOXknpvGBmQIy7Z1iLF0RkWi/fp4Wf7gCl9d10YT7eFNC3oByvPJoaG0FZoLwHMceuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4CEEleJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4CEEleJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AD41F000FF;
	Mon, 21 Sep 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984657;
	bh=kegxLK5Xa2bs3Cf0CvHFhVg7I1jBlelgO0k5ZXmd+8U=;
	h=From:Date:Subject:To:Cc;
	b=n4CEEleJPatRciYjxloAv3UxR2CitO2bLF+5DnDH+nxZCOKw2fVEo0AfrFefdj3fd
	 bTfN4tOkVLF4xeEwxx7lDK4WI1v2AbFjBP08Tw5HCs5c/SCBm64G4rFtbt2EnjRkNV
	 lsaTnWW2XZEEIynEBaLEb08HLEHIP4TBFvCMwLv31l8b+l7kNfz7MONouFI4202ub6
	 DRdZyKG59NlKsM+LlyDu+HQBWRsBKgLcezct0xX0JNmX3UVaLikOUav39wcU3qCsO+
	 cRW0+aSlBP+kSdYCuSmI+vQ0bbUBlpHNE2yEKlrWUESq7p+UzIAiZd5oDS32/GECE7
	 1ohKziwONnMqg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 21 Sep 2026 11:57:29 +0200
Subject: [PATCH v4] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nommu_gup_pin-v4-1-c410041cc479@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIj/sGoC/yXM0QpAMBSA4VfRubayEeZVJDEHR5m1mZS8u+Hyu
 /j/CxxaQgdVdIHFgxxtOiCLI1BzpydkNASDSESeSC6Z3tbVt5M3rSHNhjFPJS9UyUsBoTEWRzq
 /X938dr5fUO3vBO77AQJCSKVxAAAA
X-Change-ID: 20260919-nommu_gup_pin-df63917c8182
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 David Hildenbrand <david@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=david@kernel.org;
 h=from:subject:message-id; bh=HxMJunxqlMOF1zZ6l1Ua107s6bmir1eB6BnonPlsO6s=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLI2/O+1789v7He6cPbfV1lDve+Sj+Y/PfJV44PfTueEf
 8KrGqfIdJSyMIhxMMiKKbIEBd83ePlyXW21Gx8zzBxWJpAhDFycAjCRmV8Z/pl2Nd+bwxx9UGy7
 pfauB1ISljeTkpsaf21M5hD0uf3E4jbDP7uH4u32DfF9CXYxHIYdbusm2hz/sHl3Zt0erQO3Xy6
 +ygUA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
get_page() reference for each page regardless of foll_flags:
	if (pages[i])
		get_page(pages[i]);

This is reached from pin_user_pages*() with FOLL_PIN set.
unpin_user_page() is shared between MMU and NOMMU configurations and
unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.

This means that pin adds 1, and then unpin will subtract 1024.

If a user maps a page (refcount 1), registers it 1023 times as an
io_uring fixed buffer (1023 pin_user_pages calls -> refcount 1024), then
unregisters: the first unpin_user_page subtracts 1024, refcount hits 0,
the page is freed and returned to the buddy allocator.  The remaining
1022 unpins write into whatever was reallocated, and the user's VMA
still maps the freed page (NOMMU has no MMU to invalidate it).
Reallocating the page for an io_uring pbuf_ring then lets userspace
corrupt the new owner's data through the stale mapping.

Use try_grab_folio() which adds GUP_PIN_COUNTING_BIAS for FOLL_PIN and 1
for FOLL_GET, mirroring the CONFIG_MMU path so pin and unpin are
symmetric. Keep supporting the traditional behavior where users specify
a pages array but don't set FOLL_GET.

While at it, don't return NULL pointers in the page array,
as this is really not expected for GUP users; instead, just fail and return
-EFAULT.

[ david: support traditional behavior with no FOLL_GET, extend
  description ]

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>
Reported-by: Anthropic
Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
Assisted-by: gkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3 -> v4:
* Put FOLL_GET fixup into the NOMMU __get_user_pages_locked()

I'll queue the updated version after some more review.
---
 mm/gup.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22e..4e9b5ac2cb62e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1983,6 +1983,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 	struct vm_area_struct *vma;
 	bool must_unlock = false;
 	vm_flags_t vm_flags;
+	int ret, err = -EFAULT;
 	long i;
 
 	if (!nr_pages)
@@ -1999,6 +2000,10 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 		*locked = 1;
 	}
 
+	/* See the MMU variant: support the traditional behavior. */
+	if (pages && !(foll_flags & FOLL_PIN))
+		foll_flags |= FOLL_GET;
+
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
 	 */
@@ -2019,8 +2024,14 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 
 		if (pages) {
 			pages[i] = virt_to_page((void *)start);
-			if (pages[i])
-				get_page(pages[i]);
+			if (!pages[i])
+				break;
+			ret = try_grab_folio(page_folio(pages[i]), 1, foll_flags);
+			if (unlikely(ret)) {
+				pages[i] = NULL;
+				err = ret;
+				break;
+			}
 		}
 
 		start = (start + PAGE_SIZE) & PAGE_MASK;
@@ -2031,7 +2042,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 		*locked = 0;
 	}
 
-	return i ? : -EFAULT;
+	return i ? : err;
 }
 #endif /* !CONFIG_MMU */
 

---

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279

change-id: 20260919-nommu_gup_pin-df63917c8182

--

Cheers,

David

