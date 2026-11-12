Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501104;
	b=QiOXEpGW6q5hSPeqMOfRLdn/zoYXm3fDPVpQv2AABnLHYfUrtIoPDfs/Z6o2qAre5MtC
	 MuvmOqVb96VqGQe3epa2S99XueFsJHnk+sycowBdhFuDEdy/dg42MCr6Akeneqi5nycA0
	 8/4gKoIma+LmjR3qHg59mCoMy21eFrihxpgMHe7M62V3Ws1gNPRlKSvFZwtazuej8nvdh
	 FtgVWcngLq7FTuJmWbNQUWarILBwg8p/E+TGgtklD8JJiVhJPG1yASTOIrCLseoGrJjuN
	 CiBKmOrfRIoICoTKraafUIYHJOstPfGSs1+2x3RwEt3qAs2x33IL9kxdQur2dbuBNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501104;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Q66ObPrZodpLaehmTBgOS4QzeFefC08m+U2McSXDFNc=;
	b=HRFnpIKH6/8kPwq3bySyZ5GubRuuMBO6VLOuP+nlundCwPrXi0qeDOj9XvtCF2pyAu2/
	 vxki8m0IHB/DNIPAg4v5TDup7d9gYk7rTomvLtWgcNupMFikc21bWvqE0KBtEzmmHLo5q
	 Y+7Of72NgZOgYPgtM0IZnX2JfwLeWwx7zPT2i4nT9xVCX4lZVGlGjsia3BkLT75Zbf/Ek
	 z1Bq/+zIH6rNXCXtbI56grPMKBYn7N+PNLzkjHaTwnxK2bFNu5tXLNQ0jptZgZU7sXpvK
	 zMZjnO6OuKLATSswo8bSY04JOXkccXAnUmodBjkTqctacWkJ2wDlxTEQLIrthTd09cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBylPvLQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43460A2624
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBylPvLQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2CF1F000C9;
	Thu, 12 Nov 2026 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501103;
	bh=Q66ObPrZodpLaehmTBgOS4QzeFefC08m+U2McSXDFNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WBylPvLQoerGsiqQ1E3y2Dn+SuxNhxEEf2+7Xv5NfHgzwb4Qyb/JtFpzx+iSV6ThO
	 chFWpdijxPMRgsQIJq2tqB2RhW5AcAjTtqIRroO/t9Li7oUQI7+VPAefqEebZIlMnK
	 OLZCERPmOs323XXQkxUYhWddUZbeG1rBnG2YwuzPzU8zw5D3sjdkWcOBkM3du2sMsg
	 mWfl9y/yqJEcE9cnbIM9ujqIC36WthanaJWb2OtS7TZvdik+MF1vQV7LNpTbZTa7OG
	 6s9dXqPSjX9ZQe356pVQbE78PKXefZJQAhkAy2udMyJDKBquVvXxuMBXD0I15FfzFn
	 ecePK8Ae83L6g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:13 +0200
Subject: [PATCH 8/9] x86/mm/pat: move the collapse of large pages out of
 cpa_flush()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-fixes-x86-v1-8-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

Collapsing of large pages was first written to reduce the fragmentation
of the direct map, and cpa_flush() was the best place to hook it
into [1].

When the collapse was reposted for set_memory_rox() only, it stayed in
cpa_flush(), although it has nothing to do with the TLB flush.

Every early exit in cpa_flush() has to jump to the collapse.

Collapse the large pages in change_page_attr_set_clr() after the flush.

[1] https://lore.kernel.org/all/20200416213229.19174-1-kirill.shutemov@linux.intel.com

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 94b661c5f7885..80b5a2faefd7c 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -407,7 +407,7 @@ static void __cpa_flush_tlb(void *data)
 
 static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
 
-static void __cpa_collapse_large_pages(struct cpa_data *cpa)
+static void cpa_collapse_large_pages(struct cpa_data *cpa)
 {
 	unsigned long start, addr, end;
 	struct ptdesc *ptdesc, *tmp;
@@ -415,8 +415,6 @@ static void __cpa_collapse_large_pages(struct cpa_data *cpa)
 	int collapsed = 0;
 	int i;
 
-	guard(spinlock)(&cpa_lock);
-
 	if (cpa->flags & CPA_PAGES_ARRAY) {
 		for (i = 0; i < cpa->numpages; i++)
 			collapsed += collapse_large_pages(__cpa_addr(cpa, i),
@@ -449,18 +447,6 @@ static void __cpa_collapse_large_pages(struct cpa_data *cpa)
 	}
 }
 
-static void cpa_collapse_large_pages(struct cpa_data *cpa)
-{
-	/*
-	 * Take the mmap write lock on init_mm to:
-	 * - Avoid a use-after-free if raced by ptdump (which takes its own
-	 *   write lock on init_mm).
-	 * - Serialise concurrent CPA walkers.
-	 */
-	scoped_guard(mmap_write_lock, &init_mm)
-		__cpa_collapse_large_pages(cpa);
-}
-
 static void cpa_flush(struct cpa_data *cpa, int cache)
 {
 	unsigned int i;
@@ -469,7 +455,7 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 
 	if (cache && !cpu_feature_enabled(X86_FEATURE_CLFLUSH)) {
 		cpa_flush_all(cache);
-		goto collapse_large_pages;
+		return;
 	}
 
 	if (cpa->force_flush_all || cpa->numpages > tlb_single_page_flush_ceiling)
@@ -478,7 +464,7 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 		on_each_cpu(__cpa_flush_tlb, cpa, 1);
 
 	if (!cache)
-		goto collapse_large_pages;
+		return;
 
 	mb();
 	for (i = 0; i < cpa->numpages; i++) {
@@ -494,10 +480,6 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 			clflush_cache_range_opt((void *)fix_addr(addr), PAGE_SIZE);
 	}
 	mb();
-
-collapse_large_pages:
-	if (cpa->flags & CPA_COLLAPSE)
-		cpa_collapse_large_pages(cpa);
 }
 
 static bool overlaps(unsigned long r1_start, unsigned long r1_end,
@@ -2176,6 +2158,20 @@ static int change_page_attr_set_clr(unsigned long addr, int numpages,
 	}
 
 	cpa_flush(&cpa, cache);
+
+	if (!(cpa.flags & CPA_COLLAPSE))
+		goto out;
+
+	/*
+	 * Take the mmap write lock on init_mm to:
+	 * - Avoid a use-after-free if raced by ptdump (which takes its own
+	 *   write lock on init_mm).
+	 * - Serialise concurrent CPA walkers.
+	 */
+	scoped_guard(mmap_write_lock, &init_mm) {
+		guard(spinlock)(&cpa_lock);
+		cpa_collapse_large_pages(&cpa);
+	}
 out:
 	return ret;
 }

-- 
2.53.0

