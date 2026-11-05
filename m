Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904094;
	b=NCBxY4fk5UxB9q8OXnGhVz65q/ac3Q8YIvZT0A/aNC7FrMClMY4OE49ZO2BiZIF/8HCq
	 z+YeFjIeLWEZBG41gQzFIL0f4+aDCXR+5ow4KMUiesqJGBaMGYuDOgnhthrSn9pXXgZOW
	 CrZjX0B2OKrj3AnpID55OUIKncNQhNi0sbwXxfJ3S9/f8oxdnOO3YaqJlpiKp3YsSygDv
	 ACKzxRBZCchS/9CAF7DcFKM3xFzhmw2FwaPixjcd9UeDFdkjUHn5Cir4LiPU0iTn2md15
	 hBEm4TXP7qr27xTeAQBf+sgrGtgC70he4tmUiARiiRuPn3DgxOw2YzvUCT/2Z96poFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904094;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5IfXtGijlPQD8Q0olBFqZfgP2IyMiim3PIewkzSs/rc=;
	b=40V28qBIjX3512OYZZhOGfyGWXWfzW3ReV4U1nIxe7vjnVZJfq+a6yJaxi75RcjADRk0
	 b+2h52jnYv9a2UPsla9lyt/2HhhKsMrYsMgfCKL95/xo9WWlnOnSAzuwnDmVgMKRoHlLc
	 ZkYOc/UnZwEqyRpnSiWYoUXffZKUYA2DIh2Ksi+VvpfVSlDdLQ7PQDuZgWWfPb2vEeFXF
	 KRuRN7OXDyu5QCRu5CkpC0jNCgtJgDbhy0166uB/0HrjYrpO+KjY54l/COHrgVcAJPQFC
	 IOD6DasViyCNcldVc0hiZfkxnHeaiXRPzLpVTt3JeAUunWzNi25c+z3LGqOAR38cBLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ilkeA7U1;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE5C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ilkeA7U1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w4pj5tbxz1eLMMGB1xD6rdBw8N4Lh5gRXiLGv2nZsEQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904091; v=1; x=1794508891;
 b=ilkeA7U1BdPAPgyJAFZ+4tUuZL+39gVX1YgEIL9fjQ5J1DVGSALOYJb+v0HVUzWaT2rnJ0Rn
 qUh3DTdX8ZLKFQCzi8yoT8hMr2+W9/w6LLu/aOUGbdxbpObeEwRs2v/93iSXIXdy7diihat3G09
 OnuGlcUSLHe+YGsR6uJYkJx4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a1a1b608434a8a7d;
	Thu, 05 Nov 2026 18:41:31 +0000
X-Mizu-Trace-ID: a1a1b608434a8a7d
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
Subject: [PATCH v9 16/32] mm: zswap: reject high-order swap cache allocations backed by zswap
Date: Thu,  5 Nov 2026 10:39:00 -0800
Message-ID: <20261105183940.2236717-17-usama.arif@linux.dev>
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

zswap stores swapped-out pages one at a time, so a range of swap slots can
be split between zswap entries and the backing device. A high-order
swap-cache folio over such a range cannot be read back in one go: the disk
read would return stale or zero data for every slot zswap owns.

Reject that in __swap_cache_alloc(). Do the check after the folio is in the
swap cache: from that point zswap can neither start storing nor start
writing back any slot in the range, so the answer is stable. Callers
already fall back to order-0, which zswap_load() handles per page.

Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/swap_state.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index a8a486b0403ab..f41e740a91b87 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -12,6 +12,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/mempolicy.h>
 #include <linux/swap.h>
+#include <linux/zswap.h>
 #include <linux/leafops.h>
 #include <linux/init.h>
 #include <linux/pagemap.h>
@@ -482,6 +483,17 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 	__swap_cache_do_add_folio(ci, folio, entry);
 	spin_unlock(&ci->lock);
 
+	/*
+	 * Now that the folio is in the swap cache, zswap can no longer start
+	 * storing or writing back any slot in the range, so this is a stable
+	 * answer. Reject a high-order allocation over a range that already
+	 * has per-page zswap entries.
+	 */
+	if (order && zswap_is_present(entry, nr_pages)) {
+		err = -EBUSY;
+		goto delete_folio;
+	}
+
 	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
 					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
 		err = -ENOMEM;
-- 
2.53.0-Meta

