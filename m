Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1B2E229F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066851; cv=none; b=kZCtIwpAf9OLwqeGAzrMqYSpIoTDtRb3qUt04gQzkcc5plj1JayvdENccrX9hB0b1UQd3hKp5R6xnjdu7LHeJsK4ge39xNNT0pWULzAasSL14UIsJSHMnhQRsdHGQtFPVgeVQkJl9p3/TYQCgHxNUup0vReepa8aWQGcMq3jX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066851; c=relaxed/simple;
	bh=YNpuLImCERzGNRsD2EeSDn0ZCfRe6qCilKGUFPh+X+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ceJDHpEOT5BWR4Lk8pL2gvuMJAJQoAyusVkw1ROgFMa5xINn+0q7jeQ5uXdPvnKb+77LHLHuU7OHMN/5UWoGl78MU691AaLeFecZmvDwYOLQmrk+1dHaeCZX3CrrL26O+VeLFr8CpDUk/xyyixU6e7p44I5bPV+7lWTchMztxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=fHDWVEBh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="fHDWVEBh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so20098615ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066849; x=1788671649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnvYqsxNp8b49/rBowWqUXaz80+meTKicT7aB9r1cG0=;
        b=fHDWVEBhSioRn7sXjSOv73k9BNjz1Z0G8/DGRdnEm9TCjP9tfEyhM/HUNDo2LNvW+X
         7aMi5fsboy5WXpFjHt4g7NdCGVFvkYH35CeV771ci9+TU2Yc9QRgBrt63fRg5XaRiYZO
         1N7XIAbBVjTTeHS6z3hA1L08toHH7iWi7n4aFfAIlka1/LQ5dQDnYXXsMjgpL1UaMYYJ
         rjDIpSX6IwAIchazcWpOinP874zyS3senOL5VUCb6uzBhStY+NppdEolY3HDO2ajPftv
         sFyEc5qNPvthJS63dgEN21xmPokClFNqFPIV2QX6NljO1RFpjYm8zK2xjr7j8DBwyaXb
         f3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066849; x=1788671649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnvYqsxNp8b49/rBowWqUXaz80+meTKicT7aB9r1cG0=;
        b=pr/otCsc2Iz931Xohp6dMbjAjTXBCiKaviRc6yAD0ybFQbMFl+CMNAY1O9IP9ZLu/X
         oxpEdx+c3H/pO+iEDvXDniueW/bMMdeBb4DeTjM+brvE9YtlymlpOosNlE4yUlaleARN
         AFXf3dwE35fTy0SdCPEolhtoc3r5FpPHrytluD4wZxYJ7b1PDJ1cthwJFp4rQoUMf5jZ
         TGReLpxq6AXa0IGDcXVRhVpmd0wlBlTx8o6xjX7PrBvECRuvBrEzCZvSUuvR/yaIe9IC
         SYOnDO8Q6X9qH/ylBQUd1lg8JEusC9ZK2Y0u28WOKb37KdV9kKoJ7Doje8kOeLUOoUkV
         mQGw==
X-Forwarded-Encrypted: i=1; AKwUvBzAftyFWMlxTY2zzimVD4BCv4PL7RK+KSrL7HejocJkpvq3F+SeqctR97xMnWR1ENcfrPAl/2jK7rszUQk=@vger.kernel.org
X-Gm-Message-State: AFuF++lUB2UM7dqrRlTaqJywqk7cykOC9/lw9xukERcYJWe91E0zNVw0
	OpdArJSBigk/BSwX9JRaZBGJl88g5/4JJGXy3W2aCXghmqkoQAlz1XT+0lzgMzoLnL8=
X-Gm-Gg: AR+sD10x5LOfRRyDLLXfX5KwMw6braNPxaLmXz/VMr/WN13tej/Kslh1Upb4XYPyRun
	2g0iYodIgTJuu7mcl0geqw1++mt0iwRsL6XGyk0A7qdFXX9bkLwz+FLUowjE13tg2lVuNLQLUnZ
	2XaF3TNhakFG3pVLCrdPRqq9/Ep4+d4+TylzXJd2ghe9GFZoHqnJSRVCgO5PqpGztpmAWDjnzQT
	aq/xDXfESE9aI8HwMjOIE5FAJ7nEw2uQESfHA1uci9bdafuSeBjhV33Y74shjuhRX1Pb+w9jn2W
	Gwoz6u9Xl7zCyhAm7hcC7M7XqY0cZ5NJkVuNckDYIHTkslBHyzck86lsu8iDizCHeilYgrAMB30
	JpvvmP40MjNLmPhdVoJxNvMFObaZqyTwEnpQc3iyo0s2xrb+Jv+x1nddHcyfHxK5JMSzF+G8Pe8
	5kdHib+l4FO+rQ6ZgielKVZjslJQ0vcAD2RyG2jV3ErZ724OZFx8hYguHWTZuJUDLiNQ497eC4E
	4U/CU2zG+A5ADvIJwVjxln2tg5ujdZAHMQ=
