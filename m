Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8D4CC63C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545048; cv=none; b=ZZT6rxgcVxwDMShWkL1iVUYe2JgWbBfhlxw16bUxpU0sT4vEdnsebh5xSzwuloxzHuyTBzcPtRFcxo9FaGAnR6h/XmiYtX6OFvtZESAR+wqEgVMgTZWAn/ZASxvCwGnp0YqNWDTMHkEO/dk1u2vQUJ3+ry2xf0Q3r8vXO0z5+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545048; c=relaxed/simple;
	bh=V38vhjeTzp3k5ITMNDV6z39rmdMCvkYnm7NSfqrDfZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFDCId5g6fvA0C9zjBi5xJ4w6+ZRcv1nVDVtZOs6idcLQgHHdmgbjylXoD4DOl5vnoIPjEr2e9cHlA3Oxb4PJ7sBIFnTf+giUqzKtK+bgHBETiTr3p0P+vGn+4ZVyX4hb02xMlhQ8n/mWiIXd6Ra9eT2FOI355OA8GkXm62AHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwTlLord; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwTlLord"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so44639715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545038; x=1792149838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0FDlo5X9NOcg3UrYdd8gMV7/2rytUnITD56A6AkawM=;
        b=GwTlLorduSK1NpYlzvs3WNkPYiWfIiRvgHsi6RKgfw6N9HA+hJJBE1rF4Dk7HeksZY
         vNh6Q3qzFbq9PDY/dS+CaPLTC36BMQhidW3ULEY9WfVvgood/8r1rBbE1wmk+mRWlZfm
         1qRE/IWyzcEzjlm001veLq3ldAC7aHGqTEU6yQ1PRDfWJDzC1+EcTInuwyo/K3dbfQjx
         mrn6OMJPVdZOi9BCOOCt2k9wfRrdQWyrnL+FHVq8TiFM3imY7IQo2Sf9bzuflkjPXjQe
         foHChqp/Ps3XZA1DXyr1dXZUB4T4H6IwS7qa1a7xHg8ANHPiuArSDsTW8G1hPs89J5hT
         J1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545038; x=1792149838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FDlo5X9NOcg3UrYdd8gMV7/2rytUnITD56A6AkawM=;
        b=wHSWpGNnMLzoAX6DnQnYvBGgXf1sdO6b5N5d+ZHXDAT1e5JapdTH8AsOB+oRFW4SQB
         hKxRSv++o7IVJ5kxT0SXaHhR4g4yY02bHgCmyxDsv92ROuRiUG5bvkjCTQ1feITgZcLm
         zKL59uRtFym7SFHXZpqYPBKeL0bD+7Gf/jss+Y4e4rvKH9RM/9Nn5I3cNpyV840+VIwC
         JDGldV6O64/pkQos13uQhmxs8YsRxwW3ZnLezlNKpCvrPdBbquot3fT+vecUyJyVGkQ3
         OeUNpMrF/QsH2rBpptkSWKwqbJO1ULeF69spLskTIocS7yRDgr3RW6al1eJEUjlYEhng
         FAsA==
X-Forwarded-Encrypted: i=1; AKwUvBwGJLU6zQlnCgUL3+GFN1EXTDwg3LUrTRekXUd8dsU0t0jvU/ElhOV+NymvAeuRjQlzbhwJEyrfdhWWEms=@vger.kernel.org
X-Gm-Message-State: AFuF++le9hxgSHuKi6xg67chdvtjyBjrB0YXwV9eSGU8Xcq6ko1GS7Rg
	pOaEHlqLRN7ITn81duVQ14UuwOlHtz+wD/jkwz2pXNopIpjQtlBGrwBv
