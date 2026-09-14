Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D63D9DB1;
	Mon, 14 Sep 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386076; cv=none; b=KFdejeD2lhITyIvum78BSReo1gbgIFhABrzya80WG5+/IlHeH4szgoFYpI5C4MVhQnrew/2MjZUF6NuzsAscVEtDNXeMriZC4LfPloY2aYVxdRskgLqJrOPne+GVHhjxBrmS1rdadACl8kopLcoCccHq1054jWBrcBfBRXHIRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386076; c=relaxed/simple;
	bh=N145TGlKEEjodeJSTgl4qasxJaC7IdzFTs3A7Dm9l7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtA57no1Oln36j8uKDqSp/te09I7ps+1KIFMgStdmv4JTLw0i8Mkvn/JnhsdB1ca5MmXcHEkihqT9G+Z8UcGmzlsVQB/eh2t3vnfzHifK6y2BMj7vr6Mmezk6kb53Tx60rvBAdE8pBKFmnU2Fk5W/y+Zc8+7jq4Vl+QTGnzrs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT2oPx08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT2oPx08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07DD1F000FF;
	Mon, 14 Sep 2026 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386075;
	bh=ZA0r8T8gYPa/w+HOZLvcmuU/WRlSIh2G+lTU2hJymnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GT2oPx08Fmom+xQ90hhPNer6CWBRbPHnUsCe/qP7/2kg/AWuDvGPA2MC87aalTOcE
	 IHHaWsUl3JF5ZRrD0TEZXDwUVvehmr2/GZkSq1PsiUxHQkFkdpjE2NGHJ4gMHaMgJC
	 t+8zEA05w9aYRBXgrpg/MhNtcX+m+UpPs5SnouY9qgOqCQO/8NinRZ6aGwqXaAkXcR
	 PBIk//ZIMemNYGaPTec86Nl043cD6sNca8GQmIfAEish8VHi13v54HNkhBLpYuN5PE
	 RzlwjTzzZ2aCi6Z6syHOVENKLew07zK36jIpJAu8F7mnbwbtAth9evgCBwelNhbKIR
	 ruK0YsbytgnwA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3E7491AC52F1; Mon, 14 Sep 2026 12:41:12 +0100 (BST)
Date: Mon, 14 Sep 2026 12:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: soc-core: use the device tree card name as
 long_name
Message-ID: <aqfdWOx4tf9LmDwu@sirena.co.uk>
References: <20260506041112.412871-2-val@packett.cool>
 <aqfT4ZzmxtxM2Dn0@quark2.heme.sigxcpu.org>
 <aqfYM0svh1mDZtqj@sirena.co.uk>
 <aqfbwDUegHcx-kDn@quark2.heme.sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73ocKzEMsqMqvlAV"
Content-Disposition: inline
In-Reply-To: <aqfbwDUegHcx-kDn@quark2.heme.sigxcpu.org>
X-Cookie: My vaseline is RUNNING...


--73ocKzEMsqMqvlAV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 01:34:24PM +0200, Guido G=FCnther wrote:
> On Mon, Sep 14, 2026 at 12:19:15PM +0100, Mark Brown wrote:

> > opposite choice.  Any decision here should be policy based in userspace
> > based on the full system information.

> Thanks for the hint. So that would mean we should do something similar
> to what Lenovo does in UCM (that Val pointed to)?

> https://github.com/alsa-project/alsa-ucm-conf/blob/980fb83651e82c3e53d3a0=
ab7fa9b7d6fc2d809b/ucm2/Qualcomm/x1e80100/x1e80100.conf

That looks plausibe, or possibly some more generic thing that teaches
UCM about when to use DMI.

> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so=
=20
> > on so unless there is some reason for urgency (like critical bug fixes)
> > please allow at least a couple of weeks for review.  If there have been
> > review comments then people may be waiting for those to be addressed.

> The original mail was from May so I figured ~ half a year would be o.k.?
> Sorry I got that wrong.

Note the bit in the mail about resending if you think things have been
dropped.

--73ocKzEMsqMqvlAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn3VcACgkQJNaLcl1U
h9CRoQf+IUvFIYmA8LI8PptQ7NGqWfDZDexspfAZ9/R+jBFgLcGVD0fVfSzw5MRQ
o7hQSV4Ok93xQy//hUsjL+G7gD8Zr1BKY4ttWGAKgFo9Jl6++k/d+zSZDyx9eu8i
7AKFm39UstHTGlTiq51SdYp1OcyYL836aUJpc0lFboBFt6OE/gNhvIdeQMIPzkwt
WFZ8d1azYYUz2i5pKnjtSomcG0KONsldN7vJHWV8tmVqKZGKgMVsw9+Rj2ffFvQZ
uGHFVGJLnoQRXgXbSRovXrXzNmN9VZDAAAX9lBYg72yca7spdi7P0dIU02FxDLQf
ZFr3z5mWAJ8QToZbnQEF+YtNb9Qbbw==
=Qf6u
-----END PGP SIGNATURE-----

--73ocKzEMsqMqvlAV--
