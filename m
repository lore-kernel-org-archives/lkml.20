Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AEF472F86
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767333; cv=none; b=X393iPsn7giyPlLMpLm0HfHfjXAuj3HnUaWQ5XQtiFUBTMOaoSE5ERQM17z1oGG6IacEaVXjnEWGxpzPiP2LktIy4FHRAebVlNl1BRpQCu0/+Mm9yLPFQAOpklzuJnlpMnwBl4fsR+5/UFhZvrvGlD/GYY1AXbFt1ufoUPXVGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767333; c=relaxed/simple;
	bh=Ys626X0xpj18gw+zLzTqHp7gwBBt717dJCTxALN+Zr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqkfSuTZoSe2Qo0O9LfjWf8m+gHpt34O8awx4cPHjRDo0190Y9879zsA1LNCkjodOacmnFnmCx2yN4MzCZ023VPH0JtLRHdCJQTyxAmQZVxw1j7OreJW238V/T1n5p4QcGVUtVGxEUM5SdB+9IlSxY6RppZYpP5HOgv+lhv7+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DF2/5yjy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DF2/5yjy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so29397615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790767329; x=1791372129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zLOBQ3G5BdHBovG0b3C1voW7d9ugxt/+vc04TfSY6A=;
        b=DF2/5yjydgxQPHgsdPUTGX5N4H6qt6ImCeL4zKFxGIxbJRHA/8rJmQCGTa8PphqZ3O
         Dp2J/2T8q31Pxd22DCcr7hIzomvIT8E2k3ueWPiIn/m19TJ47nON16Aq2qol4aMHPkwx
         asqIPSftxW4dMX3JzpJgQd2nJsURvwsroOLSQlt0rWlML5pGTF3uoB5vU+AZzZ551IZv
         ByKv24JQXgdTrNc24/1exGJaCWDzu23JFpd6NYe7wK6ie/Z4QNCDRdCO7BMv4o/JLivw
         Q8cKtEzttVE5PJHZ+lj95sxWKjPtLA5AZ3Ecm6zjEEcy4AFwzHlMnU1aEEIBLnopu3u4
         Q6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767330; x=1791372130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zLOBQ3G5BdHBovG0b3C1voW7d9ugxt/+vc04TfSY6A=;
        b=WbVoNL/z/I49W1Uqe59TiwmUqh+fTNdxbjDng6lN+iw6qMUeXL559u3+cv5G6mNDxF
         invVVksuXKL0/xLhkp6rjOweyhrfSiSKw8/Mx5upZnRagdlRz93p3zyelEmX5KZvAa1C
         qoSPpmJ2yXxt9Vl2sUt+NedG8scOj1JPvlRimgkmlRTtgsPLZXmN/8NCxTESNSC4C5l9
         9NSD3ARjDClH4dH4j7eJQzCGpLj8XcmVsaWoClGeAdjKc3b3WbhJc1wII87/TWBm5fDM
         2Kix6M/BFHTquncatIOOgDr/plsOjkHDLrJ3ibu2CVvpZg44r5cs/lm9PWql1r+Cqren
         CIJw==
X-Gm-Message-State: AFuF++mIZ+Nkkri1csXjW6mfv2YBoPp4xTwIZwlvx7ynHmk+VGOStFOR
	oOYxb2Vgas9CctzKCpUFfOz0rvOMgtD7If1zokDpVx9RcrdsuW/AQFnEi76D3KaBGE4=
X-Gm-Gg: AYBFou2IY6U1PDILN/ZVzxxQRCcKv7xUvV4dzFhuJ1FNMdh7wZ/pJL5k58cLVu+QC5U
	GgPzvrS59XlDnawkRIVPvIlP8XdzWOn7AbXklZ+2jom+tXxwBpThmGJaXVs1X7l4Q/WOue6fLq4
	1uyYn+Cao82Ylyjxfz68nm2Lmo8Q2EPX3GzMnSV/alndZHc03bBIFxI/tCqFL7ZbRcyc5lV+jdb
	SVLm4GrIt/nza9g+ISnOlZh1krTIC5Xxe2+43pEk6x54FRoTNNrgYE9cSuxerEbDZVMMfGvwkWF
	KCJHgZH46QOCPJf7nJ33diWhXObV2VuAa25xfE76YUgOu7295ipZ7LYZIGgCBwZn+/i9Wvb7u2f
	YHyl43X4Gxjm1xzMKvfbs4ENs/AiOrSQRcrFmnw1qE/eW4L6wvrEdeGmExtuJLlCUnMLXoQSkRi
	RFC0yOa6Dsxo4l5Q2B7iMyjKfaHOpUb2ozzkkVsV+gy4l7iir59vX3K22ScIrnFetim89qPNyRC
	m9QQaIOxqnM+8l/
