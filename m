Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FF638E8DA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164949; cv=none; b=gYzgtRbk2imvuHUOI5s2yIa9gyK5crF6sT2Eq37C+wtMorsmuEMfkFbZoPhylBdeFk4YDiu03DAEzcX5cwF33f2CXgKi5bKdwTSMFRmmo3R0QDGMCGNJQ8EQg8mqLZBqtM+lgvUKDg6j+rj59dEqaURUSbnpG5a2C25gGEmvKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164949; c=relaxed/simple;
	bh=Evn7Zfh9iuBirO24rNV2tVorrvWz1SCWoNgm/w4vOxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ofnc4/9Hd9ajVByvJGEUt5qVo+5QCg5Klj1LWqgZSJcOnCC8V8yfdUFyEST3AolqUVF9beRZfOhxI3sPyPEwJAcK1thMU4uXthU4DeZr/B3wP6mgyEkmyLomTSAzi7AZbqFJ+Wl4XOFmOgsnnNE7Q3q7sL5IzX6ct0QJDrbxu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WDek0KzA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WDek0KzA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EDFE1477;
	Mon, 31 Aug 2026 01:29:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7253E3F85F;
	Mon, 31 Aug 2026 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788164945; bh=Evn7Zfh9iuBirO24rNV2tVorrvWz1SCWoNgm/w4vOxA=;
	h=From:To:Cc:Subject:Date:From;
	b=WDek0KzATN0t8hjZiy7B9EfLSgwTpZL505soK50bfiBjSlYL83nPMqXWIevbm161g
	 rkL1wmBIsxcEmthh/G4GrnDXaGKKqmgfQyn0ZRFDjuXIGroUF0LL362LIv0s18wc6Y
	 rtfYyWOI4VXTDleXrN05OYyfl+Uw3qNr+YW8H/Xo=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Date: Mon, 31 Aug 2026 08:28:47 +0000
Message-ID: <20260831082849.3573957-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
the folio_test_hugetlb() check.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Rebase soup - my huge_ptep_get() fixes landed after the refactoring.

This patch applies on Linux 7.3-rc1.

 mm/rmap.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index d1819fd699380..606c8ecf31302 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2299,11 +2299,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
 		address = pvmw.address;
-		if (folio_test_hugetlb(folio)) {
-			pteval = huge_ptep_get(mm, address, pvmw.pte);
-		} else {
-			pteval = ptep_get(pvmw.pte);
-		}
+		pteval = ptep_get(pvmw.pte);
+
 		if (likely(pte_present(pteval))) {
 			pfn = pte_pfn(pteval);
 		} else {
-- 
2.43.0

