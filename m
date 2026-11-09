Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227560;
	b=47UPUp3o6I1R9khMbcqzmGJJj3/1TpJzBzQg73dOGCy7HrQHoH7Zp0mPB/NwfjVXKfWP
	 l61YsdUNnhrRMOKCuArzoXuN3ZopvHN48epIIH7p02M9nCs/8jQIKzCzQ5608NbEVfz1K
	 gADbFPS2xA/ADPlTR6PBEB3/OYxnSIZCbPmK84h3TuJ1TfpGMdEHuVT0f7jPVew/FNPU8
	 X69yoOQDj2oO3F3KsjVIbHr9uvZLvKybmf1dL6EVSrXt03n7wvlz/KkT5Gz6BZ+i3EroU
	 uD6i6nokkmxaSqYOnuCGXtTeGdoImf1hPyNfRcMCTWzW+dNYr/++6Yqwoldsroo71Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227560;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vmOohr0y2TE4TjPI/p+yd2G4mqQXEGFY5JLNeNktYvw=;
	b=fo9q6pA5XZrNhPJMhApi5RQwBKfU/zZSB/uJThpS3w4m+LIrVN55DymzfbcRHRuvws0J
	 pecH1MUzgFIDvEQfikjP40TE06WoMgVXk+WSW7GRVH7nFg6ks6HDuI5MnVpC6siRnQeDw
	 lp4UIZfRvxIyrQbXBvn3A8G/I0mq7uywteyfIdHX9JOEG7zT67IZk4BPd2kQT58EzYEMj
	 jilFcIUwn1MCgFitb3V/+kYvlnpnM3yIYVa7W4+exZpA8jeJMG8GRrVupkF9XQ3o3b91x
	 OIBCRnPAWhuhiQC25pyte9pTp+V261Mp+JoIlJJMPkaOgvtVHWt3To0lP2Gwql3xguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SYAFCRmR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159C9606D81A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 159C9606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SYAFCRmR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B23B1758;
	Mon,  9 Nov 2026 04:32:35 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781543F632;
	Mon,  9 Nov 2026 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227558; bh=kDQ/Cw8E4K7AyiySq43gJAAEkO7wMAGzc4Mi72irbQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SYAFCRmRZF5av8uUEMW1VHc8giB65KCiDRWB5ILYfuIy2ICAtkg2hoGijXazVkSD/
	 0Dc1ll3Hnjcu1N/vrb2bh7egicr/wbGHESqmL9eXQ2T1cn4VpsSWo820SSeIdOw+vs
	 6xpFVIvhJvDoCAOpXq4epLsJ2s/CNjmtCBhsVRCQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 09 Nov 2026 12:32:26 +0000
Subject: [PATCH v3 2/6] mm: gup: clarify a reason to check pte/pmd in
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
Message-Id: <20261109-refactor_gup_fast-v3-2-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
In-Reply-To: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=kDQ/Cw8E4K7AyiySq43gJAAEkO7wMAGzc4Mi72irbQg=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq8b1drpWHASPRHYNJhjTpYT6414cQr+xJVq4uI
 5/OzAJYSKCJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavG9XQAKCRBt1cPRWsUx
 My6NC/4j+nQd/JxG2RfLWlUTYv7VYPCiN2mrXzJocDJRsKJMzD5BIUlz59oDWHU7PjBP78w+pu5
 O3nkLGAW3+zpjXTDZpYoAbqCrqJzxppQ0hrf2aQG94xy3ssee4/dNgf6G08BZAlSsR6/ojqg+1w
 TuVwjl6L719P1qemy84J+45X2ee2cPUYt/ok5WRn9t/XvLYTshm2se9xh3DEaRGMtwgBR3XDscx
 ORY2qI0F6NIe7p9kz9+/B9iuKUWl65NE+Z+ekNu5tntJwAzHAkcNpMG0PssXp/a+gJSxqLWQO8t
 HsdrTn6JgMlv2KpMygKxvCd0Z/4Tfd6yMtuInIQcny1E+YwmeX71kyQgSb+iJ2A3zomE56N6err
 7Dl35rVwofyUfN0lCalqDeBE2eCfXH0BfunbGCYtTBhyNrGkRBUlgGgXX6FOlPg0rW/GO1wqOCE
 M8LiXDff8G6bUS53SAsfPbi4t/Rkk7107qpgy44pZn+7V7jjj3i03X9FwUbW18GQwIf8o=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Clarify a reason to check pte/pmd in gup_fast_pte_range().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 7d43ce717b246..7f9348c633d58 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2881,6 +2881,14 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		if (!folio)
 			goto pte_unmap;
 
+		/*
+		 * Recheck the PTE after grabbing the folio to detect concurrent
+		 * unmapping or protection changes such as by KSM.
+		 *
+		 * Also, recheck the PMD: THP collpase can detach the PTE table
+		 * while its entries remain unchaged. Checking the PTE alone
+		 * would not dtect that we are walking a detached page table.
+		 */
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
 		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
 			gup_put_folio(folio, 1, flags);

-- 
2.43.0

