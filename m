Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589983;
	b=YjuT71srSzf4dXJgrsBrj3QVcB1QXQU+idJTcrULHLuUxyF5hh/iCp/IqiuPRIAZNsX/
	 qqjVIMw000RBnz2zxUkQ3qv3O3fFWAaFya0OkRVDIKAYT8czZpVohYaTQbNcbQr/nkOML
	 zM7laxTRfEJUP3fWCsl+Bv+jEIXe7aK7NmSchNLpJnIWtB0izsVVvuwREfhzMLEWUBW+I
	 TXRgGfoPeOlWhy/0GhS0EFStIWD6iz+FzApKRa+2/ntuh08eD5p/rqSFzKancK8AKxQOE
	 tjrLlVcb+wtBllYBX4G5EhUZvNrhhDM427M8ljEY8EcscI+3Kzhcm+Z/Vzce2teEnzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+HEPLjU1FVAy8fQhRfX6vi4LDK4Jtre7wliDLSzmNs=;
	b=2x9skwmciqWd1ouE4pDSNA/O/6QTR4GegRpQKiNQ9bPHH+tuGum9ZKXgPokNsujLym1o
	 K/pDUNGjqSQbMN69IQml2685kHzvhS7tThw7OXV8jaa7M0T6sW4cIOesYOaTnq0BwdtQd
	 oAJkri3VITD/UPUPv3KMBWmRzX1hwR1m49y63N74KL4cWuoIYBXJfcDvgTQ0tHdwu2DIS
	 PX8FKUL7lv75tbbajtMkEaHSmeVnSeDv/lTr33hCsBHK+kn7Co5+EyWNdIB80EyL5LO7w
	 o83ivYs4Q1P5Be7bPnJ+gOBd8u1HgIA93j0WqnPtVyNtbb69d5lBUsijEl2RMHpp0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W7e57adn;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A3B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W7e57adn
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2066933a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793589982; x=1794194782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+HEPLjU1FVAy8fQhRfX6vi4LDK4Jtre7wliDLSzmNs=;
        b=W7e57adno+BZTWN7jSq/29L556dWTrPTj6b13TrJs42qJob4mfC8qqa2us120dA9Oy
         7MHSl32Z2SQ6wjhIGils5KeH2RC5fB9FPHki/W4I6GPA8uyyVkmSgYO4WgCfNrHLB1C7
         a7kZY9gDz1c6CwdxjzeMZl2HSq5rglTxWfhjAv1sraMdlJ6GC6e03H6stSmihgg7cZSc
         NmBOTqeborNNB6vlXXIOVlq5oq7SFoGbrwcCyMxziI5dyF8zhVuq2gzaksG3pcg1Nf/a
         Nwm1SxkqeuoIvfjzL3GlnBQeioTgwC4q/oKFrRNNlBR8Yy5g278HOMwH/9uKvoJwa4gx
         ms0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589982; x=1794194782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+HEPLjU1FVAy8fQhRfX6vi4LDK4Jtre7wliDLSzmNs=;
        b=0CExAqc5cRc2ByFYn2gH41iQBDTt6mqa2nk+fzQVfDBPlsPQRQwzPvVRYicBCuQ6dF
         n+x0hrepL1JINnTNKKedeSWHekvkDPMR2twCWduFvLM/fiR/pqqSXOH6bp2YG8CwM1su
         4dOubYWu1O8gy7satRTXERU0A1tLs+GFb0Op536PF5KhAL8HH1MHjQuBaV8PfyUbQ0cD
         0OJfUKDV60uckXZAe23ExsfSJPYRQRdlBxYOzmvS0BpEydeP1WeLm8UkRwypMC1o/nwN
         MxMl6MWw9n72LIwIjElwG9hhMdX/EBRFvSYkXhzAX4/+WkUsk9/YLQJh3S6UCZP46/Pw
         c/TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH3ZFzTlizvi1Mk4MRxQHiE3kSIpc3aRcDXhHj8ocdN1ljL6JF/kRDuhMOmFo80uAQx4lVlKYpD3L5L9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tkx4piyJA8Og7+F0+8usja1CwYHQzqFB/v4ybkic3Pa3wOcRr
	Kyo82psdFRGb4clhNEnVLlQZHAmpMlbGcg5HD/617roSkL9JZ5DwyqfZA2K7Z27zhvU=
X-Gm-Gg: AYBFou0d9jkkpNGoHd5MFbnqAccAi49S4BQDJMXXaIXIAVzBs126iHGOMFAp9kwTnoy
	3+mQsvuOZkGPZih3m8qjC8hg5jb0wxStVX2mx0jCpgl/fAgFiiJ5+330TdnWXHtgEryqiLE6a2v
	H21Mz+dFcHVP2ZIgpkvZuBmyxS7U5JXLcDlPl7TkKqSbbv9ofxuugYpvu3KQU5HJ3TBUmeXhHQY
	vRQDI8Fw6uG0ka4UNxqoLV8e9azzulOE1CUNJmd/NQ3kSc4E/RUlMwJI62JQW0H8qmt3dPVaajn
	Y5Wd6DKXeLyHI51m8bV4vc79reBoyCTo/rntOeEkgMHQnbx4bqqV7zit11GzToaoIXqJ3/8iUf8
	VjCuidGWADtQJP9XjOw9eSdzCJ1JmxEIn8pCaXWJb1UuJMbTYEEiO3fdKDjsFKOqtHSF0OFkFrz
	OczHh0e/bfaINDw5K5d1xulfUweLNkItkbwyRBKRihi/+9xbA+ygHCq7+26KSoc7fdBr59Co4UK
	C8fxVuHFpVRRqExWAgoZop3NwjC6UYdz8XA69s3KhflNMA2BekI0l2zMevj0GJcm+0oS5HfooMq
	NyR7otxW1+jCMTfHVay3Yo4N7TBA/X9Bq/Cati0YXH+iJlZLQw==
X-Received: by 2002:a17:90b:2252:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3ae8987d10amr7610345a91.63.1793589982011;
        Sun, 01 Nov 2026 19:26:22 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:21 -0800 (PST)
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
Subject: [PATCH v2 00/12] mm: Decouple folio-based vmemmap optimization from HugeTLB
Date: Mon,  2 Nov 2026 11:25:13 +0800
Message-ID: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

v2:
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
 mm/hugetlb_vmemmap.c                 | 373 ++++++++++++---------------
 mm/hugetlb_vmemmap.h                 |  10 +-
 mm/mm_init.c                         |   6 +-
 mm/sparse-vmemmap.c                  |   7 +-
 6 files changed, 182 insertions(+), 228 deletions(-)


base-commit: d42dfde37af766d1c272467352c0a56d3169ee58
-- 
2.54.0

