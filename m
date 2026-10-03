Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FAD23394B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986909; cv=none; b=dq1L69x38fFGxQPFEevyboFA+T4iBbnYhDb27KPSvIPyd0EQeqiVeK82vh4Bmgzhzg0GOszsTuh3obUzUz2SUs295k9bmHYYRskkwNA1FEyl8y7bBhfX7dnm/d7mb+GAvVK8/xa0R2P9eVCaBSDWFtGHUpEd3b+oulorXWJ3sf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986909; c=relaxed/simple;
	bh=Ap5T7wCP4RK/NCaessk3R0sdO7wh5X0mULEKFATk6Xc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ngIgzt11ILH8zAM4rO1nQ5tGSJu+JWXfHKnHzLJ5OgNrTj6/zGKI+2BWIlKZpDBS3J2lTPmgTKQDQsKk0mALOFbVzzrzu20vTnFgiXMUhEpxgcTH+QPOBSvp2hl1trtYIctVXrI2LUyvGizFejAbQEO7QKPU7IJLdVCUCutzgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgfsqe8b; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgfsqe8b"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so99b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986905; x=1791591705; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VjIDdEMsxckzeTQAC8VMO9zeN/fS3+8A2YCNQtbhGo=;
        b=rgfsqe8bUrFdDs/73ZD5M0JFsjTMk1BfK+zL6dylPFAvxSfhay013I9ZpOuHH+bGnf
         kfCjWp1skIvrAoaZGGfbADBwiIbOAe2jaULAJi7OpB4WFXiPXqJ0iGQXNCKxy5ABTeOG
         QnHWpaVQX105xK2le+hwnoQZvvMvhR9auf3HWoPxvblAy0h/mKk377TTMI5mxLtopqIi
         wazzM78JqQYi8FAAfvY7ZqUGhRYJ77g+D/rgpaZ9jnBdF7GcgP2ypbNvd3ED/iYbHINw
         1VMbAe73ZBRWfH0eWvAtnZnJ0Q4LNqNSxfKrUF9LahXTyDXda4cVVDT8ps7OUoHSepN/
         emBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986905; x=1791591705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VjIDdEMsxckzeTQAC8VMO9zeN/fS3+8A2YCNQtbhGo=;
        b=EqOfHDe/hQ5w1d43AUu0GTkrAd61XTJ79CHdEDd1BJ6Bxt7uJmN9oiJTCPOlHvOls9
         Jnx6gmsmUHcGsEY1OueQ3iBZ4JZ8NGGbUyNTNAFtBMF67uPE17wv8l2JXGAwwm4fdmpq
         Lm/GjRYIJINVhtw5Bj7Ptlv30OjekK4eE/o6KOc0U2XYl6GotCLbnaDyrcyJ21jSHxfn
         9ABUlepK6YoDFbPzm/hvRqJ8C/DrBSKD1S8FD7u/vvbGu8JTTWBzVoSHRuZBZgVBIOA9
         FU2ZSgBWPWBcGYDX3BVWAraEjvOEYXEPwUJ+TvnaDfrNdcAE6M+oZcOtMD/qvKcnX54z
         dpDA==
X-Forwarded-Encrypted: i=1; AKwUvBwcp5DFTfRjw1d6tTaRsgVEwGioI0qvIT3Nz6h5fpQGwOiB93Pl3302cvYS7fLsAWvexkhhwMPAzL9gXOI=@vger.kernel.org
X-Gm-Message-State: AFuF++lmzTPVHq5PyZZjp1lRTTiPFAlV4U0gRxGLk+iJlsFR5oxUzXOG
	8HBqNo91Kgk1ykLixygMU2uLNk9NHae8/WvELlrUObOLBKZsQBNMBuYNp6Lkn8w875RfloIB20X
	Rj99fzTDU7tcPnwspXOBxUA==
X-Received: from pflr17.prod.google.com ([2002:aa7:9891:0:b0:87c:d84f:5ff5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a245:b0:878:3704:e0ed with SMTP id d2e1a72fcca58-88af5f9362bmr3106493b3a.19.1790986905085;
 Fri, 02 Oct 2026 17:21:45 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:15 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-13-jthoughton@google.com>
Subject: [PATCH v2 12/20] arm64: Implement try_update_vmemmap_pte using the AF trick
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

try_update_vmemmap_pte() must modify vmemmap PTEs without introducing a
time window where other CPUs on the system might fault.

Normally a break-before-make sequence is required to avoid conflicts
with cached translations. However, if we can guarantee that the existing
translation cannot be cached, a BBM sequence is not needed.

Translations with the AF unset may not be cached (see Arm ARM Rule
DWZCQ); the implementation of try_update_vmemmap_pte() on arm64 takes
advantage of this fact to replace a PTE without BBM and therefore
without leaving a window open where PE might fault on this translation.

Of course, if some CPUs on the system do not support HW AF management,
clearing the AF will introduce potential faults.
system_supports_bbm_through_af() will return false if any CPUs on the
system do not support HW AF.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 60 +++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e47c3d010715..f8e66bb22c0c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1249,14 +1249,24 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte(ptep, __pte(0));
 }
 
-static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+/*
+ * Atomically clear the Accessed flag. Return the old value of the PTE.
+ */
+static inline pte_t __ptep_clear_young(pte_t *ptep)
 {
 	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
 	s64 af_mask = PTE_AF;
 
-	/* Atomically clear PTE_AF, checking that it was set before. */
-	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
+	/* Atomically clear PTE_AF. */
+	u64 oldval = atomic64_fetch_andnot_relaxed(af_mask, pteval);
+
+	return __pte(oldval);
+}
+
+static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep)
+{
+	return pte_young(__ptep_clear_young(ptep));
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
@@ -1734,6 +1744,48 @@ static inline void pte_clear(struct mm_struct *mm,
 	__pte_clear(mm, addr, ptep);
 }
 
+#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 const pte_t pte)
+{
+	const int max_attempts = 16;
+	int attempts = 0;
+	pte_t old_pte;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	/* This routine is only to be used for valid-to-valid transitions. */
+	if (WARN_ON_ONCE(!pte_valid(pte)))
+		return -EINVAL;
+
+	old_pte = __ptep_get(ptep);
+
+	do {
+		if (WARN_ON_ONCE(!pte_valid(old_pte)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PTE here. */
+		if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
+			return -EINVAL;
+
+		if (pte_young(old_pte)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pte = pte_mkold(__ptep_clear_young(ptep));
+
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
+				      pte_val(pte)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
+}
+
 #define clear_full_ptes clear_full_ptes
 static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

