Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A73C13EE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197849; cv=none; b=gB21yIkZHe1eLT7LwB+dYyMNkPbX20xo2uexD+S1lnBjbfOCGpha3Ll8ud5w5rX5E7eUP2P33kzJy8ayI9uPwOkVkJ6nICF3YvkADIFwFQasEysN931gas8wcOll6xcejD/OW7LScKSZEnHjpn9pZfZ12IZoCSp8P23QeGcZY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197849; c=relaxed/simple;
	bh=LUJlYppbUBKfJ7aCkQqSHCPJwDtO96BDWmS7dxvVrkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kf34Q/jQikyrhlSy5I2vww5+6W27UiHw2elJyticTNj5zu7rcaPY8C5f9WGsR3V0tcxsyiAaUgRfzGh3cFqESTMkN97x4/B0/EGYZZg0ur2dnAyncKmZwFPpHdNDjvoYL0PrbMIcP11SrJFRM5KZ0rjoshRPKraKq280jLqE54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ING62pT4; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ING62pT4"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c8so170488785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790197843; x=1790802643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zkKoYk37zs7WcKh+6sHfyUj3HAIw43ESyu1nLCkyq7Q=;
        b=ING62pT405vyCsMmsYdswLF/hwhXIVs/ODkuMGocZhfYIaWO9jbYUHM2pT74Rwq2ao
         bqEIv27ugRB6ROqIV3sP3cPe0/kesPgMOE2XCSwDWZKx0nckm9rD3T7v1st9+/cLqYgX
         blx/vN0uy8zlG+3nqES53o60f9T4Bh4AociL04dkmt/svWO6kCe3vorKS6Yn2CnQxeF1
         Q6vQA7wmMdPGtfigxYRxA8jlFmakvQHaq1yKS2VJ6h4O1nNYBJchClDcdf/LTc2W40wP
         mM6TTiKaSSnUKjJknrSBkev99PLs/SVeetiY+77bkiqnYREFRMfHuUa3oogjWYTiz5Uj
         pwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197843; x=1790802643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkKoYk37zs7WcKh+6sHfyUj3HAIw43ESyu1nLCkyq7Q=;
        b=p5guQuXG2hniyo+x4nJl3+oRXjl3iTDWk7tFszWZ420mqcvHBTx4El9TJ3JKHRfWJj
         NL9lb8zC6hEhlvO+in1tpOjGNjnf7atUbLNhjHeCzv3aScrD+d2KRMZSv3bW+4NkrvNk
         mf4CBTW30zuGR/esKEcabyjxzAFf0hfTeZR/w3NMBp+Z5oe4AgE9inqCMS1UM/HDkVXl
         05qIV1qHIPBSK+5/j2JQT6u4V7ObH0DaFlAbWZqkHUsf1VNzxgLvgWZV7OXwIYTXftYW
         P8sZza/VQX8MVMZ0pLJLvVJP1EnCTjPMpusi9q9XMmvE0nm93czZMDvQy8OKxdy3Ae7T
         sRZA==
X-Gm-Message-State: AFuF++ku+qQBdOQY9Y9Gcm7KOJqrsQkGHRqEcTPFkyalAzQ6DdxZHMQR
	14SQtaECZBBkdZgj44beCMuJG64zE4yL/t76SGLPFiL8Trn2tvhyihhXQwgJc5eLkLU=
