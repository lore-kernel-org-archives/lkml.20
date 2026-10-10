Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006936F415
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619105; cv=none; b=HdGtChfOthBxgIi0qoMd0SvF2BvUmI+bZZP9fvEc2C99Y5QYxlbLxN4X72Cl5DudhaIJnGWpb/nfdPietVRjlgiJkFqQWlaZR1fGtVL3EVKJp0yu5ec1efdtW0iyNGLyWWUHoyGPyoFQxCZpN5/2wv/rV/Arqt35jjSL/mqpyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619105; c=relaxed/simple;
	bh=Ca7meZEZc6wn3GCFMCTjH1r6hQe3n5prEMHd5wSlR+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jcad1KOo/rhinXYE6CWv0ecvIGa2su87sAJiYm3pR7BH498quG3APZMdqGhH+EyK2wOqgr/npuT2TyVURfmFMhJIgAwqKlp1TUJP1rbe+n1wjAgjqDZPdI5Mx0SixtPnB0OBX1SIygn8bWg8LI3aEhyLqHuXV9jX9/5xyvpSdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KZLCswTa; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KZLCswTa"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c9879395so109834a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619103; x=1792223903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s931g07PMq4Bu75kY5DuvEAvn6osmlRZp6J1l7oOErg=;
        b=KZLCswTarOgzJDS3nI8/1o1kdn9zw1WCWhjfD5QJKCgVP5kJ/rbEJsbDN2VORv9yz6
         e/IRO2DF76bpmkKIQZNdInXnqx868IFtZrZ86dU2suzTcifwgQi1eDxEPaL+CClYZq09
         84n5WfRh+emhUoqqool1iE3LSnmmnV3USb4Qe/uh5TEtmvLYValsZh/x2WzIvuA9zqCn
         vUrSsYOPu9vxnZ12nNHdZtvruL6QWQIZ8ZsEVapqnWskQcYnsGI1o9RU1Woswl0BjUlb
         75fQW7Y5Brg1ysr513raUkD8n1a/hYZNanlosC0E2SWQPCJIDg28wtKmfkL+/keQLh49
         CKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619103; x=1792223903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s931g07PMq4Bu75kY5DuvEAvn6osmlRZp6J1l7oOErg=;
        b=O/NMCcINeMomm4xqqz0AmjUJWmsftJs0PTgkYtNMaLEP4O0ps4tw5ObCLgPs+pdCEh
         TRs8qu4O2tc15ie8XfdY5EpdwD+HqzhKKcPR4H9zi8at/KpMFW+EYFyWQxEmnSXJuxFk
         JMSSmrDhaGFokc5gW3SJ9iHHIDMpOBFxwj9OjTz1bo3orT3V4z56S+wyrAztm6yJvyqQ
         qAhtm7eMgdsQJpaHtQXve22CRRLxOG8cdvOs9FB3oMaBV9G0s0vfUCDRN3JhQaVoJCiE
         p8mlH0R3BMUjdJNg9/yx3cpKaePokorvxGrU1bysxV7OgKl4vZU3U4xay4HuZDhhHbOs
         6W6w==
X-Forwarded-Encrypted: i=1; AKwUvByyar/QG/DB6d6OtE7Jwl06rVU350GvrO4QADCNVKeSvHCP4I27rdM9JyGaCZ+/nJv7Qfzcixl/f4ej80s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk+oBMJeFiJjvuUn99pfoLvw+WHr0gA8OjuEPR3nKUO9uGzz4J
	Ibero5FoLAw28njauMLOlW5nmvDMe+KAaC4NPwBe9O1o0BtgKEICpyiFvKV+1ezH9FY=
X-Gm-Gg: AYBFou0no00eXkL8XHv9J/9F/ztXOgNNhYnXGPs/pQzEyQAyJ6GghVF0wVUsAsYqwUE
	qHsNTJQaa0KWsPXbpfLTPV9aFP4j/LBrb0m8WY1YiwsuewITdNWx20eTbHUtM8CEP5O8WTXL7Xc
	D2wbzpziDUlDNBRXdd3/VbzV3YwceYt7rNDfIVvJSHAN2tNNHxK94SnwMr0r/mtPqtgDxFZCWDH
	dBDLRJY0cOWp5WhbsEQtFGiMO2BQi2bYCcS4CoLaE5YVe/Mrrl7+veA95F+iPlErnIfjJAgsqHE
	hUWMREJZw4wDq1+kSTzkgJo7Gyig7oxYAbwKYZls4JmO7G20BLr3gx/WA0c96+Jz1qJMe5sdY1k
	6H41qm8QtC3XMOWgDpVOLdSeub6qLIq5TFrS0mTOvDO6IirZxR4H+2aeav2p/fLjfFBwrTD9tgj
	y56k2g20fGwxWB1UqiH1IzShejPN/Z35mWeiJPqH/rYc3Owu+DCEM+8YGRs6GhBSwHqGc5B906t
	eIhkhmxkLELv38a/7tLY+/xt9errpvPTTozew==
