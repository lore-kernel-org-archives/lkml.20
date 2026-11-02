Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619036;
	b=P3YRPO8RxV27yxM3hhe1b6sFvGpAUvPOzSfU0//BUI9/Z36zlILTW4LwulvMYNs4l8nc
	 Jo+y6V/tWfUiXcmkic9k0PUamLCt5DyWCeJLXbidWoN0ckwFDU6R4PD0B8TeY8CLkYvZb
	 exlned0kosE159JYWYx9QWZgKMNwNNrm4PUBU4+8DjPX6ZB1slsXFJTq/KfcVnIHdYXNq
	 /vllXtQxE/ATf/awGIcJiobWafqljZZSaws8YP5Lo75+Hn2qOhXbu+62DGrbuUromkEFb
	 nLgRFhc5++ZMOFCPT4AjT78VvCb5k4fALKCieTt7gm9ltkSDB5hNUS6go57Xz/ug7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619036;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CRcAAdDtxfvhiN3FxCxHzMeH/u99dXfU5Bg9p97f0JM=;
	b=K7DstbixH2eFgcZF850IAX05FLlVtwoH5UwdFg3zHExbxh3nNqJegaCRKx8ZnsILS2Tk
	 cI/SxDE36/Mrz3lnzOAVmkLoyqUBVoCnHJtyW8tAUCqvSOcn9TuVRtPnURrAtcTT9Bu50
	 luC5kmVVL7OwdOGW9Cw7hv1C6txEzegk7jtAcUXj+ZoO/t5dKaaAhPA0hyP6PI4APYfRv
	 5OPGQItvnh4xNUluj+vikG2fOd3VSBQEYTPLbEAYlbUi+CD56N0/HFNHh21W1xeALxkna
	 O+kPIeuxC2TZ9NusVtOfikKGG0CniN5/DbBhUSQssQO9WdSkvLpwTaAxBdQbYD3rjfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DYBNTCju;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C7B60A380E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C7B60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DYBNTCju
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16FE2972;
	Mon,  2 Nov 2026 03:30:31 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4843F632;
	Mon,  2 Nov 2026 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793619035; bh=Sw+xggMs2qE0Q6AJwqQnNIkUKXTOb9DvrrWvEhrdg/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DYBNTCju9KLhx1Uf/2ZV5xUHD+k1ZPTzfbxwIwkW7VQtiqAg06kct9byIWCXPX/zP
	 irVmO02l4jmV/UCHRnBdVzSRopuPLkBalvbB/8o5DoItmdypE6a5XCoTr6heaMOV0p
	 f/0Vevi3K3Yzx+BRu6qLUEeEdW+AADSsfNrseamg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:30:18 +0000
Subject: [PATCH v2 3/4] mm: internal: introduce FPB_LOCKLESS for
 folio_pte_batch_flags()
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
Message-Id: <20261102-refactor_gup_fast-v2-3-bc1ac018c834@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=tCihATTsHWbMkStcGZ7Q1Wj7uPA2CiSswJU8uh6IE6Y=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HRRGiU+bxM1kUrCOK4b+2Rhrv/oW+j2tstlw
 vHVl1HQtb6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauh0UQAKCRBt1cPRWsUx
 M+bwC/4rm0ElvL6bKsVkVUMYXx6f3uAp09TvKf+K6oGFbEltPNTtW0dg2vxE127w9A5FfcIlEig
 PJpr0EiOPCu3JetCvvRkN9oq4lzLCEstecmu1Xrl9pFEPrhSdAWROkSDqPfUPv3Pm/0SDnaLPX6
 YbU9U1E7JZFP58ZbhNydGH9HFdlPP85+qPsU2+L4ioqAQ4y+abD+iDw1HUYVyK29HVk5V3RIPDv
 X1fK+VT7/CGbo1nSYiD0yt5gZiHzNa8YVGmHvjjtIM4UhtfJ0MvE8fpXi9kWCiV2YSeqfb1NDVH
 s0epsr7lA6B3XKNyVuVyRMWs34VBawfnGKSCWD/Un86RBINVkm7T7piCrSSqARElA6g793woOov
 rMZsgJq8VbV1wSu7wuCLdva0SL5VTvM9qULnblVSviCJcoL9YUotebsu0E87xa7OhK25rb0GJFX
 mEnwT+uxVS36J3EXTUBnmfkq7ChpBsnIVHFweSr2mYi15I69X61aYnfTyztbnlCCIrmvw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: Yuan-Hao Hsu <aa9736195201@gmail.com>

Add support for calling folio_pte_batch_flags() in GUP-fast context when we are
not holding the PT lock. Instead of reading PTEs through ptep_get(), we have to
use ptep_get_lockless().

Specify the new behavior through a new flag FPB_LOCKLESS. We'll make use of this
functionality for batching PTEs in gup_fast_pte_range() next.

Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/internal.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index b4d0df4c35adf..c1824b0193f4d 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -373,6 +373,12 @@ typedef int __bitwise fpb_t;
  */
 #define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
 
+/*
+ * Read the page table entries with ptep_get_lockless(): the caller does not
+ * hold the page table lock (e.g, GUP-fast).
+ */
+#define FPB_LOCKLESS			((__force fpb_t)BIT(5))
+
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
 	if (!(flags & FPB_RESPECT_DIRTY))
@@ -442,7 +448,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 	ptep = ptep + nr;
 
 	while (nr < max_nr) {
-		pte = ptep_get(ptep);
+		pte = (flags & FPB_LOCKLESS) ? ptep_get_lockless(ptep) : ptep_get(ptep);
 
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;

-- 
2.43.0

