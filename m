Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB954BB293
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007055; cv=none; b=lX0YAkdpuQNm/O2Tw8sdTktyM6U8MB0h5hjnGj5skJuOHbgRSyOZYpKxWBTcJi8/TB4TLMmeiI/ku2yDKbTCWPUOnJ0VGaANkQYboJbdOAkC7dGWGYjxcWSNxjYJJTKSRpvnHFYMkU8IrRmQPOPfC2giI2GwMS7kJFk8MqzQhrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007055; c=relaxed/simple;
	bh=KxRGP42jnNZFDQR6TcrefeTptXs4HoXgzM9QUv4IjDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbGe32bvJNa6e7ri2KrUq6ewKUuxAWgx8yQk8soQ1MNS1cu9rSX6Ioh1gUP/Kxaj14VGUvXTFWkF187QazEAfWBTGk2KMk3A0lr2ewKmCaCn0oiH8MEK30t6lxFiyIlR5RXP5wk7gGsHNS1o+n9ATh++AMszQVtQfVC6iOKqA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=DnYor2U6; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="DnYor2U6"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d298caso1335017a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790007052; x=1790611852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u6rjc+Rr+SwD8BBU712UPTVOpOR/jX0N+MPWo4iqcc=;
        b=DnYor2U6SZltoQ4N3X902xPvhztB7Y+RnSETd+D6axeO9NYwjBYJgJAS9GwZ6IU5zc
         8t8nPqGQCcwQ01KFgUAyWyGohaFgpC6+Tm9YLQRReBu6FnUQStjVez7EDXtvszDOJywl
         D2aAQ+hQFrHkA5CGmD9hQaAfn3ryIWAtxOkrGqOfy1MmuJeya7WBzeTOEaf6rkcLTDON
         NvNKWMf1qnmsmLZJoWqbnbwjBG/gpeO8gYiTAUJNaVXmUk2I4K2QX4kfY7FwkEEDPFiP
         c1aSLn2WYxcQIpZvxCtkxkDzj3aDxjJlr5vFdDpnBUhBFcLa/z6l0wLM0ry8HlVQLw0M
         2lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007052; x=1790611852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u6rjc+Rr+SwD8BBU712UPTVOpOR/jX0N+MPWo4iqcc=;
        b=AELwcoynju3TuwwOXHchjmieDo8fna+xpeb14a5RY+yRatePEg3e481JTlVDXxOR5Z
         jAqVg3HyEQgRISw9Rzk1ilypdUv3ZqeQ6qtpei0RrG84dHKqnRMVLEAv0YS+o7Rt9rNh
         gTQIAVAnYq63sNA2lnJvXef1O2vQFfMciuiIQk4o05BmHe2OzVGiyzFvRQ1bCr9D7cpQ
         tMV3XBSvVvUZjQem0fTtGBSTosABl1Rp+WB4oiwpig6Rj6pq1NMqZ4SKS+FOyqRDuI4R
         08T8Q6bBbF2kJp1u2NgmYApR87/+W9vczxfg0GnCX0HoG84eqCBo4nBC084WdzV10S27
         Yzzg==
X-Forwarded-Encrypted: i=1; AKwUvBzpJdscwTXdPXgZbqbWwDmNeQJmnA0xXtJIElbB5bDHVI5naPv5TjvbrFQsw7mf+6qtb+GnHEXNFyl0+CE=@vger.kernel.org
X-Gm-Message-State: AFuF++nNKhLu4V8c772AkCcqae5FBH2sV9ikxdir91vtogPCj2dOnXjT
	x6NvYBFBUX36ZlnkLGR5YYbgbW4vIIwKqwkbATNHgGjxqvB5t5q9K93j1xCTYwrsubo=
