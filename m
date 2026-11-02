Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587776;
	b=dvrMWnl5000LuEz6146ZN1pgeVqIC/Jr8/49RzmCYBs8eHD4OuY5OVfyijjnR5rgVDfI
	 EOk04MLgmrkqllyG33Ig+ApsD5CI9qHqWclWDhbB2jEkkST94/beiyE0Y4p38jGi3KDYL
	 VfdfT9CbNLwixZeW3LEkwTwYpLfEHYn1Ih4LK9jLLovbgvOV1oUckEGRjqrEcIEJ6r1oT
	 31PaWqiNTTX1k0Hhemzhi+DlrYxq33aK06gAdTJ4DcMGBgoH+eCCQ8Qh+vGGGb2pAp3f6
	 wOjFklNPZkdigwZXv6kep85wlKALpnxmvbtTZ3ziIsbpUlka96CPMEwj1M1UKYW5Z2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587776;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K2Pl66GiCtSnRt14sAo6wYdJhq6b9lHCX2PYrIZzXQc=;
	b=WOwMioR7QKYdUsEcZAsUxae2RhngjjggwBuneROQ4J+eMFL2unVOaTa6ws0pd+zxLvaE
	 VAxsOCAX6bSY9864n/sYZyl5If4ZIcY6LhuHfHMsBy4hRv+FmIqTzsJfQduWCv0woVjYa
	 dvilidhtPYYfOFrFue8FF0MPZaf9P9UhtssQIu3FLlqkgWYQX+jwavf9YBDlu0Ar6UDAD
	 fFRNnXuxc0lThz2B0lyN5oHkl4H2NyubxVEmmOJuF7nbqUMU61YzAl/Ifm824+zbRrEXs
	 V0y1988mEoGOv/1mD/eICn6THGkONCXGu6yp/lAfqgswPw96XuKf6CUJNUDXnBqmSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Y7NMm/hy";
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y7NMm/hy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iz3xRoZLABnzuJqgORKF3hs5vSDtn7j2yh2I+RtFt4k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793587772; v=1; x=1794192572;
 b=Y7NMm/hy6+FZSncn4IkWDmJKlBOJCTZruBIb9D5QQKe3qNhZwkkYwzfjAJnZfT/VIpnvXClF
 Efda/uTm5JGWk1GKAvG3oK0pon11f5l2ni1rEO48LiKR/+XXOwRzv7vJ6Qj1wwKCjx9bZaBGJpA
 c1A6HCkXed0az8kA2oukQ7MA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 544bc17d499f049c;
	Mon, 02 Nov 2026 02:49:32 +0000
X-Mizu-Trace-ID: 544bc17d499f049c
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
	Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: [PATCH v2 0/3] mm/hugetlb: Fix CMA parsing, flags and usage accounting
Date: Mon,  2 Nov 2026 10:49:07 +0800
Message-ID: <20261102024910.31486-1-kaitao.cheng@linux.dev>
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

This series fixes three independent HugeTLB issues reported by Sashiko,
covering CMA parameter parsing, persistent folio flags, and NR_HUGETLB
accounting on allocation rollback.

Patch 1 rejects a global hugetlb_cma size following node-specific entries.
This prevents malformed input from overwriting valid per-node reservations
with an incorrectly parsed global size.

Patch 2 preserves persistent folio flags when a failed vmemmap restore
returns a folio to the pool. This retains CMA allocation tracking and
raw hardware poison information, while ensuring transient flags are
cleared before returning the folio.

Patch 3 moves NR_HUGETLB node accounting to the underlying folio state
transitions and separates it from memcg statistics. This keeps the
counter balanced when surplus folios are freed during reservation
gathering or after a failed overcommit recheck.


Changes in v2:
- Patch 2: Preserve persistent flags, clear transient flags, and warn
  about unexpected flags.
- Patch 3: Account at folio state transitions and separate node and
  memcg statistics.

Link to v1:
https://lore.kernel.org/all/20261028113319.38544-1-kaitao.cheng@linux.dev/

Kaitao Cheng (3):
  mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed
    input
  mm/hugetlb: Preserve persistent flags when returning folios to the
    pool
  mm/hugetlb: Fix NR_HUGETLB accounting for surplus folios

 mm/hugetlb.c     | 52 +++++++++++++++++++++++++++++++-----------------
 mm/hugetlb_cma.c |  3 +++
 mm/memcontrol.c  |  6 +-----
 3 files changed, 38 insertions(+), 23 deletions(-)

-- 
2.54.0 (Apple Git-157)

