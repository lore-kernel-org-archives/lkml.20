Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537583644C4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486515; cv=none; b=l6wAr8stD9uWI/7/zDVT9PsK7NHiOlC5Xw1s2ujNWzsld9jYcAQPMigEfUBmAliuZt5Uhdd48YGPzWipOnmVQy/u+5WsRzVGtffQML1XJom+oddDGPG84vyF7FhlCxjOgrNAIFMbvrom9bxMCKuQ0nMSrQVoWUVoC6Je1hG9gBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486515; c=relaxed/simple;
	bh=cLhBToCW9aAVI6Lsxs/uY79KQglzyJzx5T72mQEaqLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sk2WzceavYv0qheE9rxTac0hbr0zRrqKLsPKR2XkZ6TzLRW5TxcFY0o4NE59MOeg4Mc2pSQREKfNYWvRb4BphBwkGcJucJVOGfhhdVzgAl7Wv4RNpriCc49P35+j3Pp+i9rrD0K/LMOWYkjUNGlJ0FeFQUA7gGneL48MDh01sAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oYnUbLY9; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYnUbLY9"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a9a19c8bdbso1850427a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791486512; x=1792091312; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7HbPFLbPRXHp9XhuAZ/3vm7gntFtncf0PzNuO46BI0=;
        b=oYnUbLY94Y8YRUdMsgMAzB3yKFgMAai1VFfH7OZD6h6KUmwliy0obJcUxvrmmoeQJh
         wZAw2H/o2i2GIIYW0jmlayDNyS4KkHu/7aAz87CjasKr5VJ3pvKYuIh652aKO8W3evR6
         WjsOVvBokK88y2UQdkpJWEBb7M9m3IHGsG+xA1tJYnNyiJkd3kv3YhsqqSR2llPK12u7
         ZSoNLFnwdRpqOOSKl3NlzWdHevMq80UlYyYgZV5hSlupfXOtRsPhC9RfHWcCPHRGRYzR
         V06jKEKBK83ZmNBGFsRNNxRsCDpMyyGX/s8wN1iKJPRXH38m8zlCUN1GXK+Q/xY0hXsX
         AAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486512; x=1792091312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7HbPFLbPRXHp9XhuAZ/3vm7gntFtncf0PzNuO46BI0=;
        b=JA1Wc3qVrBcVQTDOJTplKkWSDrfc/CFeNp1LXhehPGZxM612eTh4/Tb7v85PO3Bv/B
         cjcahvdG+Ry2Ney3d926/yxGfKxdQTi4zo8s4WK3lyRn0waM3oIj4488ONx+MZONqEl4
         oe6wn92rOkh9b4Yugxba/Is1LuvVAtow4nKJFTI5lIAighEXGcKPmphmYJ+dhty7nvQh
         ilbooRgdJg7EGHpFE0LsjqpDxrjPi3kLcNCVH/raEt4UEFDdCq0ZAp50IXOIikyQprEX
         pswWwCg0u7ZqjrQ0S/CVf393sdkJuGToaLYBc9ZfSFOFhFnC7qIGnhkudmDYurrbDmLg
         NeVw==
X-Forwarded-Encrypted: i=1; AKwUvBzKNYC8Rzb18gOQhxItR7/DpEzWODlA5k844smFHV4UJilOeW1CK9vEw3J7y2NhgEKgXoMfBTWgrEAV9w8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI07amsJm0LPCEHv3hvS333Mq9xyir8MQLnX5/acGZj+9ysBhYu
	DyM+1dmAD5tRIpY13AhlYwxlFd0LlKGLcol7j+Xf4Xxubqrv6O/rwOWQs0ki+mhRokxiJ9syJEH
	T+KnyAVlk/ef5hkQoLw==
X-Received: from edbgy14.prod.google.com ([2002:a05:6402:5bce:b0:6ac:b91c:a379])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:50c9:b0:6af:a270:b2a7 with SMTP id 4fb4d7f45d1cf-6b0118ea2damr3315575a12.0.1791486512418;
 Thu, 08 Oct 2026 12:08:32 -0700 (PDT)
Date: Thu,  8 Oct 2026 19:08:28 +0000
In-Reply-To: <20261008190828.3221718-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261008190828.3221718-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008190828.3221718-2-tarunsahu@google.com>
Subject: [PATCH v4 2/2] memblock: use binary search to locate candidate regions
From: Tarun Sahu <tarunsahu@google.com>
To: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Use binary search (memblock_bsearch_start) in memblock_add_range() and
memblock_isolate_range() to locate candidate regions instead of linearly
scanning from index 0.

Under heavy memory fragmentation (such as KHO page preservation registering
hundreds of thousands of disjoint folios), scanning from index 0 on every
insertion and isolation results in O(N^2) complexity, causing boot-time
memory retrieval to take several minutes (~268s for 393k pages).

Using binary search reduces the candidate search complexity to O(log N)
(from O(N)), cutting KHO memory retrieval time from ~268s to ~50ms.

memblock_search() open codes the same binary search, so reimplement it on
top of the new helper.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 mm/memblock.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 59dda7d085f3..614d0a55dd70 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -586,6 +586,29 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
 	type->total_size += size;
 }
 
+/**
+ * __memblock_search - Find the first region index where rend > base
+ * @type: memblock type to search
+ * @base: base physical address of the candidate range
+ *
+ * Returns the first region index that could potentially overlap @base.
+ */
+static int __init_memblock __memblock_search(struct memblock_type *type,
+						  phys_addr_t base)
+{
+	int mid, low = 0;
+	int high = type->cnt;
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
@@ -644,8 +667,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	 */
 	base = obase;
 	nr_new = 0;
+	idx = __memblock_search(type, base);
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	for (; idx < type->cnt; idx++) {
 		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -821,7 +845,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for (idx = 0; idx < type->cnt; idx++) {
+	idx = __memblock_search(type, base);
+
+	for (; idx < type->cnt; idx++) {
 		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
@@ -2062,19 +2088,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
 
 static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
 {
-	unsigned int left = 0, right = type->cnt;
-
-	do {
-		unsigned int mid = (right + left) / 2;
+	int idx = __memblock_search(type, addr);
 
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
2.56.0.385.gd3acb90ef8-goog

