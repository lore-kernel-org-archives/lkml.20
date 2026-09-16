Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49B4EBAD6;
	Wed, 16 Sep 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559844; cv=none; b=Nacdnwb38c5sdmwVT6H36fVVPneEZWLc0T4DtjcfIjGx5U+CJ0006kwGXWlGrAKb30GQEsm3Zw527w+T8EdgU5INX/MzLjDIwtNJDuC82IidnbMRVRemLCoiDuibqjnyeo6eHk1yzcxGYR337MMMukqS+lIxjjdkgiF24U3oU6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559844; c=relaxed/simple;
	bh=+LtRmbxwd85RdYqmHNnNzjoHFPg6PgK4hUBdyvizWwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJdgJ8X3K3rNtA4TapGl1qx9iQKTWC6YtEuZ4WWOG24jg6VSnUOj7az/zTS+0Tnl5gQjcr3ZXv9KFFpLRs+FPk9hEPUYFDEPJM6NqT75o8IAcDti/Fd3bXm0jBs0gk940Z2ucM2FZ1sCc6cy2WfCq0RxQLBtt1oz0Zb1tIIUaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzeCY7Vq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzeCY7Vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469821F000FF;
	Wed, 16 Sep 2026 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789559838;
	bh=jQzahxlR3x5lfRUGFf42Mhc85kasPW7Fz63+sfAlGVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CzeCY7Vquq8rG8pevEn4vuQ3aKfYpKYwRBBA3CBuWRgrOD86Bfgk52M/9M4lHidsr
	 uM2cIk+MB5/BbTEEe3gd0cvfPiQP0wjIetkiM+VjsP2lfuidtgPoJrCk3v15PBrUfp
	 PBIoQos5KZ+1md8DGnXN5bMEKAAHsYTNlCYTm0nixARBx78ALGq0VMRSTZuLagred7
	 QV3YtETijFpKLZiE4sXnfJmbm5TrQD6YN/GMY6Cz6O3JzXSRLOZYzyfUq2r4zsQUrE
	 6HgZYNWOF8jlTsTVTFaGA2768cBjQu8kajwbdQ9GzCBszn/8esOZLO16UuhXyi5HbV
	 mdwW8JBre3gPQ==
Date: Wed, 16 Sep 2026 12:57:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
	Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
	nitin.rawat@oss.qualcomm.com,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	lgirdwood@gmail.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <0d17ef87-0b95-43cf-809d-7d28d3e29afe@sirena.org.uk>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
 <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
 <aqg-JSTrbg-xR69l@sirena.org.uk>
 <5ff87d08-c263-4b9d-a18d-c8da8fc0de1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LeMdaFtY1wIgmB0+"
Content-Disposition: inline
In-Reply-To: <5ff87d08-c263-4b9d-a18d-c8da8fc0de1a@oss.qualcomm.com>
X-Cookie: Double!


--LeMdaFtY1wIgmB0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 01:35:09PM +0530, Jishnu Prakash wrote:
> On 9/15/2026 12:04 AM, Mark Brown wrote:
> > On Wed, Sep 09, 2026 at 02:34:21AM +0530, Kamal Wadhwa wrote:

> >> 3. If we can avoid turning the regulator off itself, so we may not nee=
d this delay
> >=20
> >> point 3 - We evaluated this for UFS - but the problem is that the issu=
e happens in
> >> the defer probe path, so if we avoid turning off the regulator, it lea=
ds to long
> >> error prints appearing for the regulator being left ON. So we couldn't=
 take that
> >> path.

> > I think Rob might be thinking here of something like the runtime PM
> > autosuspend delay where once the final reference is dropped we wait some
> > time before we actually implement the power off in hardware, thus a
> > quick power cycle would never actually get implemented.  That does sound
> > like a good idea if we've got issues with quick cycling, obviously the
> > actual delay would still be needed but if you've got quick bounces
> > happening routinely then a delay like that would allow you to avoid both
> > power off and ramp delays.

> I'm working with Kamal for upstreaming this series.

> If I understand you correctly, instead of the approach in this driver
> change (only setting the existing variable "off_on_delay"), you prefer
> having a sequence somewhat like this:

> 1. Regulator (if configured in DT for this new behaviour) gets disable
>    vote from its last enabled consumer
> 2. Delay timer is started
> 3. If regulator gets enable vote before timer expires (quick bounce),
>    clear timer and return without touching regulator HW
> 4. Else, disable regulator when timer expires

> Is this what you meant?

That's what I understand Rob's suggestion to be.  Like I say that would
still need any minimum off time enforcement.

>=20
> If the above sequence is right, where would you prefer it to be
> implemented, in the regulator core file or our regulator driver file?
>=20
> Thanks,
> Jishnu
>=20

--LeMdaFtY1wIgmB0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqhBcACgkQJNaLcl1U
h9Dg7Qf+Nu0Ohhyx39SLlpNPUCtloq/bocXVOAPu0oHRlGJcdbIIvKOT3suv9m7s
jDmVLB04vLD34rkO5oBZi+ZNWGYNuEnnMwONuAq1Hw7AmyZP1xch/mFk7cHvdNcD
qs3r+fvbLHq83wSCaGrd39ViSRiEv9jHjOiM4cP4GM6nlryJUv/aDUKWVwC24Wjv
Ug/EaGtvYAPD5TVptB1Az8ZyX13PDZluns6hGtPNZbGk8g9mUVrp5kvGzYfayzxY
P4llxftv/jA5XgbAPxAYRWBK2yvNhWEsadg0zwddAIzg/DNYkNb85a0ARxFgs4tN
m0xv4QhnrBf7ISm4Q17HPBGbdKzEmg==
=Klo0
-----END PGP SIGNATURE-----

--LeMdaFtY1wIgmB0+--
