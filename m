Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E2296BB5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113358; cv=none; b=AOYNWTEX8NDb3Io7KT+r1uSRTzYoIo0vWoTLSR6lT9p5opK5jX4fsafLyeR7p5AXhW0Lb8pCf5QCwtb7VBeQaAdWam6UPqGlXBHaeQ0+I7H0XqFbloEV+p7HSB/wzMifgjZrcsP7oJ1hoh/e+sLGNevsm6dffAtulpszsotDg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113358; c=relaxed/simple;
	bh=9VAJj7cYZ380+pNqLiYIjT2WUQyqSLCyrHJH/HMmkLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnAL3/C+UOaRV1k3LW7AFpNujVrPzg58CL2GpwJ28XAwrSABEjsN9fIzvNkucz1rqsQbssGqXnxKY6pXMjibYV7/kxpLQOFvo8U7PKZ1mVMIfx4lrIYDh94aPTcGP3tQZy1w8/0OBeYoJPjBgEQDGpQ8mu91e0RN3PBLzuWNuDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=EAPBPvPO; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="EAPBPvPO"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-825b40f8a26so2874291a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1792113356; x=1792718156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NehW30zqnjXf2BZQWCFKMsNatcoAA2i6XIIUsdpRco=;
        b=EAPBPvPOekpK8Iln5SdDepOa9mPsiKmVKqIOD8Kj9bBpptcdAjgP9N/7wBus8Z27/G
         +ItyZrRQCZkH1TO3wn9cqB7zGHG7HWp1CFG9iGu3JEIVS73wWH6lYJ9tWwKT11S2s6Jm
         jBnB4v/Kb1foK/mRB13c/+wIeeed5Gq6vzZpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113356; x=1792718156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NehW30zqnjXf2BZQWCFKMsNatcoAA2i6XIIUsdpRco=;
        b=Ty8//1sjJOisKv6fDNHZCJrC9hiC2RAhzk8W7Y8VAIca76eNwWJbEmjkUnu17YHaOA
         HHH+GHAKQCDwURfAJSA4Px5Fh+pIKADegDQhfZL7ooTUdSxS18v2a+slPkK021DFuPIY
         r5trwuyA0BuSx6JaSwhkWrcsA/e792YTvj+VCkBQWuH2oMAswYPkWR0K10DfbMRzJnyT
         GSKeh2ezUPAQa/dLwQ/EoG+7JKU2HIrRVdrKDqTnyVdnNxvz+TMqV+mnfFEmyhZJLJR7
         fYhsCnDBNm2UQuGUNYE/zl1wAe4K4R5cQwLBv3BZ4VlbCGDGGFwSQATvS/aw70hx+5UW
         S3dg==
X-Forwarded-Encrypted: i=1; AKwUvBzcqPe8QLAEGPvibGPj9VOkGcE9HVhlUtsJsdODSN5MKI5JewYfh79fmc7n2RmenM68ks3PxPS7SlEoFAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVeaCFcoeRIqSg0g5pYR974ZFPp4nLNpSYjiVqf2e96eY2XAen
	gyqgDfPY1PO9HZ9d+CMI1OLCvoAvovVYpIFz94Kpkrp7zeoYWdGBao4xy75nyxmm0SldDg1tF9w
	v0TtTWJ0=
X-Gm-Gg: AYBFou2JVi2F2wGpIUuUeSwVnCaltl1CLRtBQ5r9n5Au0T7QBOXy9xgv7XjfqG1vIeR
	aWjvLSwCrNn7NJR80y3dw+s8tgzIw5sb+SPwbf5xEmUbNPtF0QoOt+Ifs6pZv/6pxQBTz7hLKHi
	Jb9P66fJh/wf8DeFXiAa2Ivg7qRaF+trvFYia11ug5vPnvi4SOg0F2BQ8+XcvABHaXLsg55fT5b
	pRuA+/qUSS/CxdMCJbHMFQFzHYBLYgEc3x3v8PWRr0QUjEpGvZXLT4S7J8To/hPI013qtpkrxDU
	/tBz2FzwHyPcTehufFGHhgRvi06ZLFvYy8ed/8ag0QfKiJmYav/2G3pm8FMbJ2j9qQj5jyXN2XJ
	hMaWi6AJCYMXHN2304TmxnKku5fN3sU2flZZ5gzJBfwN1bplDqeg0uoanwG78r1xHW6rdna9DEq
	0yNQWlBjK8leVF/Pd9rO9Qfz1YM5xQM77PmwgkIMsCtdB9fP8xp4Wiuxb0X9yOueYVywl5g/buA
	DrcV51rChlKgT0ZOQxlxgIg9YWt8R4/h6LS7YyOLUx8IjPW8lQ7DzFlcAyCU5iccw/U/1z5t7k=
