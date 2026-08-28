Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AAC43FD32
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919241; cv=none; b=QIsIHzBhRKOSKLAkHwquERQbbD1gtSxI055HBkawmOfVIGYNXor5dQRYSRgWFX5OWk6XkQt/M8bjFGgivnVFpUKunUfRG+v5SjojZC9H6JAQTbA1jqPgJwjwi4VaTJmKgVHFIjSpRJsljXZz1ng9EUGhmI1Jf3JRzc26DOla64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919241; c=relaxed/simple;
	bh=a79GgcqgzEALArdL368yWg5WOG+k0mpsQzYwPJx/HXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsgZOcqMyJqY7L1gIH5HctJXeJgB4MroeykCgXZ7ZrW6ysjR1mo9q1Uezt/WvFHl67/sb6bTqlP/+z7RcW8zt6dBsbSPioWaBv9m9CMwEn3gYmDfsm1NBGzy6+e4VfobKl/ksGw6o6dKMIZsLvvz3HQFhJGSRbl1W0GFUEORPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iij3o8uG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iij3o8uG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C551F000E9;
	Fri, 28 Aug 2026 12:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787919227;
	bh=FNQXrGRdCNZIpEQod2U+xCpuBsWVaw5+Jya57sjTiZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iij3o8uGnQpHdcJkQtlKVyNZW38Z/8CidrfY1GZyW+yRla7dGIEFGiPlqegxqPmDl
	 xl5wZ9f5MB4QTMNseXUAs/SFpJsHljL7cHWDj7aF8wQfcdFBfNxy+UROykvyMdDl8k
	 2nGuGuSSWJ8bRPDarQLCNwFY3DUhpSaEiP2hfRoPMdNqlXjOWU4msQLYQ4c3THGnqz
	 62y+xxqrxjZ9mVO8sjB3Rnmbd6xryzgyJC/4cYGNQ94T0DUJ7yGrZERdTBrcZgpMvq
	 koMgtOZII/opiIV6SdGkgbvcrmwZzhjNWb0jk4pyW1miZeZVeOx1T1xeFa6eXIYsXL
	 hhl50xkJi6TwQ==
Date: Fri, 28 Aug 2026 13:13:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add optional vcc-supply support
Message-ID: <e4bf36d0-3f4e-465d-b4a2-626d5a5ca887@sirena.org.uk>
References: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RTcI+3CFc8Si+WOz"
Content-Disposition: inline
In-Reply-To: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
X-Cookie: Subject to change without notice.


--RTcI+3CFc8Si+WOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2026 at 09:59:43AM +0530, Shashank Maurya wrote:
> The Raspberry Pi Panel V2 regulator driver may rely on an external
> power rail being provided through the device tree. Add support for an
> optional "vcc" regulator and enable it during probe before accessing
> the panel controller.

Does the device work without power?  A name like "Vcc" makes it sound
like this is the main supply for the device...

> ---
>  drivers/regulator/rpi-panel-v2-regulator.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

There's no bindings update here.

--RTcI+3CFc8Si+WOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRe3YACgkQJNaLcl1U
h9C5uQf/VHHc09I8JNPfmvTPL3NOBS/ZZZM4J50myjo22JRMCUgNBODuT4QFwHce
CByOO9ogk9o+XC8WMXy2/vVtP5NsOeHVXV+gkJrEtp2BMNfbR7xwiCKi5qT7kz4w
0aUBRXcVHhAyByuh0FRdYISV+4crVXPh54J9JeOisxx+HzSj6JrRG7uhxw0kt8u6
iPNKKZS9p4vZpFoY8rcOr/pFJBPMAttJAZ1toxxk/Lw0b1gIMDEsPFfN5CHW8/n3
JHvUS8PiOBbE8vE2/3Gu6daD9E//arPwDtPjd7R4Nz/L47oPzgRFhfFJ1ukuIXHK
80b/DAJTpWHQhtO+IHi9ko0w1FHQWA==
=jsuR
-----END PGP SIGNATURE-----

--RTcI+3CFc8Si+WOz--
