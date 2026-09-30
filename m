Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560935DA63
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747774; cv=none; b=XIP/Sv24d+dpFwe9SJ6PEw/UxqXv9V8QtU8Rmje7OzaUZA+C5DPyu/RXwsYQxBiYV3i4W079DY2KcLSYVeynYuRdl2fckaptKkQmtmaV/HqSXHGIB1lILl/C1XVdNIcXgDcdsFtPGslsvXdhVWOPJ2FTObCGucrYGjJXq5mTgd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747774; c=relaxed/simple;
	bh=feeNAdL0wewiky2pGNkvVjSu1/tOiPTEIzaWp8Y7c90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs7grBIQlJmBQL4Lb+X+HbB6utbg/V+CLK8cUCo+22SVgPEumK7OHc9/gx5ntM7mkWJzaK2d27XK1iJAWQ5ozmO8LTX+iVtEsHtsNx6LUpbthpKw4GJCFWEyanVo3SLufXARIiaa5CoA0wr0z6Bkcm2k1WF9xRMUmuEFlyUtMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UHN5nhhF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UHN5nhhF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso9758215e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790747770; x=1791352570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6djOw2CkrbE7Q3DUoZWNWw89yvJMUXt7JPk0aaNaHaM=;
        b=UHN5nhhFBly8M76PEwDtABWkcTzF1G6buNJF1XjdULbUFW5aK/LjDgGVm2XgtJh+TZ
         D6pBEenqCrSQIwMpWbuw32PEOR/TkNHP5dUN3gW05BXn1ZR8rhIfkkPLulyPQGWjA1Vf
         fUY2tTNE/NMmv5PqUsY7xd0UCc+KMaw6C40hksUEu/fcsCa27puQSD/fWsXMKrn/NTiQ
         Oxd15XvYFoOi0ymY1x/4CIenE7RV+tP2uyO2QEqrnoEwvIb2GCFbHQLnUkOEVqC9VJJO
         yqwFuB8aaqfR4krNKwZAgDp02qYafYkq3IK9jvmQIUUOVit0R3tqYm8q/WSHhHtM+aOM
         qtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790747770; x=1791352570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6djOw2CkrbE7Q3DUoZWNWw89yvJMUXt7JPk0aaNaHaM=;
        b=recmGnKYH1RhGE7ce4HOj+WmZHNm0AQ7V8vV6wW/AiLAFjeweZQ+GxrgHySsr/oZ4g
         iSueix8Ff+o7CRuJiXIg0XnlHO0bnx73R6v9dJI0o/sX0vpd8Eum4MH8J1OWmyouvxqJ
         wWzHVD3/e7CmMFnpGZLkIvC+p7nZvraPhNAy8kzD91OjFk8PwE0BST+hJ1J0XyYCNt8c
         xILC8IwTVvNc1/k6cLPyEkmMN+YphrbEknJ//YWdQ9NrFue3aD1jROQAKsGlXT64paow
         9rpfCCCaQ1IFdI5w/nXghr5XDwUzAfDVYty6AbHxQ2G1cao12ZnW3UR/Ym0xVIGbDjmG
         SeXw==
X-Forwarded-Encrypted: i=1; AKwUvBzsuOseL9mL3kXhn38DjYt1L/z9i97flE2QJV+9D8NFhheVDTT+rYvFr1m6zkae3y5Qq3o6KQnaTPdogjw=@vger.kernel.org
X-Gm-Message-State: AFuF++kG8z9I3S+6ukBwT66o/kjuJaU15UCmnv+zRW3LEg3I4ck+xBx0
	8hUvcZYoSUnlo1fmOTpGoVczlNAyGHIf3KN2ct+0reMQdYAttxGaY7cYddM2U9/SgxM=
X-Gm-Gg: AYBFou1peMe1R2ftnPeQHKVC+S5m0QLFiSFy0j68TO6BtHwTlfW3EkBXKmx4n6L8tOf
	6gzlXGuFt/CdCW7nbh9qIdkRTuc0vc+4Y/E90n9ovwLT5uP9Z+HAb+sUWyHF+osq6ai0qJFHP8p
	FkhxuZ7wFhLd68I3/mxEMTCmFOtySoWlpsgNO+1sRQg/y+gBqazw03OGcjTp9+DwoVjA9+CZee6
	A5ReeY2KqkLkzXCLqiTXnX6O17rvXIMyCIqfXXLl9OAk/TsupoM/RsK3c2h0valMSKQmTKvxRlr
	e4aAOsBf2kjcHoU7YSqvSAP4gKRvGgfpCZHVe90ZXhIwPhtE5mm8IvNMH+8DtbKw0kgS0Wsm+B6
	XgscPR6IvO664MU9u7y7uJEMDP31ARBo/+mcY6J30IvtttMDLxoMcxIMsdL4PdIxUgYsYNY/+oB
	c5w7kHSZzz1vit7RjvxcWIKQRVPpM+nX+ABgz724VVzBvUzEp62Vhr4zLdHxHtAU6aSkt/YzU5F
	G0GHWgzUJbskjI=
