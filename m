Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887660;
	b=WOePFn5dTCYeLed1fQq3GCaAt6rP7VfO/fzhcthtEtA7f6Jkw7fna3tzAMWXHNBCPD30
	 sPFariZ3m42ME8CStRCfx9DyuFcFoMjMFw7u4PoillBXZSexziqdlTUgS9YJfAuKowoWD
	 kaepEKtFWllnJH1fZ0Hz6pUBWsFuGfxpN0J8yPjZH7ltiqV5SgR+wrY84/emGsl4yQb//
	 eQBOt5UYWmHtxxMmU0VvyFfsqhdEf2Z8/4Zr18Zxw/TO5lLlScAw56Wxfu/Oo0bEZi84T
	 piNrzlV6jSA7ZbgSg1gOJ4ENvYQFkUCOYDFrqSIpWJamkdAKB4a9qotLe5fJy5QFlmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887660;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=SaeAqQfI2KAY38OvLqcKLanAVHw5PYzyGjgSbkUhC7E=;
	b=QdPHZAJbgFU35d2xUIr54AscEMNImrfSXMQk8UPUia8YjTqhXq1SMr7h+pfZGPhf1Tqw
	 QJCoK6NoXwEM7uO1PWdUEgqCRRJg9A+SrWnrHc+IsK1oxIB8SDTLJA1urTwS//7e16XW5
	 ZJ5u+aIoisJkVsvrmUA9VT/aA6EwGr6tCp3bj3g24ZjSaM5rO5lOYQi7Z+sI016p225Dc
	 wMlolcbRcy2uVoebk+TuRFpRVHutSPYfNaFw0DDmqlMG8cB/ljZncifv5ROhAsWkfDDNx
	 ZWkmi+E72+g/OGiBt9iqDKxkvAHeJ3ASTbU7amNdSrGE0ezfIQ7bN+3ZxK6uooXl3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ru8ZzJS2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D59606A31B;
	Thu,  5 Nov 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ru8ZzJS2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1F81F000C1;
	Thu,  5 Nov 2026 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887659;
	bh=SaeAqQfI2KAY38OvLqcKLanAVHw5PYzyGjgSbkUhC7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ru8ZzJS2U6Gz60vEbG0X2TnpHqRRuJJUfnYlCNRO9laJO3XG5u6NUNTJ3vsXdKrle
	 VhZk8OLiEOb/RvK+ZfWZNf2MjI9QHkUstX6bfUHIXDwAwS9kMrpV9PU3VM/Q8Ft2B2
	 +HQRX8ICj8ytzMWCFDE5blpwkk0VIFE6obClQgfJs+/hbBXQfetVds239Lq2lQs1eT
	 ZJJtQ4x4wE4blIyvNyGAPZxAOIXyTnOoOuSTE0R5Tm8p5F+HM2c4ZG+8jEMfAYEHkM
	 q/tcBWJZIw5FHUxGd8skVnaEHWZbZKjO1UfpfwGEHpqpMBac54NJohRS5PYLcEvQtw
	 yjH+2CmXL7SZw==
Date: Thu, 5 Nov 2026 14:07:34 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: amd: Load alternatively signed firmware with
 an "_l" suffix
Message-ID: <75156710-5ef8-4575-8f78-d65b9d752200@sirena.org.uk>
References: <20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com>
 <d98e6241-c3e1-4e18-a133-43fc7daefc2d@linux.intel.com>
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
	protocol="application/pgp-signature"; boundary="OrrbphR5k+C+gKCm"
Content-Disposition: inline
In-Reply-To: <d98e6241-c3e1-4e18-a133-43fc7daefc2d@linux.intel.com>
X-Cookie: Alex Haley was adopted!


--OrrbphR5k+C+gKCm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 04:03:32PM +0200, P=E9ter Ujfalusi wrote:
> On 04/11/2026 23:53, Mario Limonciello wrote:

> > +	ret =3D amd_smn_read(0, MP0_C2PMSG_63_REG, &val);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "failed to read PSP firmware signing type: %d\n",=
 ret);

> > +	/* all ones means the register isn't accessible */
> > +	if (val =3D=3D 0xffffffff)
> > +		return -EIO;

> this would also merit an error print?

amd_smn_read() will convert this to -ENODEV anyway so that won't be
reached.

--OrrbphR5k+C+gKCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrsjaYACgkQJNaLcl1U
h9B/Wwf8DOeULOzwLR7XrrLKPa+4s8Q0T4G5MvT+jjSXyYUY8HZ0otiiQsy5rKZC
W7u1I2ZiGiTpYGtFmDH+GuBhYvdG14MOGcD9eY434eldRADRM7U4YNkUrTM0AlSk
k4VquZNYYFN86Ye3O/srzqR4lUcEDaneTcramwDVZ7ETYDQIjgssysscdnMNIn1t
rHzrTKIPkI/hW2ANOe1s4YaOlqePRE9zKgflE89oIJlBqHeoZBR0i1hDa7eJbf1U
D1QkJr8B+Wkie7cFmjCA1IzXJMRYXnXAhCMoNi9CeWnBgKQWOJ8zxc0wF1R/Uxow
PggOmZwTnw1nY6xEtMCRfjzXtTx7Cw==
=YXMX
-----END PGP SIGNATURE-----

--OrrbphR5k+C+gKCm--
