Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187213;
	b=5ZLPvkPzJCb6dyPFv0dpZnhJ/1KcNq+D8E9es4+ecEyawWWeF2SNgTa3LERE7MY5E+Ha
	 oSHLdKVsCWA6ezcd7FTcen5hiBGHmyyweMQel9d3jUpeIlkf7F3E32UToSPUF4gFP5/U8
	 +s0AfiOPlv0fC+tYfYuonIZMWXf9s7QAj2J7JyVXVsZZfS480acKp146EDFT9QLSZaz4h
	 4hBb4IDbC6snKZ8/+17msale5DonMfmU4CJmPlxWwY9BFkuOwAI0nPfoLyvis2S5CYOIP
	 ferDuKS0Q4emj0DBi+52iGPXdwPNpgmbVRWi1+PsY/mfqoJTvQaL/aDr+FZNi9xdAmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187213;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=I8Qx+rwY6H3jQ6L89yvvvHh+9fiYuKQUWmXchJSlClg=;
	b=zhI1W+q2qHAaJbaeDW2Qapl+N6HKkeoRQXC74PpAVzZZc0G+SKyNw5S8A2IjMzgDvU5j
	 mE2WtddKV/vIFej3msYbKCDbIA3+0FpRKsDX50BTVh6MFMiwWTGXkbdlsAa9MorEw2MH7
	 0pdxwOkqheupIRJhCSG0z9r1mxIh2EDYPUKhFcggV4HY/gVnGfazHMk6P6Ld4pMmbGlvR
	 gV2P24ihE7+menkwKZMVDEgAep0x8juLhengsFAQwc1Jq2pGmmRLk+IwjNa+3Lj9GQxvP
	 d/gOsOLZZewZ18JR1MOW+dj2Kvax6koASOXIz1siUKajwO921RL1b1E7SNvMyXhlahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dcYKIC6l;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B3606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dcYKIC6l
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uj6DpQ+dYHugok4ARQkYXSn+IV5soWPeKjdz94Jwpd0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187209; v=1; x=1793792009;
 b=dcYKIC6lUcS1vobgg/rKKtcTKJh2je3fA4ESE5C9StvQp4g1Q5nDtijXXaa3vuKczCjMUXjK
 4nEfNccXRaZbNCV8gPRGC7Gj6CmDVYzgXNWnBLDZgEO8JyIvM+W4Trv9jMDPJPczdnN2H2OwMWR
 OMHD3l4lkrbm7KnTFyb4v6Yc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 33cbc6c67f81e8a8;
	Wed, 28 Oct 2026 11:33:29 +0000
X-Mizu-Trace-ID: 33cbc6c67f81e8a8
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH 0/3] Subject: mm/hugetlb: fix CMA handling and surplus allocation accounting
Date: Wed, 28 Oct 2026 19:33:16 +0800
Message-ID: <20261028113319.38544-1-kaitao.cheng@linux.dev>
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

This series fixes three independent HugeTLB issues reported by Sashiko,
covering CMA parameter parsing, CMA allocation state preservation, and
NR_HUGETLB accounting on allocation rollback.

Patch 1 rejects a global hugetlb_cma size following node-specific entries.
This prevents malformed input from overwriting valid per-node reservations
with an incorrectly parsed global size.

Patch 2 preserves the CMA flag when a folio is returned to the HugeTLB
pool after vmemmap restoration fails. This ensures that a subsequent free
releases the CMA allocation correctly instead of leaving its bitmap set.

Patch 3 fixes NR_HUGETLB accounting when unused surplus folios are freed
during allocation or reservation cleanup.

Kaitao Cheng (3):
  mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed
    input
  mm/hugetlb: preserve CMA flag when returning folios to the pool
  mm/hugetlb: fix NR_HUGETLB accounting for unused surplus folios

 mm/hugetlb.c     | 13 +++++++++++--
 mm/hugetlb_cma.c |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0

