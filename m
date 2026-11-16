Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810998;
	b=WM1QKaBFdeZqAJpFRvB7Unr91dTOytvfwWVZKLw90aycde1zxplNjW+3CJ8AvqkeCp9b
	 OvwD74BaabcPljHmarixd2H6K78cvGeLsY7QpvWWii8JNdP60TRoJLCVEljW9UuMgeVZN
	 jODHrVHskrNbIqpiuLmnrIV5Gll2fyq9T4JDPS5qWHB5A3+DLe6GMm3APTb+EF7S63Kzb
	 KOCA3QgU0l4yXxz0Cqfu2MOf19moCh3ynBg6HWqJb5Zcty88QWmfh1XcsvvPcKXjQc+Eh
	 XMv1b/in1mX9lKhwaTPPGRhB10Yn+WSyumZV2VC2B8q19YTiRi8BxIvCIFEAvg11o4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810998;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bGG8fJWiVLN4rBloB6l6LP9fwezC9+FtgrPy8Y99xzo=;
	b=bcPw6GUDOXgU8v0q0nC6L8oBeG6+/ZUYGD20L4qu4F284wljCSb946ewLF7P6YVpXYYS
	 NpIWJzsqYetO5MK8qQQtlyoHzpmbS41wsXsuqK+Zugxu0hrjsvylKNqeqY6ta+QK1IHR2
	 aJ4BZ06d29K6gDFAfrrtAYtjhcE9e7AQZIWl412iMlRkdjrYhFY4r2DAPQhBwNE+/MRJP
	 HOXUHUHI2+ADmlW8+B3DTiA83tx1201PjNaxIhHlIlK5TOs0i/iGKs142RX7u+MKoI+nR
	 KAJntQHDJGNMwV5hNTGAFw9KKt9xvAjDZ8DaL0dNl9M5psKc1eIB3DHBXbbtZXRHyhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KLMNlCQY;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40407606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40407606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KLMNlCQY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X9w4h4OFbGo7OVBtANSE6gWeEcgqw70QG2tZixDGK8g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794810996; v=1; x=1795415796;
 b=KLMNlCQYhmLCVnrnszOFfT+rMJ46gPccZaFkEkubwn4U2M+vgPiciINABWPKugWKs14mhBIH
 ij75iSZRLFHNteZ6AlN6T6Is4aXESdL39gkVwAKWZU59oGNVU+OQB1+AW8N7+aEJXFGCTF7u7lQ
 ADpFOIQs50WBkNU46ymyF01A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c888f79b8281b000;
	Mon, 16 Nov 2026 06:36:36 +0000
X-Mizu-Trace-ID: c888f79b8281b000
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	apopple@nvidia.com,
	byungchul@sk.com,
	david@kernel.org,
	gourry@gourry.net,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	liam@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev
Cc: Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] mm/migrate_device: avoid leaking folio references during THP splitting
Date: Sun, 15 Nov 2026 22:34:55 -0800
Message-ID: <20261116063624.1382944-2-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261116063624.1382944-1-usama.arif@linux.dev>
References: <20261116063624.1382944-1-usama.arif@linux.dev>
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

migrate_vma_split_unmapped_folio() takes an extra folio reference because
split_huge_pmd_address(..., true) drops one when it splits a PMD.

However, migrate_vma only holds mmap_lock for reading. A concurrent
MADV_DONTNEED can clear the migration PMD, or split it into PTE migration
entries, before the split helper takes the PMD lock. The helper then does
nothing and leaves the extra reference behind. folio_split_unmapped()
fails with -EAGAIN due to the unexpected reference, and the reference is
never dropped, so the source THP is leaked.

If a THP is faulted in at the same address inside that window it is
worse: freeze = true replaces the new folio's mappings with migration
entries that nothing will ever remove, and drops a reference the caller
never took.

An existing migration PMD is expanded into PTE migration entries even
with freeze = false. Use that mode and remove the extra folio_get(). The
reference already held by migration keeps the source folio alive whether
or not its PMD migration entry still exists.

Reported-by: Zi Yan <ziy@nvidia.com>
Closes: https://lore.kernel.org/all/DLZ48KMS7YG8.3BTM0UUU8CTU2@nvidia.com/
Fixes: 4265d67e405a ("mm/migrate_device: add THP splitting during migration")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/migrate_device.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9e19fadfa65c6..3286bb8a4b73e 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -920,12 +920,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 	unsigned long flags;
 	int ret = 0;
 
-	/*
-	 * take a reference, since split_huge_pmd_address() with freeze = true
-	 * drops a reference at the end.
-	 */
-	folio_get(folio);
-	split_huge_pmd_address(migrate->vma, addr, true);
+	split_huge_pmd_address(migrate->vma, addr, false);
 	ret = folio_split_unmapped(folio, 0);
 	if (ret)
 		return ret;
-- 
2.53.1-Meta

