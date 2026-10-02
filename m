Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554C3C10B6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971028; cv=none; b=ttaSBwmey6INYhP+YXu8nX+1B/eWbJcvgxBp2xc5Nr2HHnzGjJEI+epIw1QnTKOhHo5xrjeQKgJhMziZpRSv3Vas13rxA2cILRzDGpj5zpbGJFzA9HQr9xRpMNcouun2NL8OXQTuGndCya2kKCVwkzEy7850tx+ccvgiEGMx7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971028; c=relaxed/simple;
	bh=u+AOCaj6H+sVhBdJRSYLOHdqWPibeQxtAivV8c9JEuQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCLqB9j8FSpujmU4gQPdA1C67fI48xiu+/bdbTCmTiRI8TpEpRCnxNDRpNIn1y2Ef2GpNlcd4h76APzV8LTvvAF50rByZ506qeAnqVGZps0PlS7yxhed1tYnKLllaYPhykeZZ4+0JrGPuxHbmHkwgWJaVqWmnuTfAfUi1jgVoMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Od5KauoA; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Od5KauoA"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917aca1aee5so1782166d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790971026; x=1791575826; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xr7pX17mvH2aCY+fCJUZRujhX//jXl3D3Nc+GjIbpY=;
        b=Od5KauoASJeOT0rwCOn/DNhmhOtIclo4yMuMptgt5PqPCBYfAc/3h26hVfwyc95YQk
         RthvDcSD6OZLYQ7Xwp8CVRBR5iaD/OaH3V1Oc5qsjUw47/0/dQR8IV/ycjzNzEidjg6+
         6wle0kr9M+20Jjh+IDDY1ioN/LnDrAPWYE71GueGa+rCugn4M6+9o713aX6qsRqMpS5N
         etFmWRZS38XJrwxPyOmlwBv70my86hEriJnLftu/8AJmXxiJiEIBTS0Q6yeNhAzvK3PF
         5Kicp76vCkWK9cqbaEWD5M/h9/dahT5UuCcR1Ybcb5pC5F/R4bpPIQZ/4BgWF6yMR8Hr
         Rbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971026; x=1791575826;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xr7pX17mvH2aCY+fCJUZRujhX//jXl3D3Nc+GjIbpY=;
        b=x5D7efAqHN9EyF1U3YYACgFMnjbFqNHNrCr0IAKP03fRQsA3kQvhKFeen8rzR4zfJO
         eC3znqbDcsNU/E9pJ26FfmfDIMfmcCcsJsUMjJM99dDP7ggOmwtspP1x4Q7G3cWVJd3t
         nYClEeMm0LeEzWct+W5OHoMPsOrhkAo3nXYgkXbgZxXd9k1vEL8ZYwiHt/vSul8Gik/k
         Ws7JNnw55PqIlYuo4VocMdJYyEs4SnpgagMygvS5X9vUwUOEhNxWbNSN1GLLR7Dq8Qn4
         81uZYlZccIHqWEie6yQvRjSfDPotV8R9NUWkrOWLUY3OpgR7Vak+cPgfaidGEgINPQvN
         X8wA==
X-Forwarded-Encrypted: i=1; AKwUvBwlOcLt7m0ttWeH+sXbt30Nb1RMiqHQKi0GZGXbU8vXDQZmr6LZ+PP075YK+k2IW7nywjVKrGjCQfyC1ic=@vger.kernel.org
X-Gm-Message-State: AFuF++nYmtXanGVE6VtY2Wuw57m6tki1YcFiXs92R4BFUdzfHK6Q42wu
	BVsvob7h7k0t48WkKv/itVthGd82q9kCBnAKrA+ctLfZsf88QbXX8uWMv1qIxynxdx0=
X-Gm-Gg: AYBFou1K4nveVECscxvN/yUjuQf9h3s6TD8YSMSPX0FasqoPiMeso+Mr9+arrT+y1VM
	OTashOYMdgPrUb4yPaBgp+JW0FEQqpFV0d0T8zM/uKgtmvAVe3ZMsO5hEXzZzoC+78TR38omNeV
	sQdsR2NEVVw0KzaQAwN0/8hPt1VScQCE5hcR+xABN6myZ9wfXo2pXVkRMonkbSkyVwvWsT5p35I
	bWJlYMBsM9TbhgGwCVaTQ+BLivtVEw48WEv6s2wh4MGrRcsvkRoeGQoXX23j2k5oivzTcD190ia
	wmCkFnFpvGOVQUjmp6XLo5+yBBNFOcM2T+Mmr7OnGi0XSQBvokV0MxM9f3HfMtl2Tqp2cCZoKP6
	KcMH9+eoVraRkssVMaBIZZRzlkGA9gQqBusyMo4+f8t9r8qKxzQDWJTrfE9xfaVMAlFvxwvvbfD
	VJt8y/O6QJw/LwwuIaTjMIJqdGKmHImQ2JvvA6ukw4ZnXDeNdRdL9UaIRL5zmAjcswO55ZZ936L
	yr469EpnM3qEg==
X-Received: by 2002:a05:6214:d46:b0:917:a8b7:c824 with SMTP id 6a1803df08f44-9195d0a24fdmr7529476d6.7.1790971025988;
        Fri, 02 Oct 2026 12:57:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm20271766d6.3.2026.10.02.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:57:05 -0700 (PDT)
Message-ID: <60c0db37aa1ba8674a0b205473075ab6cb0ed39b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: rockchip: Modernize PM_OPS
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Detlev Casanova	 <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,  Jacob Chen
 <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 15:57:04 -0400
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4HyN8OfCN+SaQY/bAsCV"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-4HyN8OfCN+SaQY/bAsCV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 01 octobre 2026 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9crit=
=C2=A0:
> A bunch of new PM_OPS macros got introduced in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
>=20
> Straight up copied from that commit message:
>=20
>     These new macros are very similar to their SET_*_PM_OPS() equivalent.
>     They however differ in the fact that the callbacks they set will alwa=
ys
>     be seen as referenced by the compiler. This means that the callback
>     functions don't need to be wrapped with a #ifdef CONFIG_PM guard, or
>     tagged with __maybe_unused, to prevent the compiler from complaining
>     about unused static symbols. The compiler will then simply evaluate a=
t
>     compile time whether or not these symbols are dead code.
>=20
> So convert the rockchip media components which used the old macros to the
> new ones.
>=20
> Diederik de Haas (3):
>   media: rkvdec: Switch to modern PM_OPS
>   media: rockchip: rga: Switch to modern PM_OPS

I'm taking the two first, thanks!

>   media: rkisp1: Switch to modern PM_OPS
>=20
>  drivers/media/platform/rockchip/rga/rga.c           |  9 ++++-----
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c     |  9 +++------
>  3 files changed, 12 insertions(+), 17 deletions(-)

--=-4HyN8OfCN+SaQY/bAsCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasAMkAAKCRDZQZRRKWBy
9LnsAQCEQh8/fK0EjxA2qyBxHJJCZTj66w+XssQ/r5decbAYxwD+NAlRMgWmM5Q8
DCLHzSESx4CgbNEx6od60qqNuMc9Bgs=
=z221
-----END PGP SIGNATURE-----

--=-4HyN8OfCN+SaQY/bAsCV--
