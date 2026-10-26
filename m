Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026843;
	b=42/rXPeWrsluFaluSUa5SsFNKtQ2PmUIXPLmsMp8VVnqIrrGCn5TwTOiIZuMPhAmTnS5
	 UE9/2lCOiVcyg1mcYFazUCK1ZOf4JWXjDqYegXFoPc9MJuQ61coMxp35zKBPFoI//lZUJ
	 3dVcQsXr9uVx+vuAnBwU9rWEunqaPykyyLwxDMyxOymkZU5ABaRUdS6PLrmBg9/kEegk/
	 He38gYl87FIm0OPWRHqyy3MCBInDfPHEWReA+yFCJYvXur6/Ks7rW1YDjDBrJBajqnkrL
	 9/w2wJWin52YtEbAYXG+w4eqsLz8PL4Jdx03ARta7S14SWR3sBtiKc9RpUHn9QatqPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2fEUp+1KLX1g9pxymcQPGBgvQdM6meDnFJ6iLYfyBzk=;
	b=nbebZqBAHh33hfc09pKoq6z8xnsTQQjz8080Rz6x2CcY/n2rYgJxmD0msC8H9AJNaLLI
	 nOwBJ4FkutQIKUDKWa+ErCnbOgik3ONPuscr6IbD6xh7gFAwjYpuYKodUIPJHRY066oLi
	 go8OJIHqlA3EHHhTPG1Dh/5vuKQ8XPh9ifGNs6N2lMWVJ9jEQjJTnHcFcB/ckNI1DTNet
	 sBe4n0/BxLQ1aeQtkN6Ce+tTWNDdY6WREOUbyXkpQVDZ1vcZe343gr8Ge2wGe43i561i1
	 YfEtZE1A+8pGIwE0rEfNpSfdlzJecuUjj7zPqwc8fse+S5D53CIGMRfIE9VIlP1mXpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lra6s915;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7229E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lra6s915
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so20361845e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026841; x=1793631641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fEUp+1KLX1g9pxymcQPGBgvQdM6meDnFJ6iLYfyBzk=;
        b=Lra6s915j8vZyMBLzKiUyF9yhNwktX1OzErVRKT/BPE+RAJfo5Llf4uPPZuAlrYz6b
         eeFUllvSvT/2MXKEr6n9XgjdQLi1t6K2eETXDEyNCAB0a5CHGAwoMlvmHZyTNKRvcchi
         CtnKpn4dR9H/ozlsReAL7ghF+31+8KZ0KmGJeMxWjk5/1NMR5ZmZ3+n89Iqj6naf+CUM
         wsAbxiw0VIujFV8WDECRIJbpa53lWo3Cd+qOJbhXtoyOQeWWVwmzTmZR5YP5rzrpSisF
         kSOHzF7RpnsfTQsuQ34tmfVSxzFTtOJM9rsiabq26H3iShsLuI1J14tRIIxtkOTFu9hu
         3hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026841; x=1793631641;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fEUp+1KLX1g9pxymcQPGBgvQdM6meDnFJ6iLYfyBzk=;
        b=jRUoQHxBuaB/iBwbRNKnNyNfXPmZFGtkYfyHkGEL+XltkcfMw1jJNj+Yl1b5Wz4dzh
         HitOyBNCh97Ea4cB7tlRv3zDwVXgMGl/cm43s59edyDcvJf7OOtIfTL6L+YObMOyu+4T
         b/hWdLVBJHXDyLCzxRx86xTaeP78aGxuuP1FPC8kKx3IWcW+hM9AY8CWytRKO8si9h1a
         KdcSP9iXlUAR5IxBg2PE/Xs9JgamLNKelQ50jeT7J3PwZQs6Sdjhi4SFu3XtB75JWrE+
         KWmG5ctGKEVS9pLaQgXGnMOiGWBLISUa1TG9ur3CczVwIuFryz4eGMolLfFSrGDZ7+Tl
         Q9hA==
