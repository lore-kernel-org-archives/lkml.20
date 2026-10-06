Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373B43DA50
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298778; cv=none; b=NarbfdzGRqMHGu1mvgfOjsp8SfTXW3wk9lbUwIZY5mI0M7CD465v1JT/oh3gWT00mEuf7nygefm7WIEs2L962RGLj/C600RvZnct5hPg8Wlo4G3HucbszQFm0FmfPnkuQwidxzf5FsoJrGz2u5PGp6ZfVOCNzLplWPoRISca8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298778; c=relaxed/simple;
	bh=a2pGJgyenrOQBcUgU4+aMvSHZwkv/cIvXJyf0CX0F6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNNZ9mXsvHGwKKz7h7RlE6bnNEKHLGvIyY23hgk6XObuSEbljb4m86lhwu6K74o7zzeOGfpjPcvUhYrbegwl3lIiaZDl506OptOVPSipqRZ6OhKLqT8Nu5WydWpkCPjzhAq9hZ/0pewDVDUxKK/mEMuS7K2xA3hq5OKUOZ+R3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=VVZUX6Bx; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="VVZUX6Bx"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed0b68895so417911fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791298773; x=1791903573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tI0LY/5mH9k6I/X/x+R0S0p1KLDmL/lVZOe8khheaM=;
        b=VVZUX6BxrOH5ap4dVh95/WwdcKxlHK4sNY/3R9hnWFh37bX7WVPtrnoq6WFJDL8iHH
         fa0S56URHS+G1ucb62rrjPE6RPKkKnzDIRPPsbF8DfFzsJUy6p03MZuzCX2eRBOzO0hO
         DmyrZEIFohvvKxz9/caN8mTIpVFZKtxs0/FH6ed8uVn/sHEhlBiEwvcH3g4XOH+df3nY
         4owhplpdcdwy0ISvrsyHXJ4dPn50FCzFwz9KeBI5054dhr0YaLs5ajsgR70jaFxVhFzJ
         NQgHJ7eSXOj3xupfMQLUcGCFoIRlPufWX47YQUkzfJfmwoX9xQaWwjUX9ASNAP8dnbq1
         Q9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791298773; x=1791903573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tI0LY/5mH9k6I/X/x+R0S0p1KLDmL/lVZOe8khheaM=;
        b=CyA6czpoOyTqQMs7LIhqk00Ah6vc7z4KZ8umx3r9CDz9lf6A5zeviBNvEsxUGMpjqg
         vjh4l5Nm/iPjnimC2EDRnPzTRSwTFmueijMNrAK2vjJSf72Fs0Ss+sD1wpJ9QWJPIulD
         XVXLiZ5HR7pXbJOndppG72LTdvA7SWT6/XBUrPgs3GLYcyrc20yqNxHKtjxKNDM4unT6
         eKsRFJOcdbSeqNshZolF/M8lklempOLwvQr9XvFvOgsYuyPQgPvfjcJ5Wgc5s0P2My6I
         YBRH9TsI/twjHTnlZ6sabBw26/1/LlTavJT0lVbke5BVZYORyU8qkdLj6d74dsiXg3LS
         TldA==
X-Forwarded-Encrypted: i=1; AKwUvBzWrnwIzDmKIanimrN2ayhhJXNPgfyoJETyiY9EQr8N6/hOAn5CGaz5tXbvQ5ihgq+nt7GM6gXCrDOv5H4=@vger.kernel.org
X-Gm-Message-State: AFuF++ljylGsigV8qlklIfSIrtnLg0DW3h2tV8arfYhL2IkTDghM3yTe
	u2jw8SBWCk3WwbkoMo4mqX8Hi5edsibr7Y6nLZBFLzeCCnG7enP7CYwu1VwmK0Q3NuQ=