X-Received: by 2002:a17:902:ce88:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d74dca2281mr279592645ad.2.1788066849370;
        Sat, 29 Aug 2026 22:14:09 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:09 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 0/6] mm/damon: support access monitoring of hugetlb-backed memory
Date: Sat, 29 Aug 2026 22:14:01 -0700
Message-ID: <20260830051407.50008-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On virtualization hosts, most system memory is often backed by
hugetlbfs.  On our production hosts, for example, ~95% of RAM is 1 GiB
hugetlb pages backing guest memory.  DAMON's physical address space
monitoring cannot produce a useful access signal for such memory, for
two layered reasons.

First, it is blind to hugetlb folios.  Every access check starts at
damon_get_folio(), which rejects folios that are not on the LRU lists,
and hugetlb folios are managed outside of the LRU by design.  As a
result, all hugetlb-backed memory is silently reported as never
accessed.

Second, even once hugetlb folios are visible, access-bit-based sampling
under-reports hot memory.  DAMON deliberately clears accessed bits
without TLB flushes to keep the overhead low, so accesses served from
cached translations do not walk the page tables and never re-set the
bit.  With 1 GiB mappings, translations effectively never leave the
TLBs, pinning the observed access rate to the TLB-refill rate: a
saturating guest is indistinguishable from a nearly idle one.

Patches 1-3 address the visibility problem.  The first patch moves
damon_hugetlb_mkold() from vaddr to ops-common as a preparation.  The
second patch teaches the folio mkold/young rmap walkers to handle
hugetlb folios, aging the huge PTE and notifying secondary MMUs across
the whole huge page size; the secondary MMU notification is what
surfaces guest-side (e.g., KVM/EPT) accessed bits.  The third patch
adds damon_get_folio_incl_hugetlb() and uses it from the paddr
monitoring primitives only.  DAMOS action appliers such as
DAMON_RECLAIM and DAMON_LRU_SORT keep the LRU-only lookup and are
behaviorally unchanged.

Patches 4-6 address the intensity problem with a new default-off
monitoring context option, 'aging_flush'.  When set, access bit
clearing for monitoring uses the flushing primitives
(mmu_notifier_clear_flush_young() and TLB-flushing PTE/PMD/hugetlb
aging) so that the next access is guaranteed to re-set the accessed
bit.  The option is exposed via the DAMON sysfs interface (patch 5) and
as a DAMON_STAT module parameter (patch 6).  With the option unset, the
behavior is identical to before this series.

Evaluation on an Intel EPT host running a 944 GiB guest with an 842 GiB
in-guest memory workload (masim):

  configuration          estimated access rate    idle -> load
                         idle -> load (GB/s)      separation
  stock                  0.08 -> 0.21             none (guest memory
                                                  invisible)
  patches 1-3            1.70 -> 1.96             1.2x
  full series, flush on  1.21 -> 5.34             4.4x

With aging_flush set, the estimated hot footprint covers ~82% of the
actual working set size, compared to ~40% without flushing, where the
signal mostly reflects the ambient TLB-refill rate rather than guest
accesses.  kdamond CPU consumption stays approximately 0%, and the
worst-case flush overhead measured is below 0.1%, which is acceptable
for hosts that opt in.

Per Documentation/process/generated-content.rst, this series was
developed with the assistance of an AI coding assistant (Anthropic
Claude, via Claude Code).  The assistant helped draft the code and
changelogs, and performed the rebase of the series from its original
6.17-based development tree onto mm-new, including merge conflict
resolution against recent DAMON changes.  All changes were reviewed by
the human submitter, who takes full responsibility for the
contribution.

The series as posted here was regression-tested on its base commit
with a full x86_64 kernel build (no new W=1 warnings in mm/damon), the
DAMON kunit suite (41/41 passing) and the DAMON selftests (15/15
passing) on a kernel booted with virtme-ng.  Functional validation
(the evaluation above, ftrace verification that the flag switches the
notifier variants, and enable/disable stress testing) was performed by
the submitter on production-like hosts running the 6.17-based backport
of this series.

Krishna Iyer (6):
  mm/damon: move damon_hugetlb_mkold() from vaddr to ops-common
  mm/damon/ops-common: handle hugetlb folios in folio mkold/young rmap
    walkers
  mm/damon/paddr: support hugetlb folios in access monitoring
  mm/damon: support flush-assisted access bit clearing for monitoring
  mm/damon/sysfs: support aging_flush
  mm/damon/stat: support aging_flush

 include/linux/damon.h |   2 +
 mm/damon/core.c       |   2 +
 mm/damon/ops-common.c | 154 ++++++++++++++++++++++++++++++++++++------
 mm/damon/ops-common.h |  18 ++++-
 mm/damon/paddr.c      |  11 +--
 mm/damon/stat.c       |   6 ++
 mm/damon/sysfs.c      |  29 ++++++++
 mm/damon/vaddr.c      |  46 +++----------
 8 files changed, 203 insertions(+), 65 deletions(-)


base-commit: d2aad7fdcda7ae8a726926f2d6de7fe9e8ee7563
-- 
2.54.0

