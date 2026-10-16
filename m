Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EE282F1D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178558; cv=none; b=suglqIz7NZh+O9lK6BeE6+3a0cjlxOCB+07Y0t/etAcUkgTWpPd2F8nBLFlCiPRXW8chI7vqha+T2yrbys6IxsaMja/cIZoD8RT61lwnCqKIVAAnzIOANRts4H5Bo3ygXBnch+2bCSpT2UYANz5MtTGf8lqrFW60sNW8Y6Wgo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178558; c=relaxed/simple;
	bh=/sCcRUT4PrNUGg3BEqmuV4xUiu4PbZEpwoPVOKSh9Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA36hyQIikk4bDx8Jhpn1PhGjuH3RIi2XTk/7vXb9eNtC5bbgIUss1vSKfKNCMvp0cpJy9mPyesXMRxYj8HSo9dqQJqh3cMwdSUKg7Z8gtss99s57G1rz6Gfn+rPJwY3DHJwxe1HeFvBhMQiRqJpYnpvJhCe+uMLD/MHgvfwAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2qWyWnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2qWyWnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF281F000C4;
	Fri, 16 Oct 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792178551;
	bh=yzuXTFpptabPr0X+uuZGLG2dByB7F1Z3TMushnTW8P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o2qWyWnJ9YBXDyfcsHIklPWW3iewVUKHBjV9K3vuzwqiTzRWAhTaUIER1SC4X5Zle
	 YOJlOaGp4XAD0IAjz3dydDThXgjveUxK9Qy3lFDJysvoTnQIqWwLgVrb1gkyqeomFQ
	 7JpTY9be8E+zaBPhQbl4okHT9yF41H58XkJLH3+7UHs4DbGvUD93VHYj48JYWrrlB6
	 zIpDBBzAkDq8P8H5dl1aywywWBFOjPKcXLzT9y4L0AyqWd4RxPIMt5NnoePXIl3mXj
	 xeVMjPXE7JtZ+sanMiGX/2t35kJMULX24ICucId+r4vTsWRQmEly9tM9mghMO3GERW
	 eYPw8sNMSdVAQ==
Date: Fri, 16 Oct 2026 20:22:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <20261016-uncanny-faculty-222732ee77e6@spud>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
 <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
 <atC9jZIF1T1x0w1X@xhacker>
 <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5XIbLBFUyP01GSIf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>

--5XIbLBFUyP01GSIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 02:24:42PM +0200, Geert Uytterhoeven wrote:
> Hi Jisheng,
>=20
> On Thu, 15 Oct 2026 at 14:08, Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrot=
e:
> > > > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > > > These options are irreleant for nommu systems.
> > > > >
> > > > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RIS=
CV_ISA_SV57")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > > > >
> > > > >  config RISCV_ISA_SV48
> > > > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > > > -     depends on 64BIT
> > > > > +     depends on 64BIT && MMU
> > > > >       default y
> > > > >       help
> > > > >         Add support for the Page-Based 48-bit Virtual-Memory Syst=
em.
> > > > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > > > >
> > > > >  config RISCV_ISA_SV57
> > > > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > > > -     depends on 64BIT
> > > > > +     depends on 64BIT && MMU
> > > >
> > > > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > > > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > > > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > > > the random config can.
> > >
> > > Is that really an issue?
> > > If I build a kernel for an SV57-system, do I really need to enable
> > > support for SV48, too? It builds fine without...
> >
> > This is to align with the spec:
> > "implementations that support Sv57 must also support Sv48"
>=20
> IMO that is something different.

I think you're right Geert, "implementation" here surely refers to the
device. If someone wants to make their kernel for sv57 capable hardware
only, I think that's fine.

--5XIbLBFUyP01GSIf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatJ5XAAKCRB4tDGHoIJi
0igdAQCKgcI5SOiV/Vh4z2myL/uKgchv/bePjysKWFMegwimwgD+Mml3OTyzodPD
nGVgI4JGnxSB3Yq11kMS70qNGxjMcQ8=
=+FMG
-----END PGP SIGNATURE-----

--5XIbLBFUyP01GSIf--