X-Received: by 2002:a05:6830:67d6:b0:829:9992:2106 with SMTP id 46e09a7af769-830984475fcmr20639981a34.22.1792113356354;
        Thu, 15 Oct 2026 18:15:56 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a01f56sm547197a34.7.2026.10.15.18.15.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 18:15:56 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/page_vma_mapped: continue past nonmatching huge PMDs
Date: Thu, 15 Oct 2026 18:15:49 -0700
Message-ID: <20261016011549.61146-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PTE-mapped large folio can straddle PMD boundaries after an unaligned
mremap().  If the first part is discarded and replaced with an unrelated
huge PMD, page_vma_mapped_walk() stops instead of looking for the rest
of the folio in subsequent PMDs.

This also affects migration entries.  A walk that stops at an unrelated
huge PMD can leave migration PTEs behind when migration or an anonymous
folio split restores the mappings.  Those entries do not hold mapping
references and can outlive the source folio.

Skip the current PMD rather than ending the walk on a flag or PFN
mismatch.  Do the same if the PMD became nonpresent before the locked
recheck.  Release the PMD lock, clear the per-PMD state and advance with
step_forward(), so the existing range limit controls termination.
This covers present, migration and device-private huge PMDs while
preserving the matching-PMD and split-to-PTE paths.

Fixes: ace71a19cec5 ("mm: introduce page_vma_mapped_walk()")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 mm/page_vma_mapped.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 4e964545e5e8..67c8039e9d28 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -258,28 +258,28 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				softleaf_t entry;
 
 				if (!(pvmw->flags & PVMW_MIGRATION))
-					return not_found(pvmw);
+					goto next_pmd;
 				entry = softleaf_from_pmd(pmde);
 				if (!check_pmd(softleaf_to_pfn(entry), pvmw))
-					return not_found(pvmw);
+					goto next_pmd;
 				return true;
 			} else if (pmd_is_device_private_entry(pmde)) {
 				softleaf_t entry;
 
 				if (pvmw->flags & PVMW_MIGRATION)
-					return not_found(pvmw);
+					goto next_pmd;
 				entry = softleaf_from_pmd(pmde);
 				if (!check_pmd(softleaf_to_pfn(entry), pvmw))
-					return not_found(pvmw);
+					goto next_pmd;
 				return true;
 			} else if (!pmd_present(pmde)) {
-				return not_found(pvmw);
+				goto next_pmd;
 			}
 			if (likely(pmd_trans_huge(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
-					return not_found(pvmw);
+					goto next_pmd;
 				if (!check_pmd(pmd_pfn(pmde), pvmw))
-					return not_found(pvmw);
+					goto next_pmd;
 				return true;
 			}
 			/* THP/device-private pmd was split under us: handle on pte level */
@@ -292,8 +292,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			    (pvmw->nr_pages >= HPAGE_PMD_NR))
 				sync_with_folio_pmd_zap(mm, pvmw->pmd);
 
-			step_forward(pvmw, PMD_SIZE);
-			continue;
+			goto next_pmd;
 		}
 		if (!map_pte(pvmw, &pmde, &ptl)) {
 			if (!pvmw->pte)
@@ -336,6 +335,17 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			pvmw->ptl = ptl;
 		}
 		goto this_pte;
+next_pmd:
+		/*
+		 * A large folio can be PTE-mapped across PMDs, so a
+		 * nonmatching PMD does not end the walk.
+		 */
+		if (pvmw->ptl) {
+			spin_unlock(pvmw->ptl);
+			pvmw->ptl = NULL;
+		}
+		pvmw->pmd = NULL;
+		step_forward(pvmw, PMD_SIZE);
 	} while (pvmw->address < end);
 
 	return false;
-- 
2.55.0.openai.911.g06873a30d2f3

