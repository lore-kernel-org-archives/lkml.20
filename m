Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512265;
	b=1pDQ5ApmXsaqrO6ze98iltXF6N3gVQ07UNA1ud5zGhoFnm4Vow2r+CuCBYD4whXZj85d
	 U4qlqHaXEu3G5iobeUFjiyTelViUHSXuhr2AltA1jgPCZL6YVhC8fsxRDwNqI43qYyicp
	 A+jsVnnJRi+siIMwbnQWQapQVkXaCl3jWEN2zTJ27RY59umLVFO0mSZzC9Q7PPH7TeoBJ
	 S0kaPpWeGCUmvZTHLk2qcCrsxWaYOcMGm5Go20YWYmSfNQwxAlcEgew0u5RN2nvN8veBu
	 ZzR0agCOXn+YC5W4XyzWpz77+0xcCID6rc1/s+rukqf3MXR7M8AHd4uUWLC1R/uoAGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512265;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Xw7OSUh2w83UTN7ygfu0imF/eRjtsz6mXxVB9EedeBg=;
	b=aV3FZqPzunEMxXFsbwwM6YZEQsddlhFnXTWIK0Z2fe0C9SS2Y1SNmrlk2Oh3W3hv0D/B
	 oQ3c2c9mZb05EhO75UqlL0bi/ewAjjdoFtCktYBBpXc+bue5y9ia33HAQwaQeSBYNbr1o
	 M3Bf6dKntw528EAIsqvMNjlYNKwL0g3ZkGLx74OSbX4dmSOAnsD3JOHGis9Tah1xDlmXO
	 rsMJhRioUNxdM6blsqdTrUJfMQ0hLkZmU3goN1IDi/Ffv2YylqHnqTDanjTewvK+wCttO
	 /dDHosWZJPUfKnmRdvOGZcc6kFhhigbuseiVIYhy5vJhLmQvs+1Q58zq2ex4gsxLDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCBb2xaW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D307606A31C;
	Thu, 12 Nov 2026 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCBb2xaW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA58D1F000C4;
	Thu, 12 Nov 2026 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794512265;
	bh=Xw7OSUh2w83UTN7ygfu0imF/eRjtsz6mXxVB9EedeBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JCBb2xaW+G02fPlF2gh7XAdojU++AflWUH/8sA5jEolILEYpBUkzsvm1v/7QNtgKJ
	 9QJx8t9ZhYhUQ575frhByOkB/Ceg0z2STdPz5LRRBjx9oLpeWV0O6SxXUckTK62kiD
	 LES/sIO3T4/h5QGtNVNwUeAybI3pH55QueiGzO/H4gCSglQjXbQYocqw98GybYV+nc
	 9Wspkn+nyYrDcjj8HBCIGvvzWiKKu5afoIaflIq36hItYoZUu7cv51JeQ9T5ANj/+l
	 wo64Fhkj+64lGohiqj9dT3wnWKIJACcfPjAKPlzdWwLnfe85EakjCe60uJ52Wb7szs
	 //0Y0JVK1iIJA==
Date: Thu, 12 Nov 2026 19:37:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Hyun-Uk Son <hyunuk.son@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <2c7d503c-935b-4408-a5b6-bfdf5ba86933@sirena.org.uk>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
 <179318672062.199157.7461931531075403104.b4-review@b4>
 <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
 <SE2P216MB24238E5F5EEA95FCEABCDAF4FF702@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="F3Q4j8jm9OIKXmmN"
Content-Disposition: inline
In-Reply-To: <SE2P216MB24238E5F5EEA95FCEABCDAF4FF702@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Baby On Board.


--F3Q4j8jm9OIKXmmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:40:57AM +0000, Hyun-Uk Son wrote:

> > They rarely are, but they tend to be safe and what is suitable for
> > practical use will vary depending on the system.  A gain that makes sen=
se
> > for a line output will be unsuitable for headphones, and vice versa.
> > There are a few things, like zero cross for example, which are pretty m=
uch
> > universally sensible and we do change those but for things that are lik=
ely
> > to vary with use case we just go with what's in the hardware since that
> > gives us consistency without us making decisions that might favour some
> > users over others.

> I'd like to provide some additional context regarding the rationale behind
> the initialization values defined in reg_defaults.

> The purpose of this initialization is to configure the data path and outp=
ut=20
> format for practical use, rather than to change sensitive parameters such=
 as
> speaker volume, ADC gain, or PGA gain.

The trouble is that these parameters tend to be both sensitive and
platform specific - they'll depend on plastics, or the components in a
given system.

> The values of these parameters in reg_defaults match the hardware factory=
 defaults.

Right, those are what the driver should nromally use.

--F3Q4j8jm9OIKXmmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr2FYMACgkQJNaLcl1U
h9A+Awf/TH5ErYriU+kh++S+aAXWBqi9ng7Jq5s3zTQnHBzOaLZ/a42Llj+7uEJb
T7GHRUpFkLN9vsU/8UHqffROjahHuAdGbZwM8dqgPWwwJ83dlI5JH+gcGwrkPgTB
3m+ZB0UQGVz25FTMeYZZU5eSecFcJ/UzMzzfw8Rm21MoWL5MJYt+NNmh0Lko+Q5Q
2ByqoVm4uNdc7uMeNYpjLkVPFJ3JOiEw/OsQXTE/L2gnOIibEPz7I84EviaNGFe7
+9COeDUOVBNA65zTX64m6apP/Ks+30u3uF5AW71+z+VzoP2T3u8/1hRXxGJMVHLe
/NkDVthRKd9ty1ScYhWcEe+KXsFWpw==
=PaD/
-----END PGP SIGNATURE-----

--F3Q4j8jm9OIKXmmN--
