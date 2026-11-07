Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065859;
	b=n5H+YzS/amNBuJiEnLoY9T5ZpWpHqjNyDTzQ+D2UqmeXPN3qfota/O87ESG7MD6pov1B
	 4BwFsYYEC4Hv7NpM23MKWrC0G6EAuhoMa/t2gCJoQCCSwdjYOrkdjErS8dFyUfMyGi5GB
	 IG1KybWiUmQ/BTgFP9CtXmIFeCfBmBWzJkZV03ExjGnQ7SYk0il/FADLCj0lLosX5W6Ey
	 aL4Mhs2FV8xix72vrSUh4YvQQJHBGlncTVhWvNsV4jVidOvAQn/ImyAowJuXQ7k7Fp37J
	 2KDNEz57+13faKZ04W5wIDHK4TctgqMO26vvwP+ez3UVtEEQXOqrZFncxzBC6CM7/vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065859;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kNaslowQoeUv0bfP4j0Xm9HOBoRuR1efd9BxtBHbpGQ=;
	b=jrPfhZZbz2PyZONXQHTexw6qHx35Bw6y5kTNMn/WW8KT8tH31slzuduq37eYtMMgesXS
	 kUwhykrTkHA5ktlzpeuvyHmUz9w6E0h/vQple8NJdr08QhLIb9BAL+86LNHl0Vg2OYAQR
	 PetFB53u+HALaMV0a938RynG8wc++i+wsdB84faKiqXxcZqsk3pTyKOcIEf8AN287acKv
	 suGq6w9Bfurkn22Lj6WdNHY88tZT+5Pi9CM3tpovXQ0bUofsY/z3oXyI5uoqI7THTBQSf
	 51RcS+fYhLwy8iAVINFLcvdPkkqrHlaKRuicOhltygqCjMxB0/4krnMZZdvhrKGDyLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AeaqMbG8;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D980B60A260C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D980B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AeaqMbG8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kNas
	lowQoeUv0bfP4j0Xm9HOBoRuR1efd9BxtBHbpGQ=; b=AeaqMbG8y/YS9tomKvny
	XqNLEBDcn0nymD5CDoJ/H246icerH6id8jJ6b9N3gy8tEb8eLT8QZlGIC2FL49yD
	Z6XvzB5gvZKAf/+3SvT+hMO/kjoPYZY2m24vg8L+RuViClFxGJqBQFZTySXG89gU
	kNDjx2FCCM9BzcMrEmEr9Tuj+ySo2Qr/y17KCoyOvQZlu/+A4g1VYfqowLCVyTMs
	3Rj+8hsT1bssxPFdI8f7jUdub39By8xq5ArEsE84f3FxAturutSNy+Ugcus/bm0u
	DvILwGR/X9cTfcgnnyTQkiB9lEdwV8edjwNot568thRB4Of3DQWALax+XWHqqxa4
	og==
Received: (qmail 2547555 invoked from network); 7 Nov 2026 16:37:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 16:37:32 +0100
X-UD-Smtp-Session: l3s3148p1@kO/RgbFf/MQFFu4l
Date: Sat, 7 Nov 2026 17:37:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Umesh Kumar <ukumar@marvell.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	bbhushan2@marvell.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: designware: Enable SAR in slave mode for
 Multiple SAR controllers
Message-ID: <au9FtxBvemLIa7S_@shikoro>
References: <20260804041842.3205356-1-ukumar@marvell.com>
 <20260818144306.357243-1-ukumar@marvell.com>
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
	protocol="application/pgp-signature"; boundary="otxvpO2v3blHEoyL"
Content-Disposition: inline
In-Reply-To: <20260818144306.357243-1-ukumar@marvell.com>

--otxvpO2v3blHEoyL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 08:13:06PM +0530, Umesh Kumar wrote:
> DesignWare controllers synthesised with the Multiple SAR feature (e.g.
> Marvell CN20K) gate the primary slave address behind IC_ENABLE.SAR_EN
> (bit 19). Per the Synopsys DW_apb_i2c DataBook v2.03a (Multiple SAR
> feature), when this bit is set the core acknowledges the address matching
> IC_SAR; otherwise the address is NACKed. The slave enable path writes only
> IC_ENABLE.ENABLE (bit 0), so on such controllers the target never ACKs
> its address and a remote master cannot reach it.
>=20
> Set SAR_EN together with ENABLE when entering slave mode. The bit is
> reserved (and ignored) on single-SAR controllers, so existing users are
> unaffected.
>=20
> Signed-off-by: Umesh Kumar <ukumar@marvell.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Rebased to top-of-tree and applied to for-andi.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--otxvpO2v3blHEoyL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrvRbcACgkQFA3kzBSg
KbZ0kA/9HOpfN/5gR7JFrLk4jTuxgQt+7c1i1XxW67VAhV5ZKDSofwJDgnWSbfen
OZWWLEob2CoM0NKUrzebP+rRFG5MoCGEZIgEqCvX7OrhBRRDyIzcqd/FrC/PKOSs
kwlnQZlzkB4j2Jf4CIxaufvnFahkUQ2b/INcKSJuD7qnddNDw9GVhFMJfZSZ+Pmm
NQ4qYcc53O5jflaFVcA9lSnW/mDpHZm1dVnvH0IH2kj3dlJC/loPczOnK1KGquNN
h6/v50uTNdav4298nBbMo8igleloGUNS6QjlkVO6+UTG5KkKr5pu+/SVnV5iojSK
16cWgx4LLC5ndiw7I7JCpkdPEahpKytY1cpJmt9rlYWuuepUe7/nLdk2HUlmor8V
iLrY1HrqvBbrDtbsMAyRkSX+mHSpS+7v2tNwQkuPjPW7rJs1CrQ57jU3lYChzoau
s/LfzBL+Sxb3UhdgSWnkvifrYLCVHr7XoL9yzhjr0afpsUEZx0MVaBS5bw546Aax
G7ZKh/BLJQsy9sDzVbgSaJmZfD/liTfJ4nZJKVB7aNljAGyZfMvnFvGeJsRPFkbV
GCXFkN+WL/H8PerQ8H4Wp2AA5+xJHNzDra9PmVWakLlHS19C4CbkOaQvK/qGaplz
hFp+x2qdz8a5s/lr1gV/LJsgGamCd7b2UrCi84Ae3d5lN0teoGs=
=DoK9
-----END PGP SIGNATURE-----

--otxvpO2v3blHEoyL--
