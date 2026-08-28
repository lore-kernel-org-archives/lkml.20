Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5BF3B894B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942271; cv=none; b=UwQWd5CnBwzghIljkmjPjm7wAHV8qN0Sy1htZ7XmfMIXfJpHS2fQvv/1bHz9CnZf/inm1Zm1beJnZ2/Z9SJ3mAOoHvmkK/UlD7fOYnPk9BwMflpNyevFNrNhzrtpEE7NR7ibBlDAcwGY9m0xStsQ/tu7BxwS9fjbqcm+Jy9n5u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942271; c=relaxed/simple;
	bh=6NqEHEqHyjECT3AL8PMFJmkyHVP8IPxNQJWyBT5Jo2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=smlctoi2WHSVGvdfrlkd5TrIDCMBIHxu0rbE2FB2h1kHp2ZgQdp6c7QUCkAjryxiojIEk1FDlRa7C6qIGJUwzlOdx1wHPf+wWBdq1ACskV5qstugcahs/fc7oltzPGBYubOP9m2pKxJqMnFiyl5UXJ2cQgpXP12iclxgCY4w6rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O08xongu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O08xongu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1289247b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942270; x=1788547070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zk9fbsTtY0uQCDGritDt2l0ASVNz5DfiHm7Yt38aS10=;
        b=O08xonguB+uUl6V8EXOKsSRZpUUumS6mRB3rMmVMRzV6Via6obL6TMxIjMFFDymdPH
         HgOkYxzMnYuuPdsZA6zkGo2+SWvOsqgRW+iKleEv/87/nv54uTcB1+PsCNa7SuCQ9j0C
         vY6iHEu9jzp3NlEM6d5tQ15TJbcmFrbEfUgUyaU+A7yZO08hilWa4CXQ1oXEMUVYudsD
         z06V3WaTD21Kq/nPUxWk3roXg0h8sdYk/ls4nSh2InDItuFmPvTaZTx7QffMWWtkN8F8
         hGDqc8+mPPM/tr6jBrawdYsvC3x6a9grji9TyB0IGH+/gbLTuLc9rYd/MusmsY3x0LCv
         mXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942270; x=1788547070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zk9fbsTtY0uQCDGritDt2l0ASVNz5DfiHm7Yt38aS10=;
        b=DaPWrWBVIVkNkrJhaHOXIyOGaeeQkSnF4+IDZrS+EYFe5HdYrEG58gAShtgSQlc/69
         nMR+GFaQJufoZSIz9A55Q+8UXPBKMxwtNRrlT1tI5m4bD7z0aWeNujoiGzT7usyEkzAa
         /5Ow1rHKoNTtMeiJLx0E0SFwiDhaKRR+EXAihohkT97d1umw2AGdKSaHHbZ6hvTmowAq
         lIJvy7AZyrbIJ2E2F/02roCZstiDHIBlU2AdMNUMuUbjT6cVCuRIB2XUpAz43gsuzc+y
         MfLA/G/yqAExGyVFJEi3/ig4OCkvM0RFlAddgttqbwxcdvOpUPe/gH+u1/azqu13iGIO
         c2hQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMNdiXamby0gL9q5ODKKkBpUOHXQrR8rzkTCKUFw6gJIAKTp1DMtQ4lcU7HZPb1PZFHuSg7na+yxTYfcA=@vger.kernel.org
X-Gm-Message-State: AFuF++ndcQX5ipl6UCLnCV1ii/UeNcu/dlYXLyT2i0yNGjzn6nZyNiMX
	3ueVtkxvC+UH2ME9A+3qruDmusO50zoA2xSmQl5+PABbt6xcoFwkHHZu
X-Gm-Gg: AR+sD130ABEhIcIxTUlf8Ddl74mR52XUqZj+pEK72vXp5rLIlyJ+tatEynigPNY5m2p
	630VdOIoZltrPPXKKqSNpzgNemUCmeqtel2V1k1vVIO472/yBQn5r6luL5CRy6/nYBzzB9OFlU5
	FmjpIh5kEyp8fc9+5/kwT3CENAfxsUzQrXyfjACI734BxsGjvj4IdJYesg1gFUcA6UC/erwH5NW
	VFAFTCYbS0fRCtJcmlpARSwOFW7z9X9WQzVyCkrBfyWaCvREorHbkcEw5Z66dqlUUWjSQAfxGwn
	wtugffQCFPc/W2wzUpnL4tdmQ7cWA4QakcG8bMO54bpBlwdk01iuyeD9WY2POZokJUrvUiOmAvJ
	jHYpuSwt5kMjddGLaIljnXmIHlDdPFxgog7zOA7cwELwHuIDv2HamIl9ZlI1hSQQ6mKw1TlI2rd
	SW8Q3rZCwPVkRuFA4F0GsyJSDs8FQLOO4NVaU7mYJddFt241Eoz7FyUFcX5bmDH7JCd412lmL8J
	MYlMoiaohHzJMnP4g==
