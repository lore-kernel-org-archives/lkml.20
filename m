Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63763E7BA8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444659; cv=none; b=W4ey9NV3ur9FVYEb19c7gTagZFStaGEgcuiN+Kzpy1uDRKiB+98vJQu13b0J4zWfUgHhlzgviTZE7LHIJVOTkjTzNDRG29H7C/Rc8ZekTa2dh0ZgW0CD2wsx/skuj4JUxvwLQOX9F0SANH8CvUQH2k2AfrPh0u4vite4k/fMvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444659; c=relaxed/simple;
	bh=INyxVPnKC83MyO/UHZgCMkoyzhnaiRcH9H5tEQTZslA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBAbmHqb29evnccpAwcG5yWOpGf73GTHui80DTdwlJrZeD2LBKIWSfZKOq1dIYj78wKWzJK+z426ybZHucNO1EMMjP3NAJpQr+5L7VHb8PhwvAM8Y8lv8biOlgb230uocNZWz1dWJAPNarndbVWPNtacC3jInWVB5vBfUouol5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dk0ej1OR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dk0ej1OR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e576377715so25811945ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444647; x=1792049447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=dk0ej1OR+wutMc4RAl2Yc737vqCb6Nm11de5vq8+s0Pd/Us9n4y6Au8epej6ku9mdu
         vSdtCF6BM6pefIVLyB+3I0lglQpIz8ZR6q9wWsLy+LZbYSJ9vUSRVr69SMqRz2n5f1gm
         pOnXvY0we/DOcqi4AGqELOT8qEuDfMeoH4gbp66Xf+pU/vvHbWjPCa38xpuDr/x7GagK
         Oxp9C82zF/WNP49XXE6DCF5urI0vu2pWgiGNipjGw6Jiv6P01R+DuKX2FifXwTpSKddn
         fw7sdJXBcLJCykJESD3YN4L+TuA/eSH+4KfAhwMp58fetw0RPWox/1MYfA8jr8O1k0z/
         DXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444647; x=1792049447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=M5gifNwsJ/BhHQASSNqDt9ky4n6IrFYR3e4bBjG/iG0i9AY1T9PXruhbJTVxxMJUtQ
         0Up1+uNujY3tYl76KTZUDIBxGmxAXLkRtBIFxfIUYGlJ1z5CG6H8ERV3mTPlYN/BOewx
         ZLAH589EiMNOk0byss4U1KhdL/fH7tlPacT005IJsSBK+CPm/jd0aG5+Un2UErdKbyZU
         x/H5H4VstMWTaxRlcwkCSlsKuNsk3eUO8Q/YV/MoXxZn1/v3FW1/L9e5YKZgWurzswSF
         nSpYMmFHh1VjKyAfTwdbCzApTwebAQInxAuTHM0mURd0wn6VAXtwIucHrqodUSvBOQxd
         AZKw==
X-Forwarded-Encrypted: i=1; AKwUvBwBltLqFyqceMhLWzj1yhPXKlTj6o/WRxaAUWhpn8Rtq02bwf+m9yTh9njIyhNbSJyciY1yg3x5MOvsmB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvKdSP8V6xCKNZoZrkDIJI0xmxiZoQUXOhPZ4pW80iGZtaRIfd
	6cdl9K//pPGTlQtcCZbybjfQBGUyn+RbdZuyFoayghQOqpZxAmAxsg0IRzJW6YG48us=
X-Gm-Gg: AYBFou3/trplmLc2x+3ri06WKPnrLc+eD+dbeVvSBryUpQle54VU1W0KDhWZQJkaC2I
	tWU5DuWJqgxrC8Bv8tGdVDF4LkQCZTKqpsZ9myleljPN4doyanOtCL7BsKrez9GQzzo4AFbTyIY
	fPWA8VwR0PkZHxEEAu4zZq6tvzwpvxEBcfWxYzWYjfDwMh2Xa1g1RApsSCgGt4vi/Z9p3X7q6Dr
	1OMlmiKD7Nc+9UXB5E7NXiI2V3qFxh3diDo1qmhd/IeMXTVUD0eFkZpXVMDmBft1ZWZJtIc+w+y
	L8Y7tHqIBfMM3GMOPpCm+w6oaCtJNOkVtl89XImdF/SL5FZGvYL0zezjLYndSTBW2ZhxAOWsrQb
	KhFGApW4BnzXPMKrYniUaj0kliCSr1fwdXQAwFLQgdumFmIHINN1Nyq8HlGmJe5BoYU7929BJoC
	CLbM/wQGmUkHcVgVziWgl8HjQHohzz7oukXfuyAYy8R7jJfo3EpuGD5A+Zbg2Ir7uzih1/zRceA
	1tXVS1fw9f7G729wEs=
X-Received: by 2002:a17:90b:2652:b0:3a7:b260:9cc6 with SMTP id 98e67ed59e1d1-3a8a1b91be4mr3069089a91.42.1791444647313;
        Thu, 08 Oct 2026 00:30:47 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:46 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Thu,  8 Oct 2026 15:30:19 +0800
Message-ID: <20261008073021.2512665-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V uses the same memory-hotplug teardown code for the linear map and
vmemmap, although their page-table pages are not always allocated in the
same way. Late linear-map allocations run page-table constructors, while
vmemmap and early allocations may provide constructor-free pages.

The PTE path unconditionally runs the destructor, which is wrong for
constructor-free vmemmap tables. The PMD path avoids that problem by
using is_vmemmap as a proxy for constructor state, but that assumption
will no longer hold once runtime vmemmap allocations use the normal
pgalloc helpers.

Page-table constructors record their state in PG_table. Centralize
page-table freeing and use PageTable() to decide whether the destructor
is required. Keep reserved and constructor-free pages on their existing
freeing paths.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 857f9a55039c..429a0b015ec1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1486,10 +1486,19 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pagetable(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
+	else
+		pagetable_free(page_ptdesc(page));
+}
+
 static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
 	struct page *page = pmd_page(*pmd);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pte_t *pte;
 	int i;
 
@@ -1499,18 +1508,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1520,12 +1524,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pud_clear(pud);
 }
 
@@ -1645,7 +1644,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0

