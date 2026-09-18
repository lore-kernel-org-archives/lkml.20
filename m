Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436A4E325A;
	Fri, 18 Sep 2026 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730604; cv=none; b=fXJ+ymIRD5eqbM5P+V1sNcGjoL2r2PDxU4wRhHS48uGODHZG/Ez2ibvUeV+jxgphhmgHiNpd/II79MCRQj4Fqwakptze96ItVLFkxW4GJlZDJFpd+cFl7IYMc0Sm+0FwbwecTwFDCl03ReqeHpVqeBsCbdcRELcFP62bLuTIdC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730604; c=relaxed/simple;
	bh=MBjXKEfWWr11hzur3gEGlv6RLUdxnjeB53fR+cF3SJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esuqatwtcvDUBVMeGXBO3tJRnbbpRoT0pzxrElcOrDYPPXTPXsY9MxvEVz6sP7wFlK+tpSM/aRhi6KNKpnlm0TQICwBm13fajdWlvKkBivtDP1hDF/yzETJw+HkRIPgB9GyK5LS7I+of+gk7xZRPxVytD5qzdEFNmtbOlH29mZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cViJnNIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cViJnNIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107EA1F000FF;
	Fri, 18 Sep 2026 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730597;
	bh=MBjXKEfWWr11hzur3gEGlv6RLUdxnjeB53fR+cF3SJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cViJnNIsDtmYAxQ5FDKaFAygCRWgk7RXqG30Kw6B64vzeEGZXWDRksorXI1WrCoz+
	 nXCHVMxZtdMdOc8NwUvXflcZ1/CQI80cUj4ZGKSTiDypMU50g2ZqSB0c78FoAMVp0I
	 zlvnuThJJQBxs7WJPQdhxP4FXYFNtFGSU726cfRZHAQT9QZoCpOdpVB6sYttHx9N8V
	 x0tDzmPUQZwJjgTyGZVXOcvasgDna4oNsYiixkrVkFkzFx0fb6VBg5wyY57VXIFhgH
	 wvTkxHrQSGZPhrMIvYLpJTVA0HVqYjumQoWgleScibBAwQOARx0ZauFlebUQfz5cKG
	 BFM9dSJ4Im/yQ==
Date: Fri, 18 Sep 2026 12:23:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
Message-ID: <2b497c5a-7f55-4f93-a6b3-ee07645d7467@sirena.org.uk>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-4-karl@asseily.com>
 <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
 <CA+gvwbrep8j5R5c2o+oMAK9NF=K7EcXFswNCfaVnmfnsBd4v9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eGMNy7Tl9AIoiErQ"
Content-Disposition: inline
In-Reply-To: <CA+gvwbrep8j5R5c2o+oMAK9NF=K7EcXFswNCfaVnmfnsBd4v9A@mail.gmail.com>
X-Cookie: Dental health is next to mental health.


--eGMNy7Tl9AIoiErQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 01:59:43PM +0300, Karl Asseily wrote:

> I will hold v4 until your review is finished rather than resending
> piecemeal.

I think that was pretty much it from the pass I did.

--eGMNy7Tl9AIoiErQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtHx8ACgkQJNaLcl1U
h9BMAQgAhNjPmuRSdwaEAsNU1pHd+lrGhyCcpnfvBu3rBxdxJ4gZZ4kFH4ldpJ1b
f4boZ2YG38DWcvGgk0tlAB94ky+NCcOgqfGvNYUa7TYyFg68dqbw13fcnul9erRx
UGw+dX+ovdjOr3uV1jp45Nn10I5tWoRjYWgmHpVPOO1B25ceQOvoWEH2AT0Ncgh5
+ixzm0jynwH0HrdYSiL5yDFfUTiZO+2S/06JwHxj1zXRCZ0U+eSK+B72Y81ZIqv7
ufBe/9H9Z8s87xV0fFdh9Ak/zaf0xrfRsrjCV8khLebQHzw4B/mdvbJrOBRcB3At
qy6YhVAG+YtXZM4RmSngXm3o3SW+7Q==
=IjHD
-----END PGP SIGNATURE-----

--eGMNy7Tl9AIoiErQ--
