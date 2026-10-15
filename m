Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A5556BA2;
	Thu, 15 Oct 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086651; cv=none; b=QbMwg1KfJK2Autr7vuF9pcscyOyHVsnF30VIFT39DaGf/xlKRmNrwKVnV1SFxIshA/A+r0sqeOoSC9laDTnhRKowT5heidPDIv35lNXwYnk5jNjvjrXoxw8vNizwQc0Y5/Pl7vTRCqnVXMYdSm3j0Ar5NxQ/eoaCEFvotefiCAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086651; c=relaxed/simple;
	bh=od6D35Z+cDqTugTOW66XHSDEU4C/ACzlXp5dQmFkbzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiupyyp1upAR8OMp5aDvLFwUmnUwvM9hAlrTDHon/O2xHfwD+i4k8qWC7pKQAQ7M3YtGVZNdfpl+JFQKEPFNAWKBdBqac8NES9llZ9ItHYMhedweEoj3yNgPoUpY7OwmRnmLiQTNIqKGHWAhQdZmIAwtmmTp6HiW5Z3dBPD/W7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRNrq6Al; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRNrq6Al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25671F000C4;
	Thu, 15 Oct 2026 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792086644;
	bh=YtJ9wtucwJXF3mMJtgnK/q136YJ2VxcqA/HQbP09yHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jRNrq6AlxG7S7lIyo7Bi+xByIhvqx5Ur8AgrEWe+CAkIeLTAwlUqyEP0Ela4bGtc/
	 r/jrE3ikj5OzAT6zlRSdL/WNTqFtWw3Qyv6jg76g+AqYclUOUMHtLUiapazM+m4UOk
	 ZjuPcxbc/BAPQRIjr3/sEGbzj6Ph2huY8yJ2/sPtNb8XrYrXn44NJoDZtx1a9LVMtV
	 E4zdSAkCgDN+KMuQhYU6Wx5HnQk/ZQNGehxdzw4ta8FhIqL7wQzo/DxAmcBsARtwGs
	 DJqSkLTEBbtzR6RcTNyNrUuExJulzjb9eKhbEvFjS8HaGwyg8Yxxpm5YBRWWYAHtMT
	 h45E0lAhzzH9w==
Date: Thu, 15 Oct 2026 18:50:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Val Packett <val@packett.cool>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] ASoC: codecs: aw88261: start the amplifier on unmute at
 trigger time
Message-ID: <bf823f3b-f064-4dd7-acfd-4136efd090de@sirena.org.uk>
References: <20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InSaLPQge8k87Ejv"
Content-Disposition: inline
In-Reply-To: <20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com>
X-Cookie: Tax and title extra.


--InSaLPQge8k87Ejv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 07:36:49PM +0300, Vladyslav Tymoshchuk wrote:

> The amplifier is started from the PRE_PMU event of its AIF widget, that
> is from DAPM in prepare. aw88261_dev_start() then waits up to 20 ms for
> the PLL to lock to the bit clock and powers the amplifier down again if
> it does not.
>=20
> Not every host runs the bit clock by then. The Qualcomm AudioReach
> backends only start their graph, and with it the I2S/TDM clocks, in
> trigger since commit b54a38af7138 ("ASoC: qcom: q6apm-lpass-dai: move
> graph start to trigger"). There every start fails with "start failure
> (-1)" and the speaker stays silent for the whole stream, as seen with
> six AW88261 on a TDM link of SM8750. The asynchronous start removed by
> commit caea99ac809d ("ASoC: codecs: aw88261: remove async start") only
> hid this when the trigger came soon enough.

OTOH some hosts presumably do have the clock running earlier and will
now get delays added in trigger which isn't ideal.  I'm not sure we have
good solutions here given that this is all system dependent.

> The trigger has to be nonatomic for the I2C accesses, which the
> Qualcomm DPCM links using this codec are.

Are we *sure* there are no other users out there?

--InSaLPQge8k87Ejv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrREm4ACgkQJNaLcl1U
h9AUigf/fq075WtWjYXHWepUgtsMQ+riHXSZrenWKYM/xRW3cSndug1ZbZRdJ02f
gpahaf0zkDr5/K0HRK5Yla8QbMbUnVN/bLapTpf6t9UcYDq1dL4A1niA8884Ozlc
9ti+hTWeNd6GPnMv33fv6m36I0JyrQa7rI30cr8btH3Iddzip4v0j/kZPHEuYBum
G+TeOmtTCA/JZgKKz12j6y4P/+ETGrakgaw17AvKaPEH4X7u4ySZLL9yoUebfe1c
b+IEnQQ4y30YloTGD1oQenA6Kn9Te9Zdgc/p/B2/keyIY6h5VvbhsDiUTFSG0WId
9k/3eYLDTC6+35/WAkkG6h7o23PuDw==
=0SnJ
-----END PGP SIGNATURE-----

--InSaLPQge8k87Ejv--
