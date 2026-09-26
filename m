Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8C3A1D01
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414696; cv=none; b=j0NSwCKpA27TizhZv3iKT/+JscutSzGjaTaSv4F8opEg1UndgUvt1BGtHmnkmkTdQUK+urcecal6YU9hvdbSVlZ5oBtO/nY1cJo1BmU0UEyXr2AxNRSLVYNmsz3D4NQg2yrb4GEb+Lg14Dj1FvYMGUBySpyh7lyaQTR00I4UP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414696; c=relaxed/simple;
	bh=SLihxkP9x8ol5wzb2ncH+ajiz1GnnwONL2S2uxqu5mQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FyRbuAe1Kpdn3HQXy40Bx4Toxj0KkDaaUU67sYPLJBy2Vqu5aXRd3V/xy8FNMrO9V08rMPR5zcOrF1xdCz3RYw2TbITNNFU48G7pH6kFEc3PWZIrCfeWsM5m36SsDYrg/9VZZEc6n50hC07HuCT7bFzjhhNNZnfY8FvMWttpn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BcvfdSZh; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BcvfdSZh"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so2020623a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790414693; x=1791019493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTQndXxkIuwWKoVUm7RH0Lfp0eOzvHI6CoK2okedbuw=;
        b=BcvfdSZhuUcQ2KS/D9VSyPYNg3p9oRnfgYi58xIpFbbQT8r4NbEE82NqZJB6M1LY3v
         yuRe+pTmnBh3rXeLxLFIvFWMQSI2/r19SwMoWFnwKExlP6bUg1TW1LhaveSxoogz4/eZ
         HR+zwPHN30MQ4Tcd78GE4lSY4/9gw97ewWXYzVgChCwc+bx2oQ9iExoJnr8V/CtRkf8N
         702UQe0c8vKE31nkOSt83hWvVnO2AMUuT0Yj1wevdjh82Eo9zufMZ5lI8/cJF44nFtRc
         tSiD9wGxU8OJynUw6JnfpdY78Dr0acUl/nFFh1qeUKUr539OJyeZc2HaVmlwBZ1mFtbU
         nLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414693; x=1791019493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTQndXxkIuwWKoVUm7RH0Lfp0eOzvHI6CoK2okedbuw=;
        b=OISrc5/3f8G5pLJQpe6eET83LzAhZA7j6bLqFw4be3fHeRaYgjiX7ak4BTyKJvl8Yb
         KxnEw9xsZvvcpNL7q1XZNf/xRyGfsfBc+8Wf8P9XOXSiz2S8C0Ln3zvD8BvlnpBvdeVa
         tIHV4PHTtc6f0lYQw3lXRYggXr0pi7FJnABSJVVCv86eMtOf/YliUFA1pMvGBr7dcCUy
         7Lpy2T0ce3myHbc1RzkjBRsgUCX5HG1aciVqSoaaRyUUGhBf/2jOZ6Tw0A6ZZSvUYBly
         S4HsBUeuTTGe1fDKKhVdjBw+1Xh9mnKWmdyPDgp3uOR15T6xuWbLbjupTviOVfbB06bC
         6BfA==
X-Gm-Message-State: AFuF++nAAbT1fSo7oGR4LTPbLadMwUf8uDL5rrj8gbmwaGEhNHIA1W9+
	XGgsZsX/cEjsGUO5qw+2kZhS+8m8ihM50pArhQMYGPA7Rs+YFlYQGmUThhD4u9kGqGNtAhkf5za
	9wNa1ohTAQNkCCNIPug==
X-Received: from edbet5.prod.google.com ([2002:a05:6402:3785:b0:6ab:222:1e7f])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23c7:b0:6a9:e7eb:f52f with SMTP id 4fb4d7f45d1cf-6aac90a9049mr5754388a12.28.1790414692533;
 Sat, 26 Sep 2026 02:24:52 -0700 (PDT)
Date: Sat, 26 Sep 2026 09:24:48 +0000
In-Reply-To: <20260926092448.4090401-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926092448.4090401-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926092448.4090401-2-tarunsahu@google.com>
Subject: [PATCH v3 2/2] memblock: use binary search to locate candidate regions
From: Tarun Sahu <tarunsahu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	dmatlack@google.com, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dev.jain@arm.com, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mm@kvack.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Use binary search (memblock_bsearch_start) in memblock_add_range() and
memblock_isolate_range() to locate candidate regions instead of linearly
scanning from index 0.

Under heavy memory fragmentation (such as KHO page preservation registering
hundreds of thousands of disjoint folios), scanning from index 0 on every
insertion and isolation results in O(N^2) complexity, causing boot-time
memory retrieval to take several minutes (~268s for 393k pages).

Using binary search reduces the worst-case complexity to O(N log N)
(and O(N) for sequential appends), cutting KHO memory retrieval time
from ~268s to ~50ms.

memblock_search() open codes the same binary search, so reimplement it on
top of the new helper.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>

 mm/memblock.c | 53 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 59dda7d085f3..87c71435c80c 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -586,6 +586,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
 	type->total_size += size;
 }
 
+/**
+ * memblock_bsearch_start - Find the first region index where rend > base
+ * @type: memblock type to search
+ * @base: base physical address of the candidate range
+ *
+ * Returns the first region index that could potentially overlap @base.
+ */
+static int __init_memblock memblock_bsearch_start(struct memblock_type *type,
+						  phys_addr_t base)
+{
+	int mid, low = 0;
+	int high = type->cnt;
+
+	if (type->cnt && base >= type->regions[type->cnt - 1].base +
+				 type->regions[type->cnt - 1].size)
+		return type->cnt;
+
+	while (low < high) {
+		mid = (low + high) / 2;
+		if (type->regions[mid].base + type->regions[mid].size <= base)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+	return low;
+}
+
 /**
  * memblock_add_range - add new memblock region
  * @type: memblock type to add new region into
@@ -609,7 +636,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	bool insert = false;
 	phys_addr_t obase = base;
 	phys_addr_t end = base + memblock_cap_size(base, &size);
-	int idx, nr_new, start_rgn = -1, end_rgn;
+	int idx, start_idx, nr_new, start_rgn = -1, end_rgn;
 
 	if (!size)
 		return 0;
@@ -644,8 +671,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	 */
 	base = obase;
 	nr_new = 0;
+	start_idx = memblock_bsearch_start(type, base);
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	for (idx = start_idx; idx < type->cnt; idx++) {
 		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -809,7 +837,7 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 					int *start_rgn, int *end_rgn)
 {
 	phys_addr_t end = base + memblock_cap_size(base, &size);
-	int idx;
+	int idx, start_idx;
 
 	*start_rgn = *end_rgn = 0;
 
@@ -821,7 +849,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	start_idx = memblock_bsearch_start(type, base);
+
+	for (idx = start_idx; idx < type->cnt; idx++) {
 		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -2062,19 +2092,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
 
 static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
 {
-	unsigned int left = 0, right = type->cnt;
+	int idx = memblock_bsearch_start(type, addr);
 
-	do {
-		unsigned int mid = (right + left) / 2;
-
-		if (addr < type->regions[mid].base)
-			right = mid;
-		else if (addr >= (type->regions[mid].base +
-				  type->regions[mid].size))
-			left = mid + 1;
-		else
-			return mid;
-	} while (left < right);
+	if (idx < type->cnt && addr >= type->regions[idx].base)
+		return idx;
 	return -1;
 }
 
base-commit: 1f18d740165163910df64d3063e1ad31648bc5e0
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

