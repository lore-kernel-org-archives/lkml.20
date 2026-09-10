Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267647DD55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041771; cv=none; b=hLwBuwh8bk/TndLMAZXedKlXEWaA3qXnsgHsgFifd9pDDvPIxh+jxqfqITQdndFsYTP5N6uIYp9nq54VB//0bJN6zcCfzGd04HAzEzN2r6/X48lWlMGm472QGcgI35gAaj6ALA63aNBmC28yw/sMs9ZkfdcM+sXGPE1i3UvAh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041771; c=relaxed/simple;
	bh=e8LsK0V8CBy7ll+T0QGC6u2GsOrDBh2qhfyAPYTvEV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVF9svU3jH904ZZ4x+l+TD+nUsOna1sNC2U/QhrIlQoBbsJNCz03YXrHpb4wblfMSG1VKAFi2MxJGZ0JMKXHxG/Sc4ji6h8im5Rb03+LGlEIrung/YI2m15orcuri8hiXwvfJTfYB2gxG+IhYld5JiTEW8Ul9FqLIpZyYQ4/WYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=FqGETsnn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WejUxfxE; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="FqGETsnn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WejUxfxE"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6DBE01D0006F;
	Thu, 10 Sep 2026 08:02:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 08:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1789041764; x=1789128164; bh=NWWdQyL/Pb
	DsgsxeFbbTVzX5Z8ycvsuk2Un6M8qiS+A=; b=FqGETsnnUjKhXq2XQDAqBToT8y
	xoWRfEOi09O42hdLMy2sF2yfjw19bzrz9VcHF1YFI9SEhiXegqZ5SKJUio9M55aa
	J2FS46ZgYuV7l+6EEfYHtiCDKgbwnJd9qekyqY7QMUks4rIEe7MomiLE858GNUi6
	D1qCXde5rsCxDPk+y3JL9aQgR6lSYgtqkAWyNiqQNsFV01PWCr4dQGcLKl61m4Hx
	/i2IjENek1vuS5Tl9mCRJFrk1n/WfCswXQ3JsufxHmNg6lV33pVOx8DMkVCuFS5e
	5BvuN38Ognc1R5HDc8YPRp/T4iC5NZ9XkOYQVfVlOhNoAJEVU98okR4VJzyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789041764; x=1789128164; bh=NWWdQyL/PbDsgsxeFbbTVzX5Z8ycvsuk2Un
	6M8qiS+A=; b=WejUxfxEujmznltWba2U4M5v73OqlTFztq40BEE91Ymjc2zV3LE
	Wu41NNbptamp9yC8dZhTskbnsyIJWTgtr9huxuOJaDQnINOhyFNl1eHoYpt0EUot
	yPz2IVixl2zVU7JA7NZqXg6KpVvao93/O+iCYVVQR7gQDk/AJgvprF8NIXGFLEm7
	sff0UxYea1af/pubpzETLtq4aaiJnIBhd2y6qtca98u3J6SYdXYxAE0kYTJCZdoF
	ouwDC9K02TKib6Ftf4ZS3W+aU0xaYBnnyANq/WvGXBHrWPkCDGjNP8+eRUt00XKC
	bGgWqxl1Te+Iy+E+FTXlT3ynoWn09RJDrig==
X-ME-Sender: <xms:Y5yiaoLMh2tb1d5iA1Su17Q0NG9eC8MHhJW-kbQdUhs4h97DnHpq1A>
    <xme:Y5yiakGeq1d-WfSwYUdg3jpSQ2zei7X8kRzvwC8zFEMRo2C5F-kqkdukPIjAr2mbQ
    jsHZqCU-BK0krffVwrTN8XsCPVTcHI1d5tPoKE3qs3JYHf64DsauOs>
