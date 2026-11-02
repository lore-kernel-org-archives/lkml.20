Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647842;
	b=3JkHgbJysZmn3chGOT4UF589EKDI85ChtOcTddUyV13/jOOvnONlWzkzXD5NQJvVi8ov
	 jwCpDFawqzwWPXxrI4cSqJYATGk20ZZo1M4zEwjU9EQujabYlZNkIkT0HWV6DLLMeBQ+z
	 NFDVJTXeemdVVFE7nGBxTMTlfCNDpbowE7TmgFsiT9tTbSkyeccsb2oIt4NdlkHrFHANz
	 6d7ouPrET8GVFZqeBAs1nibv52BUfvW+Ud2t/TYlb4SihZX61ZJ/4nAT4DIC7/Xx6y+wF
	 sYxJK9K6Ubby3t5GZTcR169vNShXiiPvhHOTfU/I+PDpRclNN9XkpRtRSstEDWYhfhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647842;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YPfpT7MleReosEONdKQjTcxQoMMph5Kp2X65XVOMl18=;
	b=KfpHItd6e0AIVBEEfCV/1vu7+L4NxXb6NK4Yy3BzYWyrmF6SXw5DnI4jv9Vt1nMJiMvL
	 zo6pcvn9zttwE7r823VhhhXKyYfvFyA3BF4UsbZt7KQId806hJiiR5kh+KFDXu8VP0Ka8
	 I4/MoCni3ygzan/ZrLriMh9wL9HbP60wFbNz9Uns3gRyYyqSh8WF8IAuX9sZMZ6BJHB56
	 X42TbbfoQSW8NujjAMdsU+QN0OZEmSWcgIGUR1CzkMV06k/Qlx0yTrqhdLhC0M1gAiYNX
	 9hFbWGGZowmYSi5+B1xqY3JfSxodz2AmfVtQXl+EQtZbMGQ5Cpa0Qpkc+GTWannnV8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MkHKRRT3;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C32606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C32606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MkHKRRT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=YPfpT7MleReosEONdKQjTcxQoMMph5Kp2X65XVOMl18=; b=Mk
	HKRRT3sSGwvuIn3iZuGMA+rnNVkj1LttcKh3o223BS4OYKbwSVK6c787nn4l5ZyTvfSOhyd3rUY0L
	9PAmyYGUFaD1qYgykV4Fwfz0LTASe8HmuZlPZKLIxk6z4ekVPNE6pa7GT7yn/kttRu7oKdl0Jxllm
	wk6PTIMvuvpTnf+EUkqUtnFtkCuSlHbGAte6XyixNIHsBFIqX39c6/vMZHEQXI13piJfgUIIosXN7
	TFavLf2ayaBgRuSOYBec7YUyJG2Fq6r6sbS395DBgmGpJlKZc8HTV1GFx0SpK5WGTIXYy0M1u93OR
	qULj0zxR1fzxteONm9LnGBS+sZhaWdYQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-00Cc;
	Mon, 02 Nov 2026 19:30:32 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org
Subject: [RFC PATCH v5 0/8] batch lookups in follow_page_mask()
Date: Mon,  2 Nov 2026 14:30:18 -0500
Message-ID: <20261102193026.3860700-1-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
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

follow_page_mask() walks the page tables one page at a time, even when the
caller asked for a whole run of contiguous pages. Every page of a large folio
re-enters the pmd/pud/pte walk and re-takes the page table lock.

This series changes follow_page_mask() to return a page count and fill an
array of pages, instead of a single struct page, so a walker can hand back
more than one page per call.

