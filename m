Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A84825A1;
	Mon, 14 Sep 2026 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403117; cv=none; b=cXEJhsxtiG0B2GjaLvidAQVRV7ycaJWz0wMH/PmyI04CBCu0RT7ib21uh3LjIqGqyPi3Cn9Wo4aA5/96CMimtVrqyaM7yCv/+XfuvxvkMpoyFSgpnvKX2yQAKIJ/ypv4/dcOtEYfyjL8QjN7fLAngLNwozlxpiMj5VL6f8DN26w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403117; c=relaxed/simple;
	bh=k+yJoxs+iBvCbwqL5K3XwRqZSTMO/i8PBg/FaHyMurM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJr5/ZmKo+AoUiNwfaonZ2wEEI7WrdxHYh+uWe36O424ybAMdcsxJ5UeU6lzATTE215Vwk3HcXXbnAzjzBHnd09/bbWqQc1RKCVCf9ymemMhrnLSixfVrPpTfVRYbUS7d0vCG6p5cNQPxSCrLMqkRXZ82YRkEmKAeO3+TTP3rFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH3msWDJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH3msWDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0824B1F000FF;
	Mon, 14 Sep 2026 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789403116;
	bh=gNZpslztfRyq0IuBIyy28yQuWa/X6C/kzRmauUlvwq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RH3msWDJnWvZC9lFF5JmHHZ2usGXLXpnxpSzvREnCoAyqc6gO/lwfYDYzVgnikhlR
	 IF93R+Qvms+GhuQdL5XB5/LhaGJFKpJGV3qAhSnAhN3dfJ0s9h9aBq3jtLJ47W8qym
	 pn8xpfoL568BiBv+X/aNIj3IOqZUfsFGWbLO2DhEkqkUsAOrea7n6AB6oLghVItVe7
	 sgWLnYk0dqf9XX2N8sZghBd6pRewxB6vIFJNha23F31DEsy4n6mE4Gv27xyBSxTKm+
	 mX/gP43DGI5O3D8uFCB6+Y6WhdA6WFyGVUkt6DIAhj+qcXVZeurtdN5+WRr+0LfjK9
	 O/mWOJN7CYqMA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8C12F1AC52F1; Mon, 14 Sep 2026 17:25:10 +0100 (BST)
Date: Mon, 14 Sep 2026 17:25:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the arm-soc tree
Message-ID: <aqgf5o_gSUQH1AF0@sirena.co.uk>
References: <amY1zEUOGFe4Op6W@sirena.org.uk>
 <fd352f58-8100-4b0f-ac8c-25b08d0e2886@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YwRVLTNIcQtjbjYP"
Content-Disposition: inline
In-Reply-To: <fd352f58-8100-4b0f-ac8c-25b08d0e2886@sirena.org.uk>
X-Cookie: Not recommended for children.


--YwRVLTNIcQtjbjYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2026 at 06:25:57PM +0100, Mark Brown wrote:
> On Sun, Jul 26, 2026 at 05:29:00PM +0100, Mark Brown wrote:
> > Commit
> >=20
> >   3edcea7f0413e ("Merge branch 'arm/fixes' into for-next")
> >=20
> > is missing a Signed-off-by from its committer (and also isn't showing up
> > as a merge).
>=20
> This issue (and the matching author signoff) is still present today.

These issues are *still* present today.  It's making noise whenever I
check -next for ongoing issues, it'd be good if the branch could be
rebuilt.

--YwRVLTNIcQtjbjYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoH+MACgkQJNaLcl1U
h9DbHgf+KI2TYo2uxEm3AJvMUpcLZnjvmzrW2Hn/Hl9D5/2yEO2vd7lVVpuPfNsN
l2bS0mLRsnXbLN7JN+zmsCDv1ZuMbvdxtLoyVn4jxIIkjMYHtGAbqSkI43s4GgR/
XgayR+izqNzT+EV99JFtRPeh9GWUKOpxOyYUFgXvPyNb8k3FucK4vCjKWQ+quivO
joWunHmuPzFOQtkr1u+/offVGkd1ycT3IiYif9q4ZbkMuvbczPJqEAkyyC2hjWNE
6OJRq7Qkt5hk4Orwc+rlyV9V6TZj0vaXKIDTKlWsN7+6LHvuvK+GiFc45YZMVnFg
LY5LomMB5NPzCx2EcPmaxFz96zdsgA==
=QAk7
-----END PGP SIGNATURE-----

--YwRVLTNIcQtjbjYP--
