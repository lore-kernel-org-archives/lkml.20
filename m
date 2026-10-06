Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31034A791
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264499; cv=none; b=D0YRefn2wAKThSS5EyzUd/6Ze4qU0kTGM5zxy/BFYNeTT5Dg0dsqNYPRWZ9D4/JwJ1+9Z4Tg7SEiTf1bwd5JvmdF4EEFIAZD+5lacUQrEvqNE2/dN5nE7zpuSR7S8htX0NpZo6p3PP8h8USl/LGTKGaLU0a+GJO74kF0Aoq52Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264499; c=relaxed/simple;
	bh=2MxSx494IbMhZkj7djC4T+o+nsSi0ZFqvG191AcE/ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc3HKYh+VOAUq5JWOZOa4Im4LY459CA1bki+Thq5/zAog04hCxRgH46nhT2zz3Crqm+qJtkjIfPrUn+BtZ2MngQBc+5Bf06vKaxqCwCX6ZZc5Q8wACLnM+RFBvy0NuRZA00ZrdtnEiSXyeuzrCY6SXShwwSp6FTeUQvP54r/Lq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J0SZ9eAf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J0SZ9eAf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so22294895e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791264495; x=1791869295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MxSx494IbMhZkj7djC4T+o+nsSi0ZFqvG191AcE/ks=;
        b=J0SZ9eAfrIuuU6vALsln8GwQVaXQTnr4v1yTahIQM+lXy95RZJDgdhIzhJh9QGmfkD
         xwp4NS+FGgYaM08y4bxXBL5D99Y3vo15JTLaxIh6wFdP+Ctk500gJM8WVIZ1DQIhLNEa
         hzv0J7g6VL7nH0M6NQI8/MGCsGVzYMGPD4pFImm5oT1Mb/xhgk4bV2ihLaC0Z4FcoRxe
         jmQjh0TcreanpYafjrsJFempHPrT/QzGLuHo2XZgOaIvxbqy4Yy4FZFqXWmpjmRtEC7w
         5oCrgLA+74i2An/0oJkca9wYyLCJMzwmO3wk3t9wug8XaQl5xhqmTb3lSPrtMT4A1Y/6
         lBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264495; x=1791869295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MxSx494IbMhZkj7djC4T+o+nsSi0ZFqvG191AcE/ks=;
        b=vyuNfINIYZ0RmRJTcW0ntsNtXGvbuL8GUtsrGeZhPc+YBxiHO9mFdBnOjv/D4hyw4C
         2Wo7BblUdDk+KBqGPcy5opbU7jLGjg0vtdGnGam/lFh2sMoFHGxt8vYcbDxzSYmsSgIx
         2Px0I4exXNEmSeChShNPg5kRRaIBMH8hta5qlAlay2DUamJzxj4/3c0PiPsPb1c+DOZ/
         qxZzyFBX42YPKBZ1HICni+Fse6Cb4kVuQ+cXuJCw/HoP0gHsy8uvDIjs4MsAhnzuEJ1E
         TEh+eMaGJ1EHOyCIxy2iykZCT6mcjB5KSY3ZzZNYhY9zuTzGyIPRQKqDzTV/niL3sGby
         GFPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1o7BpUBCYPG9XZUF4T9uBomYzSA4g5yGQbdaIutCIuhhfsY/0irt6KjXES+/ldMKXClREaNHo1nCwro0=@vger.kernel.org
X-Gm-Message-State: AFuF++lQXez/q3K2i0CfdhFbLtrfe7oKpRAOCkB727Av8J78Asopo5po
	5coEfhsNpddCwTBiz0GFeFtrKaZ3UEIRm2cD8PLF0odTxPDeMmAVKZMhVv0U2dRrSwc=
