Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959554;
	b=b+EuazTlAEwZGpm/gMyxpGoKaOJzlKCZ8sXILxU+9mqoUQvkHbw1gzZ4K7kaV6YVFXcY
	 GkZaEV3ZpWsvqgHOYbRwifzFiZ3srXtEiSYu6cn37JPqQ9+MPFnLKO0PswopVztNw3nLw
	 i73X7v6VxGpMFYx2Ttcj6myiam0WvEKQAoNiM3A407efnOKsZ0f7JVnYyr+ZbJ364mbjd
	 7Fh6RiaGc6k0Jv+luuomMO3UeXyvlxh9IM8MqJBxuHpqohqGkl3NdzafseiKwdXlzKszP
	 434rBXR0DVDV0HQL5Kih8eExWC0drpHC2qH0popINzxZbjZCPyNiJE/fNOjqXFx5K5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959554;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3ZdWxtf70irIWN0cdRiIhxuODBDNKO9FqOy4Rvd9tt8=;
	b=FvzCLBRAmAV9Bs2alGmI7EXWpO7lI6On0p6wBw/c0RqsMbnjogLtKjc4uA0o253ANRE/
	 B0pLtnPi1mWWg8VxZO8pKvZBO3qB8aVjMuB4ZnY2xz9rxjqRDHF2Aa4AwfdTd+Lk3XWLU
	 Hx7+tBNov3HQR7xodnQ79m9NFOrNYsgsffbuzIxn8XRRYwvtImiy6RhBl6x586k8mUflS
	 Glr6//Lq88XmfbtSg/hB+EQMJgxdJTaRgOBRHlTf6HATTY85uNXxRaCyR2LBxlF7WUncG
	 HFNI7Gv8dOQA29XvrUlhmqPMvw3qY0u+3sm8SYpi/mGO36MNdRw9V2RW7B52vWU+D/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r3RaGep5;
	arc=none smtp.remote-ip=91.218.175.104
Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD7606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FD7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r3RaGep5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=boaUt3lXNw1pWwnwHBSwxbjYyF1gcSAqeO7ntekMlU8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793959551; v=1; x=1794564351;
 b=r3RaGep5JhGWK48CC7c+ZdtY9AKSMfoGKGSq3N4YUhR0x1YS1zocXQLHa6VzQXjQRmoLFn5X
 pFIS+p6Jl3AUIu7s5BJ8i5ru6g5hym4Nm2YKi7inFfhzMYN3iU21gmZX9jvvQADCT98Nc3IyNU8
 E2BOGSML7okv9hFyKuz1+5uY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5c9245ec463c574a;
	Fri, 06 Nov 2026 10:05:48 +0000
X-Mizu-Trace-ID: 5c9245ec463c574a
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Mani Tofigh <mt4022@columbia.edu>,
	Zi Yan <ziy@nvidia.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Chris Down <chris@chrisdown.name>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v3 0/4] Subject: [PATCH v3 0/4] mm/hugetlb: Fix CMA parsing, flags and usage accounting
Date: Fri,  6 Nov 2026 18:05:17 +0800
Message-ID: <20261106100521.30099-1-kaitao.cheng@linux.dev>
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

This series fixes three independent HugeTLB issues reported by Sashiko
and includes a follow-up cleanup of NR_HUGETLB accounting.

Patch 1 rejects a global hugetlb_cma size following node-specific entries.
This prevents malformed input from overwriting valid per-node reservations
with an incorrectly parsed global size.

Patch 2 preserves persistent folio flags when a failed vmemmap restore
returns a folio to the pool. This retains CMA allocation tracking and
raw hardware poison information, while ensuring transient flags are
cleared before returning the folio.

Patch 3 retains the minimal NR_HUGETLB accounting fix, as suggested by
Muchun Song, to keep it straightforward to backport. It balances the
counter before freeing unused surplus folios during reservation
gathering or after a failed overcommit recheck.

Patch 4 moves NR_HUGETLB node accounting to the underlying folio state
transitions and separates it from memcg statistics. This cleans up
the accounting in the allocation and surplus cleanup paths.

Changes in v3:
- Retain patch 3/3 from v1.
- Fix code alignment.

Changes in v2:
- Patch 2: Preserve persistent flags, clear transient flags, and warn
  about unexpected flags.
- Patch 3: Account at folio state transitions and separate node and
  memcg statistics.

Link to v2:
https://lore.kernel.org/all/20261102024910.31486-1-kaitao.cheng@linux.dev/

Link to v1:
https://lore.kernel.org/all/20261028113319.38544-1-kaitao.cheng@linux.dev/

Kaitao Cheng (4):
  mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed
    input
  mm/hugetlb: Preserve persistent flags when returning folios to the
    pool
  mm/hugetlb: fix NR_HUGETLB accounting for unused surplus folios
  mm/hugetlb: Account NR_HUGETLB at folio state transitions

 mm/hugetlb.c     | 52 +++++++++++++++++++++++++++++++-----------------
 mm/hugetlb_cma.c |  3 +++
 mm/memcontrol.c  |  6 +-----
 3 files changed, 38 insertions(+), 23 deletions(-)

-- 
2.53.0

