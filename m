Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571502;
	b=avlouruHuyYJF85wZG+ZRQOPBnvwcCBR3H2mYT+j+LnHlWeNkuRqUChPwtR46vJY5HK4
	 qq/TvDWgoxYS1wRzkE2mvdQrjPAAKhbwo853iBEwRYxQyjHdaZtyjx7axz0nOHAabNo8I
	 DWCku88o3PHFBzj+Nk6JT6hnP6K4XOMl1t09emTvVru0wl/VwSiTW/IYOVKPCVqQd2+dQ
	 pfAQ1ffkq2w6oAs2Uo6hAC/z7vEc54t3WZ87vj7EIqZXVzp76w5uxhKBdLqki6lQW8X1z
	 7aT4X2Pq4C4ACZcrEhqpaBZhP28SDl/q/0ahH8pBXLmWRspvD1vkbuL+xnPRYD7Sheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
	b=iStFfV1DbDoKy13Mr/IU0T2nTW1C1tWLbjuJTYHH0DwQjZpHS0f6al2fEK0sbo1bbnn1
	 SWwwfkbzg5/01Yp0CgxO0UMBGDYq34RSs/fs3wPpAoJqshIU8T8+ent2UJ/ZOSIuOe0+Z
	 eRTSJ4emoJtoK0s1QiuUU2XGgYJ/Wb1adVWHG0LsiSOer3NWpAHF+Jjd5WeUJQJT064x3
	 ItnohVZQ3PbT54p/FDJVpdlW++TZaXAK6s6atECultdtgcrUQ61r9m+eBZdsQe4WYXKJ5
	 I533Yw8262fNtqINm0RaZKyS2YPa+evGkD+9DNbesO3R2nsv/CPZWJcZs3d8S+jxvPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jBEfUTrd;
	arc=none smtp.remote-ip=74.125.228.2
Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4FE606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jBEfUTrd
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so38743a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571502; x=1793176302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=jBEfUTrdfdBcSWknoKHLJYkJdG01vXcbAJqJ2+EfnqqGb4ymvWtlyQJP825JV07TvM
         jeopiVAsqlgnz30r5RgKYKSsV3ufgtOhl9DD9bS7znK5E82o9kkltOpVBsE8VSa2izNy
         kbrA2wXp/d1CtwkjymqmIRYuteVXYU+/fLslfjOOJXcDH5KH/RDogZyijTiUI+Nb5yP9
         T4kBHaQDs1jaN2j2SnKRFWCA3I7EpR+Jwrel2i/pfTQelMzWtfqwvH6CYNDsKiLgRkU+
         udeSXp08L3R3e9pdx5VfDoH/uOFZIIVTy2j54JRqHAnlPkWm+S7UO0TvaT9rEmH+Ex18
         DwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571502; x=1793176302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=zEvu4LUSZQZYj/ieQSKVge/QRt8lKYdp+zUjujb/CMrBCmVMMYqEL5fkygOTULShVp
         qxNW59HABKVCBRksyVNpZltu2YBUBPpAsPe1tlfdMRThuCpKKTr3V1or2oyQ8KSHW0BZ
         VBWUdkz76PQ2L52WUWEHmIrtiWar0Q+G9A+jz9qJsASD/ZH6dpFZIvZPjC1YiK1Z468E
         b9ijdzVq+eRO4SU6qsN4QB9MsO/AO5v9HG73JUZR0rGPPJGB/tLxp5lun4ze9+oDC9HE
         F+VuPmueTNhk/Fg/STyvjyft8WFx2Q1cdZIMR/pyDgS41m/7BB0F0Fpynkk7F63PnZZ8
         Qgcw==
X-Forwarded-Encrypted: i=1; AKwUvBwr+f1PW9L+QHDNRbL212cpLJUSTIdReydM+QpIVuGE+ASCJLkPn9CPpZ+TSffz3EOOdJ0OWXiXYnmuPpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYInfku42Knc9LYo64uY0S0l7m5sMs9EY5Pyo8bnKGIlJ9cWraYU
	H6VbVVCstBWHYjHJpoQSefIq2ccPyd0mR3AYaRD/nwQCaY/ucCTgMwI5
X-Gm-Gg: AYBFou05gUxRhHktR/XXQ5zh2NShH4mWSg6aN1dl3C9ONr4IVyYqTCT6K54ZMu6RZme
	KKPmpYvaLCdO4liqOPasxu2SESgPrVCwj+U9Rf2DcilO7I9jy1Ir4Jh1t+1gtjM0TkFEDvcSJF6
	MTQb9+qOIZOQRV8o/5DNGEW9Hc5rOCPSbCQVkAHbFtIAHExeaZcCDzeTn466BOKDJHm+uml/2Rs
	is1jMZKP/TknOkGdiqdlD+mKvhwQaQ8xXhLWl+jMHmKGWN5352lEAc3SUXn5s9qSx7T8TzvtDWa
	GVqsW807ysgJ1VnlhYPyNZ8BKiv+Mg//6ibSk2d3SskqLmABodvHut7Qx/lD4NXUGpYItaUuJh6
	+fNCapDMVwa9MRpBpJkkkEcI0YLttTXStecFAFtt90B/hTubmO7sQ6AAAh2dlejX06x7yDE1bp8
	qRg0zIMvYbvzoJ5ApqTSqDRSJXKEZhU96VTr2ESE14/uFUUydxp4mW3bjLzgdXNlas3HdnbcqG4
	ByNFDHtkJsR1SERjgTncZsvzdFXAECjpwUEOLU02LbKUfJ3zzTwfwv0rVtftEg6uM7+0RLgOjEH
	+5L7snYp9GQEDQ==
X-Received: by 2002:a05:6a00:2d12:b0:882:e366:d99f with SMTP id d2e1a72fcca58-8a089d871famr1118755b3a.51.1792571501524;
        Wed, 21 Oct 2026 01:31:41 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:39 -0700 (PDT)
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
Subject: [PATCH v9 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed, 21 Oct 2026 16:30:08 +0800
Message-ID: <20261021083011.2170525-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index 40e6e0aa2f8d..67dbcfda6f49 100644
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
index a450092a80fb..ab1432241432 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
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
@@ -2854,6 +2869,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

