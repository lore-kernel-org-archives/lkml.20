Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9E416878
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144956; cv=none; b=JoXCqkxNzhYnA1oqZ9Mz8V3WzrOy5QHm8J+j1IeO993B3wM7jzQCORPSFHV81Y3EMNgTBylM/GITVbG3eoKow6WnUuL4UOKDlAb7hlaL+wHzjIsy9M+l5xPSrmXZyjOUdfP1LDQeC91blcx3il/QkYWLg9qVGFBPzZyMV33qnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144956; c=relaxed/simple;
	bh=ufE2Uz6n3OfWWdak1O+/fDPxZjq1jLayzDJlYGRApYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k32afflWDq0IzgNh4wrauWo1Q8gaSZnefWbTVr/HYWeKAsCj8/HmhaO9JSOYc0vLxaRTlULDprf+ZyR6qMKLl6YoYQy9QTB5Uitww18OHKrDb6Ng6hAFZBa+zJJ8qMLkQKRqJ+uiaTy4MrRBgQmUNpss2M60UdxyiRHhyoesfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRAg5i5Z; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRAg5i5Z"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so2535255ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144948; x=1790749748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=nRAg5i5ZvRrMND/HgSdR/8NzDjsOOhkKdUUdyVTjGsqeIYmd4Z7UQa6Gaua+ilXU9J
         qYantHpBx1CdpgjxsjZw6FZOdAv0BJGHM3vJ68SCRLTc5un97DERUJY4FzRKfddOLqsC
         ZQUrZt+j6h3wtnNL/F4qXRWUphhuOKfuTo8eftNgpGhbXXhl7tZjY5tAXnYGnOnS8VVy
         HmQHih8r2UUoej82IKbdbk0OJb26lveX9aEqfxn2Mv0UyWZgwDrIDVveirz4/y73tXIj
         thdO2NfPO5vCvJCZY1Ya01FBFEqX0iKPOtjoSLbbLtjftA9+nGEbMShQ7lKIDynjcV25
         W2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144948; x=1790749748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=qIKGZBahSBvq+CABU8EX4qLrX/2YwejgSxis1EGGiFgufz0T0aPYqAhDIqFojH8a/5
         6bawtbZKabkfOiVuRoIe2iMLMo6H+m6K1DNrvlEoIg/4v/PjezBEOgX1c3G3N8/x+ZWd
         qeHlgJPp7Ys9spNEiDJZ3nXMZkTOW4TjNTbxDs/AtV7gHO2OznO2AhKULhduGcBVjXhS
         ckRWUsyj2veV0ty44K7nbXsZ0Fsydktk11FffV66GxF6w03PSDwOJmkMLLUtniohcXe/
         vU4+drr5nHsTcuqoiaXVqjFfEKRzCX9sc5IUkK4C/FgCvXeRC0c5aA98ZSK+nr+p5jjs
         8bpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3o5x71+2DXdqjchUx888a+CQxal8FIUyegLa8Q0qpqQejJk37w3ybVfztj46boTC8k2Y+vN3BMUJyyZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nmmPxQj5osFDGYpF6ZkHTa614qJYSCCKbiHDEiu00Jrn8B6wqY
	P+fstv+HoDCJwz4vQ0K6RVP+8aoDsrl/i0tVZdt1Dw+bfY9RDUyVUVCq
X-Gm-Gg: AYBFou3Xo0FFukcTSt5QIyzDuCva+1HXnXat9s03UvS8fQ9BEJcTcCsYHBmivL5mB7p
	VpDEDbmApuy574rJVhWnu1c3o2GPPgznpqfGphduShguUtlukkzf4CnJEJDGfmfvb0RnlfuF26y
	EU2zxq6ceEFGVdmKlia4KWWmfl1pp90jhYwGpdeyMJc4PLLnBNT+HON+jLQJN/lV2Ux2CLQha8i
	sFAb8Q7ffcI2Wnrvy7eGn4siwZHoj5aDuvtIVubZWCLubLfvl8HFrw+7NjSuOTk5R8D3K5sqBcA
	NBnJ0tCTRwU3dxPIl2fpYzQ1eecSn5imiH3iYLgMQDz6HLsY5bonlTY0WxoxveOWp9UW9MbISo6
	AQJR+OzvZeW3abR45YaVvRzxF3LHjPDM2h3/FP2c0p3hodJZWI2YqLlLDD4NGfrqWuYbW37f7AG
	Hw0pQH0VzytwauC+wzUtNieLMXYDkq09ZMVarNS5LisgesdSlojAUg2Dm6jZ4FKRMqokDylwQ/Z
	Kpk582OipzoAx6UcKx4ZA==
X-Received: by 2002:a17:902:ce0e:b0:2dd:ad73:5b6c with SMTP id d9443c01a7336-2df69d56537mr15363405ad.28.1790144948204;
        Tue, 22 Sep 2026 23:29:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:07 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v9 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Wed, 23 Sep 2026 14:28:27 +0800
Message-Id: <20260923062832.479455-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
mapping spans, not HugeTLB hstate sizes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..4053b1ec1902e 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
 	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+	 * capped below PMD_SIZE.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1

