Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360F5650E2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997922; cv=none; b=oJwgbJAbf+nb1EGF5FMjo3uWxR5AMjZcbH0OFxWWWnUI+GkQWOwIzJcLW00fQfBIdKxKkE8joAkZBnsy5VsXYF/y7pcQH3qkhuBpDDUimZCxQjqNMguAinKVtAwYkqyWHd/iPKtrEMKvIeIiyFYo5VkrNjOwV/+O2zBwCxyo8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997922; c=relaxed/simple;
	bh=yVWMAa0LdrRW5kVE70XJV08sLfAulrdX2+gzwz74CW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVnZ5XVhktfdhIQEbVKoU1ZSxB4aGHfPP6HTQQfRGXRU0h7v7eKinuWQGhHoeKs5HAqCeBMt/ps1YpzGvsIB5jzN+irk47HbxYufBuHtSX9fCKlY56SWuh+/NthoI32QIDe8Fsilxn1PFK3EumOQl0H1rVdwiSvYqvRassKVXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1vzxzvk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1vzxzvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310461F000C5;
	Wed, 14 Oct 2026 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997920;
	bh=xnM5tXKHqKAzAPDgBm0il7teipuFZt5qvwJKQnZtJVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V1vzxzvkb0t1vP2/vb2ehMLQsvyDHASDNzzIic3Xhv/GaTMfdyazdqU3i5IYepz1V
	 R9gHNr6ZbQCWV3XWw5Kb/Gk3m12eELbGAYcvdkhZlHbfislRFcGNH6JUhatUXdYDii
	 TmibMNXV3cR58zghDoiNNcwSUoHvTioJbHiYm25snx86saT0biSIAsMc//kCE//xas
	 dibOz2eZ6I2mpuIo+7eEA5pIAXMM1OAieXGBTPRflk87WcYkK/ljMWL4YuOXvx01nl
	 XWToQfURSAr8IMdeXXK/NV+3pr5QR7A58aBSkYmrqVFbsL1GNBz8x0bJgr4pBfE9xR
	 LRU0P1/0HQIVA==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6E7E5198003A;
	Wed, 14 Oct 2026 13:11:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 14 Oct 2026 13:11:57 -0400
X-ME-Sender: <xms:27fPajARk9a3Pyym9tbhOZqMyKfVJ358QZuATTmOrjvbsjehbsj4xw>
    <xme:27fPalcwlD_oT1cFhlZ4XR5PcIm7MswjaCeqPVEXROI6CEltvXFylexFAq8dzbN8H
    EZdX4DCwDb6FoVuXYXCoQBccIHdfiAaYcJU9QHfZK1YBPB3UVSygdSl>
X-ME-Received: <xmr:27fPaktbnPqhkOUvvb0me5XWIuhKwZUdv1ALnUt_-qPLbLvMvrvEZ4pPoiY>
X-ME-Proxy-Cause: dmFkZTFAhxxCN9RZF7RgZjl+zblwyI5MNEPViosmoopuImm91zea8n//qrkhNFSUiWcXrp
    MH3eAot5Fj3DZ6VPT64I9vPg0QCUCtDiiTqiv8NQX359J2cSSSZjsC/tyd/Imi5LGIf6hL
    s8CbCEIaBNMBcUHGn/aH82L6PPlafquguz3Z2sEDXsDmuHj2yqTheZQ+fxDOXfR22hlOrP
    qRQ5NbmvpkXKG3iXKhgkLsRulP4SRlPxiR6IgNv5RFr6apIBiGIzyDvrozd15QkLVz/8fH
    sBuTJDigvLKTgofLjjaL63tWUe5PXp+yZe8Mz9HWr0e1U2Y281/CsnjjHOQDfmMGadQRi5
    trOfJroYnG+Q2vdNbLtQJUsjPv4CT3NLxUPxQCQ/DX3FxZsOSGet1UpNslLooeixNqWsmS
    +CuoSbYtktoqBV2an0SVyzxO932XwM/TUdnl8MZkybitfE7bX3k5R6sDqMKeFDRu8BMo1L
    oI9DcAdK8YivMXIbDj0LVpLeULm/R7mccs2NidtSgQy9/0wKhyAesYi60aZR3rYsd5gtFT
    FfqEEJKyZlFYLzY78Cf65kWJ5pbASO5ZHTq2vTqvssFQkaf/P0K5xX8BemeRqsE0rKaBS4
    xJQW67i/aaWzX5au2k5XJ12SoVB+qBuEEo+YoTJohjZwRFm9rJ7I0GvYjKNg
X-ME-Proxy: <xmx:27fPasIZYoRFpDOg8ubPGvh3AW6bN6WtOuTvNeqjvmaBBtYOh030-w>
    <xmx:27fPamb2gIjFcphxLoz-N3Za8Cq5bGMMD9X2vsEkhfzSgqp9r539Og>
    <xmx:27fPaiIpeTOqHd4Zi5_MbwyihFmiSdRbg3uULOs18FbBiv_FXbq0EA>
    <xmx:27fPavougncc5ainOHXYtXPnDWvXiqH_lqoI4UOrEfNc53kuJ03-8g>
    <xmx:27fParAzNVVaeeZBIJXTQr70ClC2k4hAmat-_WPBLJ10Yc4Hbb4HKt7N>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:11:55 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 2/9] mm/khugepaged: count collapses where khugepaged makes them
Date: Wed, 14 Oct 2026 18:11:35 +0100
Message-ID: <20261014171145.3292736-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, and
tests cc->is_khugepaged to know whether it should: the counter belongs to
the daemon, and MADV_COLLAPSE must not touch it.

The daemon sees every result of every collapse it asks for, so it can keep
its own counter without the shared path testing who called.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75c876acf527..4979a93e3648 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2815,10 +2815,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_assert_locked(mm);
 
-	if (vma_is_anonymous(vma)) {
-		result = collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
-		goto end;
-	}
+	if (vma_is_anonymous(vma))
+		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
 
 	file = get_file(vma->vm_file);
 	pgoff = linear_page_index(vma, addr);
@@ -2854,9 +2852,6 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
 	}
-end:
-	if (cc->is_khugepaged && result == SCAN_SUCCEED)
-		++khugepaged_pages_collapsed;
 	return result;
 }
 
@@ -2933,6 +2928,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 			*result = collapse_single_pmd(khugepaged_scan.address,
 						      vma, &lock_dropped, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 			if (lock_dropped)
-- 
2.54.0

