Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737291;
	b=tqJ6nqc9W4IAoflRBJgTfG37x80mZl83PD1ueG5o/xOaf7VtVqQzShwIlnjOm5Jxftx7
	 gj+Ru0YCFZy7t8eI2VfYf3aflxv6MV6NoRQoNBWv9Sv6eaBrbFWAbItveMX1gNRpw8d/T
	 jmkXNRWX8hJ8mk2IRDUPu/xCOLih8RZXIPfImjvbyQDpH12vOAIjt373AFElccMLfkXTk
	 a+B8evIBhn55wjn1SpCKDSoxbVdNGfXu52MuaAPYBled1DGw+AHSWlIjrAWAa/s0HdGG6
	 P+oVTHalbVgTW3OAIeo5R6G6oRYU6d+08AaROnMLaqsO2tdoO6SwUk7hvmup6cu4/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
	b=2gppXAW95vSFQbSOcKUrp2wPM4YeA9va0uwc5vb/uep2BCTl3Q2BmoB5vieg+4r/3YLd
	 MDHPrCbXpvaBBU5pubIy7E+cp0Q+X5/o+4Y93uAbjosE1XrRFrpnlXNI9FLW95uzaCxox
	 +ir8rOzmRREVqnG/wo57CrSZzddAGPCrbtlzLQ6LZcM9K6UxMcL99lKTQ5HCFP/aNf75a
	 708bZ0AI1U/VF55P8qaqRxdU9KEuyoDtRh4lw22OVc3E6OH6FuB/yPncxOXg/LhHGz7sK
	 7qeLmGwBb12fQN5ZyCFJepq7TIV7G0C+m3fDy/l7mobV5pLxrLeedpftO84ypP7Jvlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PbMITDUr;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96F606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C96F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PbMITDUr
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so326716a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737290; x=1793342090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=PbMITDUrlzuPYQZwWvu5gVWlVyF8/NJ2U6rjUZqOnSVO1PD+/VYs2jwpQlNtiJ8Mm/
         Gl24xS11LOM2CwGcm72oRKAAXD7YkeQHH8tQlRL4QCFiUu+Zjq33lHrHwUbFXwxeRps6
         yI0ah83afcEea0r6ms28obFi9Ic5SLy1pZuWck+mn9vAU5bmu3C1eO0tzxJU3jXPGSkI
         WMjp2nxUakD3/rMliPwdoDoFvUXftVvkTy75pYrjAmR7e2A5yqyxqk7/cb+E3g8+WPqq
         n0A7lF0Oh8SlcWop/Yu5U0ujD9AtytQ/ozzN2554hzgV35RmeCyPIv0s3aU+4nP7wdy7
         AnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737290; x=1793342090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=dLvddynCXZhAFX4WoEruesKlYdBC3HuX/Wv6ZC2XFF5uYrtxCZnvnElgG1mneqn8nx
         Yy+a3wTau0ZI3vBGdHLmnvxyrf4A+Eu6YzvNvh6KNsG70AMNdIgfu9oXF7UYEO8m37AQ
         HAP/SArvpi7C6lawTsiimqLaYSbbCo+sND2/Uokd6GRoYUGhm5zmO+LimxjJJsgD6Fbg
         W2dU7j2BXwvkdh4kTcE6uvI7M8w7S20GIUz0lo9uBQ06sI2398U3h7qXOl8824cSf9V+
         GuhlENYD9/HF0cqAOE0JxgSfexMuDdljfO/BMKglOkpbdR+ReHkIL6BilJWUSVsi0+cY
         MNfg==
X-Forwarded-Encrypted: i=1; AKwUvBz6UiEp1cpDKzEfxIB5532PEFAOr1+HpV+ia2go7fo/xEfNythORBbi86QO05SvX7OVI67aWCshY5H3poU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3nu3m+XuMY1VG4cMV4vU3yMn6GQkVT9/g6Dgt7dFN86xv7b+y
	0uv0CMhMS7M9ZeTbaXO2fJ62wg1UKgHFoFBaIeoS5hq2RKkUM8TJpxoDGx3SZ8oF1Lw=
X-Gm-Gg: AYBFou0I7E6DUuAbhOjK3f+PJgrhnSNS8tKX+cXzvKgwgkE8gWroxp9+SQIfqL4+6Sv
	+xuWKA2r7LeOou+THQzD7bQGT0BJkOU+QDzsBuFGYfJFZ1SBu1UAnGraVR0rR8FiVcxxw0i5YTU
	E+E0ZHuaYLu+XDlQ9XFHEnbHnJ2CklNN/enJQj++L+yBZNFqUzY/shqqoxEsGElVLg17TIZBG5p
	oqXFRyNe4NDKULO5MKCBciViHTXEyIuDQQnRVDYg7OSmbN9Eaz6XChzfwGSHfINslIY1vNSuPi9
	zKrcB6Yv8TteenrsHj6/jYEwedj2HTcFhAYzlreq1dbtyzkPDPCDhmnGuYIpUzX+onE6X9VNaxq
	95TFGhyhSKq2jLP39fRaH5XAFdNZ9yNZsO27sfbx19k2SmKNNhPb1VaJn3QaXTqSRUa51ABiZSa
	vBK24hpNz4TFgwxYgcUDF7FoefYhHN441gxJC3vQmjtJfPgfU+aMPptkAa57fN075sf5tkJsbaw
	NopUI8uO4/3Nv3ZcWopYOY527M5i1ZhwlCrkRWijTJdeZa6NbWCvizP0LpxuL0q1XvU9dWHWVnA
	TA==
X-Received: by 2002:a17:90b:3b44:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3adce08329dmr1117038a91.42.1792737289490;
        Thu, 22 Oct 2026 23:34:49 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:48 -0700 (PDT)
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
Subject: [PATCH v3 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Fri, 23 Oct 2026 14:34:26 +0800
Message-ID: <20261023063428.3658761-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V uses the same memory-hotplug teardown code for linear-map and
vmemmap page tables. Late linear-map allocations run page-table
constructors, while vmemmap and early allocations may not.

free_pte_table() unconditionally calls pagetable_dtor(), corrupting
NR_PAGETABLE accounting for constructor-free tables. free_pmd_table()
avoids that for vmemmap using is_vmemmap, but mapping type is not a
reliable proxy for constructor state. In particular, it becomes invalid
once runtime vmemmap tables use the normal pgalloc helpers.

Introduce free_pgtable_page() to select free_reserved_page() for reserved
pages and pagetable_free() otherwise. The latter runs the destructor only
when PageTable() is set, handling both constructor-backed and
constructor-free tables.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand
- Collect Reviewed-by from Björn Töpel and Kevin Brodsky

v2:
- Use pagetable_free() for non-reserved tables (suggested by David
  Hildenbrand)
- Simplify reserved-page handling
---
 arch/riscv/mm/init.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..e111d25e18e1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1485,10 +1485,17 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pgtable_page(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
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
 
@@ -1498,18 +1505,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1519,12 +1521,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pud_clear(pud);
 }
 
@@ -1644,7 +1641,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0

