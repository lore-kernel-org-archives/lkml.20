Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908052;
	b=pdP3vujKueafQl2ONvTMjeSHvpD6KaBE4mkfJ29p6muAysRPjeWiuTLw4gsdiX/o8qwl
	 r9ZiYyP/PNNmddLmqxezwRkuzQn/T2hZUHR6e5OTRoyCRCwicUprDR8IA8e6+/tJOObwj
	 9ciTYSyvBRl2iZ5CCeregyrk2B6omrNVY1/w+koIqF2lHl0GwySeP7ta68NR2SASQVr9t
	 y13Y43m8ixj4lKeOSIdkgnnVfSSIc+l9m31JyRGxKd5edf/XqshGZu0aqGxsHKyZU7ekl
	 F80xzikvEPLz/ZL8emMxW1Y2H/pAKM8SCzovUiet2m3UFPmqQO27ziOfdsGdH1xjlhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908052;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t8qxZbn32Z12Fq2RQjI4glAnxZTD45cKMGLss9aFThM=;
	b=VoosrYm55ezGCGzqf26kC9OaiwA19DdjhJ0cuO92u0SW+84NxV9h+cNAw9rjsgc2jjG7
	 pVHVAtoqMELu9JuNbAR/rqYvsbmmRC6MIlw2zExVxGexpZUYBroy1258A14XSFSWQANT7
	 j7+7SJdoyFH22eXTnicproXjxvKcTK9PbxvKNEbME84p/BxER1xZzGn9KxfYhS7uDSfNr
	 B7dYLtAxrZFdYKepRIFjEQW6IudakIQx3jBwtxEQ9V94dYVXcLg2VxU0eCkCIzzugk2+V
	 52ZYClScAY10IaJqQJGBAmINn4ssrQPcGcLUxWCUG0n7YUF3aIgLOd46LIjFynKJO7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sB35Xv3E;
	arc=none smtp.remote-ip=91.218.175.169
Received: from mta0.migadu.com (out-169.mta0.migadu.com [91.218.175.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A61606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A61606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sB35Xv3E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bs39wPf+S0CB3Kx/RBYWFTHto3XWIFtM1LpZ+jEOpBw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794908049; v=1; x=1795512849;
 b=sB35Xv3Ex56vU1lX54WsCiJP6eEKywd4dviJU/jbjQ1TBsKupp08fIXohBljSflYSkd9QiCT
 wt+hkpT9PlA+bYTb3R8qlgtNiZa45wYv7fSB5UvKJrF8m9lEQUw+VWqK3fenWcIlfd6LlBy2qEF
 PHWKQhhODEf659dGdDBzxbbU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34837426e6c7ea91;
	Tue, 17 Nov 2026 09:34:09 +0000
X-Mizu-Trace-ID: 34837426e6c7ea91
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev,
	fvdl@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 0/3] mm: hugetlb: fix CMA-related issues
Date: Tue, 17 Nov 2026 17:33:56 +0800
Message-ID: <cover.1794907279.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
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

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

This series fixes three CMA-related issues in HugeTLB reservation,
long-term pinning and allocation:

 - Avoid ineffective CMA reservations on 32-bit x86 kernels running on
   CPUs that advertise 1 GiB page support.
 - Allow long-term pins of explicitly CMA-allocated HugeTLB folios,
   which already own the CMA memory.
 - Preserve the caller's GFP mask when allocating from CMA.

Changes in v5:
 - Move the HugeTLB CMA ownership check into
   cma_folio_is_longterm_pinnable(), keeping folio_is_longterm_pinnable()
   inline in mm.h without a HugeTLB header dependency.
   (suggested by David Hildenbrand)
 - Clarify CMA ownership in the commit message for patch #2
   (pointed by Muchun Song)
 - Rebase onto next-20261116.

Changes in v4:
 - add comment to cma_alloc_frozen_compound().
   (suggested by Oscar Salvador)
 - collect Reviewed-by tag.
 - rebase onto next-20261110.

Changes in v3:
 - Drop the cpuset fix. A more comprehensive fix across the HugeTLB
   allocation paths will follow in a separate patchset.
 - Check for __GFP_COMP instead of adding it in
   cma_alloc_frozen_compound(), and leave __GFP_NOWARN to callers.
   (suggested by Oscar Salvador)
 - Clarify the CMA ownership comment in folio_is_longterm_pinnable().
   (suggested by Muchun Song)
 - Collect Reviewed-by and Acked-by tags.

Changes in v2:
 - Replace the PF_MEMALLOC_PIN allocation restriction with a GUP exception
   for HugeTLB folios marked HPG_cma. (suggested by Muchun Song)
 - Pass the caller's GFP mask through cma_alloc_frozen_compound() instead
   of skipping CMA when direct reclaim is disallowed.
   (suggested by sashiko)
 - Remove unnecessary revalidation of successfully allocated folios after
   cpuset changes. Retry only failed allocations.
   (pointed by Jose A. Perez de Azpillaga)
 - collect Reviewed-by and Acked-by.
 - Rebase onto next-20261104.

Thanks,
Qi


Qi Zheng (3):
  x86: hugetlb: disable default CMA reservations on 32-bit kernel
  mm: gup: allow long-term pins of CMA-allocated HugeTLB folios
  mm: hugetlb: fix GFP mask propagation to CMA

 arch/x86/mm/hugetlbpage.c |  2 +-
 include/linux/cma.h       |  5 ++++-
 include/linux/mm.h        |  9 ++++++---
 mm/cma.c                  | 21 +++++++++++++++++++--
 mm/hugetlb_cma.c          |  4 ++--
 5 files changed, 32 insertions(+), 9 deletions(-)


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.54.0

