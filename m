Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425064;
	b=ttZFgRphbHCMdzVb5jYYe2A22SSWYfgBY1FUGtY7SYO4NPhP3PLAN++Ko2nOgJ+HQ/9l
	 hjYFq+fX0GwRHDpVb5mHysqdQHkjhOab3n7dcYfoiWOlXzgXoZyTMzLeFVy8zPpnX0BKp
	 VABElN75bN0Lh1vWimJt8TTbecAMOCvotcOtpgybJoRSSZjlYU7KffzpQppkE7cVF42wH
	 4kjNt1FORpdaRdnGZiM6hPR0kpTuSdfK3IhUXSCieB5G5gHe9VcLmgAfdPKooLp66rs6C
	 DkLMFg2YTxt6dSVAuqiaZooY8OX2Q7wWtEcPhYCG8cMTIxmZsuSY25QcP+IfEVidULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FnQ2J49HpRqmPpQE8xJNKjzZwCJRVru+IexOjX3ZKk8=;
	b=Bzwnnb+XKkKtXtZgp7ZFP/tFogzDznWEfPYbyLNsQEvqH/sqHtoLyr/LT09eKo9/6FO0
	 oSUcjBolxLonAv8V7SbLV0Zd3Zcc2rtYhkK3YWl8x+Ui+v2TKtH+cz81RVA//Q2IB9bkz
	 hwpWYTAygvVHMZ82ou2SiPKQatWTnc9e/ubY6vkDefyCpJVS4HiS5HGJOQYwaqNZIc24l
	 z075YZzF6a6UXJK2lZxReP734DDn0auG9EdMi5+ePagMIwCdbhPbKnNzQfRPKELYz3Iz1
	 /Dlgm/Lihm0hn50yp2b889kAMT/vzvJnCKwg3P2fn0WfNw/umqM3rDdxV9CnouWe5sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K1hgTw7o;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E0606AF90
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54E0606AF90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K1hgTw7o
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35159e0092aso249858eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792425063; x=1793029863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnQ2J49HpRqmPpQE8xJNKjzZwCJRVru+IexOjX3ZKk8=;
        b=K1hgTw7olQJYl1is5iNMVH8jOlFOu7ZO43rL+X91wBQ023CC9KLv1BILDcsogNa6ks
         lDDDy6EkZcbEC/ChCpPLY4IXLjBRy3pOhpcSrbSJIo5SFvMP8oSBI8281qLTOIrIwEk7
         nJ0PJKRpZkWDf94SCc9NFjtwgFwWEXS/EIPJaTPfBot8X7gjAWlntXANtV2WczPqXcIr
         knshuL/R/eAawJ9S0lvUlc07kqexYVgUI5KNmrMw3inb0GqYwobxxrYbAyQZvEOoNOm0
         /2BPUtmGx87omhdq2aiQf+ZNR3d5KBsjXjlWEht/vlLaZKKMHCfiKOzbPbHmX8DJX1Ji
         rkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425063; x=1793029863;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnQ2J49HpRqmPpQE8xJNKjzZwCJRVru+IexOjX3ZKk8=;
        b=aoVXAsIoGVkfGrAJNNnHYHF5LhxIaPL6CmSpt5ZZk5M1n3x3MFi8FztYEWl5ikesi1
         R53IqAvbEewJd9fqDVCLxfL7sTdZbBA4ZHtW604Fs0r8D+Z0l5jjcpAzp+sehmGWBE3T
         ifstSvpMskokJ9LTNBuR6sQ7qRibd5ZVPt9bJxKGOeGCJf9YOMy+0NfwHGIKnN1vSU5o
         ZHu442RVe77842wyGCpZskfsOjWYFsqB45NfSlxHjl0zgeHdEyoxLWqSue7CgoAhFUi+
         mSMr6stz1hJU4letMJMaQA7BqoK9yD5oqFggMEsBY2MtbHE9BYh58bmcmt5jQZTh2bA5
         u2ug==
X-Forwarded-Encrypted: i=1; AKwUvByegFAa7cA0WP++pvtp7jsHZx+Jzx+ueA7+DsYcm69rVCId8pN57tOJc1WqBq18QVb9Qw2o2pMrFt8bFyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWToCfjOKXVfcEtuQo0vZyXWPr0wEHFl2uhBzqd3EOgp7Et6zj
	8dIMf0Lk1dAMNJi088OkucAFPl+5EaZINPCaTvg5E0yI1E05yU2qeXcU
