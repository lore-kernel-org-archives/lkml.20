Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876244C50E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948999; cv=none; b=DXasutAbrYKoHwC0DfdXw8NT8m0I7KOhZ9PbJyADlHZGONZIm9Kpo21H2Fh4WOdquI77Jp4RU9YH0qNH5GLyZnInYWFh+dNk4B6LW4fnhQR1Aih97lcN22V7nZAieMLteuq0uHpxO7dEoYyR0sCYOcI89O6o3ChjwuJ1KhHej0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948999; c=relaxed/simple;
	bh=KEiTze2su0A1vp1BBKEvxCvYQVjhfCLRRoQ/gxsZ1F8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GFybT38RcGCvVlL4vvEtAKwjg7qUjODfbflVYCjEfQtvvkZ1qjxsUxW9w9mIqQWgk7za1DY+chbmK0tO/PW8RB3BFcvCjce4jY2IMpxUEPJOg6VDZ+gx+s4NxnOBac3zlC7GSQSBUi+NE7Eh4X2qh+j1fBAjMxv6hRYy+FDVn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hwyrAzI+; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hwyrAzI+"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcaso8046277b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948982; x=1789553782; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ovd1KkFuD5rQg51sP3+p0bllsBxKk8b6qXB17QYO0U0=;
        b=hwyrAzI+wvUIgVjo6Lx52WtUrdUvT5rei03O1Ho/0BoeeXp8scCzjMRS+8dh4HtB/M
         qEcFwK+SzHFY66p/gIZuPAyijePIhadcM49qboerkYuSo+xJVo7vGaulp5qeP9dw8a9g
         ROJX/n97KeyHT7Rz4/TnCtz7kazdE2QSaIHxgjr9PTtBIQ4mB0j5GPM4bRgLFKRPu0Bb
         u8b9Ovnho6DBsEHFWNRDE/4FVSP4JoxayygM9QL3IyV/yP1JNNINe15Yl1FxspCm75bJ
         ++vDAjdbxpjWtLcYFicLrpBC0SVgMpADfE4NAtuJyDRwa/Ax0L/qdSz8dg/a6gzPwAet
         YJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948982; x=1789553782;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ovd1KkFuD5rQg51sP3+p0bllsBxKk8b6qXB17QYO0U0=;
        b=sW3xQ1uKydW5GkYFtqSCQYVfYOa+oQAK/E20+4KLPBDtUTlh4VUtkNayP9wq9+lFO2
         j5CgEdkIkL/3YMSCt/1A3OpHfGcHicyz+LbRwt1aem2RWVfJyASP+sOMQU81GKasio6E
         NuLJQyIAbOIuFDJYL0V2eRSkgveOg4CieZrmfagJeM9gQphDBXLqfmqcgQqXUBiLM58t
         dM3pMtE1x9A/JVIUGqfaJAFy+7zekQsBwIFSgKQtdAIKMmm4diN6f3KDRwkT32/aJm4k
         2lTfeWetlvcUu81SzaqAUlq30jbUWq7cEI0KykSOxbTfdnA82GUgYbyfjMxGyIftBWL5
         Bz2A==
X-Forwarded-Encrypted: i=1; AKwUvBwKdukLjeSdBGELJ7uuqyBP/PbnAnGxAYUNtnsf5mhCpRXcLW5LSf9h1WSynW+lGOe9TkVHcc0j0LTZ6NE=@vger.kernel.org
X-Gm-Message-State: AFuF++n+HtrKtv1yv4YAdeXmQhbM5alFfq9ZcGSzKQUyjCDOQtrHoWbQ
	jRCURRe8KfoN+KjJDRiexmy6wyoeLN/oTIvlBMfKUl7ic8CfjxfR34qwqGcY1qPcXA==
X-Gm-Gg: AYBFou2UaOU4rL+/h5GiD+jiE5czVJPNIZ4uF5NbVDysyeZeGMkyjFMgSZJ/XpHOS/J
	QN3pLPykEGIq9Rh7VA8c9tZCdpchMCpdyhWBDG/eXzEqqxAWSHrncrHTejaYI49NXZyfWI/sRuS
	u5M+rTWlxlK1G03NlK+toVXDg0dQzmja6/8aB2XXwg1xbybYjr2GYb29ZkJi6B1q+mPwIr7T57s
	VbhJ2VwcHGP5cT4UWDiVcA/ldEE6XqSHVveiyjDAnBaLTQXxe/iFVk7I0uv6dyziIy9MnKFFS0I
	JXZbfEFlgZ5mmNllrSolYZlbUSPcGojPGovkD7R+7tYK9Baab1NRJFZrTuKVJ5ybaYsxDC9ZsfI
	xLJFddiTfRfKIhoSo+u86AFQa/YdQMOO0rH4p/U7aNVNp+aEFSLt45qZcaBaHhLcq5OChTYotVH
	PAaHAzR/CSERxf6eKMRjTHwX52m+PJRMETQlo3eaVva61hjELCY9/1UpA5Oh2HE6FCZoFp6cs6m
	buNaKF08AjHCubq/UCWhwtZQ850jeR3j4+PoBQefOY9/CdUDOGxLcCqup4=
X-Received: by 2002:a05:690e:484b:b0:670:f743:6eb5 with SMTP id 956f58d0204a3-671030a9c66mr1404195d50.19.1788948981459;
        Wed, 09 Sep 2026 03:16:21 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb4912962sm11717181d50.12.2026.09.09.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:16:20 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:16:16 -0700 (PDT)
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
Subject: [PATCH v2 17/26] mm/fbatch: no lru_cache_disable() in
 __alloc_contig_migrate_range()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <84ed3bf8-da32-3447-0577-052c5d1a56b2@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Remove lru_cache_disable() from __alloc_contig_migrate_range(). It does
not now benefit from lru_add_drain_all() first; and gains little benefit
from invalidating buffer head LRUs first, since 5.0 commit 80409c65e2c6
("mm: migrate: make buffer_migrate_page_norefs() actually succeed").

This will be more controversial. lru_cache_disable()+lru_cache_enable()
were brought in for CMA page migration, see 5.13 commit d479960e44f2
("mm: disable LRU pagevec during the migration temporarily") through
8cc621d2f45d ("mm: fs: invalidate BH LRU during page migration") - I
guess the testing there must have been on a 4.19-based Android kernel,
without 5.0's buffer_migrate_page_norefs().

It's possible that invalidating BH LRUs perhaps 0 times, perhaps N
times, will average out worse than invalidating 1 time and stopping
everyone else; or that folio_test_clear_lru() failures manifest more
than before (note how folio migration has retries on raised refcount,
but isolate_migratepages_block() no retry on failed test_clear_lru).
But let's give this a try and look out for regressions.

Don't delete lru_cache_disable() yet: leaving stale folio pointers in
the per-cpu fbatches, with folio_try_get() yet to come on them, would be
bad for memory hotremoval: the lru_cache_disable() in offline_pages()
protects from that.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/page_alloc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..3e085a25a776 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7147,8 +7147,6 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		.reason = MR_CONTIG_RANGE,
 	};
 
-	lru_cache_disable();
-
 	while (pfn < end || !list_empty(&cc->migratepages)) {
 		if (fatal_signal_pending(current)) {
 			ret = -EINTR;
@@ -7182,7 +7180,6 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 			break;
 	}
 
-	lru_cache_enable();
 	if (ret < 0) {
 		if (!(cc->gfp_mask & __GFP_NOWARN) && ret == -EBUSY)
 			alloc_contig_dump_pages(&cc->migratepages);
-- 
2.51.0

