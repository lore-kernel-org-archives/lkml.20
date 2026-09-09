Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FF4CB8C0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948868; cv=none; b=Jd1kZYFp4D23UztWg5Z8SPbyXz+dMdiVeBWe6DvKHovDC9yCoKlS6sSRTUi1o1xevHkU6FfO+MsI8APp/8d3kbg075JMkJtIUw2pLogGjwuNhIGWWGrpst6ChIxgMvYi5XlCUj+IehpY4/wsANE80kMFqoV2tJf14n/qHcSfblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948868; c=relaxed/simple;
	bh=iYBl1TBcq8XbAN5lWXQ5xeG2cPfd6X78ZvXFz11jkXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K2zBdioKAQJB2SfmIf13mEnHKj9fsb6205cJ7MfhqPN18c5X83cLte4f4/PVdQXxvDPT2P8sOrmZio2w8YThHPB7kId3KkDXerkhCpQdL9yco4wtcrYmd1UkOCpOY+zNl9EG1yRcf2zxieSSabFttABzCV9ilgyOAmybTwIbf/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRYPqwdZ; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRYPqwdZ"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c70f69d3fso5341226d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948858; x=1789553658; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cx1TfB9GnW58nOxDn37ATPgkJR6erGAjBm2BqNqkY28=;
        b=PRYPqwdZUo/IB9RDXendGZtCja/iYJ1a6PM7GvuYIFcVs73+Aq2REekIyiRl7fjjAk
         LRp04gPqNFcbyURy/5NcHJapf/ediVuCV9FJ1gJom6LcsEPMy9CDFhkqZ8YDn8ZOT1Ha
         x4O5p+TtNQEe1tpXqurl4XGFaXkVfFZhpr/nW/5B/zHmkgqGY/bx0ycLpnRgdmH7gU0q
         KPRfakb0o+JxLzBDZeilT8v9QkXEYKrAImhMZJKQUmLO1sKS50VNsZuJAQNQ3jAtlJZF
         /hj5X3ycMERjXWMG5IKdk6DNw5Vm752upXAONuac2+tmtxbZxrS+V6RMe0RLe8rdCk66
         7aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948858; x=1789553658;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx1TfB9GnW58nOxDn37ATPgkJR6erGAjBm2BqNqkY28=;
        b=N4NFlWL/kABJOWARl+00FzTy3z47x31awTyf+00nxLpuIq4vQDgzHuvDtBW6mMo/+L
         PjEglD3wK0kryW1X7EarPY7wIAkAmymfl/vMB61LFU3dSWhZbsLNoaNKWY/XmnQp4yht
         sgOop/JsAGWJ5r7dfRc82V8Zg4H4WmAxVHHwgFX57488Z7HjnnO1gzUpfGThCrgonUtY
         fMo9yPdU0oeTCxmYurjADKVigM1FY6chF3jrshJyr6WTuUVZ+OzkiKFlHP+od6jkP5+T
         L4iYwj2EndEY/VY5pXW45HTRIbHu1qGIshiIfRbifx9dPVva97ph3jbVt4vFP3CrIxfp
         m58A==
X-Forwarded-Encrypted: i=1; AKwUvBz9v5UA1xlCcgjEmgEiP2xRK256v6Z6+nozzcUQanxiCRoUmKt4dywgj0W9W1KPjV0YL+F0NXGRpNNo6F4=@vger.kernel.org
X-Gm-Message-State: AFuF++lu58HuOapUqK5tgQ4tdj3nVX8Q4tRJB9ndAuk8l0UJScbETDyS
	4N7Nh0tBKQoOqOGSRLvWTKQHlGDr4sD78BXrUoWCTp715ajT/qXRbGIKIcIZ3ShQEg==
