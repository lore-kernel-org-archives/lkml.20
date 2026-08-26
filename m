Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20541D239
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751288; cv=none; b=OZfrWbA2Y1pRqJkiokRWAWBpAEQruLs3+g9Rh7v9ZQS19jOGCJDsInS3E0yNwle78SsFGRZweEwO4mk5K70Erg0+O0XD4nezhxVleQrsjAIP1eXHsGFN5uDPTkOSzeLEFxe0UcWAkjaugODzbRJnX3IDrt0JrbigTrS1jLSfU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751288; c=relaxed/simple;
	bh=Ni4UKv87N+rABDQdMXQ0FunrjmJM6L3MVhSfhavDYkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWhKNPp5G8cT4e7LzOt5/x9RVrybDS8/sz1hJ7nkyV+reoBpqlsomT2UTj3EAZ4gff3gCb2ri4X/SxCc/dxrCcuWq4eAaN2kCczD86CDsqGyZgUVZ4VAn+N8692LXSraG/2NvdHQjXFsHRwTWtXjnaiZsQb+VdT1hsZeyxPihyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RItWFqJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RItWFqJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A11A1F000E9;
	Wed, 26 Aug 2026 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787751287;
	bh=Ni4UKv87N+rABDQdMXQ0FunrjmJM6L3MVhSfhavDYkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RItWFqJpJPCQXBUNnZhGci9laqg0sQWjN2h0RDl24bbtmeAcLK+OdK6ONCsSpFerg
	 Nc027chIZj++T+2cGshYdZb5Ls5giw9RPxrDrqnoV+X+cK4Z8qxwrPq3hnYBkU8Qu+
	 A7yAFt2c70QlNOcA8XnhgZd6dUu7Rfk/WaBoLXY1cBeurGoSzNZS5zdR0qLW5JQCqM
	 v6TE2Qynv1r+AnpT5UNmV8ZuX/QErlPZ81w85DqdmzUlJJEZtQhfyt7hlzwcvN7CbU
	 aTfZerS0LWaqa6lNeOv9WXGI0nC0D8cF36EUgGgskfyNTPb4TJYjg5GXEq3vEdo4P6
	 W5Yb4mkv4TY4g==
Date: Wed, 26 Aug 2026 14:34:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Yang Zi <2959243019@qq.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: max8649: Fix NULL pointer dereference in probe
Message-ID: <4a9f1f3b-f6ff-4af2-8efb-83324bc1d628@sirena.org.uk>
References: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="erKHgZXIYHNHD22K"
Content-Disposition: inline
In-Reply-To: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com>
X-Cookie: Obey all traffic laws.


--erKHgZXIYHNHD22K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 05:01:15PM +0800, Yang Zi wrote:
> max8649_regulator_probe() dereferences pdata->mode without first checking
> that platform data is available. When the device is instantiated without
> platform data, pdata is NULL and probe crashes with a NULL pointer
> dereference.

This doesn't apply against curent code, please check and resend.

--erKHgZXIYHNHD22K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO63MACgkQJNaLcl1U
h9ArTwf/Vq711/CKZdEkfIK9OfOJA1SmOUZFsHcJ+ijXZev7/au58qfvG/7GB4qP
s5jU3I1ZRGYPc3WaWnk+0AVrUABW0lSuYZBluDoF8Ignie8NRCcpLRZhiIGCdY9I
d1O3k5q5+A2jzaVjn89nvfJGdFPkXKAyegacOTaQPLs/CJaOCvPPjtXj/gl6LPx6
FmI3VUUx5NO/Of+4ThVYWN2+yVJE6mcA1nOCRmF8ODOeh13blCIgtf/9JU4mOTiF
vD1qjjAi1DdeUhar4cFk5YExTu0FplVspaDbK9FfhTaJ0OzKVrdmCxDikbKQEKbb
+zrEfCF0bISzD8twJpndDwZGjRB/rA==
=uQDw
-----END PGP SIGNATURE-----

--erKHgZXIYHNHD22K--
