Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF6440A34
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144953; cv=none; b=j3ATxsmEB/xNyG+SNEOTQBn6CQ1dqVFhLjVMFGacnX2ax85gvss1OAbvGcAxqiN35mcWoVkg+kdTiOiu7Z6KyJs8n2wDRu2yLdCMqIVJYj5bqmmUKMM1oJZKiTEPjyq5sDY89xqcz0i+xG7bEIAf1Jni2tPwxNw4uElTRBynBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144953; c=relaxed/simple;
	bh=6LwTUabxUc5+IDaDWcTvEwViigIdmQF2vH7XRwOYptg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pW5jzwPpcAcwvauBoKEVwvkuA4lwAT7fzNvEMuLcP4rvGy/GyA9+H+BS/CT22YpHpXDktbVwLI8De4HD49Kc0CyIFqw6s0j6jGRVfmbakPGyxvwXhawYfbKEANxOcZSQYJtV5LlXysygsqVGGDEWZdiliRVh/gEI7QCuv/TCZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3jfJUZR; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3jfJUZR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so2356325ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144942; x=1790749742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYZzRE39rM1i8Kn24WfXB8ZLiPdAdycC2kyj5f6F4So=;
        b=P3jfJUZRlxGyVPLt75SakDjZoqtiwY53Q6ZJfzam5DT1WYkYiWm/cuWasEK7+GkoOM
         UWa4r/Bh45m74OoXOZgSXRIgdnwaIoW8qIcOHCFPkF0cUhZTtUUA7islBXVOdqvVqbBS
         AciXTa9t3X0vSLnYzuo4k4BjMb9xWe70vN7ysdJDTv3DupM46mQuzP6ACZk4b00AmqxK
         8Y59wXNPyOmrBb0c72DrbjlIutMcNSZpnkEPv+e+76TCyWsMppaq0HGHof62WlR0cZK3
         mP3s+3rAQ6PR1RxyeL5Wuvtl/2sNBeJQ5mBf6Pf2fEnqgw7z3dYrvVYhycUQmj6L8sGy
         luCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144942; x=1790749742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYZzRE39rM1i8Kn24WfXB8ZLiPdAdycC2kyj5f6F4So=;
        b=yGyBEAcZAlCknLNfI3u9ZSfvaxAJvEX2zZus05uGyADZ2zV5TUG4sMMJMSM71CYK79
         G9+efzbZURw1zQUOXD76Fa3Gwia++o8HWoJoH2S5BvnjMQG5iDgmdgZ36Txz10WdE8L1
         9BOQpziR+Q4fVEeSeM994rpNUezK+8wazwG+5qyuODN0scBFsEY/i7lybtMGko91T9v3
         mjPt89Hh6oE/JtRNbESpByvR+uh6pEwXewbt3ru4EusWegfzJmLIeD1ua9QJc1GWKTDl
         De8bubp58hGX7J8lSL4pF6B5dUZYfeBtBCG5jjjBoUFSPBv2jYIVkBfRPxZH0RNWbWrv
         9QDw==
X-Forwarded-Encrypted: i=1; AKwUvByp02nwQOFNW7kkKyhZVLPFOnaRGtFBXwm38tdrXKey4iTdvruVmv6C0hRE2zQNEIrWw/58mialnk8K0aA=@vger.kernel.org
X-Gm-Message-State: AFuF++nRxbuyea1DqsgMbBd7L5MkMN06S+rJvQ5OLH0OkbOeTqbekWza
	ulQpHKCXbuKxVlrZg0v45I4eZ93ZFOBUvZDtFfKOw0zY4R6dz2F8Bqd8
X-Gm-Gg: AYBFou1SSfeeZtCt4Sfdq1kONWbBlZC7+oJN6ush0AiJipCitp9XdVwq1JE7E2Ut/cB
	MZb3P90EgjOtNJUFdm5hGSP7DeNLVIpJudB6Mh0kM70uZbcDcuMruyxoUeAKkoWrJVEv4P5iH7H
	6q5stU3BFjQbKtFOC2w9+aBmeHlzquCuj9oifGKX/P+a3qkrk2Z2Jicq8hrQ6JX9Jt14S8WAFTq
	bZVALSUxf0UxVo+sr9RhBYOPRE54QBL1eakJ7We9Isq2Vc7L1BVwXKOT7arL4x1kk1GhNqL+LZS
	G6GbfUV2HYHgfxxI+WduSXV/YhBvsRSbL7wKR5XtMdeMFsfULXmGlTESLtwUUtD5lZAmbtQ1Bvc
	AqTWqPDndyk1IKierLMRpnAPhLtL5+VFKfNSqsH+I/ewFE0WCMHaDX+plxX9eJcsXgx2K7dh2lX
	WMQY8E4nepMFJUOGl8ggmlEElS+w20iBZUTMue8oqkkQaccoMJdrpOmmOCX5f9fY/UD8EAcaufJ
	bD/CDmvJivaNon+KPVvtWg=
X-Received: by 2002:a17:903:2350:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2df69d689a1mr14297125ad.22.1790144942400;
        Tue, 22 Sep 2026 23:29:02 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:01 -0700 (PDT)
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
Subject: [PATCH v9 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Wed, 23 Sep 2026 14:28:26 +0800
Message-Id: <20260923062832.479455-5-jiangwen6@xiaomi.com>
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

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
longer a caller of set_huge_pte_at() on arm64. The only remaining
callers passing &init_mm are in arch/powerpc, which uses its own
implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
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

