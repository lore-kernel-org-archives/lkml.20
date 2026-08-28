Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872636E468
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938903; cv=none; b=l9MRMuBuVUBgaytqW7O+DQ8aNrKrCqCX3mC/aj4njTuSATExPSDVoU6E24ICVc/jayrk7qRwz0n+Kqf8bOjyddGj50NP71Y52lA3UmqvPM44W1pEhLz0pjbG71tvbBGHhvjqcWHW+hNzWQDvzPE6cxKlKbNcuw9DsUssVwIs/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938903; c=relaxed/simple;
	bh=wLsScvtFg9EijvmcpqzG8ZzWAzF/R5a0kaA1au1FwFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHDWBt6h7CfZEuH1ML1Pe9W9c2hWZVeaKrHzB+YRg8wfnLHwa9xaoDW/tkZ9UOC8OhLWQX1fYe/BfsKbpPZpvsQAtRyG9VHBOxHKcvmv2LZ2/RUfG6Q5dlLRk/UX51IOFRthHTWgrEN+cjMN9AjzcpGtwzXVVoPAqy5hKw2SXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+PewmvR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+PewmvR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so11270165e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938900; x=1788543700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY/z5JBReRe7jugNdwruzvn3FKO8aDoyDfCYUNRNB5I=;
        b=E+PewmvRC01H2ftyHFMJphg2GLdSJcBYmMA3GNYKGeAMDkf1xJa2ouOQGVgvdvvTOf
         jXajt0kqUZNcYW5DsEtrYFzsI10W/kIJ7fGRTqEapZ73WEz9KjkCWhLisAyDrQumbyOW
         phjqv1Ht3vOkogI6im0pKRJiu/SxBNJtl+xL+pvQxzxMW6VVQs+y/cZC/FGd3e56y3GY
         VDeSoUQASrp8TWX/2FcoSLho5rEVvxrIelbi9hCilPoHJMvbzezWQjEktJT+u+qa/1mj
         IlGsGEryhRz2H9vYNa6aXA3JW8DOUSlZ8cF/EE2qdDLXZPZ2BfR89Cc1nhqTDm3WwFBr
         SFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938900; x=1788543700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VY/z5JBReRe7jugNdwruzvn3FKO8aDoyDfCYUNRNB5I=;
        b=TnQ6dnsEyTm1GicgDActZnBeKyUDqyGFRuPhSCJbbyCRuikn0g+plm4GNnYH8ATGMc
         HS/htaEAfjdmPWdlo+uYLld9AL4K/ckC9sIyRF0dJU9kGu674eEOpjpt6O3Ae4y1fqo4
         DKp5rWrwmlIruzPiv2aG1G5Xm/9KGdWud8DOUs02f98EmJNyrrARkH/TPV1eKE4iE4zL
         Ezv5SvNdSG8Rkab4XVieIBzaPlLwc9j0DCfPgD180EBhd3VoIaxvgSdnlAPev0s31YM1
         63nOPAjhJRWaT1Ze8k7AOnv6l03iVgdKiKNCPAVviNibAAa4lHWI9ZhfzleszoLqRaCE
         GtZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhbqOoMnQvuHgJvJ2P1pgLa835LxeDywYe9nnnLTDPqlF+09l1vbVnUguDfOUc8mriekeZk4CKa6zQzvU=@vger.kernel.org
X-Gm-Message-State: AFuF++l5QPz0ulUveUoMcNQSsu3ermVSI92lLmC5hkiRzW1GR5zUZa3j
	TJ2/VL1Xw/0z1IS63D/JMrnPHeiU5NbXukyYncYDJZJGLmiqaO9YW675
