Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A013B6BFE;
	Fri, 25 Sep 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355815; cv=none; b=EHzL4xNgi8fX2thEEUWWWHWoX6uYaH0HNYFYvsZyDynNN4IbycmESDspWJs45a8148gjlxsu2FvSXSi8m0VpnotJL1bqGePbOoZjRBNee/T2wo4bMp1VkQP3KSFkVZa1rWUa9HE1E+Eg+D/OUybtWH8nkpYDhzHn8o3nuzzTuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355815; c=relaxed/simple;
	bh=+VoChUhWASgbxuskZzPdbpSeGQfe1He+pZuToTkeR9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlBMF1tCbfZqBWF7ljdKwgHN7Ed7ljjK/cF8fZJLHXQBJx2tN/sId+erDApiABM3YeLHZ3ZX1LX7fp+52yN1f1E/J0S0KnuuiURkbfbZcXYilDiAGpJSB0KcPniCujFAfaddO/MHzJNIV9hTVi1j3FnKPTmTkaX3Bg9XdNUmlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSYzEVtw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSYzEVtw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9CF1F000FF;
	Fri, 25 Sep 2026 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355809;
	bh=Wn6Y6cSUdLvpo1EPooCk54mfkZUlgcXDZxuV9DQNq7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YSYzEVtw7+SjOr4/uI2NDDPAu/9rmx+Jo3fPCc9YOhs93GEQi3ZF+w4WtWffeQdeQ
	 a8FqdkwF1UmW4FwZV/glQ5NmFYsJudEnpscWY141Y9h9EKy7YasKwlgHAZLHJvxDao
	 TBNQGqefC5EHZwI6tQUq8exjEZjIghM9btx89KP+JRLJgRq9cRjrlOEIxCiEzQcU8C
	 nEJYNrTnuJEIHqgaboYsbjg0tjq/d4+HUPmFDEo5LNG9ZGAWO+3oDvum0DX8xtm4OE
	 bJKoPVXA24kDdRAULL37mkl3TiIyDl4ujOddVpfJkX06n30FKB4/LMb308Uc5xTpms
	 mPzTNFcKtSW7g==
Date: Fri, 25 Sep 2026 18:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
 <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GxpsZ276BoiWneJS"
Content-Disposition: inline
In-Reply-To: <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--GxpsZ276BoiWneJS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 01:01:15PM -0400, Alex Deucher wrote:
> On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > I'm still seeing at least:

> Does this patch fix it?
> https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1

It seems everything built fine today, I'll try dropping the workaround
commits for Monday.  The drm and drm-misc trees are still failing due to
the original issue.  Thanks for getting things sorted.

--GxpsZ276BoiWneJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2qVgACgkQJNaLcl1U
h9Aa+AgAhHmM8xTge2kD5uwbL6bDW0YNx686WZcCIl9gaLuRhbI9qjUGNN0xuMTr
PwhEuasQLDFKAObcrOSB0/FPaHo2b7ftMUU4T/kJSf6aTBEdrjiQ5WjNfjrWHEfx
PmMgQuSQd8j6XaPfx208fmwCoJqHkZpA8kiuzY6WyhsV0g+yMCx4xmtyRyQCZXbf
kxaPBrGh2JktPuwkfKf7jtIgKA0PgLoP5bV+nudprdddKuocUeVG/x5FLJh9A9RH
SOAuDI9oinPUu7psXTbVrlLZGT5lXb5ScB82n9uw57YV3R5BEw9bs+jZeMPgxOOc
Sg8JLBV08DhzBzXIRbxfMCnkVGE1hg==
=dX1B
-----END PGP SIGNATURE-----

--GxpsZ276BoiWneJS--
