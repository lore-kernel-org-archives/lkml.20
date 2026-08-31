Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F8435E1A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158901; cv=none; b=X/w03Doob2UAITH1MxqD1nSm/bet1+uwcdxRWYB+bNRSeCtPy0GtSdHIyfl19DVt/iSi4CPQG6YXCX0hJkP+PlNcAINByjS25HAqhWBFZ32H3/+mU2jWM4ndEIRoA5K2eaOFqm1VQ9bCnLJaHKCvL8XzU1vm/vSwslgO8yxYfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158901; c=relaxed/simple;
	bh=5olqPp+uoUNvpv37aMdMlkQLle9Ih+Y/RgwFUi6iT9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHg7r74UhoFx9DSjoCTDiU4GCdoFf+SHspuei/rw3aJb0MH6GQHHUd3Zott9KWuFBOOJtkd6QiwTCzo3QzRYaMeHGKyubNByOLmx38/lr5rsDb/QChmLSqozIlkqVXImNL5PcVN5wc1Q5v1wjImY5sottB0pmv8QzMovlpcEI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DTT6kbv4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DTT6kbv4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7ED214BF;
	Sun, 30 Aug 2026 23:48:13 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D48E83F8C6;
	Sun, 30 Aug 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788158897; bh=5olqPp+uoUNvpv37aMdMlkQLle9Ih+Y/RgwFUi6iT9U=;
	h=From:To:Cc:Subject:Date:From;
	b=DTT6kbv4UG5s8P5+bjJdSX0aemh/+OhrvlfrqUoL0zHbeVi5RRBshFICR1Sr9YuHi
	 MTNsNCg8h82qS1jkg5TwiL1dVKAzh/BUokl8Xq4h2649HNEb2BPDmaM72azzaKiwCT
	 LxDLLGYtYORTKij/gBSlNcrXsDkgGS7QkxksyriA=
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
Subject: [PATCH] mm/gup_test: report actual pinned bytes
Date: Mon, 31 Aug 2026 12:18:08 +0530
Message-ID: <20260831064808.77768-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gup_test_ioctl() advances addr to the end of the current batch before
checking if GUP pinned the entire requested batch. If GUP pins more than
0 pages but less that the requested batch size, addr still advances by
the requested batch size.

The next iteration detects the partial pinning and breaks out of the loop.
Again gup->size is calculated using addr - gup->addr, so it also includes
the unpinned pages of the requested batch.

Calculate gup->size using the actual number of pages pinned multiplied
by PAGE_SIZE.

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 mm/gup_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 44c1cdfb9c37..185ba3bb8ed1 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -188,7 +188,7 @@ static int __gup_test_ioctl(unsigned int cmd,
 	nr_pages = i;
 
 	gup->get_delta_usec = ktime_us_delta(end_time, start_time);
-	gup->size = addr - gup->addr;
+	gup->size = nr_pages * PAGE_SIZE;
 
 	/*
 	 * Take an un-benchmark-timed moment to verify DMA pinned
-- 
2.53.0

