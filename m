Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044425;
	b=fYagFB4pzaJgqzxl6HMRziYYkWyGiMlyKh/a/SoLObmXG8KfHraAnWtEza+vVl9pvj6h
	 mYjyrQSbQx23bxzwLvBwbzeqGAAsSQf0ZhUtdWcAAZOZXaQMzccIcls/GsnLg1uzLS4yX
	 H1docWEhWjftJMs2g9dpx2s/nTsRHkGuKWrmm+4oAnEOWLwUVI7MtOcqyZnSUwirPBIge
	 pFfQRm0gFTZAocHo6JVaa6uJaBTbsvz61lbROP+aMwIjU0Ui4OA+cVhbdZLy3OvGwN4qz
	 cuw/5e2O8k0HCmzSkcdPZMWA6q4VMlNgHXqeLMmYqSAlsKVj5KPC+VKDVRDjdhrCujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DTIyB5b+yzQFZkwGlBG+chET3oIYSbYIvUVhe1jopHU=;
	b=xO3ahMb1jS9B1XFybOOLTOtly0YOYqUKxlo6LKjYHJveO1jCJTwiZYT4cJE0vGvPjrlx
	 SDN0N9C1tz3YAjdzbkSJ5hCJnAUyGJd6ZDu19Sy4HQaSCjCjJCF+Xo3fJ81ApsPh/BRJE
	 J95JRUSBNG8IHOhkmYmAnBfKfgRrvyyjkk4TdgEq3B6fyvDLIbFLcj4f5ZEPkcM7HXMSY
	 5rYo9gv37KO73yfs/Ps6XDS0NijWvnSNzr0DU2Is/5fOc0WYBaOOGFsnAYTHX76H+GIpj
	 mgIbaTeWdt2y9aOfGzn6XsPOpDaDRAhA1pJZrBY/ac2EgQg/bv86Z42EORjlWqgSNxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsXgxSlV;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsXgxSlV
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35cd538de29so1707094eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044424; x=1793649224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTIyB5b+yzQFZkwGlBG+chET3oIYSbYIvUVhe1jopHU=;
        b=EsXgxSlViFWnvVaoy69Zj4ayaHK+nRSf1ObwNUSDddbTc5EF/OCvDYq1HMW3A8nE2p
         ufnh69MHW00wS9E92b4dY3wV+tYvZTH0MvMf6z8lIDcXyIQhMWZLCUYTLCG3ch7JCib1
         rCSKk3TO5nwIr9oseYoItL8H12Ac7N9v/DKXE0BZ7Ih44683TW9o6vnpg6B0vFkQOztE
         3bWFNlJJQ/QG9n35kX6FQdHp9bSSfdUJ2D/ITlEzqPG90MHAvwu2rv4v7Poff8iddyha
         cwA+/jZ+tm0g8tmVKjq9qUVwy94+ukQZANX5uOFBg+CK/iXKSaUfku8hsf/Q2sGl2Jse
         g+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044424; x=1793649224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTIyB5b+yzQFZkwGlBG+chET3oIYSbYIvUVhe1jopHU=;
        b=IKbHr4vPxQK9REBIe6L24VvSp/PgyrFCf41eC0/HW2APT4GTrtmcoqa7vjinVRU0P/
         Fi48BBAA7sGN5DsWP+T74giasj2l9rPWC2R+O7h+b646ifKrmqSu7e3X+ASnZ+0v0lkQ
         n2UCrRRlQ45timv5hUlgm8WOciSktrNPYIfKdcYR9TC5gMIRGbI1FtK7putMKXyAkTyb
         NWNHGBiS3NQROnbWvs48BLTLiG1/n1FnWcgVZchzWfqHlUKScCMgphO0weMcS23iUskf
         dgh7hGwp6Q+vlob5hal4HzUPXzE94OVrX7J8vjrerIoEor3qNBW94Insc7QdnE3LEnsT
         SByA==
X-Forwarded-Encrypted: i=1; AKwUvBwZmweQmtfA07EuvZBOfKkYWapm9JXYwVGvq1DXADfkupUdouhgN3CyDJOTW8rkQvLHuLJVvmtbUX8MY+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwv0IBD+pyApfmHDQq58Xk2lUcKcHM0Lxz0i5YVEblyKhecp1T
	Fkrhh3ghXQspKiy0RfQII0gqXCUmB6O8AYOxa6J24pArCHJVqAJpGfDa
X-Gm-Gg: AYBFou2pTSjx3P58TclwNYAZ4gXMd3cDvbyZIo0xNCze5rReVe0j01H6ZULpA2EmFXw
	5cal6FIQhpvwjlKM3EslZLcct24VB8X99OonRut60L4EFIKYv+urj3cm1E3A49wOX+qFu5fSCtp
	NVe9SbwMB1Q/Y4soCSN+oMsSuCNWe/WZ/ja4Q7/xXnFZ+JMaign/6Qa41P1nwZsqS1Q08MKGvJO
	iZakLSiXfhDV21lm7Ctwij5owQ8zjPvVvyb6YuHyehCslVRYBYYIdAcB8XFTq0Fm635oLpg2JHt
	hPgXPY7pxHDhEpTY2KYWd101u9EFozJlkMOsXaOcjg9csl+4OKjRAnUdc7Shxl3KdkdBIDMyHwe
	+N2ZKM+aUsFtjB/3qv08G6e0xwvebnwQ3l3UUQHLPK+WAakD9xQNZZee44+4BCC4g/wHH+uTbYA
	saFdlrdNAUdwm7+b3l/JRfynR2wSxaqe0GjZrJDb+xL5HY0LDPJxBJ96NsBl6pQKPZjkzAVe/JR
	iLqaZGA5hhGsLKfmXzDQBvb1c0R/WlW0F5QUI8g/F8VaFN15SuyJ41jQYwJGRteGCyaVf596CcH
	CjmQuxxj
X-Received: by 2002:a05:7022:1508:b0:182:6c6c:d876 with SMTP id a92af1059eb24-19934a928c1mr12215723c88.8.1793044424317;
        Mon, 26 Oct 2026 12:53:44 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm25821501c88.22.2026.10.26.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:53:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	andreyknvl@gmail.com,
	catalin.marinas@arm.com,
	vincenzo.frascino@arm.com,
	odys.yuan@gmail.com,
	sashiko-bot@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] mm/migrate: untag addresses when querying page nodes
Date: Mon, 26 Oct 2026 19:53:29 +0000
Message-ID: <20261026195330.46757-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When move_pages() is used with nodes == NULL, do_pages_stat_array()
passes each page address directly to vma_lookup(). A valid tagged address
therefore fails the VMA lookup and gets -EFAULT in its status entry,
instead of the node reported for the corresponding untagged address.

The tagged address ABI permits these pointers, and the migration path
already removes their tags. Apply the target mm's untagging rules to
the query path as well, while holding its mmap read lock.

Fixes: 057d3389108e ("mm: untag user pointers passed to memory syscalls")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260721183257.706661F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
Changes in v2:
- Replace the report Link: tag with Closes:, as requested by Zi Yan.
- Add Acked-by tags from Zi Yan and David Hildenbrand.

 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7e3a81f06974..994c78782a54 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2461,7 +2461,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 	mmap_read_lock(mm);
 
 	for (i = 0; i < nr_pages; i++) {
-		unsigned long addr = (unsigned long)(*pages);
+		unsigned long addr = (unsigned long)untagged_addr_remote(mm, *pages);
 		struct vm_area_struct *vma;
 		struct folio_walk fw;
 		struct folio *folio;
-- 
2.43.0

