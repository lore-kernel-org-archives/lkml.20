Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351202;
	b=Ye30nDhp+/Z8awSRcyhPk+GCiW58JkJO+IDNmaTb55H3DDoqIuSgxwMM79726VxudFsb
	 4o+LXth4Zgd7SOxql4kRzvZV/RpjmrY9E66bh5C74lX+photz+5pHbewF0Bf1zCraLOdp
	 CjQO7lTTkeFNFVDmVWccoN+19Bb+EeXzWu69rXDbGaVwqsrRnQEhnsP9qz3fqlOwS9nZp
	 FZYIz5QZ9ixSRm+H0FayuNIo5VY7ERoIn6DG/Lj2cEH7Mw6nrLx5NR9w+yymptnjhEvve
	 OySszeneXgUzPdZ0Ps2/WsO5X17jRNVkV8+AROVNcUOHg0a2cTRYFAIztcb7pgTlK+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351202;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0C2DD06ZpJFsBj67YJIe5UhHxy+r2YjxI9LOvAA6gJQ=;
	b=2b5SKmsfLDdJNjZBEJm3qzJ/xSWD9LpsqtqSynodce80qXLu6C4r+79EyDqUVgWVziAE
	 8OKUJVe+3nIu3qoWsP3PEe4Hsvic4LH/3vy1Wh86k80sjq/Z1c590poXksHEfcTlxY8Vw
	 SloOzNR+HocamxDo47/T4XdBP2QhPoV0oYw39moHGZl5jPttRmEgNy4wG9KAXCohA9Qzn
	 PBnoFgNBhWH0g+DtnixDsBGjimnuorWzlP+M08DzHP3EJ157iGXDd/T/LmHTiDcWctQQT
	 5OBrYimeYcQ45T0qQAVQzotnOQhRao7PfWaFQsyLsd++BVWq/6AZ1t0GgnEtps0F3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MtLvMquM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45532606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45532606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MtLvMquM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEE8214BF;
	Tue, 10 Nov 2026 14:53:18 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85BCA3F85F;
	Tue, 10 Nov 2026 14:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794351201; bh=IFhzlmMquIq1N18ID4KD3W9Cu1r+G3VuajGzqS5UxsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MtLvMquMcr7AUXFnhgCZGt2eYwtoB5svdMA9NKu7OKLjP190sS8T2XtQmqWXIvJNN
	 Tit0mB3sGQxIlwnad7QCkPl2lB3rIU+CkIxc86MNR99E+CCYGyG7fdvvBKMOGECCok
	 ygr84caJp0zl7ga3MhpJI9i7mJjF2z6FCP/w0cZo=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 10 Nov 2026 22:52:54 +0000
Subject: [PATCH v4 4/6] mm: internal: introduce FPB_LOCKLESS for
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
Message-Id: <20261110-refactor_gup_fast-v4-4-e779a7674274@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=xlFPK5nnShWHyMY/R8RgNByBT6gFkvHcTqIKxdcKHYQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq86BTp3/1Yq05WThhHp1ty6CF4o3VIEq7BFTvQ
 oUu9YOkJrSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavOgUwAKCRBt1cPRWsUx
 M4prDADCcPt6v9zFj+xKiTIAlyUBrnRD5fVnpn6OG0TfZMpPFQZGj9Y8oDrZstoTrrHtQEy3M/C
 2WQ1AT5Gfvb+Z6Okma/9OzVY99HcJnrC5EEUno8XLCxppSsDu6h1OC8WoyWh7+ew1W/VCYTFMWT
 J/J2qLy7CYBO3Ga5HyTvuUhSNQ5vSQ7s19ph71G06C6EAAh/1yQ0+uB53w/5lX3D6bVHbjOTlqB
 NvHhrZc5c3wK+IXUWvS3254jsvRsuReu02BxEJTik8bankNAwjm+xO7eT5cq1EtTFGXhUKmmhGZ
 PmK485MTnch+yohW4ITZro6Fq41Jjc4tc6LSXmRdhUvyMRmT+qrEGtLOQVEI1P5k5G2T6kGIDxK
 QY/lSyPiJlmStFv7z//OQ167VCANhEk97W6JQm3rKrqtdfg9YeOvAjNoQ8BZrAy1y05MfQrldEm
 yY+vF3+YjnFEsEMmQQvHu82QxD0XRDj6Ox8x2j4mJZejDU3anjBzaNERGsD5P6oh7adv0=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: Yuan-Hao Hsu <aa9736195201@gmail.com>

Add support for calling folio_pte_batch_flags() in GUP-fast context when we are
not holding the PT lock. Instead of reading PTEs through ptep_get(), we have to
use ptep_get_lockless().

Specify the new behavior through a new flag FPB_LOCKLESS. We'll make use of this
functionality for batching PTEs in gup_fast_pte_range() next.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Rik van Riel <riel@surriel.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Co-developed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
---
 mm/internal.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/internal.h b/mm/internal.h
index 177bd47045d1..4db3381238d0 100644
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
@@ -441,7 +447,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 	ptep = ptep + nr;
 
 	while (nr < max_nr) {
-		pte = ptep_get(ptep);
+		pte = (flags & FPB_LOCKLESS) ? ptep_get_lockless(ptep) : ptep_get(ptep);
 
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;

-- 
2.43.0

