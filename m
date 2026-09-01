Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734AD472088
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251707; cv=none; b=ex9m8R5578bLR1HQo9FAzpDYqSGDcNrYE/SWtPNY/1toRjeRwNeIts4QB5dXUATtTD59P5OWjb++eCp8t1Fajag1n1nZgcDjfOlaKSY1BTADW32JY3P2ZN8XYqlcrQafUgIRcfHxIaNusMPl+g5qIf+fe848/F5bohZp17GfDJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251707; c=relaxed/simple;
	bh=01OSK1dnvT0YlysA5p5+l4Ifl3lB+5p66nSfIvzM40I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv3tgo3aSNrSnltg+k9fZVBRHUEasvpbt7xzE8yTVlgsZOVPDeKdvaMM/72FOMHNvwKgFR8wjTNtNS9OfNVS8KDqqkiTkkF1Z2luWDK8bvp673YnojgITXGSsq+J98/tB3EZDNiNS/6h2hbI6zAgs5ybsK/Yf0hlghrMYHuczY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RVdmaqYB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RVdmaqYB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE8C143D;
	Tue,  1 Sep 2026 01:35:00 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBE093F882;
	Tue,  1 Sep 2026 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788251704; bh=01OSK1dnvT0YlysA5p5+l4Ifl3lB+5p66nSfIvzM40I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVdmaqYBgbzZk60+h641RIfkq7oZFXC/JfsuqxHADWz3/2LUzWEqUdz9TltVgKPiF
	 w1ODnyplswTEaj9K/mpBHIqcyW5sG/YjUyDk9ND6XhMFBE2kLiB4kbM96JL1jGVPR6
	 3Awzd3MeVhS2DtbOm1Iir07g4w+02o7eJ44JVjZs=
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
Subject: [PATCH v3 1/2] mm/gup_test: prevent overflow in GUP batch calculation
Date: Tue,  1 Sep 2026 14:04:51 +0530
Message-ID: <20260901083452.115365-2-sarthak.sharma@arm.com>
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

__gup_test_ioctl() calculates the end of a GUP batch using:

next = addr + nr * PAGE_SIZE;

If nr is too large, it can cause the next to overflow and wrap around.
If it wraps, the next > end check is bypassed and a large value
of nr is passed to the gup call, even though the pages array was
allocated according to gup->size. This can lead to out of bounds writes.

Compare nr with the number of pages remaining before performing
the multiplication. Clamp it to remaining range so that next does
not overflow or exceed end.

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 mm/gup_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 44c1cdfb9c37..910cbef709b4 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -139,10 +139,11 @@ static int __gup_test_ioctl(unsigned int cmd,
 		if (nr != gup->nr_pages_per_call)
 			break;
 
-		next = addr + nr * PAGE_SIZE;
-		if (next > end) {
+		if (nr > (end - addr) / PAGE_SIZE) {
 			next = end;
 			nr = (next - addr) / PAGE_SIZE;
+		} else {
+			next = addr + nr * PAGE_SIZE;
 		}
 
 		switch (cmd) {
-- 
2.53.0

