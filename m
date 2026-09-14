Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964745D92E;
	Mon, 14 Sep 2026 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402872; cv=none; b=swHWJg8rp2wzEF0l6rcSlnV2c/WlR59ley5ELskw7LoGZXUfQbLnYzkJkr6vPEyXW+VJi2BacgBvgsZDhIR+GeTcZ5t/z2u7YKTihKTItmvohyAi3SEBTxrsvzI2LS/7yc16YAOi5+fEyd4ePskVnnxBO61EBrZ4Ilpqb9rQo9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402872; c=relaxed/simple;
	bh=/bO5qNuP1pUX1PnajAGXd+khgxb18oa4IpyXSEEmsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH+iu5awtUxMyFRN0QqEwMmVCxAgcO1mtLikUnM4HruJy6G2WJO2bW3C81HgMQxrQZ6w1culvnYNJAE+A1UzvSkPnXSYLWj0T9ngFjZBM1VcZ7hOCwue+7BMCAuYvOdhZKS2TDSsh+eTxJZwSG9V809cVR231hnP93w83GX6FI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBTAFStb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBTAFStb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277761F000FF;
	Mon, 14 Sep 2026 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789402871;
	bh=zYKr3NiUgUyNyH1y8MtqFMSJp8mpfVLZKZzX/LOAlV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PBTAFStbQLARC4HuDHngeFOoExwU/C7eI8CkVjYH8K887hqeJdUurI50Tun08okge
	 LQNblmV8EBiAxPROXUbqiES0LNZYT1wyD5LaI0d2bLiVdM95hcp9pqWLsM9Nr2Urhk
	 annkdUFjuviwslvfDMNGgqJfI81CvpHn0cGUWnC5Z1SQ5k0lP7GLuoCeGL1f3dF7WJ
	 5gy93LHs+8ClcTHRNYjLYB/A0iQ9ZEhwMUTexbZ26YEU3DOO/7t/VR5WiBWmOKLX4I
	 FzrqoUw2/qp2tvUokL6XwAmLu8Dpd0rca7t+g9+Iuhtjozi+sBV7QVm3cdwPYGYrvx
	 q6W3PmxD48QlQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F35181AC52F1; Mon, 14 Sep 2026 17:20:54 +0100 (BST)
Date: Mon, 14 Sep 2026 17:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <aqge5mzXV3KZZ0-p@sirena.co.uk>
References: <aqQARvWlSUQEHMtw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SybeoVo5kGhEUcLi"
Content-Disposition: inline
In-Reply-To: <aqQARvWlSUQEHMtw@sirena.org.uk>
X-Cookie: Not recommended for children.


--SybeoVo5kGhEUcLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 02:21:10PM +0100, Mark Brown wrote:
> Commits
>=20
>   e40edfa049b96 ("Bluetooth: SMP: Zeroize raw key data on the stack in sm=
p_e()")
>   ee0662ba1e0a5 ("Bluetooth: hci_sync: Serialize local codec list cleanup=
")
>   6691666bb4b22 ("Bluetooth: hci_qca: Do not write to the serial port aft=
er it is closed")
>=20
> are missing a Signed-off-by from their committers

The issues are still present today.

--SybeoVo5kGhEUcLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoHuYACgkQJNaLcl1U
h9BRIwf9Foa1x8xgzpWAJeE/Z08qvXfAkO8OCZhsyCA/S6Qkh9pGsfU3/U7zKDPQ
yJwvscIkHmoZT0jS6Bkl8tU0hvsFUsW9+hMXmz11s1mqtB9N7UB494ij7vNLF5l1
GNfgNfJLRO3at4p1DrHgN0vGPH+fat/9RVNMZ6ZT2GZ5YtxKCwg1iNrPZ+06h98M
UOOwIrRUfdmQbRWN4UWDpHZkBEowpnEHC6YMVJL2O2ACcXMI02leTRw13mkaQvhT
XqTnnzH3ih+e8pbGpL4hVc6toxF6bWGIGPvBJZAgoP7yDCuHj8afj+En4xGvR7EK
8QDmcgHg+11ieIgzmghNd3zqeSZuTg==
=s7WK
-----END PGP SIGNATURE-----

--SybeoVo5kGhEUcLi--
