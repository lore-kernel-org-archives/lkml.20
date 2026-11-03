Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692895;
	b=EFr69Vl0TuxHHSpYa1WDDIkw+6w69f+fyjvvj4vdTB5bDFfpQFr+E7eM68t1NyJsmQyh
	 2MPOD0L4to1mgoxM5+LX435Ra2Rb73klPsynFs+RcSEfJjMEXGF99pYOWq/ykxD6Z8YqG
	 PZscw8i1QLKCkzli6MyuXoN6UdqOsR4QrgWeelmlyjzj8j9gaS2mPyFguEYJYVG7LFxTz
	 D04+iR/ASzsdPSVJdzx3w7vGxo6iZkqBfzSDU2WeIQ1uAc4nO6/Cqev3/CE6gLNbk9d+W
	 bVXQvWZ4jDmiGnRyEan/KR8UXb6lWpvItAqcmiQGlMZG1icDoGMzF05vf8+fwQTO42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692895;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4EgA5xkJyAmBnEfHDvfxKLGqQoQIa9SsFw2zzB/YR1U=;
	b=q9nnm4LRAiqcag2yXL1Ggl8dAk80S+nBIWtWbayNg+t57uypJiTmn5GQZwprzMdIBIhc
	 ojjOAJ+NIPNYv0qmV1Vjabjr1Nt5as+he9naXgCpzTLzS/s/8wrNx9+iiSldvwigbEI3b
	 +n54WBGPnsNDzra+YzuWt58SVK/PCZpMa/ZOT5kisZoRvw0ROEd4FcfYvO3MjVF2xFDIa
	 axJr9ZXKEQXxcPaLdGav76oGT4ujrqhNnQC+A4LzIxNQHc6taSPt/GShTwWzGjpgp/neu
	 vOKKjdeU0Byw9jIqH+K7zrXF2q5SKX1lQqrHjZAZQ5NSWw5ljqZv2eGHwVrud5tCudQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jQ1mEG8I;
	arc=none smtp.remote-ip=95.215.58.64
Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0B606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E0B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jQ1mEG8I
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C2H3ojY+P3grZeC40yIYdvddeGt1gzpz1d1fTn5CZ9Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793692892; v=1; x=1794297692;
 b=jQ1mEG8IJtNHSeOiU3fvwCnyj7oLCu4Oiiq8NLzYDXxiQhsXGxpdHLUpAWXMJePF0rge4FeF
 4SPy+iUqqH8AyGrA7aLv9mIjpz2XbZ4h5Kpx3SJblVQWlQTA0WKDWe4tSZWq/XE58izSXAUDMQN
 ZP/E4/peV+8cBNyj4k49vOl8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6f696fc8136050f;
	Tue, 03 Nov 2026 08:01:32 +0000
X-Mizu-Trace-ID: c6f696fc8136050f
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] mm: hugetlb: skip CMA when direct reclaim is disallowed
Date: Tue,  3 Nov 2026 16:01:06 +0800
Message-ID: <325d33655f29a2799a0859c788c48625feeb85f1.1793692578.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793692578.git.zhengqi.arch@bytedance.com>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
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

Switching HugeTLB CMA allocation from cma_alloc_folio() to
cma_alloc_frozen_compound() stopped forwarding the caller's GFP mask.
The new helper uses GFP_KERNEL, re-enabling direct reclaim even when
the caller explicitly disabled it.

The first MPOL_PREFERRED_MANY allocation attempt clears
__GFP_DIRECT_RECLAIM to try the preferred nodes before falling back to
other nodes. For gigantic surplus pages, the CMA path can therefore
enter direct reclaim while allocating migration targets during this
attempt.

Skip HugeTLB CMA allocation when direct reclaim is disallowed.

Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/hugetlb_cma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index dde1c866406fb..90f8d718a1f16 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -59,7 +59,7 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
 	const nodemask_t *nmask;
 	unsigned int cpuset_mems_cookie;
 
-	if (!hugetlb_cma_size)
+	if (!hugetlb_cma_size || !gfpflags_allow_blocking(gfp_mask))
 		return NULL;
 
 	if (current->flags & PF_MEMALLOC_PIN)
-- 
2.54.0

