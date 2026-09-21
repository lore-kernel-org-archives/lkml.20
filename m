Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638A3264EA;
	Mon, 21 Sep 2026 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994424; cv=none; b=LUiYgUEMiMM1Jl251TDGEnGNARx36cTIEAcKDqLbrO6ofZEW0hcq/4NRWk56CxzKc3u8J+AFnuapjn39L8AoBkhRkmnmtIzCzJ81RFSN2sukf0DKQgtFChvnvhhKynIKMHC8o9tsqlCf06TpexPaHWBJyKUwhuQvutIROTCfUW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994424; c=relaxed/simple;
	bh=Jn+IyPTQ0qG4hBhlZNg0ZG68y9FoVMiRBzB4/vs7jLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUGzDxQUv2HM8oYe0yM8jVM14h1vZF3ls03/OQ3GKL7FNA5EjF1cWwNkYg4LuuAGqUBP2yKXl53OQ49EdaNEEO8+lBOfS1hNLqcZMDtJJJKWGk0zCGlDJ9V2XfQcRP9WaxPXNHth6buH2+Dz/4DQsbaJVa8d6ckNMgE5ldlVMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+z3z++4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+z3z++4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE211F000FF;
	Mon, 21 Sep 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994423;
	bh=Jn+IyPTQ0qG4hBhlZNg0ZG68y9FoVMiRBzB4/vs7jLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+z3z++4299gxMKIF8izR/C56DHctx3uGgo6cDoIm6wVVOip0SWZPmrl491u91w7E
	 /PI4901QUJXIPPGRoY/UCaHMlWbhvZKHrtziXqX7pHscCCJmagXkqDy1mrGrIl+D9g
	 glEfjUpAv/1p+Te5dOwkhYfDR6SMefSc6Jo0LSg/lWL2Q5exmAoQK6wIvI4c3pM8Ca
	 qs5YAXhAUyfzL7ZGFWz7ypWeNegIdeHM5X0TwEizaWxCN2qzcidXMF7dF7yUSijpd6
	 mZPSdkEGbTex1tsqkEY6+cLeU9Jm8zh5Jap6P72Rt0ozxYtQeiXT9VEsmwQDF6KbkB
	 j4OH9pJuqoglw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ADD3A1AC5376; Mon, 21 Sep 2026 13:40:19 +0100 (BST)
Date: Mon, 21 Sep 2026 14:40:19 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Thin A15 B7UCX
Message-ID: <arEls1VrT5hZbUZb@sirena.co.uk>
References: <20260918104944.649403-1-zhangheng@kylinos.cn>
 <arEHjbt3AY06j_Vc@sirena.co.uk>
 <fe055bde-3542-40ea-aec3-8d379c9599a1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4zommVywJT0caDp"
Content-Disposition: inline
In-Reply-To: <fe055bde-3542-40ea-aec3-8d379c9599a1@kylinos.cn>
X-Cookie: Too clever is dumb.


--q4zommVywJT0caDp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 08:22:37PM +0800, Zhang Heng wrote:
> DMI_BOARD_VENDOR: Micro-Star International Co., Ltd.
> DMI_BOARD_NAME: MS-16RK
> DMI_PRODUCT_NAME: Thin A15 B7UCX
>=20
> This is the DMI information provided by the reporter.The Launchpad bug
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2167333 also mentions
> the "Thin A15 B7UC" quirk, and their names are indeed different.

The names are different, but DMI matches work on substrings so a match
on B7UC will also hit for a system with B7UCX.

--q4zommVywJT0caDp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxJbIACgkQJNaLcl1U
h9DXVAf/deTH67GX33bAh5em4FK2E6NR5iLfu/68Zs5NxN1Pw6/cFbOPcovYFVRn
oTul5By6ehnKtBqKppFVXEF0ggA5pyCH0owHh6W4Ek8Mz0HsAJEQyAqRigD8W0yI
9WoU54dcC4Xa5HRrXeRLPmb/hDG6J48gy/3XMJ0iovToN3QkMqNgUBMwkeN7Tomb
eBA8jXyj7Z2ebr8NWJC1G57c5KUlDxdKBWcvgNpFjJG3QBXZHAqTrgyNCBer/Vxr
7Ph9eHckRwwsIHYBN9WVdb5wyKFse8bSRwGdS09yus8yXnnIugayp0S1OgPmry4s
lb1eUBHYyJo2c8ZvAbnHk5DKRH8aDA==
=q06a
-----END PGP SIGNATURE-----

--q4zommVywJT0caDp--
