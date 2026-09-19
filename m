Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAEE45519D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812296; cv=none; b=RI2DV6Hgcjb/nb3siPmjblpk3vKvyyGUYfn8eknn0tjDU9eI+R+sdVqiHETmbbOjWlsEMGEgIuvIHjAy/ArxJjVZ8nlG4gnWGXg9QJ/Qkdbs5tnomW/OmrlattFYBzsoSt5pmjlEd4iHST8KE9Mi0TzhZlybBV/9eU0O24f3PpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812296; c=relaxed/simple;
	bh=8cFFxo0x0XbGwbAaZrohisApoCmfuDSixKKdRyjOp5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N7eo4wl3KRw4up6VuKrx+fcxB9LusEF9T01GddDp7AkN7H5UwI77YN621H/4QVuHXRzGsoIu+g0sI2Lu975+n/VXcOAXbOQGO7ZsBEv6CChq8tvNms+Eg2p/O9T4ndOjW5U5xgFmoCAjlvnaUgdM1wKxQkAc2KhznewrrSiOT7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AB+P+Dbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AB+P+Dbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757831F000FF;
	Sat, 19 Sep 2026 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789812291;
	bh=HUNU8WlYTvz53+Q8M4jOiz4WEBDp0YF3dUQql82MWfI=;
	h=From:Date:Subject:To:Cc;
	b=AB+P+DbohSA5vF//USDAePxj2u8qkSxK1aZEhzVQsWNxGfugWfltgjTBtIsbaxVlP
	 pGAR241LXaIPfTlPQcSD8SvBkmmoZpwIL0XOqgFXl8vASk9DIde9yWLwxI2tmAHPIq
	 N7BZKFGjsv3HXAO6RxH+211b+ggm4zUD1va6ZjnHolKmbNrH/58L31nkQb6+PzER25
	 yXICDgioK0IULDjdR0YeZ1Z1QqrnH0j/4oJVic5QH8V70s5VStJe4uUju6WkLrdovB
	 IeJiiqCB3TUQ1QxRXaQy+jiPsee2hHE+fUL09b3k/REM0fN2w7opVer9H2tHSl2twF
	 znBdj5Lqoxc5w==
From: "David Hildenbrand (arm)" <david@kernel.org>
Date: Sat, 19 Sep 2026 12:04:36 +0200
Subject: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBSA4VfRubayKcyrSIs5OMqszaTk3Q2X3
 8X/X+DREXqokwscHuRpMxF5moCeOzMhoyEaRCaKTHLJzLauQU3BKkuGDWORS17qilcCYmMdjnR
 +v6b97UO/oN7fCdz3A/tEjEJxAAAA
X-Change-ID: 20260919-nommu_gup_pin-df63917c8182
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 David Hildenbrand <david@kernel.org>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3893; i=david@kernel.org;
 h=from:subject:message-id; bh=jGLrYmctqoehyGtKEy83+Rhs7HUTE97IKGKEz5l+j4M=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLLWxVn62VzpXMdlnF75NadYadca83kGfxZXZF5tTftna
 vn4oeyLjlIWBjEOBlkxRZag4PsGL1+uq61242OGmcPKBDKEgYtTACYS9I/hf8HB7s0O3TlGX7la
 Fil+42e6/DOfY0e2Z+SepNqbZ6JXezAytNTf4K+1rljfq9THb2uz0PSdse9u1wcvTxj+l57M8Go
 qCwA=
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
Reported-by: Anthropic
Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
Assisted-by: gkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
I added a best-guess fixes tag. Given that this has been around for a
while ... and it's nommu, I think this is fine just going into the next
merge window. In that case, I will pick this up myself. If we want this
as a hotfix, Andrew please pick it up.
---
 mm/gup.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22e..1681bea8eed7e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1659,6 +1659,10 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	/* See the MMU variant: support the traditional behavior. */
+	if (pages && !(flags & FOLL_PIN))
+		flags |= FOLL_GET;
+
 	/*
 	 * The internal caller expects GUP to manage the lock internally and the
 	 * lock must be released when this returns.
@@ -1983,6 +1987,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 	struct vm_area_struct *vma;
 	bool must_unlock = false;
 	vm_flags_t vm_flags;
+	int ret, err = -EFAULT;
 	long i;
 
 	if (!nr_pages)
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

Best regards,
--  
David Hildenbrand (Arm) <david@kernel.org>

