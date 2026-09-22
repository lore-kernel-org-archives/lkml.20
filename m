Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46248EBE4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055309; cv=none; b=FY7vnnnBpUi6vzOXdAcpBnxsLuAQbZlHmVjpbJa31cRvpBTCIfq7lXjcKOwlsRMn+aFQN14A0mryrL49rdwwNiIpsZEmH/J1CAJZatp7GjwV4RXul9Wrri09OsHlRcyStWwT1npqLVG+wSm/m2nTD2u0ssDzp8jSeiaC64igghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055309; c=relaxed/simple;
	bh=gaafXcZcjznd8IeK7dwBsQcyVhCGqTDT+dHWEFWiQ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeDyWz1HgQ6A0wpU9BvnJcCCe0xon8nKQuPKx0ZpNPRmczei4Jtg9m2lIhhFZ95x9iU8EWoaqAyQtTqVcrrT43+eWBdJkW6FaUSaiW5NIk+2IYcd8FVDd22Iz9XbPFU4Y0GVMCq/v+dPnTdH5rMiHIJjeTyrHIf9yeBjHrrmIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VQS5CPWR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UBHec5BK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQS5CPWR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UBHec5BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3/indgfaSaWc6lWBv7sZZH36jWcDt4waMnqUjoKZgQ=;
	b=VQS5CPWRqzGS58O82hPZzXW8492UTAchvT4Ny4pzwxjXnEzTb/XEbe5YjFk4Adl9WSdhP/
	1cNoyEPGNxHz3Ej8Lar+4Kunw8DFDdnKryzYF5opBAjC5d9baDoxJGRD01Vrg8AkjcDRmb
	GdkC0qUaBDpLEuzonmayUSm5UXRwtxI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-p8E0DT3WMbixoANhotkCpQ-1; Tue, 22 Sep 2026 01:35:05 -0400
X-MC-Unique: p8E0DT3WMbixoANhotkCpQ-1
X-Mimecast-MFC-AGG-ID: p8E0DT3WMbixoANhotkCpQ_1790055304
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5b4fe10d092so2566868e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055303; x=1790660103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3/indgfaSaWc6lWBv7sZZH36jWcDt4waMnqUjoKZgQ=;
        b=UBHec5BKzeq9YLQk3Dr1xRZ3X79glHMDRGYQgnso0HMx7LdNTR3a8hKHjCJzxUld8w
         svVqUH97yF2vURih3f2x78wB372pOFfoG4Pgvfv1HFUw4M6BHGMPwN4lYr+j+AR/VE7h
         iOiRM0BYq0fG9bXyF+7pgxFkmd/zbO7jTo38dtnzeYEKSyTRqL+u+dFgpatkyt9jcXLY
         x1eHafRQ+Vsx15ML/HOWwxaoCH5l9ozloStTGddwwHO/wb61pcsEyMZtDwS+z1kaUnp0
         SKA1yGRMWaIU2m/fw1paz8ynS/VIzMmDHK8conlZJJLXwP/0zV6bQLs7fcNqb08MHoPk
         jO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055303; x=1790660103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3/indgfaSaWc6lWBv7sZZH36jWcDt4waMnqUjoKZgQ=;
        b=bU9YaRchBfko6IZiruUTlewduUtOPHoAbRLqn+RmBN5VEp4VFxSU2Ul9t4bMcAqtYB
         NU2AN5Zi/BF/Oi4H9qzQtqGdfjcVcU6W3dJNycaIQgd0k74LXbTzIQ7HwsIIvpf1F5jG
         g0kbWvCaEesgtttS5Jffm/e4ovkQnmkwd8KhFgMMl/MsT+Vt4emqqIJiNyVs63zjww9k
         KO8/+qg6O8WE+0x+/ygp5om5yLp+vasBUIy7yOIXf4TYug102NTAIEM6UQkOXKNPz/8c
         Avzi/B+/bPV3Hwjsq2zU82MxdzTFkWUmOjWc6LF2Y7E4CxlLnAwFY3JyudnkB5/sOJn5
         QXdg==
X-Forwarded-Encrypted: i=1; AKwUvBxtBA/9drj0BS7e2qwoU85IwNRHVHha7N0Ssjqvvhn+ssB3jwUazzSdKPZH36OLS7haAW0I/rAz71VXJ1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lsDcOvk3O5qf8hKTkp8au0GmvhjDQFt7sd0Or0eSwVaQwoXb7S
	huTvYUmZQGOa6NnSJy0xgYywpmt/BU6u6CcGok9guytNDSRBqxoDfknJIzkSvmHN8B0jb7j+SD2
	DVeZnXZGnSAnPSM7mEgKjgoa7TzaI3QBBN8ppOkPA2rZZG+vCKYkGsv3BnnDFUney
X-Gm-Gg: AYBFou0OkOippQWi7CJ7IGHSciPfOzPZPznWBbKGM9wgSB0eHVYUGK4xePsaJkskmUB
	TClpTUeGBcen4CRsNKckNa7WK6XjYhMZ+YOtO0sq58FjG7ojHLbROmc6GFBPHdlxIYQCAduP70Z
	Mqr7f1B1lTn8fmO0UkevxJce1KvyU6tzTwZOe2HWkEmMLXfwRn4UuQK7+8tu/BP1MC9hV7H0WTH
	xhDcjMEikx6lfdQYOOSfO7KDsRTShdWjhRTbVQ3Kk7YidSja+J1nq7T4KbB6RaHK42aoC4FmwYy
	euLX8a72mVg92Q7y6AhMeKDwItBfMKbss+gYuvuToYpquqbc38NimAG0CkP61MATP2zg3tfke8K
	PH8B+tTujMelDwanAcIpLoSWFC3aPRVc=
X-Received: by 2002:a05:6512:110b:b0:5b6:183b:d215 with SMTP id 2adb3069b0e04-5b8c195af81mr3584654e87.60.1790055303484;
        Mon, 21 Sep 2026 22:35:03 -0700 (PDT)
X-Received: by 2002:a05:6512:110b:b0:5b6:183b:d215 with SMTP id 2adb3069b0e04-5b8c195af81mr3584632e87.60.1790055303030;
        Mon, 21 Sep 2026 22:35:03 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:35:01 -0700 (PDT)
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
Subject: [PATCH v14 08/12] mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
Date: Tue, 22 Sep 2026 08:34:17 +0300
Message-ID: <20260922053421.4092027-9-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
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
index a1459bd34c04..a67a23e54551 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -371,6 +371,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		/* Report error for everything else */
 
 		if (hmm_vma_walk->ptelocked) {
+			lazy_mmu_mode_disable();
 			pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 			hmm_vma_walk->ptelocked = false;
 		} else {
@@ -394,6 +395,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	    !is_zero_pfn(pte_pfn(pte))) {
 		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
 			if (hmm_vma_walk->ptelocked) {
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 				hmm_vma_walk->ptelocked = false;
 			} else {
@@ -413,6 +415,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 fault:
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
@@ -510,6 +513,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_get(folio);
 
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
 	hmm_vma_walk->ptelocked = false;
 
@@ -1135,8 +1139,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
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
@@ -1178,6 +1184,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		flush_tlb_range(walk->vma, start, addr);
 
 	if (hmm_vma_walk->ptelocked) {
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
 		hmm_vma_walk->ptelocked = false;
 	} else {
-- 
2.55.0