X-Gm-Gg: AYBFou0Qh0yr+lYe6g+UFej+E3keyMWA3XrFK8KDqbApe7t+8HrtT5/wnxcCpE5Xp0t
	WoOuBDhASLqNApMvY2RkaICVDBlyWkmge52fiXBOkifhMsPi1QeabWQ1qsyB2RrU2nFCVga0aOQ
	78a40eUR25GA+nLcQGcl7pZKf3qkmRvdvozNQVYI8WtvFwslR7vQZmZ2KB/Dk4v2oCalx86cQHi
	CVPQHQD3cjIdtqbCQAsWzqaPbIXigwc5CHnozGNF6xoGv2Ua89/p+XNd5nTfWIeSjjIZtbhvlKJ
	qlxRaHvPIKDWepqstsgQmX7uVkJNqYKNd0WpTmly+v3qVsKXEPlRmJU9ML62obF/nqUc4Iv3Cqc
	SEi/MqKuNGQ8+PsNMEm5OR1bzLnBDSFRa5/jP661lzF4Rd/8J+40LPPaqB8K+fUO9A9R5vkey68
	a/5pTJc65VHDMS+oS+p5KD+NJPTTw0qPFxeivqs0rBWQeJHnVlXOfQYcEpih0PfGqwEFS877gxh
	PJvDvuVEM0/JYcZieishLCJKruX9YZ5nj4vYHsZj/S5kVZZ
X-Received: by 2002:a05:693c:409c:b0:35b:cb8a:8ce7 with SMTP id 5a478bee46e88-361a06a6544mr21354226eec.1.1792425062580;
        Mon, 19 Oct 2026 08:51:02 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm31475194eec.9.2026.10.19.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:51:00 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: zhangbo0325@gmail.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
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
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Mon, 19 Oct 2026 23:50:48 +0800
Message-ID: <20261019155048.3916405-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Oct 01, 2026 at 08:14:08AM +0800, Bo Zhang wrote:
>Hi all,
>
>This series improves memory compaction to better serve mTHP (multi-size
>THP) allocations, particularly for small orders like order-2 (16KB).
>The changes focus on the proactive (kcompactd) compaction path.
>
>Problem:
>
>The current proactive compaction targets COMPACTION_HPAGE_ORDER (order-9,
>2MB), which is unfriendly to mTHP in two ways:
>
>1. It migrates folios that already satisfy mTHP allocation needs. For
>   example, an order-2 folio is a valid mTHP page, yet compaction still
>   moves it around trying to form order-9 blocks. This is unnecessary
>   work and wastes energy.
>
>2. Compaction designed for 2MB huge pages is too heavyweight for mTHP.
>   mTHP allocations are frequent and only require small contiguous blocks
>   (e.g., 4 pages for order-2). A lighter-weight, mTHP-aware compaction
>   strategy is needed to reduce overhead and power consumption.
>
>Approach:
>
>This series makes four changes:
>
>1. Generalize the fragmentation score functions to accept an order
>   parameter. This is a pure refactor with no functional change; all
>   callers still pass COMPACTION_HPAGE_ORDER.
>
>2. Use the highest always-enabled mTHP order as the proactive compaction
>   target. Because a fragmentation score for a small order is naturally
>   much lower than for order-9 under the same fragmentation state, the
>   proactive watermark is scaled down in proportion to the target order;
>   otherwise a small order would almost never reach the trigger threshold.
>
>3. During proactive compaction (compact_memory), skip isolating folios
>   that already satisfy mTHP requirements, avoiding unnecessary migration
>   overhead.
>
>4. For non-costly mTHP orders, restrict proactive compaction to movable
>   (and CMA) pageblocks. Unmovable/reclaimable blocks are dominated by
>   non-migratable kernel allocations. scanning them wastes cycles because
>   a small order can be satisfied from movable blocks alone. Costly orders
>   keep scanning all blocks, since they are harder to form and benefit
>   from any migratable page available.
>
>Test setup:
>
>x86 host, arm64 cross-build (defconfig + CONFIG_DEBUG_INFO=y,
>CONFIG_DEBUG_INFO_DWARF5=y), booted with mem=4G. order-3 (32KB) mTHP is
>set to "always"; ext4 root mounted data=journal. The kernel build
>naturally fragments order-3 free memory during the run.
>
>Runtime (two defrag modes were tested, see Results):
>  echo always > .../hugepages-32kB/enabled
>  echo madvise > .../transparent_hugepage/defrag   # or: always
>  echo 20 > /proc/sys/vm/compaction_proactiveness
>
>A background loop keeps proactiveness poked every 100ms so kcompactd
>re-evaluates promptly (its default 500ms interval is too coarse to catch
>the transient order-3 fragmentation peaks under this workload):
>
>  while true; do
>      echo 20 > /proc/sys/vm/compaction_proactiveness
>      sleep 0.1
>  done
>
>Workload: make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- vmlinux -j28
>5 rounds per configuration; each round: make clean + drop_caches, then
>counter deltas around the build. The baseline is the unmodified kernel.
>
>Results (5-round means). anon_fault_alloc is within 1% between kernels,
>so the fallback numbers are directly comparable.
>
>defrag=madvise:
>                              w/o patch     w/ patch    change
>  --------------------------  -----------  -----------  --------
>  anon_fault_alloc             14,307,597   14,401,699    +1%
>  anon_fault_fallback              97,701       40,975   -58%
>  fallback ratio                    0.68%        0.28%
>  compact_isolated              8,479,773    1,458,949   -83%
>  compact_migrate_scanned      78,198,828   22,900,359   -71%
>  kcompactd cpu (s)                    43            7   -84%
>  sys (kernel build)                6m34s        6m34s    ~0%
>
>defrag=always:
>                              w/o patch     w/ patch    change
>  --------------------------  -----------  -----------  --------
>  anon_fault_alloc             14,370,984   14,404,234    ~0%
>  anon_fault_fallback                 619          823
>  compact_stall                       979          585   -40%
>  compact_isolated              6,390,940    2,431,800   -62%
>  compact_migrate_scanned      86,171,095   46,339,911   -46%
>  kcompactd cpu (s)                    36           13   -62%
>  sys (kernel build)                6m34s        6m27s   -1.8%
>
>1. With defrag=madvise, the patch cuts mTHP fallback by 58% (ratio
>   0.68% -> 0.28%).
>
>2. With defrag=always, direct compaction already keeps fallback near
>   zero, and the patch instead cuts direct compaction stalls by 40%.
>
>In both cases the compaction is done far more cheaply (kcompactd CPU
>-62..84%, compact_isolated/scanned -46..83%).

