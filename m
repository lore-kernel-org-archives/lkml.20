Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018559;
	b=Ub/x6E3+4H8GoQ+Eg8pGaYGuTNogjLzSNn2UqW/Ck43MqpKaulggyVVjNo1lUP96m1bM
	 6aR651Bd95EoEj1ONTPhKfZwmsM9/RKV4nSkZD3SzNVF63ftnrY0FEGBO5oPAf4UdN6LG
	 oUXzPeQ6Td7g7QJ+4yzBotrZAQLJxvh8UTaIYrXaK20UYpeNtySsS4lhIdRzH16+a0g9Q
	 ADfc7W5ax3bLL9U4tnsxCqhAQ/Nuj5Hx7rb0HhkZ85hbZQx9hr6A4HYU66WwPOh3w6ZR6
	 jOAuJzEUb95ZC8lG5/cOyQSVbIj0gxlXC1vFSFTTi+0fEpu+NGdQYgAozQD/mi6zUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NQXpLd3G80J/dmpcLqjd+RdJWhUp5qcgTvnxnG9ug9I=;
	b=euxnTcvs6ij/r9cuKg5Fpe32ER6890kGJTxxSDln1Cfmzr56N1X75xT/ocuTJ1XbxX53
	 /atTJnInh2m+WHksGs0C5wGBc3TC/hWvYnjnO7AxyYIm2ptUVHIoKV4jn37aveQ7SIxIm
	 BCMJXdsEB9gwNQdDAFB0Fcjg1Ekz2ixXYivHRlyBwb4Hz1y3o7sXTAFoGtcUFQu3P+1Pm
	 ajaBl+i4yZlbiWbjHfXwnsu/UorPYqWb4SfoqBayi6wZNrYpV0kGOti3mu5Vakx2x5SJi
	 +tZpkLqAK0NLvDHOFGs3iVbzHw8KJD2uVL1k/FNo5N/dyR8hbhmrNGUmM77yVYveMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="Hv/gbKSz";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FB606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019FB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Hv/gbKSz
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1637160eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794018557; x=1794623357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQXpLd3G80J/dmpcLqjd+RdJWhUp5qcgTvnxnG9ug9I=;
        b=Hv/gbKSz/ftIDOEtIkiFWg0RDYwGA3nNLsTF3VxBJug1HdaXrjmOBxKB2omceRrLpL
         RsW6fw+In/lT7WbO3sXFtKKbiPkqqNcN/OtJS5f4P6kJQuRzLdTjexpbJg9oI2uzPHhq
         zRViPcuSQwruAeFu9SL5g5545lKYg0cAxul5rhTc4DVzyAIUVzxTHnIYlSm/itJ5xj1E
         T4vsfuaqqw5EQMPsO+goEZRKQ+FZRbMwsW3Iyt0k5YQZnWwj7SLRa0o+rAbk3Uletiq7
         jUzkRvvz1Pa9dFH753ndANtmhJxVvbKmkPsqvgxUhrDlAU4+6JqVn7YZbgUIHxJnaEOW
         MPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018557; x=1794623357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQXpLd3G80J/dmpcLqjd+RdJWhUp5qcgTvnxnG9ug9I=;
        b=ZtXyID8c9thInxgHYf5nv8iS+YaMNJHhSC0wZ0rG5XxqOpbrSKgASI64KHlYbIkrHt
         JlB9RuMBu0qUgLlUI2dKTGPl+0i8EM/Ga1Yp54vsJ38iM/af0EB54b9bPpFtnVc0UJS2
         7VM34sBwtUBoEPao6T/ZpPOCfz674j8nc9ASPLqtCDsJ/qXcR8hGDLNIyDOYbrWrEQYu
         /ZbN17QOQvcLOOv4aPuS5ZOq5TtfPquVbTyjMfBx901ngaEpfYX6Q0BMXQG7f0zrM6Jz
         OSTzxyrBmRxtws8s04wbklJZrlzc+koqg48ayxVKBaad36Kq4YEL5o8GYOLOTkQfnA23
         UpOA==
X-Forwarded-Encrypted: i=1; AL+hErFbd/WV8Ths7vZTVH16uYUnwvuzAleS6lplXbjw9tsVxzgeHEF4wovZb4mvZn6FxsdhlPjJg4OlxRoHnpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T7cgQxQ5Txi1SNdWSy4bPgK4omnurvA5a9dXVYN6L5Rtx54y3
	EouDP7YQld0A/gsm/d3K+jyZP1uu5v6vH7p9aBPULnbd9fgtluFtMIV7XpWSWV8MIUA=
