Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D47485503
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055284; cv=none; b=smYnbmWOixqfJnDu7OPpM2iOrX1uxf4BUIk3t7r6tdKPoYrUK6OrFDiIsi2pC6JKqGbZ9H+4J7+DdLx+DbB7p9QaoEOWIkdfgpn+HksAKD7ilIWPIcf4tBVZL/kkDAuAFn98jpUbvDAWygaKl7K+Cx5V1vIhvzpMRgNmhV8wmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055284; c=relaxed/simple;
	bh=E3kVkH3ESzf29lfj8EoUtDFwjccbTVBk+JDxedi2LSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CCh9t/aiG27/Jn6J1XSMH5NTucZ0G/nG9pZE14d4DqvqQeBVlLXZ2EpkgwwIuLklGOBdPrehpVadqyUiCY+J61SBwCXhQnhbXVBousj+0+rxgTx46ProbwgWUbqg7JD5ybNnG8kbLDWrEjU9VUo98SvU4MyEGcmypGkWCoDe1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+Xn5T0J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2eo56Bl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+Xn5T0J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2eo56Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ExYdezdvpHVo92DuelngyydogrRLZoYOU57jNd3LbOI=;
	b=X+Xn5T0JNiVq1508pdUq9oKyLH3X/VUDC8PeumratnR/fhWq18jX8VhlUoJAeElRxd1yUH
	KSsOJ7sjpTFgmPhhmJdyHOOMffeo/lwDtJ+w9kk9gc8B79sknC1yJX3DppYlieazjt+ofw
	d7uafXcIXgLwefJh+rFBBDXMTCJ8Z8Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-l9XX4bBON1SNZil5HUQIRw-1; Tue, 22 Sep 2026 01:34:40 -0400
X-MC-Unique: l9XX4bBON1SNZil5HUQIRw-1
X-Mimecast-MFC-AGG-ID: l9XX4bBON1SNZil5HUQIRw_1790055279
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b75a9f9199so1964989e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055279; x=1790660079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExYdezdvpHVo92DuelngyydogrRLZoYOU57jNd3LbOI=;
        b=U2eo56Blu+n5QMYnm5LX6F5kL9DqR7q9SeqvFgvLWjFG1IOrzzcENk/dDBAoELSjxp
         L04aLXgrzjxdk181EbRoNJ2dgV+QJVtf5Yxp9O03mnB04UB8yB863ziuOjHmOZ4Vv2xV
         gocavKbQCCMOEYnESRDZs1XIddoodFdVfwJsoIAELACBpf0PsfzVu4syHxLTLU1ObJr0
         JfTy1iUZ0OPKCNtLHEWUb2bYit3cVsViGn/e5rDQ3MlCj9DlIdSFVwrk1tZDJ+ZymIVN
         sZePnmz0i3QQ57nfcdymE+FnH02HArPNF/kC4KewmrlAVVme/266alsk2Y/k1wuHIP8S
         iDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055279; x=1790660079;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExYdezdvpHVo92DuelngyydogrRLZoYOU57jNd3LbOI=;
        b=QmcyCb7umg1fltUbBIG6GCygUV7Zj5Sfet6rSOgspQxrUPysZkdNAeXwWDXvzNDpjV
         J0jtNLKlDcGUm/DgeAuVAUPaISee7SouO49Th8CGWIE4lDkjvV6c1MyJz33GXcqpEvqc
         xm06sKmAmzklw6JnGf34o4QCALAHeXB6DMuxDdbeSUfrDdhQ2bW3W15S0kXjTIW3j4lM
         mPN1LRVo+d0vLgjJXXtD3sZF5jb8s4n/CJgpTvZNzIyZu71kg3gn+ER92L6JzMDljdNj
         lQCzHA4aAva4WoLUeGf1v3WJU2WyRjvPaabEENOJH0jTqkNMIBdZnFSFdnq8zlJ1IocB
         0IVA==
X-Forwarded-Encrypted: i=1; AKwUvBzUs7x2qA6g7iVP3hU82z2mi2fJSXqxai5ssT0lpM9KiC6jgeLu9ChvLr3sFDwQn/V46hv70EfuN6CKFXI=@vger.kernel.org
X-Gm-Message-State: AFuF++noCcwy9iPjdR6xVCf/qyBABnfhf5RaRmD8LDMrscAp4ikiTL0o
	qMzHR8YkhgOVQkh0wBLnHZxgWFKCrbzkRnzQKz8r9hMhzikNCGlcm6/YOVjWZgXzptdx7WUVLxF
	c9vnvPk4kYZBZdq+Ur9CEfqRX9xuLQOT8Qu5L8b7ufg3asNbxYQsn6OylYOxI+CWn
