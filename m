Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562720;
	b=v1r8rJgbsi9apXz76A65uZoUNoPVW3eMb4x4PjNZOaS5sCPswce2wIPtgTToiJ5LbMjI
	 CFjmmaLns00yibKzAUcRmPIjha+7b4W4HBVoj66me5EMUTwGZG4KPZHZQhpqk5bfbcgUH
	 hX3wVo5nXS7F2af9mNNUz/65ARXXsKgMEGzYiN5wLbULw425h+Dzf52FoKCdEd1zUINVd
	 nSodMYE/py+BxmXudWrXtASlrtjbxvws+yLMeHMz93+4Qg/GaP1Vl5Kepfog5bVi9grFX
	 0Reh/szvNdvGIItOV6KdMkPK8ZFOFdo/1NJDqOd4W9qA5RfP2/sky1mwLUIno8NVN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562720;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fkDeNsEKQP2qp4cRwqP/yX9WA/UKES9gmaTfQ1sp/cg=;
	b=fbJfHJwPhHvM22JPvK+j7r6VowsxivmYTHHDm05pv8SogIwVR5Nb9oirlESNFgT1ashi
	 lz41ItwoZfq3sK4MKymEnJeTy7ur6hJW3rX7ujoD1d6M6UbOOYFuR9Uy+WQ4yIY3AQu+y
	 hKAPCXsf1IgHYGRNUGUfKowtgMrTjrAnQAcwQgxFCb5Q8Mb+XjjmwkLDhBK1Ntr0eO5nQ
	 6YniwJZlCwqZMFDgMUf0KwREzMdKv+hTR/HQScu+YnV3LLdPBYKC5l34SZGP0F2/ZLOAm
	 6xfJz0Nnj/D3T9WWkqPn/kFRbZaFHs0VZVTMMDHqQD3/UY727fKYYZgBfYpa5ppX3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jul8ge9F;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Q+ccSVSd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D27606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D27606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jul8ge9F;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Q+ccSVSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fkDeNsEKQP2qp4cRwqP/yX9WA/UKES9gmaTfQ1sp/cg=;
	b=Jul8ge9FvTN43GH4R8wabaWMccrXkYoeuVdQ+5MMFk68a3y01WLaezjhdE/NpqjuvKnWls
	vcnHymistyZtTWlcCqjRcxVLPJbaeirZx92iCp/NeRFZ5cI/jko9/Bwfy8hSbznW/4So1L
	IEuto7RWg9yPgjDVdzuNhx+MuvClNzs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-KHxbuYHNO-KFT6PYOc4o7g-1; Wed, 21 Oct 2026 06:05:17 +0000
X-MC-Unique: KHxbuYHNO-KFT6PYOc4o7g-1
X-Mimecast-MFC-AGG-ID: KHxbuYHNO-KFT6PYOc4o7g_1792562716
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso310388f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562716; x=1793167516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkDeNsEKQP2qp4cRwqP/yX9WA/UKES9gmaTfQ1sp/cg=;
        b=Q+ccSVSd98V3/wjGQbL5IUqYx+YQ/obHJlc9FGHepCWGwSec26owvA9BptC2kAxp+6
         UgHgPbBBoOxiPkbtBJG+hLjrW5ObBP01wsdv2FMTkA7mf7mFhOUU/3JUsjQkeGtyCdSd
         cUOy97urbB5ZJF6eks8lTA7ufgU28NMPVTjnJUeB6FfU/1DraZq813jOTM8JTJtqXZpT
         MCeAetWBH1hp6NY4Dq7LyjdYN6MmPrRSnx+rmBYfy29EE8QXN6X86YU6Szab5s9tdks1
         NPTVRV/4nZIQctUx58gYMggBPjlHaXA4j9ufmd39yfOHHMJgO4v/uGqYMptW3iNYN4vb
         gwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562716; x=1793167516;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fkDeNsEKQP2qp4cRwqP/yX9WA/UKES9gmaTfQ1sp/cg=;
        b=oTPgZ36uXAqvGJPHaHDw4uj+WK/lQhhHC3CGeRqKzn1tLmZc5Ei79hQ0xv/ijE6XKw
         BPuUst1cOXFabpe96jQZMGgB/s4ASnduodLCOKdvoZXn1F6GZqc/O5fq1OkpxED+7KWO
         YVFq2H1ehjdnkqlyURzDaA37pVNM2CKqc3neiajPsOxxFfA7YmehULOgSokmlXfenswy
         J+4GADbCtz61DVkUrIuDPfRON35/RP/Iq/aa1VzOe95vl3FAm+csSql1iqr2j1zs4Fkz
         5yY+rvmukFRD4EyhjtQ41bl12UW+pTitZRNdrK4FLGOwf+fYi2KVJP8AGkKhgG6AwwMo
         ULMw==
