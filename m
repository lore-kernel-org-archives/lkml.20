Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737303;
	b=AlQBdyV770bpSNVuH1z7LOj+DJy5PanmhaaBsdoVqBD+O1P+PKFzLDd5gQA2NaQ5p1dc
	 EJB+KCFh9nmaFQ4p+YxuB5Fbmt7dYGC0gCYTMmIYPVusnP4akMP0Oq0BsmeW9YybRxCQE
	 JcL3CfpwZbAfEzHIS3ii/uallgpUSr4YYggvrbJGIyDp8ERE1sr+KsAfp2e1V94qAmJ3Q
	 ekdlt7BRbuEQ1kYZq+cd62GQ5/u3hC4c95qhJdguRfe8vO+yv37chy0siztO8Y5h8noDv
	 2U+p/c8zMrYoAeBym1T3iCgOgxHUpXVnkLIoHQw5V9m6KZWefaoaVdPNtz449rFv2fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dMWdlBhmxnvLIraZEDjRljS62kPMNDcGFS9KF9CUDaQ=;
	b=ALH9bxy1TGb3wHDlVQRZBkKPYLLTYXwT3hNp22urc/ma8Xn96ct0Zq05/eMznBCLZ6Wd
	 3NV7YPEDh2zD73pX+1Y7e/CSXZzIaZZL4Z3JpfT/rNoxhdPd8vQkRX3kN61Qk/1hHh/rf
	 Q18ywK/gTUfT3BmBikQnvQ9IxA479U3qWIu40ytToOMUA4E6keu1eBh4tzn+2eIsaQDWO
	 rR6HGh3ZppXKnPu+zW/xJZoUFaVg4P2g8gPpKfkzCJn1kt+qAnh5b8YasDWiY/cNPEvp7
	 +g/A/crkpNYAHx4qeJBtoO9gYfd2DyvJ68H1UO3ggpzcq+LE1OBM+rgsRC5fYpWrL9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ku2pLXJJ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF2606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AF2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ku2pLXJJ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd623dfe420so400941a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737302; x=1793342102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMWdlBhmxnvLIraZEDjRljS62kPMNDcGFS9KF9CUDaQ=;
        b=Ku2pLXJJTB6Zbs+NAq8GQMT6NZtgy8bqAwhorT2SwgAsDjm/fP4v6M5oYY6buP8sa5
         bSNwZarC75XpX9/yINlNZIUJ/ubLIiZNwfrAMTE2uU5UT/CMToxEcpIk5n+DWF1R1ZfD
         dJ9SUPM0xznR+yqwMJFmz9x+3ywJZxJHfSY7gyVyrX2uMvNv+jiNQUv0QjIfAvwaVKgY
         LCdUkDQMrNPVq7MoqUA9ghP2ai3vOb9QtyaOGegksLcH5qlEM9YqkFzMWV0KQ6RT9lxj
         lb0AdRjLCx7wRMAjPwYGMtujdE63DNdmqryoeTwPdkMBrC/I/X0h90aHROBoPUm0vtTn
         7ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737302; x=1793342102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMWdlBhmxnvLIraZEDjRljS62kPMNDcGFS9KF9CUDaQ=;
        b=OLMXh/bcnpXY2xzpILeVAoVi2nzNv6gPsyeqFZC6Xf2DoAxus73uqDlEW0PKnmvKSE
         9Zm7kZyjP53pTHip/KqthZZWgt+vJPAp3cRR6bnkF2xtEeIptJjNb8xtjf4bn6NOz74x
         f/ufvh8bBTShE6jHRWCi3ptkM3V7BNIz4GHhQrn/3JHwfVBALn0BNn9StNZPP6E1/YOw
         cM5bxbGANLWFVHPxvhjyqO0LFQ4z1gBjuoeI6+fHPcfzVIL5m/xjNxsGsau8OnPQ5I9h
         j9fNcIZqTeQNYvaAY0OrIlhUB5leNm1SgRnjV0Pc6pytkpppO0aOne4tix5Tm2TIz9f8
         S37Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvyqvADSICHcenGlrrfvBIN1EdrMCdRXEEhbhpQe76krz3G0iIA+qSUywDx/zY/gfqTzMNWbNP0IJGf5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5goeQYl3GZk5ONIe4g7Lt5qWVjsQwX4e5HEMfRjLtJLHjzLKB
	zbWQYwuav45SQjbiFauXq/IdsXim9crb6QvZg004LYTXnq+MqIyYBG4ZX1AEzH44W04=
X-Gm-Gg: AYBFou0pEiIyJTTDWMxlapHoBbgjrMxAr5e23cTisrb5kE/zyGLk28p1aCbidfgzWZ8
	B2YVDBxrIbHvzhhFVpmAwA0/ItvwOdTWzziZOnBI+PERNVD869QUU2EHKdQLF3HMLV53RzsXNrL
	XYnxPJt69zdOv9whRuYaSf/GAaHHAje7UrsyPs1+Nj+4Cxe7UN4Hqc23N+mb+7l/9h0jciA5yjb
	tchCcrTcCDqSQ6fp9IRPYJGVS7H4PAKPAz5XvT4ZkIso3LFHJBvHclFhNEqMLUZ1cnmp4bZpdRZ
	fuo+2RdHRuyUZW5OkEwQ3NAaA1ZvEW1imE3GVRm4CqknA14mEZipFab8MjJ7lVG6oQcFHqaIVz4
	4eJdOFyIwaFdOWTU1+3SCbhOkI46E+UOZuaptGhqyv7LhueLUUqdKDisY/X+2/6AMgmoe8xxHoK
	WZWxTtOTUtsDRAiFHL7/N9v67PIuoXvy1NOoq/aAYfQ7oqdvBuB2xSN8eEqVI4EJjpE30+RinRo
	LD+3SDBY5irtD7waAU0z3eSJOB7pX6eWQrqaLP5rYqNAejADyLZzOOcsk4U823bofn0SsiF4tpX
	GZs8sgVKJFaV1+6U7rO+UdQ=
X-Received: by 2002:a17:90b:33cc:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3adce0ce647mr1174819a91.39.1792737301360;
        Thu, 22 Oct 2026 23:35:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:35:00 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Fri, 23 Oct 2026 14:34:28 +0800
Message-ID: <20261023063428.3658761-5-songmuchun@bytedance.com>
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
Content-Transfer-Encoding: 8bit

Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
hot-removed page tables") made free_hotplug_pgtable_page()
unconditionally run the page-table destructor. This matches page tables
allocated by the arm64 mapping code, which runs the corresponding
constructors.

However, arm64 also uses the generic sparse-vmemmap population code.
Runtime intermediate page tables allocated by that code do not run a
page-table constructor. Freeing one during memory hot-remove therefore
runs a destructor without a matching constructor and corrupts
NR_PAGETABLE accounting.

Free intermediate page-table pages through pagetable_free(). It runs the
destructor only for constructor-backed pages and then releases the page
through the page-table freeing path.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand
- Collect Reviewed-by from Kevin Brodsky

v2:
- Free intermediate tables through pagetable_free() (suggested by David
  Hildenbrand)
- Update the commit message for the page-table freeing path
---
 arch/arm64/mm/mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..4dce8fa227c3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,8 +1495,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
-	free_hotplug_page_range(page, PAGE_SIZE, NULL);
+	pagetable_free(page_ptdesc(page));
 }
 
 static bool pgtable_range_aligned(unsigned long start, unsigned long end,
-- 
2.54.0