X-Gm-Gg: AYBFou3yh2QL2GBeJhr5W3Nm5o69n4Yi/DZxorl63xUetU2CJY4hoiVq+xKxbzTkkmc
	ZyUG4Y9vkK04Amid8G7D18BeWwCbimV3irXYibMzKix2kwVcS13tA/Myahcu/Dwv3QMHeWKzk0N
	npg8R7qg0/o0rSUYkS9l12ZCOvFmcxK7+iw9QFanwk5dxo40tdIhSrryHEJTixPtxpSkcifkYsT
	zZhtzY0VY6sa67U/tgMjSblYuNeiLVn6xoceC3aIeJGA5S1agK/bQtWD0zvKBol8o/CtEeKSKul
	8lgPvKJiYuq8vNwFMrfBHr4Jcu9MSD/i2N/LVtQWe+xf1pmEA7DYedVYlY11/2oMCVpOTiPa1Tr
	DH5+b9/Car9HJDD8LuGX4jBdha8Cagbnt2/eFRr0n1cNCIg7EATWAew08otaP88CFkFKLM9TYB6
	gCrPuiOnUUXQ+y9Ki74jM72T9JDEROKT43/4hxuiGZxWBJ+1wDFStEjhJ86eApSVKsAI2nUgDGD
	eLz5iunGTs10LupwM4LW2c1A6r0JpKTWf5PSCjpZY9zh7RURNxpIincBeK97cXhvut2wrxVwEv5
	qDozg3d1u/KECxTrQY2ZxXFg
X-Received: by 2002:a05:6871:110:b0:498:f70a:b54e with SMTP id 586e51a60fabf-4a240515209mr1399607fac.43.1791298773492;
        Tue, 06 Oct 2026 07:59:33 -0700 (PDT)
Received: from [10.0.0.192] ([72.170.223.115])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16f00b5asm13145180fac.14.2026.10.06.07.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:59:32 -0700 (PDT)
Message-ID: <01d75013-9eae-4ec6-93b5-cc1b2b83b791@kernel.dk>
Date: Tue, 6 Oct 2026 08:59:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK
To: hengyul@cs.unc.edu, Pavel Begunkov <asml.silence@gmail.com>,
 io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261006125732.3425762-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261006125732.3425762-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/26 6:57 AM, hengyul@cs.unc.edu wrote:
> From: Hengyu Liang <hengyul@cs.unc.edu>
> 
> Commit 8078486e1d53 ("io_uring: use region api for SQ") and commit
> 81a4058e0cd0 ("io_uring: use region api for CQ") made io_uring_setup()
> allocate the rings with io_create_region().
> 
> However, io_create_region() charges the memory to RLIMIT_MEMLOCK, and
> the rings had been exempt from that limit since commit 26bfa89e25f4
> ("io_uring: place ring SQ/CQ arrays under memcg memory limits"). As of
> now, a user without CAP_IPC_LOCK gets ENOMEM from io_uring_setup() when
> their rings exceed the limit, which is 8 MiB by default. PostgreSQL
> developers have already hit this in their io_uring tests [1].
> 
> The issue can be reproduced with a simple liburing program, run as an
> unprivileged user:
> 
>     #include <liburing.h>
>     #include <stdio.h>
> 
>     int main(void)
>     {
>             static struct io_uring ring[64];
>             int i;
> 
>             for (i = 0; i < 64; i++)
>                     if (io_uring_queue_init(4096, &ring[i], 0) < 0)
>                             break;
>             printf("%d rings\n", i);
>             return 0;
>     }
> 
> Before those commits (v6.13), it prints "64 rings". After those commits
> (v6.14), it prints "21 rings".
> 
> This patch makes io_create_region() take the user to charge, and passes
> no user for the SQ/CQ rings.

Agree that this is a bug, stricter accounting may break use cases.
However, I think we can solve this simpler, and actually kill more code.
How about something like the below instead? Only apply accounting to
user backed memory, which is how it used to work too. Would be great if
you could take a look and also run your test case against it.

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index 48c0eb012412..da2328b52b38 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -16,10 +16,8 @@
 #include "zcrx.h"
 
 static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
