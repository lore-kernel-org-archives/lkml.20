Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540917;
	b=sUdcZvIR1vffifOTd4/TtBX49Fd04bxhdtqNlP6uOCfJy5NbkLL4gGnPlyPK1z8UFntI
	 uK9RSKADvibKd8PBaLhapbJmYtaKgKVAOOwSrtG6Em36DyAzaRLEHNHBJGYvZRvL+SNoF
	 wfkfnwdZ0Yx9l9nPmtHGEQO9VoIV0BAxo4XG4BRBTop3/VG/fmchfZIIxqnI7Lj1egXRR
	 +bweDgqcTpsZB/T2ZwB6zLe275Wfcww4wWpkgEwHAJOSEKktfvn87amvUdBHUODMqwpf1
	 E93RkVL5tlaCs2bmJOCoQM4dnmnmJp8g5L+eSldF64B135ovtlkmlYcmof4Ro+7HvEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mrv4Fj3Nih9i0dF+SR2v9n/Jjgg1ueiHuwDw4uU10mY=;
	b=ojSfWr8127gqEaoioheETYy9JTQgNE3E6OhthSqV78jibd77f3fGPw7gYA46J1ltI9QZ
	 KUP1kwZFP+PJAShTDTPuX9KH57hNMSLGzyHErJ+hp5PrSOo9M9HMPxTFd43Zlih3IRqdc
	 6NVmiO0aAV0eiwbqNBX1jm4HZXFGS1X7jk4OeWD8aok9QDfq4V6IksplTo1CKeb+13OQ+
	 Fy/pTrtVto7yEhkeq6z8iB0FR+SElwA/wOqap7Rc3U7S9fDfVRfUrtKFgVNFr/kk9GRCi
	 oE4+lgvTPJXwPI/spAQLov///EJr1/fSsh/AygnT11p1NdH2Tb72GWpCSpYwESbkvfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="KMa/Lw9m";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421B606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5421B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KMa/Lw9m
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso1297045eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540916; x=1795145716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrv4Fj3Nih9i0dF+SR2v9n/Jjgg1ueiHuwDw4uU10mY=;
        b=KMa/Lw9miooyP8HaaVfXsuGNUL9Lc0rA/ofKlEq1hbzPuDCbARQenC/vBmPu3avYKc
         Wfoq+k1ozrJcRY9UEsyk6xOkNAHW2aj0yAd2d5sTucx1EpEHosXGDogBFP/u35urRgUH
         5g15NP+0lYk7yfA5M5MYhJRe9ntePc8bY9btF5cQEkNaElghWGUhewK+iXCGWClCefnV
         kLoVDOhzMNVnMQXMoOPlyFhJiFY5d+UateN0jLeeNYqKiCNOkCNu6EG+SAGptybVwRRr
         2+Z9XXX1RvwqZtj87pQ5TDleS8uy/l4v3QKYUjQlM/7dL/fN6QVM/Z+lcdgJHU+nksxU
         rIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540916; x=1795145716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrv4Fj3Nih9i0dF+SR2v9n/Jjgg1ueiHuwDw4uU10mY=;
        b=W9Z+4D4XXL1tti6khPFMZY3SK7aeCKjnJlr4fGd3AvQ3nKmCeAhFPw3hyY39rHhjrg
         Aj1B6VpvTC0bgZiogBMef/zMyRJ1+zJRAku6ImqDEGtXfWfSE4n+zAegu4uR5/HyXFNp
         X7QX+SF9xXFxruGPLKZBxeuG2ZuqygVgzXxJL2Xi645FftJsffQRHyePeq6b6MAWUTGq
         Y2wZRImJsC8Qz6JLpiSHliQLRQ3WwNu7WEjYa4s7z2EGJatJESaQfV7pR87+edKlUzQ0
         oTyaiM0B1K3OHo130AmqXgkAG2aHnzrEars1auCg9oz+ZWsW9sEqCD6AsGLQQuYPRNBJ
         Dlsw==
X-Forwarded-Encrypted: i=1; AL+hErEPxJAujsLQy14eIw+Waj9TalI5OsdLOUSiYhqkqJbMz1FRrigha3aHfSTRWZhXyfndo/kyj1EnTN5OfVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I14sYDVL48R+Tp8fZz5RhpmLo+nfd/0dKWwZDM9clNV10yg0r
	L2YfbQ3009iG6CE2TiDF3n11JpyacwzepYoNujCBz5uZOzq9YM7Fmh2dG/fcMLmCSiE=