X-Gm-Gg: AR+sD10O063XpEYuh5AnWP7MCNk+3YQw4GBmzy6nR9QlWeJh8ZSAJf6dQ7ZwLqewj1e
	jM8+e305MWLDbZRaJRuX7vr9Br6AwgZ1w0+bFwc38ue9+vMwIj/V5rwuJDbOthIEfrizFiTdFbO
	Kb1XbYw+oA+Kr3tc3y4LByX+dV7wDqvzimPJZKuhgV+GW7D3DfuYgSwzUPhKrQEeFifR1zfArYw
	ug3wNX3YrxziNvUBbQNvYP3p3SY03j5hLsEbk+13nxDNPsdq+L5XFTha+g93RObb1jlTNVlryFT
	wotUtPoNx0KH+jI4bfVSzm+qzFQuERgj9L6dt4w/wvRfRU/Xdd95IHoMLqnNczqddWH7+shBQzL
	TTjfVhPW9VAGli/Lu82wz1lV5MUCMm5+a/Zbx1IzQOZxeG7IW6Gk6nNYnz1lKvcrwANxamkAOq7
	xOYqDJcjQrwSDmd0GDVIENaDi+CGGJ8aqUtvffkr4RoH/QU1iLwde0HMj2hzEpc+9rVSY0V8mrQ
	EzUAjTNBECSi2XpvHpXyFNov5bP4CbGlShjJzIU/ZZRuxGPmKl5MNeHCLDydEDtaNvmOvptmAJg
	KCYrajqTSZZUSJ6SY5fUCcgR/SsfsIoSvgAD7C8ej8AYNO3Vs4spZrQKpMQddcjjn8QwEZFyf9y
	PzlyU1D6WTp2gug==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr113822085e9.1.1787938899423;
        Fri, 28 Aug 2026 10:41:39 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-af4c-3c01-7c51-03f6-0452-bbca.310.pool.telefonica.de. [2a02:3100:af4c:3c01:7c51:3f6:452:bbca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm76193605e9.12.2026.08.28.10.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 10:41:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: mm: Fix the lockless page-table walk in show_pte()
Date: Fri, 28 Aug 2026 19:41:31 +0200
Message-Id: <20260828174131.46825-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

show_pte() walks page tables locklessly and can run with interrupts
enabled. A concurrent teardown can free a table page while it is being
walked. It can also clear a parent entry after show_pte() checked it; the
regular pXd_offset() helpers then reread the cleared entry and can derive a
bogus lower-level pointer and fault again.

Use the lockless offset helpers with the saved parent entries, as
gup_fast() does, and pass the saved PMD to pte_offset_map().

For task page tables, arm64 selects MMU_GATHER_RCU_TABLE_FREE. Disable
local interrupts around the walk to hold off RCU-deferred table frees and
block the tlb_remove_table_sync_one() IPI until the walk is finished.

Place the IRQ guard after the header print. This does not make the output a
consistent snapshot, but prevents the task page-table walk from
dereferencing a released table page or deriving a pointer from a different
parent value.

Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Move the IRQ guard below the header print, as suggested by Will Deacon.
- Use saved parent entries for the lockless descent after testing exposed
  the separate race in the regular offset helpers.
- Retested with GCC, Clang and Sparse; expanded runtime coverage to
  deterministic and randomized races, KASAN, 4K/16K/64K, PREEMPT_RT,
  and 50 native/KVM Pi 400 boots.

Link to v1: https://lore.kernel.org/r/20260815211316.974-1-kmehltretter@gmail.com

 arch/arm64/mm/fault.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..75c3e463df2e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/hardirq.h>
 #include <linux/init.h>
+#include <linux/irqflags.h>
 #include <linux/kasan.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
@@ -154,6 +155,9 @@ static void show_pte(unsigned long addr)
 	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
 		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
 		 vabits_actual, mm_to_pgd_phys(mm));
+
+	guard(irqsave)();
+
 	pgdp = pgd_offset(mm, addr);
 	pgd = READ_ONCE(*pgdp);
 	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
@@ -167,25 +171,25 @@ static void show_pte(unsigned long addr)
 		if (pgd_none(pgd) || pgd_bad(pgd))
 			break;
 
-		p4dp = p4d_offset(pgdp, addr);
+		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
 		p4d = READ_ONCE(*p4dp);
 		pr_cont(", p4d=%016llx", p4d_val(p4d));
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
-		pudp = pud_offset(p4dp, addr);
+		pudp = pud_offset_lockless(p4dp, p4d, addr);
 		pud = READ_ONCE(*pudp);
 		pr_cont(", pud=%016llx", pud_val(pud));
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
-		pmdp = pmd_offset(pudp, addr);
+		pmdp = pmd_offset_lockless(pudp, pud, addr);
 		pmd = READ_ONCE(*pmdp);
 		pr_cont(", pmd=%016llx", pmd_val(pmd));
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
-		ptep = pte_offset_map(pmdp, addr);
+		ptep = pte_offset_map(&pmd, addr);
 		if (!ptep)
 			break;
 

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.39.5 (Apple Git-154)
