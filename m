Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97C3C1977
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492921; cv=none; b=HntPoGzw5LRw9AveUGkM+IOaTDARYqSYbs00CjneSUxLo7s2Uc2tU+K9TloRXpMA1UyCfqo7jNA3p0u5vnh+NYl2DtWUNVbCN+L2LPNcemvQWC48hNQgUay0ShvNma1rLmfYqSgpaNfjLvoTz4/07cIeju+DBvs9PuNZeQcTYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492921; c=relaxed/simple;
	bh=OoPxvrNEKrhc1DB1lyEmNJ1aDjn5sOfm0oiynrTNb4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GAPDjvJtCUbGMZIqRBJ3Wc+FS7y8DdIDCFEviX5imOWJRQZ+HPAUdUYSCAbXIm50ro1Tg+vuBlylQUcLlJkOFimOxVMIUq5S77U0stqXRvqPf/6jqjfD2IqgMX6UeY5t0leXnnsVbX+wq9/8yAbruoflwAG1ImasjimlIfC0hrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Vzi8rJpV; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Vzi8rJpV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788492908; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=oQIqkOb/fjxZy4PwRAU78hf5BLiwp7jSD25p5AZ6eDs=;
	b=Vzi8rJpVSji0zyQBJDMvYVLDBvvH6vV8zqshErEewLxQQ9QMa8yskA1qwW4LN5jdzMNdbEUjbpVWPIwExVeL5G5DR221qgIPter/6m8Y6g+4XLrwv2F8/vQH8sb24RiauKwS7aPIsyEiH/rKe2zbBZ2XOMEqN1P7t5c2qIarR3s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XAHQrIP_1788492905;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAHQrIP_1788492905 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:35:07 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Xunlei Pang <xlpang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH 0/2] mm: restore SHRINKER_NONSLAB on THP and zswap shrinkers
Date: Fri,  4 Sep 2026 11:35:01 +0800
Message-ID: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While reviewing the patch "mm/list_lru: don't copy stale shrinker id
from non-memcg-aware shrinkers" (now in mm-unstable), Michal noticed
that the two non-slab memcg-aware shrinkers, the THP deferred split
shrinker and the zswap shrinker, are registered without
SHRINKER_NONSLAB [1].

Without that flag, booting with cgroup.memory=nokmem silently demotes
both shrinkers to non-memcg-aware ones: memcg (limit-induced) reclaim
neither splits partially unmapped THPs nor writes back zswapped pages
of the cgroup under pressure.

Patch 1 restores the flag on the deferred split shrinker; it was lost
when commit fafaeceb89a5 ("mm: switch deferred split shrinker to
list_lru") re-registered the shrinker.

Patch 2 adds the flag to the zswap shrinker, which has never carried
it since its introduction in commit b5ba474f3f51 ("zswap: shrink zswap
pool based on memory pressure").

The series is based on mm-new, on top of the list_lru patch above,
but the changes are independent of it.

[1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/

Qinyun Tan (2):
  mm: thp: restore SHRINKER_NONSLAB on the deferred split shrinker
  mm: zswap: mark the zswap shrinker SHRINKER_NONSLAB

 mm/huge_memory.c | 3 ++-
 mm/zswap.c       | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.7

