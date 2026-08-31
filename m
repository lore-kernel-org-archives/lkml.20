Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6204D3DDAED
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171212; cv=none; b=LBPGzTzst/CT/85kzTHaSOggN/zTnwAGvvJHMzNw0dlbKAvALv9HqCI0o8JTVjVNC37O5Eh+j7InyPMZqYwjXHmle2K7M8LtWL/kommnMfxg5YY+/+d0KAK7BdOf0MKRn4Zvjh7BxSmdyNpPRWlsfa9La6kET/gjOc/a0wyID98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171212; c=relaxed/simple;
	bh=nAaI25J9nKaPHwn96ct79MsYlooxdS3n/qgazVKWIFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyJ7YFdwa34k4sO/GCvcRzoUBtBKHP4Vcscc9+UUfN00GOE1DvIf7K88sB/kylZYxDVe6XgTYqGz+M7F4/VnLgEJT7KxE1GsPJAO6VXK7y2kqNlYj6nUX3rL2iezwl7cYXvZBYm3eIRPFhoH6uQIpJsAu8QwfA30CXNd0QrinR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cnZL2NY8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cnZL2NY8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D43014BF;
	Mon, 31 Aug 2026 03:13:24 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EF5C3F85F;
	Mon, 31 Aug 2026 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788171208; bh=nAaI25J9nKaPHwn96ct79MsYlooxdS3n/qgazVKWIFg=;
	h=From:To:Cc:Subject:Date:From;
	b=cnZL2NY8ZWMhShcCvjAoi0MLZcRQmkdVeJgwBv8Gvu1K4wK4kM64Ja++SsdLjQYFM
	 hu95J0iYKE4pZJ5ne9Ubn42z8ZdgMEXTPSZNDCUmrWMOnLHzPFgz+ETMZMMGHGcqYa
	 SXy7h3sMOOUf+7Zrs6OyL8NMg44lN3cIg5w/AT6I=
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
Subject: [PATCH v2] mm/gup_test: report actual pinned bytes
Date: Mon, 31 Aug 2026 15:43:04 +0530
Message-ID: <20260831101304.162867-1-sarthak.sharma@arm.com>
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
Changes in v2:
- Fix typo in the commit message

v1: lore.kernel.org/all/20260831064808.77768-1-sarthak.sharma@arm.com/

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

