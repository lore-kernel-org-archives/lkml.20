Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619030;
	b=g03qEh3XLKEHalxOgaNfBK6rIZU29hC0wYu/b6ZUWJKQtQGt0/KPm1WW0uW5FyfpaP1t
	 ncNveiqh2ECmRRdTTKjO7UcOAhtIqzIBYXQdenZnJfRbibktNnSC9FRJIeJDVd+jWJJ6Z
	 XFd5rUEpM4GnjatkqDmc6UFrSxF0gvI0eWdjlyn8GDoT3cb2avO9lhnAkOudKJrd0Dklr
	 lCw16y39g6WxN9u4k1pMfDyFLUmKDIW30t7pfQ6HJVpn0CTr+qHTr/aDLYosWYtsK1BM6
	 Z0i198fnu/jmJnfGzqOB58ioJXNTzBoH+wxd0yR1UjHhUPi4s/nvEDTt3gW77rrDIsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=InMeFNFjwhLZQCf3I7xrn9FEQa/179dGH7u0e06Suzo=;
	b=lxycxjWASjWz9CnWODAc0sxhajwJbHPGMJb3DDvAmIc/6oJCirVCUVCE6PgxjwTKhQmY
	 lPYY+J1tIDbBQbPVMFreZeAM/5Rd1y0dk6nN9ifJiyika0uK+ymn6JruFnvPfZi8fOyAu
	 F5FWYk4as3NPmp0QnmBex50en/C+l0HCJzY6RKVoob3dMnBNJ7EItaVGnA5B0J19+CVBi
	 Bz5QYPzuhs/4fnK9qGn2/4sAJqrvPK8oq07J6XdUGuIOhvEAIDUM0TyljkSHkjJP8XMEC
	 bLWT5uiQwMcbCgKWQJuKvom/pIXXU1UZ5qjtN3EfnEJ+iuL5jI+gUacwypZaRcuNplw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pHJ9pM3A;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38877606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38877606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pHJ9pM3A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 686671691;
	Mon,  2 Nov 2026 03:30:25 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97F1C3F632;
	Mon,  2 Nov 2026 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793619028; bh=D3Vf1PsT2DwtrXV9xY5TZ0/AQoE6JjmwaFHA7vLMNzo=;
	h=From:Subject:Date:To:Cc:From;
	b=pHJ9pM3APBFr6bQUnqzxTZjWVOKOX1gu79gJ5/9Fuwjzbx5Q0LTupSjjfEpgwHJBs
	 t6FbePj4JW5hCwqFUIo3vOnbzudfXnxDoK8SLLEg+VK3+GRBz9fyzhsRQYDAUe6uKX
	 zRD7KyRedgu793bFJB3IdfxdrmPsCBNfAQ5Dm89s=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/4] mm: gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
Date: Mon, 02 Nov 2026 11:30:15 +0000
Message-Id: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEd06GoC/32Pyw6CMBBFf4V0bU0fmQKu/A9DSClT6IJHWiQaw
 r9bMHGjuLyTe87NLCSgdxjIJVmIx9kFN/QxiFNCTKv7BqmrYyaCCcUZB+rRajMNvmzuY2l1mGg
 FgNJCLmsjSOTGWHGP3XkrYm5diP3nPjHz7frPNnPKqESOFiBVmbJX7buzGbpN/eYEO+KMzVPBc
 10raX5w/IhjDLSW8Q3g8M3Jwz3F0iplErIo/3DFuq4vBujeUFgBAAA=
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3915; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=D3Vf1PsT2DwtrXV9xY5TZ0/AQoE6JjmwaFHA7vLMNzo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HRQWD+A5zA3eTJ38mRGoA6BKnrD69H999el1
 MHyVxSeVZuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauh0UAAKCRBt1cPRWsUx
 M80gDADYr9b8OAg2TMoX4hf6iIaHO7YXrgUNwirzE5g4a4TFYCYVnwwY9CnO2sv5IqfIvNCSISD
 9dnjL29vcgNLXEy1A66vCIqOZsNY/XTeoMGOsXtDO38L2/774YPCZjfA2GnR5AeksySSTL7uI8p
 BsMmkRe3Jrujlu59Nzwvp/Rj5Y+MpFjkKqj0mweas9j2Qv5OrfcWP8W+rckZQPs7S5uyODsR5Hy
 VUb4U1ZhA8q1F8KC9uNOEMBaDh0WQbBUTxZqvRihm0L6SyKNki8rpxqEiQOLbALBxLd/tsBPx/u
 9ZzJJVk10GAAYp2rjhB8Jk15mZN8HebJ772pobuRAXJ4J3Vh2DFOreRAO2Y/XbUuV28H3ySvgUO
 mMzWHjTvtcM9OvFULpBaCnhGNkaUxZeHyDVJ9+rr1AhM7UeENNtkAioVWWEZ67HbRlYgZZyXOvj
 sTYvaJjOqazluzb/wft5tIVA6m4WcAy1Sza8E56E2HO3zP9H639TtwHni3FpDQFzO18Sg=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
