Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8DB56E051
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002646; cv=none; b=bVRIKupxJ5dar8tNC7JJOn0vij1Rh6ufnbfVlAhic9LnwP+izBS58dkJhY2nrT9IQOUBmHDqTntLWhOoX1POZ5tqSQaPOK10HSlBxomKFih8s2ZMS1n1AzT+iXA0guM4HLIFtmx7H1v0Rab7X3+SvIIW2HEWmr6TnaT1ollcSgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002646; c=relaxed/simple;
	bh=Efxa/guM4cW6/ip85xAhRThMMbu2SwQy2HYlRJJVP/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeTWcS6USsR9hSWE1yXwf2PLvGoH1GsImvrINQuv/5FCy6vNCK0UyYEuCswuVrF7areZeMbV1RUboeGceoxKvGJiZsNAgr+ZtrqkYrjSO1wQEKA5fiu3XJ0ETzeHI5suoUe3TkYwY86/2p7A7Xa6fMz4GA0Ty42/SrnU0nV/VZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sG6CNwQs; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sG6CNwQs"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b8306b9f8so50390526d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002644; x=1792607444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJo2gAKsEo0t/BTlHKqqnwXUysT3Hn0OcnvXdcWDu6U=;
        b=sG6CNwQsKvrWJ67b7V2HkUv9eHBBtCalwa9E01zP8qnspu9YbeCo15NLqcOkBVQQZb
         QMuQbwz5nYwRrZrp2aMGKrilFCyyM5+3+UJ/U3Q9a/X3vcNkZOGpKz2VCnrm2j8rakRN
         FmfryyE4jwG1aIsHR9XJaU+kawG35Esy/U32MkMRFuCHVD0bqMNDJqf+ikkElkiWByux
         UigzFAtT11d8m3Q/b13GouFqi2q6TGKuuwL70Ln0QMk43pzYimO4MIU5UE/m/Q8wJ7fM
         frSaDwmhG6TfNOWBqeAP5xK48X8DWyqCWrn/cl3sEJ3QkkzLHjxO9yz1ConXv267tog1
         xp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002644; x=1792607444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJo2gAKsEo0t/BTlHKqqnwXUysT3Hn0OcnvXdcWDu6U=;
        b=V+eokREmCSuSNNCLTnoFYwCLkwgrwIn/HISYJwVlEJHxjqHCaCvjZUQyMy0HH5duJW
         01d2l00HKYWbZGnBDopQWPZHZGRk7ZIUY9dpFQzN1dGOUx03afCwyiHfrjKRq0vdZctp
         NVWpFsrrvK2WIQCdQYq0NT8HbVNjSwg8KGkB/ljrRGTSUzNLGQL+QYnNFk8U/ISvw2Et
         Q0bPj5uV8sdUm4s1+6TDNeBW8sMUT/I1OoSDpsiJP9FGMaMxsBun4xTuShRWeoebrEgo
         VPtjLvmWEl9xZnci5gr7YxBLLu0RO9ERX2S2NWoVZ9EAoWG6gu3oMSHrwNzi3+hJIv89
         iIQg==
X-Gm-Message-State: AFq9FYK68JlENRQzvEBcnpxlj4nHasg5OJtz8ZciYQtCVFV6IzCQsEd/
	ChMEK4Q2weG3Ztl/awPWW1ApMI+e0MKFRi7i4DnCvTwO8+c+X84sLJUqw3D6wrxV55I=
X-Gm-Gg: AYBFou0bgp7oIuZlhA9Td4XbPPn9E/eCGdyR1uUNXLwEiglwX5KefCd9JVMOAW9KZmk
	rn0iPvF+Vt7vc6nl0ZEy6+hfcL+cyS3Y6ISmOniWV/dMiVQXWy0Bx976JryUBr1rZqOPtlxD3BS
	pTmEFoInTMWyjt7M87drcmQ2ESBoD2wdEo8ANRwjeLklpBkKSB0YQQ+KvSximaJWshwZOMrlOLq
	uxRr5+Qev7Pn5sO6/MM0GevTrcGO4PMujnowaLXaF8OfMuLTQWo14oiBNxbem6SwHRmnb3h3O78
	+q7kduuLSxWpoUJXdA6e0U9ePe+GWU7K4jKlPjM75R4cEsDuW85fs6Lktx/1BzVBO5cCb5boD89
	nmKSMKCujFZ2X0sMXBcosyPWG3R17B3BUnLxeqV8BwElQ40wzt4AthIbq5sQioFJwKBO8SDeZS+
	W1CCy+KfX76pgE/eqBYaGzT3mXx8oKCMlKKssAIC6k8H+8/2Itay24elnO/4y+lMoFkjFMierVX
	dLQwnU0Vb+ytprmOBV62TixfHY70W8zBEHRXYx+mMRABlRshj80QsJO6syekA==
X-Received: by 2002:a05:620a:6493:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93ebd09e6cbmr2693181685a.12.1792002644454;
        Wed, 14 Oct 2026 11:30:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:44 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 10/10] mm/madvise: share cold and pageout walk setup
Date: Wed, 14 Oct 2026 14:30:24 -0400
Message-ID: <20261014183024.2075709-11-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014183024.2075709-1-gourry@gourry.net>
References: <20261014183024.2075709-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_cold() and madvise_pageout() each open-code the same mmu_gather
and page-walk sequence, differing only in the pageout flag they pass to
the walk.

Move that sequence into madvise_lru_vma_range(), which takes the flag.

The walk now gathers into madv_behavior->tlb instead of an mmu_gather
on each caller's stack.

madvise_init_tlb() and madvise_finish_tlb() leave that mmu_gather
untouched for both behaviors, since neither batches TLB flushes
across VMAs.

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index acfe5b945eea..db4f498840eb 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -656,21 +656,23 @@ static const struct mm_walk_ops cold_walk_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-static void madvise_cold_page_range(struct mmu_gather *tlb,
-		struct madvise_behavior *madv_behavior)
-
+static void madvise_lru_vma_range(struct madvise_behavior *madv_behavior,
+		bool pageout)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
+	struct mmu_gather *tlb = madv_behavior->tlb;
 	struct madvise_walk_private walk_private = {
-		.pageout = false,
+		.pageout = pageout,
 		.tlb = tlb,
 	};
 
+	tlb_gather_mmu(tlb, madv_behavior->mm);
 	tlb_start_vma(tlb, vma);
 	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			&walk_private);
+			    &walk_private);
 	tlb_end_vma(tlb, vma);
+	tlb_finish_mmu(tlb);
 }
 
 static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
@@ -681,37 +683,18 @@ static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 static long madvise_cold(struct madvise_behavior *madv_behavior)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
-	struct mmu_gather tlb;
 
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_cold_page_range(&tlb, madv_behavior);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, false);
 
 	return 0;
 }
 
-static void madvise_pageout_page_range(struct mmu_gather *tlb,
-		struct vm_area_struct *vma,
-		struct madvise_behavior_range *range)
-{
-	struct madvise_walk_private walk_private = {
-		.pageout = true,
-		.tlb = tlb,
-	};
-
-	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			    &walk_private);
-	tlb_end_vma(tlb, vma);
-}
-
 static long madvise_pageout(struct madvise_behavior *madv_behavior)
 {
-	struct mmu_gather tlb;
 	struct vm_area_struct *vma = madv_behavior->vma;
 
 	if (!can_madv_lru_vma(vma))
@@ -728,9 +711,7 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 		return 0;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_pageout_page_range(&tlb, vma, &madv_behavior->range);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, true);
 
 	return 0;
 }
-- 
2.56.0

