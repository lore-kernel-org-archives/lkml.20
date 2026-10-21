Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548131;
	b=suM5rGsHNGrJNX00kZfzqDLwHfhWEZ7hdyrj+mZQ97oQxVqsXBAVleIBWI8O6t5Vg6Hj
	 e53EMDVzX4rxKSu7x/QUJVjHLXbJKmuZyLo4tdOgIQlM8aw3ZkRKR8yaiKZIMSLQl6E3b
	 WkWWja20ORlIsuVpsG5xXj+mYagGt6q9FkKeUHhJCTDyM8QkzlST/wBIiPGHlG0rsBaF1
	 LAMM08DGNyvSO8Xk6tA/UcbmBWnvQdovrQBNwD4Bt2M4w1IPqfS6oLUZzkBUp4t9HO91G
	 6usqCHiIGvqrJJGZ3LdJXLALdbBD6GcTwHwABE17o2t3DTa0kvz5Jrw5psutU8QZGQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OGwi9n/sjudDqRr2GLNZOw5hXvKMm5llKrzOU2BnbmA=;
	b=EA+eyHRDo7gndwyIwmZgRmOFQeYfYEf8pffuuhoo1wHZFfXvpFPJNH7RsDINBIO4K8lj
	 Wb4J4Hm3wd9vFuiM3d2rfupHmb08vPn8OEFY9VAgvd9wGV24V23YKqmvH+a5QEAN8Zisn
	 TO3Gc4s0nQLL12MNvRoYVAG/cZKkW3pQBYoJAY0QxKqDhkRqw7ASJy+z8Ep7GkGKWgaM4
	 qwvvbUqYLQH9vgRiaBwdiQziQ+ZVXNlAmrdlJwO+5koDfXREd7cv5Pa2IFuzpddzYn2GI
	 JD/0vDsCmApMvylwyJB6i2H1RAE4yE25ZHSoMYTosxnBBUw/RjNuzmEWv/N3QP+5FNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jsb7XwcZ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D706B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jsb7XwcZ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab3f899c8aso66890a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548130; x=1793152930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGwi9n/sjudDqRr2GLNZOw5hXvKMm5llKrzOU2BnbmA=;
        b=Jsb7XwcZZirdIXiUJ71858GWkfBI5N/3zoejxXwhkpWfqgiu87Zc45k60KdBai1Nup
         ZpDo5fObcudP+Ynv6mi7QHWxfChfSikxqCtvqQuT8UTYfJ5E1xN7hz/XYbcX4sVliB9c
         vsuXS+Y0NFTOlrFS5pE2dXAO6UskMRunEcpQIwX9PUQLcqGBmrnbFAmMk8ppo2aqi/Ck
         Evpbv5CyomDL3XC+7AiKFtDpGlqNVWw6yS7v9NMNA4MG4RdBPdUC4ukxmxfM41nFkeRm
         4wKJbYJnKEfXpnjTomZlnRdrFQqUGAFpJJKRdf+dyWLd71gQW0uqsWXZyZalRfIfkUxZ
         dxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548130; x=1793152930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OGwi9n/sjudDqRr2GLNZOw5hXvKMm5llKrzOU2BnbmA=;
        b=xOSzYzQuJchZ2spr7H/OlqswPabehRuovgjtNXCPOvyC9E18m3HgY+7CYh1RJ7AXn3
         Zg+nXv2fsvmsrN4PiHOB1w/GHkQ0wnNSs7gCTdtLdLLKENs9S/UVg1aBIgg5e4UfP8Kz
         fGntzfbOlNrAhJqnMJwWHz8RziWbkdYXFF6l0+4iXAhgCAkd/7/MYLc9PMB5lfYOjAhK
         HcUTE/OM4bnwbfk4CAOOdEQaJ1zdl+wSYmuB+9u3HaBG9n7ZvUeoDZ/Y2gJ2JS+HGEST
         RPjMqdU1OPY1yXdKShJRUP9j089mE1wQgn4wzVnm3UlHjgt/7JygpAqNAH3t1Yc+F6Ul
         QP6Q==