X-Received: by 2002:a05:6a00:3cd6:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8577317d17cmr2655096b3a.19.1787942269557;
        Fri, 28 Aug 2026 11:37:49 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:37:49 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 6/9] mm/huge_memory: add and use split_huge_pmd_anon_rmap()
Date: Sat, 29 Aug 2026 02:33:16 +0800
Message-Id: <1022e5cfad8bb7e32946da7e881534730757bbbd.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The anon-exclusive handling and the PTE-level rmap conversion are written
twice, once for present entries and once for device private ones. Factor
them into one helper.

It returns whether the mapping may still be frozen instead of writing the
caller's freeze back.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 90 +++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1cd8878edc1d..e0083a9e89b8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3194,6 +3194,43 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 		folio_put(folio);
 }
 
+/*
+ * Convert the folio's PMD-level anonymous rmap into PTE-level ones.
+ *
+ * Without "freeze", we'll simply split the PMD, propagating the
+ * PageAnonExclusive() flag for each PTE by setting it for
+ * each subpage -- no need to (temporarily) clear.
+ *
+ * With "freeze" we want to replace mapped pages by
+ * migration entries right away. This is only possible if we
+ * managed to clear PageAnonExclusive() -- see
+ * set_pmd_migration_entry().
+ *
+ * In case we cannot clear PageAnonExclusive(), split the PMD
+ * only and let try_to_migrate_one() fail later.
+ *
+ * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
+ *
+ * Returns: whether the mapping may still be frozen.
+ */
+static bool split_huge_pmd_anon_rmap(struct folio *folio, struct page *page,
+		struct vm_area_struct *vma, unsigned long haddr, bool freeze,
+		bool anon_exclusive)
+{
+	rmap_t rmap_flags = RMAP_NONE;
+
+	if (freeze &&
+	    (!anon_exclusive || !folio_try_share_anon_rmap_pmd(folio, page)))
+		return true;
+
+	folio_ref_add(folio, HPAGE_PMD_NR - 1);
+	if (anon_exclusive)
+		rmap_flags |= RMAP_EXCLUSIVE;
+	folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR, vma, haddr,
+				 rmap_flags);
+	return false;
+}
+
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
@@ -3275,23 +3312,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		anon_exclusive = PageAnonExclusive(page);
 
 		/*
-		 * Device private THP should be treated the same as regular
-		 * folios w.r.t anon exclusive handling. See the comments for
-		 * folio handling and anon_exclusive below.
+		 * Device private folios are treated the same as regular folios
+		 * w.r.t. anon exclusive handling, see
+		 * split_huge_pmd_anon_rmap().
 		 */
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
+		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
+						  freeze, anon_exclusive);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3315,6 +3341,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * complete for this pmd), then we flush the SMP TLB and finally
 		 * we write the non-huge version of the pmd entry with
 		 * pmd_populate.
+		 *
+		 * This must also happen before PageAnonExclusive() is read
+		 * below, see folio_try_share_anon_rmap_pmd().
 		 */
 		old_pmd = pmdp_invalidate(vma, haddr, pmd);
 		page = pmd_page(old_pmd);
@@ -3329,34 +3358,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
 
-		/*
-		 * Without "freeze", we'll simply split the PMD, propagating the
-		 * PageAnonExclusive() flag for each PTE by setting it for
-		 * each subpage -- no need to (temporarily) clear.
-		 *
-		 * With "freeze" we want to replace mapped pages by
-		 * migration entries right away. This is only possible if we
-		 * managed to clear PageAnonExclusive() -- see
-		 * set_pmd_migration_entry().
-		 *
-		 * In case we cannot clear PageAnonExclusive(), split the PMD
-		 * only and let try_to_migrate_one() fail later.
-		 *
-		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
-		 */
 		anon_exclusive = PageAnonExclusive(page);
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
+		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
+						  freeze, anon_exclusive);
 	}
 
 	/*
-- 
2.34.1

