Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054359;
	b=FstY0rO5hoibq4DlbMS/lMpsj5/wQybLEtzzdkUr6aikeqJ1pI925SWagC6p7lYIzacN
	 yaseRixP6TNfGhC7BdxOGFdc74yYwGjV4amK5cDpGYeJ43eqQZOBLlqszp8vFW6R49YD2
	 EIVNM6HHv3dC2RWpN68kARp6KRxNNAGRfKQAR66dgRTJORfbvo1qVPM+G7PjMXCE0h1MX
	 trIZREvekc82b8xOwpEXhuKOL3ZVL3jWAh910OQP1PQ/nJi0RzukMhQ90qvnvy9rADvLi
	 6owX2QfhYWwVyM69/mheZBonTIOosZPshm80YT7mdYRqTMXGboBo/wS+HjyRegfIGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054359;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Dt97tSAU5JqwOqvguf28g6mvV8+rSnr19Ds/LT0DNgU=;
	b=38jOX8t8Q+pe3RT8uObhp8FKX4g5TEo/pPqGut8iXjAO/L8GwW1mMrtB/y78jecgNEWZ
	 KOSyH+qEt4THz3mwpSHFmyK0y2AprTsrL12tQLEyL7pGqXvjTXO+M5909FWy49LRybywE
	 xtaz7GDOS7LIfMcHuHs9ZnCx17btLoCwelZomkZSbIo6yUkulz/1djHUys4KBoHFCz2cp
	 vnJhDIHl1+d7vq3WeOZjLWpqyoz2O6PW7hcA0UGKmABO4O8jtM8JdSP1FNrH6qjucapQQ
	 iSS2oB9bNdvcLxHPQxbnb14cBk9AtHLRMMI0Yj7iigujSZBQ6bdpVtqdlLi+fZJKymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9AUk9JO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9AUk9JO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E6C1F0089F;
	Sat,  7 Nov 2026 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054359;
	bh=Dt97tSAU5JqwOqvguf28g6mvV8+rSnr19Ds/LT0DNgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O9AUk9JOBeG8BI8QJ1bfZJCRm0vNwK4EtcCTTzuoMPYSZDcFBYaxRyqr8d0rFPiDY
	 7tr2EEiv3nR7iFTjh6scSIPKuVP69H36JTV0JrpCK/4cbqIboLhiGcNTXKuAfB6PU4
	 VYyf9b29WqPbPDznzm/2iqzRmUSZk7JuX0Z5nyjPtkImKVRNpV/EunGWcp7h9hdiuo
	 Hy9Xl71ITrj1sIgPAgypL+5lqdQpbRArBk1JtBIkAQuJDcFQedOybUGPTpN69aCPie
	 MJwXJPc5Mmbdfgo7N9GrMIc9JjEcE91iYMzFZ6/0t1My04rkqMu5ShHfSxooIv33wp
	 6mjydXB3Nn+Fg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B817F29349E2; Sat, 07 Nov 2026 12:25:56 +0000 (GMT)
Date: Sat, 7 Nov 2026 12:25:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity
 checks in continuous .get_voltage"
Message-ID: <0264fb70-4c57-4e6d-a02e-677e1f9077ed@sirena.org.uk>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl>
 <27e5c94a-acf2-4e32-92df-e3de124e0bc6@sirena.org.uk>
 <CAFBinCCN+P0YRvOP9pwmxVXGv-MGyuZn_45nCZ-7ko8Ko3v+-A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="bmPzdOvgs+GINPt4"
Content-Disposition: inline
In-Reply-To: <CAFBinCCN+P0YRvOP9pwmxVXGv-MGyuZn_45nCZ-7ko8Ko3v+-A@mail.gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--bmPzdOvgs+GINPt4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 10:45:31PM +0100, Martin Blumenstingl wrote:
> On Fri, Nov 6, 2026 at 2:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:

> > > The core, and in particular the machine_constraints_voltage() method,
> > > expects the regulator to report what the current setting is, even if =
that
> > > is outside the allowed range. The core will then bring the voltage in=
to
> > > that range. It cannot do that if the regulator refuses to return its
> > > setting, and causes probe() to fail for a pwm-regulator when it has
> > > restrictions to the PWM range with messages like:

=2E..

> > > Besides that, regulator_get_voltage() is not supposed to return any
> > > state information, as is mentioned in the API documentation.
> according to include/linux/regulator/driver.h:

>  * @get_voltage: Return the currently configured voltage for the regulato=
r;
>  *                   return -ENOTRECOVERABLE if regulator can't be read at
>  *                   bootup and hasn't been set yet.

> Can you please specify which API documentation you are referring to?

> I believe back when this change was authored it didn't make a
> difference on my board (but made sense based on review feedback).
> So I'm not against reverting as long as we have a proper explanation
> why the original patch is incorrect.

The PWM driver is a bit weird here since everything is very software
defined.  If the regulator is disabled and the state that the software
will apply on enable is known then it should return a value, if we have
no idea what the hardware will do on enable then we can't safely say
what the value that will be provided is.

--bmPzdOvgs+GINPt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau8Y1AAKCRAv73Ows9A4
iaGVAQCqCbekTrc3CTl8JdXZx1RfMrHafYDQxAMFAVKyE9F5gQD4pSbTOrb34vnP
obJKUcsOq3E4MFHQtCPxr54bM7QCBg==
=vNu1
-----END PGP SIGNATURE-----

--bmPzdOvgs+GINPt4--
