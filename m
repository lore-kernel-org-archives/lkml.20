Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8223E33D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986917; cv=none; b=iHOFw3lKrYmFbo2EIu880TOYQGlQixith2a/A5t+Z80DI2haMKF1AM64wFsCpOQBJ+oLcoMb/GJxVuef4LosD8NBe8o3NHfHg4WiO2o+sW2n8t2lKPWZGJ3X8u/AV3vvvLw0m9eAKkVMAVYHTwAkdCngMniiyJlooiIRAL7r4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986917; c=relaxed/simple;
	bh=6DbAoncHxnK0azOb1VY6m/Px0Gjjk+3ADgI/O3v3Y9Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VYGt1ndZzkPLE81HC0LBX6WmcsybSmTm9SCblkwoA5i1z2ee6FMSNWx4JhRoi676o7OEOVX2RgwwCwOjZcdbto73wD0AKcl200eyeHI+A9oKhmxy/7xSPNAli2sIMK2H3oJV817bZAH0Rv+9nV7pHL7xP7pC39OsDK59XILVMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aczeoNAJ; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aczeoNAJ"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3572a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986910; x=1791591710; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCgjHn2mz/yCHbbXpM7X3kmHNH/eC22IJjKzJWGDoHY=;
        b=aczeoNAJRY2bSFAdJKDS+WaVtzinEqUKNI2ZdR1R1cvfCbNr+WiDUaMWHkHRsVrzPQ
         fYPylbj6Qpq5NpjI5mPPwQnJ18Mp+lW4CQCbo8kMyGLE55X7vNoc7V0gx9FSF16WTeMg
         AKhfBt/VutFZvUOFs9fzuIq5Hoh7pzPXqHLf7jpMVcQnEJvQoIpqAFqXefegVeezdoMT
         yNcIIaKbaWUfLhnAZN6xg8l6fvBO/JoLOTITla11e/RdKWQinlQ0TlRCX7nxqTph6ccf
         reX+xz0LU0P6FEY1MYDfUQPtMJvn//O57yG6YwjvYuNJ8l49zlK1mWBRqYonsx7KAPXX
         UH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986910; x=1791591710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCgjHn2mz/yCHbbXpM7X3kmHNH/eC22IJjKzJWGDoHY=;
        b=vIQ4G39Dd4ABomFOHVbxd30K6vWl296Qq0FY+h18urlLprra2qZmJWtQA2CE9KauRY
         LZGXy6raCj9c3/YM4VqPdyjm+uMTPLpiDgRSUvqbqm7ZWiUNsyl2fzE8j1MAoMvmFGJ6
         D4qurT7u6sGxcyhYGSFtExZCw2owFuURqzJNYcw4ROqC+IB1SgK4FjUBzABarhL6hgdk
         8RH79scET5C+5TnLQwBlKLHyyy4hr4RPD/FB6OJcPvs+6M+KglIny9xnTfxUt8jLWh1l
         8UxvbT6LZfwDlmRN11AuifbcGxWqxF/pYocw7WDQtkxDDaBmqWux4QG6K8i5L46AsE5u
         EBxA==
X-Forwarded-Encrypted: i=1; AKwUvBx6odbD7wOZBAayujMfG3t4I3dX/6AEZUGYm4qHAPQgIabOTpQfu1tueo9D7IfW+8rz1dgAJBuEOpvogkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAhKCJH1EMyFlVxjhFKDVavQUp7ME3KhtEg3dzG18k7t7RKf9r
	7vZLqZOgqy5Tszee+N7IDLIt0Uhk+bL/zBFmLVpgeto2AFXxtux4ymXyQp8VqjIw6A3M5RAGA/s
	yyf7Gcg8PWwa2ZSSgqUEGmg==
X-Received: from pjbmv17.prod.google.com ([2002:a17:90b:1991:b0:3a6:f87a:f3e4])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:33cc:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3a6ceb00093mr2158482a91.25.1790986909781;
 Fri, 02 Oct 2026 17:21:49 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:20 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-18-jthoughton@google.com>
Subject: [PATCH v2 17/20 DO-NOT-MERGE] arm64: Implement try_populate_vmemmap_pmd
 using AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Implementing this on arm64 requires some care: use the same access flag
trick that is used for vmemmap PTE updates. HAFT is not needed and the
TLB flushing routine remains identical, as we are not overwriting a
non-leaf PMD.

For systems that support BBML3, there is no need to use the AF
trick.

Signed-off-by: James Houghton <jthoughton@google.com>
---
This patch is the main questionable piece of this "DO-NOT-MERGE" part of
the series. It's unclear if the Arm ARM truly requires hardware
implementations not to cache anything about AF=0 Block translations.
---
 arch/arm64/include/asm/pgalloc.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 0263329fb7b3..7e304f01ce6d 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
 					   pte_t *pgtable)
 {
-	/* BBLM3 is required. Its presence has been checked. */
-	pmd_populate_kernel(&init_mm, pmdp, pgtable);
-	return 0;
+	const int max_attempts = 16;
+	int attempts = 0;
+	pmd_t old_pmd, new_pmd;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	if (system_supports_bbml3()) {
+		/*
+		 * BBML3 allows block->table transitions if the PTEs underneath
+		 * do not conflict with existing, potentially cached
+		 * translations.
+		 */
+		pmd_populate_kernel(&init_mm, pmdp, pgtable);
+		return 0;
+	}
+
+	new_pmd = __pmd(__phys_to_pmd_val(__pa(pgtable)) |
+			PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
+
+	old_pmd = pmdp_get(pmdp);
+
+	do {
+		if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PMD here. */
+		if (WARN_ON_ONCE(pmd_cont(old_pmd)))
+			return -EINVAL;
+
+		if (pmd_young(old_pmd)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pmd = pte_pmd(pte_mkold(__ptep_clear_young((pte_t *)pmdp)));
+
+			flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd),
+				      pmd_val(new_pmd)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
 }
 
 #endif
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

