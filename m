Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C74ADD9E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451152; cv=none; b=K+qDSYC3CohVvnIUTmMbVbfpryubuSnKZNsSQvyS54dn1ZuI+UJkDcEXSm3iJYscGAu1qxPXOptgX4Lj7drsmgn/d/T7e+Mq4vuLv+8iYzJu2EWCmI4bHrd2NsIbx+lkfLNmbtUPA2LQ2cOMw2Vvlk1gG8O7caWxbhAeWvlqYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451152; c=relaxed/simple;
	bh=WpusHGlJ9I5jDMZadod6M8QI5XV27L02A0WYDW7yn6k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=psq3joHNjBzrGl6auxIIrhUd5p2gBfeP32Zquz0Nsc+NmjyI1K4L8NNZDLW64K0fXM2E8+ZN6CzvvDZ3iDxtjxcBeYQRFxScdfGoEhZ6V572aUD3fJLQ48NsQBEAS6cgFyetXNK33/32ylrxaVCadht+gbHosXgOnhK4OYzVgbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lXhgVxMi; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lXhgVxMi"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a178080182so2815849a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788451149; x=1789055949; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqrjp7diFK7hTPI/YVRHNUU83H0HuCgE52mHERNgxw0=;
        b=lXhgVxMiWSwvNlfzetSb/Wm3GZZHYoWUH5MXMXC9YqSjrupicjlCJl/DxzQqgHARTT
         nPwVaY0KIEcYRQUcy/Pvd4InDkCABNowKa08PLQrf41RJpoGMu61owyUEP028M9BGknk
         rT+rAQfBq7jqaTZ8id1B3Ea7sa5tB5CULyJhR14kMNjSproq/qT03px2sDIwDGHYJAeD
         S/983CX8BkmD2qSA+fRxRIMmitu4Ii2EcmHJ/gHnxAjqxrg+Oe7gjiNgaZGTiMu7E5x8
         QacFTpjqQlewyCKsYooWWBP3kp2GNFoEYv78ynj27qyAqUOygUgAbwLD+wwr+Y+DMa8Z
         u4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451149; x=1789055949;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqrjp7diFK7hTPI/YVRHNUU83H0HuCgE52mHERNgxw0=;
        b=CE54s6PJ0hG9CBworO9fkg6jydOaC4txW6+iwZYeb+0pFNXOZ2NzEEYgbCN4IoczLK
         HHICkwCc3Ts1+zJXeIavChfUzXzVW+sdz6hqhQCqDHoBGVnZexUbeK9jW/4fWtdDQAEW
         nISeAk/DTTmfTk+kseFLTjKExVP8s/RZLqxpiazHYnPjshqYL9fHtFWi9WPbmD7wsi+5
         8pnh9ybvuYLxVsm3mPQzNAcqEOGlpFQSZBjvfDBsJMmpndVMbuVmwGElXbdv0DE11tWm
         SuoHWhSKdaBpE7TSECbUjMNvPCkibR2CfQ8IIHkp4DHfbsmqij3sJHQBzoBxoLvLHZpG
         Ztfw==
X-Gm-Message-State: AFuF++lIMlMYki6vNWdEoahr4qjy05G2AKLcazQuyE1zOajEixl9FgIv
	7l4vcvtpWu/3Bz1h3RyN91Ll2rhYK4wwoqS/SionmbyNKI7JAv8xua3T7y2io1RDksJRHyOruRp
	FIStz4Ox16lwqVDyPjA==
X-Received: from edev1-n2.prod.google.com ([2002:a05:6402:a2c1:20b0:6a6:92c9:46e5])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:24cf:b0:6a6:32fa:54f5 with SMTP id 4fb4d7f45d1cf-6a6832f4708mr8089142a12.20.1788451148809;
 Thu, 03 Sep 2026 08:59:08 -0700 (PDT)
Date: Thu,  3 Sep 2026 15:59:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260903155907.1065681-1-tarunsahu@google.com>
Subject: [PATCH] memblock: use binary search to locate candidate regions
From: Tarun Sahu <tarunsahu@google.com>
To: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org, Tarun Sahu <tarunsahu@google.com>
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

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 mm/memblock.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..88940474b020 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -160,6 +160,11 @@ static __refdata struct memblock_type *memblock_memory = &memblock.memory;
 	     i < memblock_type->cnt;					\
 	     i++, rgn = &memblock_type->regions[i])
 
+#define for_each_memblock_type_from(i, memblock_type, rgn, start)	\
+	for (i = (start), rgn = &memblock_type->regions[i];		\
+	     i < memblock_type->cnt;					\
+	     i++, rgn = &memblock_type->regions[i])
+
 #define memblock_dbg(fmt, ...)						\
 	do {								\
 		if (memblock_debug)					\
@@ -591,6 +596,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
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
@@ -651,7 +683,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	base = obase;
 	nr_new = 0;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for_each_memblock_type_from(idx, type, rgn,
+				    memblock_bsearch_start(type, base)) {
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
@@ -827,7 +860,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for_each_memblock_type_from(idx, type, rgn,
+				    memblock_bsearch_start(type, base)) {
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
-- 
2.55.0.970.g62bdec98f9-goog

