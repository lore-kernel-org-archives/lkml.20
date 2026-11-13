Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603973;
	b=Hz68l3vN6TlEbMAvP7aKh9UZ9XshbL1Zy8xDkn/Q9qHcQI3qsFcPqB2ceE4BGPw6SwfN
	 8T98Eu7PgyDkqK9AFCAjSRsvuprYeq9Ge7TrK0lwzbPKEo/z94xs0SjQkMAmTX1Q6c2pI
	 9XDtqyvJNxwxJgkA7Tqm588cX6hk3yBHNU7EKIJAiFqIzrL6Netk+89tT/s2UritmaTOV
	 2t4km/pN7HRuvAP6k5ODE+cK0eWWbwQVN5Ec9KCDAyk4NSYguWFcY9ZYHPHy2CYa8JCDC
	 chytEanIrQGMRSuAwqR76OJhlEAGTPbtbocJf+cuTZgJHWhV50dBta7+CBlfUZCXA8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603973;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=/l2BNci3Cf9HeoDE6HY6XAwN4GIVkcON+ovNV/ZiaKk=;
	b=csROHeJ4iMmytBS+kYSD4hzbn7U/uN6Xp2mkuDK+QpsquD/zkT7Ymjj5myWMSc5+IhYR
	 u7Fwaap1Iaz7Uia6+M9AAeCUmtyFypFmlZH20Fh9XrUkIfpkdTsVbI/tI9h+EDyVfn0uW
	 OljunSLvMs2JljK9JjT7Gu8v3FpPTyQR6DVKsPkLjDjVBfNvknWg8uaENvY5vtVjtQxJs
	 dVdBu68UeuEJGDbFkrrHIQU5vDvlNIjo/6s1aklZolIycA5ce4JVKMMEARAe4FDTOmRxk
	 jtlVvRAxFmdn4dtDfzQD3vEfqu+GHW9cCR0IJF1vmbmJHtZ5hnWXZ77umRocieVFeiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKZCc74H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9419606A88A;
	Fri, 13 Nov 2026 21:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKZCc74H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F501F000C4;
	Fri, 13 Nov 2026 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794603972;
	bh=/l2BNci3Cf9HeoDE6HY6XAwN4GIVkcON+ovNV/ZiaKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKZCc74H33Cu1XhPqQIGS9zpzaLozY3DpqJw9mCjFEeAdTzJ3EPh+2h8J1xuhjopI
	 RJOgbQQas61wrl9GniueMLE1mKOiBtMXiVbaOoL7gj5y7cn603+LptEx2zUCuZAh9J
	 jYTENUc8RSOGPYHlm/vlEEFRqQgV1BRGLRDnjM29PIw/75eKeEIBOb0yOddlP946vC
	 f/sgduhPZ2jWdmrZXf42Z+faDs4LO/ymtbdLdlZmvMdN5O4D0HaO3FulwOvWaR1dwv
	 J2/pgLHcA+5LiJMbGZE+6Iqc/WBj/QO8e2dZAueaulUz57/mGw36Leq6NApDOZ3jAS
	 4RARqzNpb5aCA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 9101731BCC91; Fri, 13 Nov 2026 21:06:02 +0000 (GMT)
Date: Fri, 13 Nov 2026 21:06:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Carter <yass27106@gmail.com>
Cc: krzk@kernel.org, andersson@kernel.org, srini@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, tiwai@suse.com, perex@perex.cz,
	lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
 <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
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
	protocol="application/pgp-signature"; boundary="YzSVgOqsbmCzfzx+"
Content-Disposition: inline
In-Reply-To: <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
X-Cookie: When in doubt, lead trump.


--YzSVgOqsbmCzfzx+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 01:02:39PM -0800, Daniel Carter wrote:
> Document the compatible for the Asus Vivobook 16 X1607QA laptop,
> based on the Qualcomm X1P42100 (purwa) SoC.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--YzSVgOqsbmCzfzx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavd7ugAKCRAv73Ows9A4
ibzHAP9sN/q2DyJ/6kQWe2d0a8ULIqgi9a3ujUBNvN2D/5hMMQD/TuzN542hYfaF
SghEiAMS0awWz0LImGwWe0LHPqaVHAk=
=Hb5z
-----END PGP SIGNATURE-----

--YzSVgOqsbmCzfzx+--
