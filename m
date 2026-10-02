Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9747F2CC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935045; cv=none; b=EpdJdgC9+bEOIhRQRbcTf8N4lMusLCjDkz/x76NxDTCyoPcXDv6X0EqevQuOKuMXZwpa97UjtDr1FlIfwrgrX7MZ2Bc0samfuQcQH7R/yJYMoI6SwVWAuFd7n2DI5asFidcGuSAcNNPVd6+7pAYWzj8Nf7HUmCLk4Ip4YDGqwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935045; c=relaxed/simple;
	bh=m4azhIZnpKty8kdqDwfR1PkRU+4t+lf/1EC6ZF7XDMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPwr9bGVH9zDlcVYGuczz+j9gkzA3TlHY07FB5FOTwOF6Tl2Ygv33xBdetkgyGSFtvCH3mlLlZaIMNBoNQXOng5hJqWkW9FwduL+Q2scmgw5XmktFBtZHoVBEvm1vugS2HUhH7yg/bz1nzR36BVw7hiqSVMBE4L1ztBpxM2360M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PGQXu12m; arc=none smtp.client-ip=95.215.58.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PGQXu12m"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m4azhIZnpKty8kdqDwfR1PkRU+4t+lf/1EC6ZF7XDMc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935042; v=1; x=1791539842;
 b=PGQXu12mig4NejLiUE5ILsGwnwGpN2PkNA+tqKoPiQ/+rTeBGRcvOTZ9TlcPvzoNb1olYEsA
 hk9m/fB59ygchU7ogk2ux5yZVTo1XSW7bCD2wvHoB6ETZxBe0aWQRMPXmnF/qq+iTrn0f8ApWCE
 L3Cjr0b7F+x41xastVbYHwAE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id eacc6b0cb29b5092;
	Fri, 02 Oct 2026 09:57:22 +0000
X-Mizu-Trace-ID: eacc6b0cb29b5092
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 24/30] mm/khugepaged: treat PMD swap entries as mapped THPs
Date: Fri,  2 Oct 2026 02:52:38 -0700
Message-ID: <20261002095503.3585565-25-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_pmd_state() would report a PMD swap entry as SCAN_NO_PTE_TABLE - it
is not present and, on x86, is also pmd_bad(). The range is already a THP;
it just happens to be on disk.

Return SCAN_PMD_MAPPED next to the existing migration-entry case and before
the pmd_present() and pmd_bad() tests.

This does change MADV_COLLAPSE. Today a swapped-out THP is HPAGE_PMD_NR PTE
swap entries and MADV_COLLAPSE, which ignores khugepaged_max_ptes_swap,
swaps them all in. With a PMD swap entry it reports SCAN_PMD_MAPPED, which
madvise_collapse() counts as success, so the call returns 0 without making
the range resident. It still faults back in as a whole THP on first touch;
only the point at which the I/O happens moves.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/khugepaged.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0d8cd44b14c57..bbbf96c616295 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1052,6 +1052,12 @@ static inline enum scan_result check_pmd_state(pmd_t *pmd)
 	 */
 	if (pmd_is_migration_entry(pmde))
 		return SCAN_PMD_MAPPED;
+	/*
+	 * A PMD-mapped THP that has been swapped out is still a THP from
+	 * khugepaged's perspective; treat it like a present huge PMD.
+	 */
+	if (pmd_is_swap_entry(pmde))
+		return SCAN_PMD_MAPPED;
 	if (!pmd_present(pmde))
 		return SCAN_NO_PTE_TABLE;
 	if (pmd_trans_huge(pmde))
-- 
2.53.0-Meta

