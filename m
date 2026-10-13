Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BB3B7B68
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884856; cv=none; b=dvrgIOfn5pWBHI2wqPBxC8JdBxInen5w3WdmdmYNbb7nIZJWcmCdsLU70uEzaxdDuG/DiWee3i8hSzLp3s5P55aEKOAAIHq+oLo1gfklteDCLO0RKYeSZU6UmtZ9UpmZEnaU4dwDbLuAvhRcpMlqzHIOq6JGtl/jt+++8Nt+/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884856; c=relaxed/simple;
	bh=2R4mHyXuGdBOFu9lYXxvIKp3/FCnxVHnd7qOef9FYHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9HbzyAiXZ07DFBuuKsQYTQnkXART0Qu2rUtrsMAupGWb0P5MRZBAULaGs38JUX1qTmldgdWAgbOJlCj43rSoOuKUFLQp1dRnj4qBOTA4bBLw5ZZgeY7r0N8EZ1Cj8UhadJh23u67RiB2QDxqngMDqNax5tAv5vVERbzgv7RoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFfy4fhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFfy4fhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8866B1F000FF;
	Tue, 13 Oct 2026 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884855;
	bh=2R4mHyXuGdBOFu9lYXxvIKp3/FCnxVHnd7qOef9FYHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PFfy4fhOWb0g5ugH6yiiUGD1Z8G/ZsS54+aKKJDXfSv6y92odF5fY+l8Boh4TXdFU
	 yuhpx+VpeY83o9n/8/FOXNrMjeJfupoZrTtOmDQIrcV2JKDcUWCY1wBeYkPuSB+tEH
	 J2IHXQpMLEBddvPlrq3rXcCkrNDw2RbwKpBbc/k+WaWFxcQVpeeaa3Phtx5wmxXIyd
	 exoGJmLuCW5WTKBZggZKnWItiWNb42qIqZtR/GON2S64CmKa/T1K/wSBiTmLlcMIme
	 UssQgdTWucl9HnRkdn1jqPkQQjR7ond6oXf6l9m/FRpzZ95ToCHTIViqUhUk6nO9Zb
	 rpOJEh0mZdx8g==
Date: Tue, 13 Oct 2026 11:47:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Erik Faye-Lund <erik.faye-lund@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karunika Choo <karunika.choo@arm.com>, Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] odrm/panthor: fix immortalis condition
Message-ID: <as3-CKkuP54UMDKe@houat>
References: <20261013093150.4186117-1-erik.faye-lund@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ccqodx733gg6sx23"
Content-Disposition: inline
In-Reply-To: <20261013093150.4186117-1-erik.faye-lund@arm.com>


--ccqodx733gg6sx23
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] odrm/panthor: fix immortalis condition
MIME-Version: 1.0

Hi,

There's a typo in the patch title (odrm vs drm)

On Tue, Oct 13, 2026 at 11:31:50AM +0200, Erik Faye-Lund wrote:
> Exactly 10 cores is also valid for an Immortalis configuration,
> according to the public documentation:
>=20
> https://support.arm.com/compute-ip/immortalis-g715
>=20
> So let's report this G715 with 10 cores as Immortalis as well, as long
> as it supports the ray-intersection feature. This matches what we do for
> more recent GPUs as well.
>=20
> Fixes: 3b1dc21d6d80 ("drm/panthor: Add support for Mali-Gx15 family of GP=
Us")

And you're missing your SoB

Maxime

--ccqodx733gg6sx23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCas3+KQAKCRAnX84Zoj2+
diiaAYDtVd6e9fmMvaDNOQzVc8TLZMSt64qS35o2m1q5YEZq8xeTJgySrnH4tIZd
9vZHybwBfR41HAgDxMI1+EXEbepalMhJBFXBe7KwTuCSna6MUon7n0+tJnqmvNtK
y9qFuBuW9g==
=PEfv
-----END PGP SIGNATURE-----

--ccqodx733gg6sx23--
