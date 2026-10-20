Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497195;
	b=YfbFAm0lzdxVESXJlFpByHv5GXp8h09ZP0O05k6gGZLRzv5Hs40QAsUYAqM/hUpWuyMS
	 sW4SGQXTty8qWxgsEH+wKG292FkKsZCHKz4ootjXwqayylwJXLl2z3Apmu6sGiWt4YcUc
	 FWaegctzyOWAlho/83NlMSwGOHyTQvZeU1AxyXb7+KeHXEWECjSDKDKSL/5F/PAYwzkBH
	 Q7BGBNiawzsrB+P69bsbjntjTNliAU/kwnJnjNm1zP1hmaiGeQyCTH+FkX2WnFcKMaye1
	 /jkyfiKBTll58W+p6iDSAzLuh2KrE8I28T+MEvspUMPSiS28IssWHJpwWjoypoSG1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ElDVQlbtH45fHoqyfiMOaRd5Y+wT93d0d2y0h85C5ro=;
	b=mqfFqhlayOMaM0pKe8kp6PI3UlfgsDmlRt0HF2C3d4mRGKtcjPckYw2n4scgd5tB4h3A
	 41wk0WSSjy2C4T2v9HpS9Y36LkdE0YPr8c0NRBHHpdAFbtsyv8M4XyKFOIxi8f28NDHzN
	 U9cDUHDZtAwAwkdXduMW3lgwfOW6gpV30anufgqFVnZajyZ84pDOqd+HL/2O3yUI1LfQI
	 6sPseDdejDEPKjSHZynmFP+28SLrBtu6QKX75rO4zbhfsHqOPZmfLzKXxqtuBc5774PC0
	 yD6yiP4QK1ANsc6+oIje6dwGNN0ZQItzScZrfAK5NjazdCU7HbhyqMFsZeCqCTdaYLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zl+elvpW;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED804606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED804606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zl+elvpW
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60d155070so1383107a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497194; x=1793101994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElDVQlbtH45fHoqyfiMOaRd5Y+wT93d0d2y0h85C5ro=;
        b=Zl+elvpWkonQ3+PJ01xrDo7zYJxBHmQuGRhjmFCAIM9EyoxtqNY69jvBAzVfgTVfQj
         pTxC6hgPnTukllM3eKrAdKA7S8B3BjPvKq/f8VEYOYiU3B+9ZyOfWIjg0OnvZ511kYFz
         Gd2iBulAZOYLomtOT5sHOEsDR21pcokIrzd4uGsYHIxViX3QB78RGQqaYYwosi5gTHbR
         7zFKa974oy3ogNfHgrCyEkfF4/DJHgqSTZCAx9TF04sId4WTG2fFMOfpLNkFbA//Zzb3
         QKwvxvsE1WK7/PNN3YOmUUSeX/HOR7vieM5S+SBJRD5WHPycBNvAPVXJF7GKsYm3ZveH
         nQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497194; x=1793101994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElDVQlbtH45fHoqyfiMOaRd5Y+wT93d0d2y0h85C5ro=;
        b=UvoYW1EgG3h0IjfUiuwTpMN7hXYgPvh7dEYwbOXVefmuhZzrsG8HLVRNPGQsi7Fv7T
         rNaRJudTDg/VW5XDRVVL8PFPR/XzJ9SBKp0T39sNlVZ1IqRDYH9wUMYsDg13gooNm0az
         a/WDR5C4G8WwOMKw+bt/D+Wv11ngjrDCI6bXAiRUGuau0LyAKUDN82m+zwBmBroWTRoy
         o4IB4YzQ2yl+mWMNo4NhHBNnbZFCA+Spq3d+FVcdhX3eMbwSxTo7BjDNQbu8j654JqL5
         eYFSQzoYqX8QQUK72Yz5dseCXI711MPXTdNZzBLocsmeopWV2zYL2eRRe+2eLfXBgSxX
         mkhg==
X-Forwarded-Encrypted: i=1; AKwUvBzuMogOt2e/iSkULHoBNfwTq4zTUAAwBuQOtPL9cnMgjtvZE2eDOpLiZOGcdCRmQZSlydtpQARWOZkc1YI=@vger.kernel.org
X-Gm-Message-State: AFq9FYId2WKIblpx061ztlT525rmk3zCLjUA/L04CP07tjR3TluM+Bc3
	WjfKS35ZgH3PBS1NMgBNjDWHmQvNfXp4M2xmVZrXu9iqJAQIDBte8EDJkTTix9gAmwoLpMFwA8N
	p6n5xNVM=
