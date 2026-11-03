Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793720863;
	b=Q2EMFwAJyzDAN0XskHjZ5KGi0GIFEcJEKDs2J7pXMdUe8lVGgS7zohyNMRYqi/ij6z1x
	 CXIzqGeSYB70M2LZA5zfJ8RiHcDlMlpmMfQcYnZQdw9NqLf0r6isFWiUdYmgDp1hUyR2E
	 OSlmkQ21O+BVZKcIzxZqexnpjS5r5Y25atQs4chj7be7VpgYIp6ZVpq3MRoJVXiFdd2Dc
	 cfzCEGsgkd/ZAtJ5Oq5mmsjO3xE633DU8zmI3FYR+3GZtCmgGxjLfFKWB59uAuWq8tH9/
	 oO38n0hQDdRGhQlK4WKBTgZIngwsVN1+RXUNy209LzhWLe4NxFk1zbXqmqM2BAKTcbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
	b=a2suOyC9m0T4nQKOZfjwjQh6c1SvVu7GxQBvSGxdaTzzlbAR0Rz6sldkdfXJXr0Kg103
	 vMNyf2JQYGIcI3GeeUvCA/4ocr15nLc+kM/wq0HVQysPwomH8dN4egtQx4Fc7c9U1hx8E
	 qyDB6Ij7W1Jg+GUqgQ9cTf+SvPwMsTbhDZRQMem1cdp9lnl/V04urSiLaTQc7EQJ3cs2O
	 k2oPOhezy/FsYE+rtGG9tJgYFsg7nBIlooH4X0BYu2Gf+vOlnB6WqKlcqrgdjT/+VEJl/
	 SNC4wGlXanMOTBJz6Ys2kIGuVwO0VcwCz3jfWZbRBYqesxFBtwiQM6yQ+HZYHhfwIRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/c3T8k7";
	arc=fail smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2A606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/c3T8k7
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1173478c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793720862; cv=none;
        d=google.com; s=arc-20260327;
        b=Ai2N/FisPTC46RDo18hNa3m/iKId1arsBlXL6mhc4S2/gcTCs5JPM2lUsUF8UBCYCw
         5AzB8aGoXQ9Hd3WZFEYEXz9kaQpqTIGe1SS3aJSrxISwVGMkUfICGNQVa3d2CuYpEGE9
         hYftwb3aRlgtmiNIEy/q8IcD+grQ3UN9IVC9l7Xjlq3alrV2SwRiQHdsXlAO5gBsPQ9D
         a+TISBi9/jxWHkuyawu5Riw65DXYzGSu6eSyrvRnQeG0Rb1mV6oVRU0sv7yTJic8UB78
         5Oacu0gcDrQgSSecmVAm3D1HvzjhLGNi0B3WMgp9QC4HK4f9c6eOBBl+eMJHLghOQ4v5
         TmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        fh=WsOh9+guX8tBVqTQaxskeeTW88fMUXukpNKkztc2WOs=;
        b=CYDLdRjYIKgvdZ6l92B09Myq7e6SCdyIxuPlM0kDEY9l4By1jonXxuf9Pfcp8NM8Zk
         T1l3OAPTNEuv+z4C1VKmrhmK6WSVcs+uzxDzDW+DJGmu+C+Txg1dXTtU7aztctABDrrN
         BNkYfQ2lMxRqu3x4seCvJTMHHeOFtx2/3JVfqtkONddUHu+rnelontveknmRFvKcDF6G
         J7BEgdexZJrP+V0nAiF1rpTeULdLFEfYbRfecFjEPqZM4UJqw60zoL9ZPWT8Y5ll+zdn
         qU5lLOySNsgXGAEXB8FBnXzYlMuyDstUPoNQpe6de3ooDhAv6ooUCetBQ2qPWqm1oJcO
         VEMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720862; x=1794325662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=B/c3T8k7H5BbUta+CbaRgPkU3gbwEsec46DGg+fL3CT5C522daaTEl0s3aKiIbuRqZ
         TwHgvkQNS7HyHwgruGAIg7erWMgXJQ6MX7K/isAFDJrzSE4aTplna7Cg/1lhGKQV+T9P
         mlRMYD2kkrETXwLnrR4NIAxBMUpOBUb+um6NzVlTLjWM6v/AyLJ1tVZKNhK4ouAwF/6b
         1kUq4iveBjd02n3FjMQG46bWOeGXHF91u/CmvMl9KpJb8OrBklAkli7dfNqYNKCL5YSv
         XuEVnfrYStZvDZo6KyrxN8kWkBYpVQFZy8jvImYZSdL59MzZI8UV/KwrE9SLwu1vMEeS
         NUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720862; x=1794325662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=vEwkQBMdpWmeCSCwjk8I6cQdRRQsEmaCCKU+ICO+Yoyxuaer/lnQrKg3ZSJT465Scc
         hmMFP8VTv2t5mFO3s4CS3IhfEg9ZbZHuZlNkYYGww8vO/IsZQCBaKnJPO3cPuWStpplA
         HgyPlMu+BdE724nI9lIkG/4IDVBFG9B5U5GaVGomasW47u3b9AjfIzyKDohP6omjDCgu
         f4DxMPQ/pDTFyqyQZl7MziFjOlYFDNCQ7/FFwG4XsAb852BBcv1Vxm4MVkWNasydRTUD
         MGkRuLa/f+Xl9YovyrIxnRq/w1DpsyqawBxsNnlSDnixO2VMJWi9Bo3EQpC4QtE+GHNL
         NSTA==
