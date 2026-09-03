Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057D44908BC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436264; cv=none; b=mYHD0FhrsOzq5fHFvgwmu+RjkEHJZapsFN8qbfXvTRey01Sv/k4JJ4lGY5CCrWbD8RvmyQVSJd9aZuKXv/tSbXKZq5RxDYUx81X6yuejX+doBtDqkpuCEMzdrR74nZNLmP/FNV1z5AgokxW9BAF/92KreSv5xJx3vaUUIbnPH+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436264; c=relaxed/simple;
	bh=xNHHISyqPXjg7FpKlbhA9xX4vuE2G4pegx1UqDrG7mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5YACtLKv61ercghsRzjs7l/3nN6Bxb0tWi0Hv0k+Ez9Yc+DRV9eTXjl0SS3PhxRMoREkh9/TdhrqAXSKIk6MNDyOcwj8jo2/wKiofHhfaIhIzGesR904DBteh5kr3JCwFKrl4t31DQlthz/yZFwf6l3UGwnbKQeDgceS62Y8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OYX9u3rV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OYX9u3rV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BD381596;
	Thu,  3 Sep 2026 04:50:46 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F4A13FA32;
	Thu,  3 Sep 2026 04:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788436249; bh=xNHHISyqPXjg7FpKlbhA9xX4vuE2G4pegx1UqDrG7mo=;
	h=From:To:Cc:Subject:Date:From;
	b=OYX9u3rVZbf/7HMtRWU9PE36MB1xZwLL4V5baneauVMSsnB8JWcJmug3RYeXRLopG
	 imrOYLEEFVgUTcdWMrzGn1D2vFmf//Jc5QDJFOx49Td8U7RKkFUa/oKIAk0qVH6q28
	 Te4jV0gcy4j/Y46jiobGg8THCPzgaR5kaGZ8tylQ=
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
Subject: [PATCH v4] mm/gup_test: safely calculate GUP batch size
Date: Thu,  3 Sep 2026 17:20:33 +0530
Message-ID: <20260903115033.162218-1-sarthak.sharma@arm.com>
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
the pages remaining in the address range. Stop processing when no
pages remain and calculate the end of the batch using this bounded
value of nr.

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
Sashiko reported the issue fixed by this patch while reviewing the patch
"mm/gup_test: report actual pinned bytes". That patch has been applied to
mm-new. Since the two fixes are independent, this revision contains
only the GUP batch size fix.

Changes in v4:
- Simplify batch clamping logic as suggested by Kiryl
- Don't call GUP functions for an empty batch
- Drop the pinned byte reporting patch since it has been applied to mm-new

v3: https://lore.kernel.org/all/20260901083452.115365-1-sarthak.sharma@arm.com/

 mm/gup_test.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 185ba3bb8ed1..1b64e932c4c5 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -139,11 +139,12 @@ static int __gup_test_ioctl(unsigned int cmd,
 		if (nr != gup->nr_pages_per_call)
 			break;
 
+		nr = min_t(unsigned long, gup->nr_pages_per_call,
+			   (end - addr) / PAGE_SIZE);
+		if (!nr)
+			break;
+
 		next = addr + nr * PAGE_SIZE;
-		if (next > end) {
-			next = end;
-			nr = (next - addr) / PAGE_SIZE;
-		}
 
 		switch (cmd) {
 		case GUP_FAST_BENCHMARK:

base-commit: 178b3d97bf1f15f598ea7cc615a40c115e528e1c
-- 
2.53.0

