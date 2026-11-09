Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218298;
	b=fVXmFNVi2jqvSRBfheorvOZptVM1tHkRlbwIjDwN/7cUA+ZDjBjboPL2H1ikIzfSTq7m
	 r7AH2kfookp1mYRk62xJWuM8E0r3JEDqoH/WYbHJVMLt5JgGxOI0qzRzHvGXzkTae/xcW
	 QLmv0vpCHr9izOkln3gDM9YlOgPfwXWRZLOvrzKbdq8p73OaAkbTbcb7E9oHQ6Y4tr3MY
	 uOWvgBeVn3hc7g7fKV/4Kjm0/Y1OZzos+tL03C4NnVslL2YK85tlx37ZDHqn6qGqjLZoo
	 DEXWj/mjbCowm+/Whzk1jXw2Fiug/pZOHlM7AIj0GUWryCXb/LxXrt+3/Yd9rU7T0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kh6WS4JV09X5bkn+ckuHPEH2lqGAS0Kwa0bbH5KEGyg=;
	b=vpXXQ7xqHd+Op3KGcMwX+/3osU9yts8+ucbY5i0H0c3wzNlTIfj4WwdGwQbGVCXayBDf
	 YBl+s4zKVFG9uxO9Fz1Vphi/ltaMP3PT6ug+mmq3QItscahTVB7cot4GF2kvEawnPhJAO
	 Q/Y0o4PFG+rL+P3rNfss8Fn2T+akBZ4LNDtw9pSpJIKfKL+qdQM3HSgBe6EbTh4wh21yu
	 ZKyTSro6Garqxs4Ymxq1zZOxU9CzTM9Pkwre1KiBsvjRkKyoNsLuPjcFWtiwW9yUy9don
	 ZlOkUne3tydOEzqXXcifLdb3oHYZCOmmO2LZ++kWyeNcUSYBp6oz9Uag0KXXt0vdLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RvQ1Eopo;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F92606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RvQ1Eopo
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1039020c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218297; x=1794823097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kh6WS4JV09X5bkn+ckuHPEH2lqGAS0Kwa0bbH5KEGyg=;
        b=RvQ1EopoPFmBQtaTi6FV4ZBTxnA+F3Ji6r4MVf99iPO9nKoCsetbHE+5wq7vaOhCOQ
         CLn+0d3eZYiU+Il+Dms60RaYAzpJi16w/LU5JfHZTpyiX6hpdbHQLT14JKDzT4f0ytju
         7ErFzZJ2q7DyzP+nkJIL3VVM6uXi005cTgUVB5jDo4wpgZgs7k7QFoqpHy188JzGcL2V
         qmvNkZI3kSSjIGDU9WbJWc+NgpLDL1GK06+MT25o5msEOHKkVjk79IRgfH0gM6ZI8Eam
         zSPtr6OVzAi1vk6ROGp3LsPjdHjhDp02SWte5ZgDH/I+5oTpuFZ7XTX65n/lhCLyCIF3
         bCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218297; x=1794823097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kh6WS4JV09X5bkn+ckuHPEH2lqGAS0Kwa0bbH5KEGyg=;
        b=hIvQ/ZKDXef3uWsOZYrbtxJLHl0/BUL2b8BxnGQ2FKmrFlXuxph+ZmgsdM8VCu307k
         tmhrxO1oG1e+w/4hyZ6Ud9SdRj115FIITvIBsaPcDLeMdEK+aS7tbDqS1gS17iu15ZS2
         BZWQ9q5TQG5lqEsGNzgarTjLkRfnbGWhJS+JjuikigvnXaWlmFmsbrfn6zsueGVot2Ku
         7UCBncNE+6FrCKh4pXpseqyJlnyRvNpGZFQJZn9+ViJ1R8CvjlhcR3y9TvMTPwj15ru0
         rvbYjtHGU3NPuxMVzLcf6JKjIAjSkWH447be3olfzIqcj1wL3qkztQ9Wu8cowbpBy4V2
         Zo/w==
X-Forwarded-Encrypted: i=1; AL+hErEe2AbXixDNVJ+r79Kr5Oc25pWnnU4WeDBT3uPFJw81G03LePXzDmepgo7lSyhhE03xlN84MAatlbQoJKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C9YhLKa4mqDpG6guA2Fhu+hzHCSkCEmSBltMq8AMzM60HSe+k
	QbFondMESzM8WLTRRRbpj/mUM9vtdYPMsRbv3zw4cfdn5hpQ+ccXEa2AHZQHK9QrgUY=
