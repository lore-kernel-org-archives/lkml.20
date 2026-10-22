Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684879;
	b=jRGLB9sB7KZuLtbJidq2STCByrqxRGoIIDKMfMp46kRQ4x4AvNU6A71+K+C/FxeiXIjh
	 sQdE/UJOCBacRCzI5BAP7jJB4GDVWZeRtnwpKTNeCG1UMRAls9eM7WHrTsIiT/t9gpM7e
	 DXZA//dC3mqj2NF/C9g1cdQsxeK0wrX72Vu6rsXiYdWsd5kwTDkSzc7AZ/IYBxRTkFIIG
	 5Qb9vNUiIr3tV3KfMsb/sG2aUNJI7gca+WzOMknUoRL0lLAe6yk9ZFhP12DKwQNp/8qJU
	 WbzPkuLE5ltZMydt9KoCwiHOZb6SOu0BopJ3LoAZFlNd6/CJ1Az3Ar73mxHVfDZKzow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684879;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mZnQH4k66o1mIDEsmzGgsw5IwNIOyXJTZDCq9e7F1pw=;
	b=KD6R0V0l1Zd9UsKnLMYFmtml6StaKIqioh4hVEk6CDsL8JC0v12yhQPFXg/E502r8itT
	 tvLox6WVtAdYPOAYwgM+lycdwWnQct8xdKRswlGGygsiLvaq+TFYfPvV1eQtvjtWiqu14
	 6FwvSHvEXWG03cwdiQ+MW+9CwNCI7W4htCtDg4YyR2Zp4t9ryaUZLlZ+Hx1Z6TkCDubXv
	 zMWDkf41bzVNo2v2lDbgQVFMbLamdGINxO39KOJghYIM2YOi5Ibgd5oZswYBaoB/Sf3x7
	 I42eXuulrw13ikDHeD6kN+CqsC5ZtcN7OoQ5htpbxb5bU7VA5cMH+jXfIFC4oZ8NGEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUKMDLgm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776A606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUKMDLgm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454891F031E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792684878;
	bh=mZnQH4k66o1mIDEsmzGgsw5IwNIOyXJTZDCq9e7F1pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LUKMDLgmYCelRKZK3jvmKxwZJ7UrPFrxBmub5jJzBKHKMKc9Z71KOTzZ/U8sLqWbK
	 GJmt6NKptSpfEOoQwXPij8KghJWk5NJL4tv9qLsOxm237m9aNMzvIIonAN+/PtyQi1
	 4TwwtY0rsqa4jjU9/UMFlSck7yWRvLUAWADohSj0rmzKEFNE9deUxG6G+z5yWMZJnR
	 yeJ4UJ0kpZ4BywGO0f9ltMctlmyK0lhz9oW/oT/yjh8bmLtNsQeDk2HC3NWPEHnzRQ
	 eAS+ol+jMyd58RSBrjXXgCtg1e6uJYbRhFwgJaE1WuFkROnx2ElpqAdkCnQmdEtHgw
	 Zj7udkyyZe1cg==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f2049ea7aso123639985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxS30t9cr++pT3tJmcYh0dfWkE239twMe1fXlrx/mPXCPOIfKQtThz4QB5FdVFLFy7/7V8ZQimLPAfTn3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm5HtQxWrG0C7DcRbZps99IKrn0hnmo5KPIycBskxEaGYKpvjH
	6ZGgJ9yI/8EvMFyARUBTA7F7pH/7fZ37eU4WjshrijOfoqBluBQ1RCtDX2XT/PeMZGHBfJYlAAr
	fFMsWHQU+rbTb4eYWssAfrJ17duro0jg=
X-Received: by 2002:a05:620a:4015:b0:93f:3646:7a53 with SMTP id
 af79cd13be357-93f57f985e5mr1089190485a.83.1792684877406; Thu, 22 Oct 2026
 09:01:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021205626.3286270-1-suseendranb@google.com>
 <20261021205626.3286270-3-suseendranb@google.com> <CAO9r8zNtuN=_BTV53oHqaTqE0Bo2qiDSrgTBzEZo5oyOnWyeYA@mail.gmail.com>
 <20261022155144.4177200-1-suseendranb@google.com>
