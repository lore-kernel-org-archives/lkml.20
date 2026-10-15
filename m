Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B53525A75;
	Thu, 15 Oct 2026 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079652; cv=none; b=d0IEekeVySTJ4NCHD5wjJkrKjUqRl1HogsOsgArl5uhnVHCJfoAJkn+r9+jm+kaTEOa8DIPjR4RQ5XC848Dq/+yaaUPx50xOuI2FV9vvpBw5WW7B1OJeWAeW7T2/XQGIseYZurklVPG02fPaxBKIFbMDVVlmMo6o6ySHbNhpaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079652; c=relaxed/simple;
	bh=AuKl68slSTHCay3XLy7K8cqAub4wQ9bplBmAjw7s75A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ5s7yc0OrzmJFqKGAXpz0LsGXZywNhnGqyKnRfljw7L+XCFQ2HHpBEwgHM4IYKzRxObJ4FDYXk0nTww5c785VDRrvbMK9+lnjKtYLiiobbZ0i/16fv/Yu6OTXqM7YbA9FaOPjclRhJYfy0xEb1kLZH2uDGRemDIKcZ5J/TulN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX1mxa9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX1mxa9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906221F000C4;
	Thu, 15 Oct 2026 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079640;
	bh=a7qtDwdTKhZ5mPi1y5aENkA+rudTV40TeKlnUV0OgqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eX1mxa9PDHZEJZPwhRSJKUgJwx10m2GOwb1gU3AqWEdmWFNxSZx6oUuJhJXm5VKsn
	 k7e14JgrFlc1N2zWUv2IwDHMgwgSBQ1k6DYqn+LVJZhv3KWtuABebhkkTalZ89Ppmy
	 Et0fuQfVMu+LFG7NpnQ5Q0Qol64Txg7xNRXKVh3S8RldUD7NRRk7VF2BGofBN7H9Qz
	 ujopAVnWKj6Zd2rW+psoz+CRr04LrIkC4R5gKxd2uFNF2E0kndvkUEr8o8tBPa9WnT
	 O1hUtYkMlTsUT5JyYkwNmSZPImFSpqphb2y3D+lxyHyDLACAOp2++bTXPZH8FmwQYN
	 ZIzveV4+DLVRw==
Date: Thu, 15 Oct 2026 16:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hyunuk Son <hyunuk.son@irondevice.com>, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, kiseok.jo@irondevice.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Message-ID: <25b0ba6e-2366-44b0-bb79-a8d2fccd1dd9@sirena.org.uk>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-2-hyunuk.son@irondevice.com>
 <20261015-gregarious-flawless-cuttlefish-145cab@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WaCnTytimciikIgz"
Content-Disposition: inline
In-Reply-To: <20261015-gregarious-flawless-cuttlefish-145cab@quoll>
X-Cookie: Tax and title extra.


--WaCnTytimciikIgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:36:38PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 03:04:06PM +0900, Hyunuk Son wrote:

> > +  compatible:
> > +    enum:
> > +      - irondevice,ma5311
> > +    description:
> > +      Requires two I2C Channel.
>=20
> Not sure what is I2C channel... like two SDA/SCL lines? Anyway, this
> goes to description.
>=20
> > +
> > +  reg:
> > +    items:
> > +      - description: I2C address for control registers
> > +      - description: I2C address for ADC registers

Based on the binding it looks like it's two distinct I2C addresses.

--WaCnTytimciikIgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ9xIACgkQJNaLcl1U
h9D1eQf+NrEk55AZCavXDyO7+8ORQQvcpOLEl0nujHZnPAPgVWX/3+YnAzp/zK95
kl+Ade6eSrQuaA58ArAc6nGac1LyfsbHnFskCaBcnR238ViwbICimNnB9V5nAEJm
3JNqRFzVrJDJ8/drvxpbvN20aEkWzYZVcxoXH7CGzfTadEcqEpEhL/UPtEnvl98v
eYW97c8mCeFHwMYaSbkBw2vddifZavYD4J6t4RkPMZrl/amKNkq6p7lo1BujB4do
Ly3QfYcK2x/8fuVmNNt2kg3mMYKc6LZ5r6G0RL5XmsMYFmDrubKKkx07boobjZPY
kICxqEYKU7mmgL9cMO4OMyf7oi239w==
=/Mtm
-----END PGP SIGNATURE-----

--WaCnTytimciikIgz--