Patches 1 to 4 are preparation, no functional change:

  1: move __get_user_pages()'s open-coded pages[] fill and cache flush into a
     gup_fill_pages() helper, which the rest of the series reuses.
  2: convert the follow_page_mask()/follow_p4d_mask()/follow_pud_mask()/
     follow_pmd_mask()/follow_page_pte() call chain to return a long instead of
     a struct page pointer or ERR_PTR(). Every path still handles one page.
  3: split the "grab a folio reference and store the pages" tail of
     follow_page_pte() into gup_grab_folio_pages(). Storing runs under the
     lock; the cache flushes run after it, via gup_flush_pages().
  4: split the "work out which page this PTE maps" half of follow_page_pte()
     into gup_lookup_pte(), leaving one unlock and one exit.

Patch 5 has the huge page paths store the page and leave the array fill to
follow_pud_mask()/follow_pmd_mask() after they unlock, so the cache flushes
happen outside the pud/pmd critical section.

Patch 6 has follow_huge_pud()/follow_huge_pmd() report the huge page's real
subpage count instead of a separate *page_mask output, and retires *page_mask
and __get_user_pages()'s try_grab_folio() call and subpage loop.

Patch 7 walks every PTE in a page table in one follow_page_pte() call instead
of one per page. The slots are stored under the lock and flushed after it is
dropped, so a whole-table hold does no cache maintenance under the spinlock.

Patch 8 adds gup_pte_batch_len() so a contiguous same-folio run is committed
with one refcount grab. This is the only patch whose benefit depends on folio
size; patch 7 alone covers plain base pages.

Patches 7 and 8 carry their own benchmark tables, both measured against the
base of the series, so the split between the two mechanisms is visible: the
single-call walk is worth 2.3x on base pages and 2.2x on 64 kB mTHP, and
refcount batching adds a further 5.9x on the mTHP case.

Yuan-Hao Hsu ran the v3 series through mm selftests (DEBUG_VM, PROVE_LOCKING),
a GUP-vs-mprotect/MADV_DONTNEED/MADV_COLLAPSE/fork race test, a mixed-mapping
core dump test, W=1/sparse and arm64/i386/ARM builds, all clean, and confirmed
the wins with pin_user_pages(FOLL_LONGTERM): 64 kB mTHP at 256 MB goes from
2318 to 249 us, 4 kB pages from 2361 to 1065 us, 2 MB THP unchanged.

v5:
 - rename the new helpers to gup_lookup_pte(), gup_pte_batch_len(), and
   gup_grab_folio_pages() (David)
 - rebase to 7.4-rc1
 - document that folio_mark_accessed() now runs once per run,
   leaving a freshly faulted large folio referenced but inactive after
   the first call (Yuan-Hao's measurement)
 - note (in patch 4) why the recorded no_page_table() call cannot newly trigger
   on a FOLL_WRITE failure (Suren's question; answered in changelog)
 - add Suren's Reviewed-by tags on patches 1, 2 and 5

Not in this series: a single bio_vec straight through pin_user_pages_fast
for iov_iter_extract_bvecs (Christoph's idea) stays separate work, as David
suggested. The series does not change dirty-marking semantics -- a batch
only gathers the dirty bits its PTEs already had -- so the wider question
of whether GUP should mark folios dirty at all stays where it was
(John Hubbard pointed out the balrog in the room).

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20260811025157.1632867-1-riel@surriel.com/ [RFC v3]
Link: https://lore.kernel.org/r/20260801031540.2742891-1-riel@surriel.com/ [RFC v2]
Link: https://lore.kernel.org/r/20260730035350.1fc95dd8@fangorn/ [RFC]
Suggested-by: David Hildenbrand <david@kernel.org>

Rik van Riel (8):
  mm/gup: break out gup_fill_pages() helper
  mm/gup: convert follow_page_mask() to return a long
  mm/gup: split out folio grab-and-store helper
  mm/gup: break out gup_lookup_pte() helper
  mm/gup: fill the pages array outside the pud/pmd lock
  mm/gup: return a huge page's full count from follow_page_mask()
  mm/gup: walk multiple PTEs per follow_page_pte() call
  mm/gup: batch contiguous same-folio PTEs into one refcount grab