X-Gm-Gg: AYBFou26GWkxclvSwKogJPHQ397covpeDz93750YGzztuUF+2mrdcUWmjiZEkOsiUL8
	ywnHzQasETS3y4gl9Dz/k2EXg9PfK1vkn/OSqGNZnt6zzMJyVqRKIMBBwwBJHSKMNNl9DFVTK1p
	ee2NUZgeMxUDhjTnpI8HOQXj6+chVnJHxV521Yd2Sm8JHDStKNeKATyjL+AqX5y/cq43aXMjoOw
	Fvv1p+igXyrQp5QTbVXNUH4n71dSaDGOz3Nd2EPko/GiTm2iQZ45+yaKi6Oos6rZAZ5idCpEDfV
	jrKCkTnDdiJT3bMIbk8rJHUB/hXM1V8dhMveeoqimF6rNTVu5+BRGj99gQ6hcTkgFuRFsJYASzU
	/G++wTQ9d4fKojjcRnRdxlQVp6q+3kNyDeXPvUVu3V2a6+8Rr+Q1tQAlAN28SBLSVo1AEMXSHqc
	m+DOx7Mslx+ELGNf8yPggXuKXyAs/zRa6XPTr2N6G8ZHNZiblXPMKwyJhj45yRtSiG8AiJJNtg7
	7mjzhwxZdMiEspn0S9SsEWlVZEWi92WwotABRV+OZz8sBN0qrnqVxxPNFPqSSlqdpm1cz13w4wH
	WecSV28vzWsPyxQU8+gLtQCdvaPd70VUSkf2puLhdeISgiFO9NGC1J+tgoSF
X-Received: by 2002:a05:7301:dc2:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36f76b18abcmr6279268eec.35.1794018556813;
        Fri, 06 Nov 2026 18:29:16 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10457077eec.23.2026.11.06.18.29.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 18:29:15 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Yili Zhang <zhangyili01@baidu.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 01/13] mm: hugetlb_vmemmap: fix OOM during head page allocation
Date: Sat,  7 Nov 2026 10:27:44 +0800
Message-ID: <20261107022756.77731-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107022756.77731-1-songmuchun@bytedance.com>
References: <20261107022756.77731-1-songmuchun@bytedance.com>
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

From: Yili Zhang <zhangyili01@baidu.com>

The head page used during HugeTLB vmemmap optimization is allocated with
a bare GFP_KERNEL mask. When boot-time hugepage allocation drains free
memory, parallel optimization workers can enter OOM handling before
userspace exists, leaving the kernel with no killable process and causing
a panic.

hugetlb_pages_alloc_boot_node() invokes HVO on the folios accumulated so
far when available memory reaches zero, allowing the released vmemmap pages
to support further hugepage allocations. If allocating the HVO head page
returns -ENOMEM, the bulk HVO path frees any vmemmap pages it has already
accumulated and retries, while callers can continue with an unoptimized
folio if the retry still fails. Therefore, neither an allocation warning
nor OOM handling helps this best-effort allocation. Use GFP_KERNEL |
__GFP_NOWARN | __GFP_RETRY_MAYFAIL to allow reclaim retries while avoiding
both.

Fixes: c0b495b91a47 ("mm/hugetlb: refactor code around vmemmap_walk")
Cc: stable@vger.kernel.org
Signed-off-by: Yili Zhang <zhangyili01@baidu.com>
Co-developed-by: Muchun Song <songmuchun@bytedance.com>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v4:
- Split this patch out from patch 4.
- After splitting it out, the resulting change was almost identical to the
  patch at:
  https://lore.kernel.org/r/20261104133938.50974-1-zhangyili01@baidu.com/
  Retain the author of that patch and only rework the subject and commit
  message.
---
 mm/hugetlb_vmemmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b8ce014ba6e6..7fcc97b12773 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -501,6 +501,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 {
 	unsigned long vmemmap_start, vmemmap_end;
 	struct page *vmemmap_head, *vmemmap_tail;
+	gfp_t gfp_mask = GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -527,7 +528,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
+	vmemmap_head = alloc_pages_node(nid, gfp_mask, 0);
 	if (!vmemmap_head) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.54.0

