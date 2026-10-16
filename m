Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4622C21ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120218; cv=none; b=Ne32/qF4xry1BkUPPiIQb/JNaa1aBz+ME/MSrl+mJG4YI5cC5SB/j4eCWESGdMVjHJ2d7yV5NKM448irjOD1BDb33U3NKmUdbfiAvH7Wrd9zooA/jmPIGlBIhF8oR8kgWbh1zaOhN7tcjULcphWiaf2j7WE2+NYenOLo0719pVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120218; c=relaxed/simple;
	bh=xaYAGKNR5teVXSTbMIqN33NUXwD6fmITNKM3gCe5N4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0ECGhsb9XWPs7J7lekERi98R70CXAgfn7MyWmiqgORFXu3ShFL4UeAVChTmIshXCTFc9SNjkJZCB7AR++zpFY3mkh6TDr092NGu+MIZpSphkHVUv0ZJSzeCIfsc4ObOCVP77MynXSlUco/ovOvd41INaXxVDvUQOx3scLWFs3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6msrrvw; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6msrrvw"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1533515a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120216; x=1792725016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=B6msrrvwl0YdPSjxOcclkjYeKLnL52JsBNDA3HIrecDpoDsMFnWUrpA7WOa69x3SEw
         J8rqHOKacO/aucqLC9zMSabnE6rzhcSLBk2YalaUKprLGpM4FlWbTRF3qZbtxtgNIgta
         +8pRNVf+yFdJWP6QLgcMm8FOupUSkgAOEoyZnY1BuRgsUqL/iUdinbUYvEs7xtrmGLnN
         808/g2+Bhqfo/pmna3YWDVT5lZLwR0GDCUYGGTK4BKWPU6VrEYGLZz2GgHDqoFVAg6Tz
         y1/CSOFo1xZx6y6EfLbFN22b2E93TlRd+QffYhidwwmzptI2zLopSysW2+BNK/ywXwSm
         zlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120216; x=1792725016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w2trImMBsUXcJxF+8CP2LmtHij/l89KoLcRCpS0ni8=;
        b=xTlTcPEe7jhI5n8LUIKfTYV71J5i4D/D0kGFXftHQBkvXJ2NSDN0ywig4Cq5O2IOZj
         eo+R7R8UOkG/Y/nnyJToWcKwS1FGl4s4Dyu75jLElhpKmntlOhz9hIHCXZgmw/zNkGPh
         aJQsJ6E4EZXhSgynIDeBn6RHDJ3XLyrTuTeApeu66mmTj9dA7FOHg4H8dcSB1aQ9bX0u
         hKFwullHI7//RegLpzz4gbx9+7Lvriw9+31pKyrNfPwKiaWS3iwLMhBRuB1frm3ABoXi
         F9RhL+HN1x8h4IUOhZMST8CS5hZ3F8VwCYfmBzDjUi1/1DnG9HXVnz/fZTTgST1UZnhe
         soUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+iIPQgcDCZVcbZ7d6EAAEyQ/lfM1TkYRZxdy1KI0C1FEsMomEYUvgHtjFJW6yW6UhjbAG892sqJphha4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB32YQAEi3pefaNCcIJQNmaF3Fs4dxElU/TAKewaAodep/5p5N
	y5WAjYjaco8ue/jhm6XrmOUE8CS7sU4FKaS3TfpHnq0Fhz74jKTxJ4DV
X-Gm-Gg: AYBFou35jvhTjjPmF5uKltw1tPAc3wzwWKQg5OogGHFQLVNr8E60tXBZBbknUcNGs3Y
	P14rv4eOeYQFCEci4kValvJgeavYqP19KtASRu6ro8ejcQ4iuKeHbxfVoa6i4Qor9hohsAKteYZ
	2cpiUuBYHjxsZ/5dYWdnHqzXbII4UvuzMtTIYg+UOchnqRNf6fOwQImhV1C6Snu3AmGJHNQsxD2
	oHovjqfaUZb2acIdxl71rd8ealX1pJacQQB/Btpx3bdcAaF3sDP9kyG475xrfo4unBsswT4bmFZ
	3M/15BNgN+M8L9tX5x7MMPuUdjQrb8Eg7YsiaBTUgrGB98URH98gy0VQu+rah9c484+5k+++LSn
	ODJd0VbP1Ji9ZzbY37NPops3DkIvGJWiXkz5ZjMbxCYP42+Ykxu2g+OgjZ6Lq3UwfXajLaFdhSD
	qgbYqJdbVbdQodKIcgmvhgV/aJDVXXwvik0SuAaZyrkYHFY0bJtAwM9nk3LSkxWbIlZ8/BbYswZ
	7dkmsgSaGs=
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr21861671a91.0.1792120216184;
        Thu, 15 Oct 2026 20:10:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:15 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
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
Subject: [PATCH v8 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 16 Oct 2026 11:08:52 +0800
Message-ID: <20261016030855.4062882-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
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
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ea288cf21400..04fbdff2b808 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
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
index cbb172fbf06a..31c89bd64036 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
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
@@ -2880,6 +2895,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

