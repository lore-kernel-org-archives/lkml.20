Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619034;
	b=Esxminpb5WtGRK5zqoKh6RQDl2nO7uczroJbEuJ/LdedyF6GJPdQlU2r95U9GqOjs3JJ
	 V4XxbDYwdQ8XwUXoLGoJIb6/TlBhcihGKPNqXhxMyOpsOgWwBaUsqk1QBEZcO45vkkQXG
	 d+pF5pc8L2F1sjnihJjRj/11OSxcO2cBamm7QFj1ZLsuk37jDdlHeaTXYhiA4NWLprtvT
	 BOibgaYwQXoPy41u4WcFmrdqWGCv83Lhx0sYmLDZfFomR8ldTPjFp3tQBRmkprOWTvkTk
	 ToN3YT9e89RUPURvKkXxKQOMZ+WXJCZK3sk3hRU6emFCuZ1Iq8Ot6jRL7q7AEX7frGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619034;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Qxe7DUgpOQnByNQP9kafnk+uEbgc4F97wiPdKo+5K+c=;
	b=nZq4oco8aVDD1ADUvCsPPt8lwX+xHAlpzMQhovW+3jutHAgjkkEPcx1GC3lr7oevNdZ9
	 In8obsSWQgKYXLjaMM6QQcMjFBMYhxwykSWX788yFCG83uC0+mv9JVcs7Qcs2mQvN2y2c
	 Kkh/Er5eUHWA59Mu2sys74jaEUQTzEUuVny70gAAEqSkrctd6pX5kEddqL3kkYsG/SFJN
	 GtfOT3ErlfMb9ySQo3YYGccRCfgp2RspqkKBSvhLzHfZ1GAWIGn+dxjV52aWijmdavERd
	 Jr7rWjElI6gCe1V8mpZLry5zIRUjnLqPceNDR6b6tf1EZBz2YDcS5LBbUlPx2LfzkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JMvdJhXm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F84460A2634
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F84460A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JMvdJhXm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A0C2A31;
	Mon,  2 Nov 2026 03:30:29 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E97F23F632;
	Mon,  2 Nov 2026 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793619032; bh=B3jeugSVzqHP+LRhjNSV9HdZUg9MhTRTmnnXzBcFB1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JMvdJhXme+roww8mpdzFuGI3npOZ5JM3kp7svnIhLxDcBzFTATE9GbvXR/BX4kJwZ
	 spF9xWrKd5lxyn4+L1T2pHzwZc0ZQZZ2vP02nQQN/frIIq4EvIndCmt3etzs0BjXQ0
	 7ACgTd6hOgFfBKc6F1s/RtOpJwVGQWBu97Ii/aTA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:30:17 +0000
Subject: [PATCH v2 2/4] mm: internal: fix inconsistent in
 folio_pte_batch_flags() for shadow stack
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
Message-Id: <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
In-Reply-To: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2140; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=B3jeugSVzqHP+LRhjNSV9HdZUg9MhTRTmnnXzBcFB1w=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HRRquffmGz1YcLeYyKukCvc2f1kN7MzYOiBv
 rN6edzeH3WJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauh0UQAKCRBt1cPRWsUx
 M2VyC/0WDZhM1JkdBWq6zaE7b2OixLBmhhMrkqfWnK2tRpT+gnTHd7okQkDPs5HI9CN8v/Vdksd
 R/jDYg4qGEnhJhwqGqdbaVtEafl8++JcxmvJE3Q8W9c5/XG+NPayAabuwdAeKab2aerLiMgmPVI
 PNx2NcCnExicCxZBB+Sg0eg5N9zcxZckcJ3OPmsjVw9ylCCuQ4VmJUDfRInGtKq2Ib2znRlnFg1
 ao8pDOX0n7ebYRFIYkwt8HeHJuQO4oX3DQ9OasbXTTBPjKdHMavfQpWPFGeT+4DTdlgqK/6dzah
 88J6UwdFosw/qmhN3uhq6TXy9Ke8395uRX60aGRyeUVlCWbb/0y2UWp8j0aTjsBc/aAEimJr2tA
 9G7kGk/jSG2RMcWlpO9Zv8eHeP+rM8xXIaHWzxjIo4/Znj7uhdvG9Qr8aWoM/b4VQv2dkfMdX3F
 xgSoQXp+0HK0ZVmcfKygIzOqt+fm9zxDIrwFM718Zaz3ZNp68rypKYzIErjBd2LQ8Cek8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

In x86, shadow stack PTE is marked with PAGE_RW=0 and PAGE_DIRTY=1.
If the shadow stack pte entry is consequence with the read-only pte
like PAGE_RW=0 and PAGE_DIRTY=0, folio_pte_batch_flags()
with FPB_RESPECT_WRITE without FPB_RESPECT_DIRTY considers both are
the same.

To address this, save the first pte's writable and compare subsequence
pte's writablity with pte_write() when FPB_RESPECT_WRITE is set
without FPB_RESPECT_DIRTY.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/internal.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 35016b1afc8bf..b4d0df4c35adf 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -418,7 +418,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
 		unsigned int max_nr, fpb_t flags)
 {
-	bool any_writable = false, any_young = false, any_dirty = false;
+	bool any_writable = false, any_young = false, any_dirty = false, writable;
 	pte_t expected_pte, pte = *ptentp;
 	unsigned int nr, cur_nr;
 
@@ -438,6 +438,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 
 	nr = pte_batch_hint(ptep, pte);
 	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
+	writable = !!pte_write(pte);
 	ptep = ptep + nr;
 
 	while (nr < max_nr) {
@@ -446,6 +447,16 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;
 
+		/*
+		 * x86 shadow-stack PTEs encode writability as RW=0, DIRTY=1.
+		 * Without FPB_RESPECT_DIRTY, __pte_batch_clear_ignored()
+		 * considers shadow-stack PTE as the same with subsequent
+		 * ordinary read-only PTEs. Therefore, check whether pte writable.
+		 */
+		if (unlikely((flags & (FPB_RESPECT_WRITE | FPB_RESPECT_DIRTY)) == FPB_RESPECT_WRITE &&
+			     writable != !!pte_write(pte)))
+			break;
+
 		if (flags & FPB_MERGE_WRITE)
 			any_writable |= pte_write(pte);
 		if (flags & FPB_MERGE_YOUNG_DIRTY) {

-- 
2.43.0

