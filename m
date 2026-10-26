Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983369;
	b=crwl7zfgr5NhGE7FembkOgE4adtJhWDswohqAZ1em/N7qJgxqo38dI5hYHKbdXVkWOhA
	 LfjsG7+kJo6uUDNRxZDT0m7ZopypJwIRZdooUybAykNKAFUfslVKQDz3eqRS2tKQuZeJO
	 RvSmIxYwsX9fMvBo9jJKEbWM+ysTFB+4qkBLnTG701flRMKJpYA7WYSoe2vr9/TLBHNCG
	 tDWU2ru7K6+6h6shYwOF7ZTqggb7k92pdB59wHzklG6zl3JT9FZkrcAxwOymwee/yY1o0
	 WD8rVfbvLK7otFBjPFYytoMnkL/aT0DXs7bgd/Mem+N7SH1X245qsuZnYFCLjW15x7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983369;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iy8CvcCXZdt7wKCpczgHps2OAcckKLpjCVLtI0G4qWM=;
	b=we/BIbok5IB4gPTrqCxtBXFA+15zdjFhHR4G+YsMQTXIlL9nhomIBHz4dnRJMovTF4Uy
	 NpB0x31lBeFloVGgBoEHDato4eJ3Jcia/4oplu9p4Bn0azw8Bw6sx1+zgEjbalpvw1w56
	 0dDbgvYvyi2NqyL+9y/QpQcLRB9MzlVkXmS6CyDXTYXZ+Wb7dN/v2BMYeaN/ZkmshdnYO
	 24598ko5SzZkLpqH7G4c4ZB9x0wnzkeo3Z8/cmQi4Kxqm2Q5Bm3CgbhjZuBDbPPF6Npzg
	 Dxtr6tduMX6SRG5cad0d9JPh9LXuWyvMwxfFei6C6fodUdOophhfhD919X6aQY/+yQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=juGUkou+;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=juGUkou+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792983364; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Iy8CvcCXZdt7wKCpczgHps2OAcckKLpjCVLtI0G4qWM=;
	b=juGUkou+TQe2gndPw8Yy/bBpsRgJhP7yTonBTbimg791KNym/QBHTZQ/LmhTVPNNrN1o0BgoX8kfkKHLjSmOw4VubSrr5O4DufREjJTAre8rJBSllh4Q3My/XDjprCV0oq2LyIBS2IKByqA+txsA+niex0xVPqFnuFMFTjT27fU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDRaMdK_1792983352;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDRaMdK_1792983352 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:56:03 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH v2 0/2] mm: don't migrate folios containing hwpoisoned pages
Date: Mon, 26 Oct 2026 10:55:50 +0800
Message-ID: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

v2 of this series.  No changes to the approach; the two deltas are a
wording correction promised in the v1 discussion and a third check
suggested by Kaitao Cheng.

memory_failure() can end up abandoning a folio while PG_hwpoison is
already set on it.  Two ways to get there:

  1. Race: any isolator (compaction, NUMA balancing, move_pages(),
     mbind(), CMA, long-term GUP) clears PG_lru from under
     memory_failure(), which then fails the HWPoisonHandlable()
     check, exhausts the get_any_page() retries and bails out with
     MF_IGNORED - without holding any reference, but with the flag
     set.

  2. No race at all: the THP-split-failure path
     (kill_procs_now() + MF_MSG_UNSPLIT_THP) leaves a large folio
     on the LRU with a PG_hwpoisoned subpage by design.

In both cases the migrator still holds the folio on its migration
list and migrates it like any other: the corrupted data is copied
into a fresh folio with no poison marker, and no hwpoison PTE entry
is installed on the way back, so the userspace mapping is silently
redirected to the corrupted copy - no SIGBUS is ever delivered.

This was reproduced on v7.3-rc4-75-g62f4c998b297 (the base of
this series): an order-0 stress workload (madvise(MADV_HWPOISON)
racing move_pages()) left the poison flag set on 8426 abandoned
folios in a 180-second run; 698 of them were subsequently
migrated, and in every case the address then served the copied
corrupted data with no SIGBUS.  With patch 2, 0 of 9711 were
propagated.

The compaction-side guard is needed regardless of how the race in
memory_failure() itself might be addressed: the steady state
(split failure leaves the folio on the LRU with the flag already
set) is not a race at all.  Deterministically validated 16/16
poisoned mTHP folios migrated unpatched vs 0/16 with patch 1,
with clean controls migrating 16/16 in both runs.

The checks compose with, not replace, copy_mc: folio_mc_copy()
still catches real-DRAM corruption during the copy on archs that
implement it, and the flag checks refuse software-injected poison
on all archs before and after the copy.  Extending the
!ARCH_HAS_COPY_MC fallbacks of copy_mc_user_highpage() and
copy_mc_highpage() with the same flag check - which would also
cover their non-migration callers - was proposed by Huang, Ying
and welcomed by David in the v1 discussion; that is posted as a
separate patch right after this series.

Changes since v1:

- Patch 1: the isolation check's claim is narrowed to folios that
  are already flagged when compaction sees them ("avoids the
  migration of a folio that is already flagged"); a poison landing
  after isolation is patch 2's business, as David pointed out.

- Patch 2: a third check after the copy, before the mapping is
  transferred, suggested by Kaitao Cheng.  It closes the copy
  window itself, which the debugfs corrupt-pfn injector can hit
  since it has no GUP or PTE ordering constraint.  In the v1
  racing workload the pre-copy checks already propagated 0 of
  9711, so the new check is measured-neutral there.

- Both patches carry Assisted-by: LLM, as promised in the v1
  discussion.

Yuanhe Shu (2):
  mm/compaction: skip folios containing hwpoisoned pages
  mm/migrate: refuse to migrate folios containing hwpoisoned pages

 mm/compaction.c |  8 ++++++++
 mm/migrate.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.43.7
