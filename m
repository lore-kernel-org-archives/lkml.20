Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A7327C0D;
	Mon, 31 Aug 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181805; cv=none; b=fAIQw2Z2yyRsDgsy93T7ufvIgOVAW5qGwhm4Nvs2If6xjHq4ZjAZ1VaTFz8ImqdmXSmXEgNUIg9sbFtnpV+YuLlbo7QxR7/pKhzDBnD+XG20wjSWcb3h+taNAn9oaeX183oiFu1n8E5HwuqX2sytXOTlDyJTt/o14637iMCpLRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181805; c=relaxed/simple;
	bh=U/VHJccNazufAxgVcKXLYc+RohDwuETiaV6QlBPtNh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puftFDCnbpVBdoif37SHAShdujDLRP2D6JWNTF5CkqPQ3RCUIYs8m9CldTeJ9hAUN841tHJewTNuoZjmwWgYEenF0QyY1keDyOulg/lfzQfvo6olCgaajtCatAzZC3ceJLouCij5TS7aCohmgqcqjUxo7O2mRD/ecjxyx7jfMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2hfMYZ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2hfMYZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9CC1F00A3D;
	Mon, 31 Aug 2026 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181804;
	bh=8Ybp1j6OOO4hxTMCM3CGclQWPd+cXz1YeEyQiy0NjJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2hfMYZ3FUNHytTp46GLYZtjIcrMUqrtstFlIpiKKWsKZPCDqGRJdsFhz0yEf44lY
	 JKf/+DVg1pw4oqHlwTF3KdqgTWmrZ8M8IVHjg1WdFsXdanEBgx2InYYvgZncf++ioI
	 uPHzkSp3Lp5ciFRPE+qA3tVMwzjh7+DIz+XPiWKLM9uJzjPCyMoiKKgXgMXo0VVWjo
	 KfRcUDWDxxoFSi1MgMTJMXg1kmIGjYxlvipEKsN9eQMrh2XzYRZ8J33ej6/j19YwFe
	 b0DEELxA0sAIBw4hGPhSx3FcFSiKXrYkpMh9WD7HONo8v4kXhr3NlgIf2hzslcgHZQ
	 CVzlA/uM4ne3A==
Date: Mon, 31 Aug 2026 14:10:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Fix pm_runtime imbalance if suspending
 before first attach
Message-ID: <1542cfb8-d2fe-4ecf-b26b-cbb5ccbf41ea@sirena.org.uk>
References: <20260831094506.57467-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A02ynfTNKpAKYCUT"
Content-Disposition: inline
In-Reply-To: <20260831094506.57467-1-rf@opensource.cirrus.com>
X-Cookie: Sell by date stamped on bottom.


--A02ynfTNKpAKYCUT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:45:06AM +0100, Richard Fitzgerald wrote:
> Remove the check for init_done in cs35l56_sdw_system_suspend(). Instead,
> protect the call to cs35l56_mask_soundwire_interrupts() to only be done
> if the amp is currently enumerated.

> @@ -386,11 +386,8 @@ static int __maybe_unused cs35l56_sdw_system_suspend=
(struct device *dev)
>  {
>  	struct cs35l56_private *cs35l56 =3D dev_get_drvdata(dev);
> =20
> -	if (!cs35l56->base.init_done)
> -		return 0;
> -
> -	/* runtime_resume unmasks the interrupt */
> -	cs35l56_mask_soundwire_interrupts(cs35l56);
> +	if (cs35l56->sdw_attached)
> +		cs35l56_mask_soundwire_interrupts(cs35l56);

There's a thin race here on init - we call cs35l56_sdw_init() and unmask
the interrupts prior to setting sdw_attached.

--A02ynfTNKpAKYCUT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVfScACgkQJNaLcl1U
h9AgIQf9HBM60j/EmrzWMghgYqvkXpYCWHsmSh1iHpPyqSOhD4Y0RwVDICKploxo
TbvSnqRF7XnCxn4xrmJRXC5HSJBF9Wjevlrbsy8yHMPfxkb5tUoFSJ9wz+5Fbo4a
FTonTNi3DLGfH+D9UpdpZ648/eyeaQe5MCtzOv9UIKCQpERESEiBnNBbpbFQlIPf
1QBQgimYiIxzoy1XiY2D3i/ROO+EIn1BAtB9SQAdMTR9nWIfYwReogYy4AeEyF4z
C2K7wZXi5XFMBHw4qIYuCCgCiDPUd/LkGCZlYx2RkIUfIhlqulJCCWl5JuRFisgq
lPLBoZ+xVjM+hTZHgPw9cyEjpBbnIg==
=CHP4
-----END PGP SIGNATURE-----

--A02ynfTNKpAKYCUT--
