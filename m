Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901989;
	b=L8+X/9CjsCqSCEkhvjxd8UbKwjs1xMQZk7NjMJX6faFJn1+Fj0DdS/rXV0tUqbe0ZacZ
	 JT0Zyo0InGboJ5UL5gOPc1HimF92DTb/CBZGOvo7KpPZs5bksNHNNie19FkhHux4dIKAh
	 w4Ruvhb/yR1O0IkScAKHQN/WSXfZq+RiqO+ugBDqxxotryJntR3lS1mPKgwQ69eXPG4Fl
	 gSUrszeYZLU1+qrKaoB7SWBT9DTV6VKpa5bSTOZfeIrw+Vgki/e7rlD2kzorGgvYvN1c9
	 3jleBKzM+YfNGqV/swNuyOY8BHpSZ/qoFkh2WgXZ4Epe/Uf1BbxCqSuUyY3EMexPGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bIaB3xViS8vRwH7p7m0nqayQxCVJVBaNFTxNi69Cb5s=;
	b=BQbfehtgEyf4RgZfipEUg1wQZImk9nGYl5dOtm+KVARiPDbEpZ/cxjPZCF8mYQLgala4
	 yyZpcxEOLThp91hR2omogm3229z0Ys/TNkpuI57yDamNweGMexrQfKY2/HiEhQNT59PmR
	 OyJZNmlWBQa/TLo0r3yGnML6zlkQAJkCrMlo7AGHq9XJbEHiCdxhwQqCCqvEzKgKbCi5V
	 aq7riJmZyU0scNrWNmuE21fGWy00pRScbG2jocWRrSGlXM8qYWNzalXIhTcXEQjmUhusW
	 YLz4xFLRFJP0CK21CKc2i1c/keKmpU+LhLhKydS6I0yDYLr+Hi9znXPGNsM1JZyJBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE1wQF+f;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58533606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58533606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE1wQF+f
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5189597a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901989; x=1795506789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIaB3xViS8vRwH7p7m0nqayQxCVJVBaNFTxNi69Cb5s=;
        b=pE1wQF+f0cxdZaR+U+ZOkQyj3e4yuQVMr1T5T6YWyv9LVF6myLSDjq/7ZAotA8+OTa
         ED0jpGyxM1pkNhqNZeQPfRoPfywRymYhMEmW40BAjbcP6hqICKAvZQizypmkTgmG36Xb
         ifhmARwDauooTrtB3NZ9og9Kvy0xWMND8+h7mIVhPQterIo2P5MDCYmD76RwAZMbtAFZ
         HJGgVHnH0+7C+1LpkG3mIoHdQbXHXqQUydQoeUuh2jLuYEtEfiTm7oKlLB2vivcBTYN1
         633SujJnFAAYJ9VfZSt56fJWtUvKLtlnVLb7vbTMaoMqmioG0z/RzZD3QK1LH/ZvagT0
         EhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901989; x=1795506789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIaB3xViS8vRwH7p7m0nqayQxCVJVBaNFTxNi69Cb5s=;
        b=N8rPH7RWqI1DvonkmL47NVw8/Om+z2gt3QbyHDmYlknbmC+3/15NQjbmCIBGdYhpU0
         omof9U0+jAfKm6kXnLYCEtW4HFUYDLBpKK/82/vUJArUFdV4ni0loMOaVE5haYxaBrAA
         K1ZygIkFoyjMdM5U4yb0FW9ZLMaoTOGoMFaFPrnLRswUkMASJMyxzhpaJLEdKcjNIkoL
         AfalNpBF1mDuSSw3W/jdACG6NKR4x4d57O18xaCG/hQEmQA0ABbIXdPqK+rF883nT00Y
         KKbWIJDvaNghhNqa2ENkm+l/jglBvzxP2PJIqnxCE9SLWRy7DjC22+sTRQgmLxeKI+j8
         AR+w==
X-Forwarded-Encrypted: i=1; AL+hErFYORkswKOpiHwcCTMJWOwPif/+OrDdMMgDHxCu9gX3MitFVh26scKMQOXmUUijsD7dmyAQ9SiZMAr7EZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dXJmMLIial2aqJNoFvt6x1s2uylWX5O5GvVSp4uT/g08yo5Yn
	DKvhkERCdh7s/IyBzXH0//CWp2KD8UKkNWNiEkCQ8Rtq9SJ9pf1j8IaT
