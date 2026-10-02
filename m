Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE5485CC3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935027; cv=none; b=j+66YJofer1A/9ivqkRZFAWGatYfHo2sfpTUf9qgXCYlHZR5NKlgkPd23/LOFLYk0YgYFfux1hKYJlkA3mBvWDGdBIkcp96vr4517vtGfl4zEINgZemO+7rvkqkIWgrLGBTGhQcuxCXJ1uq3XrHzzTC2tTEEMp532Wd3WgnEgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935027; c=relaxed/simple;
	bh=EsV4QmuE2zIVMKtO/SOhRrFUuEtNtiAe7xebMuMrx54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYzCb2Jfep/MZqi38Czwr3cc10LWGCr+/a8mIPNKThsRA5V+w2h9+d9eKaiOOJo0skR4u2QF01BiSUEbGLhTtiwSb/daDLKl9pPXljPMCOjkiZAE5wXpCPCtrWQVa/PIdUKLjSTvvpwIZjmdqb6p/rjM4ybsao9+6YOkWBCXQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NeCRGXST; arc=none smtp.client-ip=91.218.175.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NeCRGXST"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EsV4QmuE2zIVMKtO/SOhRrFUuEtNtiAe7xebMuMrx54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935023; v=1; x=1791539823;
 b=NeCRGXSTGWfHGH9nTdqHnUHOoYToHUcfwajejK8iXk88Y2IhVI1ONvbD8VUmxLyOhGv8LhDZ
 WZz/2rZr+zCQsx6NahvNRERAo6khQdf77pwuvV8U4H/wrAX0gBooXejKZSb5NKfKqgS7vTtE6td
 pggSbfzxY5DEZuhRpW/yvIiM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3b859f7e4ff92309;
	Fri, 02 Oct 2026 09:57:03 +0000
X-Mizu-Trace-ID: 3b859f7e4ff92309
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
Subject: [PATCH v8 18/30] mm/hmm: fault PMD swap entries on demand
Date: Fri,  2 Oct 2026 02:52:32 -0700
Message-ID: <20261002095503.3585565-19-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
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

