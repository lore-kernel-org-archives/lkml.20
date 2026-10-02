Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B5943D4E0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950064; cv=none; b=K7ziSnx1WnfSzMrM9pDH5Vw2L0LLm9xTVQqGgh4j5OMtIB3T4AktI61Eg9C01ADrjqjf1OKO4wvmIFfNo8l64yPYvswyccL4UWKDpRwiI+cqSdPs5UvD2EQDBaHMrDimNwJ2UmFzuNh9O2PcNeyUZTV07rbmcmqgwUUBBoWSlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950064; c=relaxed/simple;
	bh=JjO6pU949CqRqbL26N1fqRy0WHxaqLDDRf+/sHdhEoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1ORwDq6GR6yI0Qh5zbrCCXjCG8PslvnIcTgT1XfeS7YjEMN1mO9W9xwPtLmQdOxoagsTdwTWTpOBVhur0ZikWWe4WuM8HAUej8U9KaUzdXwOtRcyUqGyrPe/ov/nVTcmMOZI8aYRp6fjtkoSDVOFosMKKRqMQ7E7K6/z8Y5toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Fl5fOCct; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Fl5fOCct"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so532425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790950060; x=1791554860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcpSt1gDUaHzC+rz1E47o28EjRtid3BchWuzvfuo1o8=;
        b=Fl5fOCctIKLzY4pUqiuHO8U3lYr6NENKp2u0Nf1zLjXSOeeHDD+stQQOX4kGABR1uB
         iZlyR4wb7Zhiqf7QO01Q5aBL5wTYM4mTWVN2N+6gL/8AkxDSHqDR3yZbvdYWFDMfnRlh
         94jwsnZTX1AynSXuylzA5LTi3bWmhI7YNc2G1ty2RyFWdHytXncqdSYCiNdur7KNr/1z
         s0RCQE6+W5C9xcSDvkTEkaRS2Gowd1SbNTkg7fkSjXpwYaBeoa2zCIV9/1Q/nuj4VSgH
         fsGMwMJ9WEOBHU1E1an4C52TlyprP6gnaSxKMET4IIjRI+ii9zHfHZpIUKRRHyAY/hsE
         MDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950060; x=1791554860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcpSt1gDUaHzC+rz1E47o28EjRtid3BchWuzvfuo1o8=;
        b=jyleYfS9+Cg/zwQBBHzs2THD6KOyLhYJ2hVB3V+7q6obwNQivYEDoQUFI+dVu+g9rM
         q9uy65OXgl5hRtmdC0NbL8BlXR85yKgkgmysWxr90QnBVfNYagfF+gD5HH+2YVqz6j/F
         K/j0Y4iOxOyzmy+o31c0teqDqHPcJIByJj35A7ksLQrvAekEmIXuHcjTcI2y21+XkBzJ
         KCmxACOQwwpXtanXzbRwup6wMh2aedkvb2k1+8qU7hHctwebj8xMHkNHB64+SJrHyFQw
         IHNgCAVtIbvJZab9f4QsQbZPA6Joqi+Rz7Smrwo136VraQHHL/eehquI1zNOYYFWwqwp
         dOew==
X-Forwarded-Encrypted: i=1; AKwUvByv2EEkhDLPav/MnT6zi0vZGbHqf5Jq1+MEplJj8OnXIA0Bzc0WL9TBzK8k0SwMl1n0BeM4Tk4wWViJxJg=@vger.kernel.org
X-Gm-Message-State: AFuF++mZopRZpxtMJeb0l6Uz8gfNyFMjrwTWGzH8xZyizm56BR/2XePl
	H83qFeSvSArnZy5vgpPXm2mch7qREL7VYOfqEccpl2fXWHhx7SU+5k5g/TgExh/8l29z3oDiuk2
	GvWV3
