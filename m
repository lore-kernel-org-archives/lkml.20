Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6994A5C55;
	Fri, 25 Sep 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353675; cv=none; b=kBP6uXwvL4u3W32IhTMpDJ3d1oovNSbAry5WDcEO0/x+LBVZwLyY23JlIfkRxKouVQW4aVo2/OPnynccmwwXmKyfxhyNgCnUCeZ3Z/cEvG/7/K5NaN6DAdfLaAJJQL9SMx8rmPpT/FnDTzbFoVWn5cNXKdIhJdACQJs67vkLCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353675; c=relaxed/simple;
	bh=XLOrSjop6uWRxuJiz9XlFYNqV/APlTG5JH/U1RDvGyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wzs13BHH8mB4C+n2A89i2tby3JlD20ZvivHpvZc5QQ433fDlDLnBgO/QPE9bTUZCQe+Tl2Wr4KXUwMZzUzxAsPoR2i7cBMUOcQRxpEFt56Oq8uDPtqedAS0p5qAQhj7kbnEphCiWwhId43JUXhM+SxedJQ3m2EGnXn12FE2OcsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4W3X0BW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4W3X0BW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D692A1F00899;
	Fri, 25 Sep 2026 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353674;
	bh=XLOrSjop6uWRxuJiz9XlFYNqV/APlTG5JH/U1RDvGyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V4W3X0BWSe8T1M+pHbGBwUn4bk0oc2ovvURRqWY+/KWJCuVqF4jjqbYcwaGQUgZuF
	 KjdPiIPYmnH9R0oPn1p/mKY0wMH/jQYJ7RCy9I6NolVBSPv0sO63BNZM9nNMy9c1XS
	 PJ7DL2FHGrw6Ygh2aPskZipdCM+U5ReZGgabkLhE8Enr85cw0l2q4iTkovRxwkbiPs
	 Bph9jbtOg1rc1DO18M92KQyUaiQpZ3geWfXXu3XR7L3Kx7y21jy7igakqneC6sGb/1
	 4UrjSbaMe3LRxvgeZCtPJvkYy2J4tWr1MPm2mkeO4/6luNoB4nHRwH27JAjn3X893T
	 YuGSR9a+/oFYQ==
Date: Fri, 25 Sep 2026 17:27:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
Message-ID: <92582dd8-6a57-405a-9b54-fdeb7af38b1a@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
 <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
 <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com>
 <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
 <CALHNRZ_Ljg2ahetObZGE5aj7kM+zgA798kG1_hbC28KHweiYzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMzF5Fkst+dpv3/Q"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_Ljg2ahetObZGE5aj7kM+zgA798kG1_hbC28KHweiYzw@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--ZMzF5Fkst+dpv3/Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:16:18AM -0500, Aaron Kling wrote:
> On Fri, Sep 25, 2026 at 11:06=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > Does the audio sound fine - are there glitches at the start of the
> > stream?

> No glitches that I've noticed so far. Can't say I've done a crazy wide
> range of tests, but I've run through most of my normal use cases and
> haven't heard anything unexpected.

The change is probably fine then but explain this, ramps like that are
almost always workarounds.

--ZMzF5Fkst+dpv3/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2oQQACgkQJNaLcl1U
h9AU/Qf+PPIhB/ogTapYoGudx0dja/9CoVX9wVkzJmJIYs5YL/PLkhwD+7F0yLIW
ybqLqpkx791M/ELJL6wZ4OHEaLWFRG68A6x0ZffHSUHCpX1pNwsSP9oPZCucMQFb
ENtgioIE0dwXmThawiMp1/H33W30cdfYqBVUZWkwSzG53uuqxbYCzdYkYKIAXp4i
JK+XtagnUEPiXRBJI314td0I4nqMvdouoIEKRkkgzSK6rbTxI3lyb7LTe2JO10oF
HA9jcGa7u9C71yNMMcnTudF7TIEDcskTP+flD/MVLKUtKe+8NJ5zmFDnszXv1w6O
QweZHPA4SCBlRQR8Mfdm95E4Qn+WKg==
=uWXY
-----END PGP SIGNATURE-----

--ZMzF5Fkst+dpv3/Q--
