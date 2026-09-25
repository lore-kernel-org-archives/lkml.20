Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5DC361973;
	Fri, 25 Sep 2026 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354006; cv=none; b=AjdcddhM7CeB6uczBWvw5Nw7c7sspl9q1ExT3P+OkVEIasWrB/h+mFznuu1oylcsTd6DBuGkIW7o2ronDUkysNjMPu8KWEHCB+XJmrAIcNU1xqrAZjMqBERijlhB2O+AUojQdtiJyNJxGZPae3tMkRwr8UKaZrprNAZHxBUr4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354006; c=relaxed/simple;
	bh=fiurEHaLNNWujxoqkJEcBYx4BN62Ji+LlZbCc68Y308=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tyn2ZnqxikrD87sarL4z2q2BCUmc+HhJOBn6gUYjAFfHE5+n0DpJYFjcHmHvK43fB6WbMZlmtC9L+Dcat2B/kCnyMuK08BO1LUGu9V2MIOTdRtPWrKxZgYQuNWsLmrTNv6do/5od0Y88VmmQyFIvWd7M4mCU/RSGwSeJDYeO75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANPXkmYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANPXkmYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BF01F000FF;
	Fri, 25 Sep 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354005;
	bh=fiurEHaLNNWujxoqkJEcBYx4BN62Ji+LlZbCc68Y308=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ANPXkmYhsbJgb6s5V8wO08sMBDm5idqBYb2ieOZhtltJcCJHxb8gfNRontmhaYaff
	 lesFvQs1SU6FEMmzZ5/smkP/OzV0ShOexQA2km9jgliuFYiqC7pWvtJ0SKo0XNT7GX
	 ABu4IicVNRX3FhtUKZu+FEILtqz/9hO0BFTgYB3qkQX5mcMmf3DP+HBQdPFrHz38Fu
	 gzYPgrA14rQUwRJ0DdDJa7SnaCDWInB95HmtK4VxkM1uXWmN6E0XNlnTJBwWujJqs7
	 HnamG9DLK3MnkAOHRj7HB6XT2OyCQ+AMj2o9bWi8ZACdBsf4MVqZKRMuQCr7BHBlqe
	 Yz77H1z7K9lYg==
Date: Fri, 25 Sep 2026 17:33:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
Message-ID: <374b699e-1100-4043-80d5-82be30d999cf@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com>
 <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
 <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com>
 <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
 <CALHNRZ_GTEsbAr6Byo_DtHG2VMqS+daJMM4=a+icbnu=h1Bj-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1zAzErtLOpgIpCZg"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_GTEsbAr6Byo_DtHG2VMqS+daJMM4=a+icbnu=h1Bj-w@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--1zAzErtLOpgIpCZg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:25:06AM -0500, Aaron Kling wrote:
> On Fri, Sep 25, 2026 at 11:18=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> > On Fri, Sep 25, 2026 at 11:05:42AM -0500, Aaron Kling wrote:

> > > controlled and I can just update the audio config I ship. But more
> > > standard Linux use cases that rely on a standardize control name would
> > > be stuck with a non-standard inverted control forever.

> > Why would renaming the control do that?

> I might be misunderstanding something, but I thought there were
> standardized names, like this "PCM Playback Volume" that tools and os
> handling expect and will use if found. Which would cause a second
> control with a different name to not get used. Is there something I'm
> missing to where a new control would get used without manual
> intervention?

There are standard names, but you should be able to find a new name in
the standard set (eg, adding an Analog or Digital) that's unimplemented.
At the very least they also wouldn't see the old name and therefore
would not get stuck with an inverted control.

--1zAzErtLOpgIpCZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2ok8ACgkQJNaLcl1U
h9BZiwf9EtlKE108l/ALrHqXZi2UWPa/fK+2D9Jc8v81pcGvBs1ffCqgX6j7oqD9
/gqPtJW+PCQcR5wgVlKqj/CD7YtoaVQMi7x0fvXrqY4i8Qf1fqMsuVP3lxBZeAmu
q0QyhcHvAk0w9Nl3Zq0qcFWg9xjFOgUxl4BkKI7pxhfQmmqwFV5MhjdyDBx/S9tQ
SNcuJMoJgGZM1DuugOmqhOtp4EosxhHZPSA9OPtknk+SU/KdeAJ/eQQ9ZDD6O7Qy
44mCeg+dIwICLvTjXGhpOl/6E53JLDfkHOu0b2206mHvbXmjU0d7UAYdzUdlIr+Z
t2eC3uV+mR01ucu8Ck6h6Z+tTn30rQ==
=MB0z
-----END PGP SIGNATURE-----

--1zAzErtLOpgIpCZg--
