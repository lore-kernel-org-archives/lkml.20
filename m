Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289763;
	b=IvCpkXbD8m3C1oxeCTqJmqvVi8F/j1zD4vwzRlCIBHaW6wd6zOK/JTUSfA2V2yw94WWp
	 a11b4w1UlFWT2wzgHD09twD3WGCThqHZ6KrFaBbWysJfDUgVG8eVzdzgR1ENi5ejwrKpf
	 4BFyaOo7C53hfhUvLaDS3mV7SotlzqASny2BatU9DSQCZSvo+DCXHjQmK3xyFkfem1UMY
	 N1nKAav/aa/lDnvj7Ggq+T9Y32/zgryDJVCiGSwOJLdkwUCQpADym40DQ7FQ8OrWDfWrw
	 sGDHllAafidb7Sn/2dFOL6/4YvAc3808OfI9/60rYFTZ1dITuYGiA0R1qBFDjUI+F3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=e1CwuUVsSjZnbMobjwr4r9fMJTFxCCqI+vgT8IsHHyE=;
	b=T7x7oTEtxzDOA23BXwttrQBXLutJ6t7qiKkbhTWHN8YsFxUKP1Bizujh4ZSdHCoF6hLI
	 hIlIjrjEItPCz/BHcRcdwm4G1g5VagN0VFhT8HkHl0xKPPmtKpqgPTFv9UHXA3IqTwy9r
	 egFojFpTaSQ/AFHH2tjTMyQuatv9zq5FVyWlVR8cy7adE65+6gcTCbnNilu6ti9M9Fk4e
	 5rtv6HsXEa/RXaGum+Tipvosnip4PyeRhnz/2GH+Z0R/j0k5I0m/XaxeWAFNV+rlhWTvl
	 QHo1heki87+0WSVvEQTzTac6tj/w385fZEB38OUfg6hwEZ5eePItDT0sDvKCvdLupNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntx8of9R;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F0606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0F0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntx8of9R
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so6844115ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289762; x=1794894562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1CwuUVsSjZnbMobjwr4r9fMJTFxCCqI+vgT8IsHHyE=;
        b=Ntx8of9RtWT7VWFP+8UI2qGvxb7QsA9xAcmmQncetK5YIWQYal5uEtY/rivndaRZjy
         rU0cwPplqFhBTIjuGAnTrn/domD/um+/F8BvTxnHmvYwK/K4HXYNZ0PzZWE+2pk3xLhB
         8PbiiK6C6Lt2RBs1QMNH6sTgfIVwKTef1OQOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289762; x=1794894562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e1CwuUVsSjZnbMobjwr4r9fMJTFxCCqI+vgT8IsHHyE=;
        b=g/nBOTjEiIrWzYroU8cZo38qJjfUmXxLvLukxL01kfkU1f4oASraP33u4V3+Dpgo+1
         mxd2rlj+CdVG+KG4Hs1fxK15QroLPQd+GTAQgBWeBQGwU6J4qlpo1N+KDWjmW6oBFLH7
         pdTUOTi9MQ+89zkdGsAaDfWWSyExuapBzjAeB1x/phBeX8SPMFrg6kGy9X6vn2UfJxcV
         j6tKFYUoK4XWWdETQNgHLXWmHtH67EpEK6HNiAP+GjIeKSHEaun0kxLJSmBrR2JkM59y
         Ugwg/Vg/0a0G2ZneZopEnYssQg533rZCGjoTQrkNuBPDyApOj1+5PFSyZmnd76np0lXx
         Ky4w==
X-Forwarded-Encrypted: i=1; AL+hErGzQrHItMGtQwJirwgJXgPLZmK3X0Sm2s1o2HrZPQ36S6p39xr4EPjGNhisQnRIELUOfPJ0xTqn7uJ4ljg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CARcPljAj+blhwkgUnaF42O4WjIJ/aPxXXzDhueFygQt1UeYb
	Xy8VJ5NuDj9+dsvjG/aW43E5Kzx1nkymb6jkIZyWU0OrzCt+pq0UtrFxA8LjEqvzPQ==
X-Gm-Gg: AYBFou0uzAf1aT6TOqUjmRfXkUNIEuJIQUVVcH9kUlln8ott1FLjjIIjEIrkKVrW5Pk
	ZPC3B98TWSLDgULMhS7nXenjHJ99Gd+/MYnQ2Y2DBs8nW8tKaGFgUFBhoQdRihIBf9Moxo6b003
	SOO65jgK9uzNpGiZ3WvF8aDDezIbm9KKXKCaZyKdJ3g28Wj6c49Ct1m0+CGvx5jrD6jjOo1hSiA
	YaK/T12uZO/Mwy2qDsustVuvuFleJWHfXVwRQHnamOLMt1CENUggOTImV9CYLSE4H1vs1kqMoe2
	RtWD9ViFnlFu+GodYYQQzF+6DksV1u17hsa948+si1kmIJ385t1w4rY+/pLIC8TXtVB+x+QO7X3
	yO3q2Bb1Cqti0OeFmMsSqcC5tqYPIyjL+9GgGeWtKD8ZW3Ju4QNMu+cNQKcFRT7FWpKzKWUtR1a
	50gJueQg3VZrTi/43zLUMs/aYtTVis0T+lVQNay4wT3tSYo0XHGsUYNIY+zZWtVVlbiVh44swmL
	g+zWWldwBgLiluqw/TUag1Fg3PHdzzi6JdK6D421cmoESeTjPtqqIqauQ9KAHzeBuRmVVCL/tbn
	gsbwnQFNC5V7Pzx//lEdqkN6YlL6jCw2biAGqwUJ5R2GlVCR1fZlVuFOtlvJU4V2E5Lk/w==
X-Received: by 2002:a17:903:2a84:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2edb91d9bfamr13050805ad.47.1794289762137;
        Mon, 09 Nov 2026 21:49:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e1c0sm4971905ad.34.2026.11.09.21.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:49:21 -0800 (PST)
Date: Tue, 10 Nov 2026 14:49:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] zsmalloc: redesign object alloc API
Message-ID: <avKwQ4IEOVfYm-8J@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <auy9UfB30AlYabV8@google.com>
 <CAKEwX=Nao4jWtY04FXEjxiHUNUhJU2A6nCZLqhRRm-dPBZTmcw@mail.gmail.com>
 <CAO9r8zP_K0NF0gt71Emh+2dXmUh+C27uiu5TsyBcGUdLbCus1Q@mail.gmail.com>
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
In-Reply-To: <CAO9r8zP_K0NF0gt71Emh+2dXmUh+C27uiu5TsyBcGUdLbCus1Q@mail.gmail.com>

On (26/11/05 09:39), Yosry Ahmed wrote:
> On Thu, Nov 5, 2026 at 9:37 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > On Thu, Nov 5, 2026 at 10:31 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > >
> > > On Thu, Nov 05, 2026 at 01:47:30PM +0900, Sergey Senozhatsky wrote:
> > > > Both zram and zswap already have per-entry structures that store zsmalloc
> > > > handles, so allocating a separate handle_cachep object per stored page is
> > > > redundant.  This series embeds struct zs_handle directly into zram and
> > > > zswap entries and drops handle_cachep, saving 8 bytes and a slab
> > > > alloc/free per stored object (2MB per 1GB of swapped out 4K pages).
> > >
> > > I always hated that extra layer of indirection, thanks for doing this!
> >
> > +1.
> >
> > The mental load saving excites me more than the memory saving :)
> 
> Oh I am 100% supporting this just for my own mental wellbeing, the
> memory saving is the icing on the cake.

Thank you guys!
