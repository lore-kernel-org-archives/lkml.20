Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0A28150F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986912; cv=none; b=UOALkSp2qBJ+NPmeJLqCDWcRJ6Sq0HoeR/LB0XN7MPnWGCYQZ+hImiFY2DkUvwuriO6qEEA+o5ykpnXXLXeqtiOqgItNBAB5mY9oB76yqz35X93U9bkCgLqiSa8M9qpdxpQxu/35KWtIKnhFERPjgTQVg6xquvlLrtUUCxV3Exs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986912; c=relaxed/simple;
	bh=jK+fM6+CK6QBqkaI0MxN1PFLL9hvpU8fiUgVJnHFU8s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dzy4+JFKTI6aMvR880UN4kiDQAxDJRhbCgnAMzpE3gE8jhs+FEHQYRb3S1HRH1OH7YNJfHj2VkjhKTDUZ6Anc/dYqF+fRLFZqwbYtrnY95n8wQNpSHr6TaiJ+yu1/VhNjsDxw5AazEjJ1mBHTn59JDU08IohfldCeAGoKjOxMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f/PDWr+s; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f/PDWr+s"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768885b0so76126b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986906; x=1791591706; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVvjhrnHN0xVzOU1sGetn/TIp5Cpe7kDHcSDZkewKqc=;
        b=f/PDWr+sPgi+ZBb7S3mHR/nvF9hwV3l34Y3kHcKjpU4WVYfQXAzxLykBX1MBvitW57
         3i0R59V+P7+eR9TlbZkEEMa3ChMkOMjdqjrZ1nQn1p7ZQNrtNjFwiy4xT2IofJoRLLdD
         wbXdBalTKfq54ju5l9HqwXntqoNo0W4aEk3EjtXTH21RPOr0dVKpNljVrQSa1QejtW39
         sDr9Z8qUNraaJEev7idcNZrbfDrRFg/K+EKDGS4ogrFxc7mp5UFRalJQ0UanIixLp1Ly
         4SZCYWrNntmzxs48eECGptZNuOlsUP6wMd2Ewb5LaHwB8LxtvjRiPr/7yKM77HYZYgbW
         t5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986906; x=1791591706;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVvjhrnHN0xVzOU1sGetn/TIp5Cpe7kDHcSDZkewKqc=;
        b=NTaEOmRf0nGfcj+VGYcyJgudOs+y9ziKYYLIJtpjO2Q5xBflI4MRkjRcPZs6E2r39C
         q5zcIFa2Fuhhhq8Twyhb4q47J0bMI4BBdzndTDS8wrGcY8n2Xc1uYxs1HwLpmFekbuXk
         HA7NY0h0BtTT7VofiTkDqjGi3g5Zq3a/eOqVPRwG9Y5sKgTlbYseLjCyFFlsTyxvBV02
         iRDiyVR6dih/5KT8pQD63CxJfX1ah2/QAIaQwDn68W4YuYZenPSERnFnn4ZzzRnM6/vG
         ShEenmg1uclcdFr13bTr2umGUIyPU9oAK7SadxaQMYSWJcBL2EvfhqJ3izQf2YtGI5Ah
         qBFg==
X-Forwarded-Encrypted: i=1; AKwUvBz+Iw1HzhJlnzXcBasjxFtLsrgjzp6p7DI7voaDnfaP9RjjzHoJ4MbrmUYdAqDJAlDVASUeOsb+6iNlojk=@vger.kernel.org
X-Gm-Message-State: AFuF++m0rimP/3e1zcQwPvCLjou0ivdMHrzTrCxgQFYKsNp1XwPJ35QE
	47ZVcFXZENo6Ri/8tI1KUAU8/iAOUb+yYXzXQJ2VnICeN3W0sLSweieKaw02VS9ztLgAbm2j5LE
	kEtTN/mie66YgpnhhEjDo+w==
X-Received: from pfbf1.prod.google.com ([2002:a05:6a00:ad81:b0:872:9706:205a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:138f:b0:878:3783:8a4d with SMTP id d2e1a72fcca58-88af5ac19ccmr4135678b3a.53.1790986906132;
 Fri, 02 Oct 2026 17:21:46 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:16 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-14-jthoughton@google.com>
Subject: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Support HVO if HW AF and BBML3 are supported. These are the required
features for the vmemmap to be modified in place.

On arm64 systems that do not have the required hardware features to
support HVO, the HVO sysctl will not appear, and any attempts to enable
HVO (either via the command line or via
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y) will have no effect.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig               | 2 ++
 arch/arm64/include/asm/hugetlb.h | 7 +++++++
 mm/hugetlb_vmemmap.c             | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b51d23a62c92..e4c87487bc7f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -92,7 +92,9 @@ config ARM64
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
+	select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index d038ff14d16c..938d7896a31e 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -11,6 +11,7 @@
 #define __ASM_HUGETLB_H
 
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/mte.h>
 #include <asm/page.h>
 
@@ -65,6 +66,12 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t new_pte);
 
+#define __HAVE_ARCH_HVO_SUPPORTED
+static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
+{
+	return system_supports_bbm_through_af();
+}
+
 #include <asm-generic/hugetlb.h>
 
 static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c1c736dd08b9..fabf2b25fe59 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -85,6 +85,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		/*
+		 * On arm64, this requires BBML3. Its support has already been
+		 * checked.
+		 */
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

