Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFEC3C585B;
	Mon,  7 Sep 2026 23:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822338; cv=none; b=SRCLndSVu/zo4KrLA3A+KV9guZumaktwUnNzJo8yZzoWbJepXyILA+6mKjrOdsii3z7qGcvJiH/7VxxcdX5klIsitVvEq6niMkiOBAwR3wc11GQqw3eTyJOYSJQnJ9XcoLsQVv3LwylMhMm555JrZg2v55jvXhcnsVqBciN+KVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822338; c=relaxed/simple;
	bh=n7IQJBnWhJ0z0X8tBrcGme7gFqObyCH3esunh2RRlXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWcXgvLpVS9piYTGAd2KhdKVkAbfKyQF5eJBaAUuF5QYC4gaWA1UeQRE/Z0xpWistMd25N2Tpmg0uKlWiCMkcnD2gzq8WDQN61lWv5ehqDwXpvf7QprjnXRvld2ahxTuvyUF7W9PBSQKNU655OqW8IQIMhI1kQREso730wAwZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA7jgY4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AA7jgY4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B311F00A3A;
	Mon,  7 Sep 2026 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788822336;
	bh=HQ12dgtARSJkFau3OQ3xyb7EVv4gePGsUwqTry5+pBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AA7jgY4pbtZ0/CgG/eKjEhGSqLq73d1Ku8JAUf4lPGywvMJa6ZXDvD5gi0TaJy/8l
	 9x9C98TjlolvHtNjhjlHhbeuKbMckc9KvDnyrQPUI/VlmrdeLi6aWMVZp0qsfO4Jvh
	 58gw+7hT9aC899qDYUFkusAcq9m3RILXY6vBuDLTtmhvjMpcu852ORSYwwUbEw3FdR
	 9mqiZryTVSfzwl0j91AwFna+n3e+WOYc7YM+p4JeOABZ6DHUXJTtVDOx/+6PkXHYQ4
	 GCWs2CAeoA2mB9GtP74/ArpxtFGribCxnaiIbz2a+mldd/6J7XRpHtyBO3lCXz8A8W
	 3EJ8Vdr3YWbmw==
Date: Tue, 8 Sep 2026 00:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <04d6aba2-bf5c-4e73-8ba2-1fe57218fbd9@sirena.org.uk>
References: <aprspVnTJDpAp7O3@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b0Tw2MAun1ZLhgMd"
Content-Disposition: inline
In-Reply-To: <aprspVnTJDpAp7O3@sirena.co.uk>
X-Cookie: I am NOT a nut....


--b0Tw2MAun1ZLhgMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 05:07:01PM +0100, Mark Brown wrote:
> Commits
>=20
>   71729d60938f4 ("Bluetooth: btusb: Fix leaked runtime PM reference in bt=
usb_reset")
>   a78f54e23804a ("Bluetooth: btusb: mediatek: Fix leaked runtime PM refer=
ence in reset")
>   b3850074b2c49 ("Bluetooth: btqcomsmd: destroy RPMsg endpoints before fr=
eeing hci_dev")
>   1cdf710cc2a13 ("Bluetooth: btintel_pcie: remove duplicate BTINTEL_PCIE_=
MAGIC_NUM definition")
>   21c3501e5f464 ("Bluetooth: hci_sysfs: Fix NULL pointer dereference in d=
evice_del()")
>   860043e482746 ("Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth =
firmware")
>   9aa9447804c7b ("Bluetooth: btbcm: Add Synaptics 4384 chip support")
>   29d82dcf72731 ("Bluetooth: dt-bindings: net: bluetooth: add BCM4384")
>=20
> are missing a Signed-off-by from their committers

All of the above still appear to be present today.  I see that Luiz
Augusto von Dentz <luiz.von.dentz@intel.com> committed at least some of
these, should they also be a contact for this tree?

--b0Tw2MAun1ZLhgMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfQzwACgkQJNaLcl1U
h9Ajlwf8CKL5jXPooKNvDy7TTRMjfOZHd4qwt4a6fZELmmT10iExQ+GVlDERnl/l
eavXMANLqDaNfQHHC85ahr544Ud0LeqcApNCjMQj24E7QpwjAUp+FpPsdx1Zr4Dk
W8o8ka2blS/Oh+HrAbOtqis0253x4xMwP7s1g35QHmOzdnc89OXaaYFCaPpeCfe0
SiQTvpVtisH/KYG3caDGsgTCxbUeRwTDuI9CjlSpoxDD9kF8rAh5tWk2Ary5+m+w
QW4pggL3tUnDbbCF4nayTZR5q2IRebuGlvKX+nFX6TCoFo4EDmMFoCAaTrlOOS9k
2zJ4GuQX4mgsm8hqyEdeXWKvkjj2Eg==
=xZCr
-----END PGP SIGNATURE-----

--b0Tw2MAun1ZLhgMd--
