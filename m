Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA347252A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251710; cv=none; b=G5/16/WmI45hqT019ll8AFi4ticZFMO84K2YwTVl84OF8jvfSb7Vf0lJuZ5iGaC2Ft3eNK4/hRk+d5L4tH/1RtGqB+CGZgsQio0cmd6PTcEXIk6GQnKlnuipV2ejytibIDkej9Bggi5pvdIEgLnHg4OAz3uwOdTDcJHEJkUSmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251710; c=relaxed/simple;
	bh=GvLjJUcXhtcVH8wJW846Q0j/NBaak9ZJzUMfNxwi5y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0l07UxaXxUBkf1g78XasQcKnZ6vd68bZBdMMGubJCAlz2kgri8MCsOfsfoojcLjliPbYoQ7wUwCxlshIieeyje0c6ssB0Mz8MkRggMNoxRBLCRY2Uw+lMtP8JPezY281mYVGd/jWRHh6rYjEht1bBq018FOv3hdjrMwsAB77gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O4JL6jpa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O4JL6jpa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6513143D;
	Tue,  1 Sep 2026 01:35:03 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00C053F882;
	Tue,  1 Sep 2026 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788251707; bh=GvLjJUcXhtcVH8wJW846Q0j/NBaak9ZJzUMfNxwi5y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4JL6jpav4DOxUbUtj6dHl9/2XGZ0dy6ktHBRQzd6qiG/7S+BKcnt/QSqp+AMtziH
	 W6KpXsJBUyv3fP0pZav4p0c2jn26hAQ52OjbFLADmdG3oSviStp10QcfnbNiMZGwmG
	 XjPlU1KItQWTnsvW0AZE7qcUrI7KWI+rGIj410Ws=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 2/2] mm/gup_test: report actual pinned bytes
Date: Tue,  1 Sep 2026 14:04:52 +0530
Message-ID: <20260901083452.115365-3-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901083452.115365-1-sarthak.sharma@arm.com>
References: <20260901083452.115365-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gup_test_ioctl() advances addr to the end of the current batch before
checking if GUP pinned the entire requested batch. If GUP pins more than
0 pages but less than the requested batch size, addr still advances by
the requested batch size.

The next iteration detects the partial pinning and breaks out of the loop.
Again gup->size is calculated using addr - gup->addr, so it also includes
the unpinned pages of the requested batch.

Calculate gup->size using the actual number of pages pinned multiplied
by PAGE_SIZE.

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 mm/gup_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 910cbef709b4..b72f59a89c1c 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -189,7 +189,7 @@ static int __gup_test_ioctl(unsigned int cmd,
 	nr_pages = i;
 
 	gup->get_delta_usec = ktime_us_delta(end_time, start_time);
-	gup->size = addr - gup->addr;
+	gup->size = nr_pages * PAGE_SIZE;
 
 	/*
 	 * Take an un-benchmark-timed moment to verify DMA pinned
-- 
2.53.0

