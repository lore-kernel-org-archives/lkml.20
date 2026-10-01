Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7F23817E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813666; cv=none; b=G62q0IyWNuKzLnIc67nZ34CIkXYT14qPmjMw/05pgHFcJLOF3d8yDnwISQkAlesXLBXldTrcJjm76JPrMIxPIAYvRmKi6o2z/2+zjeyWNRZUCgrJbMR2IIVa+T5jiVdFfddrMygi23isGQYOuPL0aIzZFWLfgysVBFUn5yy9Qyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813666; c=relaxed/simple;
	bh=0xY+6VLZHBTIJIPrs5qut1gFHQT1jzTKR7Xqi+GEGh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8S2AVVG9rmu5U6yU0CYmRiI29OpoRZtvh+NIzcdCQBhZR0/P2hZ+1au1GsCUQ3h9ifR/y1n+OKR9ZjXZ8DlwNfEnF+1mtn3F4/qF11loSRlYMqg8tu7EMK3I6Aovpp2RlAhqv3myWseoWDTsGOz7gwFLz+6ojQ7l41i55nUDDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOadfI3y; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOadfI3y"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-888148d08d3so211924b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790813664; x=1791418464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMBKydyDXomE0cjnYGxv2IYVxFWQ1Eth8vx/ghbPX5M=;
        b=UOadfI3yqUOuLv9nakbL1E10hRF6sxuhKCJNgLuViFkC+TIvi1u3rMK5dzf9RxsTtQ
         au678tkK8PAeL8YArDCkQf54RAw2pEjJsl7qFf6I9DyZhfQGlzFXJJusH1r+Q6WmEFaP
         ieRtRFefFvhriR4ikKwnWhGgXAk3sJ43uSfCoLV71GuhPc5rsYvGr49cU2qES2T9PiP/
         sz3OgA1K9QGfdV9pz4bjrKbm2T3Wa4kppyaWS0Gq2WA182m0Z4duTS4RFUVTA7BXPRYC
         p/lIRn/leGZFLfNAAwbC06tLmOSrwOSU1pVnZ+b3rQfa6ZKwFFGQgwJAW3OISXTpJAse
         +Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790813664; x=1791418464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMBKydyDXomE0cjnYGxv2IYVxFWQ1Eth8vx/ghbPX5M=;
        b=f+WZP+4VJIjudes2cR1LRIMp3y4QBto6wnB9mRJC0U4g9BWRrad9uYyyo0bF01rGgw
         IAKVIqG7zAMiA+2PJDfphDsIr9aLr45KDXvNj+XjQPKW7hmMuAJ8h4pXGpmYinpYQdGd
         1dgnQbOucd/clGWqJ6S1Slgp+QVsJ4XpSkbhoDjy18wK854qfuG6rKHmaX3RE6PeV5Lf
         mNOqs+9VyEADznDvSnaHHmYMUJisq5BVwrqcRLC+QkiocUb/EBYxM1dhS9YxgHw4ShCa
         /1aQj+P+r63NdTfbqBih2RLz1Rk1q+Xc0/VQgVBML3q+WY8cMRaYhJqVII0xFfsn36TE
         eThA==
X-Forwarded-Encrypted: i=1; AKwUvBwNjf/vggScMD2oLVDaDkyNUgFRIvcIoc1ZRbh/qv6dBOmpi9nolsaVQ9uoaTknEiuR4+J8PoNtFC7VQtg=@vger.kernel.org
X-Gm-Message-State: AFuF++nRw+FCBvIQv2VjnmZAtk9JUFt6O5IDoMDLo1Eu6x0ta/kvHGbd
	QNJVRmKhxvmCqbc5JGqvUK4kSS/NZLperTLPRSmCTLxL0PiVnrjfhkQJ