In-Reply-To: <20261022155144.4177200-1-suseendranb@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 22 Oct 2026 09:01:02 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP+GUE-hcGWSGzhLNLcchFoZ38EMVCAtX5yZ78tZ0bbgA@mail.gmail.com>
X-Gm-Features: AclHuK8UBgpUaMkUIVDLgCYUdPlk7TRDmPVZZOzzavqgJCzERTrB32bGsXXzVQk
Message-ID: <CAO9r8zP+GUE-hcGWSGzhLNLcchFoZ38EMVCAtX5yZ78tZ0bbgA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: classify compression dst overflow as poor compression
To: Suseendran Bhaskaran <suseendranb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, SJ Park <sj@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>, linux-crypto@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:51=E2=80=AFAM Suseendran Bhaskaran
<suseendranb@google.com> wrote:
>
> On Wed, Oct 21, 2026 at 02:47:46PM -0700, Yosry Ahmed wrote:
> > On Wed, Oct 21, 2026 at 1:57 PM Suseendran Bhaskaran
> > <suseendranb@google.com> wrote:
> > >
> > > 1. When zswap writeback is disabled (e.g. memory.zswap.writeback =3D =
0),
> > >    zswap_compress() sets 'comp_ret =3D comp_ret ? comp_ret : -EINVAL'=
 and
> > >    jumps to unlock. Whether the compressor fails on destination overf=
low
> > >    with -EINVAL or succeeds with dlen =3D=3D PAGE_SIZE, comp_ret beco=
mes
> > >    -EINVAL. Consequently, incompressible pages are misaccounted in
> > >    debugfs under reject_compress_fail instead of reject_compress_poor
> > >    (leaving reject_compress_poor stuck at 0 and triggering false
> > >    compressor failure alerts on normal incompressible workloads).
> >
> > Hmm IIUC this is completely fixed by patch 1, so it doesn't belong here=
, right?
>
> You are right, thank you for pointing this out. For the destination
> buffer overflow case, Patch 1 alone fixes it since comp_ret is already
> -ENOSPC and 'comp_ret ? comp_ret : -EINVAL' preserves it. The only case
> not covered by Patch 1 when writeback is disabled is when compression
> succeeds (!comp_ret) with dlen >=3D PAGE_SIZE, where 'comp_ret ? comp_ret=
 :
> -EINVAL' sets comp_ret to -EINVAL instead of -ENOSPC.
>
> > > 2. When zswap writeback is enabled, any non-zero comp_ret (such as
> > >    -EINVAL from an invalid compressor context, -ENOMEM, or a hardware
> > >    accelerator error) is treated identically to an incompressible pag=
e:
> > >    comp_ret is cleared to 0 and the raw page is stored uncompressed i=
n
> > >    zsmalloc. This silently masks genuine compressor failures
> > >    (reject_compress_fail is never incremented) and miscounts pages th=
at
> > >    encountered a compressor error under stored_incompressible_pages.
> >
> > Storing pages in zswap when compression fails to avoid LRU inversion
> > was intentional in commit dca4437a5861 ("mm/zswap: store <PAGE_SIZE
> > compression failed page as-is"). Unless we think this needs to be
> > changed, I think all we really need to do is make sure we account
> > debugfs correctly for -ENOSPC vs other error codes? Or am I missing
> > something?
>
> Thank you for the context. Keeping the writeback-enabled behavior from
> commit dca4437a5861 ("mm/zswap: store <PAGE_SIZE compression failed page
> as-is") as-is makes sense.
>
> With that unchanged, existing zswap_compress() already accounts -ENOSPC
> vs other error codes when writeback is disabled, except for the
> !comp_ret && dlen >=3D PAGE_SIZE case mentioned above:

Is this actually possible? When we changed the buffer size to
PAGE_SIZE, I thought we made sure all compressors wouldn't write
beyond the buffer size. dlen > PAGE_SIZE means buffer overflow, which
is a bigger problem than debugfs stats. Or maybe compressors can set
dlen > PAGE_SIZE but won't actually write to the buffer? I didn't
check.

As for the (!comp_ret && dlen =3D=3D PAGE_SIZE) case specifically, yeah we
should probably use -ENOSPC to count it as poor compression.

The compt_ret and dlen checks are not super intuitive tbh, I wonder
how they should relate. What is the expected value of dlen if comp_ret
is an error? Is it always 0, or can the compressor set it as a
non-zero value if compression fails?

>
> -                       comp_ret =3D comp_ret ? comp_ret : -EINVAL;
> +                       comp_ret =3D comp_ret ? comp_ret :
> +                                  (dlen >=3D PAGE_SIZE ? -ENOSPC : -EINV=
AL);
>
> Would you prefer that I narrow Patch 2 to just that change in v2, or drop
> Patch 2 and only send Patch 1?

Let's figure out what needs to be done for patch 2 first, if anything.
