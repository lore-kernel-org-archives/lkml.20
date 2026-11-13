Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528459;
	b=vPwxEviQJaTDI/pGI3/N6+KWzh1oRoV/STwbT6coJ1C2sQNV3Dwze94cMfABsyX8NsMb
	 EsgSyWE6e/LwPqbqCQH6Q8dIVC4zxpr67Sa/XuA+WxzAD7EmWQLTt0NOvnFKERJzWatRZ
	 bH2pVHbvwAPReT+GidCg3673ZqtIXc++xyX4fwXphT2D+FtPDcS5a/+N+/hfVGHv4aG97
	 t0C3Iu+uRrC7W51i76bNLMQOysDYh6MonuD6yufXUUSoRjiGH55A80iPRFp47Qe54vpeA
	 RIZiSKdUQr/hfAaXapVeEqpfBPS7F1zU4bvDMswfXSElIZSvIOYznBTPMTVNvUt4Clw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528459;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QpGkpJnoxk1/sBthaQlZAmsCfTX4oSPVFGJz6F2K++k=;
	b=MSM7ZZFQlOstgtPgRNbszRo4mCHvXeaVVtABnU4/j7j/JWJIfY0ZGh0QssA3ZMplzn33
	 +EdslGZhq463efZfgn6RWBHJOdX8vdMJxjBlVfjkPwsLaBwAK1lkBqHF1r5tR8hadBiHY
	 wfemkVnnJddVe6Xo0lKREsKxQ3lCp36GDEoNClSN4bVvs9jZUGknx3hCe7RHD38trJytm
	 5I1qTL7DwYE3OpBkIzyPY1+YOAzU2uCbjv5sB7D8IWcXMHpZawPzAG46CPBKypWAmzUMV
	 9pWgAEwUo6zBkLRXVZdtb0t8o8fT0rSgXM627URFzvEEsGHNFaF3yjOoPHblgJrZcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUJ3raQP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC8606A31C;
	Fri, 13 Nov 2026 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUJ3raQP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438061F000C4;
	Fri, 13 Nov 2026 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528459;
	bh=QpGkpJnoxk1/sBthaQlZAmsCfTX4oSPVFGJz6F2K++k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUJ3raQPYmCEXvfMTFxjKVyTF50eCM+2igc65YwIF3cufIXILi05KUBdEsLdt7x99
	 MoBihOU0MxomiKZg+Tk1XeDSeYf0jKegQDUBBBz+Y5mvw1ZbB+U5oo6aSiFWt/NbR2
	 IhXZiF2yVhHMdJH9JVJs3r3rx3I2kvaLZeAqW77kJ7zMwmTK93nN3f3blYO2rPJvvb
	 KUXcF79Oxd6iajzogteuT+asBzguQ50gutQYzjL/K9Z5Z8FWm5SK+GjKQkUhJSzdc/
	 0k/gU81NF1TBhBA7rT/0h0OjxpJeII+W+FOmCNBNjUURNoenMAbNtKxGVl6YPICYKE
	 r8/WOknoPhD8A==
Date: Fri, 13 Nov 2026 00:07:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
Message-ID: <20261113-pretense-immersion-3ecd22d4387b@spud>
References: <20261111212921.290857-1-artem122novak@gmail.com>
 <20261112-reprise-jukebox-41fb305e9044@spud>
 <CAPufuhZPs66hiMzHZPMLBiOAOjJxaePo=9OEvcxmxyQdKFxBVA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="og18d2jLfBFalsqc"
Content-Disposition: inline
In-Reply-To: <CAPufuhZPs66hiMzHZPMLBiOAOjJxaePo=9OEvcxmxyQdKFxBVA@mail.gmail.com>

--og18d2jLfBFalsqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:48:00PM -0600, Artem Novak wrote:
> Hi Conor,
>=20
> I wasn't entirely sure whether this should be submitted as a
> standalone patch or together with the board binding,
> so I marked it as an RFC.
>=20
> I included the vendor prefix in my October 22 submission for the
> fx-9750GIII binding.
> I guess, regular patch would be nice, in this case.
>=20
> Submission from before:
> https://lore.kernel.org/all/20261022063902.471383-1-artem122novak@gmail.c=
om/

Send the board binding, this and the board dts as a series.

>=20
> Best regards,
> Artem
>=20
>=20
> On Thu, Nov 12, 2026 at 12:13=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Nov 11, 2026 at 03:29:21PM -0600, Artem Novak wrote:
> > > Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
> > > registry.
> > >
> > > This prefix will be used by upcoming Devicetree bindings for
> > > Casio calculator hardware.
> >
> > Why is this an RFC?
> >
> > >
> > > Signed-off-by: Artem Novak <artem122novak@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 5471a06f93f1..f05475072eec 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -303,6 +303,8 @@ patternProperties:
> > >      description: Capella Microsystems, Inc
> > >    "^cascoda,.*":
> > >      description: Cascoda, Ltd.
> > > +  "^casio,.*":
> > > +    description: Casio Computer Co., Ltd.
> > >    "^catalyst,.*":
> > >      description: Catalyst Semiconductor, Inc.
> > >    "^cavium,.*":
> > > --
> > > 2.56.0
> > >

--og18d2jLfBFalsqc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavZUxwAKCRB4tDGHoIJi
0ix7AQCKrOULNEMqCJXdz4ncDiKWoimyLarPrAjxM+ZMGvYL/wD/dltqwZc2NJyr
7iKVD3Q3Sh/VS6+StcOqWEzac7gIqQg=
=piVq
-----END PGP SIGNATURE-----

--og18d2jLfBFalsqc--