X-Gm-Gg: AYBFou3bwufI209QF7w36W9xMmOF8xaGZLfRYiZxN0MmK515nWospCbnVCkm8DIwk7U
	fqRHVB/C6xYgeUE9JH/+3z7r9ViU817Jy85IbwKHhMoNlLrd6vPgYH3xE5MbknLzn0eFGSsIkYi
	oATsCcuPDalM7tR3CEaIEK3YyoJHmohIwsuneoCeNNETKBV6zEiAWfntSi5kZofWK3xG7orE15+
	2JOlpRY9zkUg6kABJj946uW3NQiMKMr7KvYybeIIQEtIsp+t2Kgl9UpJE+9KOFcwkubb4od4VH+
	bNqEOnK669HRibY3XE9+IjSxjqN4MHrORGjywqmR/BZSJ1W7B8iUyEJupE1XJpxauKYEdzwk0VM
	7M5zwEyhhXAVFss0baKw4VO+ec5wrm0OQ1ySVo2+HWA7KDJhL6dNz49VeApgoyq2r/D9bAoG3xl
	cXluCN4ie1LOw67sVIpJxMxXZLT8QDrDhvGk8q0WQJ0IryLciMhaM9yU751pMveSOFQgsNzcVZD
	C1MXbQ0MbUhJM0C
X-Received: by 2002:a05:6a00:10d5:b0:881:750f:b142 with SMTP id d2e1a72fcca58-8874c8d3331mr2523937b3a.55.1790813664458;
        Wed, 30 Sep 2026 17:14:24 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm253287b3a.19.2026.09.30.17.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:14:24 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Thu,  1 Oct 2026 08:14:08 +0800
Message-Id: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series improves memory compaction to better serve mTHP (multi-size
THP) allocations, particularly for small orders like order-2 (16KB).
The changes focus on the proactive (kcompactd) compaction path.

Problem:

The current proactive compaction targets COMPACTION_HPAGE_ORDER (order-9,
2MB), which is unfriendly to mTHP in two ways:

1. It migrates folios that already satisfy mTHP allocation needs. For
   example, an order-2 folio is a valid mTHP page, yet compaction still
   moves it around trying to form order-9 blocks. This is unnecessary
   work and wastes energy.

2. Compaction designed for 2MB huge pages is too heavyweight for mTHP.
   mTHP allocations are frequent and only require small contiguous blocks
   (e.g., 4 pages for order-2). A lighter-weight, mTHP-aware compaction
   strategy is needed to reduce overhead and power consumption.

Approach:

This series makes four changes:

1. Generalize the fragmentation score functions to accept an order
   parameter. This is a pure refactor with no functional change; all
   callers still pass COMPACTION_HPAGE_ORDER.

2. Use the highest always-enabled mTHP order as the proactive compaction
   target. Because a fragmentation score for a small order is naturally
   much lower than for order-9 under the same fragmentation state, the
   proactive watermark is scaled down in proportion to the target order;
   otherwise a small order would almost never reach the trigger threshold.

3. During proactive compaction (compact_memory), skip isolating folios
   that already satisfy mTHP requirements, avoiding unnecessary migration
   overhead.

4. For non-costly mTHP orders, restrict proactive compaction to movable
   (and CMA) pageblocks. Unmovable/reclaimable blocks are dominated by
   non-migratable kernel allocations. scanning them wastes cycles because
   a small order can be satisfied from movable blocks alone. Costly orders
   keep scanning all blocks, since they are harder to form and benefit
   from any migratable page available.

Test setup:

x86 host, arm64 cross-build (defconfig + CONFIG_DEBUG_INFO=y,
CONFIG_DEBUG_INFO_DWARF5=y), booted with mem=4G. order-3 (32KB) mTHP is
set to "always"; ext4 root mounted data=journal. The kernel build
naturally fragments order-3 free memory during the run.

Runtime (two defrag modes were tested, see Results):
  echo always > .../hugepages-32kB/enabled
  echo madvise > .../transparent_hugepage/defrag   # or: always
  echo 20 > /proc/sys/vm/compaction_proactiveness

A background loop keeps proactiveness poked every 100ms so kcompactd
re-evaluates promptly (its default 500ms interval is too coarse to catch
the transient order-3 fragmentation peaks under this workload):

  while true; do
      echo 20 > /proc/sys/vm/compaction_proactiveness
      sleep 0.1
  done

Workload: make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- vmlinux -j28
5 rounds per configuration; each round: make clean + drop_caches, then
counter deltas around the build. The baseline is the unmodified kernel.

