Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1151A738
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029549; cv=none; b=IdXCFqTxxx+1pXA66JuqAMcQY6igSOYIbqBqrTsVplywXXjrvfC/2gUQeMmL+OHKpgHfiDrGkmvV0ENSX0YqD/VVq0vMbrh2r1O8FKdhwtr67aVgndzaXRrh2+nDxp7H6Mfy2HEuj8/mnQFbSlQkidW8UHI2zzoaPs2fl+h4miA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029549; c=relaxed/simple;
	bh=8NC0hujbv7xtfa8dEzl5XFjQ+Qebvjd183H6KwElKpU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=PNejEdX9PMdYQrcJkqtkKdLAH23EOc/G7gmJUAXqgI6Av8eCFelUPRfJGm3zJooLGLxHfcj3xYIGteVMsjaYndrDQGZPwJRlqgxg6wiS0ABZrbvqTRl5fOMj7FvhaL1wgTQ343YB4fO+L7R1B4SuGxI05num4ucQrD6SYlKejVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJ2nsNed; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ2nsNed"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db710396ffso3261255ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029547; x=1790634347; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gmnlHshE9s3UsHmSY/lKD7Hmyco0TSK2+U3+Y1IWwk=;
        b=tJ2nsNedRL/vOcCrmKB7Aow7okBkgiypcHwQRkhQVwx9VzqSx9PfcKqDmWfy7Uss04
         yERNn5aOFMywgcaM/V5NJdQ1RJVl0DhBi0/tJ5oKCtJhaXE/ZbEt7uooTApmntAkhbZD
         Ufi+BIYtD3zQ2aLCi6xElaNwELTYgPj1JrkdrTeYEANopeZSZyUMTVOtf8J0/J895u5W
         kbKlXNipQANqJmt/c1n0ei6hnv80XtvNNXUisPrZ0UDTIhpu/sxgw5DRrckgOKhFQV/z
         jVyFw5O4+oA9Xe1IYAa46IyxyAFAe01zgENZIPG4TohthWfWPX1df48dMH7hpZtdUDrL
         8Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029547; x=1790634347;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gmnlHshE9s3UsHmSY/lKD7Hmyco0TSK2+U3+Y1IWwk=;
        b=zSOkKYui6mX53Q7A/Y15OUbiliQXKRkCLedLtlNJfNcnFXJYBqU2faFIpQspIlBuBn
         3I59quY+rebq4fpjQFNVTre6hZsbLVz3+jVlm1eXOuLTdC67AExXOGW5fTON2LJ0/Jk8
         6d7ZU5VqnwmISjEnYatAFdlUp27u95A6xHDM3t8bQc9klMq5T+0t+guG2e8LBdizdO9b
         bescW8DqXT3Q5ex+/zGgF3RNG3+WIkgsc50nmMsainBbl6waq2FdlJKPOV5E/enmRTCh
         4e/Pfmfup3pBcOIBjPkqqQZHMg0P8gXaFjHuE0AkR2A0gDKfwBNbXFRB1cS4BOeUyF7P
         HJvA==
X-Forwarded-Encrypted: i=1; AKwUvBxGKZibTZZw7XAuHMakiksQwb7HEvyjJZeK0rTosVmP5m8NtbYQrDaLKH9xsWZ6jLPrDMfK/5uQbtIaPhw=@vger.kernel.org
X-Gm-Message-State: AFuF++mw2mkZR9wtWBQUHcZvEafRWRYaNyyNQO1lRQHmhMKV3mDOmOYo
	LSi/DCp5DDP8Cslkpo8vgtvVZdoBg3xpjTJ+qX7lXJtuCKRX0qGM/tFP
X-Gm-Gg: AYBFou1oIrHDQortj/fC7vf7anQok0oKcEouTIujtyvpFvb8XsUEwRGlarql59yOt88
	tz7Oi3HxptmXqu9CsiBrCFb7gLYEORwAM9/EA81hLkjzec8SNM/tiI4AmC7nzsmTS+tO8qLa9Gm
	lVXxoFVY27AA4Klvo2EuF9lvaOzmLSYQR3sH5UksfzpkebPJ5yEoMkbsWFthIcKEif7WSlF8hbC
	d6Edr3bszsIScDWK/K1kC0q7nRX1c1YoVzmniNh9jCDhyt595e9GuHVNF5klrFBxmkE9N+WQiOL
	P8gf/V3vUDkVnc3wcIbCvHIaQfzw3Y7Eg1Tb8CG7FRV45QuJ15YlZ2AFcyv6vsSX8vxyiPBsEaS
	YARt5cPOvB7mJfpk09LFHOCq7UgtVs/dyzC2Xqedsw1JcfQWxiiAe8utRLCG9wP0GoCY1KhgCyx
	gnu6/4NEE1mxIugEHI7MJjYD3AHXimxkW8GQGUapaGHeiBrJWM7PiH2q7wp4DiKEv0xPGYBzy2L
	goeYfGDS/LmRCZKtsilB/Js2Al+TeYcLSsNLdoLby3GJQ/ZJhDthKlbUA59W2KccmMMoYrbNMZ5
	Cek=