X-Forwarded-Encrypted: i=1; AKwUvBzLcJ9OPsuIXm9dkFa6jFwXO1Bp9S0XHTJIG1aSuCi2DtEp8OFJzFtGb3LsO9moDdxb8+PyoO31ilfgP1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6NgG42igllPxwU6mXOP67WIp3VNUfPQGInIZd+pkNzDxtMVze
	V+QJ6ci7Cd92bKQAEgFYJ+O97fCzwXq6vU9I0QjMtqnQPGs/EgA/V0GLPOiqnwpUOxKOJptS72z
	mIZW/Kkg52Ou26nXWFIZDx/OLY3obAnc=
X-Gm-Gg: AYBFou1OS58C6CGwVj7LXvEVEPbU4DRvsvl84E8xz6HD2cvvhQetf7qd4ojUoxHZIgQ
	OnU05vFNTpu7yOKW4GokRJlnlqZidHT5SSXUvoiirCAkJ4mJCbLYzrDFG1PSZPY2ZCp7d0oh3If
	/dHKiIHKjRrCp+GPTb5OyKKoM3hf8UlG9fFAFiYexBDribAUXR7PagcFbbqRqRfab6P5igo2bvB
	hvqknPgUguAT/KO+XS1ETUO9bUBIa5IeEayA0tHp/o9HETE42ZToI/uSQs8/M5jLl23R9oX11x7
	4LeXtgjMPw4DVfkG35j5BSCq6txokhkODOUHBQnSM0zHfe4vMRiFqjlRe9q8+xcYT0P7lcSFrtu
	8JvN0GQ5t0dTDB6ABJVEDBy8cP2mzmebtBb3ahuD/Sh9uOGeIvbfyTBSpZydv1t6TKaU1
X-Received: by 2002:a05:7022:3f0d:b0:18a:8164:ce4 with SMTP id
 a92af1059eb24-1ac4fb0c60amr20787898c88.0.1793720861540; Tue, 03 Nov 2026
 07:47:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
 <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
 <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com> <20261102161426.2403d308@pumpkin>
In-Reply-To: <20261102161426.2403d308@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Tue, 3 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK_ib7dEyaiKe1UK4pPwMx_v8L7eBFgO0-a0RmurEZQOzqGEC7L3Ybfd7oc
Message-ID: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
Agreed, that is a nice loop for the sum-only case, one dependent op on
the sum chain and no builtin needed.
For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
posted 4-accumulator loop (0.88-0.95x).

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:14=
 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:


>
> On Mon, 2 Nov 2026 16:14:06 +0100
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > Depends. I think __builtin_addcll() is needed to get roughly the same
> > performance as the asm version. In my tests GCC on arm64 turns it
> > into adds + cset instead of adcs like on x86.
> > But I will look at it, thanks!
>
> The C version I posted earlier has the loop:
>     buf +=3D count;
>     count =3D -count;
>     sum =3D carry =3D 0;
>     do {
>         val =3D *(u64 *)(buf + count);
>         sum +=3D val;
>         carry +=3D sum < val;
>     } while ((count +=3D 8));
>
> for aarch64 you get:
> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
>
> I suspect that is close to optimal - especially for fast cpu with
> out of order execution.
>
> https://godbolt.org/z/eso79K7Wq
>
> David
>
> >
> > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
2:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail=
.com> wrote:
> > > >
> > > > I would prefer to keep only the scalar version of the fused copy+cs=
um.
> > > > It reads the data once instead of twice, and on real Armv9 hardware=
 it
> > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > depending on the core (+6-8% throughput). It uses only general-purp=
ose
> > > > registers, so there is no FPSIMD state to save and it is safe in an=
y
> > > > context.
> > > >
> > > > If you are OK with the scalar path, I can send v2 with NEON dropped=
,
> > > > the scalar path only, and the KUnit fix for the x86 zero-length cas=
e
> > > > Jakub reported.
> > > >
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > > saeed
>
