Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727C380FD3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659989; cv=none; b=jojesHNxXqbBSkzCoIJ1BjagrjZ9LIjUnCXQDGD3rbH5j45H/v2w1IBzIDyb8tHpjie2dkk5mqfwfnBQbHwjeRwYkojUnuIZjIq0YvajbbPBAbCHRz67UUnuW8UvyW22kOq/46tFCVGrSoF3GUrb3io6aoyifi9ictE7wpaEmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659989; c=relaxed/simple;
	bh=XdU3QW31aMU0BKOfDRMFEFk5yfg7WrYFCqv6Cchb4hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ft5VLPEt5TUetyV5xRHwMlYtncj2+F8IvH3bm1Q8TQ/7tWZBMp4HSedSBX1tBLAOTvKzut4havZmZ46YvTnymLlVnPILGtLe5wb9mysJSqBpr9S4zuctEsrYGgv2RVXpMlCuwxJL6keEsn/AEDzuWEFBEZHRoAvDikGavRtvW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FmWU4jWE; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FmWU4jWE"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so14532855ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790659987; x=1791264787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=utwCr7dhiJhH+7zfFzlq+sGzsmDUrkDOgCiJgBfnXiw=;
        b=FmWU4jWE97VSen/qdHOTE+m22H69YDbh634OuQ3oeB4tNjAAZnSKfVDiF2yZ1FMKK3
         ZCKJ4JhsC3i5zdgQ//1WW0mFXmX3Hm5zUbmkl3rF3bv5Ty0d2t4yD4Z1/DAhTk96TEOY
         0tLbJtNMC5EYvWI633+YY7eQ5ikOqPtpUwFEJVtUpQWf4Q+YQibziqmKjAROAc717wU/
         ZbLOIkBwPrAUBCie3qrbyouuq+ehAkR8R0GyST/iovSQZMxIuI0KEVwzJUzkSXaWzXz+
         i+5XdoQOMTAt2blp4uUi4JaKcpjKXWGSqwvHPtgtbk0dAYIrsinCBSpK6uovdCeOjjIm
         Jtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659987; x=1791264787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utwCr7dhiJhH+7zfFzlq+sGzsmDUrkDOgCiJgBfnXiw=;
        b=qGf5eSHvqbTMLpdRLvdo4fCVjN1ALBb1ZHcnZuFlDhRrUqmJ7EpgkXV8PMAJ14R2uU
         HvEWPpXiJfgLEUGIulMqyjJ0iKIEhrVrBcpPHVDazwhpb0W8zBsyb3zGzQn/mZmkF0Q6
         yeKhVW0eqbhuH3IV9sWQ7qCgyZ9+BV4cNZiCoO/yGN8zggAjZhaKaaeKPv+D/V2WHWwS
         CvdlEmcU/fKpfS0tvaAiMaXQtYvE/aduoUJ+ycZ56f9EwaNhQL+874vUzKE2VdmQcTQ0
         AzcM4gjdHuZhJUOzLSwsZfDG7ab8wtDXl/Gv8Ud+alutV74w4/K39xp8zexD77/xGoJx
         MFnA==
X-Forwarded-Encrypted: i=1; AKwUvBwbjQZ5F/tix9rFOc7gJuU40NcAowLl+UxO5XAvhbX6m4Ma1j6lQd0msbWR3q0Z90jb6/YEUKf8Caltb10=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh1WsOI494g+3A72vBPtptSglQCg2Jkwf+mOVTZT7bBTVbKpCy
	uxDUTEnl0Ha0jiQoDI+6GnTcAC2KpOqIUMiR4S1sfBnIlNRhwjh774INaFx3BhNqbEc=
X-Gm-Gg: AYBFou2ukDMz5hnlj62WkK4ZlL5w01wZts8TNjwXjHMglrxwRTJwaT/4SR+wxMKx7lA
	vXtjkS8cZcMB4gpgy8/3P0Tc6MnBgRa/ibccWL5Rm1YTCa5vJYBpjslz8HV4FM5eNL27JmwffNW
	AE9xr3K7KXw6CqfojqTgtNlg+SWtQDQVpNJlsVQRv1KRhlL7RgfdwjXkS35CcC6A+/s9+Ncq59X
	m/RDYmyCkWISw8QwhLBJZ8DV8UztMg9pkMoUoJ19YFg7P9puB8GzMb6ejQRcqfL0B/bW52tZpuo
	9MNFCx9G2bD15om+WhoI/N4NqDS3/rJ7wOSk4h3YtN3Fv3UcU6pY6ZfqN2XEa1+TgfqtCSH7ofK
	kpQPqFKF8Z/o/Mkxx62ecRShcQzzB0iLNBcRJd3I868/3mlP7ukDPKlFKXb0tbqEF0/QI3rviay
	28D31bIg6QYDePl3eT2n7UmPS/tkPowG5tyJk3iZOmMEhoM+X1cjRz1ad6MzsoIb8E0MhShMp8m
	wFadQwt70lfFWw07hg=
X-Received: by 2002:a17:903:1447:b0:2dd:c0ff:e737 with SMTP id d9443c01a7336-2df7e11e8d9mr118705625ad.73.1790659986929;
        Mon, 28 Sep 2026 22:33:06 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.32.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:06 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 0/6] mm: Unify device DAX and HugeTLB vmemmap population paths
Date: Tue, 29 Sep 2026 13:32:25 +0800
Message-ID: <20260929053231.66085-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v3 is based on mm-new commit 2ddb90ee544a, which contains v5 of
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

[1] https://lore.kernel.org/20260927025441.741633-1-songmuchun@bytedance.com/
[2] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v3:
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
 mm/mm_init.c                             |   5 +-
 mm/sparse-vmemmap.c                      | 208 ++++++-----------------
 3 files changed, 63 insertions(+), 153 deletions(-)


base-commit: 2ddb90ee544ae97215afc4698dc223293997cc43
-- 
2.54.0

