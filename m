Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759739;
	b=Eimf4Gh2roaasF5BEg02B0ZrRoEnsyOtOYWXJmtWgKTWnUctkNCyQVGi5oHctQOUJtcb
	 rT4e0dQcDZQKzjLWgBAm4ZTFk5UcddGOubj6AIvETLTH4HA76q7IM0YVKdqgdMGwbpwS4
	 g4JIjVC/6kd9heYWbtXUiI+0sWVT7DHvGr00RolsSW8Y/VzxoHoWvDzkY7rXk+poLKwBA
	 CEV2aJ09a1crsKbt0EVhS7DirBIGp+H0a3XP9IvIevSlEa5m0cDIA/MUIstF+eGDbEw9j
	 4ScTaC6+1Sb/D44rTX3NDAf87kmNsQqgCrG3Ha4Ozc5Qak7NP91va5ElrICQeqXiTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aG6IwJCLq4n8f0cBfAUpqV0o25rDt/v0bsv7rm2VUy4=;
	b=w6eTpDCZMNcm9RMamkUSqoZyxBsGktkE2O0PbqFETGhOVwYjOBx3vhcJPFI6/3KF6/mP
	 Bbf17DL0InYwrElhWV2jfJbdOesqJ2XpWsO2WKAg+mzNFb10msmv+iWKmOaLUdkz1Ga9r
	 O4p/eemMgihuT+TdJgQVJYanp/k4FwZmov6N9qwluvPj9YOEqXBcBpAPRdsPRq0kR9aN1
	 28VH5Cg8dFQcDcD0bzmndF/DlzIuXPuvI3iTGiJIIi0K5ht/okuoWQz/FVMjxDxChXz5u
	 vMd6X9CEtbc4qKRld8reFAqpy3+Yj/7ioEqnoUjBPJEDOGDizQp70Kh3RF8MugOIKjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fpiyb9jF;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4473606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4473606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fpiyb9jF
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso83239b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759738; x=1794364538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG6IwJCLq4n8f0cBfAUpqV0o25rDt/v0bsv7rm2VUy4=;
        b=fpiyb9jFlzLKvrUq2P+zRdQmVeM7eypmgwKac6exek2uyjZGo2t/pXbsmciax4QTNv
         +Mlh0BmX7DpLtBzF7I2D+TJ2lgHfHS+sLj6Ri2R5u5I/4J3CORIsCdMwnluDQiS6A+8E
         o0/LVFgri8ytHSn7oFKx/lNE6Z5X5AHS5EHq8oVDffheUH7RltByx6BtbPF/RQDdUGt/
         +VyeXWm4QyQ5fBDWqpEwk6pAHyFgzPM5PMd9pf90UlDE/XOAaj6iiRgIELJzPfEJY3de
         scWAnbx+v+eCpSxWB8VQz+mEDa9NcR+ewjO7y0+BSjK0GBoJgbY7PYmxqgb87HauO9uk
         TFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759738; x=1794364538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG6IwJCLq4n8f0cBfAUpqV0o25rDt/v0bsv7rm2VUy4=;
        b=Kq9zhDg+kcu1IsfcSqWutTHwLMub5AirVyRLPEgrYOWmMh4lu4NLOG0D23HFscnVts
         jIKYpc3trDtfUVJBHfUGZWsVspEjFIXSLc7fsxZOqil5q7aD0yeaKH5Iv5QGH6looZh9
         K/e8u0WvkKDm0RhjShJBuinEMSB6kq3bu13HffUEEGL3ZVuae6nDYbd7q/YXp3BQ1Z/h
         xeD3uKmXoHPwKX1mFh5QDcShWIPPecelnnAO9l7QORApQ93U2DV+BxP5VIAHfceeMVvV
         cB4jICU0MHAZjVqp5Ab2inA4LbY3ZFqjdYkUM7M54hQNOmejhr+jS7L7LyIYiAYQ29Z8
         Vj6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxnfeSBbBzS2VrfLns92LuiNVim5IUhVLLadXDvgFKLqQcoAs/24NjoY/0UL3rJzLKCX5EnKkDrOXPPV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BIlxqAdjoKIS0G1JZJjv4sQHzRWA/UJV3qKpwfOiwEW6ydg9g
	EiKsBh6oe56SCMeCGertHDLDcjyVeY0/AJbc4ueQxH0/HMYuO9LbM30jxqd0xri1YKQ=
