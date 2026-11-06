Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970493;
	b=CmXjQ/V52ZBsV/boXQPNDe7mWYa1Bb507XlTLiSp3qxgRkDaRR4md5JZqqaVizGZakfM
	 OYMb1Utn58dygQCP7DzqubqmkrARo7cHIYqj4Ndiee9KniL7Hj7KgAdOIojGB4qDj0saW
	 1y1xnsQEHMhJad98ce2u38y933IAGqJAYG2l6tU9IKX2YYMYA0i/y7WggYMfmximtZbUl
	 lwc45bv4FswYd0wOqXLENDBW/fJqOXSO76Mu9Gqxw6tuZIIQbtz3+kTTSEJ0YYEPlzcy4
	 iio1fTU7aQHIsTuGOLK9o5PrdtnuuALvUGswRyRwrxuE3YZvf9BaLlhclktchnUF97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970493;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TO6nA6fKupuT4LKQD3ReT4Ai1+g7oQCPamJoMi0vNPY=;
	b=RZzL4GG+5/HrsieFxmkCPH2caikC26ZKcgBcZrAhz9q6Gw5AVwYJF6QIRVcZOkKqWazw
	 IxdENDL1GhYEwBJlWEiI3uFtA2PWnhT9xJlfJYwqe6S3MRWEYmNheJ2RKal46m/WEiKo4
	 f/5mrs3c3dd+gdmbA9bqj6A7A+mh8u8WbhRZTnRe7V+O/cQNAkIgysIOnqdInMsgWRsN8
	 a0ofMxWYvRbyx3zOvKuwwc9ExQimzalBXwQkGK7EkS4G4voRXfdfkAloZzHvvkA26thEH
	 QSKMWJFHuxErp74bh9OI8RWD5czJxETqqv+oKDDqLgP1kx/Y9S8k8bVnnxDCfOCyUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXuAas0C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B6606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXuAas0C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812AF1F0089F;
	Fri,  6 Nov 2026 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970493;
	bh=TO6nA6fKupuT4LKQD3ReT4Ai1+g7oQCPamJoMi0vNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GXuAas0CTeamncwsg42u7CiH8oTxTo2kxvWELAUvYkZNOVg1DcBwc9K0gl/48HeXf
	 Vktz7nWTAEmDPaGWQDYiifQc3MK39ldDtR4gB062UxMJsyfJPAN+I7gcJnbGu+JCHw
	 yeQtrEh+Pzf3NvY5J6T1t09OzZAwPB4U8xActYf+jBfN6IT1r/wSxnFTHmVIs96SSE
	 HP5V4WVmCGhTxyPYzfa1RztLzf1j3ITQrBsjYAcc4dNafT+pcD5wTMh8im3zbQFu/L
	 Or/u3M24IOnuvY3o9LxXcuKfpcmhicxZlylMhal6UsEhth96Rpzbij23cvjbSZLlme
	 MRFSF9Gow7xJA==
Date: Fri, 6 Nov 2026 13:08:07 +0000
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
Subject: Re: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261106-smock-headband-d6a7d568c228@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
 <20261103-pushcart-very-04a34d0ffb0e@spud>
 <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
 <20261104-saddlebag-starring-4380fcc9293c@spud>
 <06025d29-44b4-4ae3-bc82-84185ad786f1@mobileye.com>
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
	protocol="application/pgp-signature"; boundary="y7wNRCiC54YoRgMh"
Content-Disposition: inline
In-Reply-To: <06025d29-44b4-4ae3-bc82-84185ad786f1@mobileye.com>