X-Gm-Gg: AYBFou1nzMLwWB6esRUfVltu3QFvzlMBu75CjwACrxzONyllMQJ1PLz3p+YzyFfkINT
	JJVy5QKuFsgKR0PoKhlI0SD13x/EzrZd0e45cYsMHbInhX9Ysz2/0jUTXnNq6+Ta+VzhboI5fu6
	GK7bTRqGiiJtlbnn1j6sHYVw2vS4WzSaegAFqDHoRahCsP0WYLB8giXhuUY/2+bxLKf9hwp3wn6
	ikbKKefjao0qPu56FBCCAAdqQEZapu5lmoq9oCH4ml1crdGu/08BIBTGmahNuOZzM/13fh6Zibv
	QGMGxuqJp2i8RGLbVn8iRbpbyi/kswh45JOSOKPYGmoPTVtizk2pCfVRmQwYyPv22GWb5inmg12
	lVyJt9oTOGqCSZZUnkkUS+9WmOWQUmJaF/Y9pzHzxii3wAvuxx6s1+Eh0a9k2c8Lsweq3g1GG7U
	BM/ZHGFImhOyI/WA/uD1aARGpVE992PMXvIDeh17o7Q1Ho23TxH17UxHZBJcA6KoDd1TOxKFdCA
	p+EDAk1fiAZd7MdcX7+QNyBi18=
X-Received: by 2002:a05:600c:3e05:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a0276a0e94mr48124685e9.26.1790950060260;
        Fri, 02 Oct 2026 07:07:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::7:9b19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm62670135e9.2.2026.10.02.07.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:07:39 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: damon@lists.linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	sj@kernel.org,
	akpm@linux-foundation.org,
	Gregory Price <gourry@gourry.net>
Subject: [PATCH] mm/damon: use damon_get_monitor_folio() for hugetlb entries
Date: Fri,  2 Oct 2026 10:07:27 -0400
Message-ID: <20261002140727.701709-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory Price <gourry@gourry.net>

Hugetlb folio acquisition is open-coded in three places:
  - damon_hugetlb_mkold()
  - damon_young_hugetlb_entry()
  - damon_va_probe_hugetlb_entry()

DAMON already has damon_get_monitor_folio(), which paddr uses to
get monitored LRU and hugetlb folios and to filter them through
damon_folio_acceptable().  These paths bypass that check.

Use that helper in these paths too, so that DAMON acquires hugetlb
folios and applies its acceptance policy in one place.

No functional change intended. All callers reach these paths with a
present hugetlb PTE under the page table lock, so the folio is always
a mapped hugetlb folio and the helper always returns it.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/damon/ops-common.c |  6 ++++--
 mm/damon/vaddr.c      | 10 ++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 77366f42b3e5..f986d79391e4 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -140,9 +140,11 @@ void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 {
 	bool referenced = false;
 	pte_t entry = huge_ptep_get(mm, addr, pte);
-	struct folio *folio = pfn_folio(pte_pfn(entry));
+	struct folio *folio;
 
-	folio_get(folio);
+	folio = damon_get_monitor_folio(pte_pfn(entry));
+	if (!folio)
+		return;
 
 	referenced = damon_hugetlb_ptep_mkold(pte, mm, vma, addr, &entry);
 	if (mmu_notifier_clear_young(mm, addr,
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index d5dde97b3cd0..b549496ea8e2 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -411,8 +411,9 @@ static int damon_young_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	if (!pte_present(entry))
 		goto out;
 
-	folio = pfn_folio(pte_pfn(entry));
-	folio_get(folio);
+	folio = damon_get_monitor_folio(pte_pfn(entry));
+	if (!folio)
+		goto out;
 
 	if (pte_young(entry) || !folio_test_idle(folio) ||
 	    mmu_notifier_test_young(walk->mm, addr))
@@ -660,8 +661,9 @@ static int damon_va_probe_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	if (!pte_present(entry))
 		goto out;
 
-	folio = pfn_folio(pte_pfn(entry));
-	folio_get(folio);
+	folio = damon_get_monitor_folio(pte_pfn(entry));
+	if (!folio)
+		goto out;
 	damon_va_probe_folio(priv->ctx, priv->r, folio, &entry, NULL,
 			walk->vma->vm_mm);
 	folio_put(folio);
-- 
2.55.0

