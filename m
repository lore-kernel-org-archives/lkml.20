Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F745C6EB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389117; cv=none; b=FCEb+fx+B8Kw7nomJLWUKyWKS/UOD8rrnn8RkIH+lPd2OS1n36SyQrSb9w8u03POWwFpm/F6sc3yPiIlqipxK63wO39x1cwn240o5P+TR2RHF0xlIGKuU6n8lt2RYPNB2TAET+XLfK1dZ0fxGz+eVVsVb8gkeQHrlBxdsYK6hLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389117; c=relaxed/simple;
	bh=EsV4QmuE2zIVMKtO/SOhRrFUuEtNtiAe7xebMuMrx54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHSo46rS5xaa7ePLaSj2itFDhFLq0uBv5+04eSdQhEWfWuxuiGwNJzjSVUglReGdr3ygCQ8aw5CyAlJ1fILHWfUtciWJrLZYPXI/CMrathILOIFUuNUHdXXzAI8aMgrPsaU4OVtcta8KqXTIyNZwywuULsOfMiJVf3fdogWx4Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QhQaOh26; arc=none smtp.client-ip=91.218.175.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QhQaOh26"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EsV4QmuE2zIVMKtO/SOhRrFUuEtNtiAe7xebMuMrx54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389103; v=1; x=1789993903;
 b=QhQaOh261LjKiwmhFo7BQr8VctZnuLzKLjEp6oDQVw5IplJ2Rkxh5gSunTOiHUYOG9iFB3OG
 gTKYbLaytZVkuyK2vP/g+Qh8FeBe4vvd5e4BtbIy9znwvjHVlUTMZGmok+tEFf3gfXu5bqAa+xp
 rKIA/i3g7E/Azb2/oRks0voA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e796bb344a1921fe;
	Mon, 14 Sep 2026 12:31:43 +0000
X-Mizu-Trace-ID: e796bb344a1921fe
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [RESEND v7 17/29] mm/hmm: fault PMD swap entries on demand
Date: Mon, 14 Sep 2026 05:28:07 -0700
Message-ID: <20260914122950.3283997-18-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_vma_handle_absent_pmd() reports anything non-present that is not
device-private as HMM_PFN_ERROR, so a swapped-out THP would look like a
permanent failure rather than memory that needs paging in.

Treat it like a PTE swap entry: record the fault when one was asked for,
and otherwise report the range as non-resident with no flags, which is what
hmm_vma_handle_pte() already does in snapshot mode.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/hmm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b6440..95575ac378888 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -377,12 +377,21 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	required_fault = hmm_range_need_fault(hmm_vma_walk, hmm_pfns,
 					      npages, 0);
 	if (required_fault) {
-		if (softleaf_is_device_private(entry))
+		if (softleaf_is_device_private(entry) ||
+		    softleaf_is_swap(entry))
 			return hmm_record_fault(addr, end, required_fault, walk);
 		else
 			return -EFAULT;
 	}
 
+	/*
+	 * A swapped-out THP is not resident. Report it as not-valid,
+	 * matching what hmm_vma_handle_pte() does for a PTE swap entry when
+	 * no fault was requested.
+	 */
+	if (softleaf_is_swap(entry))
+		return hmm_pfns_fill(start, end, range, 0);
+
 	return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 }
 #else
-- 
2.53.0-Meta

