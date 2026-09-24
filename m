Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCA41E6A7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232856; cv=none; b=D5ml/mM4t6s6NUk+yFZGeeV6eYe3RYhLcEKEb0blVYfWeyD7udyemP1mgA1XiLHFNdcn4wJ2ZkSqltvefeMR9varMspv11ltjeYVRl4KmEjHUmmb0d8PYifR0biDKMzR/7hoMlmr7sZd2SUGQ3B9QdB0ajveoraOXBy1iBYv6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232856; c=relaxed/simple;
	bh=8VWcZuhGT+A2DQa1VOQzXzrGT7n50TAj5hHqQcOXivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+Xh4Zzq2uNniJpZSCK8a9xQF989XaiAFzFGLw575dcz/DUvt952PgZPFhN9mnI65hHCA6KDsRWD5bjiKaRzOS5G4A6AcLQAGe5iq514KZq7dQoyZvnssybmSUZuGX3O3Rp4eIdsWtDDnFFMmUpfahG15UYibQeSxYzBlaAp+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sl23vWiK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/rtdRdg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sl23vWiK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/rtdRdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vz+W5yHAoWI5ZxzvIYZX65gg07ZvreXTcI/Y7c3cDnc=;
	b=Sl23vWiK1SlrSeVkszoxOCTdUzwfOSoLlgVwHCcRdZtGbic/c8a9RcLBoeLAqQIHuHOqjA
	+Q84cYwobS+/ZYsFIYK2Si7sgsRidcEpL9p0JtC2HE8Zatx/5ldJndVoG3fR6chhPm6bbs
	vTjlTUJCUJFS8RkXTfI+hdXZAuGEvf0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-a3DtspxcNO6jZx5Dbmb7ig-1; Thu, 24 Sep 2026 02:54:00 -0400
X-MC-Unique: a3DtspxcNO6jZx5Dbmb7ig-1
X-Mimecast-MFC-AGG-ID: a3DtspxcNO6jZx5Dbmb7ig_1790232839
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a27d89a894so7817551fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232839; x=1790837639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vz+W5yHAoWI5ZxzvIYZX65gg07ZvreXTcI/Y7c3cDnc=;
        b=U/rtdRdgeed7RvMjBYz/no3/LItu28U7JCS4g0WzjN5Gnz5kRDSDau0vKfJadfzQL1
         8fNF8bLwqBK3rySP/5blVHGMEMG0xMev2KGP1ahFAUGzPE5p6Cah1Z9zHOQbZ70tyiNT
         Sj4w4YOhuPGl+e0lv6UqIRu+rGkxcRuU4/VzWXQQN9SOroEGEOfN052+buysbBec87gh
         XkX38RyX/AFGbXiQ9IsPFXC4EN8r2R37o7w47E6W/1xgXWNcJWNPMUj4cbVp6pFr3+5c
         bRrRnc1GGae2ZyDJtWdv/WVBu7LRre3Rd//H/L9gwyLxPGZs0lgMPGW0TuCPs/dyGstp
         GVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232839; x=1790837639;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz+W5yHAoWI5ZxzvIYZX65gg07ZvreXTcI/Y7c3cDnc=;
        b=rbV7QY12tYVA7x06FxhrZbHPQ3LtiXotgm0eaXULjQpwhRKB2yM7gjvrcOwc8Ul0Pk
         gd09/wo00/x/xK9VNYwiL+PFiEocN/NxCa2A6RKcvSOrz/fi6OLokq/4cyvpz5V9PZNr
         kRj9jS7Gx6SXWUACQEfbD6ORBMrqB327V68n4S/6fQlosRigMztTiMrEuu//OiyRSEja
         kB/y/I/OtyQxzxl2nNjsKy0ew+ksFtrfKRDgYWRDeCA8f+BVyX9KhoTdRF2YJ1E87Nom
         GhRNgNYAudfZ5MAEOs8m1Il0FvknP5uI60fdFfWkwf32EnSptqh958mmg9U+oP0VgCvU
         PmMQ==
X-Forwarded-Encrypted: i=1; AKwUvByRRnAmYnq5AZakrUrtYzYQWKICs1HbOxJRPU7cxzLF0XCHJrx0aaDNLjC2XB/FF0/8/KZRTAtHCtgadVc=@vger.kernel.org
X-Gm-Message-State: AFuF++lajKtmmLFLICkhzsP/kLcUL+u2IwiPNd/heiBaijBP0Sc6+UV7
	eUBb8dMsNKBzR5daYXGXopwmZlglgY05mbZlTkdLF8JRs4wgzJ1YidGDNkscMMnaTwpB/iiY3Rc
	zyE1lD+ZY7/sxNrSyOlFpzYQdif+F4KaOZkkhv2wkYe4V2zZsnuMoFo1/N4RL418G
X-Gm-Gg: AYBFou3zVksHqPJ9sZTUHmqEIaTjJhYEP+Wl1fPFPntvvYn5Oi/pQ3kii1wlgu/OGFc
	4imKdtJyVYlD//ytHaL2yF16Lho7ZM/VnBgZFEp1/GeaTVCScLCaHCGy9MLqpJbuWTfS99eE3EZ
	WZZMQLhReJU266Li6TZpuYIs9djHk/8XvgUZePasjQA+Ktdk48tb6ZoWKI3mQ3cAMHOAqtkIYRQ
	tic0cLKqZD9Awzxi6tmrPAEmu6xU+MfJ69fSko2jgHi3WcqP12dpUEgPMSYDE2+7Gw49E/XYP8W
	eX1vZ5P5ffKmWNH4gHCxzI2Mg/EGGkICKm1H8M+nu4+uTyi3w8hCDkb6cP0rCPNVnYvjn82Nd3c
	6zlOPYLQf4O2lHtIx5bPw
X-Received: by 2002:a05:651c:a209:20b0:3a3:7680:67fc with SMTP id 38308e7fff4ca-3a63c2ffcbemr2308961fa.27.1790232839207;
        Wed, 23 Sep 2026 23:53:59 -0700 (PDT)
X-Received: by 2002:a05:651c:a209:20b0:3a3:7680:67fc with SMTP id 38308e7fff4ca-3a63c2ffcbemr2308741fa.27.1790232838723;
        Wed, 23 Sep 2026 23:53:58 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:57 -0700 (PDT)
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
Subject: [PATCH v15 07/11] mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
Date: Thu, 24 Sep 2026 09:53:09 +0300
Message-ID: <20260924065313.899730-8-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Add calls to lazy_mmu_mode_enable() and lazy_mmu_mode_disable()
while doing migration.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 mm/hmm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index ea77429c5178..9fdd945cc026 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -373,6 +373,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		/* Report error for everything else */
 
 		if (hmm_vma_walk->ptelocked) {
+			lazy_mmu_mode_disable();
 			pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 			hmm_vma_walk->ptelocked = false;
 		} else {
@@ -396,6 +397,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			if (hmm_vma_walk->ptelocked) {
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 				hmm_vma_walk->ptelocked = false;
 			} else {
@@ -415,6 +417,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 fault:
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
@@ -555,6 +558,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_get(folio);
 
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 	hmm_vma_walk->ptelocked = false;
 
@@ -1110,8 +1114,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
 	if (minfo) {
 		ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
-		if (ptep)
+		if (ptep) {
+			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
 	}
@@ -1155,6 +1161,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		flush_tlb_range(walk->vma, start, addr);
 
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
-- 
2.55.0

