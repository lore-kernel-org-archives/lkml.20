Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260279;
	b=WVfAEqCzhE5a9cY/2WziGu+IYHTwk+N5OXjCI01ni7p/nGo1p3ejhYqs4uEPFhXK+UQK
	 iRV3ke/2BgMO+2MjILvaa734jVS793fGTv+5bpMp21Fgvi9t8+dlgVRgoL27IKCZnyjKX
	 4jW3qUmB/6cvu/SfWVjhRAR5xRSUnSYzBz7GFn9J2C7cDnry+6OFzdIY2zk+j82Z5a1u0
	 xd+PrG7LwgcpIttSNDPnwA6lCnkyvmN28F0R5R51luNslQYFoE+mWNdU5qbPbQVmPZ24G
	 Obxe2sfq9JoYjFMRhOGQq51dKrBkF1bF9EStadWd6WfQGJByRJIVAiV2tkzguUT+Amg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
	b=Jmz5OR1GTmlnJT/HZv/lj+7jO7hZv8Y44P3veuj2TxVeyt0UT0OmGLFne3YXRf7e/a9o
	 m0B36IylzthtEiFUI2kanI7ZnMQKRuoNT70bi9vO7K59j2GztaT+d12+xcPeXojuEHMgt
	 +TwpO0gSMBHxwp1qeeNIZmy7Abr6ZBwhiiwtjszn1GNbraueZPP3N/zxoxng+prnWYKiI
	 IPnjXujDVm4qMpQD0hT0pMIT7x31VYaHmc1/AE2osc2vXMG0HusYSj70CTHXbce641wHN
	 3KgWvf5Flc/loXwFRjJimcXVFbCBgK++8a84/mDpUm8z7ej4/Stz+g2Z/duPlej3xsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V85JAZrI;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V85JAZrI
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab938dc83so535260a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260277; x=1794865077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
        b=V85JAZrIMeISyb08Dg/YBa9AzHq0E/dJ0uYVQWP4dU5WADoJOtfd/L1offq8qRFpnY
         jxzWq6kXCuHgyTpOpVaLaRCizpnzG6i5ESIxvQGHApFVIxYtuL/sAl9EjFsBK/MRVXrg
         opOLW2KfHU7xIwu9dlIyd4SXk7AdGTIVFRXZ2uqkGZL9FMidPVeFPUhpkkbrxzB+lzOk
         o3ljkPFDRgW0dY985usOnQY1hTOaOnqEV/eOZLlA5CmlYkneSWYUQxn0qAdE8YcawTBL
         7Lr9FZUcBHSmXX5VuiCisfSMwqjHsf8aUazvL/xPTTIbDehTHrAB9Nnwf1JzmvrQdCKx
         bN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260277; x=1794865077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
        b=Znds5Dr/jdAfCXvGGdmt7xw97bQj8EQ9j6bqphQnucd7OsDEaLN8Nx99FerBW6qiCl
         OH58oy1m93jrWMNJF8osjiYP+6Vht6e5+/J/QHqsTQoRMJhf4aL2rPSJd7AJijZN8QpH
         9L6eMkH1UWo5S+Dn5VAHZO5mIkj2bnpB+LNZWiiB1ji394z3n4MThnx8wsHENEVSBHE0
         r1H3xMGyb6r2mShh69hGezVPYALRAnf2sOqYuy6lD+ql3Su9JWMynN1RquksbEiiruBF
         3KNddD3yOpV7x/4LOMKyi6tWK6cpdzJOpQtNTjFc3GouscgpHz0OWyYtCfa8hHQkSXX/
         lCFg==
X-Forwarded-Encrypted: i=1; AL+hErE5w+UtZFpNS4WIdhFUNj9/pp3Exc432Tx3X83oeM7Zpw6YvXTOOikYCXhKHujVW8t9iMxroQY3mcSLmq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fx4AYKMszFMzB1Vu6hUxvukIpjcpfwCCJwDQsFIHS6ItekZ8r
	5+J3duOLDv3twbUhDOa/XT0gCCVIn+cTZ0hYVWE2hIr74O+2BqMfQBQBMUwCQjX/Fu93YMJZfp/
	xTM8zH3M=
X-Gm-Gg: AYBFou3AwZhf4MhuQz5UyUGTSgyqkc5iKQfNrSGLKJYdSBpklg7p7lC620a5duutspH
	JtgiuKBCCqLvrkFP2qAXNgSAJCx8OmLtyX4wH2Bk4QqpClwRbcIBN+DpPVh+i+LAWP41idSpif4
	zxvp9zmV+/iBqDfMm1HFeUTlp/mQx8wwMjXZOdZw9iVrbTUugmZadrAsmdFN8wE3M6lMiYObd11
	8YvOS1VO/VF4x2EHXFJpo59nVSHhiQmpAtnugywMcGioYf0CiOS9rERV+qlsmeAavLxwirScAGo
	XMH0WeVDrIZ4GPL3TeE1iXjwM+7K5sCeOcDE8AdM8Mg/qtZsmGAunItG9A8YGB3MwxpbKzJKtkj
	u35XgeDOQ5935Fti68Z5xT9kKdl57j6LJLd0FrBY6ZuJJVJVRGXS/EpehvvRiDSMxmA5l97uHBh
	1BceZUD4eFEmVm+7NBvqzcFtDn+jVRUczvcffxcssf6wBjIa3hoG7HnGpS1Yu5rqXmz9oRBpIrK
	uyCa7Tutj6Hx7X1kNcq7AQUjUJjkcQzER6IxkSGTO5tKEXIiXV8GMhQ4LA2hQuMrccXMDgK5tWM
	RRboWopiOEkarbNPKbTtuw6cpgeTlZWdI6tQwng+CyxDDW8l0gxBRXXcpyuObhv8otfbCrFHTsN
	cQ7L6Qi95eSo=
X-Received: by 2002:a17:90b:5283:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b166cdecb6mr871492a91.16.1794260277070;
        Mon, 09 Nov 2026 13:37:57 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676d83absm1022071a91.7.2026.11.09.13.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:37:56 -0800 (PST)
Message-ID: <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
Date: Mon, 9 Nov 2026 14:37:55 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103211031.592745-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 2:10 PM, Caleb Sander Mateos wrote:
> A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
> currently has 2 unnecessary NULL checks in the fast path:
> - Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
>   field
> - Of the void * entry popped from the cache, even though all cache entries are
>   non-NULL
> The compiler also incorrectly assumes the success path in io_alloc_cache_get()
> is the unlikely one because it's written as an early return.
> 
> Avoid the first NULL check by splitting io_uring_alloc_async_data()'s cache
> logic to a separate function io_uring_alloc_cached_async_data() that uses the
> cache unconditionally. Avoid the second by returning a separate success bool
> from io_cache_alloc() instead of checking the NULL-ness of the returned entry.
> Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths as
> likely so the compiler can avoid jumps in the fast path.
> 
> The final commit is a small code simplification in io_futex_wait() noticed while
> touching the neighboring io_cache_alloc() call.

I hand-applied this, as it needed changes for the post-7.3 trees.
Patch 3 is somewhat marginal I'd say in terms of rewards for the
churn, but churn is cheap these days...

Anyway, check the end result, please.

-- 
Jens Axboe

