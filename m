Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91C3B8D7B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593108; cv=none; b=ETjqCOa6WtZeJ3MlcHvUvbVeONRyHNhbgRZsS5QXOK8Ym7wxhtAQkOR74UiNygP2Hp3jaQkrOXffu/dwD/IidlTJsSlo0wvUzWb0BonWLCVoxj8Q6F4hM0rKqp2qpy9JpzTEtM8mZw7TWtfNoerAKAL/YmVCLieQ9YGBwcirgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593108; c=relaxed/simple;
	bh=i8HBRtQ9DEuQuqAnjXpDtMoZjN5eg2xj6iX54OzYeF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxvVe8Tn+P8+3zJbcW2+KiEMwUucdp9LzuIQaLVa79e3GMq/vyOx3F6Vgwg+GCXdIy9ZkEc9vw3zvdVYi1I6FIHYGUfuNLtJ25WiNsuy+eFKWmfCd2fPnbFnPlHM+Rjb/H1RtejoxqjIio6cMlW4aNwDIb1oXwI+biAL3ysaeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KPkv/fqc; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KPkv/fqc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790593103; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EW80Ao4GSnyo3++EWYs+N/9yYhqs951UWTJTytHYXHI=;
	b=KPkv/fqclzYLSyxP3CTYUHMtTi6NIfZcA+e9Qu+jkr4L/pgwcOXjRxm1AXOOF9ianwynNTN6Y/XBAcqiZvyTdy47S8WmmrytDaSWN3SkH1mXQ3dH3lGrwzcLEFm9vs5MSUsIQfwdZz3ZJD3dB+x6FIIynBEs0h7JrhSg289rc8Q=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XBma20y_1790593101;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XBma20y_1790593101 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 18:58:21 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: xiangzao@linux.alibaba.com,
	david@kernel.org,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	ying.huang@linux.alibaba.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	kaitao.cheng@linux.dev,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned pages
Date: Mon, 28 Sep 2026 18:58:04 +0800
Message-ID: <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memory_failure() sets PG_hwpoison on the error page before it manages
to pin the folio via get_hwpoison_page().  Compaction running on
another CPU can isolate that same folio in the meantime, so
HWPoisonHandlable() then fails on !PageLRU(), the retry loop in
get_any_page() exhausts itself and memory_failure() gives up with
MF_IGNORED - while compaction still has the folio on its
migratepages list, flagged PG_hwpoison.

Nothing stops compaction from migrating such a folio afterwards.
The corrupted data is copied into a fresh folio that carries no
poison marker, and no hwpoison PTE entry is installed on the way
back: the userspace mapping is silently redirected to the corrupted
copy and no SIGBUS is ever delivered.

Note that a large folio with a PG_hwpoisoned subpage can also sit on
the LRU without any race at all, via the THP-split-failure path of
memory_failure() (kill_procs_now() + MF_MSG_UNSPLIT_THP).  Guarding
compaction is therefore needed regardless of how the race in
memory_failure() itself might be addressed.

folio_mc_copy() does not close this hole: it only detects corruption
at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
Software-injected poison - what MADV_HWPOISON and the hwpoison-inject
interface produce, and what tests and fuzzers exercise - never traps
during the copy on any architecture.  An isolation-time check avoids
the migration entirely, on all architectures and for both real and
simulated poison.
The check itself is two flag tests on the head page (PG_hwpoison
and the folio-level has_hwpoisoned marker), not a walk over
subpages.

Neither page reclaim nor memory hotplug lets such a folio be
copied into a fresh one: reclaim unmaps the poisoned order-0 page,
and skips the hwpoisoned large folios it cannot safely unmap, in
shrink_folio_list()
commit 1b0449544c64 ("mm/vmscan: don't try to reclaim hwpoison folio")
commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list")
while memory hotplug refuses to migrate them in do_migrate_range()
commit 5f5ee52d4f58 ("mm/hwpoison: introduce folio_contain_hwpoisoned_page() helper").
Skip them in compaction as well, for the same reason reclaim settled
on skipping: the UCE is rare and a race with compaction is rarer
still, so skipping is enough, and a later memory_failure() will
handle the folio if the UCE is triggered again - while a migrated
folio would silently propagate the corruption instead.

Deterministic validation on v7.3-rc4-75-g62f4c998b297: order-4
mTHP folios were brought into the stable "large, on LRU,
PG_hwpoisoned subpage" state by pinning a sibling subpage with
vmsplice and injecting MADV_HWPOISON on another subpage, which
makes memory_failure() take the THP-split-failure path; after
triggering compaction, /proc/kpageflags shows which poisoned
folios moved.  The unpatched kernel migrated 16/16 poisoned
folios and 16/16 clean controls in the same pageblocks; with
this patch, 0/16 poisoned folios were migrated while their
controls still migrated 16/16.

Soft offline is not affected: it only sets the poison marker after
its own migration has succeeded.

Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
---
 mm/compaction.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index a049415512c6..491adcbc5313 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1093,6 +1093,14 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (unlikely(!folio))
 			goto isolate_fail;
 
+		/*
+		 * Migrating would copy the corrupted data into a fresh
+		 * folio with no poison marker; skip, as memory hotplug
+		 * refuses to migrate such folios for the same reason.
+		 */
+		if (folio_contain_hwpoisoned_page(folio))
+			goto isolate_fail_put;
+
 		/*
 		 * Migration will fail if an anonymous page is pinned in memory,
 		 * so avoid taking lru_lock and isolating it unnecessarily in an
-- 
2.43.7

