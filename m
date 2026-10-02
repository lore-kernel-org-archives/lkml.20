Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27046EC9B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932222; cv=none; b=idQQmpl1w5Ikw5g1LAVgdc/rzdk63KWa/S6xRu5Za3BwapeDGl70H2vsSdoOwc8reQk/QY6pAG07rslIKJeXw7gbX8Re0+U/o1QXHEufXeMSsusJy4daXDE1wHfH5BguTxKb5yhKwlfvDUnxQQpe7JyyTMlsfCY5EU3IaC7maTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932222; c=relaxed/simple;
	bh=VYIcqOwsTN5Sl5eevdfX8pLgQeULsgXZFrbXfWHMHxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gmk5BwGZRDZKLVuVAofs5ozUIaX2a7NJLEuSCvNbzFpAtizn0Ha6dJ1htU0u+vtNvi0RD3oVKfmOxxjYfl/nSE674HCkx9+/uTQMPIPhxVQP+ZBu+EU6P0zJNjg/D0aNnsJqB3A5k/y97jUEz3MAU180aWqMyIDUCtcuhH1VoUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9kg3ToK; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9kg3ToK"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2dd05994cso12548455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932220; x=1791537020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTdpftTlHppV79iqmYzW2DHPoEL/OonFlSGPOrnWHYM=;
        b=S9kg3ToKxZh8i8HcsiERXZD2+oTJAbf3ta01bm6IwPa0Zw9v+A6I/RmIeeUfSbEZST
         vk6IEEOG6r+Y9OR8WJqKr0+BgWXShQ7+r7fijMF+IApC3/gAoODmsppWwrT4sOlrp0R6
         xc0P3ITX4yESuoAQfj7j2VCs1Y3QrOXMPwLRZmj8xvTuP6Y13/XyeOTil/7zkkKiqPb4
         m9vQmv42fdFzzxCvOmReLMOCL4JXXiQ0git4dkAaP+F38dUZtCwqgTnOK8FAFH1n0ddP
         /TNC4N6joaun2asDg+yh+5pPzqeXzLB7/0+jvZ6b/z9xAr6XYn2CVdCGOHCLimImiCdH
         HiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932220; x=1791537020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nTdpftTlHppV79iqmYzW2DHPoEL/OonFlSGPOrnWHYM=;
        b=opgOlBmnUgkSzwZO//mAN6+XbCd8HteKXGpg6Pjm5vJ1+4JrpSi+tNjZ6LxiTGxNm3
         WDP+2tS6z5O1eTsjBbEkPrZICFtTGG9N6qk0nylSkWUJJLW9Q3zlzhN/ijT7yd5ngTSC
         065Xx10vJnS2cEcF5zcniUgcwx4Hc0b62lGcMITlIbBkoxKavnZe/O/RqAJnIy/e/GyY
         iX0Ra2v4HOhV146BlZlpfYwtseitHMtwMLMP9OuRUqK4Zkp4ghYX+4dwxSaB/X3KatlX
         eiGPw7ufaKl7xTY1Hty4AfkBqS8zVrcgKcAgFscn9hSOY2l1LoKkE720iaw6XsUeDXaS
         SvTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/KN8tCbWurulKV+GNDclJ4d2uDz+D4G2MsP4KDncmGJtXX5HdvlRoILnFhNCwTk9J4LyhaJQIsYwkRtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN63UER8L6wyDHMB9XZbzoBTxpmsRsiIl/J1e0bA4+5N6HBwMI
	0v3H44p1fd3EfCvBjs/xrvB5H+xbckJ9Ilj8lshLccIG2qibPz3VjMFD
X-Gm-Gg: AYBFou1FAE6VdKidhmtIck8OUfxukSpZ++d9hb2LMHSJKRaVGY2kmYmVP4j0jun2Yo3
	k50BmY5D5E83TYyKZJ+SNO5opAq3PvBxT0XIPMBA8grcSer1aWWsGWd0apJ97A2lTjR4+n0QwAD
	8pM/iJwb3odRM/jsCYnIxJUtEnR1QGkd80MvmNvfyKABnCbdAdBVIIsCrbpKwHgGr8dAGIwXil5
	BpGQvV8/M/YWEDnDyS2yBKDbzyLcfOrahbBK/98g4YA02QuyyEVcvKjwNlh65AB0z2XfeCJyI8v
	B5WS0op7ZlhQ6/p6ze4iMBwGJMaPLqb6+ySWVzwh3FDhpPndFKE6/CtkDDvXNeemtmdgTXX11E1
	xE7d3b5V7Y78hoZXK64P8/rrdN0zIxliiaTh69WMTbkdrP5B2Nrnl/jTOZdhMK9AY6WFpfkx45T
	MokAM2k/ABo3x33O7zOUym8qbEwwSZ/aD9luxz8H92GORob1TNWQShMrIgHrlb5jYjFETNMzhid
	GkhiNrSLQEl6sLmwWUEdw==
X-Received: by 2002:a17:902:e88e:b0:2e3:598:75d5 with SMTP id d9443c01a7336-2e49b6ad85fmr18169625ad.74.1790932220371;
        Fri, 02 Oct 2026 02:10:20 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:18 -0700 (PDT)
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
Subject: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Fri,  2 Oct 2026 17:09:41 +0800
Message-Id: <20261002090947.869220-5-jiangwen6@xiaomi.com>
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

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
longer a caller of set_huge_pte_at() on arm64. The only remaining
callers passing &init_mm are in arch/powerpc, which uses its own
implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa6..ce247b06fe03d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1

