Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684A3325483
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268711; cv=none; b=Izn4YuSbLF/u/d5vqUXFKaDMAyvA20sHZItMr/+vQb+4Uvu2tvd0M6z9uxMxNjpQaz/klk7M6Ro6wbZMsD1V67vC6dS8wv5S+7Oh70rU1AH1rCMUfxp28XXZmjRIGclx2jg6kevHdu9OD3MP2KkTVmApGL8/rEPmR7vjcVPkVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268711; c=relaxed/simple;
	bh=cPRbG7PsLwxPmU2LFtltQobZjlI7GZ/AINTif7V2WhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=idOdSuVLwP7LQLBrj64uX1cCn/lsHg90xXDevky1KzJF0b0gxo1uK81PHU5OSXxKmc4NwLv74bpEFfq7x7n/OXpKgVx5SAEO4AsUgIGZcL3lLRjXddSwglPakAb5Dg/KINCAqknfytYXZYDWDeM6lLpfJFNpVPpe1QE+vt4pj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWfvhu9F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWfvhu9F"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843750de83so574132f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268709; x=1788873509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYZ9mTkKbflVQt98jHbC/mLce8oRUM09qM0H6dktBA8=;
        b=XWfvhu9FglgZyv/B3tq5HDwKRlhJSCgAdUvWtQrd4G3096CeNRCj8/HcHQj8dCnT6c
         3hTzOsfq1UNdofismQyHzRXK07t9v9Lo3bmIZZi3lvl3+i2G8vTFqEDDapkOjluLAZWw
         bZZ8Oo5umwBH0m7pYwfURyRdvBGICW5WYILCisk8JnOsZfOuv/71tAfYLXmBCktwJlPq
         /uqhV+W7S2nODHFK79DM0RSm5W/3XNIaSHGvg2+rbzh9VI//tnxFbgAeanZMUtipR143
         ZELwKlHZ/h3Mg43+Z9eMhnT2IKa679Q/Gz0vZmVCWeskOqhxUfb1P4PCHkLRMbpR75Qp
         naxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268709; x=1788873509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYZ9mTkKbflVQt98jHbC/mLce8oRUM09qM0H6dktBA8=;
        b=tQZrRVY9NlwhLssMHCM3DY2KL/tksQV+JNgS5/xl5yl5aX9jrwKMORJGTdChwMlMyl
         PS8/H++V6ElSGCUbBZWnqXIvxcwOhuWXuv/gJiQI+SHM6BEmERSBiD5FtgNm5ikQyqov
         1QRY05QWK68UjDHdXaN/Mm0sUb7pp9OuFB60B1Hk+Wakx8IdrTEf0Wvxpn7QFC8ftq/4
         nWvg+YUPebIOlMTkAyplNRCJ9jCmgCkMblJC6C/1lZ1URtkvoyB9sKaZOwxhQwjofFB/
         k6t/tGEP/cCCIOzehtXYSjidtB2fUcPhUJlt57KxSXXTzwbttSoehChAOlrRJB169A5J
         Yfww==
X-Forwarded-Encrypted: i=1; AHgh+RoDWXO+O9/eJBC9W7d/4rAZn+gcp8D4t6CjZbGv4iSHHeDciynUua5dM2Y5TZZwOWo1fPjjqtVg2DFESGs=@vger.kernel.org
X-Gm-Message-State: AFuF++lfM1VtTDpF9Pf18WDTc+s7KKMCevxs3N3gJPfQXij3bDYrf1ai
	CR0OWZN6PeeBRtwWt9MJCGzYLhcpH0Zk9WWuwHBQyae2ImqFs/0gpwIK
X-Gm-Gg: AR+sD11MlG82+sa9ZwCiUL+bl3biN9uNWUy1mkVCVIOCO6D82A1UyYKagErPUZ0Z9CB
	q6QzunVpV/lCk2e4OHH47pb0YeK/P+1pxRdbGxHk1zsg8+hTK8su0hYcASQIPOQ5aPN/hJzi1go
	OKJw6qll6KtNgAD3Zlc26BM+Y0nPBhOzhucMRTbsyxZhjehB6wjV8B+0wtw1X2DkrCdk8zpBhBn
	hI5GtzMWzcUpP85oTtkqiSraMnJi6AaOCPhS83+Jcy4BFzsG0R0hhJlQch8pkZ0j9OZo0B24HJO
	p44HPTYeoohnD6JA1ssJb4QB7Zl7yPlgYqAWS+DOYF+q1CMBAHelLXxV0QulVScH+5B/CyIa9eK
	LzjVe5jjbfeFQhk/m26T7eaUuCACPEGkOz7P/+ZYkUt9GCSuRucBoXUTQm1rvUF5+EFarcpCUg4
	EnqnnShjGMILZkkDE2iobZSa64rGCjsUB9Nj06AecrQYqZsSuENCjQuAZTbCiy6RGp3cXrgR90Y
	HNEuD7UZMCev7qpa01FYkisFRYGGPIAo625DtBi699ITASTija4Al89h0aKXRqbMb1aaJE3EWwf
	5+7XbAeMlM5BffZC4QjxyWOxkEnunl4tzi2K7upT/Jz/6EXM0kZVDbRcVNa9iU4dFrxrcik4V5e
	Idreq1Q==
X-Received: by 2002:a05:600c:4f0e:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49cdc40ff56mr178836565e9.4.1788268708319;
        Tue, 01 Sep 2026 06:18:28 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm356104405e9.4.2026.09.01.06.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 06:18:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Date: Tue,  1 Sep 2026 15:18:23 +0200
Message-Id: <20260901131823.15799-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
permissions. For contiguous PTE mappings, break-before-make (BBM)
requires a TLB invalidation after clearing the set and before making any
entry valid again.

Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
get_clear_flush()") removed this invalidation, relying on the deferred
flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
TLB invalidation for BBM on contiguous ptes") restored it for
huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
late for the break step. The modify-prot path has the same problem.

Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
invalidated during the break step. Leave huge_ptep_get_and_clear()
unchanged because it is also used by teardown paths, where the deferred
flush is sufficient.

Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
An instrumented QEMU detected the missing break-step TLBI on an unpatched
kernel and none with this change. A fork() control exercising
huge_ptep_set_wrprotect() remained clean. No user-visible failure was
reproduced.

The QEMU checker was exercised with 4K and 64K base-page kernels. The
patched kernel passed the LTP hugetlb tests with both -cpu max and -cpu
cortex-a72 (16 TPASS and no failures).

Testing on Neoverse N1 hardware would be welcome, as it can use the
contiguous hint and can be configured to report TLB conflicts.

 arch/arm64/mm/hugetlbpage.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..bb53a04b73b2 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -517,6 +517,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
 	unsigned long psize = huge_page_size(hstate_vma(vma));
+	pte_t pte = __ptep_get(ptep);
+
+	/* The break step for contiguous PTEs must include the TLB flush. */
+	if (pte_cont(pte))
+		return huge_ptep_clear_flush(vma, addr, ptep);
 
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
 		/*
@@ -524,7 +529,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
 		 * when the permission changes from executable to non-executable
 		 * in cases where cpu is affected with errata #2645198.
 		 */
-		if (pte_user_exec(__ptep_get(ptep)))
+		if (pte_user_exec(pte))
 			return huge_ptep_clear_flush(vma, addr, ptep);
 	}
 	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep, psize);

base-commit: 786262be6048deab760f68c8acc2c85607165894
-- 
2.53.0