Results (5-round means). anon_fault_alloc is within 1% between kernels,
so the fallback numbers are directly comparable.

defrag=madvise:
                              w/o patch     w/ patch    change
  --------------------------  -----------  -----------  --------
  anon_fault_alloc             14,307,597   14,401,699    +1%
  anon_fault_fallback              97,701       40,975   -58%
  fallback ratio                    0.68%        0.28%
  compact_isolated              8,479,773    1,458,949   -83%
  compact_migrate_scanned      78,198,828   22,900,359   -71%
  kcompactd cpu (s)                    43            7   -84%
  sys (kernel build)                6m34s        6m34s    ~0%

defrag=always:
                              w/o patch     w/ patch    change
  --------------------------  -----------  -----------  --------
  anon_fault_alloc             14,370,984   14,404,234    ~0%
  anon_fault_fallback                 619          823
  compact_stall                       979          585   -40%
  compact_isolated              6,390,940    2,431,800   -62%
  compact_migrate_scanned      86,171,095   46,339,911   -46%
  kcompactd cpu (s)                    36           13   -62%
  sys (kernel build)                6m34s        6m27s   -1.8%

1. With defrag=madvise, the patch cuts mTHP fallback by 58% (ratio
   0.68% -> 0.28%).

2. With defrag=always, direct compaction already keeps fallback near
   zero, and the patch instead cuts direct compaction stalls by 40%.

In both cases the compaction is done far more cheaply (kcompactd CPU
-62..84%, compact_isolated/scanned -46..83%).

Open questions:

1. In skip_isolation_on_order() and elsewhere, the target order is read
   from huge_anon_orders_always directly, since during proactive
   compaction cc->order is -1 (via compact_memory) and there is no clean
   way to plumb the mTHP order down. This variable can change under
   userspace at any time, making the semantics fragile. Ideas on how to
   pass the target order through the proactive path cleanly are welcome.

2. The proactive watermark is scaled linearly by the target order
   (wmark * order / COMPACTION_HPAGE_ORDER). This is empirical; a more
   principled cross-order normalization of the fragmentation score would
   be welcome.

Changes since v1
================

The series is now scoped to the proactive compaction path only. Two
patches from v1 were dropped, and two new mechanisms were added:

- Dropped v1 patch 3 ("don't skip proactive compaction for non-costly
  mTHP", i.e. running proactive compaction concurrently with kswapd).
  Follow-up testing showed it lowered fallback mainly by driving extra
  anonymous reclaim/swap rather than by better compaction; keeping the
  original kswapd back-off avoids trading workingset for mTHP fallback.

- Dropped v1 patch 4 (mTHP-aware zone_effective_free_pages() watermark):
  it added reclaim pressure without a clear net benefit in this scope.

- Split the former patch 1 into a pure refactor (parameterize the
  fragmentation score by order) plus the mTHP-targeting change, so the
  mechanical and behavioural parts can be reviewed independently.

- Added the proactive watermark scaling by target order, so a small mTHP
  order can actually reach the trigger threshold.

- Added patch 4 (skip unmovable blocks for non-costly proactive mTHP
  compaction). Without it, proactive compaction wastes most of its
  scanning on unmovable blocks full of kernel allocations; with it,
  kcompactd's CPU and the scanned/isolated counters drop by an order of
  magnitude while fallback still improves.

- compact_hpage_order() uses __fls() (highest always-enabled mTHP order)
  guarded by #ifdef CONFIG_TRANSPARENT_HUGEPAGE (m68k allmodconfig build
  fix from the kernel test robot).

- Refreshed test data on an mem=4G, order-3, data=journal kernel-build
  workload; see Results above.

Bo Zhang (4):
  mm: compaction: parameterize fragmentation score by order
  mm: compaction: target mTHP order for proactive compaction
  mm: compaction: skip isolating large folios that already satisfy mTHP
  mm: compaction: skip unmovable blocks for non-costly proactive mTHP
    compaction

 mm/compaction.c | 85 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 68 insertions(+), 17 deletions(-)

-- 
2.34.1