X-Gm-Gg: AYBFou3ushgF7xvd08kLaYvgfv7Rhatx6w6QTfIFgPUXbK33ivPvOsPOo/OBgaHVQaM
	e1i42RYyjauNJoGONwDi3H5GMhiBqhd3v9bg6TIyc8N1Vr+DjSW2CEkFo+OvlaOIpHdRMJUZMQc
	hxt9KCxpG+O3PSRyQvLmB17Fa6iehiFuFqrhKM40Pw+mmBDxr8h9FPcUoWGKznJLpbTlMpzk3ok
	1ihehpAqAL8Oxbh2W1QkbYbTFTaSYVzlDKLfYW4PF5pgxuB3piltry9dFpju1hxvmOPjP+CX18W
	kwmDopy1qgF64U+Q6xhl+xvVxExRJ++2p0gvTQz6iXyxylurkwUoh7NY8H4mbMJ480qRFORZerL
	K+Ifs0zKNOb87vjgjZl1kmDm5j1pnlZ6VgkQ5Ux0aUfupj+SZ/fwhNd6EQY8Q9IoO8CjtrRMpFh
	uPKnz5/jdBcOfg9u+V3vLmdhrgEBGI6i4OoIrgyUNRfYF5wY6NJkSX0peBdmSFA9EOKixAZw13g
	jyjWhFLn0BpKF71lRn10JR/aNRUuVIQYJA=
X-Received: by 2002:a05:6830:412a:b0:801:6bec:ff18 with SMTP id 46e09a7af769-80ddfd6c36fmr11244293a34.2.1790007052481;
        Mon, 21 Sep 2026 09:10:52 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81475bbc475sm405170a34.8.2026.09.21.09.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:10:51 -0700 (PDT)
Message-ID: <cbdf1ef2-7fe0-4cd9-8ce4-3235478e536b@kernel.dk>
Date: Mon, 21 Sep 2026 10:10:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix CQ tail over-commit and CQE32 index
 corruption in io_cqe_cache_refill()
To: Hui Peng <benquike@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919203516.2581409-1-benquike@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260919203516.2581409-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 2:35 PM, Hui Peng wrote:
> io_cqe_cache_refill() has three issues when handling 32-byte CQEs on
> IORING_SETUP_CQE32 and IORING_SETUP_CQE_MIXED rings:

Don't combine fixes, send 3 separate patches.

> 1. When cqe32 is true and off + 1 == ctx->cq_entries,
>    io_cqe_cache_refill() posts a 16-byte dummy IORING_CQE_F_SKIP CQE via
>    io_fill_nop_cqe(ctx, off) even on pure IORING_SETUP_CQE32 rings
>    (where IORING_SETUP_CQE_MIXED is not set). On a pure CQE32 ring,
>    ctx->cq_entries is the number of 32-byte CQEs and rings->cqes is
>    indexed by (off << 1), so writing a 16-byte skip CQE at
>    &rings->cqes[off] corrupts the middle of the CQ ring and misaligns
>    all subsequent CQEs. Restrict the wrap-around skip CQE to
>    IORING_SETUP_CQE_MIXED rings.
> 
> 2. On an IORING_SETUP_CQE_MIXED ring, when off + 1 == ctx->cq_entries
>    and only 1 free CQ slot remains (ctx->cq_entries - io_cqring_queued()
>    == 1), io_fill_nop_cqe(ctx, off) consumes that last slot and
>    increments ctx->cached_cq_tail, after which free == 0 causes
>    io_cqe_cache_refill() to return false without updating
>    ctx->cqe_cached. Check that at least 2 free CQ slots exist before
>    posting the dummy skip CQE.

These two look fine.

> 3. On pure IORING_SETUP_CQE32 rings, len is in 32-byte CQE units prior
>    to `len <<= 1`, so `len < (cqe32 + 1)` falsely requires 2 free
>    32-byte CQEs instead of 1. Check `!len` before scaling `off` and
>    `len` on IORING_SETUP_CQE32 rings, and in io_fill_cqe_aux() zero
>    cqe->big_cqe[0..1] whenever IORING_SETUP_CQE32 is set on the ring.

This part looks wrong.

-- 
Jens Axboe

