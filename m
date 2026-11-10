Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351197;
	b=CHeLwBKRUE8kviGCwpAOY9YvLNGQO1mgtZQwdfqLGa6j++RdEekuOyrQkwKnGtUDR/1n
	 wmW5sv1ussaIvmwRCKONEE7g/DntFVbi3nUgUBMQuQrRKzvQCD1cT5nxOqHoTqpDF//2t
	 pgovX+e58AUFBcU7teacQJjCMyLBdXP0PNZJRUyt0keB/nwyjr2aOgl4MbG+7NrEk7p/o
	 iD1L+LdWTTDCPfv2EyOIFesACwi0b78yWa6plg7zpfcwEwHT+//K1+6Dj3cV3n1lLmLC8
	 wzWhR46cr5bp6TAe8c8UbnAI9jN+BpPdyRXSvc9Xvm5Se6gx401R48IRKE+knyb5Sqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351197;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5YKuoqwoAaPxLHaoVZKbkD8zKUqjOEfcUIp+jI3fn2M=;
	b=0ZpGUkAkxGStoQt34BvySwtiET6eej8UW4L+uZ9Ij/IhW02eqyNMLvlVKIuovJyDyuP9
	 CMDOsheBlNJKP2Vi0o1bty0jik6E6onHjrmQncAjWOVE/i6WEilym5rvPv/3I/SP+E2Fn
	 Izc04BThBGls8sNnw1kM/MIOMlJjrxf6jlEUr0AoTKIsiLUSd95QRAUUinYH3pl4MVhq0
	 T46S7WWJ7xYmUeLe0AtuGjFHvpZgxMRWdNQREhpUrD9zVJ1vvxpEO5VBM0orpCCxuRTXR
	 w1mAZFWy3Uup3S6HMCc+0s28uxXC1QlZ28jxMObCDfdZrxGtDE5qmgZhzC/Vx+si6Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qC2lCYTq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ADF606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51ADF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qC2lCYTq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADF1A1BF3;
	Tue, 10 Nov 2026 14:53:13 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B6F3F85F;
	Tue, 10 Nov 2026 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794351196; bh=nxj+Mt125iEK/vat1Tr1w2hJbRHU1d6dQuW9cP6e4wA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qC2lCYTq/rJbEzdyRKkRwJUQURHuUI0KlvkUZdajSZbzywIaWhtpF+g5BCsYk2eFb
	 AFDB3nbHuiYRZAn+DKiNzOiuX6+BPdZ8RmE3J+GGgIiucODHG+M2149Cabue1EGTY2
	 POm8af7wiilC0sVaK7A6WKcVoRboDyWwUr/jpKf0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 10 Nov 2026 22:52:52 +0000
Subject: [PATCH v4 2/6] mm: gup: clarify a reason to check pte/pmd in
 gup_fast_pte_range()
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
Message-Id: <20261110-refactor_gup_fast-v4-2-e779a7674274@arm.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
In-Reply-To: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=nxj+Mt125iEK/vat1Tr1w2hJbRHU1d6dQuW9cP6e4wA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq86BSIKAa1p/fqPhJCtV8HDJc97wAZexHXTSDa
 ya0BysbIUyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavOgUgAKCRBt1cPRWsUx
 M/36DAChg5tSjgS+3k4FJIkhNk03nDYc2oUXdJQXLCd2BfzEKniH8Lt/cav31TzxeLzfpsOgcSq
 JcwkZgByE0k9LaglVNcLyoL56Beh3BViFyEsk02PuDujhfgMBhrk4ACv67PI1GCuBsm2t+HrnwU
 VBcUaTxS2Saja4LvnIGc0NdoFMPvvTKoU43hep9lhZ3eH+OMmZJ89SYorrVZqUJCI7KxqgWU5F8
 WT/YJC0SFI3AGlmImrXMry32gLRC1tUcVCcbxNo+OEGkEhDHSofoHwpFDMK5JBGPPCby5UbX/lA
 bDwE+UowWlp2KtT/aEThlNkUwgdYkNEG4dbwQemG4grs9d9oU/yw/888zKQLojwJr7l10EA40LC
 iLmwvcUnvhojC3NfldoIr9jVcNeT/+pjE/TL5L6moxWewlHpYu7eOHCbJx2ovAyaTawbgNd8AbR
 wsQIBCBHyxeYHCOrRGpzLXU4XVLVfac/xgUu+vL3v7ww0b57H5XrRN9zn0UJk2xkdD0jU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Clarify a reason to check pte/pmd in gup_fast_pte_range().

Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 2b405cce2ca5..00dac03093a4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2885,6 +2885,14 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		if (!folio)
 			goto pte_unmap;
 
+		/*
+		 * Recheck the PTE after grabbing the folio to detect concurrent
+		 * unmapping or protection changes such as by KSM.
+		 *
+		 * Also, recheck the PMD: THP collapse can detach the PTE table
+		 * while its entries remain unchanged. Checking the PTE alone
+		 * would not detect that we are walking a detached page table.
+		 */
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
 		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
 			gup_put_folio(folio, 1, flags);

-- 
2.43.0

