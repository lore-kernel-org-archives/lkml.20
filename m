Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85845A2AC
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761272; cv=none; b=QpuHrLHwzMvGbB+1dAiNwLjm//Yl/6AukYJ/Lgv1fwTJu/u0GLS/GkuTF2pKoSiuffIwqs6t3b5EqN9anNKYwxHEv0ij5fjffLdoXm7L2qkCVd2Zu8YBPailDIHVnIBmuPcuATVeEv7LQCusBL0zoFkC6Iwe8a2AjikI9YXE1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761272; c=relaxed/simple;
	bh=RJDz6aDclDiQoJa+oKhdqwrMwtODSN8HXtmy+Jt20Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKvbZQT/3XmCVqqRrmG4F7tgHCDNIBiEnoc3m4PfsNTx3k+f/3jlwRq+DFq7NjscJk95tesrlomB+c1sTd7AsPYVMRn6BbWgYrNOs728qg+Cqyw0YCK/oWRl8IC6OvvADswhyAkeA+l2Bagx/yTyAPW6ynzYMavb8utqShhr6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=SjZsZs02; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l0s9+cLU; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="SjZsZs02";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l0s9+cLU"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1CD391400192;
	Wed, 26 Aug 2026 12:21:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 26 Aug 2026 12:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1787761267; x=1787847667; bh=j+6mmJQV8M
	KheyA1Tiyd0okJyHRYrBha/y7uF4qkZ9c=; b=SjZsZs02x4SYnkC+nDbn534D33
	h2dkZGuJ95BntL97oM5ugPdFHFsUqFaznWFEvEpgyX0mqs1M3w/10rR6tJHaWFh+
	Vws51Oy+LQWw15Iby2iut9kmO67G/Gcq8sVr1xFE8+ZT72O8QyhblsQKNgqEcVEg
	eMX06UUw8rfnu6zIugOL0y7YfdRP8zaswhv1CkYr5gYvaFzEtRyHsYz4TbcFhmYk
	8ubajzTKyNalBqGgktLzElsRz8+uEOl470dj4B8zQC2VCwhduM4lQjjMY+4a0dyr
	JJEnpb0xtlndCHfyCMLLVa9elELGW0NidRamjsvHP1IJXd6xU4bfPzMmb3dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787761267; x=1787847667; bh=j+6mmJQV8MKheyA1Tiyd0okJyHRYrBha/y7
	uF4qkZ9c=; b=l0s9+cLUzVIbhslQjTuRObWJpMg15HTrZJawbXPDojdxqMNlzcr
	ax+L0vuowgZ4r2FmXlvHa0x1dRs7pLFd2OUccNNq+QLTmFNkKFmgyw/CQPZsYIPp
	Vu9+2fUoWYMFkQDgnwLhtelZ+hoZI73D2yzp4lRplKY7vmyeVJK3TResxoG92Cbq
	Wy3zvbBwGFL8Zes5/B1deb0kWxkI6Ap5ofvaQZql9nwJCQKjSo8/Y1vycVnDX5HL
	NSrY0TVPTZhVbSugpDpg9RVb7jzkGAtr/52ip+yejFC+7jk6tFWabwWLh8vlI31D
	D/BJ3EyesPklm+PTE9233E7XOFYqso0CzXA==
X-ME-Sender: <xms:cRKPagsdikrLixsX9PmTOgpasazeuD74ej2-kgOUFnw3qodJn6BhDQ>
    <xme:cRKPapb-TmxX5Jeu26Y9BaOoHEtdEeNFBiRu1R87Ork7c56PYxiS0iOZICKhmqJIZ
    XZEfu7ABTnsSQa5YWNg3rJzXO0woGmvIY6rHQyPR64Pum9mak2nW8Y>
