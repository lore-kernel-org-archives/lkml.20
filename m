Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD732B130
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564745; cv=none; b=XpkAh//Y/r9GCdDzcsETA/i/JyVucnFClTH//svrVo6J3a+hznVJA+b+ZpbkbroPskFsTCaJ7QumKq0h3XMH7Ab7LNksEiW0U7+wb8BLhuo7uu/JMEq+eUaEnrHCpxzGl3tgaNpS1oXCK8WcHesbEt88DzRKpQVE9ZmRB3HMceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564745; c=relaxed/simple;
	bh=l0Lx0vO2XZUqVpwxh3mL0aU/Q7piqHu9xI9FCKJk/rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhGE0oOvHY3SGKnaG2iEz1Q0AHnH6xJ/INANy3vbVrFSnY7s/Sz2IyGMquWS7QmbqT7nyr+DFboypd1RcLWBQoFq6P2e35VwCj0HrO6lfTgtn9qyAav2QP939JTrpJckLqXw1PSjtQjSPRlWKamrwzPlD7cerRum1njIJf07sS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=ZBpckcLt; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="ZBpckcLt"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8253bc5a613so18294a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791564743; x=1792169543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxK6siBxaUgXXbS1nQNHxY8dGyGEnMxba3O+XHHDkK4=;
        b=ZBpckcLt/LSkM2QsCPNRfUyKnehU9OxV6CuSM6LNHtp5EMZCpMMPJHUqbY3FTiYMGC
         ilQe24Q78OFUfpv+gtw7cL1ZQGiG3C0+tCZjuNaMLMiqgxjOqac5O+/ClxylPHLhhEK4
         LZbXtt17HC/LXqreS7hyedpVSAqiKK6XaHLZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564743; x=1792169543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxK6siBxaUgXXbS1nQNHxY8dGyGEnMxba3O+XHHDkK4=;
        b=xkJawj//UYTZSPtvZPNz2ESnRUi2gWQ8u7jV14mUiPxkCUV6Ll0SZ3iXoegq1nh8lq
         GP1ryean1IC+SfOUvZ++HV9hFv8snoaAQRFISOxTTc+oibwnBYpLmNUBp4GyA/5Qa/fN
         zzrI3ujpOWymDYfk2h13QROndHVvOdTWq5JYc7UNNbyhhrPGA4BjZy5eZ0FssqdBt3TK
         Iclk0RBdSjaK8nPgj9TzM9RIwEQcLcyvjx5gPrnPgm4sOa88tSe5fbHTwgv8Qnflvcnx
         B5StiM9jXPMG6gN3I6fgduUe2mvstGAoV0PkGx4mlk1vL9rfgWy0k/lpX/+AkDMBspyf
         5tuw==
X-Gm-Message-State: AFuF++l7dhgjf+73r6Cze9/P9412JrTMOQwBz09IqIOuaGPUDRsJ5kAz
	7C/5EJlPc+FkTTxtwXsoAhq4U1VMK6zUsxcFfIa0WXgvkJBDi/DSUN+8Aeu7LRy8zkU=
X-Gm-Gg: AYBFou1GbMaLW2nUO+2rd5PcvmmpTIOaOWfbsn5JstmikXxkDpf4nBSPfvTM1e6ZSiP
	ikc6mXIBEngxO4bsNi+kd9PqqiewEVG6UWLRU7US7uYkUGfs/lllt7levhuPWaoAzLL6RAbEjZa
	5efI28l1NVG6WDa3wte8uFg3SxLNCT7tQDosvJ+EeeE5mye099NsjoxwRKDtKLC7zpE/pWeZ53/
	Yx+E+uDdOiyxcgjR854Pgn0j6HuK0VCpA45LWK12afUtqncdivYbg5iRkcNTDT6X7JguJJ/FSxs
	4yLgyvDlSWo3VogUmbOWck9pDl3rlmAElYKgXtx8rq02Di76fcTmpP4fu67crYS4J8IEIbS22vy
	ZaFJWL++3ATJEG2hbQKBStqePaRoKw1WDGXheFY+Z2rJkKAmejuArBwBvFv+9Kcy2oL4UtTCOhq
	e7MMqHE6ZO/h7jvY+E4qNA4wyhuoysjY3Bdw7+2HbqlZSaYTHi/r0jtWQ9IoXZ5tY38wrV2UFar
	d2o7l/w7jqspAeEfhOSYG4OutLy3Q8AMpyvyIQDjZHgcejOnyZNuxuAa+1WArlSCZRBGsQSkJI=
X-Received: by 2002:a05:6830:6d29:b0:805:9b38:6f7c with SMTP id 46e09a7af769-8309797cc66mr1926179a34.29.1791564743382;
        Fri, 09 Oct 2026 09:52:23 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3e016sm2174263a34.17.2026.10.09.09.52.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 09:52:23 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/huge_memory: avoid transient none PMDs during lazyfree reclaim
Date: Fri,  9 Oct 2026 09:52:15 -0700
Message-ID: <20261009165214.40212-2-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__discard_anon_folio_pmd_locked() clears and flushes a huge PMD before
checking whether the folio can be discarded. If the folio was redirtied
or has unexpected references, it restores the original PMD. Reclaim holds
the PMD lock and the anon_vma read lock, but not the owning mmap_lock.

Both zap_pmd_range() and mremap's get_old_pmd() can skip a none PMD
without taking its lock. A concurrent munmap() or whole-VMA
MREMAP_DONTUNMAP can therefore miss the PMD and later unlink the source
VMA from its anon_vma, leaving a restored mapping behind. The anon_vma
write lock taken by unlink_anon_vmas() waits for reclaim to finish, but
does not repeat the skipped page-table walk. Once the remaining VMA
links are removed, the folio's positive mapcount no longer guarantees a
live anon_vma. Racing lazyfree reclaim against MREMAP_DONTUNMAP as an
unprivileged user reproduces a KASAN use-after-free in
folio_lock_anon_vma_read().

Use pmdp_invalidate() to keep a recognizable, non-none huge PMD while
the discard can still fail. Concurrent unmap and move operations then
have to synchronize on the PMD lock instead of skipping the mapping.
Clear the invalidated PMD only after the dirty and reference checks have
succeeded, before removing the rmap and withdrawing the deposited page
table. The full invalidation retains the TLB flush required for the
dirty and GUP-fast checks.

Fixes: 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during shrink_folio_list()")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 mm/huge_memory.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1e5d68acf62a..20262195385a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3569,11 +3569,17 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 		return false;
 	}
 
-	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
+	/*
+	 * The discard may fail, so keep the PMD non-none until we're
+	 * committed to discarding it. Otherwise, concurrent munmap() or
+	 * mremap() can skip the PMD without taking the PTL and later unlink
+	 * the VMA from its anon_vma despite a restored mapping.
+	 */
+	orig_pmd = pmdp_invalidate(vma, addr, pmdp);
 
 	/*
 	 * Syncing against concurrent GUP-fast:
-	 * - clear PMD; barrier; read refcount
+	 * - invalidate PMD; barrier; read refcount
 	 * - inc refcount; barrier; read PMD
 	 */
 	smp_mb();
@@ -3607,6 +3613,7 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 		return false;
 	}
 
+	pmdp_huge_get_and_clear(mm, addr, pmdp);
 	folio_remove_rmap_pmd(folio, pmd_page(orig_pmd), vma);
 	zap_deposited_table(mm, pmdp);
 	add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