X-Forwarded-Encrypted: i=1; AKwUvBxIxzeCEuo+I/rQJrj4oPMTZHlSwRSYEbipJZxYF4Hx8vq03hdMxTmWI0E9JbW/mb3zQhncDaNJIukXTJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTuEaYc9sIk92fPPsIqp09DF/2tcmqJnrz/u7v3CCRygHb+4i4
	gFm33v7nETxEA/K+K9a3wa8n+To4/XOTEeks+IWKWIG7K2BiO5Q7yk4zTNDgpaNmZmAQ+DvYrRa
	fkkAr5w3ACwyTwR/lo9c/yDXjLquAHoUshjSHaoqkrQgj0jcYVVsLBmdpi0CRNU4S
X-Gm-Gg: AYBFou0hnVXRSKcobqYPGuW1fjUHwABbMlGB4SSOQBR9J/IJHGLxntd/v9NV61B8kMu
	Z3jEuTPBFqBoiQTAakfE7iv4UM4g7rAajnbjHiHNiDG0eUJ2rKqjy73ucpilQcPsPoFoA8FGh7V
	6uGovqxvZIA/VoSXyW8bkNysw5ArnvZyBh8k0voQFr3Vbvtsn++OdM7sO0x8o6+DYAdwAOw8FzE
	Iwbfz2+YPWKtZvhWzjWU5e7Ag782lDDjSn/qs5OKsWchOJl+tBtgOnT1gM1CbnkDQsVmMFr+YbC
	OiEMX1tmNEfYXb735N/2Jj58isDAP2UGgF8MWYKWvj2bg2KuJD3N2NaV4UddY7tceyoJA4ebOCp
	ORiW1KSBFoT+1OtFQjVm3aQTduC29FVFVe52f
X-Received: by 2002:a05:6000:46cc:b0:48e:1b11:7ee5 with SMTP id ffacd0b85a97d-48e264a1fdfmr1118321f8f.11.1792562716025;
        Tue, 20 Oct 2026 23:05:16 -0700 (PDT)
X-Received: by 2002:a05:6000:46cc:b0:48e:1b11:7ee5 with SMTP id ffacd0b85a97d-48e264a1fdfmr1118280f8f.11.1792562715531;
        Tue, 20 Oct 2026 23:05:15 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:14 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 00/12] migrate on fault for device pages
Date: Wed, 21 Oct 2026 09:04:54 +0300
Message-ID: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Currently, the way device page faulting and migration works
is not optimal, if you want to do both fault handling and
migration at once.

Being able to migrate not present pages (or pages mapped with incorrect
permissions, eg. COW) to the GPU requires doing either of the
following sequences:

1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
2. migrate_vma_*() - migrate the pages

Or:

1. migrate_vma_*() - migrate present pages
2. If non-present pages detected by migrate_vma_*():
   a) call hmm_range_fault() to fault pages in
   b) call migrate_vma_*() again to migrate now present pages

The problem with the first sequence is that you always have to do two
page walks even when most of the time the pages are present or zero page
mappings so the common case takes a performance hit.

The second sequence is better for the common case, but far worse if
pages aren't present because now you have to walk the page tables three
times (once to find the page is not present, once so hmm_range_fault()
can find a non-present page to fault in and once again to setup the
migration). It is also tricky to code correctly. One page table walk
could costs over 1000 cpu cycles on X86-64, which is a significant hit.

We should be able to walk the page table once, faulting
pages in as required and replacing them with migration entries if
requested.

Add a new flag to HMM APIs, HMM_PFN_REQ_MIGRATE,
which tells to prepare for migration also during fault handling.
For the migrate_vma_setup() call paths, new flags, MIGRATE_VMA_FAULT,
and MIGRATE_VMA_WRITE are added to tell to add fault handling to migrate.

An extra benefit of migrating with hmm_range_fault() path
is the migrate_vma.vma gets populated, so no need to
retrieve that separataly.

This series avoids the problems in current collecting implementation,
where racing MADV_DONTNEED could make the collecting arrays overflow.
This is achieved mainly by having a rollback mechanism and
populating the collecting array as the last step.

Tested in X86-64 VM with HMM test device, passing the selftests.
The migrate throughput tests from the selftests show similar numbers
(within error margin) as an unmodified kernel, verifying not
regressing with current workloads.

For nouveau migrate-on-fault test harness was : Fedora 44,
Mesa Rusticl, and a fine-grained-system-SVM OpenCL program.
Nouveau SVM is opt-in via Mesa. The OpenCL program passes a plain
malloc pointer (64 pages, array of integers) to the GPU. Increments
each element on GPU, and verifies on the CPU the result. So it drives
both directions of migration. With svm_migrate_on_fault=1, no
migration at bind happens so it's full lazy. The GPU used in testing
was Pascal generation GP102 (selected based on what nouveau
supports for SVM).

Tested also rebased on the
"Remove device private pages from physical address space" series:
https://lore.kernel.org/linux-mm/20260130111050.53670-1-jniethe@nvidia.com/
plus a small patch to adjust with no problems.

Changes in v16:
  - rebased to 7.3.0 (drm-tip)
  - addressed sashiko's concerns
  - added patch 12 - drm/nouveau/svm: add support for migrate on fault