Hi Bo,

With proactive compaction enabled, have you measured the change in power
consumption on Android devices after applying this patch series?

>
>Open questions:
>
>1. In skip_isolation_on_order() and elsewhere, the target order is read
>   from huge_anon_orders_always directly, since during proactive
>   compaction cc->order is -1 (via compact_memory) and there is no clean
>   way to plumb the mTHP order down. This variable can change under
>   userspace at any time, making the semantics fragile. Ideas on how to
>   pass the target order through the proactive path cleanly are welcome.
>
>2. The proactive watermark is scaled linearly by the target order
>   (wmark * order / COMPACTION_HPAGE_ORDER). This is empirical; a more
>   principled cross-order normalization of the fragmentation score would
>   be welcome.
>
>Changes since v1
>================
>
>The series is now scoped to the proactive compaction path only. Two
>patches from v1 were dropped, and two new mechanisms were added:
>
>- Dropped v1 patch 3 ("don't skip proactive compaction for non-costly
>  mTHP", i.e. running proactive compaction concurrently with kswapd).
>  Follow-up testing showed it lowered fallback mainly by driving extra
>  anonymous reclaim/swap rather than by better compaction; keeping the
>  original kswapd back-off avoids trading workingset for mTHP fallback.
>
>- Dropped v1 patch 4 (mTHP-aware zone_effective_free_pages() watermark):
>  it added reclaim pressure without a clear net benefit in this scope.
>
>- Split the former patch 1 into a pure refactor (parameterize the
>  fragmentation score by order) plus the mTHP-targeting change, so the
>  mechanical and behavioural parts can be reviewed independently.
>
>- Added the proactive watermark scaling by target order, so a small mTHP
>  order can actually reach the trigger threshold.
>
>- Added patch 4 (skip unmovable blocks for non-costly proactive mTHP
>  compaction). Without it, proactive compaction wastes most of its
>  scanning on unmovable blocks full of kernel allocations; with it,
>  kcompactd's CPU and the scanned/isolated counters drop by an order of
>  magnitude while fallback still improves.
>
>- compact_hpage_order() uses __fls() (highest always-enabled mTHP order)
>  guarded by #ifdef CONFIG_TRANSPARENT_HUGEPAGE (m68k allmodconfig build
>  fix from the kernel test robot).
>
>- Refreshed test data on an mem=4G, order-3, data=journal kernel-build
>  workload; see Results above.
>
>Bo Zhang (4):
>  mm: compaction: parameterize fragmentation score by order
>  mm: compaction: target mTHP order for proactive compaction
>  mm: compaction: skip isolating large folios that already satisfy mTHP
>  mm: compaction: skip unmovable blocks for non-costly proactive mTHP
>    compaction
>
> mm/compaction.c | 85 +++++++++++++++++++++++++++++++++++++++----------
> 1 file changed, 68 insertions(+), 17 deletions(-)
>
>-- 
>2.34.1
>
>
