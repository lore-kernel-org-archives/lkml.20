Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772C569F0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002637; cv=none; b=Bj1jfNUK3+38WcDL1gEYGGD/D703rg/ppPl+FqCGfgI0W8lPvNQqSYVKvrOCxNla2r6O8MQOjidD/2guIkm2QZmsiu9K8ZUrRKp1XZT8sq3se83z/eGgeC5nWFhP08ti3OWeZkC8N91bIoJN6/denwJ5J6BTLzOUFTAKpVEAACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002637; c=relaxed/simple;
	bh=xPin/lqp+Y3xG4MtsBrRX/6vGgzLDywNumNeEFv9BOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LG6crttPe+l0RMFNDdpU1I26PNoTkU+nRO2we4eWuYbb3GsB/ULXrtJLkOim5M1frXvH0sREJExZBbqIs3mgp/zrbbI560fGGaCdWMFMZXYctKDMyKhPZs/QmLJtZVb3ymr1qMmk/PP7WiScQ4YQBxviv4JxSYgiMa7Qqx+ZJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=i0EagxIP; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="i0EagxIP"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91bb5795792so6570896d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002635; x=1792607435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqHIExQRgXi1oeOkHNuWD0OjF5Gt5qjGM1Q50YZlDZM=;
        b=i0EagxIPkB6D6uK5qGwDqMvCtyQFrhkO6BQ0b+cEGxVkdwu5hRkvCDKL8jFfCWtdLM
         BCuBHV4jy1w6t0PvR3YK3EZfE1oNeo1G3HO4zcNSO9NzP7egIk+ecQ8D0rbs5P7UAOER
         qqrRBUKfp+sSmge8ZYxSwVh3LjTJQoHHlcXTjEVQnOydtgcVXRMnxoJUBuZshs56S0zn
         RO5ORt2myQWYli9pxvwqm/23IgaQbDlRvzF/GXDRYQ9AA1glg69bc5Q4VOSGqzJdi+Ao
         wTE4al5FgvOc128SXaBe9RZWBdXAgM7ivnCEjo8ccmx5/PMMvs1dO3WeOyZFSfl3CrKH
         0ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002635; x=1792607435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqHIExQRgXi1oeOkHNuWD0OjF5Gt5qjGM1Q50YZlDZM=;
        b=ljR8Mhhp4fKOERtcohE3YYp5TldvIE9bs/JGItihWt3Zx2qgBei8rIcSRmEq/INdzc
         Vy+sYtTONcNgJxZykyggAwiXPt+Y2+8pxkegsz8qeygEBG33HwcXHMcqnFtkS73uFccJ
         hdQCm5kEJG7BMpi7nWyM+IQVoj2zpswdbBfZbcoLmAZ5lZLzc+33BOpcpRia86ji155X
         JBOLckk0mujd3vXmBa80ulyLULbuCiORJSLnqy+2KUD0TgY6B++1OpLzRM++coEVgjuB
         NzRSCfN4SldUpJxasST63VftmXnh5EkMoa0x7bXdjs7iP6RpAbFcutvRHsV6rnldd0k1
         EQuQ==
X-Gm-Message-State: AFq9FYJpTsXP8nG0MOOaVv86hZtFE0Ml/+U1DRYsEgeZaE7nDUEznE0h
	3Z83a0n4Et3S2tqNetVnva6tLVOFhAH9NI3bbMskq8LA7ayN60wGpn8J8ZbjWKP//dY=
X-Gm-Gg: AYBFou0u1rtIAObareGZBI1IzS85Ir97jyGczhzhIRbzNgYMaGZpURbt5JclnXeUXQN
	fb0kuWe13HqjrUD8JOJQCD1TLF5MN6SIutaZyJJCXSfJdESVFGxi2UgsxgDUEavI+NXdNSE9ObP
	r9Z/wO0aNsgHE56M67sGBgMCcCVt0W3m5oklnMLvjmHAe5nmMdKcdfW24aLCczfbHJrCW09QMOp
	q44bo16rYHPDvmc5bsWuXK7H9HUDEIzxYdmzA7IMDkqRwSb8qiko99kjgFbT1UmAHwCe5eneChR
	MuFDArAXKrEFNIOEhFWZ3MklBggj1+7O0/fU766grSuGPpcwQT+H0F1Cs73WgleuebjplFF+Hu4
	t6bXzYPfKPqHwWrWVjP/3jZFW/495k4zV2A2wBMGgupl9i7Hq4/Ol9+nNQmL7OV8HDhZP1ApZhB
	qX7Mm/Clctmopx3ee6PvopPGAPnjYmksxmBbsu6QM8CjSzKSiGNt+MDJmAtTny7H+1DUB/v97lM
	ZHP5H0tBBh7a97UPEcafSBX5pCuhxPiLRifqUIaaEE9BrNebjR41WGHlJCA
X-Received: by 2002:a05:620a:26a4:b0:93c:c73c:91f9 with SMTP id af79cd13be357-93ebd21f2afmr2707599385a.31.1792002635158;
        Wed, 14 Oct 2026 11:30:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:34 -0700 (PDT)
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
Subject: [PATCH v2 04/10] mm/madvise: factor the cold and pageout folio split
Date: Wed, 14 Oct 2026 14:30:18 -0400
Message-ID: <20261014183024.2075709-5-gourry@gourry.net>
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

Both the huge-PMD and PTE paths of madvise_lru_pmd_entry() split a folio
they hold locked and referenced, then drop the lock and the reference,
with the same three calls open-coded at each site.

Move that sequence into madvise_lru_split_folio(), which returns the
result of split_folio().

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index d3edc056ef57..1bb4f9f0e73a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -397,6 +397,16 @@ static bool madvise_lru_folio_is_filtered(struct folio *folio,
 	       (pageout_anon_only && !folio_test_anon(folio));
 }
 
+/* Split a locked and referenced folio, then drop the lock and reference. */
+static int madvise_lru_split_folio(struct folio *folio)
+{
+	int err = split_folio(folio);
+
+	folio_unlock(folio);
+	folio_put(folio);
+	return err;
+}
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -445,16 +455,11 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			goto huge_unlock;
 
 		if (next - addr != HPAGE_PMD_SIZE) {
-			int err;
-
 			if (!folio_trylock(folio))
 				goto huge_unlock;
 			folio_get(folio);
 			spin_unlock(ptl);
-			err = split_folio(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			if (!err)
+			if (!madvise_lru_split_folio(folio))
 				goto regular_folio;
 			return 0;
 		}
@@ -526,9 +531,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 				lazy_mmu_mode_disable();
 				pte_unmap_unlock(start_pte, ptl);
 				start_pte = NULL;
-				err = split_folio(folio);
-				folio_unlock(folio);
-				folio_put(folio);
+				err = madvise_lru_split_folio(folio);
 				start_pte = pte =
 					pte_offset_map_lock(mm, pmd, addr, &ptl);
 				if (!start_pte)
-- 
2.56.0