Sashiko's concerns :
https://sashiko.dev/#/patchset/20260924065313.899730-1-mpenttil%40redhat.com

patch 01 mm/Kconfig: changes for migrate on fault for device pages
  Q  "Does selecting HMM_MIRROR under DEVICE_MIGRATION require an explicit
  dependency on MMU?"  
  A   A DEVICE_MIGRATION is def_bool MIGRATION && ZONE_DEVICE,  and MIGRATION depends on MMU,
  which HMM_MIRROR also depends on. DEVICE_MIGRATION is not user selectable, and nothing
  selects it explicitly now. If some config would select it in the future, it should have MMU.

patch 03 mm/hmm: preparations for HMM to participate in migration
  Q  "This is not a bug, but could we add MIGRATE_VMA_SELECT_NONE to this enum
  under CONFIG_MIGRATION?"
  A  Yes, added.

patch 05 mm/hmm: migrate collection in HMM pagewalk - pte level
  Q  "Can this cause a livelock when splitting the folio?"
  A  the ref is taken under ptl before dropping it (no UAF), and the split either succeeds
  (progress) or fails -> HMM_PFN_ERROR + return 0 (termination). No unbounded retry,
  no livelock. The -EAGAIN -> goto again path only re-walks when state actually changed.
  Q  "Does this code operate on uninitialized folio metadata if a driver maps an
  uninitialized compound page to userspace?"
  A  The folio is either from vm_normal_page(), or a device private/coherent page
  and properly initialized so no.
  Q "Can a transient split failure result in valid pages being falsely marked as
  inaccessible?"
  A  a split failure reports HMM_PFN_ERROR for that walk only; the consumer can re-fault
  and a later split can succeed. The page isn't lost or permanently marked.

patch 06 mm/hmm: migrate collection in HMM pagewalk - pmd level
  Q "Can this lead to a use-after-free on an unlocked tail page?"
  A  For that branch, it has to be fault folio. fault_page (of fault folio)
  is always device-private -> the tail new_fault_folio is a ZONE_DEVICE
  page, which reclaim never scans. So not possible.

patch 08 mm/hmm: implement rollback for device page migration in HMM pagewalk
  Q "Will hmm_pfn_rollback_collected() destroy the user's per-PFN request flags?"
  A migration is entirely driven by default_flags, and (HMM_PFN_VALID|HMM_PFN_MIGRATE)
  is used as a sentinel for already pinned and migrate collected pfns. The sentinel
  is safe to be erased from per pfn flags.
  Q "Can this regression lead to memory corruption via an uninitialized PFN
  unlock/put?"
  A  "rollback only unlocks/puts entries carrying the (HMM_PFN_VALID|HMM_PFN_MIGRATE) sentinel
  ,i.e. ones actually collected (locked+ref'd), so no uninitialized pfn is ever unlocked or put
  Q "Is there an infinite loop in hmm_range_fault_locked() when a THP split fails?"
  A yes, fixed in v16. A split failure now fills HMM_PFN_ERROR and returns 0 instead of -EBUSY
  
patch 10 lib/test_hmm: add a new testcase for the migrate on fault
  Q "Will skipping the device page table update here create an inconsistent state
  that migrate_vma_finalize() permanently commits? (in case parallel unmap)"
  A Concurrent unmap is fine. In that case migrate_vma_finalize() frees dst pages,
  and retry migrates on next round. So no ping-pong, it is self-healing.

Link to v15: https://lore.kernel.org/linux-mm/20260924065313.899730-1-mpenttil@redhat.com/

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>

Mika Penttilä (12):
  mm/Kconfig: changes for migrate on fault for device pages
  mm: add helper to convert HMM pfn to migrate pfn
  mm/hmm: preparations for HMM to participate in migration
  mm/hmm: do the plumbing for HMM to participate in migration
  mm/hmm: migrate collection in HMM pagewalk - pte level
  mm/hmm: migrate collection in HMM pagewalk - pmd level
  mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
  mm/hmm: implement rollback for device page migration in HMM pagewalk
  mm: enable device page migration from HMM pagewalk
  lib/test_hmm: add a new testcase for the migrate on fault
  Documentation/mm/hmm: document migration through hmm_range_fault()
  drm/nouveau/svm: add support for migrate on fault

 Documentation/mm/hmm.rst               |  39 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 281 +++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.h |  12 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  | 141 ++--
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   5 +
 include/linux/hmm.h                    |  51 +-
 include/linux/migrate.h                |  59 +-
 lib/test_hmm.c                         | 174 ++++-
 lib/test_hmm_uapi.h                    |  21 +-
 mm/Kconfig                             |   1 +
 mm/hmm.c                               | 959 +++++++++++++++++++++++--
 mm/migrate_device.c                    | 617 +++-------------
 tools/testing/selftests/mm/hmm-tests.c |  54 ++
 13 files changed, 1740 insertions(+), 674 deletions(-)

drm-tip
base-commit: b0311e0de50840c3f35aafa2e95c14bf38f4a767
-- 
2.55.0

