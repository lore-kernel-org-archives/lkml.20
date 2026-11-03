Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745530;
	b=X/GZSNej7cFitHPbPiX3CMzdN6gjo1Pa6iO5kKo+vu5ZGMs74fULsclSJWM9HQGKAlmS
	 xRixAWqC1xdXkz1f4qkDxYns8lGZpTKpvg/i5NKP2aotr62Xwiihn31rkNvrkGGkRIzre
	 cJLBFTLHtTPn6eRes3NMPk2slusQldKkH6GZuLfzVzEKrhfPIRp+9Ok4Lx6mq8NTUQd6d
	 M6ibl16r3Y+RPXS+0AUzprdls8feS8JhxT3u59zORDLWihfuc6hUfWXPuk9DNbmNesRej
	 qBlbjdR2jc/eUiSIihgzy5yyeNr65KtylV54u8OvA7VRgY1fAwJJ5UkcGYx4RLh6Csw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
	b=CxyDBux3oISrIC4QEh+y30S+LeuDkGVZwfBVghbiCC31HXvh67sONMAZjJ6gO4i1QvOd
	 y9O3fKW3yQ3ja1Eu/1ZNL/pyfBt05HQvb1RRUl6Gvf6Zn2Fpc8ArU+e/cGcGlsXqo+mcB
	 qt6em6KPq2akRnVrXuXPkuiiV1z4GcrylkXT+yOKtzMH9kwpiShuhYzCsd6IxjcAe0JRb
	 YXj+RlYGR+wSltX1/k6YMyUgl6z6NvDnDs9GO9Bxjaiouylkgn4v8RQsLAWcvlKJf/3RG
	 PilUf2/v2J9CSKW4txVFIEAUMEhguM7JaUArpTomSFL9ZsXPKaCofQCKg56DUVsA86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q83QGk6Z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A276606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A276606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q83QGk6Z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15198525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745529; x=1794350329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=q83QGk6ZlvK41Xnj9VYjDJsaU/LVIlKY/O3UTOsd7cHawXlaokPl1p1agoBY/5nwQg
         uPzkJbtm0E91Y8sCbX76cPRL3i6SSTUKoXzttrTc/gWurMr2GWS0k5ylOm8PFozwb36o
         OS3bFPXf8wE9XoVm/Dw9eCQmeqCwK0ijKk3mbqWteVs9IzoU8g54pTAHJRaxm52hAkiu
         7twTSt9UNnEzbw5wK5y4pN3/8W+5ruU9wDD555aCgwBySzZ9UMbSQ/4Vj2g+AHO5WIHz
         uHru3TjxC9/+VhraivLgz3IWOjs2cfBPVSktUTxcdqSG/kW/hrbRL1LEOapw9UlMVR/o
         lXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745529; x=1794350329;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=efW9w/G2sh0myHtIeIgXpdPMA62n7i1zI9YzamyTENY7noMCWXKo8r9NHFo2oKGU3k
         crMxeqyb93c0XHf9U8jaOdOUYNZamhhluhmAX3xfck6U7v2ycEuyY7LlvxHMmO1V8xVd
         K4sHta9EiGmesrEaLGaBwWvRxAbi4J9W5rIMIcKSZqksHEVh44BVd2xRfqfmsOR+7K6l
         lwSdshu+BNvQ6PQnJcFsROMlDsFJRgsq3vSmuguyvkmaL04V9Wl1ERJ3d5gmu8Sjd9/s
         rqG3l3OeZ8ttdRfOLDetDHr/y8mXT550PyxyYJ+nZyDeuYndgbblonOrQH2lT7rdwykr
         jrPw==
X-Forwarded-Encrypted: i=1; AKwUvBznhBLzBs4jFk2jlzLpPViC4WW7689xKIkD9zQrPIVnv00DHu8FOQCnfZKb0y34tsuKCDyjNQKMyGveiXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OnIHcOU27FYZfz2FNw3qdhL+C97vaMo5CoR/Fz9Roekv0T73o
	28KZ+vU4A07+Wvv8erwQobEGGRu+uyMCZ8nb9o0ED4YZjFuOZMZgmxyd