X-Gm-Gg: AYBFou1YLV4+vyXf9uOGL62g/EslZQ0uVnWVaogIGWsYshe1AseUj49mBVsWlzqe8TG
	SG3hMW8nZWtKr5j9xyxm9KUSAvOYi+wHl9uSUp/KSXYUc+l91gU7XPRhDjapVDhg+EiyoowrFHf
	KTgTs+0K0y08lJ1R8OTJ4PsSuxhDYRcNu9WS22BOBO1aqAigQFja9hucnKX9Q8aR5yaNgyHo5V+
	EG2KbVOD+cFQKXYqi0HWG5iYQSXYyX9p/k519UPklAnE2AL5AP1NHQVPuGtvJg8jCZzfkBxH767
	PQbRg4P+gg01+cYbg8MBJZ3jzpZyx7Dpqibkl1TqyW7IkMfSvvhtbiOODcDbvsTfUAhsQWeP4zo
	CwiinqKP8qaktVfywVN8q0cHiq4N8uO2XC9ndMuYhtc+vnUFIwiPegmYUV4uW2sNj7k/1tiObiC
	h15HBf0ZtYAd1idCoj3v6Hy69c5UbwIjBty+CxtuOvo0b8HriVHfX4cTU9EFoW7SAtuYnfANn1N
	57kx6frhe7vGtR8CENkxZVfBOhkvoD0RuysR0PI3i4hygiXoHg+PRF9krPc
X-Received: by 2002:a05:620a:271a:b0:93b:d8b3:f9ca with SMTP id af79cd13be357-93c347d1b8emr57822685a.21.1790197843026;
        Wed, 23 Sep 2026 14:10:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485926esm305893085a.19.2026.09.23.14.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:10:42 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org
Subject: [RFC PATCH 0/6] mm: pass alloc_flags through folio, filemap, and bulk allocators
Date: Wed, 23 Sep 2026 17:10:34 -0400
Message-ID: <20260923211041.3127588-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The folio, filemap, and bulk allocation interfaces currently hard-code
ALLOC_DEFAULT before reaching the page allocator. Multiple MM series
need to select allocator behavior through these paths, so pulling these
changes out ahead helps both series avoid conflicts.

This six-patch series first separates allocator behavior flags from
the bulk allocator fast-path flags and shares their validation and
preparation. It then passes alloc_flags through the MM-internal folio,
NUMA policy, filemap, and bulk helpers.

The existing exported folio, node, filemap, and bulk interfaces remain
ALLOC_DEFAULT wrappers.

Non-task ALLOC_NOLOCK folio allocations bypass task mempolicy and
cpuset-spread selection because those paths are not safe in all
interrupt contexts.

Existing callers retain their current behavior.

The allocator changes were built for x86-64 with DEBUG_VM,
DEBUG_VM_PGFLAGS, DEBUG_PAGEALLOC, PAGE_OWNER, PAGE_TABLE_CHECK,
PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, and memory allocation profiling enabled.

Testing under virtme-ng/QEMU used a four-CPU guest:

- test_vmalloc vm_map_ram passed 50/50 64-page batches and 100/100 one-page
  fallbacks.
- With page_owner=on, all 25 runs produced the expected partial batch because
  page owner deliberately uses the one-page fallback.
- The alloc_tag ioctl selftest passed 4/4 tests.
- The migration selftest passed 6/6 tests.
- The page-fragment smoke, aligned, and nonaligned tests passed 3/3.
- khugepaged -s 2 passed 22 non-swap tests. Its four swap-dependent tests
  reported failure because the guest had no swap configured.

No BUG, WARNING, lockdep, or atomic-sleep diagnostics were reported.

Cc: Vlastimil Babka <vbabka@kernel.org>

Brendan Jackman (3):
  mm/page_alloc: add an alloc_flags-aware folio allocator
  mm/mempolicy: plumb alloc_flags through folio allocation
  mm/filemap: plumb alloc_flags through folio allocation

Gregory Price (3):
  mm/page_alloc: clarify bulk allocator flag scope
  mm/page_alloc: refactor alloc_flags preparation
  mm/page_alloc: let the bulk allocator carry alloc_flags

 mm/filemap.c    |  45 ++++++++--
 mm/mempolicy.c  |  44 +++++++---
 mm/mempolicy.h  |  28 +++++++
 mm/page_alloc.c | 217 ++++++++++++++++++++++++++++--------------------
 mm/page_alloc.h |  10 +++
 5 files changed, 236 insertions(+), 108 deletions(-)
 create mode 100644 mm/mempolicy.h

-- 
2.55.0

