Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4674A1E0B;
	Fri, 25 Sep 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352398; cv=none; b=PVK1bzEDtV9ZdOHLN0qTbLQ3edwuQN8MjP/ds+7xRN3xALLUgYpBZs+yHlXmbEDqJIzhlfsMDD9tKoltU6m7zppSghLaDWa5lquzBGL0U5aMhWoJLM+cNvHcGhIkVUGHJvyG7Jt4Ou7wqmxxH4e2/kYtzb9z6isCBuk66Ugw4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352398; c=relaxed/simple;
	bh=RV0Bk34/1DGj2MaHfM0LH8WCheclNf4cWZzAEX/eUsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL4AIXiL8NnDVK7o6wJwPAs4BRi+gU8LnUZ2D4qRN52EMXSvHiOrlBsu/eeHLar7T14aZpaU6xOrJltXhTLJEOgvMWUAoqSvwoQmy6/P0FQ+m9cUpcMqoFlpK6hKl5M7Gebh9ezLZ7qDc0Pu9J2UxCKPDuccYFKGxErrRomUEog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi8QaKGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi8QaKGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788261F000FF;
	Fri, 25 Sep 2026 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352396;
	bh=RV0Bk34/1DGj2MaHfM0LH8WCheclNf4cWZzAEX/eUsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oi8QaKGMEn3rJLXlCC+/C2psiS+9n5CGDQW0sEZMRaD81YBF536UDonxxZCGKrfsB
	 CULe+HurYsk9Y9b1PcXnRGO1oCCntVsFzBbs0+MNqCZCMWNq1oax9LjoyGuEwpDhlQ
	 KxVywUUWRYDgk5wzHY+zUO1DufqyWeXompsCCWedeue+27nJmAeC54YXIFRRP4Z+S/
	 DYU0D2YbPR8+sm/gLZp8DCj139xAd85RT2jPF+HMKb9nzGeurKSeDMGXgYOXZv0kdg
	 9AJnarS+5qV8n4OyNSUO2axi5vrUde32lgqt0VxVzxiTzBazLoW8Hndt8VxcP5hMNT
	 Jh5DGBHVNUh7w==
Date: Fri, 25 Sep 2026 17:06:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
Message-ID: <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
 <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
 <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nXlm1NFUouujJrdF"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--nXlm1NFUouujJrdF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:44:46AM -0500, Aaron Kling wrote:
> On Fri, Sep 25, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > Again, are you sure this isn't a workaround for terrible hardware?

> It's possible, I suppose. But this is copied from the already accepted
> aw88261 series. And it has real effects on my devices. On an AYN Thor
> without these changes, if I start a video, it will play for 1-2
> seconds without audio, then I'll start hearing audio. With this
> change, audio and video start at the same time.

Does the audio sound fine - are there glitches at the start of the
stream?

--nXlm1NFUouujJrdF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2nAcACgkQJNaLcl1U
h9BpWAf/fdYkhjhUsGmm0yfCK8DVEOSpSgPglQ3PSiInXzMOa2Gct/MC+HkPZtP2
HP5dAIM968SYEgyxoT5ab/wzeuhYLJKm5w3t1pgvODc9QNA+oRWEeK73OMg+nCfH
5muZqYTfI25EXOxpNYxEgiik0G9a035uXmE/3wB7CCafoBQt/5doLCopE1dShIPV
IKJTuc1dz3YosPUFgrYqpAvAMud3zqL4lcoZvFWqzCKX/9dPxjP7yf8O7KXskFp9
34wZj6z+Gra+6JoQDnPUjkgpOo/QjhMdThOYszvA3d+Iuy2MZkaiNQQ4EZhGxwpN
8vsIlxl8INMKGokdKkxnOi0tvuTC5Q==
=e7Aw
-----END PGP SIGNATURE-----

--nXlm1NFUouujJrdF--
