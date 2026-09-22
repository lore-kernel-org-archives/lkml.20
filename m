Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B35275B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121528; cv=none; b=JFQ9QZyqeqsZtB4QtFk9wwHtPYOVlW/n+y0SG55IJYJVkZ5c3byodmh0doGWJSov+lIfVWKETzKlR1Z9PdA6pMjLA87eyb8rzRK7HRZUnCG+BjupWvNpNj793jwYE7ephFN60BR66lxhoA0WK83zaVQq7lox1hURXHUxJfcPHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121528; c=relaxed/simple;
	bh=8CDetGO+wf6wYqZIC5YUwDIjZnqoRkQGXiEHkxcWWi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEPaOY/Ki18GBB9p84xWFxGOcsqqcxkEhi+eG9D1b9X2ciCMF6zfhHY1ny+beMFytsZBi3gc1UTkiNLyI6smswKfCWNKUI3hmc6sh6NBzxc9R+kTm2k/cP2f5xn+82aBP7CTiNiGJKbXl0eN99UK15bH5MnGhyYU+Z7wWZEnTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MHkzANJS; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MHkzANJS"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so3130951cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121523; x=1790726323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5oF3nurCQ+QFDROgbfsMr6dUR727+FSjg6LodV8bBM=;
        b=MHkzANJS62tbMEU9gnOYp3Cqnankq2bCuDQIzaiuPLZuVSeUm/+4A+kMSj9MG+PUYF
         a251iGzm+Idj1Qaj6h/3U+sWu27m787YrrLoJYnhIFdTU5E9ojNG9HrrigSxEA7izkFG
         iVfEYAzOpO40e2FT12LxaBr9bKBBZH9YxMZH2D8zOarMdRpjjeNB4MHOamEFUymQHCWj
         Fuu8o339joB6Jj8DjeOqb/y0mfRq7CAMXXxSKXb9sJlylKUjC82NpmsilsyXPf1Y1ZCt
         QrKH5thuEZWfDoVXSBgYhTyq2BEBoYrBMH8cAudrELJCYybNK/+0tMEjpWb302L5JIJJ
         q5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121523; x=1790726323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5oF3nurCQ+QFDROgbfsMr6dUR727+FSjg6LodV8bBM=;
        b=gZw52Y85nzlVUjsoyUI8+EhJAWIB+wH5asfW3Z7D4raKpBfOI+4Ay8/ByZvFrMJw1D
         JXHWRJq4fcokP3aLXvJaPu8OnO77gNWO8Yi9paPlHXYvGSBQ7qVd13yfhDMFsFF6B6gb
         mql0O8EVEkrd51K2qKC/fo/ZNumkpUb0pO/TsPEYg3G2wSY0xKLVSoVKEx4TF/CSOW7Y
         nWMKRaq9FKO7Ehv8oBCCChC7N/ykA2CexQhGlR+ZseA7CwSZ4IkUb0icgbqOliMfJGK6
         49um4ncK/1gx8DSh/OPPZgzFuldjPNviSzsmFGLwkS0SVavgRVWp+ch7CFYFHe3qJ4Yn
         Xr/w==
X-Gm-Message-State: AFuF++leUBPKlnOfqZc9OtGVmeS8/4eA5vuKkd4imA++ckulNco65aFp
	cocwW4Vr3sTsZJrEP2H3ydFlMHDpJCGVX3AfYTAHd+BKhQsjSJ6dJFwxstq+CLj94qI=