X-Received: by 2002:a05:600c:4e56:b0:49f:fc13:18a5 with SMTP id 5b1f17b1804b1-4a01adddf9amr3167235e9.6.1790747769483;
        Tue, 29 Sep 2026 22:56:09 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a0174d8738sm40875785e9.2.2026.09.29.22.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:56:08 -0700 (PDT)
Date: Wed, 30 Sep 2026 07:56:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Albert Esteve <aesteve@redhat.com>, Brian Masney <bmasney@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>, 
	David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@kernel.org>, 
	Eric Chanudet <echanude@redhat.com>, Francois Dugast <francois.dugast@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	Julian Braha <julianbraha@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Schier <nsc@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Waqar Hameed <whame@whame.dev>
Cc: lpcosse-keysigning@baylibre.com, users@linux.kernel.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <aryf_NOeT6gImMOG@monoceros>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kipdatsgfdtxd6w4"
Content-Disposition: inline
In-Reply-To: <lpcosse2026-keysigning-list@baylibre.com>


--kipdatsgfdtxd6w4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0

Hello,

On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> now that the registration deadline is over here comes the list
> containing the registered participants in the attachment. In case of
> transfer issues (e.g. MTAs reencoding the text file), the list is also
> available at
>=20
> 	https://openpgpkey.baylibre.com/Fei9keem/keysigning-lpcosse26.txt
>=20
> .
>=20
> In reply to Krzysztof's concern about how trustworthy a statement
> "yesyes, the fingerprint of my certificate on the list that this
> suspicious guy created is correct" I dropped the two middle nibbles from
> each fingerprint. So you can support your statement about your
> fingerprint by providing these two.
>=20
> Please print out the list, fill in the hash sums (which we will verify
> when we meet), verify your fingerprint and memorize (or write down) the
> missing nibbles (if you're on the list) and bring the list to the
> meetings together with a pen and a proof of identity (as most people
> will probably want to see such a document before certifying your UIDs).
> If your hand writing is poor, I recommend filling in the hash sum before
> printing. Note that the start of the SHA256 hash sum is already
> prefilled, that prefill has to be kept as is when generating the hashes.

There is more than one report about confusion with the hash summing. One
issue is that if you download the keysigning list directly from lore or
via your mail provider's web interface the line endings might be changed
=66rom \n to \r\n. So if you calculate

	SHA256: E0C7BC1A 4A4B2489 ...
	RIPEMD160: B6C3 5C63 7907 ...

retry after

	perl -p -i -e 's/\x0d\x0a/\x0a/' keysigning-lpcosse26.txt

or use the above link.
=EF=BF=BC
To minimize suprises in Prague: The correct hashsums are:

	SHA256 Checksum: 4E4F BA5D   C653 A423   48CE 7588   5D22 4780
			 9CA9 3DD5   0D10 D430   8FDB C4A6   F5E4 49FA              [ ]

	RIPEMD160 Checksum: ACC8 72E9 4760 E0A1 A459    D9E9 67B5 AD24 B853 DA82  =
  [ ]

And as people also wondered how I managed to get the start of the SHA256
hash sum into the file: That's brute force iterating through the
possible prefixes, putting them into the file and check if the hash then
starts with the selected prefix by chance. It took ~1 minute to find
"4E4F BA" on my laptop. See
https://manpages.debian.org/trixie/signing-party/gpgparticipants-prefill.1.=
en.html
for the tool I'm using for that.

Best regards
Uwe

--kipdatsgfdtxd6w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq8pHQACgkQj4D7WH0S
/k6EEwf/bWuFRjkAGM/NgCVVyl7bYB9ZEWlZzKcCRowZiluM2AXdPGsLow34nO/3
hQZf4wYLIGkfRDBMwj8STMqqMMW6KuthtvcDdXPyPhEKm0HZCWN8zY+QsbBQ0+Kk
VHbRGKFgmiCaKH0dg7HdBVgnIJyivvaJ2WedlmQgusyLhSMsvVJ6LGY10LncOkVk
EZSxYN9uDQW9VAudGaB5DFsRWKcZNrzQYo0l50rjNGZ8QqCifv25nFl3iaaYMqHR
TiClTixMPZftOXbD+gRT0Ukkx8KE7PQvmooibDWtI/PJKBpfTMWZw/V3xNcFTi06
jUjIbYiAiAUmE2OGS1C7E08gO4YJOw==
=XwAz
-----END PGP SIGNATURE-----

--kipdatsgfdtxd6w4--
