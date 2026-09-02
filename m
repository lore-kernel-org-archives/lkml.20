Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BB310645
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317825; cv=none; b=k/8yWbXPPbMJmyEGH6sYHXjjY13rgnh+Y7yYAa0Hr+m0vWFZW7ekSMA0H+CB49coFWhBifaiBVNPk0XSt593X86glLQMntBCfLmdZZmiG4nfLBw5mfjhzsNNUcGGQL6Lvlu9n5XZlDN4PuJ91WgFPfzZh14qdgMgl9zI8HhUckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317825; c=relaxed/simple;
	bh=yXeP+IrkC+M1kcWMvk/TdYUd0rSIMeVwVvnPZwEW+7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5VQkWP/z3BsitVYIXVgYNtFUMKjQojatXBLcsnhoM3R855pgHruSBP13GzN/1UGOU6CikAX5RhebfQJE8qTzwvuXkLZtaWWLITMtbzu3nw+O+sOzrjbBSG3AQ37RilyEn9Al3I4LyPTi2CEMotssE9ykKZDK5a5ZPwOPMQXJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=XbaiNfBt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="XbaiNfBt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-853c401326eso343429b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788317823; x=1788922623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wx9bliagn1IBSjTmGC+tUrKPBAFTwTk7ga02r1H6dmk=;
        b=XbaiNfBtFHGwRQCXvUOoheeL9kBncIvjb2VJS0GwbA+xX0OiTW3kwlG9UixjW0PELf
         Gg828PiSWojuhQ5lwPuYFuG7SyDUaNExPyrqtgC164krEWG89iVbzwZCY1CJDya7qvAE
         5PK2t2EnvgB25Hqx6WF3k/baZw5pn5AhohppLl4fKn+SIDYXdZIgOe6/ol28jForOypR
         lTQEPOw0b94IFMPh24LrrPwlLR5xL2DYicOa+hTipcQoiuc/jXDVbJuBHlIZ/2dPjrFk
         T4e1UTlzGcHCta7tXlr5ccUwkzCDPHfErxkKPK9vwO5y5j8DGROAHOmbyiJXGb78+hbD
         FBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788317823; x=1788922623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx9bliagn1IBSjTmGC+tUrKPBAFTwTk7ga02r1H6dmk=;
        b=Jy1Z8K2P7EibD8NUARVBLexvs+7+JUuqNeR4Zr0LNQnFZma8zrWsz3IyWrm+QfKK69
         3ejt3GdwBLGiq2554D1Ejn0gBRUJOpk0rBkVD+ZEaWWSUTm12RrqbgQCbd6xuslcPdTC
         kJrWW2LR0MTma0N6ocVHHMLzMMhY9oNpy6KURkHaVUcxfNJhgBisRtNyTirggdap6cfc
         yzaqtcUN16IaItzuZVxRvP/fEdFqCjK502Q1eDM9FfE6zA6AG/Zvq/SWspSLZq48yiLF
         jWOrwQ2VKmkOhRX5qvu2snhkuMSNH7Pr3bJZK7Z5WMXhE3jekOn2+BkBCzgffTdBurX0
         QAnw==
X-Forwarded-Encrypted: i=1; AHgh+RqQCUHEl/bvianDo5Qdpb6xKqhvlCzwg9qkOyx0NnRwG534mlHEos8OfnGbDOXXUj6zs5Bi4vyqHuCXdK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqRXVfjz2p/cA5lUgBUaKCXWL4VHBnyfi/T60lgyjkAFRsFj3K
	mAxEG9krTx/UmpOKYxu5t2fwSyAXnP2LfMxqj8UP4ojyBA0sNe834z6a0JWATjza8WBGMzHuSjL
	sI3j9yg0=
X-Gm-Gg: AR+sD11wQ1vq66shRAjeKXsbTTEISABY6bH5f2GF1IGVvRCieec4nVpzS3i5H7QKm1M
	pSEedukEEtxBAUvTKQCxoejNDAc2blxbizBVj8pMAur6vtZvNMd6iRTwm1/YfCVYCEJv92aguJ5
	hLpmI3NEV52RKaKdAFkXOpAbiIuQkvD1gwkoSC+lI+EoJ0Uj57D80LBKMwHslYLMXwmlAv/2B79
	x2PGQZ4aW0LHXWC6IK3eaMB804gRgZWFfTilANg7VnjJQGvoXVfAN7GetH8K+kLfrEm27uFRtUz
	tpGof82dmNi5UPlKmpvzVGQTz5p5xB5PgiATzcsZXZ7goZGpYD+zfqTfYIOalJK5A4aUCAcpp+h
	9qz/pRwNs831Yfc9NpOy/r6KF6X6Otv9BL9hMptY4x6fgwS9JrlEsVQzVJla96L3xJJaTI20mFd
	up0iid1gmxx14cu+iquJLTFNA1fgVjSrKCQ9MkjilWGVWRbrj6IGU351WfJs4npNk1MK5beTEPn
	4cD3egq9dRNN7m+gEXT1hDeUpLUSNzyvJsp
