Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9AD3D9524
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631955; cv=none; b=l0IYTuDbHtOGUhgm4GNpCNi4q1j46Z5fHasBz9WT91g7JSWYRCd0AcDeM/Txfqnm34lvwvaZ8tqclmVJCXn4M6ASJeFG2hJLvNBOR9hqdCevcD+fJjuLicPoyekuHS17py8RTi+K0pGRSVnjQdTlyXbTUDrE/HyNacd24qdORfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631955; c=relaxed/simple;
	bh=7Ik6RNXht4CE7m8csmsavzcBqjTJ804Tukv6a6/SmPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCWopJcFiC+CCK3P7Rv3AkTF1hm2FkARvKq3mz3Oj4XG9UekS7aE/G2Su//HUSqo6yope1NgDWjJ23NSIYlfUX9aSpvYUIXf9V+iXCkF9ZHSaJ5HCHhqVC6D0o+R1K3uIbLMfdqn2PHPkqfoA3OwbhVJxzZ/bpgRfi5T3xSlztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koDBfnii; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koDBfnii"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so864998a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789631951; x=1790236751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xSmWH+6AZu6fZ1/csJcotZOXMdRtqkzNiwAxVzsnuk=;
        b=koDBfniiRAb1SrViwvc2llyeA09meUM4MoTsKp+vGRMsDjg8MEOTf8yxHY9KWgytMu
         uD/ud6Cnxojrsq+KoAnK8KEtXldcxJ+7/noLcmslZZnkcQnJlEm8g8Wg5marGlGsUgeY
         jcXHGpgAPOUXtoApRF1kYi+iTA8fc7Jy2gyJnksTYVRqrxeS6pOXlKCiq9qgzFgkjMPY
         IWXdx3N6rCSBYWelf0X3RdHVr1jV46VXTQ7kkccbyL5hkSlIaEdq6Ej/m+I/Nsq7mYQC
         EdirLI88gYQMvE587tOlAwTyC0EgT+NUWM/op/xLbYsmtTCm8x8XVRYlS5jWoQMzzEBi
         a+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631951; x=1790236751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xSmWH+6AZu6fZ1/csJcotZOXMdRtqkzNiwAxVzsnuk=;
        b=j6kg08mnbbMzN41yNRJzUWgFaiPv9Ob1Si8LOkpjISGYJlxb5SDs1rJmgyYY2YzhHJ
         jjYNbLgJGQozDQBnAQkELqdyw3hM5p7wXYtOKYHMxX7WDNwJ5EgB9do0XjrT4/G+lrKH
         xybKGtTdEPm/o5Y6gaJKTseA/9RNxmt4N6yjQp4BlryVDYuB7TDlEpwg4nFh8mFuRh4C
         VrpiOn7IFQC4JZHh3N2QbtMdCHdD4zr3igClLMg30LZLodB1AdY5qFHwSjWy3rdP9IgC
         Sout8GWPc+HQr2I5YQTO6xJ7SuH1OseAKaGeLKFyWEB3e+RcyzbhWIQ1n/YylzQxTHMW
         7mKA==
X-Forwarded-Encrypted: i=1; AKwUvBxa6uextjHrUjrayDuiIWEKla+lk65KT+mMMon9uESk+7jugG7Wy7PSUZwXtyOUcwKZ/hkBnRWGvqHAmwE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIAxKRva6E6aruZmk/636wkDx3iJ+VIGanuHTfwgRZb+OW42Nh
	zp8sfMOfu2wAHCFRiWLoPK2tVWPX7aNN07EF9udgwnjit9tFt9eJMRCv
X-Gm-Gg: AYBFou2PFDkaYfHeKVqzhe+tMw6NLBhquRd2MHUCXo9sOSZdZ2P7tRtqbaIisvHjHV9
	Mhw2eL5ui5HvAcaGV0VnK9qqlUdeBXHAbPpfZ6oB8fBf3PuCQuUjhyHLp86EUHQZqdETsuJKLtO
	2towyFSEKzb9Uw1xhShQALyJLXVacMIGUuv0foeb7PwH0Bvna0z+I0fC2t3+jZWXxSCry3fdec7
	wmT5eZyFk0+ymi3MBUphb+mClAzHkrrPK4YzNJ/md5XKw1xlRxHQEI3+st5EZ1hwSYGHcKMr6Hx
	sMw8cQdTAzXvL4WSACIIpNbvTpaymtLk/2WpdUmvLkR2HnNagYeKO7HEtCf3dkYxeeVb9f1sUEb
	GCet0gJRXv3sGNc1hiKJiUZHhvXdEPtQ3obmnoarVBh7R9m+/2GADtWDfyz5D1/MZL9bsHyaBy/
	KXoqYlY1t2UbIR7/nvFky+L36goCAiaUMkrpuD4dD0GWpyd86Ofp1Wtssxxq/3d7jSK8vP6WsA4
	TrCGtSOWDKm8dM55NmiqOc+qhQgDi0DzlULtlf/kE47xTCRt51S
