Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1733938D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486514; cv=none; b=GO7BD3/xMfMp2R98ztjGl261ClqqxzoMwTtmRvrVspZPYVbTb00hiEekBCm+E161nevoOFTrhDCZ8v7bLIam40l5F0D0CSoNXtAxjuqQi07q56Bu3w1RvDeCKBRHicc9WPA2vLp5eJ0fOd3rRLFRqVtM9/NR3ktEcztz2UC7SDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486514; c=relaxed/simple;
	bh=H+RqWgsnRAKllbk4zJ7ehq30TWINM70kfZuR/EwqAC8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VFkjOTXRNo5I+N5GaqiCnYD0S7bVnuONg4y+e5KNO5QuGN4Ev71MsQSiKiJAFZp4dFDrTXRXmV9PgUHOHCaOfoUkL4/bwFFxlyxyivP/MoZj2thwiGelL4qWdPqUTYfJWUfcKYyBkpE13iPa83Ieu31AcoQCaFMaFKAUJYqpxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=atfsCklt; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="atfsCklt"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6afbe6b47b7so5527279a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791486511; x=1792091311; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lziypnwRraIlsorF0VwfpRYSW789AnxqR1Fmirni4Xo=;
        b=atfsCkltwFjfikn9Bq4OTjFdosK+Tj+SdOSy2A8B8Fi4+KG2jqGRLdtr/Xm44N1SKd
         JqGsyfqrQl3fX7EW7e2uIHEdYvFvYkZGWb31aaTvvPABOGHGFLfz+odKDfa3gOnE3HvN
         8sWmQ1tMgSkQX8hA00+SFokPU0SsL4o+JV9BFgNzOvhBZU2akxcoglHQ2s9r/qqbC/CQ
         TqmbmxkyGf4z0nIR4yuYNcfaU+uNY4tl1GSHOLaEgjkj8ApWKzW+Jz/kfyj3bG98EELx
         abp9CQ9j1WPUsHiQkgNhqDb2HgO1uYcP2GzqMnOeRz78ihalIvW0r/52FlLlG9ZEwnqE
         vEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486511; x=1792091311;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lziypnwRraIlsorF0VwfpRYSW789AnxqR1Fmirni4Xo=;
        b=B1VjBvke8GJ49C3c3kRqKb3ybSxETJWrRq0XWXrrlVJQv/Pu44stOhAXK2JdyROuOH
         w+iC5Z1lnMVORSWgm+lhKp28OolF6MNhgeLUPkNEDimjcVqyjz0zCqUEC3T/EYahCMNF
         TYMHD3iv1l42A+NRS7qt1hMUJZ5F/V2LfVR9lIYBXpubVZpgTHvbLndZeiZIT4BY2sqx
         TBTPmgaaX2gHv71oYvrzSsi5hIFUVbM/wm776GC7UNxEWylFNR+3zDHkzzE5GJpVvPjR
         Kvh3pXJR8F1ZceBlc5fZoVZfR+pmbs44y+dV6uKd4yIzIZKSsWmNBgI0mrRQPcDhy3M9
         zUIQ==
X-Forwarded-Encrypted: i=1; AKwUvBycztYq8knTAJNX2trCVWXObP5LTm/K4n2/+tSJHngGajKrSHzN/gIIydUzt1uMy9s96xhbfcxdCrg3YVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYILHfVzLApee5Rub2l6TAN5f/3GgJPRmHdX/msVtN9cb0sk+f4r
	BiDceoL67I6F9sBvpFTjcixmaSRElE2mNPq+sZj1L/0sR5LuhbbzZZ3UHwByBOighuyHJNC6Muv
	sTbp0TztGeCyDZN8Dzg==
X-Received: from edl6-n2.prod.google.com ([2002:a05:6402:4246:20b0:6aa:e587:e1c1])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3211:b0:6aa:edb3:d687 with SMTP id 4fb4d7f45d1cf-6aff38f1e95mr6238564a12.15.1791486510254;
 Thu, 08 Oct 2026 12:08:30 -0700 (PDT)
Date: Thu,  8 Oct 2026 19:08:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008190828.3221718-1-tarunsahu@google.com>
Subject: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open code
 its users
From: Tarun Sahu <tarunsahu@google.com>
To: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

for_each_memblock_type() always starts the iteration at index 0 and its
body is a trivial 'for' loop, so it hides very little. It also gets in
the way of iterating from an arbitrary index, which the next patch
needs.

Remove the macro and open code its three users: memblock_add_range(),
memblock_isolate_range() and memblock_dump(). While at it, move the
region pointer into the loop body scope.

No functional change.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 mm/memblock.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index f5aaa38cfa31..59dda7d085f3 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -155,11 +155,6 @@ struct memblock_type physmem = {
  */
 static __refdata struct memblock_type *memblock_memory = &memblock.memory;
 
-#define for_each_memblock_type(i, memblock_type, rgn)			\
-	for (i = 0, rgn = &memblock_type->regions[0];			\
-	     i < memblock_type->cnt;					\
-	     i++, rgn = &memblock_type->regions[i])
-
 #define memblock_dbg(fmt, ...)						\
 	do {								\
 		if (memblock_debug)					\
@@ -615,7 +610,6 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	phys_addr_t obase = base;
 	phys_addr_t end = base + memblock_cap_size(base, &size);
 	int idx, nr_new, start_rgn = -1, end_rgn;
-	struct memblock_region *rgn;
 
 	if (!size)
 		return 0;
@@ -651,7 +645,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	base = obase;
 	nr_new = 0;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
@@ -815,7 +810,6 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 {
 	phys_addr_t end = base + memblock_cap_size(base, &size);
 	int idx;
-	struct memblock_region *rgn;
 
 	*start_rgn = *end_rgn = 0;
 
@@ -827,7 +821,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		struct memblock_region *rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
@@ -2194,11 +2189,11 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
 	phys_addr_t base, end, size;
 	enum memblock_flags flags;
 	int idx;
-	struct memblock_region *rgn;
 
 	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		struct memblock_region *rgn = &type->regions[idx];
 		char nid_buf[32] = "";
 
 		base = rgn->base;
-- 
2.56.0.385.gd3acb90ef8-goog

