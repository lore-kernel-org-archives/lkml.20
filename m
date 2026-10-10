Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363E37B02D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600104; cv=none; b=rC3AD7H/0b5iZEEaWFoqHB4ZtMGoQGmiD8LifhG5jPBqp1IguF19+Y7vrXtERvB0s6wr2kKifvf+eD9rJI47Owd3CvY1Jt06NPooHX7sN8Zz8iMKKCXC/VxYUu1NPYFJJri/o7UmMgn2/Ac031H09Y1zYqyq43oAzUvDCLxm+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600104; c=relaxed/simple;
	bh=o8fHkwOJe83tjCnnC5MfbT3jFcIT17ld4EJudsKZZqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JCM4hc7CmA5pD5h4/nkHGZeJKEPyVfbOCrwh1dNH06p8JiQpEqa+eppsoFgbLTSdrDs0nFh9wzD5U9tstwToZWmr8i6D5I2rc5oAAGqZCBTf3uYhrodP96PxHaekm+1i2a01ghaMTMYDp3rNQy7tE4HvtYbtKNiWDI/wnA+7dDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K9Z8LsAK; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K9Z8LsAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Iu
	ppudWlzPNdUG29j/pvz4NISV5lfrtSEL30qww+9r8=; b=K9Z8LsAKfojwsrNXaT
	eFa4/Yv2HD697ySbGv8vdh1+TucpFf20MIc4aPChDUZN3XN+z/f6/Qwvc/RfFEWv
	037yg0Q6gDv7EKUHa+XxHNOaQJIQnpvgx2i/dWRzhoEfDjV++w/TsmhPRqijTrNb
	gr9XoRhXQCrJPLs5+yBPVMxuI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3v3uupclqOD5oDQ--.45093S2;
	Sat, 10 Oct 2026 10:40:47 +0800 (CST)
From: albin_yang@163.com
To: akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org
Cc: vbabka@kernel.org,
	jannh@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: [PATCH] mm/madvise: add cond_resched() in THP branch of madvise_cold_or_pageout_pte_range()
Date: Sat, 10 Oct 2026 10:40:42 +0800
Message-ID: <20261010024042.4070048-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v3uupclqOD5oDQ--.45093S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw43JrykGr4kJryfXFWkWFg_yoW5GFyxpa
	98Kay7tr4UXrs8XFWxuFWkZFyjvw4fKrZ7XFWkJrZ8AFsxJr1aqr4akay8KF4UGws3t3sx
	ZFWjg343Z3Wqvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRd-BZUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC8A+hRGrJpa+uHgAA3D

From: Wei Yang <albinwyang@tencent.com>

During stress testing with stress-ng on a 256-CPU system, a softlockup
was observed when madvise(MADV_COLD) was called on a 31GB memory region
backed by transparent hugepages. The region contains 15935 THP PMD
entries, and the softlockup was triggered after 14485 of them had been
processed.

The THP branch of madvise_cold_or_pageout_pte_range() has no scheduling
point. walk_pmd_range() invokes it once per 2MB PMD entry with no
cond_resched() anywhere in the loop. Each iteration calls
pmdp_invalidate() which issues a synchronous TLB shootdown (dsb ish)
waiting for all CPUs to acknowledge. This operation can be
time-consuming under heavy system load, causing the accumulated time
across all PMD entries to exceed the softlockup threshold (20s) and
panic when softlockup_panic=1. On a CONFIG_PREEMPT_NONE=y kernel, there
is no other opportunity to reschedule during this entire traversal.

The regular PTE path already has an unconditional cond_resched() at the
function tail (introduced by commit 9c276cc65a58 ("mm: introduce
MADV_COLD") and commit 1a4e58cce84e ("mm: introduce MADV_PAGEOUT") when
MADV_COLD and MADV_PAGEOUT were first introduced) and a conditional one
inside the loop (commit b2f557a21bc8 ("mm/madvise: add cond_resched()
in madvise_cold_or_pageout_pte_range()")). The THP branch never
received equivalent treatment.

Fix by adding cond_resched() at the huge_unlock exit path after
spin_unlock(ptl) and reclaim_pages(), which is the single exit point
for all goto paths in the THP branch.

Crash log:
  watchdog: BUG: soft lockup - CPU#63 stuck for 23s! [stress-ng-vm:1665914]
  ...
  Call trace:
  pmdp_invalidate+0x48/0x68
  madvise_cold_or_pageout_pte_range+0x84c/0xb00
  walk_pmd_range.isra.0+0x1ac/0x3b0
  walk_pud_range+0x120/0x190
  walk_pgd_range+0x170/0x1b8
  __walk_page_range+0x184/0x198
  walk_page_range_vma+0x94/0x128
  madvise_cold+0xd8/0x198
  madvise_vma_behavior+0x234/0x638
  madvise_walk_vmas.constprop.0+0xdc/0x210
  madvise_do_behavior+0xa8/0x328
  do_madvise+0xd8/0x140
  __arm64_sys_madvise+0x2c/0xe0

Signed-off-by: Wei Yang <albinwyang@tencent.com>
---
 mm/madvise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index eeee82cf2b3f..0755e6d99757 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -450,6 +450,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		spin_unlock(ptl);
 		if (pageout)
 			reclaim_pages(&folio_list);
+		cond_resched();
 		return 0;
 	}
 
-- 
2.43.5

