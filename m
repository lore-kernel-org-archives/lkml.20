Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787475;
	b=onHUX5Z0peOtYpYi0I4zrJII3rctbagIk1x09rYSbEABIRr69hlnfupaCdkXo5MXHf7V
	 CWOviRB208YAaCsy7zDme1NCL81YmBdT2cP+0BT96xGIf43DlWQdePe+EwT5Nwig/MK8O
	 O9r3tiMi68F4lQxXJq1L3NNRm2DgeyYdZem0BrHR17OB6RYBAhWWE8eE6FuiJlUKt1Y5C
	 waHVExPJZb/XbpIezhqSvbKVnSWoQNFTwCvq3TMrG/Aqwe9Pdj0IxB8I5Cy71X4IuBaMM
	 rN7aMjq/BG61XB0RooTIyoLHbFDPzwN+xmm8A1+6huUWPQFIl83MTbh2L8KkgCddCpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787475;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5ut8NFXKl0VORDomAfnUZx+oz3sFVutLuYOBR9qWWWI=;
	b=DvDkMweKq2uE6wzfnTQyZjHJqmJJ1Hmn0t9wo/0C+efX3t2Uf8l1feu3v9udCV+jbqYx
	 MgOYwJB0gbKI/n5KfF7/qJJAwb4Mtb0iro48xLdUYVdKcCECJ6nawuw1UPyyeTOf9xf6z
	 YGYj2XIRrVeB/i8V5NIVH1sFsAkICXU00jzeI5+Mub6XE8Dzvt3neuNQeOvVCP4I8+1uE
	 Kr0S3sroSDz5OFialJx9eeI9MEjdBada8yBiw7u4qqqETbFZLJxAJ0xI6tn/KwOhLsUUO
	 A1vwCfdlLc9ieHHJtnPdkFW0o17PKXCtq528nW1qEEHwHqN+g0oD4R8jdRZMu5ntTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5OIqhcm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94796606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5OIqhcm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700371F00A21;
	Wed,  4 Nov 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787475;
	bh=5ut8NFXKl0VORDomAfnUZx+oz3sFVutLuYOBR9qWWWI=;
	h=From:To:Cc:Subject:Date;
	b=U5OIqhcmplDBGx9vswk9PzFZlp6UpqvHgTvJJ0hm4ECIb1Q9fUkdB4qjnkZL4EOih
	 5PtkmXx0Lbgir1/JBrQl9yP9nYEJVF0lXv3AdRCoEtg01IGbpTI/4LG4w5/pzNdUrN
	 rlgfhZFAFkIyhnHQ4Hv6VoxgZi+72k3WEVn6rzRry8bba69gdVLaGKxmBYgDJl6RyV
	 TNju47K6xZqj+2W3hz3NFYT1788hvLuzg7HV+sm40y20vxs8gZfeal8AdWoQQk4/VJ
	 gSOMjtTXeRp+rSzSqeUjF1eyNt6594beL8DxkUZkcnSdKfL866CjkxZ8iOa8d0K09F
	 ertV/j1THPnFw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id BC367198003A;
	Wed,  4 Nov 2026 05:17:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 05:17:52 -0500
X-ME-Sender: <xms:TwbrajJyc_t1RXCW76DvdHvplB0es9N7dYshaKKkqmI5svknOFwKAg>
    <xme:Twbraq1-ngiZe6P7LsXlbe2DzUFTim9loS1jg6I3Vld4h0lIqNPJfPHeGkgARoL8H
    -1bkzQ_uSvOrpHNZPKSerRFotCmAKmGVqVMbPGwg0SS7R8KlQkR8rY>
X-ME-Received: <xmr:TwbrakWrPqa9fs8ZuBtdAb6dnV05Uni52dDBr8XPH6PFRBTlio8wAybRNmc>
X-ME-Proxy-Cause: dmFkZTERwdTXLLvNujcwJRmJQoRSjUeo7y+uZlkVzWGPKNwqwPt3Do/dFsSwwEGd2cYbU3
    ZlMRSjp6hREE5FxEap8oN12Q5oo2+mh09XFzv4qg/3iVrUoQu6ls4cVtL27Qbdv5oZsnUG
    nrDo/2lNW4RophliGyKDS2Fivykj/V+vRC9OVFaVdaB7mipj/KWjTBuGKHKmGc/meKz+Ii
    uZ1bqBtutznT8LjL5UsprQCTJz2CcYMKICqv6lNQenhHvANlbIXj0zvC7G0KBZ2VPerqG5
    ASJrFYoDZP5hwVITdNAWMrO90juZA8nBdS0fdVGifTDLzcGh9eU+hOQfwDbj0iFarezsVS
    NoL/wMGiqePSjUqwjeM4zUJdmRyj3ovSv5KV0NJ96UgaXSnI7b4fQMznc/cq7UCvim7agH
    6ySTqS+vaAGZoWzPuBatz3eHTnpApJrZT5qXonMTYpvhYrwjv04LY3VQEFa5qraKQaRdn1
    LDnIeHwUXRkT/hmeoytXNss8bIODaFT7k1xOub8iIhOgFi8NUHwtV7WEHSY+pXn5HFbV+f
    jk5hCVGOgaLjET6YsKyJDj6qPbPUL2aoXnO6U0naXL9BBRf0+fleGAr3rty5Sasewuqcbc
    gmzPdEenxf76b3QPAGEcuDvHXJ09hIargW7nFTijod8c42Ew+7xVTlgbFcxw
