Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5165505C2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002631; cv=none; b=QDhMNIB9R3oLC1J6gT7O4obvMRmiQJsRr4b/dmemDRPb4rHeD2wDTwnxP7tf750fGrvFyvQgA8TIiQs97JAku0z+npAxkxE8MK42iz8niHJ1XxrIPfWVHQLUGthPGSUqV9pfUHeq+yXPmF1S/X3LX1syDTsyW1NCJqOmagkBFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002631; c=relaxed/simple;
	bh=C7s/WFH5xwOxXEWLhEG2bd5kCY0XbwtAqGvqLqczzYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbbMl3u4YEPeQ4OltufE96A2lESkQF/ixlMnfUF6KB0jcNVnNFAWX3HpTEr1O/4UbTKWgIUN1lJGRoEHhNSGHBCBvv3OMA+Mm0W03LCB5p/X6ff1gVTlhEblj3o1zEdzRzeKVY3PahTmg0DPCMlN5CNmpQKy9LTVKGZf5gaR4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=O1S1tUg2; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="O1S1tUg2"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917a04338c1so47340036d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002629; x=1792607429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zyKedNJpmpuM86GYUmjidd6QzKLk815HOP8Xrauk7M=;
        b=O1S1tUg2ZKsxqXNNihqTvl/hB1B3lkTY1zb8xzIEtcP5eNapwiOXotygrBXr1nc5Lh
         pBe6T7BEhN10MyxHe+aGZd3fo+PcOj2zGlT962tsqQo+H12oJ3fhE1JW+N0ElrZOCvRf
         i+o9SUDt6fJfJm3hg4BcFx0rgvNFEwzaGlsxgxLH4s0NAQnJHkOc3XV+sETczC6J1d24
         hSfg65yxZe/XX99uVd62zyJPbk8MPEX57HDHDmnEK5txYRqp0QVJa8hqAdJEL5m+5+NK
         8OeyEFRLQ9OUT0SfTdeaI6GdA6yXqX0g06At7JViLH+BZFZkHPCyPYG1hvqsF8al+eme
         UJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002629; x=1792607429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zyKedNJpmpuM86GYUmjidd6QzKLk815HOP8Xrauk7M=;
        b=YPprdhsSMsbeTr0VznDTqEgPw+JFFYiJiobxFw7dAjWrZyzEyZ3RLGzoomI3miZhWW
         5gVsJiX4VMZVUlCcDPISGxKjO06OH07816R9L+V9N6ewmiRFTvvqOf2M62VBzf0x3apA
         IsHdHS1rtuk2qwjYr6QNKlzZpSJp9BWlzQT+5bR5tqI6V6RO0p20aBUJoNq1J8b4EAXk
         XmNP6WBZtWrJytGEDIResvV73MdW8/lBM63ye07e2/Hkw0tehzqJQzW8FQ+7XRr69TRN
         RU7I0iSAqKAbYJeIo6wA9zGvxLePB1S1ZGw+PClln5wpsgD8VzK+imOqtB8eLly7xyEF
         ruEg==
X-Gm-Message-State: AFq9FYJ/scJNPRJ1ftMIRMJq4YsxkIsVM7JMM4ZpkpvjKtFk5xWEadRM
	EMxfRhkt/sbHvvJmMH5Byup0QTMpn2rZ5hPH7VQ/MUSN/H/RO1UdhCZd/OBEnKGFekA=
X-Gm-Gg: AYBFou3koM6DHON9UEfiC7O6vrmUYZnNaUiFIQ6I3IilBXuYOZMveNm7gOo6iVBCzjs
	iI6lc+pODsXLCefuqqffA+0XK+q8h7T3ughyUOp9jd6RO8m05RCIl5it2NEFv0tgDbmy/jOlyLa
	SuNuAdGjDnEaPBOkCAnsfurC4lstp6VTmzm8xS0+1prbrG2A8c/hEn6jXZ/vVxyD9eqLuRpIU1m
	ZWtxlH2I9fYgNLkKweyL2GR+OTRKYzaRkaq61fNeX2O0s5M10G/3jTX9UySlpj9a74sF5qrCxTK
	b1+gs1aRIvpcLephpBHQsWyxypMKyYcMCpAaBfP0mboO/4Uoza5OU/mLaaFswdwSk202GSkKeMI
	4T/QpfYkZ+qBLwymOGkKBgHJYrTZN1WLADNilko7YOXaYScBmzkbx4x25LhyQsUj8x3FJe9B3A2
	vcd5OHcrwn9vHcOQs63c9kHH2H9EeWPYRlHvNzohlPcY9E2OqTwO97nyIYnhrce2OHaF0NaWdtR
	2wwTEpWr43mxT8svfUHhIPlBprNdCVpWFFJmVvagv3Xc2Jbv1Ypl+GB/CKt
X-Received: by 2002:a05:620a:6489:b0:93e:9171:b82 with SMTP id af79cd13be357-93ebd208959mr2566072385a.36.1792002628519;
        Wed, 14 Oct 2026 11:30:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:28 -0700 (PDT)
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
Subject: [PATCH v2 01/10] mm/madvise: name the shared LRU PMD callback
Date: Wed, 14 Oct 2026 14:30:15 -0400
Message-ID: <20261014183024.2075709-2-gourry@gourry.net>
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

The MADV_COLD and MADV_PAGEOUT page-walk callback is named after its PTE
implementation even though it is registered as a PMD callback and serves
both LRU operations.

Rename it to madvise_lru_pmd_entry() before separating the PMD and PTE
paths.

No functional change intended.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 75b409e97dbf..f15cac3faf61 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -360,9 +360,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
-static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
-				unsigned long addr, unsigned long end,
-				struct mm_walk *walk)
+static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long end, struct mm_walk *walk)
 {
 	struct madvise_walk_private *private = walk->private;
 	struct mmu_gather *tlb = private->tlb;
@@ -578,7 +577,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 }
 
 static const struct mm_walk_ops cold_walk_ops = {
-	.pmd_entry = madvise_cold_or_pageout_pte_range,
+	.pmd_entry = madvise_lru_pmd_entry,
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-- 
2.56.0