atomic, a full barrier and a node stat update for FOLL_PIN), a
gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
pays sixteen of each and a PTE-mapped 2 MB THP pays 512.

The users are the hot ones: iov_iter_extract_user_pages() pins every
O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
buffers through it, and so does RDMA memory registration.
With mTHP those buffers are PTE-mapped large folios.

After the head page has been grabbed and verified, extend the run to the
following PTEs that map the next pages of the same folio with the
same protection bits, take the remaining references for the
run with try_grab_folio(), and fill pages[] from the run.
The PTEs of the run are read while the reference on the folio is held,
so the folio can neither be collapsed, freed nor split underneath the scan.

A read-only run of an anonymous folio stops at the first page that
gup_must_unshare() rejects, so the per-page exclusivity guarantee for FOLL_PIN
is kept.

folio_pte_batch_flags() does the scan.  It reads the entries with
ptep_get(), which is not safe without the page table lock on
CONFIG_GUP_GET_PXX_LOW_HIGH (x86 PAE, mips32, sh) or with arm64 contpte,
and GUP-fast reads every PTE with ptep_get_lockless() for that reason.
Add FPB_LOCKLESS to make the helper do the same; it is inlined per call
site, so the other callers do not change.

The order-0 path keeps its instruction sequence.  The folio flags are
tested before folio_set_referenced() on purpose: a load of the flags
right after that locked instruction cost about 25% on order-0 pages in
the gup_test benchmark below, and reading them first brings that path
back to the baseline.

gup_test ioctl over a 256 MB anonymous region, FOLL_WRITE, 65536 pages
per call, median of 15 runs, two baseline boots / one patched boot, on
an x86-64 VM:

                       get_user_pages_fast()   pin_user_pages_fast()
                       before       after      before       after
  4 kB pages           849/789 us   783 us     1174/1138 us 1094 us
  64 kB mTHP           812/811 us   126 us     1215/1113 us  188 us
  1 MB mTHP            799/774 us    59 us     1185/1077 us   64 us
  2 MB THP, PTE-mapped 803/786 us    57 us     1159/1120 us   58 us
  2 MB THP, PMD-mapped  42/40 us     40 us       46/41 us     42 us

fio O_DIRECT randread of a null_blk device (CPU bound) with the I/O
buffer in 64 kB mTHP, median of 15 five-second runs:

  bs=1M psync                 126.2/125.6 GB/s  ->  220.6 GB/s
  bs=1M io_uring, iodepth 16   71.2/71.6 GB/s   ->  112.1 GB/s
  bs=64k io_uring, iodepth 16  50.2/50.7 GB/s   ->   60.1 GB/s

IORING_REGISTER_BUFFERS of 1 GB, median of 15:

64 kB mTHP           6179/5998 us  ->  1599 us
  1 MB mTHP            5790/5801 us  ->   893 us
  4 kB pages           7173/6741 us  ->  6763 us

---
Changes in v2:
- fix exceptional case for shstk on x86.
- remove redendant check for pmd change in each pte barch.
- Link to v1: https://lore.kernel.org/all/20260917083747.786-1-aa9736195201@gmail.com/

---
Yeoreum Yun (3):
      mm: gup: introduce gup_unshared_pages()
      mm: internal: fix inconsistent in folio_pte_batch_flags() for shadow stack
      mm: gup: batch PTE-mapped large folios in gup_fast_pte_range()

Yuan-Hao Hsu (1):
      mm: internal: introduce FPB_LOCKLESS for folio_pte_batch_flags()

 mm/gup.c      | 113 ++++++++++++++++++++++++++++++++++++++++++++++------------
 mm/internal.h |  70 ++++++++++++++----------------------
 2 files changed, 117 insertions(+), 66 deletions(-)
---
base-commit: 34f88a114888c9dba49e45f2b0c2a3e83c4c871c
change-id: 20261015-refactor_gup_fast-b55e3f593dc2

Best regards,
-- 
Sincerely,
Yeoreum Yun