X-Gm-Gg: AYBFou0AfHspZH6Ujg+KMEpcrHPIUYKJq1R7pvQpjQHN4vnyKP6kWB2UBzvgsIWFf6C
	iJZZwAQfz25NS5BmQVhxc023ph3GD4rFyqh3L3R3AGAdVHO3K3nNO/8Pa5659gj3mWE2TuF14ed
	sPH+MZT0lWjO32D2DpJWly6Q+coZDUti5R1sNSJkvSVIX7Ay093DRhQ4WgyU2Bnv9ICqPKbi571
	/wxHQKXut4wpD3YKtORPWNP9yr5ehD39JZCQee0HhFVpDOL5IbiF7KkwIXfdGRlqgFgZ5RW19bf
	B3Jaj6AoyP79t42uliQKJScfcgGmXjScht2ZtqhOQbyox119gxsxPjikTJNA5puPCb9ol0+/udS
	BMyRt3i4I7KOm12/gh/aroJi43DxH/gk+VaGXm1/sM2irH8uOPK+wMLVbx3l/cWbjDpLWnEO+mQ
	wYImZBj4OTIg5xyHnYTAl8md8CNYa1l6IQSZKNIlBQpZpNTVYWDwLgeqFPC2SokqpmrTACRXxSm
	1V+R4424g+153FhXBRISC2jWc/2Mv89ExiF2HRko1dd9Ebt4jX/5QxQYjz4be7WBY9n9mA488ML
	IPRgs19Wrji4vfb7Nu1t+phiEjZWTewCdFkkZT548td1zilO7CYdfkwxYSaggytbFLbHnmY=
X-Received: by 2002:a05:6a00:4fd2:b0:89a:5:92b9 with SMTP id d2e1a72fcca58-8a9bfbf10e2mr11631096b3a.44.1793759737759;
        Tue, 03 Nov 2026 18:35:37 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:35:35 -0800 (PST)
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
Subject: [PATCH v3 00/12] mm: Decouple folio-based vmemmap optimization from HugeTLB
Date: Wed,  4 Nov 2026 10:34:58 +0800
Message-ID: <20261104023510.260766-1-songmuchun@bytedance.com>
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

Hi,

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

v3:
- Rebase onto mm/mm-new at 74d73ffcffe0
- Use two tabs for continued function parameters in modified declarations
  (suggested by Mike Rapoport)
- Rework vmemmap page allocation failure cleanup to free temporary pages
  directly while keeping accounting batched (suggested by Mike Rapoport)
- Collect Reviewed-by tags from Mike Rapoport

v2: https://lore.kernel.org/20261102032525.3597743-1-songmuchun@bytedance.com/
- Rebase onto mm/mm-new at d42dfde37af7
- Rename the unified TLB flag to VMEMMAP_DEFER_TLB_FLUSH and clarify that
  it defers only safely batchable flushes (suggested by Qi Zheng)
- Update the vmemmap page-list documentation to describe its input/output
  contract (suggested by Lance Yang and Qi Zheng)
- Use page_address() instead of page_to_virt() when copying a vmemmap
  replacement page
- Collect Reviewed-by tags from Lance Yang and Qi Zheng

v1: https://lore.kernel.org/20261020115306.813483-1-songmuchun@bytedance.com/

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
 mm/hugetlb_vmemmap.c                 | 375 ++++++++++++---------------
 mm/hugetlb_vmemmap.h                 |  10 +-
 mm/mm_init.c                         |   6 +-
 mm/sparse-vmemmap.c                  |   7 +-
 6 files changed, 183 insertions(+), 229 deletions(-)


base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
-- 
2.54.0

