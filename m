Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960821;
	b=IRLrB1pxq+YEzKExRx117lb8vR42rbpabj0mDRGxS+if5S+1S2uxUy+e/1nJ1QbD8Okr
	 PgFPwY5rDmBcH7/F55oo24MPvfoKPv7+r8vRISuWoR+3AoKkvE2e73VfoCh7SuKnxIOVj
	 mvMuySGbyLNsZPsE4Xlv4e20ofhLJX1IEscvt/8lFPBt+LdeikJm8Lg25ng06wtuoGtFL
	 m51dRwY0Abn0CX4If/qZSGlSxv1mCH/lZowd4PTeXu08CWuokgCC3XKI+Z9tk/57SDYu/
	 NMwA2b7gk8temgexi5N/wW9PcxvZswBjDX7Rzv0V6YDKyFklLIyLngTVONoRiwdNoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960821;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=i42WgfRl7LGQCQH1OXiWlBOPWoM/ly087TnvtfgsA0s=;
	b=oXTxHSEGAyuEOPiXuFsUq1lGXtZhNkmcjyY/fuFG+pZBqTmvovc78grJ0T5JU0DLhKtW
	 nktSFalsQ4/cJTpjLmFnLFzarONOJriXviVG+Mta9IePY61jeguK//LoPSQML8cmQTK7d
	 LoBjPaZtHDAIf5YUlLFiRHyawY11JSAvbrUSzDE/X4c4zFwUMfFXfznOis88/LbMkU+Cv
	 QLy3n6/PFRAa7OJutBjzHFWCDKMG/7RFF4jqJI11avqp2lnoT372nD6B1abjMZ6eBy6bD
	 Y4kJG6Jz+WRFVsCCb6OdSYXLEMi4BO1zFvRESJ2ywtPkJrPOaPbYmG447BOtshRxO8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SW30ylxa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C2606A31A;
	Sun, 25 Oct 2026 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SW30ylxa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B8C1F01825;
	Sun, 25 Oct 2026 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960820;
	bh=i42WgfRl7LGQCQH1OXiWlBOPWoM/ly087TnvtfgsA0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SW30ylxaETwB0mx3jeEqzZFR1gehcgpJtBPhXEPjHkk4ktBSQa4xzy1a5wjaUQZrt
	 w0JOzi0/mBDR/FFbMliLtVbbbCI8b+eabQaBFKDF1DiP22abJaxRwXihJLCpzdp00T
	 eDN7dWvQ4F9S9cPGnW6blvURlWhGMps9KugvAyU7TaaIsPWSf/z4DOkbSvVqKMRVLK
	 RMGwG4Ch5QW9bmuQp9qm/baEPiVZs0qa7MaFFwmax1/E8MNXM/ZupXYRpyxgZFwtUv
	 +2MGx2gD8zTuX/Mczd4WtUwvPGkzxu3ucvHvog5bp6SoGwp92B3WVknGNaY2msPahX
	 9INkDongzNbJA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A127B1AC5994; Sun, 25 Oct 2026 20:40:16 +0000 (GMT)
Date: Sun, 25 Oct 2026 20:40:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: James Calligeros <jcalligeros99@gmail.com>, linux-sound@vger.kernel.org,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Sen Wang <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tas2770: Only treat negative return codes as
 errors set_tdm_idle
Message-ID: <at5pMAavzOl3loyg@sirena.co.uk>
References: <20261024-tas2770-idle-fix-v1-1-07b02d46ec2e@gmail.com>
 <33b90e9d-096f-4a85-8d17-2e43b0609140@web.de>
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
	protocol="application/pgp-signature"; boundary="IspwzvCNS3Gtk0AB"
Content-Disposition: inline
In-Reply-To: <33b90e9d-096f-4a85-8d17-2e43b0609140@web.de>
X-Cookie: FEELINGS are cascading over me!!!


--IspwzvCNS3Gtk0AB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 01:30:12PM +0200, Markus Elfring wrote:
> > snd_soc_component_update_bits returns 1 on a successful update, and
> > we were returning from tas2770_set_dai_tdm_idle early on any nonzero
> > return code. Change this so that only negative return codes are
> > treated as errors.
>=20
> https://elixir.bootlin.com/linux/v7.3/source/sound/soc/codecs/tas2770.c#L=
495-L567
>=20
> * How do you think about to refine the summary phrase another bit
>   like =E2=80=9CFix error detection in tas2770_set_dai_tdm_idle()=E2=80=
=9D?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--IspwzvCNS3Gtk0AB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat5pKQAKCRAv73Ows9A4
iSolAPsFI7cWLYgYUBUGYztbhbx/sXlcY8czW0t+b+QxPQb2SgD/f/DIFlcuRHXH
vjroocCyY0pnFdP0QehZHeM8YG3yEQY=
=QPV8
-----END PGP SIGNATURE-----

--IspwzvCNS3Gtk0AB--