X-Received: by 2002:a05:6a21:3995:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3d9ad570683mr3116323637.5.1788317823327;
        Tue, 01 Sep 2026 19:57:03 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:a1c2:77c:7ab7:f9a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bde5bfsm2066469eec.27.2026.09.01.19.57.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 19:57:02 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] mm/damon: support access monitoring of hugetlb-backed memory
Date: Tue,  1 Sep 2026 19:56:57 -0700
Message-ID: <20260902025700.17975-1-kiyer@crusoe.ai>
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
monitoring is blind to such memory: every access check starts at
damon_get_folio(), which rejects folios that are not on the LRU lists,
and hugetlb folios are managed outside of the LRU by design.  As a
result, all hugetlb-backed memory is silently reported as never
accessed.  In testing on a 1 TiB host, an hour of 4-thread random
access over 842 GiB inside a guest was statistically indistinguishable
from an idle host.

The first patch moves damon_hugetlb_mkold() from vaddr to ops-common
as a preparation.  The second patch teaches the folio mkold/young rmap
walkers to handle hugetlb folios, aging the huge PTE and notifying
secondary MMUs across the whole huge page size; the secondary MMU
notification is what surfaces guest-side (e.g., KVM/EPT) accessed
bits.  The third patch adds damon_get_monitor_folio() and uses it from
the paddr monitoring primitives only.  DAMOS action appliers such as
DAMON_RECLAIM and DAMON_LRU_SORT keep the LRU-only lookup and are
behaviorally unchanged.

This series is the first half of an earlier six-patch series [1],
split out as SJ suggested [2].  The second half (the 'aging_flush'
TLB-flush-assisted aging) is deferred: we will gather more
quantitative data on the gap it addresses, including the workload-side
impact of the flushes and the working set measurement details SJ asked
about, and post it separately once the data is in hand, aligned with
the ongoing monitoring preparation actions work.

Per Documentation/process/generated-content.rst, this series was
developed with the assistance of an AI coding assistant (Anthropic
Claude, via Claude Code).  The assistant helped draft the code and
changelogs, and applied the v1 review feedback.  All changes were
reviewed by the human submitter, who takes full responsibility for the
contribution.

The series as posted here was regression-tested on its base commit
with a full x86_64 kernel build (no W=1 warnings in mm/damon), the
DAMON kunit suite (41/41 passing) and the DAMON selftests (15/15
passing) on a kernel booted with virtme-ng.

Changes from v1
(https://lore.kernel.org/20260830051407.50008-1-kiyer@crusoe.ai)
- Split the first three patches out as their own series, deferring the
  aging_flush patches (old patches 4-6) until more quantitative data
  is gathered (SJ Park)
- Drop too verbose comments on the hugetlb branches of the rmap
  walkers (SJ Park)
- Factor the non-hugetlb PTE young check out into damon_pte_young()
  to reduce indentation (SJ Park)
- Rename damon_get_folio_incl_hugetlb() to damon_get_monitor_folio()
  and damon_folio_observable(folio, incl_hugetlb) to
  damon_folio_acceptable(folio, monitor) (SJ Park)
- Drop 'kernel' from the host-side monitoring example in the patch 3
  changelog, since kernel memory is not LRU-managed and hence not
  monitorable regardless (SJ Park)
- Add SJ's Reviewed-by to patch 1

[1] https://lore.kernel.org/20260830051407.50008-1-kiyer@crusoe.ai
[2] https://lore.kernel.org/20260830180411.103772-1-sj@kernel.org

Krishna Iyer (3):
  mm/damon: move damon_hugetlb_mkold() from vaddr to ops-common
  mm/damon/ops-common: handle hugetlb folios in folio mkold/young rmap
    walkers
  mm/damon/paddr: support hugetlb folios in access monitoring

 mm/damon/ops-common.c | 122 +++++++++++++++++++++++++++++++++++-------
 mm/damon/ops-common.h |  10 ++++
 mm/damon/paddr.c      |   4 +-
 mm/damon/vaddr.c      |  27 ----------
 4 files changed, 116 insertions(+), 47 deletions(-)


base-commit: d2aad7fdcda7ae8a726926f2d6de7fe9e8ee7563
-- 
2.54.0

