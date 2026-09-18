Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637202C08BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690972; cv=none; b=ZhYWDnMHTYo37AiTKNptsRlQB8arhkuIqTF27jYoKz6gWakoULWD5orfpYnQu3b4sLFxLFu8OmxcA59DB3DDG3HGBSg26h/ggcJaS4yGvqewZFqZxKcYveB/PL1MQMtUfMmiKTgKSWnwhR71kpLYjE6VuatrjGesdAesxLPRMDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690972; c=relaxed/simple;
	bh=SNaO/tSW8mgE1+CYp8wV7DdFq/mJq3fdOLd/OcWdgZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WslLnJAgYMQp02uOL4FnJbWDvjCFt0+SPuEHBkIAWw1srmlgenD5rs/xar1MOFb0f9PAjMHQmEYHgvOwK3UVYn1C6jJGqrj1XU0mS4LO17l+pLYviPwKQZcmCt8PGFGpRj06+p5E4DIfQk8UJsfWKb+r3xe0AxMEsicHRhK14tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=donODBXp; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="donODBXp"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2967165d94so11184966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789690963; x=1790295763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2457T8NXpe+VYhyIx4NQQZX9J7v7gQmMrsUW0L2lVQ0=;
        b=donODBXpW0e9Klrg+W2xegN031w6C+79ec3cQLA3rtz8FfLHcEbndNFcLBNRFDjxas
         ZhJsK2RgQ8NbgkO9r6oFzznsXdr5a1xBbhLTH0OacKRgrWcIC7Krv4X8hb6vYSQYsWi3
         2c0K9Xm6i5d24RLOdU7Fr/qztVaOco53aBuw/5wrNmL2IKdlAE6zcgr0wnQw5HWVE2VP
         Uubz35UAVkVeAk3tMA7Zy2UIwWWxfLacRJaGXlYDzI2wRY+4FDzS2fO+z3Ru47lBh/eM
         cgnFG8xGzQkbOFGzSK3A7fAD7DH8BdNE1mFk9UCqELIVnuiIW1FfLdUh1OPoX35UOUEu
         f6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690963; x=1790295763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2457T8NXpe+VYhyIx4NQQZX9J7v7gQmMrsUW0L2lVQ0=;
        b=RscSgqg1EMOqnKEFnjKcA+ekHoNre6UPqrSnx8XZkWxUyeb280UIEmg02JxkzQSkzv
         IL6C9eWJJlsg9yVbcfp1Uimp+66HXBlRBoy+X/Bhf/hpnYVFT8QHrfY16x6UE0z94qkl
         omLDHxIBpagKQVhwb5y/LI7gMaZHRx1q++Ha54RcWvDy6U8doie+Xv5ws/3KOcHHDzSJ
         WwDxHOGiqXKLPLYJ21BhIhr53lExNt+ZZLf1hNGauKGICTIpMv2NmAsWeea20zJmL3y7
         8AtmHQWCMDOju+fMCpKI30mcHQPahn2fI4MJjy3qXeAmeUJbQ1Cez+jSR37KCe7XL7Au
         jFUg==
X-Gm-Message-State: AFuF++nAtKPSfFIJGPrCbfyHPOgkykIHCdOPmeLszdZQ4xbScjpNXNPi
	JA4eZITsb8Z8eYP7VboOYnOg5+tLI4McbWduyfpnK4AIhPu05We/uoyTfhUJiMHCVsVUtiqAkN9
	uBoNApzJ97stqfbLWpQ==
X-Received: from ejcgo34.prod.google.com ([2002:a17:907:da2:b0:c29:de6c:6ff9])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3c96:b0:c26:30fa:7cf2 with SMTP id a640c23a62f3a-c2a157fbe2fmr84040766b.13.1789690962738;
 Thu, 17 Sep 2026 17:22:42 -0700 (PDT)
Date: Fri, 18 Sep 2026 00:22:39 +0000
In-Reply-To: <20260918002239.4024231-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918002239.4024231-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918002239.4024231-2-tarunsahu@google.com>
Subject: [PATCH v2 2/2] memblock: use binary search to locate candidate regions
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
---
 mm/memblock.c | 53 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 5aae75d34dec..00a8768de988 100644
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
 	struct memblock_region *rgn;
 
 	if (!size)
@@ -645,8 +672,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	 */
 	base = obase;
 	nr_new = 0;
+	start_idx = memblock_bsearch_start(type, base);
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	for (idx = start_idx; idx < type->cnt; idx++) {
 		rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -810,7 +838,7 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 					int *start_rgn, int *end_rgn)
 {
 	phys_addr_t end = base + memblock_cap_size(base, &size);
-	int idx;
+	int idx, start_idx;
 	struct memblock_region *rgn;
 
 	*start_rgn = *end_rgn = 0;
@@ -823,7 +851,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	start_idx = memblock_bsearch_start(type, base);
+
+	for (idx = start_idx; idx < type->cnt; idx++) {
 		rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -2064,19 +2094,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
 
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
 
-- 
2.55.0.1082.g2b9226bbc0-goog

