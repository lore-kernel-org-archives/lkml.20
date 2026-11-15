Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742972;
	b=YTLIQau86Th7hgy6SAiqvp6T1Bey25amnEsd605Y0smkgtDBAtX53RExqUIJEzBmeu47
	 srDBf2qKnY0wNFeZvAqkTs5htJSPMViuWvt1rAl4jxDw+McW8wtRODuITfFn+j6yD7j1s
	 QMkUR+1QITfuuNSCjJ52D5CLbIrWo5zbs/NZWMhZLbsyWeLZ50V1Xl7umJgwyL+jpMgJJ
	 bQP6+31Cq95ok8NW/LxDyAjsW9H9vwdbUhN6sIjRTI8x7a7Bw0g5u9jwmZ8nGUE3iVu7p
	 134RKgDEjIJWeU13BZQz2jnubwF1blOBLsMzpvPoLqBOxBfeFccE2v8i1m3nLXfcHsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742972;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=/Pb2rm86Z8dTLV90lB9da4AnCMNOyeDccCrdupE3WAs=;
	b=KrBzVxwiFrEg8kR+QlBDZndOpfB6S6/cSgpYYCMvprG9ugKqyvlEP5OkeQU2TL3DBxao
	 DSDXB25RvLECUkcBBLDoBpCKMZdyDYawfq3n4TCbONFseo/MxFb9gJYzcd+wO0lnZabAh
	 QpvvM21SAz07K9wEDcUI2XCgsIcvLziKQurycyoweN4fKo3eCg+sqSPti/SwyvfHT3a0D
	 7sWbvxfwBtXPWnmlJdbVGdaRNIihMlwhu5guXhEtEf6Q3asbWRWw15BkXZoO3YZ0rOk3M
	 wQ85YNwGhiNoXt3RAP/9N4M9BIFuQSLQHP/7tHHWg0Kkxy+7jGxmz+roJI2LNTldeDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpJwxAFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A220606A31A;
	Sun, 15 Nov 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpJwxAFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7FC1F000C6;
	Sun, 15 Nov 2026 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742971;
	bh=/Pb2rm86Z8dTLV90lB9da4AnCMNOyeDccCrdupE3WAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mpJwxAFJx9dBr+AAsj5KTWoz5VBADDZQAtjzx7ym8yd3EU+YzVcP18NNoKzgPHiy4
	 3vdeeCK0XqNKSAAq0Y7Ai4lOe+nnmnIHXyZBA9tQQVTS1XsyXrkEMgs7UCO+V4Zk4H
	 jSL8hC9Zvlf+HjxyLrwN8j4XS3RUITAMdrlUAfd/5aDSBF52EGBoACrLtB5qjIa5RY
	 N3foc8vL7UqXz8y6BTaFK0RSyt1wZJCPKi61Wjo94UPFRdJneBlV0PqxI9wYfeezs8
	 voNyhPQiFEew+Z4Cj3x97yfKr8L+GeC8pcRqduhQMXewwIB2sUFVDtZSpV2ArA68Jo
	 j2uVqkziZC+GQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8EFBD334D554; Sun, 15 Nov 2026 11:42:49 +0000 (GMT)
Date: Sun, 15 Nov 2026 11:42:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after
 allocation
Message-ID: <74114cb4-7ea8-4563-b4d2-a1174790804e@sirena.org.uk>
References: <20261114083806.905386-1-shengchao.guo@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="PEZxz+K2PLRzqr91"
Content-Disposition: inline
In-Reply-To: <20261114083806.905386-1-shengchao.guo@oss.qualcomm.com>
X-Cookie: A watched clock never boils.


--PEZxz+K2PLRzqr91
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 14, 2026 at 04:38:06PM +0800, Shawn Guo wrote:
> Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
> the devm_kmalloc_obj() family"), the rtd is allocated with
> devm_kzalloc_flex(). On compilers supporting __builtin_counted_by_ref()

This was already fixed, please check that your patches apply against
current code.

--PEZxz+K2PLRzqr91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavmauQAKCRAv73Ows9A4
iZrVAQDBVLHsJemrgP8rF7+izwAPBgS+v6OauUsQ+ACVVJ8PrgD9FNI5GyJney3X
ju7yEaN0ToAyf5IHa22OYjm4Qwa57AM=
=BB9f
-----END PGP SIGNATURE-----

--PEZxz+K2PLRzqr91--
