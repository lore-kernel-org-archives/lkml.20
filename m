Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACBF372B57
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467936; cv=none; b=Ppvp41nPs9ZTEw0+wr/pF3VCQAAPBGK2RXQzdnTp5myAZ8EYQp5ZcOzJTnhrl5TKI4GZHCwoMIL6b2kNcl4PyxpW/Yb3ulfYNAjaMM/AsZ5qgYBXJRLGUXYGDkR110CjKM4b2mW0C13PdiHTD3aZaFZsFnxZC3jRJdCAw9TqIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467936; c=relaxed/simple;
	bh=QSQQNG/X9SZNNSgdUIC3WO0lkTHMqEVH+D2pHmZmnDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elfOe/qrzN7qHHtTOFYNk+ii9klIE2ljaku8LdMT8tnGuW27yr5yikRVqVVL+AcD3X4nxyziYKJVf0h7ZmchW6qhagrSlmQYLf6zVINT/nE1EZVnsoxInHp9NdDSu5eZ2onLBeKfYgKXLumcuJzEJs4pAZITnHyOj6dgRiqCVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iTQIOELw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iTQIOELw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E1F0152B;
	Tue, 15 Sep 2026 03:25:30 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C7623F7B4;
	Tue, 15 Sep 2026 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789467933; bh=QSQQNG/X9SZNNSgdUIC3WO0lkTHMqEVH+D2pHmZmnDI=;
	h=From:To:Cc:Subject:Date:From;
	b=iTQIOELwGV42ckI3KJMQwpU/U4rjCE7qHqaU0eXVCt3gRXAWrxbN2fdVgvNiy7feW
	 uU/vkp0t1sGoW3zggyUWi19gbQGESdYH9j1LGbvL8dT62qLC4k2XmDNqWu5BZpMDjq
	 bfaQE2FuMbYXSNDMnEsNwmFS7nKIvB4Xb+EySXek=
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
Subject: [PATCH v5] mm/gup_test: safely calculate GUP batch size
Date: Tue, 15 Sep 2026 15:55:24 +0530
Message-ID: <20260915102524.125758-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gup_test_ioctl() calculates the end of a GUP batch using:

next = addr + nr * PAGE_SIZE;

If nr is too large, it can cause next to overflow and wrap around.
If it wraps, the next > end check is bypassed and a large value
of nr is passed to the GUP call, even though the pages array was
allocated according to gup->size. This can lead to out of bounds writes.

Also, when fewer than PAGE_SIZE bytes remain, the calculated batch
contains zero pages. The code still calls GUP functions with pages + i,
which can point past the allocated array.

Calculate nr by taking the minimum of the number of pages per call and
the pages remaining in the address range. Reject zero sized and non
page aligned gup->size values and zero nr_pages_per_call value.

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
Changes in v5:
- Make the batch clamping logic easy to read
- Reject zero sized and non page aligned gup->size and zero
  gup->nr_pages_per_call

Changes in v4:
- Simplify batch clamping logic as suggested by Kiryl
- Don't call GUP functions for an empty batch
- Drop the pinned byte reporting patch since it has been applied to mm-new

v4: https://lore.kernel.org/all/20260903115033.162218-1-sarthak.sharma@arm.com/
v3: https://lore.kernel.org/all/20260901083452.115365-1-sarthak.sharma@arm.com/

 mm/gup_test.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 185ba3bb8ed1..ba74bf3f4104 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -116,7 +116,8 @@ static int __gup_test_ioctl(unsigned int cmd,
 	bool needs_mmap_lock =
 		cmd != GUP_FAST_BENCHMARK && cmd != PIN_FAST_BENCHMARK;
 
-	if (gup->addr > ULONG_MAX || gup->size > ULONG_MAX)
+	if (gup->addr > ULONG_MAX || gup->size > ULONG_MAX || !gup->size ||
+	    !gup->nr_pages_per_call || !PAGE_ALIGNED(gup->size))
 		return -EINVAL;
 	if (check_add_overflow((unsigned long)gup->addr,
 			       (unsigned long)gup->size, &end))
@@ -139,11 +140,9 @@ static int __gup_test_ioctl(unsigned int cmd,
 		if (nr != gup->nr_pages_per_call)
 			break;
 
+		nr = min_t(unsigned long, nr, (end - addr) / PAGE_SIZE);
+
 		next = addr + nr * PAGE_SIZE;
-		if (next > end) {
-			next = end;
-			nr = (next - addr) / PAGE_SIZE;
-		}
 
 		switch (cmd) {
 		case GUP_FAST_BENCHMARK:

base-commit: b08a65b93426d86e3f354d655d6225397b591877
-- 
2.53.0