X-Gm-Gg: AYBFou0MYjtGx8Y/ysBUQI/iu9iXSwXJ6lsxpdFWO2BSlNddxyRChnpkmZm0ksPOTJr
	FtLKxhG2TyCQkt33r9iggOQcSbMw19KWAWdmkD2iBYKKSA98OKZxroC/TGkrwlfiRrjn3F+/r9e
	wsFN0X+BU4QEJMJUAYtjb/OaOFoDlusDsCeJhNp4ymSVRM7v7UKOKVSw/yEuVZLXZ0sFDmziUSm
	MEuvXZApxYf1Nb6TYdfXNduQbDTooIkOrfRXOQgHFlx55R/450vzfZ2nAk2m8CRmP0PSY6J7npc
	q8ZOE2Zq2nCv4un6UXWcr9q2wsoEEjBMAr+MQ5Z9+yTQlQlH/8gIVOvXhr20ZGWzlW9dYNeO368
	X+qU6e6297ez2EEw3l/mY
X-Received: by 2002:a05:6512:3345:b0:5b4:ac27:6bb0 with SMTP id 2adb3069b0e04-5b8c1833167mr4016901e87.25.1790055278599;
        Mon, 21 Sep 2026 22:34:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3345:b0:5b4:ac27:6bb0 with SMTP id 2adb3069b0e04-5b8c1833167mr4016894e87.25.1790055278113;
        Mon, 21 Sep 2026 22:34:38 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:37 -0700 (PDT)
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
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH 00/12] [PATCH v14 00/12] migrate on fault for device pages
Date: Tue, 22 Sep 2026 08:34:09 +0300
Message-ID: <20260922053421.4092027-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Tested in X86-64 VM with HMM test device, passing the selftests.
For performance, the migrate throughput tests from the selftests
show similar numbers (within error margin) as unmodified kernel.
Tested also rebased on the
"Remove device private pages from physical address space" series:
https://lore.kernel.org/linux-mm/20260130111050.53670-1-jniethe@nvidia.com/
plus a small patch to adjust with no problems.

Changes since v13:
  - rebased on v7.3-rc
  - fix compile error in !CONFIG_MMU_NOTIFIER kernel configs
  - added patch 12/12 for Documentation/mm/hmm updates
  - document the semantics of new flags for migrate_vma_setup()
  - fix error handling after migrate_vma_split_folio() failure
  - comment and style fixes

Link to v13: https://lore.kernel.org/linux-mm/20260804042631.2175585-1-mpenttil@redhat.com/

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

Mika Penttilä (12):
  mm/Kconfig: changes for migrate on fault for device pages
  mm: add helper to convert HMM pfn to migrate pfn
  mm/hmm: preparations for HMM to participate in migration
  mm/hmm: do the plumbing for HMM to participate in migration
  mm/hmm: implement folio split for migrate needs in HMM pagewalk
  mm/hmm: migrate collection in HMM pagewalk - pte level
  mm/hmm: migrate collection in HMM pagewalk - pmd level
  mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
  mm/hmm: implement rollback for device page migration in HMM pagewalk
  mm: enable device page migration from HMM pagewalk
  lib/test_hmm: add a new testcase for the migrate on fault
  Documentation/mm/hmm: document migration through hmm_range_fault()

 Documentation/mm/hmm.rst               |  39 +
 include/linux/hmm.h                    |  51 +-
 include/linux/migrate.h                |  58 +-
 lib/test_hmm.c                         | 132 +++-
 lib/test_hmm_uapi.h                    |  21 +-
 mm/Kconfig                             |   1 +
 mm/hmm.c                               | 977 +++++++++++++++++++++++--
 mm/migrate_device.c                    | 617 +++-------------
 tools/testing/selftests/mm/hmm-tests.c |  54 ++
 9 files changed, 1341 insertions(+), 609 deletions(-)

drm-tip
base-commit: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04
-- 
2.55.0