X-Received: by 2002:a17:907:c49a:b0:c25:8e53:45ca with SMTP id a640c23a62f3a-c29e52bf59bmr597546566b.21.1789631951489;
        Thu, 17 Sep 2026 00:59:11 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453ea0sm250287766b.11.2026.09.17.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:59:11 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v2 2/2] sparc32: synchronize SuperSPARC instruction updates
Date: Thu, 17 Sep 2026 09:57:05 +0200
Message-ID: <20260917075842.784996-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917075842.784996-1-linmag7@gmail.com>
References: <20260917075842.784996-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SuperSPARC keeps its instruction cache coherent by snooping bus
transactions, so no remote processor has to be told about modified
instructions. A FLUSH is still required on the processor that wrote them:
the store buffer is not snooped, so FLUSH is what pushes the new
instructions into the coherent hierarchy, and it clears that processor's
own pipeline and instruction buffer.

Two Viking paths performed no flush at all.

viking_flush_sig_insns() was an empty stub, so it provided no explicit
instruction-update synchronization after the kernel wrote a signal
trampoline. Implement it.

flush_icache_range() was defined as do { } while (0) on sparc32, so it
provided no explicit instruction-update synchronization after the module
loader or a kernel text-modification path wrote executable code. Implement
it for Viking.

Both operations remain local. Hardware snooping maintains instruction-cache
coherence on the other processors, so no remote FLUSH is needed for that
purpose. Retain the existing Viking bypass of the SMP sig_insns wrapper.

Safe execution during a text update is the caller's responsibility. For
example, the module loader calls flush_module_icache() before
complete_formation() and do_init_module(). KGDB normally requests a CPU
roundup before modifying text, but that mechanism has exceptions and a
timeout; it is not an unconditional guarantee that every other CPU is
parked. A later cross-call cannot prevent an old instruction from executing
before it arrives, and cannot by itself make an otherwise unsafe concurrent
text modification safe.

The manual is explicit that FLUSH is not scoped to the address given to it:
"No cached information is explicitly flushed by the instruction ... FLUSH
operations simply cause an exact synchronization of all pending activity"
(section 7.4). One FLUSH therefore covers however many words were written
before it, which is why the two-instruction trampoline needs only one.

This follows SuperSPARC Family User's Manual sections 7.4, Flush (IFLUSH),
and 10.2.5, Instruction Cache Consistency, and SuperSPARC II Addendum
section A.8.2, Store Buffer & Snoops.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/cacheflush_32.h |  2 +-
 arch/sparc/mm/srmmu.c                  | 10 ++++++++++
 arch/sparc/mm/viking.S                 |  5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/cacheflush_32.h b/arch/sparc/include/asm/cacheflush_32.h
index 9fee0ccfccb8..4249663efacc 100644
--- a/arch/sparc/include/asm/cacheflush_32.h
+++ b/arch/sparc/include/asm/cacheflush_32.h
@@ -15,7 +15,7 @@
 	sparc32_cachetlb_ops->cache_range(vma, start, end)
 #define flush_cache_page(vma,addr,pfn) \
 	sparc32_cachetlb_ops->cache_page(vma, addr)
-#define flush_icache_range(start, end)		do { } while (0)
+void flush_icache_range(unsigned long start, unsigned long end);
 
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
 	do {							\
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index ea0cc3683ad2..093c543b734e 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1784,6 +1784,16 @@ static struct sparc32_cachetlb_ops smp_cachetlb_ops __ro_after_init = {
 };
 #endif
 
+void flush_icache_range(unsigned long start, unsigned long end)
+{
+	if (start >= end || poke_srmmu != poke_viking)
+		return;
+
+	/* One local FLUSH synchronizes all preceding instruction stores. */
+	__asm__ __volatile__("flush %0" : : "r" (start) : "memory");
+}
+EXPORT_SYMBOL(flush_icache_range);
+
 /* Load up routines and constants for sun4m and sun4d mmu */
 void __init load_mmu(void)
 {
diff --git a/arch/sparc/mm/viking.S b/arch/sparc/mm/viking.S
index 8b4e251bbba2..92c80426bca6 100644
--- a/arch/sparc/mm/viking.S
+++ b/arch/sparc/mm/viking.S
@@ -201,7 +201,12 @@ viking_flush_tlb_page:
 
 viking_flush_page_to_ram:
 viking_flush_page_for_dma:
+	retl
+	 nop
+
 viking_flush_sig_insns:
+	/* FLUSH is not address scoped here, so one covers both words. */
+	flush	%o1
 	retl
 	 nop
 
-- 
2.43.0

