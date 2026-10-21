Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590155;
	b=NCeo8cCcPehoksf+oIeyEQPSNYA6t4Br+mzvXUfWKAvR98nH4J2VOls2SwvauuCCGl6e
	 rsrO9WOiJMbmS8nJpAkvmb4EYNx73pBOdw+v9QmC1KD/roH5kkHU0XZFVBa3FsT9QzuQZ
	 UwR38GJOgsYx2i3sm/Z3kR2xexmeN1uXYf1I5lsPeT2e01MkCTtTBjr5i8BJFHyPbRXPM
	 hSW0Cr9XgGF4UTmsRUoogNUc10jaufo2PbSnL+OXfX9viJrbdtfPbk1KDI+z2WLT76uVy
	 T/jxag14eEqV6fbb0Z3u1TvIKWefMc4wZI0iQJSMYPSOdkhSOor1p6BfvKLNI/DfkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590155;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=uhAGYxWwR7fmjnW+D8nVDi2ATwqkkBbKxyqsG+99kyk=;
	b=ANZVCn8YtmXHEMNIxzJhEgnOpRZ44DJAlIAc94uw0aQj/28RY/lhVzzhCxoC98CK0NFz
	 /N9arjENECgA1bzUwFuJGWQNXjibQzi+F2g/mVDY6IJ2dwQNc7TJ/wnMuGsRgRfbtduB5
	 PYYCYtbgfVjbW688kGx31VjkObs8cPYXwbvKBcO8K8d2yeZSK+ZVINPpLiuceISe+xqYt
	 22PtG71mNMKsL8SqlDSdRf/uGfM3wVLN37sPambc6qcRjXXoF7/YFWNYJg0z0RJeRAstY
	 7yzKWYLYb2j4htnVeU5NpI6RftiucXV1dleR0T/4tKjzI2HhYqnlYQgDgEeeKkhjyFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3UD7U2c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C3606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3UD7U2c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD481F000C5;
	Wed, 21 Oct 2026 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590154;
	bh=uhAGYxWwR7fmjnW+D8nVDi2ATwqkkBbKxyqsG+99kyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3UD7U2c2lJOyn9j5aT+UE5hgoeYzQPZK6qEa7xxR2yTUKymtPU2GCW/7v5/WuQCv
	 baGUJJT3MCQZ29X7Gu5e99QR9Wr6aZRKXnrpFN4JMSxAYJnah3C7J4eTKkxSFdLwJu
	 j5gzBsdhMQJZZXCfPeDZ0aOBpP5Zfuvo8E7aVpZ1CTuGS9Wdrfo6rohY8Lt6shvkIB
	 C4u7uDGGuK/pvzlWnNu2cCzx6hcjRllVH/ZSFqzVOJYWXzhNCa4qhi3SPcQAKuYTTW
	 Ygg/vxAoqFNGzgjlncvVaBMBf/DA9i6JaKldfdV9EBfIWhpCdi+6TIVeTrIZfc/0D6
	 y4360b48HVIgw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F42B1AC59A0; Wed, 21 Oct 2026 14:32:30 +0100 (BST)
Date: Wed, 21 Oct 2026 14:32:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] regmap updates for v7.4
Message-ID: <ati-7Wbv0-NTRCXA@sirena.co.uk>
References: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="U8BrY3DCQAxT1e4K"
Content-Disposition: inline
In-Reply-To: <20261021110346.CD20E1AC5994@finisterre.sirena.org.uk>
X-Cookie: You buttered your bread, now lie in it.


--U8BrY3DCQAxT1e4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:03:05PM +0100, Mark Brown wrote:
> The following changes since commit 93f51579e7df248780214094418f205253383c=
c5:
>=20
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags=
/regmap-v7.4
>=20
> for you to fetch changes up to f52260f49b107fddbcf7c75f9cf2347a5031f0f7:
>=20
>   regmap: debugfs: Use __free(kfree) for regmap_reg_ranges_read_file (202=
6-10-08 09:46:00 +0200)

Sorry, please ignore this - there are some annoying conflicts in this
which I realised after tagging.  I thought I'd regtagged after resolving
them but evidently not.  I'll send another pull later.

--U8BrY3DCQAxT1e4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCati+7QAKCRAv73Ows9A4
iSSpAP9e2Hd9sAs1su5gGq6A1hxbVh8yJizcNrS7LmHKefyIEAD6A8PAngwmb6Hx
hwUkDWBxNBMiP+7vkawrt6XD5eGCSAo=
=SDTI
-----END PGP SIGNATURE-----

--U8BrY3DCQAxT1e4K--
