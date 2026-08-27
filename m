Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65519483BFF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849078; cv=none; b=FaHVcSznmeCFiCG7oOYzWNwHz/05wzcPY231sQq7bkouvdABhljMEbiHIttfL1s7oGJ1dSMgLFab4llXnRdGgaQrXptukjnkKXqE0fhH0/uM12fO6WFgh5HD/OLRtkJOP5iALvtU8fr52JeONCkggjJ93SnCw8CyozChof+c944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849078; c=relaxed/simple;
	bh=BHgZZrHxJq7P0OR82PRXWx26UIoot1+LWqzEJHh+qQw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o6buazB7w4Vv0MnGy/xcbgyDQpInirEFbJsb+SqqPu/Ii6YkqhQwVm59qLEhVKLXG3k7/mRDLDq6+zh2hQTJP7i/nbMFxXb1VNWMtR6jvtHVCfzfjTP3tfg12iSdeCosTtZbYrPXmxnKR7L5Y013YwJjM0njx6T4yOZwIVM281o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=poMc5Ibz; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="poMc5Ibz"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-499a7993a9bso17934165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849075; x=1788453875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43iLPgD5M5R/GHwUlmehT6b7nY+XiShZxegudQN2h98=;
        b=poMc5IbzNL+BiFzbmROn8ZdmS+w2hz7jKZBSrucWmDIoi4UGh9eVHZh4eRvHnvTGQc
         vcV6ZpB/GCdv9b5BiiY/PhlBRKMrAmoNHCzwznny+shlfuuqFZ5diOfCFLgkCVCnD1IH
         oV6wE5CFelexV09VApa9+NQDMJvCnRhSHJtpFTwAHlBy5PRKN6w92bzpiDmbDCuHfEep
         aFQRFNinXa4rVUwaVFLbUqz1qC7DBNPRvHbAKiwPuffif7SJYLiMAvtZXqIg7/5GdXtb
         T2oKdYjFdOJ2ISDAzFkvy6uSupmNC1h5g8Z8bPqJq3WqyW4MY9lhskK5TI3xm/NUatWN
         RF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849075; x=1788453875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43iLPgD5M5R/GHwUlmehT6b7nY+XiShZxegudQN2h98=;
        b=Hk0R6JQ2rwsOT6UvH8mdyq6LvPA+dANJsxd4M63ibHSkGWDSCqJp402ZsFGA2XkGGk
         W/SHXcyn+07b6uJTY6Sdd88wq263zRXo3wPSR8T0ohlWLKl023s1ZqnDlXwiZ9fkoNOK
         JLcdVw7nvYUEGmHKFCuJpjFOx4uU+X5a+MAkx5c2zOvWsc5tbfKAyP4N1jh7bWNWkw2S
         SK7823C+8LEMxbwQFCPzZvjYF1LivRjfhg/zTgd8uvLo7L4FJJuC43vm8uaiMQYOZQ/b
         stpddbkfPz2zNCiFAE+590vBQbDuL6iY8brrPfxISj2IU0BZN1tWtInxiFhkYcgh/vQH
         riMA==
X-Gm-Message-State: AFuF++nqefhmS3syid2Hr95DT0gIWWXvotkj5XF1/2CjewrIuhW2E/GA
	93LO7G2EJIzh4MPBrQyBFans8fX9QWypkgEyi+gnhHVyAH6bE+lYdEyQRQTEhEfNkPpQuI4Whlu
	TRvRB/hKzrZVEiiOsuKQyDgQmQfE0euBukqyLn3TU9x5wQv5U9oZtndUVq0m0MTRzQGI4VNQb5F
	2aImyoP/hM7Um3gotjinhNK9zZOUt7qLM+sg==
X-Received: from wrod1.prod.google.com ([2002:adf:ef81:0:b0:47f:93e7:6c8c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c178:b0:499:872b:abd4
 with SMTP id 5b1f17b1804b1-49b91c21b86mr3254375e9.6.1787849075235; Thu, 27
 Aug 2026 09:44:35 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:14 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=ardb@kernel.org;
 h=from:subject; bh=iWvmUytrCQAfIl3uYQyfQdqp2tLg/jsjNdw7eZtuwd0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZny0jfFXyRPr6kztSk5KTjo11/i5XetD2xOzdr/7G
 G+1bWJmRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI0niG/yVp86bI9mTdPJ2/
 7slZ67LSlMfBb4xPn25vNBcuj2xLL2FkmLDqohFn5pQSo3qWIqvZt4S6f7iXrQ9NKtfmP9f4YX4 TFwA=
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-10-ardb+git@google.com>
Subject: [RFC PATCH v2 4/4] arm64: mm: Move fixmap intermediate page tables
 into .rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The fixmap intermediate page tables are allocated statically, are
installed into the kernel's page table hierarchy early during boot, and
control a slice of the kernel's virtual address space that is not
subject to KASLR randomization.

Combined with the lack of randomization of the linear map, and the
tendency of some Android bootloaders to place the kernel image at the
base of DRAM in the physical space, the placement of these page tables
produces a vulnerability that is comparatively easy to exploit.

Avoid this, by moving these intermediate page tables into .rodata, so
that they cannot be manipulated directly via the linear map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/linkage.h | 1 +
 arch/arm64/mm/fixmap.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index d1f7a16729d2..00963e11ebf0 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -45,6 +45,7 @@
 
 #define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
 
+#define __rodata_pgtbl __section(".pgtbl.ro_after_init") __aligned(PAGE_SIZE)
 #define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
 
 #endif
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 3a8cf6de6a7d..ab0f9ba7b712 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -32,8 +32,8 @@ static_assert(NR_BM_PMD_TABLES == 1);
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
 pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
-static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
+static pmd_t bm_pmd[PTRS_PER_PMD] __rodata_pgtbl;
+static pud_t bm_pud[PTRS_PER_PUD] __rodata_pgtbl;
 
 const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
 
-- 
2.55.0.887.g758fc8c411-goog

