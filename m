Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811008;
	b=QsUKiWEgnGMsCI3vb/HdNANpniqPEecuzT2BG2Zq8Em9SMTN0WQimBjUuVqxqh+QqJtZ
	 vWGHo1pcfD367cW/or2/JokYwDhOK9TaNAymCUhOlsZeefDbyI1zYlRWMKNSs1ZjylPLY
	 25vPfnsNwMgOUFAf5iH/7kpMasBlNnixE4UaLEBNwwYLzwCdqmESbPzQcnIa8AcwjxTQQ
	 Ud/7K9zF2Git6mwfvSgi8N4zEzkjpRHAK9b7TTa4W3TM2cLdyqjXU0ODbJao8nYwAzkix
	 1OxVkXMS/lEVVRgKFLd8j3dYs2jYHED/IQ4sj0EOfbAAqH88mm7TvIttjKkULTOiHmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811008;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WujFsV3gjG0i+ckuCGbgYSpPrbyh9VKnBFOmaysMMYs=;
	b=GpyEo6ZYU7Vw4N5LOLdJsLpLfmAQ+/Zfb8i3m9Wdj7SNLOz6JU6IN/zGQUayq/ZPrv+X
	 f33JG0z+9TbJXkYzBCwdvRE3PnpL0TV+FkVxKW1fNgK8ADqe6yssEE2cnSAaJ1fRqiL6n
	 6gJ3Ol7qBFT6iHqxxdIT1Wze4trlKM+sHpSPQxFrfLhPl8+aiDzKejE00reEvEAH+HB2v
	 UlD5uiQHz/PhXf4sKwpDuzMIpAnhqN/xGgLNeIFJ3arNvURsbTVv3nqoUIW8Z649x3BXU
	 MTd5wjYv1f7Dw3JZTepyN46GcLyAi2QPD5WRgzu1b3Z7ExS/gnNlJbbqd5AlZLwQAjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DW2igUsU;
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A9606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636A9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DW2igUsU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x+ILKz6xxEiLKXXwh6DdV6s8+QRN9mKFDeJnW/pi2rE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794811005; v=1; x=1795415805;
 b=DW2igUsUcdPCFUbampoKKGdzYOJVukxdpiESWPBzpP/uohgZr3dixRx2p8TOgm95ukQmNXjg
 PZW5QoCDUrXNlEjvevxeCsh+Ehz83Unx1CEJiGF9oRJ6alKsSN6k+jxwsJIM0Fnu3ZcJ1zRyOjW
 IXk9rRaDpsbGGkf+D5yEngfM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 94084be275281595;
	Mon, 16 Nov 2026 06:36:45 +0000
X-Mizu-Trace-ID: 94084be275281595
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
Subject: [PATCH v2 3/4] fs/proc/task_mmu: don't read young/dirty from a non-present PMD in smaps
Date: Sun, 15 Nov 2026 22:34:57 -0800
Message-ID: <20261116063624.1382944-4-usama.arif@linux.dev>
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

smaps_pmd_entry() passes pmd_young(*pmd) and pmd_dirty(*pmd) to
smaps_account() for every PMD, including softleaf entries (migration and
device-private), where those bits encode the entry rather than
accessed/dirty state. smaps_pte_entry() only reads them when the entry
is present.

On x86_64 the entry's offset is stored inverted across bits 9-58, which
overlap _PAGE_SAVED_DIRTY, so pmd_dirty() returns garbage: a clean 2MB
device-private mapping is accounted as 2048 kB dirty, and lazyfree
accounting is suppressed. pgtable_64.h also warns that the hardware can
set the accessed and dirty bits on non-present entries by mistake.

Only read the bits when the PMD is present.

Fixes: c94b6923fa0a ("/proc/PID/smaps: Add PMD migration entry parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 fs/proc/task_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 164b4efc5e093..ad9fdcdaa2c40 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1029,13 +1029,15 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	struct vm_area_struct *vma = walk->vma;
 	bool locked = !!(vma->vm_flags & VM_LOCKED);
 	struct page *page = NULL;
-	bool present = false;
+	bool present = false, young = false, dirty = false;
 	struct folio *folio;
 
 	if (pmd_none(*pmd))
 		return;
 	if (pmd_present(*pmd)) {
 		page = vm_normal_page_pmd(vma, addr, *pmd);
+		young = pmd_young(*pmd);
+		dirty = pmd_dirty(*pmd);
 		present = true;
 	} else if (unlikely(thp_migration_supported())) {
 		const softleaf_t entry = softleaf_from_pmd(*pmd);
@@ -1055,8 +1057,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	else
 		mss->file_thp += HPAGE_PMD_SIZE;
 
-	smaps_account(mss, page, true, pmd_young(*pmd), pmd_dirty(*pmd),
-		      locked, present);
+	smaps_account(mss, page, true, young, dirty, locked, present);
 }
 #else
 static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.53.1-Meta

