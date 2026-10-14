Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F916377AAD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002629; cv=none; b=u2LAz3eUzQ2QmTu4XAlXbs5iyYm7P1oYJRK0DvegOHiJl2Ckh03bNyElHvw9J+5u7l2dmVOGLWLMIALlM5k9cXK4ByyisdJAED+h8RE53gg8bC7teiJGnbRB5h6LeRqSVVh1uz2+IsiY+lsfeSW2z5SaJXbl2O3lIL7qw2SZKaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002629; c=relaxed/simple;
	bh=vFJ3fb8ef0/In+7lqyN/b4sWPCkt8vhkCO8ta5s3IK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfX+annR0C/IC/qJEqgTr4etCXmRL5EkxEfXQG3QbZazrxzZ8rv/SylXOLCerSqRcfzYDlftO6Snar+sqDtNiN5lVvowFuEcfcs1pkHDBXGJmI1Gp7j20S5HL/6r6i2wF/ZHR5g9xbPR90qP1xYOIGvIovtGQYWwI2wLaPjGj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GCEDLCHU; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GCEDLCHU"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917d595138fso4612436d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002627; x=1792607427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7xbCPpW/zsnuJwej69E4oG2AFvFJ1oiZH52zWEjges=;
        b=GCEDLCHU70oDIs7Yo476WTUaKjhdOmonqHNKwEhfXBAkbBWs3Aa+yDqSf2Woa2A8Zy
         Gju2nG1j8luMzHNUZltXPA95WLliNlN17S/kOSzsM7MkuJ/kQe1dgB2S7HqSHlNB6ILz
         Q1TwRw8glO67NVEMyhm9Y/jYPoi4/EoxXspK758meEFuJd/QbtJUKtVwMyjykMnJt+V5
         lKl3qL36WtkD1Ps5hJ/h8J9hnOt98pEMJJHW3Jn2CtQn8u6LeC4OWYUKahmqbILDLkMX
         Gi87iuV8ax9OnwWBbIkGdX73fKfGObsSSO3bnwXMEwTHLtpg8dl7bJtj++Q+ttyBQgz2
         OPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002627; x=1792607427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7xbCPpW/zsnuJwej69E4oG2AFvFJ1oiZH52zWEjges=;
        b=rrY6YwKHaStqLfG1TpNW7RGeokUaRVuDvtct9Qg3KRMQOQOTtdwnZx+tbAlB6xdl3D
         74k2DkkiqQQ3GtXydM0utpjQfInnkjbLpnL7FJuSDZ5U0yhqtJaDaFo/iyTPKtmaNXZr
         MyVjC/NsTc32lGcKJZ46jUtA03PzciAAlL8N6GZ3dFOWGZqBd5evGWsabZpwoBlJP02j
         IsLSD7A5WWPH2wfvZJHK7cjH6zkSD9AfQXBWhIQCzsynk+zH3q/yjj153/+pa8F0T6+w
         TPpOWXCPj/v4HsozsL437QRfesrLkuK9UEtJDCp9oinBgOwdMjkavyRoXrx99PjUyDpm
         RW5w==
X-Gm-Message-State: AFq9FYJZHbAVnnFDaz4ij81iAOTl9/dz1TnrWBzN2JmWjC2w2FdnoQTE
	peh6VVOVCuNIGbnbtdaMk5kLk8P3J5FVJiNyMgGYLXI1BGRBimCWRk6IOaDrdtQlW+Y=
