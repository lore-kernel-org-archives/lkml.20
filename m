Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776791;
	b=GwYNw8uLY6mSoSSmV0wlhp7LpNftjgaG9IGmPKyUVf1HHFm4filr1gWiRl7wvPGB9uVT
	 6LV9ZaA+O92E+qstUfQ0Ij+I2Wf+xqIH3xqpP0PZhWTOerzisaH4KzdJ2TfLq2Kkktvtu
	 1ghZ33T/J5lg7qpnu/+daFzB2PYyDNjzmnJ1BwK/aUEsTEz0XESrLn+oVyG2+J21mbSkF
	 phuWw5gal2JZIw9NBQ4BDHyJ6MPu/l5g8981Ce8Ih94Ag74tvVIPhCh2KdVfHAp0+C68d
	 VHLuLEcPrrPexHWraSEohMAUXACYpL03Csu0YM9m4fXXbYI52pT4M0URrDPoVsQQ7Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
	b=ZOfFOUdSzc2UlH7ZF+21jSq8LA4FKAm9s1vwtDSnr/eanDotfkz/XG7NStN/Ft7avgtL
	 ic0roaYbsycW+gkJOWcolIjfQuDMHhuMxQpIayDZaoxl2Aqjqg4LhY+sV0kOF/D72gmpG
	 HtelBELIq2jS15Sv+RGb/k9Qvvi9piyumEob9MwljDTdMalpc1aefVdHclTxMqnog5rA8
	 3oAflJIt67z1iccUY49/TgoylXhRy/e3QRCXbpolBGSekSv4YotTFqunMyxlkVa19D67w
	 33d2jc+bfbc/ylS7oQzc8oYW6ClQWm8KkIydw7zJhsQcOHugT1ULeKhjJl82g7jz4+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BsQDOpiZ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8284606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8284606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BsQDOpiZ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so276272a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793776789; x=1794381589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
        b=BsQDOpiZp6h1M9dYcdv0X9sKm3RH5Huv8G9jD2y0mrIwWHEvM/42kNCh7zkljdVzD4
         GCoI/WvrddM8frf3XXlkFDBTKjls6IBrIzHLWy2+fBum78ajW2XHujUEDtetIrn2JE4O
         rmLvMghKjnqTxCIBov7v/1eYwcFOJUGiZvyXMKmNpMpDpsmDst3tzkQ+M04fXMQbmIza
         xAW3FsSJhhIH0IBBdTLD+W7/5khuFtaBHnONpFWJGB9QpuIE4VFN3bAmTodmuq6WO9By
         C6IXLgh7UiGmU9eUy0yJnZz+DMA1dxZQ2xlka0A92zjL0ehftOtMsUvfd2BjD66c92AL
         6ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776789; x=1794381589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
        b=Z33o4r/eAVYNzGXB0HlSQSVXwXslejW59pTa9YgRXtA3f6Xf0ZGxwLbIP48a4XrytP
         x4fyTLdreJHyyCgfjOcaK/9JS5bgBEiUNCyyuEpsRaeRD/tkCehUZoFRnmzaE5K1NPih
         ESQp+gWDq6GutfzTYJC75caBEvntSHrNtbyd4IyhM0u8kVaYXQ8XpJcdvkcqrb0VACa2
         8j8GFUDf7NR2HTWkcwX2B9Za9hGLXxAkhitv8DR9x+ilbNPGzkUEMbB8FTZ5AMgUXy1d
         dZlCSb6yS/G3l14SOKBBJjrBaCMPK/2A72DWjvaYFieyT5Gooyx18ORhwrP/HB7T2UU6
         Reng==
X-Forwarded-Encrypted: i=1; AKwUvBz44cHM1HKdC3pLxXDIigKPw4gx0mxrMHXg/UwtMZcgzk28E//2ww3Dqb1x4s+077i/b+xZPbszs1uj5X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H1efQXW/FmDrn+IKnac9bhqQLbaUSxp6f0Cxc0ptu4SH3kAZn
	D7DudkrAl+vqkPwyj9eyGRq3p6pire3cewIDtS80hfxObHzNhWuZ6kEzO+1+9GXM+gQ=
X-Gm-Gg: AYBFou3mVW4NSHCzgOGO54VscRn5U/Pdd2zBbiAj5VG42R2KrCtGP1IJTuKeQ8da3IJ
	XdCzv7wzMF6Aj0xbJDzLe3dbq5/Xtc1NDI6bpigDkTOr9vucgrq1HIu5zZDBj0NKKh6DySl8+7w
	ItbzJW9VYIoqWlNecQnMwpRsU7mSPMXmZ/fA3a4tVSR8Vfvm2BjuQZS0KdHQwzxavpQ8BuRMITZ
	mmB6rJokCs6oXUs4ZJ+sAcMT5b20aGykngdoI327yc5V5AD+6esdw+W42Y6nE75XMG0vNJ8PPsb
	Y8A4ChEFv/MG7nfKJiDpr+qp925I28RTK+82HJOZVz6AHKNxz8CfeRqVckwib09K4q2SzTJeK2J
	QQwimwBhNL2o9RJQu7OS68P01orRI9oMxfI4KvbU5vF9W3VEZi2b9Bhd3OvKdFRkJPqLg4WgO/E
	bguIBNsn7UgikyyhJbk1wHev6acQ2mLreb4EScmJGxXnca8Ll7g52/ZDlpvutrnuAoXk83zklLh
	49JWbRmVKVmW/nLquW8802VKp6lTYb9GzShhYKaOvuYc4GZ2DLX99DmWLKlKHjiRINwmNAUikZT
	jLE625eZxH6hbCsmLzOSDoewFbv0r/dxQv6k5Fj1BzGsGTcN31Jq4FSLQ3IQMiJtDMxbl222
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr11952482a91.39.1793776788793;
        Tue, 03 Nov 2026 23:19:48 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b099189fb6sm1027403a91.2.2026.11.03.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:19:48 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2] mm/hugetlb: fix validation of unsupported HugeTLB orders
Date: Wed,  4 Nov 2026 15:18:57 +0800
Message-ID: <20261104071858.757793-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
LoongArch. Besides dropping unreasonable upper limits, this allowed
values below the architecture defaults.

With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.

This invalid configuration is accepted by Kconfig.
BUILD_BUG_ON_INVALID() does not reject it either because it only checks
whether the expression is valid and never evaluates the comparison.
Detection is left to the runtime warning in hugetlb_add_hstate(), after
earlier boot paths may already have used the invalid configuration.

When an invalid HugeTLB order can be identified at build time, reject it
there. Otherwise, reject it at runtime before the mismatch propagates
further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
while dynamically determined orders are checked at runtime.

Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
---
v2:
- Move the order check after hugepages_supported() to avoid a false
  PowerPC BUG_ON() (suggested by Sashiko)
---
 mm/hugetlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 779b1de33c78..b49130eb7ad8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4197,7 +4197,6 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
-	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
@@ -4205,6 +4204,8 @@ static int __init hugetlb_init(void)
 		return 0;
 	}
 
+	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
+
 	/*
 	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
 	 * architectures depend on setup being done here.

base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
-- 
2.54.0