-				  size_t size, gfp_t gfp,
-				  struct user_struct *user)
+				  size_t size, gfp_t gfp)
 {
-	unsigned long nr_compound, extra;
 	struct page *page;
 	int i, order;
 
@@ -29,22 +27,9 @@ static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
 	else if (order)
 		gfp |= __GFP_COMP;
 
-	/*
-	 * get_order() rounds a non power of two size up, so the allocation
-	 * can hold more pages than the region exposes. Account those too,
-	 * and leave the compound allocation alone if they do not fit.
-	 */
-	nr_compound = 1UL << order;
-	extra = nr_compound - nr_pages;
-	if (extra && user && __io_account_mem(user, extra))
-		return false;
-
 	page = alloc_pages(gfp, order);
-	if (!page) {
-		if (extra && user)
-			__io_unaccount_mem(user, extra);
+	if (!page)
 		return false;
-	}
 
 	for (i = 0; i < nr_pages; i++)
 		pages[i] = page + i;
@@ -120,15 +105,8 @@ void io_free_region(struct user_struct *user, struct io_mapped_region *mr)
 	}
 	if ((mr->flags & IO_REGION_F_VMAP) && mr->ptr)
 		vunmap(mr->ptr);
-	if (mr->nr_pages && user) {
-		unsigned long nr_accounted = mr->nr_pages;
-
-		/* a compound region was accounted for the whole allocation */
-		if (mr->flags & IO_REGION_F_SINGLE_REF)
-			nr_accounted = 1UL << get_order(io_region_size(mr));
-
-		__io_unaccount_mem(user, nr_accounted);
-	}
+	if ((mr->flags & IO_REGION_F_USER_PROVIDED) && user)
+		__io_unaccount_mem(user, mr->nr_pages);
 
 	memset(mr, 0, sizeof(*mr));
 }
@@ -154,11 +132,12 @@ static int io_region_init_ptr(struct io_mapped_region *mr)
 }
 
 static int io_region_pin_pages(struct io_mapped_region *mr,
-			       struct io_uring_region_desc *reg)
+			       struct io_uring_region_desc *reg,
+			       struct user_struct *user)
 {
 	size_t size = io_region_size(mr);
 	struct page **pages;
-	int nr_pages;
+	int nr_pages, ret;
 
 	pages = io_pin_pages(reg->user_addr, size, &nr_pages);
 	if (IS_ERR(pages))
@@ -166,6 +145,16 @@ static int io_region_pin_pages(struct io_mapped_region *mr,
 	if (WARN_ON_ONCE(nr_pages != mr->nr_pages))
 		return -EFAULT;
 
+	/* pinned user memory is what RLIMIT_MEMLOCK is for */
+	if (user) {
+		ret = __io_account_mem(user, nr_pages);
+		if (ret) {
+			unpin_user_pages(pages, nr_pages);
+			kvfree(pages);
+			return ret;
+		}
+	}
+
 	mr->pages = pages;
 	mr->flags |= IO_REGION_F_USER_PROVIDED;
 	return 0;
@@ -173,8 +162,7 @@ static int io_region_pin_pages(struct io_mapped_region *mr,
 
 static int io_region_allocate_pages(struct io_mapped_region *mr,
 				    struct io_uring_region_desc *reg,
-				    unsigned long mmap_offset,
-				    struct user_struct *user)
+				    unsigned long mmap_offset)
 {
 	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN;
 	size_t size = io_region_size(mr);
@@ -185,7 +173,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 	if (!pages)
 		return -ENOMEM;
 
-	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp, user)) {
+	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp)) {
 		mr->flags |= IO_REGION_F_SINGLE_REF;
 		goto done;
 	}
@@ -230,17 +218,16 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 		return -EOVERFLOW;
 
 	nr_pages = reg->size >> PAGE_SHIFT;
-	if (ctx->user) {
-		ret = __io_account_mem(ctx->user, nr_pages);
-		if (ret)
-			return ret;
-	}
 	mr->nr_pages = nr_pages;
 
+	/*
+	 * Only pinned user memory counts against RLIMIT_MEMLOCK, kernel
+	 * allocated regions are memcg accounted through GFP_KERNEL_ACCOUNT.
+	 */
 	if (reg->flags & IORING_MEM_REGION_TYPE_USER)
-		ret = io_region_pin_pages(mr, reg);
+		ret = io_region_pin_pages(mr, reg, ctx->user);
 	else
-		ret = io_region_allocate_pages(mr, reg, mmap_offset, ctx->user);
+		ret = io_region_allocate_pages(mr, reg, mmap_offset);
 	if (ret)
 		goto out_free;
 
-- 
Jens Axboe