X-ME-Received: <xmr:Y5yiau1jDom6uR0Q5nfZWtZEFyKe7HffhLEDcYtxzS5-BT0oCo9WzKNNZ4M>
X-ME-Proxy-Cause: dmFkZTGXt30db1exnJDbw7W3OsexmKkDXxtuzUo4EwvKZc0CNK+BEhghtPadS4dxP7vADF
    jYIeUWk907weicO99D+fAuFM6Q3PWhN3gli8K+53t36eJeuCTjXbHpZlk+RT11q9u9Cn4F
    aZejNv1p6J+PHk5kBixx+LGBlNC6twqvMhklia3PdSpCABiohNAFTn8Xxp2ompwe1bcmwZ
    91pPGflso6rZ+73n3TohIGdcCpsfDko0TCvG5qUtsZ7DZYge5y3w/r1kOAZTW8AhT2cnMK
    +YF/6gCZZoWeL/lRPi9XJbya2I1/Y+9D7QwHP0pQf9wjgFnFy/fq5yd38PRZt35kLLEYs2
    nAq2/rofKFwArggov6j7bLWvc7frwmKx8twlUA1OQ2ZBhoF6xLu7ixNZwE5jsohwNyGBo0
    9Yq0+OQx7vtvI8Ni+QuruYo9NUIPnxidcsUuVjfDLQh3Jxmz5EoLskrYXt0dYQRyyN9Y0A
    p6qfUJG5Q3Qhkb8dEUtYhgVODSc642k6/oG9PPf8e/ppBqA+jMRxHXorX2b+nd4ErT+38b
    UKDQ/QGqWudqdo6F+41PyM0OoNNP1WoDi5TGaW0+sE9EQSIpfiGKsk6nTlyPO7Fl/U4A8S
    gvjK1a20tlzIDk9aGOhFZulqDvhSEHKBeagOyFXnflYSXeZbNQTU2xCs+eww
X-ME-Proxy: <xmx:Y5yiarxSCRBhAPlqKzKKZwD14eJc9JvMn9vtBPJvyM5Mk0Dt1NJNUQ>
    <xmx:Y5yiatjUXI4ZxumLHN2bHm0tiihU3njhpbloLojmAcNYZgUwUnNKCA>
    <xmx:Y5yiaqxLCSlPYwPnQ17yMOxxW2KVIZtJPTlvJmXlSmjTGeACLYcoig>
    <xmx:Y5yiarzfIAgIiBdSvyJMX9sVwHqG2jdugcJBuxqJ6I0I2wye3eGB6w>
    <xmx:ZJyiavDq4bijXge7CLc4qmZBAcGX-ZFVTXNXYKEx-PsUSH3N-17gho9l>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:02:42 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 00/12] mm/collapse: separate a collapse from its callers
Date: Thu, 10 Sep 2026 13:02:20 +0100
Message-ID: <20260910120238.2529819-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

[ This is the first of the cleanups I said I would front-load ]

There is no line between the collapse engine and the callers that ask for
a collapse.  khugepaged.c holds both, and they reach into each other.

 - Sixteen tests through the collapse path read cc->is_khugepaged to work
   out what they are allowed to do, when every one of those decisions was
   made by the caller before it asked.

 - collapse_single_pmd() does both halves of a collapse behind one call and
   drops mmap_lock somewhere in the middle.  Which of its paths dropped it
   is not something a caller can see, so it hands back a bool and the
   caller keeps track.

 - MADV_COLLAPSE's implementation -- the walk over the user's range, the
   per-PMD loop, the errno translation -- sits in khugepaged.c, which is
   the daemon's file.

So: draw the line.  State what a caller allows in a policy, split the call
in two with the lock as the boundary, and move the syscall to madvise.c.
What the engine offers is then four calls, with the lock state written
down against each, and a policy the caller fills for itself:

    collapse_control_init(cc)         once, before the first table
    collapse_policy_*(&cc->policy)    what this caller allows
    collapse_scan_pmd(vma, addr, ...) per table, under mmap_lock
    collapse_run_pmd(mm, addr, cc)    when a scan found work, no mmap_lock
    collapse_control_release(cc)      once, when done

The engine stays in khugepaged.c for now; what changes is that it has an
interface, and that neither half has to ask about the other.  madvise.c
gains the operation it should have had all along.

Changes since v1
================

  https://lore.kernel.org/all/cover.1788533997.git.kas@kernel.org/

 - Rebased onto mm-new with Vernon Yang's tracepoint fixes in it.  Patch 8
   no longer merges the two calls to each scan tracepoint, since the base
   already has one; its changelog now says what the status field reports.

 - Patch 3: nr_occupied_ptes is nr_eligible_ptes, and the mthp_collapse()
   comment counts eligible PTEs too (Zi, Baolin).

 - Patch 4: no comments on the two constants (Baolin).

 - Patch 5: one line per policy field (Baolin).

 - Patch 8: the file side is split like the anonymous one (Zi).
   collapse_scan_file() runs under mmap_lock in the scan and only judges;
   collapse_file() runs in the run.  See Behaviour below.

 - Reviewed-by from Zi Yan and Baolin Wang on 1-4, 6 and 7.

