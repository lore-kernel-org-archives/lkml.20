Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E9486400
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988461; cv=none; b=VaxPF1yaAwoRhrOktyfoeoDFNSl27ptlaz7RpLnKcVHfX6w9C445ROBe+kmR6miO+YZdeMBL1Ag/zGYnFKhV0RGuYJ84eCuKT9VjptANkUn7lOnpTpSucasQEjZRjh3SJo61PRcv7BYrr7udm3A4KwPQ7sDrrlWOfImcfQWj+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988461; c=relaxed/simple;
	bh=oJ0zGW6aMw8rKZXNikPlWrWiaIddi7KYY011U3LJm+k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MqNc2NZBH8M14M9xEI5NQJmMLv3CphUWZU5JOMh2iuzZE6HJEMyvQT1qaW35sEiWbl54ezAC7qv3ccqRXzx/ozY/Ik6kCZb1/cFiO6Tqm6UD6flwdJhS6L7cx8UVDVfUM5RC8cSqqqlJtPicGI7jvZCbVxvXr1e0bvGxJOUhsWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OuI/EUTY; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OuI/EUTY"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso21336495e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988458; x=1790593258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=;
        b=OuI/EUTY+aI+2XjRZealZiliZT1lUZwdUyINQ5OkWNAXV1Y7brDogggcADMj2o1yKz
         pS/SAdObrdE+uJsgXWuNsrLAFC/ACOnCn7ZFfqBwxXci94tzsDLGqpUPAuBz7TcFe+cX
         83ENq3Ksc2PrL449gtMuK/xjNIFi8kNNvYFqGeeyQFAFjqAWfAkBHy8Xl1Hfy4ZaxuHR
         rCb4eONiG8pa8vsMm6eOfx6XuRrClHnHffTWDJ8jWGk8DeH7FnganINqoNxbDYrkNlCQ
         6HPWsthSLGpYMhv0QhbkOctj4DSaWai5uGMKpab3saur2ahCq2vHslI4e2ZUH46szD0Z
         +C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988458; x=1790593258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM/pFcIIS9AfJIvDjZJlWaiz8Fy5HD+1VXbC/YTcKBU=;
        b=FYTML4l32I4tf1AnvUeI0n6MvZpJp81KwUDfq+2FazUPAIZqQaVdDuu8F+16N8zXXg
         ppfBbgujZT0wwgkkBO1vAK7cKesh/3mSVuO+U+bwwnrDSDrWfdGH8c1x+hxSyydk2jbb
         EAbvX1yhcofXm4F4r+lRZ5jCNVrYBbKP6HmB12mgFMxWxCm6uSu9On6J5DhuqNW+N9LY
         D+kDhxH+oc1/4U0ZhHZu6PsRYnF3k6uFe6fZrd1x+1e9SBrT17nmZtGVAKQuvsHZgjpD
         Wr6xuuUSAsHxeAv3iryK99DNx0nBhYB94Ea8ad1DG/M0XR7g1UNbT24W196bSxzUSrhr
         83Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwLLnPZYi093Eue4F7GEL8VMz5gjj/ArBdldJJ7SwwbYxT4cASa8Rx95cM9QZdlIMLuw8mmUbGb8ExpJcU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkC7SaW7K3Y9JAFLvsZxC0byayoHaMvqU+VOMmolWVgiBO0PGJ
	cDM9Bkzg5W3WLhigFMPQljrWkOGk8DrI5Xk5K8eVTq1pcRRV7ipTVx1uIqb7K7NLaS6g+ZpMfgA
	3asYFQoqoK4nBnMVCmXPBeg==
X-Received: from wmcn17-n2.prod.google.com ([2002:a05:600c:c0d1:20b0:49e:8399:b77d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b2a:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49fc5687df8mr141949475e9.5.1789988457579;
 Mon, 21 Sep 2026 04:00:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:43 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-2-vdonnefort@google.com>
Subject: [PATCH v2 1/8] memblock: Introduce MEMBLOCK_PTEMAP
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Keeping PTE-level mappings is interesting on some architectures as it
allows mapping/unmapping pages from the kernel direct map without the
risk of splitting blocks which, under the break-before-make rule, may
trigger page-faults the kernel can't handle.

However, mapping the entire direct map at PTE-level is costly. So
instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
a PTE-level mapping.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/memblock.h | 18 ++++++++++++++++++
 mm/memblock.c            | 30 ++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index aa845f488327..13263055996d 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_PTEMAP: memory region to be mapped using PTE-level mapping
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +64,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_PTEMAP		= 0x100,/* PTE-level mapping */
 };
 
 /**
@@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_mark_ptemap(phys_addr_t base, phys_addr_t size);
+int memblock_clear_ptemap(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -285,8 +289,16 @@ static inline bool memblock_is_mirror(struct memblock_region *m)
 	return m->flags & MEMBLOCK_MIRROR;
 }
 
+static inline void memblock_warn_invalid_map_flags(struct memblock_region *m)
+{
+	enum memblock_flags map_flags = MEMBLOCK_NOMAP | MEMBLOCK_PTEMAP;
+
+	WARN_ON_ONCE((m->flags & map_flags) == map_flags);
+}
+
 static inline bool memblock_is_nomap(struct memblock_region *m)
 {
+	memblock_warn_invalid_map_flags(m);
 	return m->flags & MEMBLOCK_NOMAP;
 }
 
@@ -305,6 +317,12 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_SCRATCH;
 }
 
+static inline bool memblock_is_ptemap(struct memblock_region *m)
+{
+	memblock_warn_invalid_map_flags(m);
+	return m->flags & MEMBLOCK_PTEMAP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index ea0de4b5f356..8a87d4d2516d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1204,6 +1204,35 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_SCRATCH);
 }
 
+/**
+ * memblock_mark_ptemap - Mark a memory region with flag MEMBLOCK_PTEMAP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * If supported by the architecture, such region is mapped using PTE-level
+ * mappings in the kernel direct map.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_PTEMAP);
+}
+
+/**
+ * memblock_clear_ptemap - Clear flag MEMBLOCK_PTEMAP for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_ptemap(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_PTEMAP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2880,6 +2909,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_PTEMAP)] = "PTEMAP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.55.0.1082.g2b9226bbc0-goog

