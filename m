Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704B4503B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833806; cv=none; b=i6DVgTni9P31aR16voMdbqaLAZsx1kqMeCO29Jj//xGTLRMukjYvlBE/5Ako/Ii8seKYxiIfnK+FALx+YA6nHccztUAweMW6Hp6JFKiKcPhaqkra+py3txQ5fdX2HnyJ80S6KGV8K9TuAOh1GFVR7/Mntlbb/YYxClcmtXZdboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833806; c=relaxed/simple;
	bh=B3zdOqVmIxLHUNHyacumPu1KWZMrgXOPAscx40uJgy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew4dlFfDeVBu14M7gJP7odwJyL1IJ7RWMtGI83lLYvdJWnx5cQ4GxXMQc5yAKnZKWugkkj3SIsWgpYkqskVWMcO2cBU1zOxIpUYhufemsW3t4DUUONqSRVqo/Aw1hj03RwcC6hIOYEos5szk6AAbnVTwIF9uEjdg5nFRsO2Rbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYnvcx4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYnvcx4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4321F1F000E9;
	Thu, 27 Aug 2026 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833804;
	bh=B3zdOqVmIxLHUNHyacumPu1KWZMrgXOPAscx40uJgy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JYnvcx4lpC5rt0tODkszIRfP1q1k1oz945jyMgiKjOGzq4R1nOGGt+1Lb/UlzwdKC
	 vIVpEfluDNsxwWv7AyyTHfpSnt4D4oSjg8K2sADBRhiHh7wiBiLKhmUIxk9DGwitlj
	 ExhlNc2+dTqKeH9LrxLAR+udFLMru7dj4+ZLWhnhkTjH5orRpHvVcI8vZYKtQYBvIS
	 hfp60poiTMqWvnHxcs5thAtgVPx6gYexl4V51gOurYlmlmlPCIGBlDOyS13BsjThE3
	 l+K2h1nOY66feR6Y6baoS5M0wuKerXtuQ/h6xUPXewrfRqZVe0kB/acyZmpbCl2uu3
	 mknGl3E5w57hA==
Date: Thu, 27 Aug 2026 14:30:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Viktor =?utf-8?B?SsOkZ2Vyc2vDvHBwZXI=?= <viktor_jaegerskuepper@freenet.de>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	dri-devel@lists.freedesktop.org, airlied@gmail.com, broonie@kernel.org, daniels@collabora.com, 
	jani.nikula@linux.intel.com, miguel.ojeda.sandonis@gmail.com, pekka.paalanen@collabora.com, 
	simona@ffwll.ch, penguin-kernel@i-love.sakura.ne.jp, tytso@mit.edu, 
	ville.syrjala@linux.intel.com, linux-kernel@vger.kernel.org, 
	Leandro Ribeiro <leandro.ribeiro@collabora.com>, Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 1/1] drm: use drm_warn() in
 validate_blend_mode_for_alpha_formats()
Message-ID: <20260826-brave-nyala-of-elevation-d23aea@houat>
References: <20260731154232.37020-1-leandro.ribeiro@collabora.com>
 <20260731154232.37020-2-leandro.ribeiro@collabora.com>
 <CAPj87rPvh6cz1JmRjfev5VJWZHhZqwyPn_nA3x43q6_qVDf=Tw@mail.gmail.com>
 <29aca774-e502-4e5b-8ebf-7319bc8df77c@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ow3ueemvc4qjemei"
Content-Disposition: inline
In-Reply-To: <29aca774-e502-4e5b-8ebf-7319bc8df77c@freenet.de>


--ow3ueemvc4qjemei
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] drm: use drm_warn() in
 validate_blend_mode_for_alpha_formats()
MIME-Version: 1.0

On Thu, Aug 27, 2026 at 01:25:18PM +0200, Viktor J=E4gersk=FCpper wrote:
> On 8/14/26 15:42, Daniel Stone wrote:
> > Hi Leandro,
> >=20
> > On Fri, 31 Jul 2026 at 16:43, Leandro Ribeiro
> > <leandro.ribeiro@collabora.com> wrote:
> >> Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
> >> with alpha exposed") introduced a WARN() to let driver developers know
> >> that a previously valid behavior should now be changed.
> >>
> >> But WARN() should not be used for that, as it's a kernel warning report
> >> mechanism for conditions that are not expected to happen. It also
> >> produces a stack trace. Instead, a simple warning-level log message
> >> should have been used, as drivers were expected to trigger the
> >> condition.
> >>
> >> This is causing problems for fuzzers, as they may stop when encounteri=
ng
> >> a "BUG:" or "WARNING:" in the logs.
> >>
> >> Replace WARN() with drm_warn() in this function, avoiding these issues.
> >>
> >> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format=
 with alpha exposed")
> >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> >=20
> > Thanks, this is:
> > Reviewed-by: Daniel Stone <daniels@collabora.com>
> >=20
> > I'll fix up the newline when applying.
>=20
> Hi Maarten, Maxime and Thomas,
>=20
> can you cherry-pick this fix for drm-misc-fixes and send a pull-request
> to Dave and Simona before the end of this week? I think this should land
> in rc1 because people are already complaining about the warnings and it
> will take some time to fix all affected drivers. I'm not even sure if
> those fixes can land in mainline after rc1.
>=20
> If you don't have the time to do this or the other fixes in
> drm-misc-fixes are not yet ready for mainline, I will ask Linus to pick
> this fix directly.

This has been sent last week:
https://lore.kernel.org/dri-devel/20260820-fabulous-nimble-woodpecker-ffa69=
5@houat/

Maxime

--ow3ueemvc4qjemei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapAtyAAKCRAnX84Zoj2+
dtg4AX4ljZnSxKXFZVfAS4/mgs1gRfOlBlzU1a7n0S8hWV7p10ignjVCSnoMehCJ
LeScKdoBgNJDbnBtt26jZQs2opiLr0n2DHe1zBV+Y+MzYoF5s0nLcaPP7DP5mpJ8
OhAIOGWOSg==
=Ro9b
-----END PGP SIGNATURE-----

--ow3ueemvc4qjemei--