Patches
=======

The first three stand alone and can be taken separately:

  1  drop the mmgrab() MADV_COLLAPSE has held since 7d8faaf15545
  2  count collapses in khugepaged's own walk, where the daemon's
     bookkeeping belongs
  3  rename cc->mthp_present_ptes to eligible_ptes, which is what a set
     bit means

Then the interface, in order:

  4  add collapse.h, and move enum scan_result, struct collapse_control
     and the two constants into it
  5  struct collapse_policy, filled by the caller; the is_khugepaged
     tests become field reads, and the flag goes
  6  drop collapse_possible(), a wrapper that only turns a mask into a bool
  7  collapse_control_init_scan() is a per-table reset, so name it
     collapse_scan_reset()
  8  give the scan and the collapse a function each: collapse_scan_pmd()
     and collapse_run_pmd()
  9  open-code the entry point that joined them, so each caller owns the
     lock across the boundary and the bool goes
 10  work out the orders a VMA allows once per VMA, not once per table
 11  declare the four calls in collapse.h, with the lock rules
 12  MADV_COLLAPSE moves to madvise.c

Behaviour
=========

No functional change is intended.  Nothing here changes which tables get
collapsed, into what, or what MADV_COLLAPSE returns.  The tracepoints are
the one place a change can be seen from outside; the rest is where work
happens, not what it does.

 - Patch 8: mm_khugepaged_scan_pmd and mm_khugepaged_scan_file fire before
   the collapse rather than after it.  For an accepted table their status
   field reads SCAN_SUCCEED, where it used to carry what the collapse made
   of the table; that is now for mm_collapse_huge_page and
   mm_khugepaged_collapse_file to report.

Three things move that a reader should not have to find in the diff:

 - Patch 5: khugepaged fills its policy once per scan pass, so the
   max_ptes_* limits and the defrag setting behind the allocation mask are
   sampled once per pass rather than once per table.  A knob written
   mid-pass takes effect on the next pass instead of the next table.

 - Patch 8: the file scan runs under mmap_lock, where before the lock was
   given up first.  A file table the scan refuses no longer ends
   khugepaged's pass over that mm; only a table it goes on to collapse
   does.  A PMD folio the scan finds already in the page cache sends the
   run straight to retracting the PTE table, and the writeback retry
   re-runs collapse_file() alone.

 - Patch 10: which orders a table is scanned for is sampled once per VMA
   rather than once per table.  It cannot widen what a collapse does; the
   order is tested again under the lock the collapse retakes.

For an anonymous table, and for a file table that gets collapsed, the lock
is given up and taken again at exactly the points it was before; the only
difference is that the caller is the one doing it.

selftests/mm khugepaged passes on x86-64 with a KASAN, lockdep and
DEBUG_VM config, and every patch builds, CONFIG_TRANSPARENT_HUGEPAGE=n
included.

Kiryl Shutsemau (Meta) (12):
  mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
  mm/khugepaged: count collapses where khugepaged makes them
  mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
  mm/collapse: add collapse.h for the collapse interface
  mm/collapse: state what a collapse may do in the policy
  mm/collapse: drop the collapse_possible() wrapper
  mm/collapse: name the per-table scan reset for what it resets
  mm/collapse: separate scanning a PTE table from collapsing it
  mm/collapse: open-code collapse_single_pmd() in its two callers
  mm/collapse: work out the orders a VMA allows once per VMA
  mm/collapse: declare the collapse interface in collapse.h
  mm/collapse: implement MADV_COLLAPSE in madvise.c

 MAINTAINERS             |   1 +
 include/linux/huge_mm.h |   9 -
 mm/collapse.h           | 153 ++++++++++++
 mm/khugepaged.c         | 527 +++++++++++++++-------------------------
 mm/madvise.c            | 169 ++++++++++++-
 5 files changed, 521 insertions(+), 338 deletions(-)
 create mode 100644 mm/collapse.h


base-commit: cf558a250cf4475a8936902b8978fbb6c61016f8
-- 
2.54.0

