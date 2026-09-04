Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3E3C0607
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492919; cv=none; b=IlhIeXftmMSCTC8VIBTZ0yUKcEAWnT0BH1bx43gNslxiTP6PulF1nHPqtYgIuYD0djpAIGBQNM/4qr+gMxwjCNJax7OXMFtc2tT7TjKd0jbqHONsDfMagUcNfivAKhHhjSgatbrWSzikaVbiX6GbgTH+Lj+9lyXt5TUD46uOXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492919; c=relaxed/simple;
	bh=SZZ/XXTWjtwQwLFvqUz2mnkpYl/V8jLH8EudSuG4KqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Am+ij5sm0Yp+6bsowusxR6uqFedQXFSfdZ35UolBkFrUxJ7CrmMCWZBRnYNkIqA6T3DIlV0Wnv+faiRfi6SXS6bXQy2kTvZNjltPYrK1Peobwm6mHkrordXapWBUmFwvMZG4l+tuvfWwdSGiNQ31cyY6EsET0n4Zo1oBWQCEhQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LWl3KEoF; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LWl3KEoF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788492912; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=qj3Huu9bCMAMtfBo9byDIptTGO/Fh1SmkPuNKeo+iXw=;
	b=LWl3KEoFYWgam/KXPm/JB+g3nGUlBFL+rJ5WZRZJ3p9+GcCYorJFBBXmO5JNlDArcAzjN9vcvoxKaAwgPxk2uhaLkiQyrtg8LP3pkv1EIcgQezyOiXhV40SpLnMpwohFdlJT3kVISI8+1fXhjaZaGkkI+G2VHGZ+LuGnjfKZP1Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XAHQrK6_1788492909;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAHQrK6_1788492909 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:35:10 +0800
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
Subject: [PATCH 2/2] mm: zswap: mark the zswap shrinker SHRINKER_NONSLAB
Date: Fri,  4 Sep 2026 11:35:03 +0800
Message-ID: <20260904033503.4067283-3-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
References: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With kmem accounting disabled (cgroup.memory=nokmem), memcg reclaim
never invokes the zswap shrinker: a cgroup under memory pressure does
not write back its own zswapped pages to make room; they are only
written back by global reclaim or once the global pool limit kicks in.

The zswap shrinker is registered memcg-aware but without
SHRINKER_NONSLAB, so under nokmem it is treated as a slab shrinker:
before commit 03375203e1da ("mm: do not allocate shrinker info with
cgroup.memory=nokmem") it was skipped by the !memcg_kmem_online()
check in shrink_slab_memcg(); since that commit it is demoted to
non-memcg-aware at registration.  But the zswap shrinker is not a slab
shrinker: it tracks zswap entries and resolves the owning memcg from
the folio's objcg, independent of kmem accounting.

This was noticed by Michal during review of the patch "mm/list_lru:
don't copy stale shrinker id from non-memcg-aware shrinkers" [1].

Mark it SHRINKER_NONSLAB so it keeps its memcg awareness and runs
under memcg reclaim with nokmem.

[1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/

Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
Suggested-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
---
 mm/zswap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 761cd699e0a3e..8bcc2997d7719 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1263,8 +1263,8 @@ static struct shrinker *zswap_alloc_shrinker(void)
 {
 	struct shrinker *shrinker;
 
-	shrinker =
-		shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswap");
+	shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
+				  SHRINKER_NONSLAB, "mm-zswap");
 	if (!shrinker)
 		return NULL;
 
-- 
2.43.7

