Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692322;
	b=nVH1O+wwsN+nEG3Pepa70PURxW1LsFV8iXn2u+oJGu+0UD7sUJyBA3glnXpBLK+U4SuP
	 R4wMqrWmr9a+8psDaAyYS4dfgq4BdZQRpSy5nkSxhDWn6L9H1o05rNFJ+A13oLAxpLACy
	 f/OhCfOjupwVI37c1lrClE3vnY5vAdWjgM175cqBTYDHsErtFJZTarMSPySIqRcJzupuq
	 tttpZtm5bON1tJx7rkXwBTDIeSKpUgzMobl7OY81eeV9Pri5XHyVPzwBWq7akWXVy08dj
	 BmUOnrJB9E6CRxbnkSl8vLtshEEVeoOWsDRLcttZzJhLxkshtsQsdX0KDms1DLBrh2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=66xP79lt5Tjx1kcLiN+8GMbh1FpuhTHreHBKUBB8XQE=;
	b=BSR9V26F10BojhetR+hdrQ4QwZKlM8gqlzb+m/PYmXlaxiuuLk2geuOQ9QESyI9uAxLD
	 CPI8lxuk//gaYKYXitpbZ0yRH4wb+8Dwl4xH3B+MqU4dRGn/boYP6zsRn/NTsrWDJ7wKE
	 sHtHg/KDRaDviCp4NRR/8c49erBoR5roEP7H+wyCZMDEo/V8gZ+XnL2xOkvp247r4jjAg
	 yS0XDa28maYoT6HS5AlGIWJXHwWmihJGuCXUS26M4c/htpJddsjmBoBromuCoTsSBUVag
	 8BgSWN85W6Vf4r+WKJjKGopc6+1xsqXL0CVoqIuITcJVuL/rXvph/AJlsTmU2m1SbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJfdPjF2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A900F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZJfdPjF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00321F01825;
	Thu, 22 Oct 2026 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692322;
	bh=66xP79lt5Tjx1kcLiN+8GMbh1FpuhTHreHBKUBB8XQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJfdPjF2alXuM40GMRoGu4hYOPz5NM3T0w3PpA4rALN1G+0hRFrXmN/qk3AIaAuL6
	 z8Q26ZQNS/HkJ1knitkpc+NlkxL+hhPNz6+JejM2ufAJtp/V92Em4/QvBMsIxy3jmE
	 U9VX2UvFEng+RGSS7ekzg5RC4+puHIc4jwnCmS4rXz1UY7VMKFTY6mswJA29cKkHrs
	 kd8uQa1FaZUfQkEsVkxPA5WpeQRLoKY6dmAdavxdqv0DV8ERlS0Acw/8CvoFdTYD3m
	 LkPwWQNHpakJTxqVMurGds5J1cc4AxJf85+BSLlUBWXvgNW56QRgaIsoZ4KDxtQy4O
	 G+JzE7Fn48mfg==
Date: Thu, 22 Oct 2026 19:05:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Message-ID: <20261022-chubby-quote-4d06564dc4ba@spud>
References: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
 <20261021-negation-carol-e42b4ecf3726@spud>
 <BY5PR04MB70254A39FF5BC39716B23E5783652@BY5PR04MB7025.namprd04.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="4lkyleY9UN/A2RLt"
Content-Disposition: inline
In-Reply-To: <BY5PR04MB70254A39FF5BC39716B23E5783652@BY5PR04MB7025.namprd04.prod.outlook.com>

--4lkyleY9UN/A2RLt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:20:47AM +0000, Pinkesh Vaghela wrote:
>=20
> Hi Conor,
> =20
> On Wed, Oct 21, 2026 at 10:43 PM +0530, Conor Dooley wrote:
> > On Wed, Oct 21, 2026 at 06:39:06PM +0530, Pinkesh Vaghela wrote:
> > > The composable cache resets with only way 0 enabled, while the
> > > remaining ways are available as Loosely Integrated Memory (LIM).
> > > Systems that do not reserve LIM therefore use only one cache way
> > > unless software increases WayEnable.
> >=20
> > This is not true in the general case, firmware may intercede to set the=
 ways as
> > it pleases.
> >=20
> > > When no memory-region property is present, DT describes no LIM
> > > reservation for the cache controller. Validate the reported way count,
> > > then enable all cache ways so Linux can use the full cache capacity.
> > >
> > > When memory-region is present, leave WayEnable unchanged because
> > > enabled ways cannot be returned to LIM until reset. This may leave
> > > more ways assigned to LIM than required, but avoids consuming reserved
> > LIM.
> > >
> > > Apply this policy to all compatibles handled by the driver. Firmware
> > > or
> >=20
> > I know this is going to cause problems for all the microchip boards, wh=
ich
> > maybe should have reserved LIM but never did because the LIM was never
> > put in the devicetree as memory in the first place.
> > They also don't suffer from the problem you mention because firmware se=
ts
> > the ways up.
> >=20
> > > DT configurations that require LIM must provide memory-region;
> > > otherwise, Linux will convert all disabled ways to cache.
> >=20
> > I don't like this behavioural change, it's never been mandatory to have=
 a
> > reserved memory region for the LIM. I'm only in favour of doing this on
> > devices where we know it is actually required to be done. The eic7700 I
> > assume is one such device.
> >=20
> > Cheers,
> > Conor.
>=20
> Thanks for pointing this out.
> =20
> I agree that firmware may have already configured the cache/LIM
> partition, so applying this behavior generally could overwrite that
> configuration.
> =20
> EIC7700 firmware does not enable the additional cache ways, leaving
> only way 0 enabled when no LIM is reserved.
> =20
> I will restrict the change to EIC7700 using a device-specific quirk
> while retaining the memory-region check. Would this approach be
> acceptable?

Seems reasonable to me, yes.

--4lkyleY9UN/A2RLt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpQXgAKCRB4tDGHoIJi
0ixCAP9/hAD9o5Vy6FG7ZT8n7KDT+Pe6cB1sfDmRyZHLpO6eWgEAzT+1nU4Q8eAG
mZvo5zxTiyh7mPUMpumY9iHMXCJM7g0=
=V8G9
-----END PGP SIGNATURE-----

--4lkyleY9UN/A2RLt--
