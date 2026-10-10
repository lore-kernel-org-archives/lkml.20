Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D742983C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631559; cv=none; b=rvAWzyzocr0N22AT1f4NBCQsjeYsbhD/cXDGSwhwGvSqThDekM3bHGKH2X3hrcYcNUJZF19uwXj7zZKTR48FjplKuI2akASEBHIOcKDdrnBO9SOg+YCF3cpY9ggphnrzZDv710KmMyhTzKJ1NVJJdtV9WxoIPRXEqJxrt3W/nLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631559; c=relaxed/simple;
	bh=KVnd01BxzJzM3AgisF1nTLkXhIBE/sbtVIEP5JwJvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tj8ANL98s//6jMs1lWvmKk+6ygqxG8JkuBOHgNtBSt/4WMqF4TCZw1x40IdLL4bmYfNrwdGRqU24nHuM3TNTxGpKHLWY3dNeBPVBwVyUl4BCSkvVcwxmmqUa2szID647UyNvRvFzDLygwAGgiUoPVXdvmbYqQB+lmjFCi9ySpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cd/AqsIh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cd/AqsIh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso216745a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631557; x=1792236357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=cd/AqsIhOniWrIBifHQtSCbixDt1bL3VG5ROQo5Y566Oagx18b1iC+ouQrDyHaQx49
         jhg36KfZmpO2H7QRtJhhaLPuTY864QL/rlx9sTvVJfenMxrMW46UqUMVow/Vvh5PqzyY
         wznFmz6nkEywfi6Fc9OEeTMqKeTik6iT1ms99pUdeN4MwH9SBz3iUy1THleOllWnqMQw
         mpYNrIHHQ9XN8ZQiw1/qrTcr4OnEd1yK1fqnJL2BJh61gFCS4D9Y7wvP8ThaY7rvmssz
         HhNAFSBW8LtgeI/JQGMKhIo0KERIcEKOr2u4uJAr5mjTLBgedl7VYihHaDWQWoYvGa6t
         L84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631557; x=1792236357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=YWkoNQea/U1x6FM2LCciEluSbuNAIg/PMlfcagzOwqBhLOfVbNgygC/U8gvvQ3EOVW
         wlBYWdgw6bmbVFgTjMjuP2IUkfiYFI8kj/D4LXSvTPcrULh1KePsG6Cs5CKNz5sYqlpD
         kV6iEJc7yjArfK/e4/IUJ9VKbV7ZPHFkTPaI53mrBNNRe4JC8na8VaDWCv53aKIx4VB8
         oTeJ7elbpi6qg0adNcSCtaBs0DchjKS4LHLm7FI8ZAOYo8swkoKh32CUGsf5p3kKaaeu
         AwFENzCrykOuCRvjkdnPF2WBTbD/hqUWZCtRQc0scf3q4KFJYW67Tu3Y8JRow6psuo8Z
         R/rA==
X-Forwarded-Encrypted: i=1; AKwUvBzMmQl9GC974F1rUW1uPTezh5k57L97cStizfyNUHtpNtx/Y+3yLSsIG2Z7Rns/nrABpNi+rVrdYAYnyN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIESaG0wC2wTstnipjo3zGR0e25TZo9aNaQOPfLyQdUVbcrWWkm
	QJz5mdcNwzDfvEPaSz4KBc1dFEZgYIw2lTQrMu8InZqhIx5O4jX4GdHuk1cE7/PL4YA=
X-Gm-Gg: AYBFou3xOd6lKvq5VkAshrE4lnNPjclGCkA8cQjEFO+2eV3JBKtPNCx5uCjtDrq7ru8
	e0MsvBcmEWa6yRptUomH/YINQEpBlOBB/BY/dUqjJe5lIuKgWrb2ODBxi9/H/CksHBH8D+LYBjC
	GrPN6aZLVKLn3Xb/Oq/+74XCT6XXUXhOi2Y+z4yoXmHv+LPk77hbZ6BRNz6a2cwx6wEbKf8EVPX
	f6dCNWXC75L7CXDOHToum0c8AFzbg+7NjHVHYB3r9T1/VSVNzm+rL/ZxDBAgdkSth4KTWT+zkOy
	geqJMoYT/KRlH1l8EFnhT82qIdMINx2kBmNcHH1wmlIRRQtfoJEgXcM75DYjXZHLMF5K5NA1dXE
	gBsIeRaR1TRzvP8bx/DW1K0k7NyKh5ppJiQ+Md8bx9PbvT2xtaAEgLVqOutjoiow8tDWOdm+yAm
	idFfRJXSKDeoXl5sqg3OFLDfRtJ5VM1Voo70SsRoJweFWuPwS9NeAapHsIbZmV3V3oR9nKQE999
	1JoS3DnjS5FGn7+HQyvRh9gHcE+3yVGJYUaLnO43F22yiSg
X-Received: by 2002:a17:90b:2d06:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ab3a32d491mr3593827a91.9.1791631557025;
        Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:56 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/4] mm: fix missing page-table destructor in pagetable_free()
Date: Sat, 10 Oct 2026 19:24:54 +0800
Message-ID: <20261010112457.49485-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
splitting a PMD. Restoring the vmemmap backing pages does not collapse
the PTE table, so a later memory hot-remove eventually frees it through
pagetable_free() on x86-64. That releases the page without running the
matching destructor and leaves NR_PAGETABLE elevated.

Make pagetable_free() detect constructor-backed pages and run the
destructor before releasing their memory to fix the problem.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Move destructor handling from x86 into pagetable_free() (suggested by
  David Hildenbrand)
- Trim and update the commit message (requested by Dave Hansen)
---
 include/linux/mm.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5cca90fc1df6..771a7d60b0a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
 	__pagetable_free(pt);
 }
 #endif
-/**
- * pagetable_free - Free pagetables
- * @pt:	The page table descriptor
- *
- * pagetable_free frees the memory of all page tables described by a page
- * table descriptor and the memory for the descriptor itself.
- */
-static inline void pagetable_free(struct ptdesc *pt)
-{
-	if (ptdesc_test_kernel(pt)) {
-		ptdesc_clear_kernel(pt);
-		pagetable_free_kernel(pt);
-	} else {
-		__pagetable_free(pt);
-	}
-}
-
 #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+/**
+ * pagetable_free - Free pagetables
+ * @pt:	The page table descriptor
+ *
+ * pagetable_free frees the memory of all page tables described by a page
+ * table descriptor and the memory for the descriptor itself.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	if (PageTable(ptdesc_page(pt)))
+		pagetable_dtor(pt);
+
+	if (ptdesc_test_kernel(pt)) {
+		ptdesc_clear_kernel(pt);
+		pagetable_free_kernel(pt);
+	} else {
+		__pagetable_free(pt);
+	}
+}
+
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
-- 
2.54.0