X-Gm-Gg: AYBFou19F2oyJvQkzH14ZqHrDqao2VQBA+CcVLNA+CQPdvMQmdr1Qrc3qhgRUip1e+h
	0kffAVupakI3r95kbXmEPlUZWLdQGeVkGmmk4Yb2Jm+HXXGEGEol3OSPYvg2nioM7thUuGkSVh5
	UMfkS4VsRRoRW4mCFMHbgoEQwSQx4csdylNauldjfn5hLmc6hyN9vTGThXQ13hMpphhKu8F0/nk
	nCV98LzWr1oxX8uv7XL8qbpb8ivFM0y0jIOYYwQjaLez4dxZ26u1wfJ9BPwJHjnuUTC9qLdd34E
	Bxu3b2MiVL9Lv1UZjJDrx2qrj+0Ci/9yFNplF+Unf7EIjHqcYxBQuEziCS76a9tyKpakAJ8AnE6
	tDWjz1H8VkEHqwYRUlqe54NhCbOvMIekZwAuFLvrvE8ZYvtIC4qrqCo5F0stzok5JPpltQEw4cm
	JS8oNZfIlnqT29ukppzo/PR+reF3lz7Tf+k3004mrZVz87skrynEnoUSjxg6eOG4FZKLdcSCsyk
	SEUR3Iv9TuvYns8dQF1uc4VMc+/8szKSOaKtVK7rt2lA82nEAQkp+buo9w/Yw==
X-Received: by 2002:a05:620a:bd5:b0:93c:76ca:4260 with SMTP id af79cd13be357-93ebd275afcmr2760169785a.52.1792002627012;
        Wed, 14 Oct 2026 11:30:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:26 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 00/10] mm/madvise: refactor cold and pageout page table walks
Date: Wed, 14 Oct 2026 14:30:14 -0400
Message-ID: <20261014183024.2075709-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD and MADV_PAGEOUT share one page-walk callback that handles
huge PMDs, PTE-mapped large folios, ordinary PTEs, folio splitting and
deferred PAGEOUT reclaim. Its control flow makes page-table lock
ownership and split retries hard to audit.

This series splits the callback along what each part owns, with no
intended change in behavior:

  1-3   rename the callback, share the folio filter and LRU handling,
        and use pmd_is_valid_softleaf()
  4     factor the folio split and release used by both paths
  5-6   separate the huge-PMD path
  7-9   separate PTE-batch processing, the scan under the PTE lock, and
        PTE lock ownership
  10    share the mmu_gather and page-walk setup between madvise_cold()
        and madvise_pageout()

Helpers used only by MADV_COLD and MADV_PAGEOUT take the madvise_lru_
prefix.

Testing was done in a virtme-ng guest with 4 CPUs, two NUMA nodes, a 2G
swap disk, 16 hugetlb pages, THP set to always, CONFIG_DEBUG_VM and
CONFIG_PROVE_LOCKING. Each suite ran three times on the base kernel and
with this series applied, with no warnings in dmesg:

Changes since v1:
- Moved the selftests to their own series.
- rebased on top of latest madvise fixes in mm-new
- Split out patch 4 to simplify a few things.
- Reworked patch 5 (Lorenzo)
   - split now happens in madvise_lru_huge_pmd()
   - patch 5 only factors out the folio lookup and young-bit clears
- Patch 2 has style-only changes:
   - madvise_lru_folio() is no longer inline
   - madvise_lru_folio_is_filtered() gained a comment
   - some minor formatting changes.

v1: https://lore.kernel.org/r/20260922235830.2350770-1-gourry@gourry.net/

Tests:
[0] https://lore.kernel.org/linux-mm/20261014175756.2035176-1-gourry@gourry.net/
[1] https://lore.kernel.org/linux-mm/20260922235830.2350770-2-gourry@gourry.net/

Gregory Price (Meta) (10):
  mm/madvise: name the shared LRU PMD callback
  mm/madvise: factor shared LRU folio handling
  mm/madvise: use the PMD softleaf validity helper
  mm/madvise: factor the cold and pageout folio split
  mm/madvise: factor huge-PMD folio processing
  mm/madvise: separate huge PMDs from the PTE walk
  mm/madvise: separate PTE-batch folio processing
  mm/madvise: separate the PTL-held PTE scan
  mm/madvise: make cold and pageout PTE lock ownership explicit
  mm/madvise: share cold and pageout walk setup

 mm/madvise.c | 473 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 264 insertions(+), 209 deletions(-)

-- 
2.56.0