X-Gm-Gg: AYBFou3N7nLBNDSKOy7Sav4bDBU+AQzhx7KldJP9AznlAG0gxdo5mv//mPBe52DGhdP
	t4RyqbarLlAV9vTy5UTgcGgzqiylslM/zkTLlODKxfeUJfZFQn6Ps+4O+yjJpTW968NHmUOowPj
	UVSlGrhamTtfBgU+QZLbbdtbYpvNBMhCNdWuuJUgfdpBIq/9efrlnrIFzqLJ7t9t/LbRhzPNMuc
	dY7bgIdWP8sUiBd/sGfYXI3RUdNuVSWtt/oO9/yPuc58SGnlPAUiRlsNco2fIYvUFfVwdumCQdz
	HPjLCLP+AL2hc6EcCd7NrIwf9t7HwAyfQTgkfeeSyxvAPfdpUGDzEuNj3hbA8/MBBMxC0MSHkCb
	IIka4F/vWmwdoZtWs9PPyIQyjAmw+n3WWZqg9ui7JFLzmJS5C7H/RhFkY4il/2P7zC6/ES40L6p
	3h7fk0Tm7NSA2WfxbCj/oD3gy++r5C9ZHKbk04NyVDMpUE0KWnuZO5NB4bAXcwKHUMLML98z8g5
	9D07vP9R3R+P9oRmYtzQKtSe8mAg3+ZObFTXB4cl0PwSPd7MdsM3XcnQJs0BSt+iEnCho/7nhSi
	aM08/ylwEQ2fgkI08pkZ/19+8CkTr2AD+6ACjsulfbRsROJxkXZSE1tvvTd5+rcp/eawZk+WK5x
	gsuPYvOU=
X-Received: by 2002:a05:7023:884:b0:196:bf5f:8bb with SMTP id a92af1059eb24-1b39fecb7a4mr5891979c88.45.1794218296778;
        Mon, 09 Nov 2026 01:58:16 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:16 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH 00/11] mm: Unify memmap initialization for compound pages
Date: Mon,  9 Nov 2026 17:57:55 +0800
Message-ID: <20261109095807.41547-1-songmuchun@bytedance.com>
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

This series is based on the mm-new branch at commit b95f8bb86713.

This series is split out from the earlier, larger series
"mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
generalized vmemmap optimization across HugeTLB and device DAX. One
remaining piece is the separate compound struct page initialization used
by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.

The prerequisite changes already let both users derive their HVO layout
from sparsemem section metadata and use the common sparse-vmemmap
population path. Their post-population initialization still differs,
however. memmap_init_zone_device() builds compound pages from reusable
templates, whereas boot-time HugeTLB retains separate HVO fallback,
compound-page, and pageblock migratetype handling.

This series consolidates those paths in three stages.

The first four patches make the generic memmap initialization code
suitable for sharing. They add zone-consistency verification to template
copies, factor the PFN-independent page state, simplify the ZONE_DEVICE
template setup, and introduce a helper for initializing frozen compound
pages.

The next four patches simplify boot-time gigantic HugeTLB initialization.
They make it rely solely on section-based HVO, mark the entire gigantic
allocation as noinit so HugeTLB owns its memmap setup, and switch the
retained struct pages to the common frozen compound-page helper. With the
last external user gone, __init_single_page() becomes local to mm_init.c.

The final three patches move initialization of early-reserved CMA
pageblocks into cma_activate_area() and localize the CMA helper. This
allows MIGRATE_MOVABLE initialization to move into the shared memmap
helpers. CMA later overrides those pageblocks to MIGRATE_CMA during
activation, while non-CMA HugeTLB and ZONE_DEVICE users retain the
default migratetype.

After this series, boot-time HugeTLB and compound ZONE_DEVICE ranges,
including device DAX, use the same helpers for frozen compound-page and
pageblock initialization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (11):
  mm/mm_init: verify zones for template-initialized pages
  mm/mm_init: factor out common struct page initialization
  mm/mm_init: simplify zone device page initialization
  mm/mm_init: factor out frozen compound page initialization
  mm/hugetlb: drop boot-time HVO handling for gigantic folios
  mm/hugetlb: initialize all struct pages for bootmem hugepages
  mm/hugetlb: use common compound page initialization helper
  mm/mm_init: make __init_single_page() static
  mm/cma: centralize CMA pageblock initialization
  mm/cma: localize init_cma_pageblock() to cma.c
  mm/mm_init: move pageblock migratetype init to memmap helpers

 include/linux/mm.h   |   8 --
 mm/cma.c             |  24 +++--
 mm/hugetlb.c         | 111 ++-------------------
 mm/hugetlb_vmemmap.c |  17 +---
 mm/mm_init.c         | 232 ++++++++++++++++---------------------------
 mm/mm_init.h         |  14 +--
 mm/sparse-vmemmap.c  |   7 +-
 7 files changed, 120 insertions(+), 293 deletions(-)


base-commit: b95f8bb86713c860ce8536d22a988b949b884d5f
-- 
2.54.0

