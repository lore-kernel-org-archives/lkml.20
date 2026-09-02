Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591B40E8C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341533; cv=none; b=l6Xm+zsiqxQ1qQl8y8+jtBUBWS4LhnKgbSC4jwJsI88m5fLGJ34UKe2ocpCVXlEBBtrNYXB+qBkJtk6uzoeCC4bXn+vHgcrQ9xu1NM62NR0qo8614zS0p+oW+chxtr8sqXm4xZDhamT/Hpsu/tjNRwocxv9+cX6i5teKhQslu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341533; c=relaxed/simple;
	bh=aWvNiCwfRw+JxRIysDwQcVLogxZU6YSKDCKPpVaqm3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrnlplCmrLpX8r9ATMHzWtPIGK2aMjczeBAQVVBIATAyPNCuQC0mZlv4p/493DnGMGje5G8MDTv/RdeyNeTx8I0IVGiJS6TELCMlk2vKjSXL9flLcX3RtOIkYjTVtu34Yq5/hdjzGeqZkD4fPGwLVBVkcGbqkS4pwJpoPTdwDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oql95tJr; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oql95tJr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788341528; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=J+LXdYat0I4QNFciFBu0qyDuz5wb7/kssPEu1T1bfXI=;
	b=oql95tJrSkUj2Np3Z+ijrFpoTVJ9lrSu6Unxo4lldxNCyv78VOLf7STeOyQMHlUfDZTJ0GGNZnKdU9NswI6ZJUbfbCjtvx0rJ13VuPIWZU4Vak0siq+MD8+dGKVNuSmhxssqv/pcYimyc8asebicjEoUWk8gSXxTBqxo8oLyuFo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XACEOlh_1788341527;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XACEOlh_1788341527 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 17:32:08 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Chinner <david@fromorbit.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Xunlei Pang <xlpang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH v2] mm/list_lru: disable memcg awareness under cgroup_disable=memory
Date: Wed,  2 Sep 2026 17:32:02 +0800
Message-ID: <20260902093202.609559-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__list_lru_init() only collapses a memcg-aware list_lru into plain
per-node lists when kmem accounting is disabled
(cgroup.memory=nokmem).  When the memory controller is disabled
entirely (cgroup_disable=memory), mem_cgroup_kmem_disabled() is
false, so the lru stays memcg aware even though no object will ever
be charged to a memcg.

This is more than a semantic inconsistency.
folio_memcg_list_lru_alloc() trusts list_lru_memcg_aware() and
dereferences the folio's memcg, which is always NULL with the
controller disabled.  The only mainline caller,
folio_memcg_alloc_deferred(), papers over this with an explicit
mem_cgroup_disabled() check.  The shmem unused-huge shrinker
conversion ("mm: shmem: make unused huge shrinker memcg aware") adds
a second caller without such a guard, so booting with
cgroup_disable=memory and writing to a huge=always tmpfs oopses:

  BUG: unable to handle page fault for address: 0000000000000488
  RIP: 0010:folio_memcg_list_lru_alloc+0x41/0xf0
  Call Trace:
   <TASK>
   shmem_get_folio_gfp+0x1cd/0x7c0
   shmem_write_begin+0x5d/0x100
   generic_perform_write+0x89/0x2a0
   shmem_file_write_iter+0x82/0x90
   vfs_write+0x256/0x410
   ksys_write+0x61/0xe0
   do_syscall_64+0x8d/0x460
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

The faulting address is the offset of mem_cgroup->kmemcg_id,
dereferenced on a NULL memcg in memcg_list_lru_allocated():

  folio_memcg_list_lru_alloc()
    list_lru_memcg_aware()               <- true, only nokmem checked
    memcg = folio_memcg(folio)           <- NULL
    memcg_list_lru_allocated(memcg, lru)
      memcg->kmemcg_id                   <- NULL pointer dereference

Check mem_cgroup_disabled() in __list_lru_init() so that all
list_lrus fall back to plain per-node lists when the controller is
disabled, matching what the shrinker side already does
(shrinker_memcg_alloc() bails out on mem_cgroup_disabled()).  This
makes the mem_cgroup_disabled() check in callers unnecessary rather
than mandatory.

Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
v2:
- Drop the comment above the check; the code explains itself (Baolin)
- Collect Baolin's Reviewed-by

v1: https://lore.kernel.org/linux-mm/20260902032840.30250-1-qinyuntan@linux.alibaba.com/

Applies on top of mm-new.  No Fixes: tag since the commit that makes
the crash reachable ("mm: shmem: make unused huge shrinker memcg
aware") is only in mm-new; no stable backport is needed either.

Reproducer, on mm-new booted with cgroup_disable=memory
(CONFIG_MEMCG=y, CONFIG_TRANSPARENT_HUGEPAGE=y):

  # mount -t tmpfs -o huge=always tmpfs /mnt
  # echo x > /mnt/f

Discussion: https://lore.kernel.org/linux-mm/20260901115104.2944996-1-qinyuntan@linux.alibaba.com/

 mm/list_lru.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 36662d02ff963..a4522ca93ebcb 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -671,7 +671,7 @@ int __list_lru_init(struct list_lru *lru, bool memcg_aware, struct shrinker *shr
 	else
 		lru->shrinker_id = -1;
 
-	if (mem_cgroup_kmem_disabled())
+	if (mem_cgroup_disabled() || mem_cgroup_kmem_disabled())
 		memcg_aware = false;
 #endif
 
-- 
2.43.7

