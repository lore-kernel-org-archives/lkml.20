Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849652;
	b=TdztgL3Sg097GKEpCkAf0L9U2QibLnnuCNA39ysHDZr6vLZqCkHQt/p4pis6ISdqFUqZ
	 XT8iTz8SPpfNGH7zZR03j62mcNGwjmQwbRT/q/iDZAHQcKKtVA14VB4XDT9/PA6oxzUjo
	 34qtYdnfZGIOB+Q0kpP0lmGZggJxkncGZgAK6ZUify+hO9x3lETOtAZkaxetqnUb/5hSW
	 RSQHjdOHWG8D6maaWKCMP8DxwcKRAjihQcZigvxG9kan+ibgdYDLJDK00BO5brGYugxWP
	 0m3OhvpoPNaIaFQUYVfmZXH51FTZDZgnYbUG0UHd5aJvsxFPotmGCQ/mFLYuX8MuVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849652;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=scd7KPiRVsbA2XxL7ASc6Bp3Xum97UozhMdMhwjKhPo=;
	b=1KopqK4ffa5a3zBL4fGVSjPx654Tb50E3Dpkjsx9ad27iq0F3DEaHcIZ0aHPiqkyYVx0
	 XgOEsvolH8GZKrDj0X6j2+6+58ZThdcAWtW/TYFRqaN2fy3Uw8X6lmgW4x+UoSstsp2FS
	 kyPajauBoKPYvu0P50YSncmIXBjeWhYiMHnZUtHbQHhCzOH/zBhhGVyKrhSYYfXMZGOta
	 biDl5ubw75KsOxYWhonE/ZFmrFBcngn9fFWj30Gh6T7crlEEiTie49cTSGhURt8hMKzML
	 MlailvA8ndd7JzqgEWfxYqhPzgynLiS8RS7wxeexQncsRjnhyApKJCYr/mQCtdKlIxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kw/RMWwl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F450606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kw/RMWwl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFFC1F000C4;
	Mon, 16 Nov 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849652;
	bh=scd7KPiRVsbA2XxL7ASc6Bp3Xum97UozhMdMhwjKhPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kw/RMWwlR/zQZHbAxE2vH0EEg69M0lvUZrH2QSeJ/p7OwB4IE44S09DcNBW6OGVW7
	 BslOPpjPmEBzBN5LM4qb4E2LckVVJ/euPotGVii4Za5Di878LUagpYKfOa2vWOYGaL
	 C9fzd2budQoE/3X6VryI5gDUOpCCMn84stoVUffaFkGJ2Lma8Nr8rbN22mnLj0rPRL
	 DXwCYT2q+omBNLjSWRGj9/Jlu886zo+sh/kIuVLOWyRtpvTYV8EXP2lMNy9RJt1R9a
	 f2xTO0xrMJnJJtS379Z7d9ROQjOq23aMEtUzMIBw0Y2J+0PjYwhyMDgNIMYpDAXZ1B
	 9Kuqk6/e/3pgw==
Date: Mon, 16 Nov 2026 17:20:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Avi <thnkslprpt@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Message-ID: <20261116-dreamlike-uncheck-9eebf91555d6@spud>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
 <20261105-igloo-stunt-534496ad0518@spud>
 <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="nbYSfbusVy/ZW6KP"
Content-Disposition: inline
In-Reply-To: <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>

--nbYSfbusVy/ZW6KP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 07:40:42PM +0200, Avi wrote:
> On Thu, Nov 5, 2026 at 8:24=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> > > sifive_ccache_init() uses of_find_matching_node_and_match(), which al=
so
> > > returns nodes marked as disabled. The initializer can therefore map a=
nd
> > > access a cache controller that the device tree marks unavailable.
> > >
> > > Select the first available matching node before accessing its registe=
rs.
> > > This also handles a disabled node preceding an enabled one.
> > >
> > > Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controlle=
r driver for SiFive SoCs")
> > > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > > ---
> > >  drivers/cache/sifive_ccache.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_cca=
che.c
> > > index 71d3f94987fa..02878d54381d 100644
> > > --- a/drivers/cache/sifive_ccache.c
> > > +++ b/drivers/cache/sifive_ccache.c
> > > @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
> > >       unsigned long quirks __maybe_unused;
> > >       int rc;
> > >
> > > -     np =3D of_find_matching_node_and_match(NULL, sifive_ccache_ids,=
 &match);
> > > +     for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
> > > +             if (of_device_is_available(np))
> >
> > Are there any devices where this is actually possible? IOW, where there
> > are 2 ccache instances.

> It's more of a defensive thing. The 2 ccache instance was an example -
> the issue is also relevant for one disabled ccache node no?

That is true.
And on the two node front, the driver doesn't support that anyway either
before or after the patch. Consider what the new code does if there are
two nodes, both enabled.

But I don't think the ccache or llc-cache successor are intended for
that kind of situation anyway.

> Since of_find_matching_node_and_match() doesn't check whether a node
> is enabled, it can return a disabled one.
>=20
> sifive_ccache_init() then goes ahead and maps and accesses its
> registers, even though the device tree marks it as disabled and normal
> OF platform-device creation would skip it.

Could we instead drop the loop and just check for availability, while
retaining of_find_matching_node_and_match()? I kinda feel like the loop
gives the impression that the driver supports multiple nodes, when it
realistically does not.

Cheers,
Conor.

>=20
> >
> > > +                     break;
> > >       if (!np)
> > >               return -ENODEV;
> > >
> > >
> > > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > > --
> > > 2.43.0
> > >

--nbYSfbusVy/ZW6KP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavs7cQAKCRB4tDGHoIJi
0pNvAQD5/KJVymuE7qmA071m1fi7a4OINJ983TfXYxTo/6Wq0AEA04ux8cMbfJqI
BIpTXQuSLQDewZqgUQfZE9C4L2OC2gg=
=haUZ
-----END PGP SIGNATURE-----

--nbYSfbusVy/ZW6KP--
