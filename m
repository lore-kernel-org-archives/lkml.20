Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D901A6809
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085919; cv=none; b=Pl7lWcEBaCrEX6GIQGWO9cVJ9CwuEfPSlWWyR0UNu1M+J0pbg8hPb7NScOuNsDilu3GFzFZZFXCHgFDRgQaCkgvOU50Uc7l8vM5yDeX64IfObxwk+dSDYay+XmDyH28FTgq6E9zZznica/ODK5yFLhrm6kUQLhnciqhVDCLTI7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085919; c=relaxed/simple;
	bh=tJeL+TtL8fcQ3ySRpIEsJeq0/SmJ3J8dhXSj75dUeBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6Eq6xmDd6Rmp00rAYA8gjjA5LpyM2dDZKxYxs6Gw5qLHwrai1WUj2b2R4QDszhrx8FGEuI8vqMZcqeoLsKWgZJowKAOraV1r17gj+TB5pVw13QBKz9SQQ9chdJRAeXU/BIUe0WdIT23qQxU7FjxocBzvfBaFyEm2kGGNWGiE/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XXe2jlVm; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XXe2jlVm"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb4so40201085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789085916; x=1789690716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhZIogGFAKBWcn9TqaxnEfdXlwBjbgcMrXypWpyrcPc=;
        b=XXe2jlVmMcsR0HgFbWr2jUgdv0ECoWc0g6YBEu5SzUZPWVdW2gq3GbroxvD7PYi1g9
         3V0Y7L34PO11TNXPE2Pz8ov/dw72LudE2YD3x3ln3I7uN1chHCjzPsZAEHjvT+evKXh2
         9EhpcwOhIVQ7kn5xQKTDBe0ESua9ZugAJ07ojvoYfOhEyi+FdZ1A4eWDWFuCHbMcG1e2
         uLT0roITZsOoaLkqneQlGVRiFCXO98+5exGSR1bfbE2ikHXEimjmw2VRo+oZ3K8Cr2dG
         jkMN8o+DLaTvo45gNj84oN1/z5MonsT0Pv5RWQOEJEbd0OE5ns413zH6bZiJt3jO+O6W
         DNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085916; x=1789690716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhZIogGFAKBWcn9TqaxnEfdXlwBjbgcMrXypWpyrcPc=;
        b=SGoTikQuTfTEuQto2dpmxNuA8VGvDEXZUtA+ilqSbNG9n1c8shj55Cn0RVt/QQAyKS
         jPPDV86X1lT0XnkYMzNKpJpQNFASMnJTBO0Cu5p7Qz7GxioUuOFlpBkEKIduA/Gz830Y
         bjm5628nEAJEK3nMfKYSGlDWyu4tRcrdwrRtuNUgoK/JkgW7f62ih3BwSZ+ByVQ9VCce
         w3njle7zKVEzG3l8xeTa9oETWMi4ePIhfj60yZTsRzIS+HmsnmBxBolczbvtReJGpOqU
         +R60DiePo2j4EnkZ3o/T65Y5hpKhti6guI9M2cWAt2OeLGXzRRPy2dUoTXcEuGZAhJOJ
         tPUg==
X-Gm-Message-State: AFuF++nKuR2iHyeKl4qaJX4SkmXpr+c7tNbprsvM/JzbidodNx3T1bhk
	5XAvcSx8Pr7oKwgqeDekckIswqPxZnQUr3dfviv1kIrenDk47tDHfxe0AFp6Vcw23RM=
X-Gm-Gg: AYBFou0XXRM3bZEeqV6heQrb3AXTETzaMxmI6kqjQe+eomVziLo8onpxP3Tx8PyNWRB
	5odZMzF6WqSWQ/meHH7eCRBUE0UNR3lvs0k0bZ34VR3a+R0hIf4F5iO/qyETvUQKK/N40iHbsGk
	8uObnm0di51BkQXZ8PZ9CIV6b/I1cIOIpZynTdwLYeAczaycA9Jc/J9NNgjKFvaChbhL15zCM6a
	CSP66Dm6IGi7VNlmj3r0qNxIu80TJhcHFPPQDgim74dCMXzDD5iViYCuTYOe2x+o1YSJr45oV9N
	vURtItv/5slY+znlrrqHrpYqAf6r0bOOb8eVJkMfMlES2Y/ISc5+81+D12k6dkaLE2fuMUc8wr+
	voTxI6hu2aWqhV3ecd6gFvoSV/R5ov/zRqmbwfbA+a3Shngp8KojLvdKMwvh8CWRYW8k/J0p/N0
	pAeMfZs8llZOZwDTlazzIwtOe7+sr19fHbRlzUoLvDtajV+DtJ0kivQe00vBZOo2/gM3CFKYmnd
	j9f3fidiIkrXwtMVDnKo8ca8cnX5yjNzeclTMD8RSmnTUgdlelTdGp8+C6jmnd2liivCVI=
X-Received: by 2002:a05:620a:4109:b0:938:fd60:4f9 with SMTP id af79cd13be357-939ea16a07dmr234110685a.27.1789085916408;
        Thu, 10 Sep 2026 17:18:36 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e4c36sm108896485a.40.2026.09.10.17.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:18:36 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	osalvador@suse.de,
	hannes@cmpxchg.org,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] mm: allow shared folios to be promoted to a fast tier
Date: Thu, 10 Sep 2026 20:18:24 -0400
Message-ID: <20260911001826.2109390-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911001826.2109390-1-gourry@gourry.net>
References: <20260911001826.2109390-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gregory Price (Meta)" <gourry@gourry.net>

NUMA balancing rejects shared copy-on-write folios and executable
file folios mapped by multiple processes to avoid placement bouncing.
These checks also block promotion from slow memory.

Allow such folios to participate when moving from a slow tier to a fast
tier. Keep the existing restrictions for ordinary placement.

Fixes: c574bbe91703 ("NUMA balancing: optimize page placement for memory tiering system")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 8 ++++++--
 mm/migrate.c   | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index a082ccfa09ec..19b599bc2dd1 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -863,8 +863,12 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
 		return false;
 
-	/* Also skip shared copy-on-write folios */
-	if (vma_is_cow_mapping(vma) && folio_maybe_mapped_shared(folio))
+	/*
+	 * Shared copy-on-write folios are poor NUMA placement candidates, but
+	 * a hot folio on a slow tier still needs a hint fault for promotion.
+	 */
+	if (vma_is_cow_mapping(vma) && folio_maybe_mapped_shared(folio) &&
+	    !folio_use_access_time(folio))
 		return false;
 
 	/* Folios are pinned and can't be migrated */
diff --git a/mm/migrate.c b/mm/migrate.c
index a369d0c95c38..afd9c97d2389 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2697,12 +2697,14 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		/*
 		 * Do not migrate file folios that are mapped in multiple
 		 * processes with execute permissions as they are probably
-		 * shared libraries.
+		 * shared libraries, unless this is a promotion from a slow tier.
 		 *
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
+		if ((vma->vm_flags & VM_EXEC) &&
+		    folio_maybe_mapped_shared(folio) &&
+		    (!folio_use_access_time(folio) || !node_is_toptier(node)))
 			return -EACCES;
 
 		/*
-- 
2.55.0