X-Gm-Gg: AYBFou1m9XY6YuvHOdihhBiCBgAmNnJaV90Q8EtpwIVxj4nREkZObFnKcbdhfKaJcn0
	k7prDKzXNFPA54TOKHIJrutdZ2VBPQBykMuWOxkAAC4Q9EbW1AwW7OHfaBDBLY67S/v+k7oHyrx
	L+JJbGqkKnyiW7hKz5wFzEdNfIoK6R8ictX52p86/9hyvLhaYaHqX3XBbRlswg7pIv4+52F8X3l
	gSHXVqfej4r4nZJAlwHKKT1Mh12kXmqBnxCPe6z7jksGnO81+WTyYQdGOIxmrGzYoEfmw8Lv8EB
	Xlwwn4LiLMcVTRmyhh7c207HW7dR1cQiDJ+Oyf8NghVBlh01Ekhg+oKiknilB2i3JOHYBgnAnGa
	s8+lnVLLr5sLWZedcCzTpqGFrJIzamAKixQMlUKzWTD915pavEEwH/LOHYplPyafw4+gMZxQNev
	kieMF8r9J2koeZMOvw8N9LW017WhUJ26ICR7VE8pUh3sgn4aQfkAKxohj6VEvyX9/lYyMt1Ai+g
	TFLwevybq9vjqg1NFkcFsBJRmT/3cr83Sc80ZluOr0ritS2Snt0cwhStiAQTvZyHClmo9DrbIyV
	uEYVzlJLHwZrU1CBkiU7JxvEDeBWepYTzkurJHcWbvJWmzvKYubbNy+RwQ159pShMadrLhRAn+0
	UNzmaPVRneg==
X-Received: by 2002:a05:600c:6555:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4aa8b05fa4bmr341420665e9.15.1793745528451;
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm467832f8f.6.2026.11.03.14.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Date: Tue, 3 Nov 2026 22:38:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261103223846.5e6a1dfc@pumpkin>
In-Reply-To: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
	<20261102161426.2403d308@pumpkin>
	<CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 16:47:29 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4 =20
> Agreed, that is a nice loop for the sum-only case, one dependent op on
> the sum chain and no builtin needed.
> For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
> 19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
> at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
> it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
> posted 4-accumulator loop (0.88-0.95x).

I just added *(u64 *)(dest + count) =3D val to one of my loops.
gcc just replaces the 'add from memory' with mov/mov/add.

I'm now confused though, I seem to be getting different output from earlier.
With -Os (which I didn't think I was passing) clang is refusing to do the
'offset from end of buffer' loop.
With -O2 it bloats everything by unrolling 4 times and adding lots of
extra instructions.
(AFAICT the optimiser has a completely incorrect cpu model.)

If the compiler doesn't generate the expected code it is all pointless.
The xor parity code loop had to be in the asm block to stop the compiler
changing it to a much slower form.

For the checksum code I have managed to work out how many bytes/clock
the code was generating and getting it to (reasonably) match the expected
values.
But you have to use relatively short buffers to avoid D-cache effects.

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:=
14 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>=20
>=20
> >
> > On Mon, 2 Nov 2026 16:14:06 +0100
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation. =20
> > > Depends. I think __builtin_addcll() is needed to get roughly the same
> > > performance as the asm version. In my tests GCC on arm64 turns it
> > > into adds + cset instead of adcs like on x86.
> > > But I will look at it, thanks! =20
> >
> > The C version I posted earlier has the loop:
> >     buf +=3D count;
> >     count =3D -count;
> >     sum =3D carry =3D 0;
> >     do {
> >         val =3D *(u64 *)(buf + count);
> >         sum +=3D val;
> >         carry +=3D sum < val;
> >     } while ((count +=3D 8));
> >
> > for aarch64 you get:
> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4
> >
> > I suspect that is close to optimal - especially for fast cpu with
> > out of order execution.
> >
> > https://godbolt.org/z/eso79K7Wq
> >
> > David
> > =20
> > >
> > > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 12:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:=
 =20
> > > >
> > > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gma=
il.com> wrote: =20
> > > > >
> > > > > I would prefer to keep only the scalar version of the fused copy+=
csum.
> > > > > It reads the data once instead of twice, and on real Armv9 hardwa=
re it
> > > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > > depending on the core (+6-8% throughput). It uses only general-pu=
rpose
> > > > > registers, so there is no FPSIMD state to save and it is safe in =
any
> > > > > context.
> > > > >
> > > > > If you are OK with the scalar path, I can send v2 with NEON dropp=
ed,
> > > > > the scalar path only, and the KUnit fix for the x86 zero-length c=
ase
> > > > > Jakub reported.
> > > > > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation.
> > > > saeed =20
> > =20

