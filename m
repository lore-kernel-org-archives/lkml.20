Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877658;
	b=oZ0qb/jpHB1Ml3MGGQBKRObDt6AJwKvLue2dvcPr2hbqBlzaiMOKrkyQ+KqJeFoTyRJc
	 YoDY/cG9aH+auWZzuwqw3jDdTBWDqFzFU8m5UWXFPSVt7n0eT941BPcB2WLyOxzv6HvAU
	 t05TOFHuuzmqIf6JDJKVino/OTVoAa+hrdv1l+HoH3uJn2/qmLRlSo+lyFSR3PYzsQnpy
	 +MIE46yjR8SiO4+ggBczWDSpXHn0Hm71gud3TR7uWZzAZNgT3fdmzaAeyOkk91/GJVneX
	 SSh+qs2cj0hcaTKcfGYPDKP/4lZidCp5ZSbIgSc1dxnuJnO2EOP8/wzK4/uoe6dqSxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877658;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=x3uqTwxZ5g9ojnEPYeDxNTWUyCZHe39qiak8K7+I6Lg=;
	b=txQ2xtY1ebrzqyu92FntrjJaNbPkIqyzeY9mayXrdOa1XzNs3zwqZVZf1bf3oUx2YLfx
	 n9ed6xcK/0hnNARNhveV9YG++9Oxq2Za5+K5fNqaGPM/f5z1BGmRYlPgKgkBJdf43g77M
	 CHVnIDZZCgfGExrOtM7pK0dFITTKW1ZlxBy3WUoJTOIoyhsnwfvqrP8i/iLGGl6Lcxt+j
	 8lkIqVUaK51oyg1g2SkSWl0jLtiIhX+xV7F4JjAAld/96ufehtvRi/MiRauaaEVjJfcIn
	 gjo1uBXhXjbwWg33p+hkWb4F9b6XvKVoSZCC0DdONQxc233r+CgAGwWFVafZ+PQI0oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXuVV7bl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXuVV7bl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE371F000C1;
	Thu,  5 Nov 2026 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877658;
	bh=x3uqTwxZ5g9ojnEPYeDxNTWUyCZHe39qiak8K7+I6Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UXuVV7bl0Pl+WbhL6BYsVU0mw1wu13cZqrS+v8MauA7Joz76ixVS0POLNPqobxchh
	 F5euOh8Ye4OoCWuHUgUFh/vn+8X2L/oEpMCxpIhrBhc6oQJevrVI4sAjS2grTBXzK5
	 qpIUhXreIMVRoPl42onB/Ghyu/bYw3JpoIFIoXzFt7aZMZM/tigowAqwdugVCsdIJF
	 Q79XaS+eKg8zT9SaBPVUUK20RtvCUXQBdB4kneGxNS0aNzAGMQ3jgkKcMl430WaqQk
	 rflIGmIFxH0+qBmu7iNnl8K1eXo7nYHgOlCL6tcEwERCUjwDlbEQvWsPQMcAOHo7qQ
	 l5bVSJ+XFJj4g==
Date: Thu, 5 Nov 2026 11:20:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] regulator: as3722: use the platform OF node setter
Message-ID: <0961ddfe-189a-4a49-9438-3fcf5009a937@sirena.org.uk>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
 <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
 <20261105100342.34730-1-yigejiang86@gmail.com>
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
	protocol="application/pgp-signature"; boundary="wAJuCIcE2k8Wxsm6"
Content-Disposition: inline
In-Reply-To: <20261105100342.34730-1-yigejiang86@gmail.com>
X-Cookie: Alex Haley was adopted!


--wAJuCIcE2k8Wxsm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 06:03:41PM +0800, Yige Jiang wrote:
> as3722_get_regulator_dt_data() gets the regulators child node and
> assigns it only to dev.of_node. Platform device release now puts
> dev.fwnode, leaving the acquired node reference unreleased.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--wAJuCIcE2k8Wxsm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrsZpUACgkQJNaLcl1U
h9C8sQf/ctLwcQNFN4ug6yFZKv+Fq2pTCMIni8F1e9FN3TgWM2wiacN87Gcv/gwq
ilH7tsFWwdvkV3ghoPO2j+LIcbdMF+b/IP6rvVKXyzPJ+Z9z6N7pURRFwN1GmZMp
yHWSn1Z5r1EyEFHXckpvEwd4WfGXdQR6nX8F1Xpup7wbv0Xdl6xOqKANCWimun1V
CdjX0vv43+7/TboJm+4cbV39sDFqE6E/gZdDvUPV1ucekNKmyTvVIu2wTHuf4whS
YqwAYC7FGtFheGy8YzWzJEycS4hQRrUrzHw4J4HMw7Yu6LXzFkHvTmCOkKt0tGRd
fNt0MpKZhqwcRptuNbzHMyNvhSuK+A==
=kE4L
-----END PGP SIGNATURE-----

--wAJuCIcE2k8Wxsm6--