X-Forwarded-Encrypted: i=1; AKwUvByEBVgr2awO32W5w6iS+Czd+t6HEKHl6sLS4jbl7eSY7Msr1aWyQY962iReWVxyHg7tWiczLibqHiSHcQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFICOu4c7/ukM2vQbPXv6DLtV8TYaYo99dZ81BqAAxzYScUr0O
	N1hhKUerv/PTmeSdsUGeL68k48BhNStTomk2gC5/1HiGTbY6EHz0tH2f
X-Gm-Gg: AYBFou3dzZlvbU9gkVRtu+j6ZvCjMrxCjnivLjRI3T3n5Xz55iYwjjt+PBuEmgR0Yqf
	wO63X091sDGTq6xBVqJqi2TqqoNg7A5wjUsboYGj+KLMK3O579/dwP8MSmoDBbuEdPIW6A8HFxU
	o7QL5MVumqklsBGI/LvwVTRJUTVawquX1faxVm0MI86h2VUF0GHYJr6eXp3LC94kTKcvOrtotsi
	VlMF7LQh0GB4gXgIgoSS5BcVd0VV2bJQELg4SoFtpFeQdFRmcNvaa+i7bQlaqWgnXvU8wPkXySQ
	/GOS70oyDacIeaQmaaHcFwSx7DDdW9pkgIfjgUl7Y4Qcey/P64iBdj/KyucqtzZ/4SmwLFWQE8J
	kgJ6EGj51MwTVoSlVTbB3ZBWuZReKfq8+CLlD2JuO0sihdPWEKgyypZ7yNLNa5gKyb9zbt4iexE
	34OnC26gDg0X3rAGnLsm+Dzs4lqKfaPulUHUAT6JpUVf9iZLkfHWLeCu+T0gMsIuspgkfQep27c
	6nD8qSEZpWXOOdF87EgvdhdwJaYaINcsv/jQI2WuEJaaT8v9Wc=
X-Received: by 2002:a05:6a20:7350:b0:3e1:8890:83f1 with SMTP id adf61e73a8af0-3e287c9f7b7mr925934637.1.1792548130163;
        Tue, 20 Oct 2026 19:02:10 -0700 (PDT)
Received: from gmail.com ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fa6c6sm219573b3a.48.2026.10.20.19.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:02:08 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:01:35 +0800
From: Wenwu Hou <hwenwur@gmail.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mm: zswap: set zswap_ever_enabled when enabling zswap at
 runtime
Message-ID: <atgc_4y2dA4egqXs@gmail.com>
References: <20261020122942.3477541-1-hwenwur@gmail.com>
 <CAO9r8zNgnt=9UXN_FJ3zByVtC18MNe94-tXssAS-eAQfutNXRQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zNgnt=9UXN_FJ3zByVtC18MNe94-tXssAS-eAQfutNXRQ@mail.gmail.com>

On Tue, Oct 20, 2026 at 08:57:15AM -0700, Yosry Ahmed wrote:
> On Tue, Oct 20, 2026 at 5:30 AM Wenwu Hou <hwenwur@gmail.com> wrote:
> >
> > zswap can end up enabled without zswap_ever_enabled being set, which
> > leads to data corruption. With CONFIG_ZSWAP_DEFAULT_ON=n:
> >
> > 1. zswap_setup() fails to create the initial pool. Setup still counts
> >    as successful, but zswap_has_pool stays false.
> > 2. The user writes a compressor name to
> >    /sys/module/zswap/parameters/compressor.
> >    zswap_compressor_param_set() creates a pool and sets
> >    zswap_has_pool = true, but never enables the zswap_ever_enabled
> >    static key.
> > 3. The user runs "echo Y > /sys/module/zswap/parameters/enabled".
> > 4. zswap_store() now stores pages in zswap, and swap_writeout() skips
> >    writing them to the swap device.
> > 5. On swap-in, zswap_load() first checks zswap_never_enabled(). It
> >    returns true, so zswap_load() reports that the page is not in zswap.
> >    The page is then read from the swap device, which holds stale data.
> >
> > Fix this by enabling zswap_ever_enabled in zswap_enabled_param_set()
> > before zswap_enabled becomes true.
> 
> Wasn't this fixed by
> https://lore.kernel.org/linux-mm/20260906133601.3563324-1-xialonglong2025@163.com/?

Yes, please drop this one, sorry for the noise.

