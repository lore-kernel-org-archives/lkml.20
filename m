Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883A2D662F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849077; cv=none; b=J291GflR5mOTI3er2itw5NYe87NZ8RMSRDVWo9pYN0wjvoAWl1n13yHgcoU97k8nq8flb2T0yyS8AVzhkMjJM5wYYowAWpBBUttMBwSnkzBFkuSSBqw2sMynoNY09TtQ7dYMY/x+pZgg+YOdWwgvtVSLjeTww5ZTt3R0Os2cW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849077; c=relaxed/simple;
	bh=LFMNzqUI5j3XorhtaPRlaLPyBA8hl3XXmpLbCx2lnwU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=irwBEuFM9TiM8RqUX5Vgz8ypUV7V45LvSSTlMueqaPJMMJOvLAiTCifTADcc68gLRAU23V4Dzk/ivCiSGmWOJWwFqoWgG3EY8PKj94yNJnxnhKJNzUhvtqVHKiuxrhmql9/3sOyz/z6ODv+er0LXONC7dN0CG+jZb5BGpJoxM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYup77Hg; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYup77Hg"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48000d75326so12802f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849074; x=1788453874; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJiY7FvuPSk4vmkG+0TxlMWylcjf3Tl2Za7dTctMfp4=;
        b=pYup77HgLIOL9y/DZz9Yui0kJovHA137bnK/kT8NX4dlltmcSCDvMri/rcAWeSrUVI
         7lm5+GBQDbL2d+lCxxchIXv87JA9aC+JcpzlGTncHUiF3kbEzhmOEyCOG+nXvazaNGzk
         loRaA+l/XXdlQcOsFFiqzvf0r2lfMJL2UZD99xbTl5G2LA2rbcYLYYlkXAtmRUvhcfSb
         6Fr1guqZq6f0KFbZcB9plEpdZMzTsMjWy89zudPXBq2ZYy/VDiKhVIl6qVGCkvjXrbbu
         RpmkC1XHOzPA3oGdS8tnzdwZOGxhfzXNm//81td/6eGzKYxk2E+wAstnhbsxUEfh9pEq
         HNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849074; x=1788453874;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJiY7FvuPSk4vmkG+0TxlMWylcjf3Tl2Za7dTctMfp4=;
        b=kEFs/TmJsClYuui+qiB3AW9mFf7pfnk7F3r3Be8RT01nJ9VxwoUyzumWsQKqBymXz+
         M1FPFUbVeQfAdeEW9SWWsdqQkU3g9pao54/6vNFUOcDvFFexArjKfqZp6HckJR6LBgBo
         8DLgf+fd+dYVa0hC6xkOyr94ZRBn5tJoJ2Pxl+bOU17sK0LY0ulk6zs0FHa623ULbz/a
         h35zgv6jJ24XzIgoDtBX+AVJTt0O7nM6wQzN0oJoLLzLphcUhPm7wbzMbBcncZdZBYGr
         mMMgNjISoWqoDy4A23TjZAp2rs4WIxYQdPBi5S1v53dcCdCqgdRNbzD0IChLntQzCphH
         LdLw==
X-Gm-Message-State: AFuF++nO1rU60oqq75JFUHcV6neGwLux5ymKvFi/r/vSYdfQk1ta6Sm+
	mxfcGJXSq5D8nGbh0Z9p+3CokRaagJklwFPRwSuqdF4riolwtOkWriMiJwNDiTLcJz7GQNLtew8
	7KzK1v6agUR2GyinDfF/LUxkOx0Kw6C1y9NtgmlX+tLQNlhB8H0KKwsA4AIz5AF8PCNQKsKKW7A
	WwTdqdtfn6f+k6cuVxhVT8y0ScbfyGJtTvhw==