X-ME-Received: <xmr:cRKPah7Ghp8rq7jHQQtVjm0rrqTfLT_YVirWmHwtANsbLfQ-me6S-9Yb1FY>
X-ME-Proxy-Cause: dmFkZTGdDRZOmCQhCp3v7Z4DXYRb7jaytuKsqhJJ+i6wDChkAgllaSm2c6/LznZNVrhuZZ
    DxABY3gbSNrfSJQ8iT3kMENZkvvkLhwKvasQHxWKW9f7+6U1ciLUnxkkLGR4lJY8DToqve
    nQAd1Pwzx8Q3e3f1jMOjm9izuZD0xrMia/Xd//1C/SzMgaFmQ/f+3xj8O9m7UCbMRfpA32
    xNoFeOKVehYNB1PUY2RDqcnq5sTA8HESoP6+LU+rfu66zy4u4d2Hd25BimN9k8yq6Y0GRU
    rv/CUjbCmRsFYNTmMC+EFy6SemdOsOo7KqMofNzNAak4gK8H0LY9U1zwKpdK3TtWR5bjh6
    FYu9GHd6ArxlHNyQoAC74cn0vu3VIFRz3z20rCOItcieV46yI8HjaZFT41O11JikmLe8ng
    4oz5/wlufrTbK5y93u6z3rDz25LahNobyrAqGaQqOc4NF9ylr/9DvbjkZtTqvitQj53x05
    BRzvqpur/UoRoz8HCycKzZe6sc7qLeTvrSr4xo9ZcmPMxQ8iJGyFXT2lmyOpqR05bfTfoT
    2dX5DqrGxStebT3pR3UpaYQRz1DH1cvAHDfEyfjTk/HEb1xf3/UXK0SelqRBRXg1/Z4kpc
    HSb5goz9pruaO+Y7uLVmst4T8KhcRyaE0QIig/0AzcnPM7dq4/LL//AimCGw
X-ME-Proxy: <xmx:cRKPapknr8xImVVLs50yC1EXoiKkQwWnhLPUZZAT4qNnJpSwqpF1uw>
    <xmx:cRKPavEE87_RkDzvi5FuVnZmxWPLrgiC6RUNNLPH9JQTRPYGrJFs3g>
    <xmx:cRKPalE8PjqPaWwV_SgoX0rguqDoydBLgY6BrDE120ABKNnE7gRpRg>
    <xmx:cRKPav2T-9nr0J1k84bwih18GqsIgtkX-sdLTSDOjLDVPV680i2qwA>
    <xmx:cxKPat2eOI4DsoEQm227vIA0N3MtKtLA5_n_0UjQp2jK9_pKIG4_eN5K>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:05 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 0/5] Fix deferred_split_isolate() and clean up __folio_freeze_and_split_unmapped()
Date: Wed, 26 Aug 2026 17:20:56 +0100
Message-ID: <20260826162101.1314941-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

deferred_split_isolate() probes each queued folio with folio_try_get().
folio_try_get() failure is treated as a lost race with folio_put().

It leads to wrong results when !folio_try_get() was not caused by
folio_put(): for a frozen folio, PG_partially_mapped gets wrongfully
cleared and the folio dropped from the queue.

It came up in the review of my collapse RFC series:

  https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/

The bug is inert in upstream code:

  - __folio_split() works around it;
  - __folio_migrate_mapping() freezes a folio it is about to replace;
  - reclaim freezes only what try_to_unmap() already unmapped.

No stable@ needed. But my collapse rework steps on it, so it is worth
fixing.

The first patch fixes deferred_split_isolate().

The second patch removes the workaround for this deferred_split_isolate()
behaviour from __folio_freeze_and_split_unmapped().

The other three patches are trivial cleanups in
__folio_freeze_and_split_unmapped() that I stumbled on while looking at
it.

Tested in a VM: split_huge_page_test, folio_split_race_test and cow pass.

Also ran a test that leaves 16 partially mapped THPs on the deferred split
queue and drives thp-deferred_split through debugfs, checking
nr_anon_partially_mapped.

Kiryl Shutsemau (Meta) (5):
  mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
  mm/huge_memory: dequeue the deferred split after the split freeze
  mm/huge_memory: reduce indent level in
    __folio_freeze_and_split_unmapped()
  mm/huge_memory: fold nested ifs in __folio_freeze_and_split_unmapped()
  mm/huge_memory: turn the swapcache-with-mapping error case into an
    assert

 mm/huge_memory.c | 260 ++++++++++++++++++++---------------------------
 1 file changed, 109 insertions(+), 151 deletions(-)


base-commit: 33f61b12d297562321533c048e034b1fb21c1cf3
-- 
2.54.0

