Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA01519E16
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750611; cv=none; b=IRaS8HGneWRLHIwK9PVmpqU4XJpsbc7j8ribV0v3aJmYLLWTVHtBrWvXNxiRy80r0pIJ4jSUgrtNSS14AB8EikpwSI19QD98Hz4aAHg1bwbhsleKuXNxBTTa4ozXV0qVtgS5N58NfPP0gdMojX/Ct3/Vao1GuYWYwoAOH2UjLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750611; c=relaxed/simple;
	bh=JTKr9zGlTOfDywFH50Zb+GQX1fiqtszoklwR4sep+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6ODmACzYU9467JWAYN4GOw8ET0KPwrKSqyFJM63Wxco/fK2oDRYrjLrL1HfbjWma0QBitzzYsHl+OtBHDPGghWY1idWIUE3BuQsuE19H74aiCC29TMInTFARW8CTCHe1R4EzOqfJMTjlCWINcyjllwrHXgkYiR6/rh/Y/6Ruxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiL08wry; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiL08wry"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso665372a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750608; x=1790355408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6h/sDBFqjd37ju771nN5V3MCd38OzMJDciAFS7M3bg=;
        b=TiL08wryJaGsRCFuO8L4hijhiYpgqyti/1ik1JeVEQyK12ilpkchoVf0YHZ+q19Jny
         ymvLNnnnz1RLAqbZKwpI82WVPCEKz0SfwhvxoHSYWYXt023wT3cF5V70rDu0n75XX4Ij
         ROUNrb4yQHLXf7+raVH7rXCzWwoKXogR3bxWjr+NzgdeNtF6hu5HrqW1AT6Y9nlbx/Gy
         oeb+Rav0ql2NSsmmCOWHrZTRrwfo6wogQ6BqSFNg1M3McKeAAQlC3TE1iQ1G6QFdMACb
         GeIDafZvgeYANN3DRWihqFhej6YF1dwyHBTNIC4jDCe+oaAnIhtLVEvKmEgQUR/78i63
         LqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750608; x=1790355408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6h/sDBFqjd37ju771nN5V3MCd38OzMJDciAFS7M3bg=;
        b=wtY1/pt4sXGgUP5UaclJU6dCVJgmPjTXtuvJD5mO4FKSIbeJYTznTIixtWUFHNVNhA
         Gip3L8lNfF9lxFkX9EBx88klKItbUR3mQ+Ku1BZ1T2czB533kHdyaYAas707SgDqRy9Y
         oVWlW/SUYawGVZWGAZgTvaV2YEVQZkyy53VshIPDbCHh6SrOLW6zB1QU+bINxrdI4Ouv
         4/Xc4OoETIIWjQERWwWBMdP9XBP0Kfy4E3CBdHx1MxUt8TRCcem9/4ybd0IRV/+l7Aex
         HqLDCGyhH9wGFEi6S/yaUA75E25O9RdRBL9rcKLFIBtK7p6N3aHlGrWIH4OXIQ8MVz0M
         HKwA==
X-Forwarded-Encrypted: i=1; AKwUvBw2PaqdHfb7w+fLNeq7ucIbvOFNkQCdkAUj9eqmBaJTPQ1gc0HIJBEdnZJWM8XnsKLy6TYk5gIDFuvRY6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kOw4N5y0kVC11DXYe6xjvs+6iqQK9pbaJZ+tFj8lVBcbBtkVof
	mz+LPky97YNrFYpK6r40zdYOrJ5LWcvIvNdZzobQEbpuEq2bE7if/iSdx1Hgwg==
X-Gm-Gg: AYBFou2NzdrxIhb14UsFsszXaAKu3MY05HnfdnfK8uYXeNXUy3GCbdzv7TQdIgfbj1Y
	y4K3zTlJUA1aWOB9RfuO4lF7gX/moAX+XQovhoTw91a394PRt9ynKeTZecYmQRUGQJ/Ghxcc2qJ
	YDLKL4i9FIuk3GrWI1F8Tdtgu7Dmtzouk6JeHcUvXFUGZYDXLhgUsBPSa5Ih7zNJObARcoxVo3K
	ZZBIcl1u165iXGluyoPc3Yx7Rd9bJOduxy8BYgknMiyBhnN0RtO8hc2ubLThgGgk41MzNHQ7mtQ
	FqUwMcGAEXh18Ta99XxpquXCSLyDUVKz2vpud9tO7yYObh2RoMFvYPM4qKSlC3XMr+BO1cES3xu
	mme9xpm3WkUkUxJV3XHWuJMwVUko3MqZdEilUI4bufKlwXVQ6hKClkk8/jhGCF1N6GzF0lBWS3u
	p1AsH3J549Zn8XMeLyeMqm04mYo17X/4K/OfPhWRUqvDS1CnLWAZm3tZN9ChznhBqf
X-Received: by 2002:a17:90b:57d0:b0:39e:6c6a:2098 with SMTP id 98e67ed59e1d1-39e6c6a22cbmr334561a91.57.1789750608280;
        Fri, 18 Sep 2026 09:56:48 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm253816a91.14.2026.09.18.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:56:47 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Cc: Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>
Subject: [PATCH] mm/swapops: remove unused is_hwpoison_entry()
Date: Sat, 19 Sep 2026 01:56:40 +0900
Message-ID: <20260918165642.1014988-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 93976a20345b ("mm: eliminate further swapops predicates"),
is_hwpoison_entry() has no callers.

So remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/swapops.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index e7d0d529f3e0..603f9e3f909c 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -261,11 +261,6 @@ static inline swp_entry_t make_hwpoison_entry(struct page *page)
 	return swp_entry(SWP_HWPOISON, page_to_pfn(page));
 }
 
-static inline int is_hwpoison_entry(swp_entry_t entry)
-{
-	return swp_type(entry) == SWP_HWPOISON;
-}
-
 #else
 
 static inline swp_entry_t make_hwpoison_entry(struct page *page)
@@ -273,10 +268,6 @@ static inline swp_entry_t make_hwpoison_entry(struct page *page)
 	return swp_entry(0, 0);
 }
 
-static inline int is_hwpoison_entry(swp_entry_t swp)
-{
-	return 0;
-}
 #endif
 
 typedef unsigned long pte_marker;
-- 
2.43.0