--y7wNRCiC54YoRgMh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 02:19:41PM +0200, Vladimir Kondratiev wrote:
> On 11/4/26 23:55, Conor Dooley wrote:
> > On Wed, Nov 04, 2026 at 01:23:52PM +0200, Vladimir Kondratiev wrote:
> >> On 11/3/26 23:41, Conor Dooley wrote:
> >>> That got me thinking though, I feel like this breaks some of the
> >>> extension parsing logic in other ways.
> >>>
> >>> If you putting zalrsc and zaamo in your devicetree, we never do any
> >>> backwards processing to set the a extension (we don't do this for any
> >>> extensions by design, we only populate "child" extensions based on th=
eir
> >>> "parent"). If there's some userspace thing that expects to see a in
> >>> cpufeature or w/e it'd break. There shouldn't be since a has always b=
een
> >>> supported but who knows. You need custom userspace anyway so I honest=
ly
> >>> don't give that much of a shit about this going wrong.
> >>>
> >>> What does "worry" me is hwprobe. Currently you've not modified hwprobe
> >>> at all to correctly state that you do not support
> >>> RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of wheth=
er
> >>> you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)
> >>>
> >>> Maybe, again you don't care cos of your custom userspace, but this ne=
eds
> >>> to be holistic if it is being done at all.
> >>> Personally, I don't want to lower the minimum requirements - the peop=
le
> >>> designing this stuff to run linux should have checked to see what our
> >>> requirements were (and have always been...).
> >>
> >> I will drop this patch and keep advertising "a" because formally it is
> >> true - all "a" including amo instructions do work but rather slow. Als=
o,
> >> not worth to complicate logic here for (so far) one very special SoC.
> >=20
> > By that logic, do not complicate the kernel at all with this zalrsc-only
> > stuff and drop patch 1 too. Please do this properly or do not do it at
> > all. If we are introducing the ability to configure the kernel so that
> > it runs on systems with only zalrsc, people should be able to run the
> > kernel on such systems without a) failing to boot or b) incorrectly
> > reporting to userspace what the hardware is capable of doing.
>=20
> I am reading again risc-v spec, and it says here:
> https://docs.riscv.org/reference/isa/v20260120/priv/machine.html
>=20
> "M-mode can also be used to implement features that are too difficult or
> expensive to implement in hardware directly."
>=20
> I read it like the feature implemented in the M-mode trap considered
> "implemented".
>=20
> Thus in case of AMO emulated in M-mode, it should be considered
> "implemented" however slow. Indeed AMO instructions are executed
> correctly from the S/U modes standpoint. Program compiled with these
> instruction will not crash. It will run quite slow but correctly. So
> proper wording would be "slow ZAAMO" and not "unsupported ZAAMO"
>=20
> Is my interpretation of the spec correct?
>=20
> Also, you accepted patch set introducing this p8700 SoC with "A" marked
> as "implemented", here:
> https://lore.kernel.org/all/20261103-agent-lagging-d7fe1c9334f1@spud/
>=20
> I will follow this direction, keeping "A" as "implemented" and offering
> choice to use faster atomics implementation for such system

I think you completely missed my point. I have no problem with declaring
that this platforms supports any extension that is emulated in firmware.

My point is that if we are adding Kconfig options that ostensibly
mean that the kernel can run on hardware that with a minimum of im + zalrsc,
then the kernel should actually run and run correctly on those systems.

The option isn't
CONFIG_SPECIAL_SNOWFLAKE_MIPS_OPTIMISATION_COS_IT_DOESNT_MEET_MIN_REQUIREME=
NTS,
and if it is, my opinion is that performance improvements for things
that don't meet our minimum requirements should stay out of tree (as
really should any soc-specific tuning options that can't be enabled
without penalising general hardware). It's not as if this is this device in
particular being picked on, my own employer has stuff out of tree of that
nature FWIW. In my opinion, as I have said, patch 1 is only acceptable if
it actually lowers the minimum requirements from ima to im_zalrsc. It
really should not be too hard to extend hwprobe to do the right thing,
or to deal with bpf by either disabling it when the new Kconfig option is
disabled or by modifying the bpf code to reject the instructions that
are not present.

Cheers,
Conor.


--y7wNRCiC54YoRgMh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau3RNwAKCRB4tDGHoIJi
0jO5AQDkU/HRTt9/PAnDkhU21zOSQb3ux+VM8FFvRPi8tzF/2wD+PlZq6da/ecAy
hBC8Vg4F4jTM1Vvg2pC2YwDuHhm7cQE=
=s0yp
-----END PGP SIGNATURE-----

--y7wNRCiC54YoRgMh--
