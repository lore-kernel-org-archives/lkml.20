Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67413E0C68
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334372; cv=none; b=LTYMRGq+SS7CBLWvZu6nB8XNUWoh5+YamqpviivZKDzf6OBe6qZ6gEMgmfUaWgPSvxAvK4W3Gn6qjEdLUOvT2PNPE9nbgHbanLEFxFyykjf3rfCQgo7mnSUqpZUezFATGKLqNZxHLT0agTYw0q2DaqEO9f/fvcHpW/GgNjd8JPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334372; c=relaxed/simple;
	bh=sSy2WFH17+09Ag7fXYDKW/ARjxfJxT8aeCAfz6vIU4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fefpcOooAx7i/883ORCiyNPWRm2tpXJfFB/korrjNO/Nmnx928uM1mxuxzDHGjnV/AEUXACqF1Ekn7YmjBY57nHGSfvy0wkqYxtobUCoRBN6u7S7c+EHW5DhMe71zinUq6GQWFP+KEkk44X8hp2BUD67lKc9zgpJA+FncGAcXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkR6E371; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkR6E371"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so413735a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334370; x=1788939170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vi97MWhfZddiqmimgtB8vYuipDLussxDN6BUz0TYMFc=;
        b=OkR6E371F5QTwiyMVOi74YMEqnjJubuwm23w8W0raQDCC3VWnn4lsaVFHU6vSvLnH0
         26m47D9+vz9iWGeeq8ODIqlhhSsH9NoCg5qcjd+gTLscibgXuFj3CogRoh9LHZCOkMn0
         cdjh2QmQFqZYGK6KTu0rHpQEow/ICXFDP31Sbn94tyTOh+lwqDSB1XVN98MC6NwjeumL
         KbU1HioRStmkV9B1V5GY6eJPwneOgmMa3O7jBHz3EgER8t5KC0MlYhKCVq5uxJBVLsNB
         tQdt/XmytHzRXT/9zxONyji0inXFPHIdGCdbXdMAKKVY8DhnOMoO5426vxkJV3RJZ5wM
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334370; x=1788939170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi97MWhfZddiqmimgtB8vYuipDLussxDN6BUz0TYMFc=;
        b=aScqx7dekQgeku5qjvU21GD4jTht18QWEY9kB5y6tBcOOBNPL3Z0MfjuHsFEOuFo9Q
         S+jccf6U5LQkxhLrUDQJyQplNs2a4vkrk8uMEi/jrSS4p3B+QEqMtct1zau3p6PI01Zc
         wOhJXS+efbpSSlfQcijAG2klZsGDp3LSRNeF5gtw9KB+LwdklYm6JMYab3XCXNDlAAhD
         aFIFk8yM+NFIWotCqJPZZI39WsJK3sIqe8HUbH7I4IBx9Gvh4vvrhWCNx5R1/jiW+wOD
         Og910WT92V1e5a2wAONcxBtTk5ZF/D+fiPCGZdJvivXQztSpU1HVDtFyEpr4Dji9AaxY
         1J/g==
X-Forwarded-Encrypted: i=1; AKwUvBx/PYjJpB371AFXuSO7mI/SkSN2E2pFBXs8AFkzdaRtVxpqFeYJaxHqXKecGU8iVzBQKekKK3Gr8Uw8ilo=@vger.kernel.org
X-Gm-Message-State: AFuF++mfQBEiFy2oWAvPvHWI0mBzXSmGG5SWDuUfq49RDTSmRNPy283a
	uxzcotQa52G5Y2db3FhEny8QhKYrU6YcR1TOtiQfd50UeAU4zUX6JKr3
X-Gm-Gg: AYBFou08jlk9vR22sPFpAArRVne/aYZgK3Al6tMMoHXzfw4h0wJzRhocOfvPSpBKZtx
	G5tswYGA+H0bnw46OOmeyIgpw/YTPts2rFQVV0WZEQWFBUhYoaAS3qUUTjk6Kcpg+4WJ4Bw5dA+
	WLnWBsDoqhVRruNBQimbrTXJBbKb2Ji2nLVEJL8AqR5VC/hquDG1EzwQ8GFgskagOOrKK48yYtW
	FLaLobn0CZgAPNKT9ilkY4VQgQOil/D16wvNN2e1ajCDYQM/RZI/OcoXMM9XCwk6S+kbacvnNeY
	GlsfHbANWoBce/HwxStIikYOE41qEbbv/tphSyapo0GJ9Lbiixy73oAiwxSk1NCebf3bFvhSTQH
	0aRHSR8CO7Bg/usRLzBAcAR44alqpk0td+7pemv84W7vRMf8aC3ajHEfrB6EGcz6kI8braTNalk
	l6S45PPM4eC+awxmVAmLbtenxyVqKA9UhQziUje77FJ2RL7oLNQWpxS5fHlWENMMlpzVLqD3Iv
X-Received: by 2002:a05:6a00:8017:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-85ed398adccmr5532767b3a.16.1788334370199;
        Wed, 02 Sep 2026 00:32:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed,  2 Sep 2026 15:31:12 +0800
Message-ID: <20260902073116.802752-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory and /memreserve/ entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..b2fcf11fba2b 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index f2952d725c10..2e87f39826dd 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

