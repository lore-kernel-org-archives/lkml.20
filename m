Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970624B7A59;
	Thu, 17 Sep 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665888; cv=none; b=Ghe2Kc20lKR3XauK7Uu7Vuq6xcyLc7KyQLjbr7agg0T1G/J3LROhzeTmFRtfAdHt5jInr9biu9R+5PsblDKWFl7TmPBqpOv8fPf5U2hMfo0uoW4pvK7Eb8yFle6qRgt9dc3OVhV6T3jopI7a3a5KXZri7BW7s6YiC2AooJsAjhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665888; c=relaxed/simple;
	bh=zRgIYmhOkBviTaCSKzEY+UrVKQFC3UxDAcI8cDm1mPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqYRQzUW4FiKKOUTMJ6wUr1Xu/awqv5fDOsPLuh7zM5rJRemhXIEvTxf6J9R7fHpRQr4PulylX2a1koXn2gOTR4FnsaEVekfPB3XSg/+Kk21OugJOK5usDv2jLYZXkSsYORzsnqb8YB97YpGmOZ/FtoNv+m8EzbIJtwO4rObabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzHAn+0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzHAn+0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2DD1F000FF;
	Thu, 17 Sep 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789665887;
	bh=2u418ZnQvyCs6abTY+VRjRserpcaiedptr9Av50Tv+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VzHAn+0Lc+DpmEVX9gnZVRLqzC79aR5sMu4yhuHy/qCyFw+3S6jumelFT4VwP/R1I
	 npAZqjNjl6PFl3Pi+dNzL50Atq3AUlj1DBtvLLh38BtOrNqMTDvfz6v//FpOcgswi8
	 hOzczzKUoGQaq2zIaNdZ6Vx46lgjNF5P2Xnb0KkIR/xQg6zdA11JuL03XkGFJ+dHcs
	 guzOt0fDIpiTwp9D2Up4YkqwqKIsCj4jmW5z9ETy3pTZK2DHQNOuPluRwmZGzjMbuj
	 OQgW9hCrZF/rhW/Qm3IZSOtUeBJ4zgJFKSFqObhcCmZmT/SIkUV/Ith/FkxCcaZxXh
	 +RSo9ec/bbdSQ==
Date: Thu, 17 Sep 2026 18:24:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
Message-ID: <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
References: <20260916220453.260472-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XCQXD9fzcag7N+ET"
Content-Disposition: inline
In-Reply-To: <20260916220453.260472-1-rosenp@gmail.com>
X-Cookie: Whip it, whip it good!


--XCQXD9fzcag7N+ET
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 03:04:53PM -0700, Rosen Penev wrote:
> The MPC5200 PSC AC97 driver only applies to the MPC52xx family of
> SoCs, but only depended on PPC_BESTCOMM. Restrict the driver to
> MPC52xx platforms so it is not offered (and does not fail to build)
> on other bestcomm-based machines.

>  config SND_SOC_MPC5200_AC97
>  	tristate "Freescale MPC5200 PSC in AC97 mode driver"
> -	depends on PPC_BESTCOMM
> +	depends on PPC_BESTCOMM && PPC_MPC52xx

The DMA controller has:

config PPC_BESTCOMM
        tristate "Bestcomm DMA engine support"
        depends on PPC_MPC52xx

so there's something else going on here I think.

--XCQXD9fzcag7N+ET
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsIloACgkQJNaLcl1U
h9BY7Qf/fkaOJRIVi6MAE9WTDDLwXDPRj407RDD96L+pgal2bNPZUhtDx4K48BEE
y9VsKZ+E90iZ5WYlOFxFwrZCx9idaHZKSJaVEGOXcmU65/Lal8+KvOoRLAAMqfvg
jAEhWWIKQXKcTVQXuRfzXIFPwYJoCZZAqlFL9XSjmiSUz0tUxQoJSb36zsJflq4j
avBcP0ppyp6GNwHtrIrFcTKg8G/l9SVRfYjz501pu0mnARuh09HHrDDZYmbttSzj
VvOdGxGxUFFUeLzwNq3HDFXKOj99+sK9yknuJUOUL38cj+q52QwZ2E/cYzl02K0K
L4L7FdJEykhT6N+glPmRkqt1vbi4Lw==
=E2tf
-----END PGP SIGNATURE-----

--XCQXD9fzcag7N+ET--
