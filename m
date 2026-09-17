Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFA37DAAE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623013; cv=none; b=fvQQ21jj/xe8WguFntkwNWIngcnlU58zXS3GOF1jT2o+S9tK8RSH3+JwtRvBOeRDmj5u6wUV9ew4aifXKBhdcFMyyEVWJH7KUUDTi4Uy9H0XrJ4IGucdnlBgbhOzAp/MoR+uRsjlY2oSWa4sBHGTnFGdxkIJ98cgzoRx9mivOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623013; c=relaxed/simple;
	bh=yo3vtO2fmEY1otZDT0RqPL7Bfe1xvhyeqH2fwkoy46k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EXg1SSRDugom8n1VRG4FWVB7ZzhANJc4YeQRRK7bjp4kbkpQAqJ8UkuhuYpgqjrL/vNXt0DWN0r9Dku9R06hUtLzeS8kKy4Yg0KVJG3uLzvbVPBlaGUjhnwLBCdHvytlvzlktQDij/GWkz0gcGacjls2nImyc2djNdhNh5V/tM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSO9T9Co; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSO9T9Co"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db22383fe8so2717395ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623011; x=1790227811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynKYarepbWl9Bt2lXEeL1/lRyqq80+H1joWy3Adf4T8=;
        b=aSO9T9Co6ZbsnkB64IOmcx01OupH0wWgmSzphYZzQi4LQKFxL3Tu/6M9u21v7i7Ept
         ZJdnW5xdi/ioDqRNxwG7ZBonKDjQBJk/lx5YJwSv1A7sLpDBC3rwMq43p7mk0N+0R0IX
         TVUyKnxJfVRf4dsLqE0E6AV5YJ2w+Mg9r10H6JxZWR1bF4jnGvizKHjlCSwp+AZ96pe0
         3foRKF6NtTnx8w75KofxvgXPx44B1NLGBPMNKbjmovC77g1l1hmGn4dodHdLBccdEN6P
         eh5+ghOg6T8A5EoZaqZro6dlj03eTMQ0hxv6mNI3eXC5MFwuBBQeQ1goSl6AOVt1uxmB
         kqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623011; x=1790227811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynKYarepbWl9Bt2lXEeL1/lRyqq80+H1joWy3Adf4T8=;
        b=c6+U4KYYIqQmsznZAHTJXY2Unw/qAmNRn7qpNcmfGnKSci024vB7BmIcFVvIYHUN0O
         sJAUJkTX2lD0bGTiua9AsrAgof824OA38ZCLgo1yrBi59VvL1WjDHsReC5io9KDSGnsn
         miM8YAXPb8TgllHyUHQxmdTyv/mKe1aCfGjemrhJNXNe9Egcrf8GFLCB6yAYRCh7EufZ
         +HmRdMuos8J6BG9HF3HgCFlZsNLMYJbleNhFbUeNcGykFB/JwoEXevbpANem7xJsXQy6
         WFp9OOLekur/Lu58qReYGpHkUAIUvxZFD+Rt9D5uofatlCfY0BP0VqgeiB2eHF9i1UKW
         IJqg==
X-Forwarded-Encrypted: i=1; AKwUvBxZfDOESJO7xMobIqCkElA1evlo6raRkx37Wo6nuwszeGMvWTRpBOd3I9jHI1n3NwLArzwVaNDTjHa4x04=@vger.kernel.org
X-Gm-Message-State: AFuF++kZhiqUWYCzNVhtNwU36HcqskzjmJraaPGaHWB6owfssXlUVITc
	JJDqAoL+LAtN0W62qjXVxQvjLPrY95PDnMEIH2SLvk2CL9PnTDclW+XS
X-Gm-Gg: AYBFou2DkUsOwnVlxVPnkW7oJ+MY7N218QY+VC79bmY/Rdh3xwVNy81IifXj8hushBu
	5nbIRe8RHPXo1ISc9SQaMSkpDE+fzzdzVBQWGiTAycNgfA5n8uCvhA9G/CQLCxsrqXVKDjtuNkg
	scKmNYhS083RiJeQHy4fr37OziazyQq24R85rlMhbpOazpoLpHFn0kLWqxtwWNlgSjXmSB/ABpx
	X+YVogUhwoyBdrR+Q8CxWKR5GAv9/omtUxGj20ZoczV0ZouTMY61/skOF4lmKGDS9E/H9oqK62E
	D7UrPBDppon+vWAQCloToRIdon+EhwV2VXhqa1AnR6Epq9/CgS6GRWeu5hl99SXftkAVOJwuxmy
	4Pad6tKJKH02iewVn7ttmEwoW1IR8JkyAlGygsd6+DRPc/Y/5FCHHyyQgqXQNgTTvz/h1mB7Xqb
	QdnKGoZMVIsfT74yhgNM9mjl6JCbe44xOP8csLXYVZev9vcXB88AQh8tteCGrkUR0yNkSwaU++e
	oNHGh/s1shfvezpTGszf5oGJgQ=
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr17718864a91.10.1789623011402;
        Wed, 16 Sep 2026 22:30:11 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:10 -0700 (PDT)
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
	ryan.roberts@arm.com
Subject: [PATCH v8 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Thu, 17 Sep 2026 13:29:27 +0800
Message-Id: <20260917052933.188679-5-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

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

