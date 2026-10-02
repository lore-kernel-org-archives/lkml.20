Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD43B05A4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932230; cv=none; b=H1SIriEYCffCqpgwSGJADD2SQHePFER8wQAN8TPpiNC5waKd1UyeeH5R4o/sMwpEJibzCqhCr2oXnwf+ldW/zNdyUceiZuJrItHpnF8MemJP8zPKC0ZysARcZpAtNQ99/cAD03MnaSc8Vks8UrQBObcNpm6INb3nF0mglzKMRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932230; c=relaxed/simple;
	bh=VDe7o+DD51cV8sw+OT3l8rM+5nPBFJzYXbBIwcXUgjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iOihFZ2Bb+WJK/1y5/P2YilpZbLItSCzxv3LwyjbKGSvTSRFKo9IM9Lv4Ta0zgEzm5xqFufRjWVsnzl6x0l/fBqAa6tG6OSPgIG2L11smETc/AoKrzX6XO/+46B0CFihJlXt8PzHcdQ1eNg/sctZmV2EHoFH6piqA8UmU4NCRcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMhWik1b; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMhWik1b"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so33707725ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932226; x=1791537026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+brmQ4g6fgo5Njbplw2vRXkj0/5uqGmn7J2kABfLu4=;
        b=LMhWik1bcLcJMw4mx+45fGAFgSn9+BLcqDLSWCBsPlIIrGL6pe+H0y91lsh5s8NSFj
         mju0vhWgOG2o6iEgDXzRu5rzZQhgIk+yaLiT/UfgRQ3FZocOQfIvCgzFsALCvnXtYgp/
         ICJiqd2WyUD4fMN1cV+u5kUa5qvdL/EBH/nAL1gzw6ZSpnW+TeofozxmPuiZhJQcJS4V
         MPA0bAwrf3q9gtItJakyOB7qmxE7CHpFt7nNmNlFWfGDA2IZCf37x8EbjWIdNGXKxtdD
         iP8B48CxjxPJ4WeMvjEf1QoEJGbZcR1rzMcSjgtpAkK7xHVI3yILMStfG0BzWal1+rEA
         hT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932226; x=1791537026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+brmQ4g6fgo5Njbplw2vRXkj0/5uqGmn7J2kABfLu4=;
        b=AbUfpe+tZxLOSdKJC0QFInxxSQu85BCsnm74nnSrkfreSPt1gE/A5XZ2XsuW218QzA
         eVz5xKTJTNZE/YknvuFTaM/IpqEFmfObQEjoZXcU0KC1xd+v8EzM54DmCtM9WB1S5L2y
         5dtxosTx2feJxU3lY27bLdALsc/tZ/ZdZzeepdSp8yi1Dh8/mLHArnQp5cRNEex8DAna
         JWFWmVc3vyh8bfgXGADBQk9bbcXriIGzV7piT6Qs0X+QESk/hsTtJRyYOT4NCxsTFqH/
         G9uOed9n9yJU6Aj52w7rEeIAYALXnM7081xd9z/mctSZyWv+zwBC1eGbd2pVJhf5/RUv
         felg==
X-Forwarded-Encrypted: i=1; AKwUvBwSJYwmhYU10aswNtulwKzbrFdU7fUIC3XYCJo0GnhPmuaAX8UatB85ZkXQbNfZbkvH7nHoTIo3zUQqX8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqqj2f5aGByjkh8u1HFglXwjrgeouWmCpDyF2/WMoeSaov1fDm
	ns539PO4pEeIdzMELRa94LmkWAMRJ9Vq9515RWQAZlhyFRSI62PeY20M
X-Gm-Gg: AYBFou3lJTWhlDMS+i2CEM/+mTT75meyiZEvLLzquEVBFga1o3bLHVNaRCAhBadWl+Y
	uvvGRN6ANMm6MxOPOjLkS+4A192E/OWqWEDsMetUEdWoyVKrvkBxCTlJMPoADy3sJnYksmC6v4Y
	M4EvrCRkCpn7GTn/Qkd4LzGql+zwPXy293izJT8hd45BYfpdM/lZDo/mc1HOiFFM0bTn421yCMc
	6j2lJJbQy3KUXbB5vRyFIWnNg1G4KC+j+yQ62+d6P3B0ZJE6RBZ/kl4JKOPdJlZ/DtsI2wOarl0
	HOfqaXam5F92zurVO+3EnwJocpX0qd+v3+6wjnf01HGGBZa4bsJh7AcUKUi1/cPcpE1Rvep6Vu2
	14prg0+r29k9FO5oCdzmhnoDn1kZ6BZ58jH9LOOrL40Le3v8gWZhep4/giPIAmDSt2S66iZvZ6Z
	HaTJQHQJIa8mvbH2PwMnv+xFjWKRUcVH19Fh4tPQnUJHUXnq/Z9Wa74zuD1kGOzMXbnFh8t0EFy
	TO4Jr9l6B3g0jv4dJPtTg==
X-Received: by 2002:a17:903:228e:b0:2dd:c100:7cb6 with SMTP id d9443c01a7336-2e49b6b662dmr16609685ad.50.1790932225869;
        Fri, 02 Oct 2026 02:10:25 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:25 -0700 (PDT)
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
Subject: [PATCH v10 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Fri,  2 Oct 2026 17:09:42 +0800
Message-Id: <20261002090947.869220-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
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

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single pte_set_huge() call installs several CONT_PTE blocks at once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..c29704a19e276 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1

