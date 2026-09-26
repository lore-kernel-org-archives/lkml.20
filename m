Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552497478
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414695; cv=none; b=qDOxhLU/qeFvhhVZZ6DWZkofhp9Tfyq4Ny+Hqdmdwij3V1epC9ufDWs0qmFRDJNyuaO19J9ki29wJj7CCJhLnA3PfkT5AI9UO2t/5KpZAVlMEqXYwHr2GgtvR+FgCpL4DiwCYwG+bH5rUA8jmF9GAT9fAdcTUqf8CluaVy49Xk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414695; c=relaxed/simple;
	bh=3pPmi7rHX3PiO/U/WkQSJqtpKBNHg/bW3ILMfWUeA6s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EugydfKQWpm4p4CEZnHrLu54V8ntq4RoIblI3H3M082RgwXfqAWvFcKTmgb5pOhEB3yS+bWoruHFK3aKrm++f/IlKOcR/ER1AzXbVQmFukOPri3clA39wZlhukddHLb0npZvutYRO5NAEq/3JBQ2FGd+PXWHJnF2lbsp+t1Sr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uK+aYXc8; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uK+aYXc8"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c210c66672eso207857466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790414691; x=1791019491; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4j7omQNB+TmgxmIXBVcLYQY7ezzfW8m8OBFfXrJ8Kk=;
        b=uK+aYXc8/Y0w2SbassNJqRT/EMKtWnyNj2R9AGVgvm9b/L+Ki9OQk+fk6kHKm2+eyq
         Ln1jaLbscXjuvwBTpAi3rxcRnIWaeiBfBNjouIFjzF0rX+nl/gHrbRZAbF3cgKDDghv/
         6FZJBETiFGa04RvkgRCHpPe8DZ02WM2R9SnrCBgNLRIjnMuNzpO2kzWWCP2omVNhEgP6
         KCVMSi2YgGHFkYT76t5s1X0LE0no9LwY67DfX0oWRdD+7xFxUPCcLwAc0GWLkUCOGHYL
         vmi1/ikHbSMul3txryAlT5i3+TdakUrQn+VQXuo3vzVcqcTr79bo8XGjg0AnYg0Ek8P9
         B3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414691; x=1791019491;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4j7omQNB+TmgxmIXBVcLYQY7ezzfW8m8OBFfXrJ8Kk=;
        b=Hj0lG2ns+exWtEGTNp3VaR7d8ge8nk57acz0MPmmrPGkOUHOKUgYtqf5RDZIiHKIRz
         z4YV5xQg3mRxN+KhPh53Fxnx3bdkoKBj20MVvgf0DO9CHoXKPV5xMBsgxo0mP7y6tDtr
         fRUhF13s+cJ1jAZEM3hpQ1x271pDNDkwzsMAgNNjblWcgfP4Jha7KOpPQnBgFhvBiG/y
         sEKhT4xJ26BebDYsPn5zv4kA56IE9qCkntxWQkwhS1XZIs77A3BYdiOINc4pK6mzsSVG
         6nXrBsjVOfLm4P18c+8dxvlxV1jFy0r1qIGyGiuHCBA85wnsmGsnBsXZOuP1spOoY0Gi
         kouA==
X-Gm-Message-State: AFuF++lzZTsR+VaoXAxsW/S+VVhOrbrl8v745jdO6e/At7o3VG0GDrhZ
	kCJKgvNt+qgGRiJVKBGHoIHQMBU5Ct0EccbBRojNnBPB7EQKl+08W0NahcSDdjjbp3FLLs1pDvJ
	aziuagVHGCVmE+NwVvg==
X-Received: from ejv16.prod.google.com ([2002:a17:906:3090:b0:c2d:beff:b397])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6c17:b0:c29:f5d8:9c71 with SMTP id a640c23a62f3a-c2ac223e35emr724660966b.32.1790414691194;
 Sat, 26 Sep 2026 02:24:51 -0700 (PDT)
Date: Sat, 26 Sep 2026 09:24:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926092448.4090401-1-tarunsahu@google.com>
Subject: [PATCH v3 1/2] memblock: drop for_each_memblock_type() and open code
 its users
From: Tarun Sahu <tarunsahu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	dmatlack@google.com, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dev.jain@arm.com, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mm@kvack.org, Tarun Sahu <tarunsahu@google.com>
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
v2 -> v3:
- Move declaration of 'rgn' into loop body scope in memblock_add_range(),
  memblock_isolate_range(), and memblock_dump()
- Add Reviewed-by: Pratyush Yadav <pratyush@kernel.org>.

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

base-commit: 1f18d740165163910df64d3063e1ad31648bc5e0
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