X-Gm-Gg: AYBFou0Jqnz8qCAlLKIi5WVw/sEwDfleu35BOe2HWqAr9hy5mRd0V3/RlGsBfLrqwn6
	hUcLwpQn4kxslO5n6mXncjK0FKH90Rg2cK+/ssmoZR9lgf/gSYRy7pZK7qh+VPX09vqVRXMmvNd
	lq3A/eUK67gR1R2KnXJuVqK2drHeq8RHZsGdtSnJxPlayVt27rG+PXAfcAgqZpQ5T10AT0Bp4FO
	1yAEvTkSKzfFOMr4mPQiKXkfLbzZGJ/1zejiguxgLl4ULKHVJC733oXqiDB8crWorrF+3IhmkKt
	cmB6sEg+mUW3m8KVlVes/6yfDmKQyLydi0e7saQ503/Q4ClOBqieFjwEZW3Bx32ihoLILQtivs1
	uRREwL9kU/VMBO1+5nZjzIyi6qkIhLK5eLivab4V+wPH460w3oraovWFYS49sIKCd4VFnsX3gF/
	293Dm4F/eTUzN6tbaICZn6w7BaAAEMiK3MBTvWaFOZy4Wrj5N9/hgAxeBKrwPV0cQVUpnq23xPX
	sxU1/nuAlWsnLYaY8bq
X-Received: by 2002:a17:90b:2889:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3acef134bf7mr9626848a91.14.1792497193835;
        Tue, 20 Oct 2026 04:53:13 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f34bb6sm3742401a91.10.2026.10.20.04.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:53:13 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 00/12] mm: Decouple folio-based vmemmap optimization from HugeTLB
Date: Tue, 20 Oct 2026 19:52:54 +0800
Message-ID: <20261020115306.813483-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Section-based vmemmap optimization is implemented in sparse-vmemmap.c,
while folio-based optimization currently lives in hugetlb_vmemmap.c.
The latter is tightly coupled to HugeTLB-specific state even though the
underlying page-table remapping operates on one folio at a time.

To make these interfaces easier to maintain, the folio-based remapping
mechanics first need a boundary that is independent of HugeTLB-specific
state and raw address ranges. This will allow the mechanics to be moved
into a common vmemmap optimization layer alongside the section-based
interface.

This series establishes that boundary through three folio-oriented
operations, each with a distinct role:

  - vmemmap_optimize_folio() optimizes the vmemmap backing of a folio;
  - vmemmap_restore_folio() restores the vmemmap backing of a folio; and
  - vmemmap_pteify_folio() converts the vmemmap backing of a folio to
    PTE mappings.

Together, these operations encapsulate the address-range calculation and
remapping mechanics for a folio. HugeTLB wrappers retain policy decisions
such as eligibility, optimized state, batching and TLB flush handling.

Patches 1-8 generalize the underlying vmemmap remapping infrastructure by
removing HugeTLB-specific assumptions and simplifying remap control and
resource handling. Patches 9-12 then establish folio-oriented operations
for optimization, restoration and PTE conversion.

The implementation remains in hugetlb_vmemmap.c for now. A follow-up can
move the folio-based operations into the common vmemmap optimization layer
once the interface boundary is in place.

Muchun Song (12):
  mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization
    macros
  mm: hugetlb_vmemmap: unify VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
  mm: hugetlb_vmemmap: simplify vmemmap head page handling
  mm: hugetlb_vmemmap: generalize vmemmap page allocation
  mm: hugetlb_vmemmap: unify writable vmemmap page preparation
  mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to
    vmemmap_optimize_pte()
  mm: hugetlb_vmemmap: simplify shared tail page handling
  mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free
    helper
  mm: hugetlb_vmemmap: make vmemmap optimization folio-oriented
  mm: hugetlb_vmemmap: make vmemmap restoration folio-oriented
  mm: hugetlb_vmemmap: unify vmemmap range restoration
  mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented

 include/linux/vmemmap-optimization.h |  10 +-
 mm/hugetlb.c                         |   4 +-
 mm/hugetlb_vmemmap.c                 | 364 ++++++++++++---------------
 mm/hugetlb_vmemmap.h                 |  10 +-
 mm/mm_init.c                         |   6 +-
 mm/sparse-vmemmap.c                  |   5 +-
 6 files changed, 176 insertions(+), 223 deletions(-)


base-commit: 59d7f9ec14ad4b6f38c04d254f8f2bfb991e888e
-- 
2.54.0