X-Gm-Gg: AYBFou2YySExJMu0RdQOwlarPVNHi9Nsj9o/cb1wk6Vq6ryLFlLzbQleN68wMmmdSxU
	W4TuXhZCkgsaLjYE3FbNFAMpG3XcDQ53ANZV+tfSoO5nsWgBOJQ+8dOpZdQhwN+GD3kndA7pnHP
	8jHpqEkTBWDiC1zk4uMC2mX7pQjtAH3pyhiST/tGqJS7cEROpE+1NkqvOXJd+5avwwiwhzR06D5
	SVA0j8iUaqYaX2JafaUif10oxdYvlXoMyn8jvaXOEto9BrkbdnvYNNfeJpX6l9svRoUYD7SsFRB
	6m0a/nAFfnm6ceP0KGNdOU3PxJXJIGUc78AQcx3ApmRgaSUwC4NK9czpg/KBNfP2cq92L3LAxL1
	r2G+lwek3rNf5n0pAF9BJU9S1CDRSDHzBchepLodxIXAQ9gvOfkZS4byGuK7G7x2GEePrtAR4/H
	34KaqMG4LzahHxlNzw8GaC+bAoJvRg43s+LfcFS4m3rVBHIgsZTDyGDz0K2ePspuM7W5vVGd76I
	MuQ/n7PKPzndgohGyN7pE83+rGpJ29y+fAApDNEGC6LHRjxDLVUVHhFloGxalr+5O5BzaGtR7iL
	pj9K83+2tDSRQvVPcVjJ+gt/pbADtWneKytBQLzU+er9myYqda+6sKPqfOm3/g==
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr1056859eec.0.1794540916137;
        Thu, 12 Nov 2026 19:35:16 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:15 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 00/14] mm: Unify memmap initialization for compound pages
Date: Fri, 13 Nov 2026 11:34:28 +0800
Message-ID: <20261113033442.62970-1-songmuchun@bytedance.com>
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

This v2 is based on the mm-new branch at commit daed51c91051.

This series is split out from the earlier, larger series
"mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
generalized vmemmap optimization across HugeTLB and device DAX. One
remaining piece is the separate compound struct page initialization used
by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.

This v2 also folds in Li Zhe's two-patch series, using that series' v2
as the integration point [2]. Those patches add
memmap_init_page_from_template() and use it to reduce bootmem HugeTLB
tail struct page initialization overhead. The surrounding patches in
this queue are adjusted to build on that helper directly, so the merged
series keeps one template-copy helper and then shares frozen compound
page initialization between ZONE_DEVICE and HugeTLB.

The first two patches are the merged prerequisite series. The next four
patches make the generic memmap initialization code suitable for
sharing. They add zone-consistency verification to template copies,
factor the PFN-independent page state, simplify the ZONE_DEVICE template
setup, and introduce a helper for initializing frozen compound pages.

The HugeTLB patches then make boot-time gigantic HugeTLB initialization
rely on the common frozen compound-page helper. The following small
cleanups make now-local helpers static. The final three patches move
early-reserved CMA pageblock setup into cma_activate_area() and then move
MIGRATE_MOVABLE pageblock initialization into the shared memmap helpers.

After this series, boot-time HugeTLB and compound ZONE_DEVICE ranges,
including device DAX, use the same helpers for frozen compound-page and
pageblock initialization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/
[2] https://lore.kernel.org/20261112112816.55095-1-lizhe.67@bytedance.com/

v2:
- Fold in Li Zhe's memmap template helper series, based on its v2 [2].
- Remove __meminit from memmap_init_page_common().
- Add a cleanup to make memmap_init_page_from_template() static.
- Collect Reviewed-by from Mike Rapoport.
- Fix the helper name in the final commit message.

v1: https://lore.kernel.org/20261109095807.41547-1-songmuchun@bytedance.com/

Li Zhe (2):
  mm/mm_init: factor out memmap_init_page_from_template()
  mm/hugetlb: optimize bootmem hugepage tail vmemmap init

Muchun Song (12):
  mm/mm_init: verify zones for template-initialized pages
  mm/mm_init: factor out common struct page initialization
  mm/mm_init: simplify zone device page initialization
  mm/mm_init: factor out frozen compound page initialization
  mm/hugetlb: drop boot-time HVO handling for gigantic folios
  mm/hugetlb: initialize all struct pages for bootmem hugepages
  mm/hugetlb: use common compound page initialization helper
  mm/mm_init: make __init_single_page() static
  mm/mm_init: make memmap_init_page_from_template() static
  mm/cma: centralize CMA pageblock initialization
  mm/cma: localize init_cma_pageblock() to cma.c
  mm/mm_init: move pageblock migratetype init to memmap helpers

 include/linux/mm.h   |   8 --
 mm/cma.c             |  24 +++--
 mm/hugetlb.c         | 111 ++-----------------
 mm/hugetlb_vmemmap.c |  17 +--
 mm/mm_init.c         | 247 +++++++++++++++++--------------------------
 mm/mm_init.h         |  13 +--
 mm/sparse-vmemmap.c  |   7 +-
 7 files changed, 129 insertions(+), 298 deletions(-)


base-commit: daed51c9105158768a3949395135aa6e0a04bb7e
-- 
2.54.0

