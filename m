Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867515;
	b=GZ7lwX0qOlJaEfZlTj8gNq43LfRtK4+mgF+fQluLICaDQ6bXScYSpBuVgNCkaqh72auH
	 AmH0s2HlFnbGp+0vIbc3sGIyH0P+bUF37pL1bgv7ujLC1pNDc498/mBV8Od7EfAeJMInF
	 kSZesj87RCCd0y4O2fIf2miYCnvGnAqwrZ4yN81hbZVSQjZQn6FnxfhHR8RvXh0cH+vMY
	 byr1jwlcOXVVm/RS6TmsJTchXq4kJoTuL7WwfU5U1P4kaDozx4aZngWPWEb6vkxHXu+/Z
	 GzeaLXNscSAImWPNsk27NC2s15U5MRnaNSFLyO3/olVsb9xOLJUQj1FYv6bcpFfkk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867515;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=bL02zPYVDkfDZZHbhcnA74GsObA/XKYgm+pp1fRRR5Y=;
	b=2JfBwXB0etWtmAdqxjCXRMv5FmG41bJTJtuGG7EFK1z5rqbmFJEZ04Zj/6+sXAgTG3Jc
	 JCkRnIFswLw1CFq3rQKhazNueRMbZfKmEdy84mt33jWBALkYGOP1jiYSMz9aQ+QwSxkjj
	 cA/BBM7BAxbgR8/BqAfRPfqG0pYIcbcbVkPFQwvBuIn1hxGruSAOMz1FK7FbMtcdyOzgE
	 vn+29L6rjNiHLJkQYhaPZAAAgCK0lM7NNChmItFX5xsjg8SKBXrEoFpWwAqCDi7ok1SDi
	 gV06+HpyZGUi27VzdSCcHw5/CWaZo9UkcEUoPp9Lh46lV5FJTW2ozsYgHJ7FYMFgwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azhkODlR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F7606A31C;
	Mon, 16 Nov 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azhkODlR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE44A1F000C4;
	Mon, 16 Nov 2026 22:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794867515;
	bh=bL02zPYVDkfDZZHbhcnA74GsObA/XKYgm+pp1fRRR5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=azhkODlRV0npf3YJYkIbP8A9ml1muO6g7OORDDGlJN/KfLfiJrEVMBlGWzAeoOMiE
	 ZbL5zmopA++dDA/LLv0V3R33p0sVQ9uOxmtHHjGDe3ZrkHxgxeiyh+5Hfp+YbTBKRf
	 SWUbWqhq9ozithHeiX5ILq47ChbuKZ61wUNLALIUFkSY11OkBLJxx7bzKlHCCdq3GE
	 +fW4XLPTavSkX+m9xMvwMolLN2iZcAwZr5Drs989HpVUjuN7ZdUu1CpExpPZHF5rPY
	 cn17qNy0SX0u16pp/BzAna7R4Hnedx8CxTT5dAlw4E9IarYhUDNfj9KHKF9ObNwU9M
	 m5lh8DB3dusPA==
Date: Mon, 16 Nov 2026 22:18:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the thermal tree
Message-ID: <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
 <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="U+Ry7vt0bmocA18U"
Content-Disposition: inline
In-Reply-To: <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
X-Cookie: Serenity through viciousness.


--U+Ry7vt0bmocA18U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:17:14PM +0000, Mark Brown wrote:
> On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
> > On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
> > > Commit
> > >=20
> > >   115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support=
")
> > >=20
> > > is missing a Signed-off-by from its committer
> >=20
> > This issue is still present today.
>=20
> ...and you've not told me about your new email address so you've
> probably been missing some of these mails :(

Found another address to try.

--U+Ry7vt0bmocA18U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7gTYACgkQJNaLcl1U
h9BUkgf/UdF7Is6oqoQsa0flEZyQvbSp0gUuREHMqffn2Y3oCy3ukDvgsfdrdABh
0cp72HVnqbPrmzgxagYfV2HkfOdkFtTie5RTjw7sO03V41P4JK8icaWlr9XpvbBf
rDWnW9I1qopE7BB9lb/PLkYOWYCw6wL1b4cwHqaU6fyTChEEdzwkaAlcLFbQlrk0
gYuvlNVQb8T+lWU9OgkNccyOKY/9BA1IrLsYXVa6gh9gNchRx/XWbp0jcp4xi5iE
XN5aditlDnYgtjOaKmltMjZ8n10Sdixp6LqxunWYS3sDfSO6VC8HvRTBqSAmBvD5
85lSzNGYgkgVUg9EkM+pd+0FDMdzhg==
=nzKY
-----END PGP SIGNATURE-----

--U+Ry7vt0bmocA18U--