X-Gm-Gg: AYBFou301mUJ4P/dPmlvnicmO6N1jSlh8QMv7UwjF63sZBdBvTWNupRY4IYcadXmf5W
	lgi/JgLhVw5uy3265pPS5HMSZqs52/6iTv3ycEd67asV68ePbjQT9oB5Y9CoGVyrYQEIZKk3uTw
	Asm69TguzMBlZ5PNpVyOXGmwmTu9+SocGbsrTd4mtu6c6nsKks0MCiEuUkZ/tRE67NhddEOF/mE
	WRRAlzzr58WeffsSdCby+BJWsiJV2CwUtPCIJTxY5Fi73d/DYLzCrLp9EIr3/4FxSCQxRv+f4ZQ
	BaupGeeL+u3z18FO7jO/oruDbQ8k6AAyDcnA1HdIVrZaMibj3RArRyI6w37BeDNWzf6LI69BfVV
	0OHV4Zg76wkSLAUbJRYORomdP6GuEld1J2BmXPBiDDYYDwe1+HAYXJFSEOBSETSNx5ufMSPNrXP
	XQvaoL1p0gBMI0Zw6M6/xQR5vAUab7F9c85B7Wi+s2A/jeBnFjmQ2RoyzCLFHtBXo2K4XiOr51o
	WWI/Sh0f7LUHSDBe89U7N0lhy8v0uRM9UR11SaRFMlfMUk0z2k+iaURANP5HTj8pchEHDOVt2Gi
	6dGbqg==
X-Received: by 2002:ac8:7fc1:0:b0:51c:555:7dea with SMTP id d75a77b69052e-532eac6984emr21152101cf.30.1790121523008;
        Tue, 22 Sep 2026 16:58:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:42 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Date: Tue, 22 Sep 2026 19:58:25 -0400
Message-ID: <20260922235830.2350770-6-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The huge-PMD branch combines PMD validation and lock ownership with folio
filtering, splitting, aging and isolation.

Move the folio-specific work into a helper called with the PMD lock held.
Return a locked and referenced folio only when the caller must drop the PMD
lock and split it.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 70 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b31b877c2c130..6b518f7f73651 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -394,6 +394,49 @@ static bool madvise_lru_folio_is_filtered(struct folio *folio,
 	       (pageout_anon_only && !folio_test_anon(folio));
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
+{
+	if (!pmd_young(orig_pmd))
+		return;
+
+	pmdp_invalidate(vma, addr, pmd);
+	orig_pmd = pmd_mkold(orig_pmd);
+	set_pmd_at(tlb->mm, addr, pmd, orig_pmd);
+	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
+}
+
+/* Return a locked, referenced folio only when it must be split. */
+static struct folio *
+madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
+		unsigned long addr, unsigned long next, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct folio *folio;
+
+	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
+	if (!folio || folio_is_zone_device(folio))
+		return NULL;
+	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
+		return NULL;
+
+	if (next - addr != HPAGE_PMD_SIZE) {
+		if (!folio_trylock(folio))
+			return NULL;
+		folio_get(folio);
+		return folio;
+	}
+
+	if (!private->pageout)
+		madvise_cold_pmd(private->tlb, vma, pmd, addr, orig_pmd);
+	madvise_lru_folio(folio, private->pageout, folio_list);
+	return NULL;
+}
+#endif
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -431,22 +474,11 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			goto huge_unlock;
 		}
 
-		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
-		if (!folio)
-			goto huge_unlock;
-
-		if (folio_is_zone_device(folio))
-			goto huge_unlock;
-
-		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
-			goto huge_unlock;
-
-		if (next - addr != HPAGE_PMD_SIZE) {
+		folio = madvise_lru_huge_pmd_locked(pmd, orig_pmd, addr, next,
+				walk, &folio_list, pageout_anon_only);
+		if (folio) {
 			int err;
 
-			if (!folio_trylock(folio))
-				goto huge_unlock;
-			folio_get(folio);
 			spin_unlock(ptl);
 			err = split_folio(folio);
 			folio_unlock(folio);
@@ -455,16 +487,6 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 				goto regular_folio;
 			return 0;
 		}
-
-		if (!pageout && pmd_young(orig_pmd)) {
-			pmdp_invalidate(vma, addr, pmd);
-			orig_pmd = pmd_mkold(orig_pmd);
-
-			set_pmd_at(mm, addr, pmd, orig_pmd);
-			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
-		}
-
-		madvise_lru_folio(folio, pageout, &folio_list);
 huge_unlock:
 		spin_unlock(ptl);
 		if (pageout)
-- 
2.53.0-Meta

