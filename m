Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8053101A7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788554985; cv=none; b=TrftHDUD40w6SuMWBgE7eEQ9AooBVOTfu4goIvA4Tzq9cvMIVQNi4hCzA2QJN+n1rSYMUuc8Pyc8Au33tSPKjOdBBNZg6tLg6P4oNUtkpXAQxkM+pgiKhHHEe00uyk2FFu/dlJsH1XxIdM49tc0UeLM8agsv6Oier+zliCf5wxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788554985; c=relaxed/simple;
	bh=eRn2tf4siQ0cQ92/gm34hZkbR9haHPJudm+Qww/BBnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv5moNzrhhNfuxeQfnhCYtNnCiQ2KoY9ERE/xG8czBDe2Co1bo3LgS9ufMeOK7/2t9ZayOFrgC/ulC+4D2x3uwriYQJEguC3Z4WPukVtBZVjzDV8FaqfGAl9GQouYu2xRYlhuu/E3IksvuCZtftksM9pIQ996zbQwKsbARABW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oftt+C17; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oftt+C17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F41F00A3D;
	Fri,  4 Sep 2026 20:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788554982;
	bh=yv0otkI4R3GXS81uLq6Au1MGNUzomyZRVJ0cIST0K2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oftt+C177df3SD8JCk4/ygJrGu/v6qf0D/JTfSn3l/7d23chMcQP3Y1rc6iwqVCyI
	 gw9/d/GkFudw5128IJ++gyEmJNBmVxrSWKFAmCAktxBPWOzR7qSrjrS+hHhP7x0VHa
	 xIgObrqftMKlh4vA8WX/7G4AHbsC2KyvgsQ2XyNKhJDVsmUYQog+pS+bWlMvm+c58F
	 n2XNLBaHgVIlTkKC5opSqy6lxwUiqCC7nvRBeL44C+y/iAodR7g4e2Dv98x5oR2+8U
	 WYjtWB/8GrtfphOrqhvzyq4/RA8pUd1uXR9PsKyg7hDIygsxKPx1/k+bVBnRTHxGJK
	 jKhMW3cIwOMYw==
Date: Fri, 4 Sep 2026 21:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: introduce cap framework and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <20260904-semantic-quiet-24fff0973cc2@spud>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-4-jszhang@kernel.org>
 <20260831-falsify-arrogance-6917870b8596@spud>
 <apYafAJvKqz_hRzR@xhacker>
 <apZa3EnjGjpaydGm@xhacker>
 <20260901-mountable-engraved-f47c899ed194@spud>
 <apdeoLGpeBW0Hq4y@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GG0dE94JHQf052MT"
Content-Disposition: inline
In-Reply-To: <apdeoLGpeBW0Hq4y@xhacker>

--GG0dE94JHQf052MT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 07:24:16AM +0800, Jisheng Zhang wrote:
> > > other cap usage PoV: the cap can be used to replace various static
> > > branch usage in arch/riscv, for example the fast_unaligned_access_spe=
ed_key
> > > As is known, the static branch has some drawbacks.
> > >=20
> > > So no matter which direction this series goes to, we need similar cap
> > > framework. The key question is whether we can extend the
> > > riscv_has_extension_*() to cover cpu/HW cap,
> >=20
> > It'd be nice to see if we could reuse the functions, if we don't
> > want to invent a bunch of XLINUXFOO for them. The vendor extension stuff
> > that Charlie added reuses it, but since there's no Linux Foundation
> > JEDEC ID (AFAIK anyway) perhaps there's just no easy way to do it and
> > duplicating the functions with a different name is required.
>=20
> what about if convert fast_unaligned_access_speed_key from static branch
> to alternative? It's a cpu HW capbility not extension. rename the
> riscv_has_extension_*() to riscv_has_cap_*()?


Is there any value in actually moving that one to an alternative? I
think it currently only has one user?

If there is value, I'd rather see __riscv_has_extension_*() get renamed
to __riscv_has_cap*(), so that things like unaligned access speed get a
different namespace to standard and vendor extensions. IOW you'd end up
with

static __always_inline bool riscv_has_extension_unlikely(const unsigned lon=
g ext)
{
	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_M=
AX");

	return __riscv_has_cap_unlikely(STANDARD_EXT, ext);
}

static __always_inline bool riscv_has_vendor_extension_unlikely(const unsig=
ned long vendor,
								const unsigned long ext)
{
	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
		return false;

	return __riscv_has_cap_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVE=
S_BASE);
}

static __always_inline bool riscv_has_cap_unlikely(const unsigned long cap)
{
	return __riscv_has_cap_unlikely(LINUX_CAP, cap);
}

Currently standard extensions use 0 as the vendor, perhaps we could then
use -1 (the value is an unsigned long) for non extension related caps?


--GG0dE94JHQf052MT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapsu4gAKCRB4tDGHoIJi
0sbxAQDD0972SFMaZj7AaksRhMd64kn+GSb6fXOk3mnVmeDRLQEAsGi9D+KNoVsv
z+fOmb4fa34uegQWg4zaQQs+Iv220A0=
=BIVN
-----END PGP SIGNATURE-----

--GG0dE94JHQf052MT--