X-Gm-Gg: AYBFou2aiX4iGyXVO88jl/fqrgFXb9wGEF2vMswelhyK9w0h1UrMQ2Hn0Ad3FDNS0Nx
	OWg7BAd8KXXfdifBxUThJVkq5L+liB0s/SWZizrm/CMQ389SZPTz9EzPoBIBmo8sck+O1uZ6ggB
	8mNn4qG/hEnxjcHSASw3d9ufaMPfeCyCnWFWVqyDPluROlD0xne3U2dwAcEO6jX8A19imhuISsv
	NVeRSUUT69G+B5e4yASZ2ZVyXRKN8fhkLBSANrBWh1pw+LSL67lPA6w3+uGDa7hqgwSIX2obvZ3
	FvFFrsNrCqiRySjkRBO6TZ8VS81947oT5gLijSwAOaSNbEB/QsnGGppeTTZl7j85YBdflr+rGf5
	rVM2w4izPfYSNWUBqoCtuD/Etk1vc+3dCbMg0SjjbY9wCNmbCOuPCBoKVUz7WGwd6WNkLbXLkxR
	2DQcmvMLB6QC3cpU6OQlV/jOvM34ys5AUTOAXNl1RMFOE9Kcs2/nXYx9IhZ3i2pPjLcZnQTg==
X-Received: by 2002:a05:600c:1394:b0:4a1:7b53:c8c4 with SMTP id 5b1f17b1804b1-4a17b53ce4dmr5326215e9.27.1791264494705;
        Mon, 05 Oct 2026 22:28:14 -0700 (PDT)
Received: from localhost ([213.151.81.74])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48c62eda863sm7192300f8f.43.2026.10.05.22.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:28:12 -0700 (PDT)
Date: Tue, 6 Oct 2026 07:28:10 +0200
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
Message-ID: <asSDr8GL2WUtQo4l@monoceros>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuw64qothntujhos"
Content-Disposition: inline
In-Reply-To: <lpcosse2026-keysigning-list@baylibre.com>


--cuw64qothntujhos
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0

Hello,

just a quick reminder:

On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-K=F6nig wrote:
> Please print out the list, fill in the hash sums (which we will verify
> when we meet), verify your fingerprint and memorize (or write down) the
> missing nibbles (if you're on the list) and bring the list to the
> meetings together with a pen and a proof of identity (as most people
> will probably want to see such a document before certifying your UIDs).
> If your hand writing is poor, I recommend filling in the hash sum before
> printing. Note that the start of the SHA256 hash sum is already
> prefilled, that prefill has to be kept as is when generating the hashes.
>=20
> For people having missed the registration deadline: You can still bring
> the prepared list and at least benefit partly from the simplification it
> yields. For getting signatures I recommend bringing paper slips with
> your UIDs and fingerprint. gpg-key2ps can create such paper slips. It
> might be sensible to bring a few of those even if you're on the list for
> those who attend the events without preparation.
>=20
> We'll meet on Tue (2026-10-06) and Thu (2026-10-08) after the scheduled
> conference events (Tue: ~ 19:50, Thu: ~ 18:30). We will meet outside the
> conference venue, in case I manage to organise a room, someone at the
> main exit will know.

That is all still true. So today's meeting is after the memorial for Dan
Williams (that is around 19:50) near the coffee truck before the main
entrance.

I'll bring a few spare copies of the list, that I'll hand out on a
first-admit-you-failed-to-print-yourself-first-serve basis. That list of
course is a bit more tedious for you to verify as you didn't prepare it
yourself.

The current state of the signature graph can be found at
https://openpgpkey.baylibre.com/Fei9keem/signature.svg . (graphviz is
strange, so for now only the certicates that already have a connection
are included.) I'll update this for some time after LPC.

Best regards
Uwe

--cuw64qothntujhos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrEhucACgkQj4D7WH0S
/k7OiQgAp+el/9hw9pr2u9VqYjrjZQ/OP3tcvF62y6rcvvCn+Sq8Qq+dI0psXEfe
ifCaEgkVXoAvhzGuRJ+y7DeQi4p0e6DFWSFa2KnPX7g0zscP6cNt79tbi4Bfguqn
iKo6hiY0om+6udmioYfTnm05u1JSFpPMKqc9ejcQoWtqfGZzm6mig2qcS5gZHqvU
A02UJjf/LX7WjnZsXJM34I4z4sopXjEw+km3q2lraBMFmBOwKDw7QU0c/q0LssdG
sYH6TXHhwbqYa7MRV034RlZ25lAEHCDTZaHQj2mjhJ/Uy8491aLfpr6yr5MD4i6Z
RCVLYaY9zUgXvojoctg+vjnM+YDv5Q==
=eHxU
-----END PGP SIGNATURE-----

--cuw64qothntujhos--
