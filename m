Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432549B21F;
	Fri, 25 Sep 2026 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353626; cv=none; b=uCa1zSfE+Rd08wWK6X41jpxVVg1FhviXmK5ObMqnzkvt4DnfnI4Sg/P0RToOo9wiAYnOUAPpHghJQsJyvAngiDr7iEiKSgeacU/nyX8PXiA3WjPlHnrzwjP6qOBWL1gQ7ElxMlzM47Iw6or4ZPbOmy4Z9ovii0/LDPYzx78xUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353626; c=relaxed/simple;
	bh=hjUWQ6xwumS2LVP6fAvgstFoEviYCEn5V/c4NaPulWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDMuuyvhrHw/RDKsCU178ScIyNWQ5LjmuL6pTfbYfh9WQDqe2FuBkVSwq76Uopgg+2l11pcy6RJ0igroH8R8jt8nyTRZbU83spG4GrEB+8xlSLmWW7GiTstJcNoyWW2LhSV5bNZ+Tdpq3+WAxZg2XS/ZXH20iCwRcwjMqO+dSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPWXbDQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPWXbDQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F481F000FF;
	Fri, 25 Sep 2026 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353625;
	bh=swrCMgFetqWTONiUrY+1EojwgYniOZ0M9dGmPKPM9NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UPWXbDQsxqC0F+ApgRoKs0al+UjteDCN7I7MS2W2b1LjkZulcOsGdG1AFMgaacdwN
	 5qPXepho/V+3Pnfl1w+MhXJtTBPQD7L0RNkFJy2n7cEyXpS+8Vk59ubje9uoS7L3QO
	 pTE2p7LjXvwBqy3a0+rPzR1WyNpNB0Ct2zKpeGW77uP6pRqydPcpekyA5M8Gx3Xx6W
	 kzhm2QmTCqZyHWIQEbDUIO1QPv6fOHBJLkv5PjuI3IDJ4qVHsVVwR3J4XCBQXVtl2K
	 mrDtoXBql+boclYS4sNfnWtTMSNd3K/4oMA1lH3N6s2xgVK4vL0CyePZEgFX2RxGxJ
	 DpKfXscnV9FFQ==
Date: Fri, 25 Sep 2026 17:27:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 4/6] ASoC: codecs: aw88166: remove fade in/out on
 start/stop
Message-ID: <127bf2a0-989e-48e6-bbe9-88a87ca66d1a@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com>
 <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
 <CALHNRZ97Uije_nbzZp7kba88di=dXrRr6_1S62SXMyUBgP0gcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkata4SOAgk1B97i"
Content-Disposition: inline
In-Reply-To: <CALHNRZ97Uije_nbzZp7kba88di=dXrRr6_1S62SXMyUBgP0gcQ@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--xkata4SOAgk1B97i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:59:24AM -0500, Aaron Kling wrote:
> On Fri, Sep 25, 2026 at 9:11=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > Are you sure?  Some devices have really bad pop/click performance and
> > need ramps to mask the effects, we've got other drivers with soft ramps
> > in them.

> Ditto replies on the other changes. This was accepted for aw88261, is
> there anything specific to this driver that doesn't apply there? I
> have not experienced any such noise on the AYN and Retroid Pocket
> devices that use this amp since making these changes.

Perhaps as Cezary sugested the changelogs on the aw88261 were better and
didn't set off alarm bells in the same way.  I don't know anything in
particular about either of these devices, the drivers aren't the best
but sometimes hardware is also bad. =20

--xkata4SOAgk1B97i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2oNMACgkQJNaLcl1U
h9Cf2wf9ExTC/MVPpk7t7KoEqqZpuAh2DR+nYWYx3b2Y05ddy7JZTCIwqRAMHQY7
a33HupRI6GV9vVFZTEG+UAmZSCEsIjJ4rA70IBQIoJ0YSCkQ6++JKnZZ8+AkU20i
tfWXwqH0JSyZg4Hh8rk9x/4RszXm+kgTL8CjfZbSSPJRjXF4l8i9LLXxzykPcZfo
3yrkGC1zkjsMhIxCT33ubn0iLi6VRglhU9OmyFHOmnyqQDTPzthzU5sa1koLZtqt
hk1OkYUe0FOe40iqiMaKrklSRc/XXX9T0i2ZsiBzJm0EFWEZmNQhbNNEXyB63hZP
XkQZPtko7Tj4zbfwFP4JGBBwVBDf7Q==
=R0nH
-----END PGP SIGNATURE-----

--xkata4SOAgk1B97i--