X-Gm-Gg: AYBFou0I4SR+MUiDh5tHRi3+HdHFnU5nSZxn2JQ1AnjlAa9T0Ld1OPZ/dgw90jsc5uq
	Pk4HPHrEpLU2V+DlpppKififHN6EE7YKWOHHqXizGVrWjRnFRaxREgfCKsom/pg2/CJlzX0w3ID
	3glNZOPkJp/GWS3DBbIAr5oXa6LkveijvCkZIyjNOxb5fGTp3PgUB2UBMkvDPHwh9Q7GYL9cWdb
	MV9TtO2e2iBwdO7VzeQYy3MCEy4do4GQ87qjzklJt64WQ1FlcdNhqMdStJFc5vwHW/FquLl28JS
	LlnL7tKob+0DmluvKx+wO3MtYW/lrVJYIw0C5jz1Rf2uGsT4x3piJFldpt+ZuQnd2jwdgK/jgpf
	wQk2oL7i/ikS7BQ5abSwuPIUECWr3yVkqKaHgU6s8Msw40ogQHU/E3gx4aiBG0GfbEGuJVeJRXV
	VDdGi/yG1zcslJCAUOoX0KsisMlO1HGe9pvOfCSyDbg8317G+ZeFvqJER8BIsT05q7BLcrAQl4C
	n0/BLdl7FfcSqwwel5wsvRDJWD42WITBF+XVr1hyf4ggJM8gGkcjrstrVLFcBU5hwxRMQnT2f32
	VkvgbAp5/0Nwof96/VRNInL4O2YQ8tt39qYJbaqkPY89l3nS
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr31536085e9.31.1791545037794;
        Fri, 09 Oct 2026 04:23:57 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c669sm58317575e9.5.2026.10.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:23:56 -0700 (PDT)
Message-ID: <bed0a0c0-1706-441b-926a-fe568dea313f@gmail.com>
Date: Fri, 9 Oct 2026 12:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: do not charge user provided SQ/CQ rings to
 RLIMIT_MEMLOCK
To: Hengyu Liang <hengyul@cs.unc.edu>, Jens Axboe <axboe@kernel.dk>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk>
 <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 18:06, Hengyu Liang wrote:
> Commit 8078486e1d53 ("io_uring: use region api for SQ") and commit
> 81a4058e0cd0 ("io_uring: use region api for CQ") made io_uring_setup()
> create the rings with io_create_region().
> 
> However, io_create_region() charges user provided memory to
> RLIMIT_MEMLOCK, and the rings of an IORING_SETUP_NO_MMAP ring were not
> charged before those commits. As of now, a user without CAP_IPC_LOCK
> gets ENOMEM from io_uring_queue_init_mem() when their rings exceed the
> limit, which is 8 MiB by default. PostgreSQL 18 creates its rings with
> this function [1].

That patch you mentioned 26bfa89e25f4 ("io_uring: place ring SQ/CQ
arrays under memcg memory limits") has always been a delayed time bomb,
though memlock is quite a nasty limit. Makes me wonder if there is a
way to migrate it to cgroups completely.


...> The issue can be reproduced with a simple liburing program, run as an
> unprivileged user:
> 
> [2] https://lore.kernel.org/io-uring/b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk/
> 
>   io_uring/io_uring.c |  8 ++++----
>   io_uring/kbuf.c     |  2 +-
>   io_uring/memmap.c   |  7 ++++---
>   io_uring/memmap.h   |  2 +-
>   io_uring/register.c | 10 +++++-----
>   io_uring/zcrx.c     |  2 +-
>   6 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index c2ce83c7c1f1..2a16369894d4 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -2070,8 +2070,8 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
>   
>   static void io_rings_free(struct io_ring_ctx *ctx)
>   {
> -	io_free_region(ctx->user, &ctx->sq_region);
> -	io_free_region(ctx->user, &ctx->ring_region);

1. It's not perfect to make all these changes for a fix because of
backporting. Let's simplify it, add a wrapper and use the "__" version
only where needed.

__io_create_region(ctx, bool account, ...) {
	if (!ctx->user)
		account = false;
	...
}
io_create_region(ctx, ...) {
	return __io_create_region(ctx, true, ...);
}

2. The need to match alloc and free arguments has a high chance to
eventually blow up. It'd be better to turn it into a flag.

__io_create_region() {
	if (account) {
		...
		mr->flags |= IO_REGION_F_ACCOUNTED;
	}
}

io_free_region() {
	if ((mr->flags & IO_REGION_F_ACCOUNTED)) {
		WARN_ON_ONCE(!user);
		unaccount(user);
	}
}

-- 
Pavel Begunkov