X-Gm-Gg: AYBFou0kR0jDxl2z3kVravRHdjYOvre3Gyv4dqu4eMdUnIMULKW9TK8SSyZ7ZZgFQKY
	8K1zOscEVIMYt277sWC4qq2FTMzk9gzuaohnmZ8NGjTu16H+kDodOBFaD68gue4zrZPAXGAE+gk
	hsGPIbArzEoo2CZTAuaAalsqftnzH7SPxGPPcJfUG0IgraS1+Zb/4ztgzdI2BAKn00EFpzMX3f5
	4ZmYG1I8IDiZqt8w2Lm22eUmZDv9GAFhuhEPuL6cK0MkmPfXMaec+ZoTPnBk52SWbsUx4baX/ks
	vZdhUfg36+xXDPhfZA7LzC03F7z3iKOGSWvouoFX76WQGsj5G+gNFc/uJxc3tsK9tRzxUwnNPGr
	Y4v0ALcTsjmMdgGHpC/ylO/92xYpvaSxiVs9/n+NJlFvwSaGgO2p0U9U++wVe8+dG1w9BrBk9em
	bYC1OzQ9ImvZgXz3oO8gIUbIydBXwAFvJH85LBNYtfOYV2Axzy2jqG7nsIgWTp0D0C6IWTRYfwI
	YhnhncUs83y1KJ3BQNN//tLrLHZksEG5rgLcq0NxVA5J37FN1LHLsIiV/Q=
X-Received: by 2002:a05:690e:4513:10b0:670:f6e8:1f8c with SMTP id 956f58d0204a3-670f6e87f07mr2998845d50.84.1788948857514;
        Wed, 09 Sep 2026 03:14:17 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm12066216d50.1.2026.09.09.03.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:14:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:14:11 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 16/26] mm/fbatch: remove lru_cache_disable() from NUMA
 folio migration
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <bc903047-0dad-902d-5774-ecf73c6dd343@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Remove lru_cache_disable() from mbind(MOVE), migrate_pages and move_pages
syscall handling. They do not now benefit from lru_add_drain_all() first;
they gain little benefit from invalidating buffer head LRUs first, since
5.0 commit 80409c65e2c6 ("mm: migrate: make buffer_migrate_page_norefs()
actually succeed"); and it's a shame that (even without CAP_SYS_NICE)
they can prevent concurrent tasks from enjoying the use of those caches.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/mempolicy.c | 7 -------
 mm/migrate.c   | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 79053ece02cd..f4d9b5580632 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1343,8 +1343,6 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 	long err = 0;
 	nodemask_t tmp;
 
-	lru_cache_disable();
-
 	/*
 	 * Find a 'source' bit set in 'tmp' whose corresponding 'dest'
 	 * bit in 'to' is not also set in 'tmp'.  Clear the found 'source'
@@ -1425,7 +1423,6 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 			break;
 	}
 
-	lru_cache_enable();
 	if (err < 0)
 		return err;
 	return (nr_failed < INT_MAX) ? nr_failed : INT_MAX;
@@ -1530,8 +1527,6 @@ static long do_mbind(unsigned long start, unsigned long len,
 	if (!new)
 		flags |= MPOL_MF_DISCONTIG_OK;
 
-	if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL))
-		lru_cache_disable();
 	{
 		NODEMASK_SCRATCH(scratch);
 		if (scratch) {
@@ -1626,8 +1621,6 @@ static long do_mbind(unsigned long start, unsigned long len,
 		putback_movable_pages(&pagelist);
 mpol_out:
 	mpol_put(new);
-	if (flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL))
-		lru_cache_enable();
 	return err;
 }
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 364015cbef33..1d2085529cd0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2359,8 +2359,6 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 	int start, i;
 	int err = 0, err1;
 
-	lru_cache_disable();
-
 	for (i = start = 0; i < nr_pages; i++) {
 		const void __user *p;
 		int node;
@@ -2439,7 +2437,6 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 	if (err >= 0)
 		err = err1;
 out:
-	lru_cache_enable();
 	return err;
 }
 
-- 
2.51.0