X-Received: by 2002:a17:903:11c4:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2df59a6039amr7832095ad.20.1790029547035;
        Mon, 21 Sep 2026 15:25:47 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5b7a534dsm1068885ad.35.2026.09.21.15.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 22:25:46 +0000
Message-Id: <DLLCIL3RGVY1.H5A4OEASW5OF@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Vineet Gupta"
 <vineet.gupta@linux.dev>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
 <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
 <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
 <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
 <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>
 <DLL84IMPTRQF.3DOQQTN2KCAEW@gmail.com>
 <e9aad352ba82dadd97a17867108b5db1865fa38d.camel@gmail.com>
 <DLL8Q69N7BUD.1HI0MKU2M2UGE@gmail.com>
 <951923920747d8dcba3d56ca8858e106d9c7ba4e.camel@gmail.com>
 <DLLBVIU33MLC.ITFPYGMFKWUT@gmail.com>
 <f4a616cf9241589fd093bbd0b34e8c8a162d579a.camel@gmail.com>
In-Reply-To: <f4a616cf9241589fd093bbd0b34e8c8a162d579a.camel@gmail.com>

On Mon Sep 21, 2026 at 10:17 PM UTC, Eduard Zingerman wrote:
> On Mon, 2026-09-21 at 21:55 +0000, Alexei Starovoitov wrote:
> > On Mon Sep 21, 2026 at 7:44 PM UTC, Eduard Zingerman wrote:
> > > > > > >=20
> > > > > > > Where:
> > > > > > > - id =3D=3D 0 =3D> no id link
> > > > > > > - full =3D> all 64-bits of the register are identical to
> > > > > > >           all 64-bits of a scalar value `id' (let's call it X=
).
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X=
,full} =3D> rA =3D=3D rB
> > > > > > > - zext =3D> lower 32-bits of the register are identical to
> > > > > > >           lower 32-bits of a scalar value X,
> > > > > > >           upper 32-bits of the register are null.
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,ze=
xt} =3D> rA % 32 =3D=3D rB % 32
> > > > > > > - sext =3D> lower 32-bits of the register are identical to
> > > > > > >           lower 32-bits of a scalar value X,
> > > > > > >           upper 32-bits of the register are either 0 or 1,
> > > > > > >           depending on the bit 31 value.
> > > > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,se=
xt} =3D> sext(rA % 32) =3D=3D sext(rB % 32)
> > > > > >=20
> > > > > > hmm.
> > > > > > there is also 32-bit link with delta, right?
> > > > >=20
> > > > > My point is that delta is independent of 32-bit/64-bit property.
> > > > > `delta' can be used to propagate in both directions:
> > > > > - full 64 bit -> 32 bit sign/zero-extened
> > > > > - 32 bit sign/zero-extened -> full 64-bit
> > > >=20
> > > > both? how ?
> > > > I was under impression that in 32-bit domain delta is one way.
> > > > rX =3D ...
> > > > wY =3D wX
> > > > wY +=3D 5
> > > >=20
> > > > if wY =3D=3D 10
> > > > We cannot do -5 to rX
> > >=20
> > > Why?
> > > It is still valid to transfer r32 and tnum_subreg knowledge from wY t=
o rX.
> > >=20
> > >   wY + 5 =3D=3D rX % 32 + 5 =3D> hence rX % 32 knowledge can be recov=
ered.
> > >=20
> > > If rX itself had some delta, e.g.:
> > >=20
> > >   rX =3D ...
> > >   rX +=3D 7
> > >   wY =3D wX
> > >   wY +=3D 5
> > >=20
> > > Then it would still be possible:
> > >=20
> > >   wY + 5 =3D=3D (rX - 7) % 32 + 5 =3D rX % 32 - 2.
> > >=20
> > > Again, in case of this direction, only lower 32-bits of the 'full'
> > > register can be inferred.
> >=20
> > Ok, so we're argeeing that it's not 'full' in your above definition.
> > Your enum id_link_kind needs a 4th category : apply-delta-to-lower-32bi=
t-...
> > and it's not bi-directional.
>
> It's not really a category, it's just a direction in a sync function:
> - if known_reg is 'full' -> sync to sext/zext register recovers lower
>   32-bits and infers upper
> - if known_reg is sext/zext -> sync to 'full' register recovers only
>   lower 32-bits and keeps upper untouched (counting on cross-domain
>   bounds sync logic).
> - 'full' -> 'full' and 'sext/zext' -> 'sext/zext' syncs are trivial.
>
> > rX =3D ...
> > wY =3D wX
> > wY +=3D 5
> > if wY =3D=3D 10
> > here can apply -5 to lower 32-bit of rX only.
> >=20
> > rX =3D ...
> > wY =3D wX
> > wY +=3D 5
> > if rX =3D=3D 10
> > here can apply +5 to lower 32-bit of wY _and_ do zero extend into full =
rY.
> >=20
> > I don't see a value of 'zext' kind alone that doesn't do 'add delta'.
>
> Exactly, that's why I suggest this as a completely orthogonal encoding.
> Effectively for an abstract scalar value X it would encode whether
> the particular register is:
> - X + delta
> - zext(X + delta)
> - sext(X + delta)

ahh. it wasn't clear to me that 'zext' you're proposing does '+ delta'.
Now I see that your zext is the same as apply-delta-to-lower-32bit-and-zext
as I was talking about all along.