X-Received: by 2002:a05:600d:82e1:b0:4a0:313:3a12 with SMTP id 5b1f17b1804b1-4a01b1162d3mr20334555e9.20.1790767329415;
        Wed, 30 Sep 2026 04:22:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a019740c34sm34097095e9.9.2026.09.30.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:22:08 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	osalvador@suse.de,
	raghavendra.kt@amd.com
Subject: [PATCH v4 0/7] sched/numa: stop VMA scan filters from gating promotion
Date: Wed, 30 Sep 2026 07:21:59 -0400
Message-ID: <20260930112206.205083-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NUMA balancing uses hinting faults for both task placement and
memory-tier promotion. Several filters designed to avoid unproductive
socket-placement faults also prevent promotion.

In a production deployment using kernel.numa_balancing=2 on a host
with 768 GB of DRAM and 256 GB of CXL memory running two ~430 GB
database workloads with large shmem VMAs - we discovered poor NUMA
balancing behavior:

Before patch series:
  - 150-200 GB/s DRAM bandwidth
  - 40-45 GB/s CXL bandwidth, saturating the device
  - request latency above 5 ms with longer tails

After patch series:
  - 250+ GB/s sustained DRAM bandwidth
  - approximately 5-10 GB/s sustained CXL bandwidth
  - request latency between 800 us and 2 ms

The core issue is that the global balancing mode says which mechanisms
are enabled, but it cannot describe the intent of an individual
VMA/PTE walk (placement vs promotion).

This plumbs the scan reasoning into the prot_none injection while
retaining the placement-scan filtering.

Patches 1-5 form the backportable fix set:

  1. Add promotion-only NUMA protection walks and derive private VMA
     state in the folio eligibility check.
  2. Permit eligible shared folios to be promoted to a fast tier and
     rename the promotion predicate to folio_numab_promotable().
  3. Scan mappings covered by the legacy file placement filter using
     promotion-only scans.
  4. Separate VMA placement eligibility from partial-scan continuation.
  5. Scan PID-inactive VMAs for promotion and account for placement scans
     separately.

Patches 4 and 5 are technically part of the same fix, but are separated
to make it easier to review - they must be backported together.

Patches 6-7 are independently requested cleanups.

  6. Use BIT() for the change_protection() flags.
  7. Use the VMA flag API in the touched NUMA-balancing code.

Changes in v4:
  - 1/7: commit message fix (David).
         Hoist balancing mode check into variables.
  - 2/7: Rename folio_in_lowtier() to folio_numab_promotable()
         Typo fix.
  - 3/7: Compute placement_scan once per VMA.
         Avoid complex boolean logic (David)
         Fix indentation (David).
  - 4/7: Avoid complex boolean logic (David)
         Store the in-progress state as numab_state->promo_only.
  - 5/7: Avoid complex boolean logic (David).
         Fix "sticky bit" issue where resumed scans would cause
         valid VMAs to drop out of the scanning-eligible set.

v3: https://lore.kernel.org/r/20260922182928.2199090-1-gourry@gourry.net

Gregory Price (Meta) (7):
  mm: support promotion-only NUMA hinting scans
  mm: allow shared folios to be promoted to a fast tier
  sched/numa: scan read-only file mappings in tiering mode
  sched/numa: separate VMA placement from scan continuation
  sched/numa: scan PID-inactive VMAs for promotion
  mm: use BIT() for change_protection() flags
  mm: use VMA flag helpers in NUMA balancing

 include/linux/mm.h       |  23 +++++----
 include/linux/mm_types.h |  13 +++++
 kernel/sched/fair.c      | 100 ++++++++++++++++++++++++++++-----------
 mm/huge_memory.c         |   3 +-
 mm/internal.h            |   6 +--
 mm/memory-tiers.c        |   9 ++--
 mm/memory.c              |   2 +-
 mm/mempolicy.c           |  37 ++++++++-------
 mm/migrate.c             |  13 +++--
 mm/mprotect.c            |   7 +--
 10 files changed, 140 insertions(+), 73 deletions(-)

-- 
2.55.0

