Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999717;
	b=Vt4h/7aoP4XDcEitR8P1hEcLfYLCfpLA2CG8uN3Yia8AhsfoXZJ2aO7D0/ave0N76thS
	 szHQhW+i68ITRMmxVMuMxSAnj8mYp7FLS+1bctgzDLiTJ7M5lw3d3bdbKCfWKNIAQeg/4
	 MyctGuTYagPPQZ4EnbjzPl7Mitzo1xfBu4dJnb5i5bji2MrMIy1UyaSIILaWhjQ6YEmTi
	 4T2s1w9MbUEwKeRV0z42+H4mMkDYIPflxNy0uxHneW2A82QJmQvQJy4GfNzdg/fWU/MYv
	 nCRBzPI2Q4hmynQwmpCiQLJYiowFcc3gSmHBy9tB91LLBwltVDH5gcz41bzo349UV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999717;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cDsr5kKiBdFRv3e9B3EpFq9dfSXD/V/9SF4tGqKbj4M=;
	b=zA+Vkkq6xy38V5s3I2ouAwnCQoJheAzjzpc6K7yA3NgYQlfyuUuCXg0gr3vXxqc4sy3Y
	 0yYEi5ZaAiStQHo+KFw/P/OpQyLY2xo8UEXW5eQJt0uxywrLZLCdoe7KsTtSXOz1n24jP
	 1/FL1q7NNYNdRZqpiJRXooiYpWZ18yv8TwRL/X/R95q4Z3p2AtutB9uvtyAz/S5j6I7NT
	 ioC3XMAXW9NC9FUyyYVJmp+dLJ6yEsSkEHhSAXgChbmxvU6fjxKKd22thODrN1v3VoogQ
	 wVYdI0tF3nOlQCV4BEQifllsP8nauyGfxX4XF1lYDw3R/vbFtzM/F/nm+A7Tu3xUT4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCv5OLM5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D16606A326;
	Fri,  6 Nov 2026 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCv5OLM5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374AE1F008A2;
	Fri,  6 Nov 2026 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999716;
	bh=cDsr5kKiBdFRv3e9B3EpFq9dfSXD/V/9SF4tGqKbj4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCv5OLM5WaIcpbmKIbDVp6HIAX/E1r/JtzFAqfxFUN1TJlPaaSUDTFIbCQNu0hLwQ
	 E6UhgGHqLb7ULhd0Mb42PUVDpzMeZu56rJb8Qp2kYqLlUYva6WtX/5GPnupLk09vFP
	 Seac2uQW4fwwgblBpzGqFfMFKnBMf7XFgjyPmXrVwsZyx1CZiyJ/O9xUtwO4naNSa+
	 YahfVbCUkMoOXvxo4VPAnNi2Ljy7eJcTriX6knzPCXaQ9TutCmjb7TEH9h0Bwtvx48
	 jcFuMD3RGnXQnSL5zDkPCblDgxQwvwjyXGSvFRzHQ2C7KR6JPgg44+WUBW/4Fp6Av9
	 BO6BXYy1HgqkQ==
Date: Fri, 6 Nov 2026 21:15:12 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Owen O'Hehir <oo.hehir@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
Message-ID: <20261106-tumble-hurt-d1a0be3fddae@spud>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
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
	protocol="application/pgp-signature"; boundary="uxj3Bu3KA+9of06z"
Content-Disposition: inline
In-Reply-To: <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>

--uxj3Bu3KA+9of06z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:06:22AM -0800, E Shattow wrote:
> Hi Conor,
>=20
> On 11/6/26 10:54, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
> >> The firmware turns the status power LED on, but the node has no
> >> default-state, so the LED switches off when leds-gpio probes and the
> >> board looks powered down.
> >>
> >> Default the LED to on.
> >>
> >> Tested on a VisionFive 2 v1.3B.
> >>
> >> [...]
> >=20
> > Applied to riscv-dt-fixes, thanks!
> >=20
> > [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
> >       https://git.kernel.org/conor/c/68dbe2550bd4
> >=20
> > Thanks,
> > Conor.
>=20
> I replied this a moment earlier:
> https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshe=
ll.de/
>=20
> This disagrees with VisionFive 2 Lite schematic; if when this node is
> consumed by a bootloader it will be evident we are not describing the
> hardware correctly, no?

I am not sure if that's actually relevant though? If the visionfive2lite
needs this gpio then it shouldn't be listed in a leds node. Changing the
default status of it doesn't affect the fact that it is wrong to begin
with, wrong before the patch and wrong afterwards. If there are some
boards that include this common.dtsi but don't have these leds, they're
not common and should be moved to the relevant dts files. If you know
what those are, please send a patch doing the move.

> If you want the light on and it wasn't on at reset or due to boot ROM,
> then that is userland stuff and not hardware description... but that is
> your decision to make as maintainer.

It's a power status led, I think it's pretty reasonable for it to
actually represent power status without intervention in userspace, the
alternative I guess could be something like setting the function
property to "power" - but I'm not sure if that does anything for
gpio-leds.

Cheers,
Conor.

--uxj3Bu3KA+9of06z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau5DYAAKCRB4tDGHoIJi
0nrFAQDR7pn5SeJlvMs2Unksnuskzogpm5QCuq1mwU5NbmpKOAD/YTa+FWIjGV6W
9G8YF1A1U6fNmtjrNz9b9so+HUo+ZQs=
=IGxj
-----END PGP SIGNATURE-----

--uxj3Bu3KA+9of06z--