X-Forwarded-Encrypted: i=1; AKwUvBzCPFqzgi2YK5uLO8ohDdz87MXKx9kqB5EpnUPtN0QdkLTF466ImWPGx+qdaq25Y0e3RTTVYtDxWLixtpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlmwF/MuGHVvzHHy12PPrfAQZ8B7YAtdHfQx2oBYMw76AYj2TF
	EB7MjodPmrqbUTNpCvjTVVJITOpDqVXDe6A4p4STFIzHBWlHwL1W16tOez6D8VJX
X-Gm-Gg: AYBFou304OUb60pxTaq2E7Yv+x4OhQg8GpNsW+NKnLC5u5MYbHyU90jTChipsR/wqNe
	HXdiIxw/yVVFlPpB/iENT46ZYgCwjBc5onsweIGoKmQBjSWJdm6X3ESfdXFZcfZNdhLf84u6bFz
	HMJXRvCDfDkfP+d5wayPzhicTdcThkjo/CtGZQAQjSofGxjejo8+gCUH7huBHuAWxqqAgwMhm/v
	8OpRMckPWjhHBUHXl5M8k73d0LtZ06Ye/3NJwUqJeLizkTB8CHkWLsegOMJlQvsPz0xrQGTiTQZ
	8lVQn/ZmGkJXiguzw0rWsi2aY6aIyBGUjcrX7G5aFiIwm1B3dovX6tHpszE6Lir5aFj54IGDl4D
	GJMno69KasbY89rkHUbQs5qZZ5vh+IiDcck4WpDd8/oTPnQwKkIonxjRHfsmoeZW822VePJoRL0
	912p7dNUEyWj1gzQR2qsJ9F/QveXA4hRjDNekSXSyQ9lTyju8xwk6QYvt2rT8iLDjDVdHSTZMq1
	HMVa+SGJgNsAx6MLbODalWBiKbvD02y0gzgsJ2Hby9pytBR1m2kXu+6Fwn9vFJH6qKeabMPKlDh
	xnfPYgYOG0RqCIhq
X-Received: by 2002:a05:600c:3b82:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a35ae71a3emr134917565e9.6.1793026840517;
        Mon, 26 Oct 2026 08:00:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm207837235e9.9.2026.10.26.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:00:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:00:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-raid@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/3] raid: remove obsolete MMX optimized code
Message-ID: <20261026150038.6d08478c@pumpkin>
In-Reply-To: <20261025191207.86590-1-ebiggers@kernel.org>
References: <20261025191207.86590-1-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 25 Oct 2026 12:12:04 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> This series retires 32-bit MMX optimizations for RAID.
> 
> Affected CPUs, such as the Pentium MMX and Pentium II, will just fall
> back to the existing well-tested scalar code instead.

Seems like a good idea.
I wonder if all that loop unrolling was needed :-)

David

> 
> This was the only remaining MMX optimized code in the kernel.  MMX
> optimizations for the much more commonly called functions memcpy(),
> copy_page(), and clear_page() were already removed years ago by commit
> c6dbd3e5e69c ("x86/mmx_32: Remove X86_USE_3DNOW").  There are zero MMX
> optimizations for anything else, like crypto or CRC, which left the RAID
> code as an outlier.
> 
> Patch 3 also cleans up the CPU feature checks in the RAID6 code.
> 
> Eric Biggers (3):
>   xor: remove MMX optimized code
>   raid6: remove MMX optimized code
>   raid6: simplify CPU feature checks
> 
>  lib/raid/raid6/Makefile      |   4 -
>  lib/raid/raid6/x86/mmx.c     | 118 --------
>  lib/raid/raid6/x86/pq_arch.h |  69 +----
>  lib/raid/raid6/x86/sse1.c    | 136 ---------
>  lib/raid/xor/Makefile        |   2 +-
>  lib/raid/xor/x86/xor-mmx.c   | 515 -----------------------------------
>  lib/raid/xor/x86/xor_arch.h  |   5 -
>  7 files changed, 12 insertions(+), 837 deletions(-)
>  delete mode 100644 lib/raid/raid6/x86/mmx.c
>  delete mode 100644 lib/raid/raid6/x86/sse1.c
>  delete mode 100644 lib/raid/xor/x86/xor-mmx.c
> 
> 
> base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7