X-Gm-Gg: AZFdTZdjYgU6ppTHZNcM2OSSsiNNyQ+4FtsI3x5LW0FV/ErLlxfXIgv/GTPMqo2ydRt
	CgDH36RM4mtTux0p1/mMoqc94OHQvGnkWWPgjwFtJ9ZWCQY0p1b5M3Q9/EPTdnnxP6/KPctlKtR
	lXQIe1YErVRCtCA8iTHVAXmEH5ISvp1ebx+gtyb1+7rTzSaVRxaLEpZIafOVcGon+24ARPOBMzI
	QCczj2GkGaq3sNcYw0kwBuLdemG++TBGTXYUeOlSWNe9cP9rmw3xFvDBPCzRYtNdKc3gwx483Er
	BZzU1o5aa32juKDsFPKv2AALDYk8sYF2o9dufx1pBWRari3KdfQ1Dzc4s/IlVRUCprZRzaXswgB
	9KX4+xRj2f/ZQSZ6MbO8qe08kGWFs/3J4dEwIFGG1gVCXbbiPz6Vo2ZkgRIVCpApOjsjA2HIldb
	/gAk/z2EJi34zKA2vR0Puo59wy8XiLP+gKH24LogtQXlCLgTCEh4gX6ePeotVphcu5XLPy3+D2Y
	th4L31ptMSu3szfWTSD2FCNflBdjKvqPa0kJAXVdmAUlhTlyJiBzVoM4nFLlA4DpBwyYmXiSMOe
	6enjJemovkEnoKv8ZjXkAWuskgbxWoORn3NTp782sizieMJVFaZqm6gv7iYzxr7xFZ6F7ukYeCO
	7bgF84Fvq1MoUoRbiHy2FFY4EF7IB8034NrBLdvEttWcZCs0r8YYstYmE2V9c8orIplWADXln6y
	PP7js2Yt8lF5jBSflaMsvEYAoL1VF4DJraNR+H1azFQwrlZR556xSV46Ajg2G/QmRgPMyJN1L6Y
	d1CQO9jf4qPsVi9aPL/ZnB0oweUinWYkGwnNefokRMIIqROGY40/AUQAB+GH7sF
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13468030a91.63.1794901988543;
        Mon, 16 Nov 2026 23:53:08 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm2791862a91.11.2026.11.16.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:08 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mm/khugepaged: mark a collapsed mTHP dirty
Date: Tue, 17 Nov 2026 18:22:46 +1030
Message-Id: <20261117075246.61336-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When khugepaged collapses an anonymous range into a folio below PMD
size, collapse_huge_page() copies the pages in, but
map_anon_folio_pte_nopf() marks the PTEs dirty only when the VMA has
VM_WRITE and nothing marks the folio itself dirty. After
mprotect(PROT_READ) the folio therefore holds the only copy of the data
while looking clean, so MADV_FREE in one mapping marks it lazyfree,
reclaim frees it, and another process that maps it reads zeroes. Mark
the folio dirty before mapping it.

Found by static analysis with an AI coding assistant and reproduced with
a test program on an unmodified kernel.

Fixes: e22f2fe72c74 ("mm/khugepaged: generalize collapse_huge_page for mTHP collapse")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Claude (claude-mythos-5-2) found the bug and wrote the fix, this
description and the test program, which is available on request.

Tested on b3dfbde62cf1 with KASAN and lockdep: as uid 65534, write
64 KiB, mprotect(PROT_READ), wait for khugepaged, fork, MADV_FREE in
the parent. Unpatched the child reads 65536 wrong bytes; patched it is
intact.

 mm/khugepaged.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4bbe319..8a81cab 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1422,6 +1422,11 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm,
 		if (pte_ptl != pmd_ptl)
 			spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);
 		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
+		/*
+		 * The PTEs are clean in a read-only VMA, but the folio holds
+		 * copied data: mark it dirty so reclaim cannot drop it.
+		 */
+		folio_set_dirty(folio);
 		map_anon_folio_pte_nopf(folio, pte, vma, start_addr,
 					  /*uffd_wp=*/ false);
 		if (pte_ptl != pmd_ptl)
