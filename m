Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681469;
	b=pwTPw4VPU50cxJXG/Mja4z43TazR9Gc6+kmesLm4GjE95G7mRvoBQRbKa5tmWz6XCYkO
	 BBmA3St3SerV2cXqkfsEFENv8+TeTpo0lTx997Cue44CwM4fPoRBm/rn6kaiqPf0PYXxT
	 73ZwWuYS156ssL1eVlyWtRz68FA+2cpyn5hXQ4C+35QrH5o28r8QoYe0b6wbqUW8Hz29x
	 A52eYHb88JixTi4yCYrU0ZVaw7nDqL511b7LOiivtmd6TuySr52tO5PQM3lxu139CxiEG
	 8TluWu2Izdp9rHgsH81+rx8wgRklzoRanBriQ7hY2+I4vqHTKfbYHPTg5enzZmupoXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zKV5mVym2fjfNhUm4DLdJcnKPJbD3s5y+KWCBn/6kOQ=;
	b=b/SsmfNcyY++q99N+wlUb7x0bb0uVvSNaP4FapcyuM14maynBoRGAZ4mVV+p7kLJ4MIV
	 esjndPR0TLrk+tbuCghPIUwckndbuJTX/gc0MEg8Xa3ExLxFiLZwJe/DPqag4el4nm8qe
	 B5kX15mkuBpdEqzYygqMrpC6pjScOCdYCxWmqzx5PRJ6swBfKoua2NBO2uY0Etv3namZF
	 PdvTIgDVXjOKOtbbEtflFCGxPikhR5brjxdqQ/fvbNcLdOL6BDO6mJ/hifsrcjtPebOKO
	 TDzGl7dUYKCJKyMW0T/37IfXHXaRBHD1gsGCBOP53aRitzLy+RuFWfROLv9dl1aFIQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XZrbCmtc;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC9606A334
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCC9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XZrbCmtc
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so921181eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792681468; x=1793286268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:date:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zKV5mVym2fjfNhUm4DLdJcnKPJbD3s5y+KWCBn/6kOQ=;
        b=XZrbCmtcsAEurSHDh3pUEKiWzlInmbL06timXm120ijbGdBSB1kx30c20e1M5lFxkb
         jbGT4vWwc0Xa+9kr8cDSxTztUXmuJ80izEjLPoGodLBy7lDcc3y1YqjVyeppUNJbkHU9
         Rmj2sD/2CmmCLxNzccgxTDp3pGRp5hwR+oVvfUqwRKQw2kxP0gGxU1Mn+MSVPSREOxEz
         t9pDfZ9gM+WTfGad/PJZm1B7M9Xa2UBk0kxOXVKtHn24skryN8qp5jPF7XVKzHFQVH6a
         dztF3dyI9lKMa3DH2BO63FiBTV1IxZwmbQ9yMfpBsOLjBffyB69DykGP/epZPcD32EOD
         /brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681468; x=1793286268;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKV5mVym2fjfNhUm4DLdJcnKPJbD3s5y+KWCBn/6kOQ=;
        b=nmamgUuNU4KUxoHVD4UL/dwf88M9dwok0B14XvTqxPXlbt+wC+qrpNnB+grJgwFiUn
         qxmcQBMYyf70E0yY+G63XXVr+7rZ5UlBbldOlMjJyl4tIy1n2G8MwoHikpmQuUwfQ4nQ
         QkatdH4sKWW3V5TemGTD7dToVqG5ufdDEdgRg8ikzFuB1BD1CTmE/C8RETosh4XMYZSR
         AW3li9qgVttTgcgs8nL4kDOh1rn95sksseu1BimwXxNOS+fd5OvpHhx4sW2OilPyrrXT
         kZF1PGjfzrhN4YH8irBsde/DQYszECEfB/tjIBf0MYOCAtnZQGE4xQXs6W17NUERksuK
         9Mzg==
X-Forwarded-Encrypted: i=1; AKwUvBy99meAvfGGaIQuoLASReUu8KFwrtKYwfE0QQg8K7FwuGLR4vZu9zi1GdDTUmmTJRw4f/qFMkReazIMgS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKNmiRq4EyPe37pDoyHYhIq5ApuQ1GD7pdbs28jIgmHL2AJxSW
	fr2mR8OGqrQC3qLY4/Dwgl7XDzDvmuUK4b8Cfzrl3q3kxeIxPOCgZy2JTCFZ1MknWG7Y62Oo
X-Gm-Gg: AYBFou2Mma+AoYzW5tzpz/0TTivn0lbZHTcY52hT0y3gEkIYRbsTT5LGht8j/9vBmja
	jDH+I2FR/gReBefwM55DuccJKm9E1XMHxUKiXEShzakA2tvDRXPyfC9YbKbyA096XzJdYHAZ6f6
	8tcBoz4FHLJHPYomA+V/M1pQtPovzLWzmvtNi1NQvwLJK2pYMIVf4KYtRrtyEH9ig5VJtM2ngEe
	Rs6zMjiEj7AZE1HK8EbzMqWoahPnu2DYY+CH0X76ZSrtow62q0vBbXRUuTV3SD7VHFLTY8uWLrU
	s2K9UBixjviBtAPtypJbQknIDJXHA8ldY43+QFM6jA8YzeBvl0yZ87PCfm11FUbiLIDuhgElIxk
	WgPS3vplp3TrG1zKunmfgEu/+OoOugZ8CwKnNSUQ8SeDkDnYsgAG396c3oF9CCw88Pktn5i4m/5
	oNAhD55z0GkLXMZhFdTijkdUaN8o86DBhjhAkemC7u84SnMdkEa5QpDEDMR/V530i6UuXKGMdxy
	naE8ejAbCeOefLSyZKHXzZZROydofiLq0DruVOAPSy4Rd4Pr8Cc+w0iI0h+f9amWo9QMjDY1pyD
	3QdnRV6GU2OwYZfkzJEDw4DvUxeh4N2dnoH3j8FdhNYGsqe7xyAkpQ==
X-Received: by 2002:a05:701b:2313:b0:148:722b:7cbc with SMTP id a92af1059eb24-190a55c1a5bmr6422063c88.14.1792681467862;
        Thu, 22 Oct 2026 08:04:27 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm13886422c88.6.2026.10.22.08.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:04:27 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 22:26:08 +0800
Message-ID:
 <179267916870.2.5637290691657871645.damon-pmd-align-draft@gmail.com>
Subject:
 [PATCH] mm/damon: align MMU notifier range when clearing PMD young bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

damon_pmdp_mkold() clears the young bit of a PMD but notifies
[addr, addr + HPAGE_PMD_SIZE), where addr can be an unaligned sampling
address. This can miss part of the sampled huge page and age secondary
mappings in the next one.

Align addr to HPAGE_PMD_MASK so both operations cover the same huge page.

Fixes: 3f49584b262c ("mm/damon: implement primitives for the virtual memory address spaces")
Link: https://lore.kernel.org/r/20261021-damon-align-pte-young-notifier-v1-1-d0365ac45b66@gentwo.org/
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested both aligned and unaligned addresses on 2 MiB THPs in an x86-64 KVM
guest with a recording MMU notifier; all ranges matched the sampled PMD.
DAMON KUnit: 37 passed; selftests: 13 passed, 2 skipped.


 mm/damon/ops-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 8fc61d0..3b7519b 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -83,6 +83,8 @@ void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr
 	bool young = false;
 	unsigned long pfn;
 
+	addr &= HPAGE_PMD_MASK;
+
 	if (likely(pmd_present(pmdval)))
 		pfn = pmd_pfn(pmdval);
 	else
-- 
2.56.0
