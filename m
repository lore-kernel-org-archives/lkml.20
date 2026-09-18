Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5025B30D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690969; cv=none; b=cuYHAJLcojdly9St9ir0pa5GQfWL52gJM2rcw+sbp603J7UmXQZP/dJs/YifDTpoctlwJFOB5taj5njrG+UJccz28erQXw1aeVe/LUjShFOClnu22Ez8DeV2A0BM/UECmnjHZSTFY+1n8q2HphT8EkETj0wJT6YO6NyNzsypuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690969; c=relaxed/simple;
	bh=Ui8qEfQB1HWyx+wxi8mGH42xH3q7gA9S1QpLzf8A8mo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ceVw6QPUXsj8CagSvJPLsGVQm87fpWQv5gHeIluR76Osvu5Koav6Tz8BNT0BGydFHPGkSGlGupqD6fvp29RhTVJoHGZ4tyG5Y9fpZzro1RPWmRJd5MqaJdQSGqPLmnQnFC2MSed61VAqUbnu7JfPZPZzWrDP22UzQkEtcsMABJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nTcs1D97; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nTcs1D97"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a60c4a94e9so185579a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789690961; x=1790295761; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxuYFkClNtObVJTirGhxvNI3z/6AMlB4AtngbQawpYk=;
        b=nTcs1D97itk6eR26q9soPv/XifyzsYwXN1SJjnCSKDeddv/gLUhgVNuCm3GJpGxS75
         MJbZCbeL8J2DpzCwxzXS+ifPR1iPXTdSL/arnIzUO2sDL3fAeVZOJFRegWLP1vhxLN43
         ymLZx3eYQk77kd3v62zcrevfZzhPq/DvgPv3Y7V0AbrigaethwxemYv57Q9padF5rktF
         zUaiuX1UXaP5hjwGHwbjFoaC6mps5k9E8ih6b6GHbOu8hDUmcoSMHRCMFePbzlJ0Kbry
         pP5AGg+Gi/8GivtMPq/rARje2L5twMX1fz7o13OR0V5A+nAgRE4F/dUIXn7bbVlYwdDt
         vo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690961; x=1790295761;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxuYFkClNtObVJTirGhxvNI3z/6AMlB4AtngbQawpYk=;
        b=MjJnlW9NZ1GKuXg5nxkwOHi8jx1w4qCsgjlPUteCGD0czx0A24fjY5wZqPbDSgEDbK
         w6fXAlDXMPM6I8Ehw32TljA33ljCkiYES7hsmj+KD50Tb9veLe8kds+ByiNTJ6DyZiJn
         /StsE52+Lgj/vR8iAD4MCEtVXmnO91PcSgcOcBL4ZyXmVsr+IFuOq5CNs6L8siuB+6km
         fJQUQCHI7OYHgo6InWCMgGYNrEpLP8An79/CUH3TmpxVNUrMkJi0H7eCDYr+v9vw4Ozx
         mkaNIUFlT2W7ZYlvTUoejt92KOmR/rN7GIYo2GibW6vI+aeJgm0JDgIQWkTOAndhoLxL
         TOBA==
X-Gm-Message-State: AFuF++ntaeF+YZ9Cf/xXZ9rwyY1+xyJ8CLqjA/9lK3kuWcZ0RoNMmABQ
	MzGI+2SM7MSq9bKyjMVAMbP5gP94tn2W21CnFFaMfREjFzm9Sjt0y1kPbPKKQESDawhGGlJ1Jye
	VGugKuaTs6Pb8TKBowQ==
X-Received: from ejsg22.prod.google.com ([2002:a17:906:69d6:b0:c29:ece4:d406])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f87:b0:c26:19e3:e98e with SMTP id a640c23a62f3a-c2a1582bdfbmr81796266b.46.1789690961563;
 Thu, 17 Sep 2026 17:22:41 -0700 (PDT)
Date: Fri, 18 Sep 2026 00:22:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918002239.4024231-1-tarunsahu@google.com>
Subject: [PATCH v2 1/2] memblock: drop for_each_memblock_type() and open code
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

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 mm/memblock.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..5aae75d34dec 100644
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
@@ -651,7 +646,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 	base = obase;
 	nr_new = 0;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
@@ -827,7 +823,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 		if (memblock_double_array(type, base, size) < 0)
 			return -ENOMEM;
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		rgn = &type->regions[idx];
 		phys_addr_t rbase = rgn->base;
 		phys_addr_t rend = rbase + rgn->size;
 
@@ -2198,7 +2195,8 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
 
 	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
 
-	for_each_memblock_type(idx, type, rgn) {
+	for (idx = 0; idx < type->cnt; idx++) {
+		rgn = &type->regions[idx];
 		char nid_buf[32] = "";
 
 		base = rgn->base;
-- 
2.55.0.1082.g2b9226bbc0-goog

