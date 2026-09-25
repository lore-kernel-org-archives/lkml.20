Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F636B06A;
	Fri, 25 Sep 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345585; cv=none; b=XSxp0WJm2OJiV6E40jXlfEnUDwz8k8qkgKuOjbvRnCXf5xfk6zhwxsB80yqpKxlAw+cmkOi/jafwADJNv9IflMYyGdeMjDz24dlABtPCvOO8VP0NLIaEhKQIJn8lwHa+b9EmDHHLc+ifUkQpI3zLv72eGTMYc74ecZoKexZ7bFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345585; c=relaxed/simple;
	bh=UmpHNUBUXywvLeKTdXOG0Y5aTfv71tVSNAsSlVZjP0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRGWZoh3+jmYLvxmNjrUZmjeseiqkl7lffu9PxrnnHyta0HbS/2Ihpswy6/WfuAxpdp3chpne/AGJeHhPDSqbCYoH7tbQKMXvcWbgdmimyYkcE6E2dn96U9eNTycen48x9mWk+en5A/coxYLoG4GCYmD0Y7ULhBVJUhyCFcCPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRPXa2f4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRPXa2f4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039D91F000FF;
	Fri, 25 Sep 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345583;
	bh=UmpHNUBUXywvLeKTdXOG0Y5aTfv71tVSNAsSlVZjP0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRPXa2f4Q0umOwfcrNeIhxNrElEcdw3FSEfZqSezgZphmopKVJYFFvaVYb9h5zZvt
	 HA9MvW4K68tZwGcob+bie6/dPC5/6Cq+Y5UmSK0xf6teQPL6zZMfJGXWjcZ12Ny56k
	 6L7QjJLTcnbn3/azcxgSWYGy8cEfV4m6O/gtNo1OdDG5qleVuhOhiM/BvbPh5b7yKg
	 UZymP/0d6vsI9BXmAb33BJgD3RT6QaRw1+KxZbDmxWzyxpijQoI2t35qS3meFtbb7r
	 kwlQvblcFkBF8Irbu5YJJhzu/d/VnGhjrIy0cd7lNp2DQsQyXSRa4pa6WTA9TxS+V9
	 +1yUmX0tsGzuw==
Date: Fri, 25 Sep 2026 15:12:59 +0100
From: Mark Brown <broonie@kernel.org>
To: webgeek1234@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
Message-ID: <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uGjtmq8rr0KhSP6P"
Content-Disposition: inline
In-Reply-To: <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
X-Cookie: Love America -- or give it back.


--uGjtmq8rr0KhSP6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 02:47:33AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Codec drivers are not supposed to do anything like this. The result was
> that the first second or so of playback was essentially inaudible, and
> very short alert sounds could be missed entirely. Let's not do this.

Again, are you sure this isn't a workaround for terrible hardware?

--uGjtmq8rr0KhSP6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2gWoACgkQJNaLcl1U
h9A9CQf/X41Du9w2Ofpzf5n5Mky0L6DjuMDUBzu+Db00TBqusvxWlATKthIge2qI
412OZQZWc/s5yN6LWVZZ7NBtLmJKzbeSudAm5TpO8iCoQRq9Z7saefL9mI/myXR5
t7uS0Uze4UeRT9MCdNqapXgNvur2YC/kH8gLS0hlfgB98cCLRBfVojzmKt2DyRkV
9qFma2I4igKhTWvpSoyudd7P8XGOhEvV9P+xFAB+iUcMkS5lnBrG90oQkBajqjnB
pkIlzqFQVCRpbbdkrkSceYDS0dUBH1q3wylzSTss3PxDlbVtBAboEN5YpxBeMig4
xz6EU3fegPCIcSZvrymj2hb5NR82jw==
=v79A
-----END PGP SIGNATURE-----

--uGjtmq8rr0KhSP6P--
