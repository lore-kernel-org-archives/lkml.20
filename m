Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97525F99F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986899; cv=none; b=VMnr0M1GuvVwv2ETtAwVvOJ4x5r5gG79hNJYwDe7MS/GTTpT75wkI13Q1cc/w5BvVMg4vTB66cSv1A87SVQRcFT1n76KXkAUD4/b3zrFjINPgDZq9tNyyKLR/NEQ0zQ5QtI51rZJkWALp06MVDe1cxFcfdT5YYAuwlv9HuS2a6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986899; c=relaxed/simple;
	bh=hWiR0FWkr16tFUuqmYLUUy9gVKRKCZdyCkACieXQ5G8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OPsESIVwtT8JBqsdpNZPtwZrBShPNY6qi8k/EFXcE4TvwYWNBbACPX3oiO+0fY6Ra7OWlFi372FsqNcsbDnyeWOUqzFAkunmHEmqOi093uHOwiFhDzvvp8dSAoi1TBZq9TffTe4uTpUrZnDJA0A4zmW+wg7d1JqLhNZmsU5RQng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PeR/g5Zv; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PeR/g5Zv"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so118894a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986897; x=1791591697; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93aW5kJ7TuXndYGEWNCSD+XJA7ltxFbIps3WQL+8iZc=;
        b=PeR/g5ZvQk563na3RFm6Ucd/T1vPFtVE2Bc+9/1Yqbbl1Meo8hFws7nSLSTJIUbGPK
         EzGE5hpCjWDl7yfj4yQ2m/9DsDbCGniuvUjz0X8WpMA9WnSA15Aplm7zV9DSbogmi2eN
         pyJtx0zl0WHRmiy9qdZISwhKP4ABSDj3v0EjTu2rlEjlL1DXBFtss9DV83gb4WJyHfaj
         n2PsgLSkRsOkPP0t8voTVcOZYkEhDNMwKCrE7+brxrOQEoLgZTbry3BBeysbBrjyXnJx
         714nce9P8dHXBB6FpsCfAlq2pyiewPzGH2Y0nVOop+aI+yHvIcaKBD+91i/EotdXrU76
         wQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986897; x=1791591697;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93aW5kJ7TuXndYGEWNCSD+XJA7ltxFbIps3WQL+8iZc=;
        b=CMsBtwKcU+g+CqujkWSkbK0M4MHn1UNbhjuIvPMmPeMfXk5H9qI2AtA39hVyeYE95c
         yrL1dQ/F4wwmnP7vj/RhfKTrZsTWv83/vCWFU30i7ETI74MUZvFmGURh8/G69Hc5CXw0
         vR5z4y/ShOIYkC10QaeL6LiqxScJha+4nShsR2wfDjwmYFOg6vODFX/nacfq2/O6bKkL
         GYew3kJWPhlNZhuThojCvEmRsaaoKBX8ZMnr/9Ab8O2sV5eu6pvX6Sda+7Qk1nJHOMab
         me/RtraoHgseX6PtaX4ytuhFgAZZK+sBE4dmbqXFSFYTOqlz1zEwgrBZGt0ydovF51M8
         GV8w==
X-Forwarded-Encrypted: i=1; AKwUvBwgVsqjrevp8C36buaQBrarZ4NsgKhSw8/a7rOjcv3T+kKLTwb7gk8fbpgAaP7/gvBzr+IHZ7pf9jci02k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG02BmrfD4oT66wNuPZwSLQuYwkRFpAbKwml5wgFkG+aB2Q/JA
	qCxdDSGJinKNNsM8Cba+qgg5wRReLfvND1QFFQkTXwfBTEsH5GDo48jBQxD4SAm0lJHPU6iwj2X
	EobsLWbMc3Xo00bUoJh8AmQ==
X-Received: from pjbfh14.prod.google.com ([2002:a17:90b:34e:b0:3a0:6f00:2a50])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d86:b0:39e:6c68:c77b with SMTP id 98e67ed59e1d1-3a6ce83b91emr4273665a91.49.1790986896998;
 Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:06 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-4-jthoughton@google.com>
Subject: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

vmemmap_remap_range() can potentially leave the vmemmap in a partially
optimized state. In this case, a TLB flush should be done if the walk
caller asked for it, even if the optimization was not fully applied.

A follow-up patch will more completely deal with partially-optimized
folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0057fa2a16a8..1a2645c382ba 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
 				    NULL, walk);
 	mmap_read_unlock(&init_mm);
-	if (ret)
-		return ret;
 
 	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