X-Received: from wmbz8.prod.google.com ([2002:a05:600c:c088:b0:493:d1ba:af39])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8581:b0:499:a760:722f
 with SMTP id 5b1f17b1804b1-49b91c47bf8mr2996215e9.13.1787849073998; Thu, 27
 Aug 2026 09:44:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:13 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860; i=ardb@kernel.org;
 h=from:subject; bh=99CV4XPf1Je/vZyhxqcfc6DlqZHXzUdS1hB8ZXFmVcM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZtyKEpF9jaJhbA6KjNMV+X7sWlpw42m3Y2rLLr6CZ
 65/VmV3lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlc2c7wP25nM5+wTNEvn7/T
 0o0Vp62N/qPHaDNpi5/dLeX3l+zi4xn+Z2mUsya0F9QwvRRpyU87wZA/88cZ0YzQtSvq/mbLrJn CDQA=
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-9-ardb+git@google.com>
Subject: [RFC PATCH v2 3/4] arm64: mm: Create r/o page table region that
 permits updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Generalize the handling of swapper_pg_dir, and apply the fixmap fallback
for page table updates to all page tables in the .rodata..pgtbl section.

Currently, this holds only swapper_pg_dir, but this will be expanded in
subsequent patches.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 -----
 arch/arm64/kernel/vmlinux.lds.S  |  6 +++++
 arch/arm64/mm/mmu.c              | 26 +++++++++++++++++---
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 799cd9d52c28..de0a07dae83a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -817,12 +817,6 @@ extern pgd_t reserved_pg_dir[];
 
 void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
 
-static inline bool in_swapper_pgdir(void *addr)
-{
-	return ((unsigned long)addr & PAGE_MASK) ==
-	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
-}
-
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..2cda0b7c41d4 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -243,9 +243,15 @@ SECTIONS
 	reserved_pg_dir = .;
 	. += PAGE_SIZE;
 
+	__rodata_pgtbl_start = .;
 	swapper_pg_dir = .;
 	. += PAGE_SIZE;
 
+	.pgtbl.ro_after_init : ALIGN(PAGE_SIZE) {
+		*(.pgtbl.ro_after_init)
+	}
+	__rodata_pgtbl_end = .;
+
 	. = ALIGN(SEGMENT_ALIGN);
 	__init_begin = .;
 	__inittext_begin = .;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b97e4bf99ca5..dad482d66f17 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -65,17 +65,27 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
 static DEFINE_MUTEX(fixmap_lock);
 
+static struct range kimg_ropgtbl_range __ro_after_init;
+
 void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 {
 	static DEFINE_SPINLOCK(lock);
+	bool is_lm = __is_lm_address(ptvalp);
+	u64 pa = is_lm ? __pa(ptvalp) : __pa_symbol(ptvalp);
 
-	BUG_ON(!in_swapper_pgdir(ptvalp));
+	if (!range_contains(&kimg_ropgtbl_range,
+			    &DEFINE_RANGE(pa, pa + sizeof(ptval_t))))
+		BUG();
 
 	/*
-	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
+	 * Don't bother with the fixmap if .rodata is still mapped
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
+		/* no fault should have occurred for a kimg address */
+		BUG_ON(!is_lm);
+
+		ptvalp = (ptval_t *)__phys_to_kimg(pa);
 		WRITE_ONCE(*ptvalp, ptval);
 		dsb(ishst);
 		isb();
@@ -83,7 +93,7 @@ void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 	}
 
 	guard(spinlock)(&lock);
-	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
+	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, pa);
 	WRITE_ONCE(*ptvalp, ptval);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
@@ -1177,6 +1187,14 @@ static inline void arm64_kfence_map_pool(void) { }
 
 #endif /* CONFIG_KFENCE */
 
+static void __init record_ropgtbl_phys_range(void)
+{
+	extern const char __rodata_pgtbl_start[], __rodata_pgtbl_end[];
+
+	kimg_ropgtbl_range = DEFINE_RANGE(__pa_symbol(__rodata_pgtbl_start),
+					  __pa_symbol(__rodata_pgtbl_end));
+}
+
 static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
@@ -1189,6 +1207,8 @@ static void __init map_mem(void)
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
+	record_ropgtbl_phys_range();
+
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
 	 * the linear region is only possible if it is guaranteed that no table
-- 
2.55.0.887.g758fc8c411-goog