X-Received: by 2002:a17:90b:4b:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ab3ab5e193mr3041362a91.20.1791619102741;
        Sat, 10 Oct 2026 00:58:22 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.58.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:58:21 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 0/6] mm: Unify device DAX and HugeTLB vmemmap population paths
Date: Sat, 10 Oct 2026 15:57:49 +0800
Message-ID: <20261010075755.83339-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v4 is based on mm-new commit d5207c6d152c, which contains v6 of
"mm: Switch device DAX to section-based vmemmap optimization" [1].

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [2]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: unifying their vmemmap population paths.

After the preceding Device DAX conversion, both HugeTLB and Device DAX
describe optimized vmemmap mappings through memory-section metadata and
use per-zone shared tail vmemmap pages. The generic code, however, still
carries a Device DAX-specific population flag and compound-page population
path, along with arguments and helpers needed only by that path.

This series first removes VMEMMAP_POPULATE_DAX and moves selection and
reference handling for the shared tail page into the common vmemmap
population path. It then removes the generic Device DAX-specific
compound-page population path and routes section vmemmap population
through vmemmap_populate(). The powerpc radix path continues to use its
architecture-specific compound-page population implementation for
optimizable sections.

The remaining patches remove the unused ptpfn argument, open-code
vmemmap_populate_address() now that no caller needs its returned PTE, and
add a warning for inconsistent zone initialization of shared tail vmemmap
pages.

This is the fourth smaller step toward the broader HVO generalization.
After this series, HugeTLB and Device DAX use the same population model
instead of parallel generic paths, while powerpc keeps its
architecture-specific implementation.

[1] https://lore.kernel.org/20260930140627.57431-1-songmuchun@bytedance.com/
[2] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v4:
- Rebase onto mm-new commit d5207c6d152c, which contains v6 of the Device
  DAX section-based vmemmap series.
- Factor the zone mismatch check into a local helper as suggested by Mike
  Rapoport.
- Collect Reviewed-by tags from Lance Yang.

v3: https://lore.kernel.org/20260929053231.66085-1-songmuchun@bytedance.com/
- Rebase onto mm-new commit 2ddb90ee544a, which contains v5 of the Device
  DAX section-based vmemmap series.
- Document the exact dependency order as suggested by David Hildenbrand
  and Ritesh Harjani.
- Use the public order-based optimization predicate in the powerpc path.
- Collect Acked-by tags from Qi Zheng.

v2: https://lore.kernel.org/20260924075259.2013039-1-songmuchun@bytedance.com/
- Expand the comments around the slab initialization boundary as suggested
  by Qi Zheng.
- Collect Acked-by tags from Qi Zheng.
- Defer the patch making vmemmap_populate_compound_pages() static to a
  follow-up series that cleans up the powerpc vmemmap population code.
- Add a new patch to warn about mismatched zone IDs between a page and its
  shared tail vmemmap page.

v1: https://lore.kernel.org/20260913083734.86802-1-songmuchun@bytedance.com/

Muchun Song (6):
  mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
  mm/sparse-vmemmap: support device DAX in common vmemmap path
  mm/sparse-vmemmap: drop Device DAX-specific population path
  mm/sparse-vmemmap: remove the unused ptpfn argument
  mm/sparse-vmemmap: open-code vmemmap_populate_address()
  mm/mm_init: add zone mismatch warning during page init

 arch/powerpc/mm/book3s64/radix_pgtable.c |   3 +
 mm/mm_init.c                             |  12 +-
 mm/sparse-vmemmap.c                      | 208 ++++++-----------------
 3 files changed, 70 insertions(+), 153 deletions(-)


base-commit: d5207c6d152c88761f604ca461e67d6b0fe7402e
-- 
2.54.0

