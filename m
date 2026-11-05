Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904107;
	b=LH7Z2c1jy3/Dt3cXRTkhXU9TyxKfe95+eX3vv2ZeEGRBcOnNLyqB9wVUXN3QsD3jmXov
	 YS3pWDemetWDmKWxhN1Oiidng2oLTESX9EL8V4o54pU594t1f6yRYSykCXWMABWiVpIaj
	 KL/wK8YxnD1WTRpuDd045TU0CWKbA480veoh9zE9xnu8WKeKS1ee55PhhLXBF2LK3YYxH
	 ln1+61eqBrADYcsF6FQ7O+g85XmbRgc0z3503gZjkgsERadD1cKHFA3yvAE2rV8o6/WnY
	 AXyQrXgvIvst5XxPWW5J4GMPLMp7xZYSMjuAaIWSK85jOk2j4DjRcILL0pPblZ9TC6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904107;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=huH6oSd7gTMk6bCw3wFvetQjWaUFvstahrkAvJSP3YA=;
	b=3UkrMOePacIysdzbvnkUeT0XqTz6v5SXKRYX15xzDvpzma0ak3ExMOsVMs5mrLG+RhAC
	 Tg12Ti/K10aYiil0QGUUdO97j+ltkIm4RgwijH9nLyntapl5ALOzH5rDlq5c/GLWaznkA
	 zeQw8Ahqy1AqdDqn/3zP42QFkIP7jchFrOIAusay+DIsn2bIzvFQi9R0kZiKtc/X9cRTV
	 7Ge0+VciTkRFnEil2qbKxB2fvF36ztFwevlDqRdVTOMvNDVu5l49IDcgJsUsbtIQLGvpk
	 Y7wWE/a0Dy1Q/EWa2X58geFLbtsPg/Kl9dKIXxbJWJlsuSG3Nb4N8OVohs4yM41Z1aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6ZeZZhV;
	arc=none smtp.remote-ip=91.218.175.240
Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5021606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5021606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a6ZeZZhV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EsV4QmuE2zIVMKtO/SOhRrFUuEtNtiAe7xebMuMrx54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904105; v=1; x=1794508905;
 b=a6ZeZZhVfnUw9BiLrUPYYFOKY3jVjvTRzEN3Fqt6wF941H0xFzC+LdWAO/Ehg/OxS/YZ0icl
 qGoNV28JUtPd4ygE5jZcq0rs0UwvPXWbGhQ9wHEk1cWibC7RYBi0O3i7PxHWyP9BtpGZhjJwOpe
 Fqn1TVtlUrTQhGYBF+ziXBjs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7b89403d16ddfb12;
	Thu, 05 Nov 2026 18:41:44 +0000
X-Mizu-Trace-ID: 7b89403d16ddfb12
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 20/32] mm/hmm: fault PMD swap entries on demand
Date: Thu,  5 Nov 2026 10:39:04 -0800
Message-ID: <20261105183940.2236717-21-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

