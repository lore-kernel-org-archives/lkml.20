Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731739;
	b=kIFjtD164k8r4B4leh3OEZQVb4SnJrYCT53S7MEomXpZd1Vp3RVZngH+rVV07Br/hjpW
	 GkywhuUXB0/qp1UGX8P6f2KdwzJOC4nqID/wYhOjEamlzXEaIZR1nXdSoscvalMfJjoHn
	 cgKIdvbrtnBnnpZo98MUjieTJLmf64NEVLZGRR5ZiLwMQjh1gbsWCgexggb2XeZltZriJ
	 DdC0b7MfLNFixpjMwFFlzCDj0Ks1ZBoiTZxYZFwD/UEjYmUiSuBPO7hNTYhviQ8ZlSW1y
	 dJ4xhsC7ujrl83ejvl90A4UHw3it3xAF1KVA6jqgXt4ev69kAYTLC8X19YegK+1nZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731739;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UoYGoOCeXt2Q5fxKK2iVTHww4b9e78V4ejqYwenbYq8=;
	b=ruP6rfDqp8Bts2zD+mY0V95Kmd0tPLfw5D5iWWeygKk+F7QAIZkgr1AyEV6MaUVHka4y
	 VfUkCr8BfldINsGx7x2kCQYNRo78GSLLueKCSyoIIikS3K0WebwtcKzlk7IgkhvZi5j2F
	 9q6O7ryWWNmLodt047Aj0M/Yyxl+Btuthon+kvEfROWewwl9YoeOHz/wbAySRvzWctXY8
	 ADDk5ZR1bOGHEjW1C95vgDjvB8fr4/K64TdtIxGuO9vKt99DI3ijbkeXnytdwkhfiXy/a
	 bNkqRbCi5LFkw5gHX7Eq3n7yDKSQbQwcE4JBXbHMcFttnVnCxX1dI0RBtWdQRcCgQ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhZYwHzn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34E606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhZYwHzn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17511F000C1;
	Tue,  3 Nov 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731739;
	bh=UoYGoOCeXt2Q5fxKK2iVTHww4b9e78V4ejqYwenbYq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhZYwHznG+xueBWT3/fzca7tqrZuJ0Al4DWBVbU4EuVj9ek4SioM7dx0bZ1vXCEy8
	 JFNChRvYll1M9b/Fkz5KeLBZP56+6EzPZR25IPQokltvNaYMy/Wpgg2NGVtbJr/haa
	 Fn3nRqzoqYFBgu/LKx3PBsSDJNO+NTHpM1ZOIY1pFsptXb6pGpWBQaVCZnx2t/cerI
	 iVkGzHNcGZ+WMw0tPp/mBvnWUqBhk9ncZUuXAoE6o8AYoeWzCzU6hBSHSdPmKc+c4g
	 /2rcOgmBsMiuIx3xqCVD+TshmCMsqfRqhjjAqGBrdhp4ZWi6Kwt2mgrsn6A3TMQg5F
	 SXuNoByHFBtlg==
Date: Tue, 3 Nov 2026 18:48:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261103-unlearned-platform-26f2d441d53e@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
 <20261102-shredder-pauper-67ef6eaae556@spud>
 <4197b67b-0ef1-4ea2-84f6-b142f67739de@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9VuwXoprUw+Psbr"
Content-Disposition: inline
In-Reply-To: <4197b67b-0ef1-4ea2-84f6-b142f67739de@mobileye.com>

--i9VuwXoprUw+Psbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:31:21PM +0200, Vladimir Kondratiev wrote:
> On 11/2/26 20:21, Conor Dooley wrote:
> > On Mon, Oct 26, 2026 at 11:20:03AM +0200, Vladimir Kondratiev wrote:
> >> riscv_early_of_processor_hartid() rejects a hart unless its
> >> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
> >> hart even when the kernel was built to use only LR/SC.
> >>
> >> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
> >> when it emits LR/SC. A normal build defines both toolchain macros and
> >> still requires the full A extension. The legacy "riscv,isa" fallback
> >> keeps its rv{32,64}ima check.
> >>
> >> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com
> >>
> >=20
> > IMO, this should not be a separate patch.
>=20
> I can squash it with previous patch.
> My thought was: it address different aspect. While previous patch allows
> compiling code that don't use AMO, this one is about correct
> manifestation of the extensions supported by CPU. One can use only
> previous patch and declare "a" support in the riscv,isa-extensions. Not
> exactly true but works. With this patch, one can say "zalrsc" instead of
> "a". This have no effect on how kernel get compiled but let user space
> know exact CPU features.

This has nothing to do with letting userspace know about cpu features
though, this code rejects CPUs during boot that do not meet the minimum
featureset of the kernel. Your previous patch relies on this, you can't
boot a zalrsc only kernel without making this change so I would say this
is intrinsically linked and should be part of the prior patch. Just
because it works if you lie about what your hardware can do, doesn't
justify splitting it...

--i9VuwXoprUw+Psbr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauoslQAKCRB4tDGHoIJi
0haJAQDZXCXvVEOJDxmbKsedJsLnDKgzlkczNtiuT6+CIPN9ywD/U6/S15pu+u3t
orTSZ/KTwdzMkH7Izbancr/CM6fhFAQ=
=q9Ad
-----END PGP SIGNATURE-----

--i9VuwXoprUw+Psbr--