X-ME-Proxy: <xmx:TwbratwxqwB5vulkh0Qk4xLFsj7KgC7HFozUsxDavWx_6nRxGbRnRA>
    <xmx:Twbrarxq6vWDF0pQLDpi9wD7_P3cLMOmrl5pLYlrgbOMrhHWWBqHPw>
    <xmx:Twbrai2ZIlz-AIwDuR8hp2yxi36KnAsVwDCqi5c4GGDIQZQf7maPJw>
    <xmx:Twbrapo5UW7BvgfcvtcaG01hIbbkjf-uJ77MPw9MyDtag6nzPcbJLg>
    <xmx:TwbraoBiLtl3o4BN_BWqL3mWKSUe3qmcKbH5AkeE7ihTAJApj2GclvsY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 05:17:50 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/compaction: sample empty pageblocks again from a random offset
Date: Wed,  4 Nov 2026 10:17:46 +0000
Message-ID: <20261104101747.2485913-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once the free scanner finds pageblocks with nothing to isolate, it checks
only every stride-th pfn of the next block.  The stride doubles with each
empty block, up to COMPACT_CLUSTER_MAX, and async compaction starts at
the maximum.  A block that gives nothing is marked skip, and the cached
free pfn moves below it.

The samples sit on a fixed power-of-two grid and alias with any layout
that repeats at a power of two: when the free pages sit off the grid,
every sample misses them.  With one free page in eight, all at
pfn % 8 == 4, a stride of eight or more sees no free page at all.  The
free scanner runs into the migrate scanner, and compaction fails with
most of the free memory in the zone untouched.

Tasks then stall in direct reclaim, and huge page faults fall back to
small pages, while gigabytes of memory are free.

Real memory is rarely this regular; the test below builds such a layout
on purpose.  On a 32G VM it:

  1. fills memory with anonymous pages and pins one of them in every
     pageblock;
  2. frees one page in eight, 3.6G in total;
  3. creates a million files on tmpfs with defrag_mode=1.

Direct reclaim entries (allocstall) and the time to create the files,
10 runs each:

                           allocstall
    free pages at          median    max      time, s
    pfn % 8 == 0                0      0      4.6-4.8
    pfn % 8 == 4               86   1544      4.8-5.6
    pfn % 8 == 4, patched       0      1      4.6-4.8

Sparse layouts hit a milder form of the same miss: at async compaction's
stride, a block with only a few scattered free pages usually yields
nothing.

Keep the aligned samples: the head of a free page of the stride's size or
larger is visible only there.  When they find nothing, sample the block
once more from a random offset.  A random offset is the usual cure for
aliasing: no fixed layout lines up with it, and one free page in eight is
found again within about eight blocks on average.

The second pass at most doubles the samples taken from an empty block.
Pages scanned by the free scanner stay within run-to-run noise, both in
the test above and in an mTHP fault benchmark.

Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/compaction.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb201..475b3a645122 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -23,6 +23,7 @@
 #include <linux/freezer.h>
 #include <linux/page_owner.h>
 #include <linux/psi.h>
+#include <linux/random.h>
 #include <linux/cpuset.h>
 #include "page_alloc.h"
 #include "internal.h"
@@ -1797,6 +1798,26 @@ static void isolate_freepages(struct compact_control *cc)
 		nr_isolated = isolate_freepages_block(cc, &isolate_start_pfn,
 					block_end_pfn, cc->freepages, stride, false);
 
+		/*
+		 * Free pages of the stride's size or larger start on a sample,
+		 * but order-0 free pages spaced at a power of two can all fall
+		 * between the samples. Sample a block that gave nothing again
+		 * from a random offset.
+		 */
+		if (!nr_isolated && stride > 1 &&
+		    isolate_start_pfn == block_end_pfn) {
+			unsigned long pfn = block_start_pfn + 1 +
+					    get_random_u32_below(stride - 1);
+
+			/* The block can be shorter than the stride */
+			if (pfn < block_end_pfn) {
+				nr_isolated = isolate_freepages_block(cc, &pfn,
+						block_end_pfn, cc->freepages,
+						stride, false);
+				isolate_start_pfn = pfn;
+			}
+		}
+
 		/* Update the skip hint if the full pageblock was scanned */
 		if (isolate_start_pfn == block_end_pfn)
 			update_pageblock_skip(cc, page, block_start_pfn -

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

