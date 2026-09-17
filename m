Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7F536A34D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623021; cv=none; b=SpHsqyXkEerxunPWI3m5x08YiGGLZSnfXJFIoYy1V0DPjgr+05BrdQ15xg/LHUwUFfmEyJFq8TcfF+UC41LIiSLBz3IiKdWlpY/0cUVY8roPfXn2W5R0FaYcts0RoZEL+JR253pnRLzT3MW8C4Cb/7dS+LzBqG5SFjewo0xNoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623021; c=relaxed/simple;
	bh=ufE2Uz6n3OfWWdak1O+/fDPxZjq1jLayzDJlYGRApYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1canr8T6YCu4wZnDOX/icaNUvGeb6ntvMzvf9zKrSNvx6BeCWqwXCotrXGzV7cLgUEfb+G4lHc1IyaQxEiXXUGQsZsxhHbvFZy0E1lb7E4ofpKDuJwwDH+BdMCkQcYiA1QXqSI4KjfDQeBYAuv2+7iDg3z5oDdcir0N7bBfjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibb2mcU/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibb2mcU/"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b350c6920so379073a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623019; x=1790227819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=Ibb2mcU/NuL+2IQeaVkUNh9Vn6hBJ8+rhC0rd39Gt33JU2CkIv8Xvdk/sNmsHB8nY9
         ecjc0iaVVYjTepkolCkr4tdRwXOocZjgtuU3GiCRTGLSpftNdZS6dQuuz/pTUu2Pe4BY
         qpXPy6N3SA12QVIMz/ItUWHIxYiGiXEvKmrmLA/7hCexLyoUxhh2aC/jKVibXbPuFOXU
         Wdm/RmzA5IDuqSlyv4aFiPOP8ZFMGb57/7vKeWgyCiwyi1ZECx1HKvh16qPcvWvX28E/
         IlZW0NeJlq/9RYL4j8IHuEVCl5CVdvlSlZL9e0Xpr9JDp/nVB2uPejUKVP+UJaeNe0eD
         T3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623019; x=1790227819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=fWiuS56CKcvphcmpivWYMVtLN9iIMC7QDrnNBn+onjCuNKpDcOjgjNGA7f158HXgY8
         8iRWkivkRa2c8XWi9avsG6jgYh0SWJ4VfJLLj1GHgywJN3Jjy9BNu4IhqGKvGHiZipK8
         D8ArxHRwBr6tdTUA3YCQRsZ+1jbBRGdAjbZVkktwcmb2hxj1nN46eiKa6uoR9psdql3t
         4aG0U/vjYqoQ+g/IKLQjMglh+ZVcUcAZjp1QgSG7BSIl5Jz/HeEP1rWtxBGDPo67HEdx
         qwY/LSwrgXRe/gfMAHVcGEWCVXjQjDjrzGiDxsRFOU7t1wPyc1dmvf5DMSrzRqwN8bRJ
         kLlA==
X-Forwarded-Encrypted: i=1; AKwUvBy4Hm368nYGeFlGd3KKzKwXKhxRyP2udeqNkvsF4JCry185f/QjSAPu6YUd9fjJR6yqy/mNDE97IHwdYPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPu94m9J8JCkyKYjbIP4CcveM3Jj/bmQsWe45+sRyPj67m6ZIj
	Ot240QLIPEgOCY6zPuV96yB61R6FgUolXJYcLPDgOOl8MPaS0C5XbW1F
X-Gm-Gg: AYBFou3a6WCd+ZmHQau6APUw7WYEEwfA6FBjePP871v2R+ywfCFJqOCbLWo8AL7ZVR6
	KTa8FjAGFueR4AC9mCnex9yU7/tp9ZqlNmi39bngJZfAEfo3Cy8mp4vJKThMAAk5fez+1/nRCwW
	a//e4p75wWmiaWq08haW1Tpanj2+vD0qIrYmE2wT+jH8hm444bH1t/c6puKsJf1u5Nc3+bZd0Dr
	LqyFZPA0Xe3AES3LMsYC2ZOUA7GXrjMt8QFXKBA8rpDvU2zKqChqFyxLwTEiDR5xnbtCLitwfGT
	ueXH/QjNxJJSinXg3t3JI3vSetH274Bhmu3dT8QBCFmOtNJ1CEHO64hDJqtsoR0Ve51dNz9/j5Y
	33wBygEbVdzDepn2hsISZNEGA7JyWNOypQbzse2U2XqPaZ9V/NuBv9m7OqMJ+70Nj2Kuy8UY7Lw
	iUGArUkV3K7QXkqWXFsfvp/CxDLgCVXNXvrTIXfKX5taXV1kyQvQviEJ/wAmWgmMM8CEd/VOskl
	th9w97l+M6hWUvOimCqcmLFucfwCKxWs7n6Dg==
X-Received: by 2002:a17:90a:d644:b0:39e:288:80c9 with SMTP id 98e67ed59e1d1-39e1e4d3fd1mr12367022a91.19.1789623018896;
        Wed, 16 Sep 2026 22:30:18 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:18 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Thu, 17 Sep 2026 13:29:28 +0800
Message-Id: <20260917052933.188679-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
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

